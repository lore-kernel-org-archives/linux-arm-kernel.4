Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F79A606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4/iTk6fX;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qXQmrCKd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V1YWPttXEi6HW26RX2hE76PCKuzOoDlXU7K4UAZ3+NM=; b=4/iTk6fXgw4k8Eduj5oJsCa/6U
	FxbGV+iIlv95HF3kiE6eNWLGz9qY/RBifEaTGYWFyMrxso2TqO2awpcG0vIGRi4P7wdpVVhoYWc3I
	y9t4cf/sPlTz8MnVkQdMsB0mNmnRPysEqNRtFtiY+0jYJsNzLaDw+icg5pGVtezxtTjZGCndz4FI6
	acNgwhdYg5zmquas1XAgnebjIsDz87sOS0oVvTWSTySJUdzuMiUY6g/6+6NppjSsnWUrfrZfFZu2U
	KDT2CqS9o/TaSWlEenE+PHdQsaV/uZAJzJ1y52b+mlKgVIv8iWG7plYpHMa4kYpW5UHj5UakHjq1b
	qsl0Jttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRt0O-0000000DMYh-10mC;
	Fri, 13 Nov 2026 15:15:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRt0L-0000000DMXv-1imc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:15:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EF42339;
	Fri, 13 Nov 2026 07:15:49 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFC833F85F;
	Fri, 13 Nov 2026 07:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794582952; bh=8/RunaI4RGgcBAEHTWjUlS5O+ROOwppaIYc4rMMVIgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qXQmrCKdi1XXeajyZbt39aciqGvxmgxylKAOnZn9jFgyQyQT0v3dVwUbv043MzOew
	 ZkQ3ZE4Lyo37EbONSQS25IILhW1hwvz2fcMG4WRg4ebIDlK7rDaERQ++wlT1sdV/R3
	 XHgX7CusAxNk7G8oJIaQ+uGx9pbcs0ualP1x0W3U=
Date: Fri, 13 Nov 2026 15:15:49 +0000
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
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
Message-ID: <20261113151549.GR9176@e132581.arm.com>
References: <20261113150555.1163049-1-acme@kernel.org>
 <20261113150555.1163049-10-acme@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113150555.1163049-10-acme@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_071553_491716_18607B06 
X-CRM114-Status: GOOD (  11.90  )
X-Spam-Score: -4.4 (----)
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

Hi Arnaldo,

On Fri, Nov 13, 2026 at 12:05:50PM -0300, Arnaldo Carvalho de Melo wrote:
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> cs_etm__t32_instr_size() reads the instruction bytes from the traced
> program's memory to tell a 16-bit from a 32-bit T32 instruction, but it
> ignores cs_etm__frontend_mem_access() failing, which happens when the
> DSO or its debug data is missing, and then reads the uninitialized
> buffer.  GCC 16 warns about it and build-test fails with -Werror.
> 
> Use the instruction size recorded by the decoder, as the A32/A64 path
> already does, when the read doesn't return the full two bytes.

This patch is duplicate with:

https://lore.kernel.org/linux-perf-users/20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com/T/#m5f610e381705bc587a9ce3d31be4e1e0ed595506

I prefer that one, it handle cs_etm__frontend_mem_access() failure
throughly.

