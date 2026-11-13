Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9AF606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oUtX/zxz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DCBUVnEh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S1pLWYbamOi5rXtFLm0Gwq6ZibslKhk1ncxUfDLldzs=; b=oUtX/zxzIdiPvwIfn2jzbu/wxA
	5DMF08PL7sbGgrIiYjUFihyyfDUAPxkA6OLQulg7wCCuMQ7k9A+4kAWMtYO1g8rT6Lxk3zthGAUJ4
	2sR3wUzPSYlyUNc4GcAFFJvcPXHRp9CsAkDd66Ews3hYINSRYLmpECsDSq4ut2HWb0TSCoaFcRnD2
	nmdbiV4Gxr9a+ushGBI7sW3iqcR/jgeBYgSi64cXoWgnoR/tk6s1ZOuBQOgolGiC5suhtsfkqsOuW
	/Zl0Z5HNGVFN3UQDirP53rLBJzUGAxPPsLDFZ3hStReJle2ySKakzGMnad8OTlquzsgfHBO0MhT3s
	irUJyH5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRt4u-0000000DNTH-1G6F;
	Fri, 13 Nov 2026 15:20:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRt4t-0000000DNT6-1DjT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:20:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79F0861D34;
	Fri, 13 Nov 2026 15:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B129E1F000C4;
	Fri, 13 Nov 2026 15:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794583234;
	bh=S1pLWYbamOi5rXtFLm0Gwq6ZibslKhk1ncxUfDLldzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DCBUVnEhluFN2HEDgsBMW1F2A4ZRslNIsw4PxHM20KWA7pF4wrjZTq6/lk+gnp52P
	 HZVM3+UOtffwp/3M2GVGCDEcwncEZiLTpvuhaqVKLrcNanY6S6AZMv6yRt3rCIgwv3
	 zMZzW2++Wqsa+492i/zlv2/E9JQPc61d2SKBUf+HUOSY2WKpD5xfco8cVZmgnwChr9
	 idrCMM2Y2Oe1aCHu9DRUmWnbtooL3ULIvh/Pt11xb3KFaokbo02XDbF+c2M229JNrt
	 6eTSo1KnEOlev7K91W2zAWj7Mbs8X5H+syMKZQotm/ISNNEPVVGy9Yid6yzDpJT54V
	 ayB6PxHII7QhA==
Date: Fri, 13 Nov 2026 12:20:31 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Mike Leach <mike.leach@arm.com>,
	Robert Walker <robert.walker@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 09/12] perf cs-etm: Fall back to the recorded
 instruction size on a failed read
Message-ID: <avcqv_oU4CkAZyDq@phoenix2>
References: <20261113150555.1163049-1-acme@kernel.org>
 <20261113150555.1163049-10-acme@kernel.org>
 <20261113151549.GR9176@e132581.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113151549.GR9176@e132581.arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 03:15:49PM +0000, Leo Yan wrote:
> Hi Arnaldo,
> 
> On Fri, Nov 13, 2026 at 12:05:50PM -0300, Arnaldo Carvalho de Melo wrote:
> > From: Arnaldo Carvalho de Melo <acme@redhat.com>
> > 
> > cs_etm__t32_instr_size() reads the instruction bytes from the traced
> > program's memory to tell a 16-bit from a 32-bit T32 instruction, but it
> > ignores cs_etm__frontend_mem_access() failing, which happens when the
> > DSO or its debug data is missing, and then reads the uninitialized
> > buffer.  GCC 16 warns about it and build-test fails with -Werror.
> > 
> > Use the instruction size recorded by the decoder, as the A32/A64 path
> > already does, when the read doesn't return the full two bytes.
> 
> This patch is duplicate with:
> 
> https://lore.kernel.org/linux-perf-users/20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com/T/#m5f610e381705bc587a9ce3d31be4e1e0ed595506
> 
> I prefer that one, it handle cs_etm__frontend_mem_access() failure
> throughly.

Ok, I'll replace it with yours,

- Arnaldo

