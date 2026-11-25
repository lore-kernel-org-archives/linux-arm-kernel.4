Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D6E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=igBXF8WR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ebL04dBj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uiPjq1P/e8OfOqAPwWMEmnQ66tBJyB5qUdr3khwA/mo=; b=igBXF8WRL0XjYjmVTH/OMYQso4
	/Azhx17kvNTJs136l+cdaJkFqtJw9Kh2t3gmOrGagawBqNiZ+WdtqJDuE9eQd0BxdSjcC2NbOUqmx
	QRXH1Ubw9xqTrVgAHTrmn9wsUKLmj2ry7rMex40nSQFh8I7PuvlDlYkiw0Eui4dkX0Zfk/h1V9h25
	DpCygvOKhS+uBbUS165ZlO+7MdmjZiWJbL2vNEJfUZvqksf+EGJWmyVHhwcICnxF/OARIWl2kOA5c
	I5Zb0CBWvaFB/XKizwMbUxPwfPsxdXQQApRAZupVnWNPg8glPxoz2bEZSf/XDMAHHxHU4StMFVVgJ
	Ujiw4W4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWISg-0000000B6Xk-1ZGD;
	Wed, 25 Nov 2026 19:15:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIS0-0000000B6Ol-2USc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:14:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DB4B422B7;
	Wed, 25 Nov 2026 19:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD501F000C0;
	Wed, 25 Nov 2026 19:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795634079;
	bh=uiPjq1P/e8OfOqAPwWMEmnQ66tBJyB5qUdr3khwA/mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebL04dBjlOHElSPUaWEaL1JBJUqfOHxCBZTmyGGIJLrqO6J4ADIJfA8ko83t4qYS2
	 2imGwFy8XBccQWrlzdUP2O/H5APmgt55vXv5P5gWRkILtXSJTaBRg0HFZIUVXrG6TH
	 R0DAea9uu5nB81FZ7+AZjFY7yCh37ADOr3maxX5het1Q7EltphdnkyJY6b3SF+MXJd
	 dUXIG5Dv0PEBu/tsLA4kJMupCVtI+Jd7uqBsm6/txqBSRZ6NVFshES3YLCQxIjXPVm
	 0MQsVDdI6V1G1axQ2LPT7clgU7zLgDcmCS6ie6k+ni5l8Zeu/uRJX+q33Ko3ti++vR
	 I1pMfDDf0oNxA==
Date: Wed, 25 Nov 2026 11:14:37 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Robert Walker <robert.walker@arm.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] perf cs-etm: Initialize the Thumb instruction buffer
Message-ID: <awczncL6fSXxX9NZ@google.com>
References: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com>
 <20261113-perf_fix_gcc15_failure-v1-1-eae592c5ff64@arm.com>
 <CAP-5=fXrP+FSmv35KgvwDkNED921X60W3BWiMYHmLV-AzSG4BA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXrP+FSmv35KgvwDkNED921X60W3BWiMYHmLV-AzSG4BA@mail.gmail.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 08:30:59AM -0800, Ian Rogers wrote:
> On Fri, Nov 13, 2026 at 2:55 AM Leo Yan <leo.yan@arm.com> wrote:
> >
> > cs_etm__frontend_mem_access() can return zero or a short read without
> > fully initializing instrBytes. cs_etm__t32_instr_size() nevertheless
> > inspects its second byte. With CORESIGHT=1 and -O3, GCC 15.2.0 reports:
> >
> >   error: 'instrBytes' may be used uninitialized
> >
> > Zero-initialize the buffer to avoid reading uninitialized stack data
> > when instruction memory is unavailable and fix the build failure.
> >
> > Reported-by: Ian Rogers <irogers@google.com>
> > Closes: https://lore.kernel.org/linux-perf-users/20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com/T/#m64fb81c665214b79883d9be815b40ac5f6669628
> > Fixes: a7ee4d625ede ("perf cs-etm: Support for ARM A32/T32 instruction sets in CoreSight trace")
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> Reviewed-by: Ian Rogers <irogers@google.com>

Applied this one to perf-tools-next, thanks!

Best regards
Namhyung


