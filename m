Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3DC606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IAXvOX4K;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KEWXWVbH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=68s8dF643W4r8o01kq7u0OHFeheAszVMDFW0VzZCIP8=; b=IAXvOX4Keb9d6TF4ZNGw+xz+wE
	lMbgr9wUGB9HFpgP9Fp4rkLVgMB+1VUt4y5H0ZzZ5qPlnovI+Cmi/WosIhcHkV7+Bf94Aj6UQn4Yc
	lBtrHP5UOjbcw4ufeNGspJTlSS9Kp8BF83YE/ajcBh2KCsCleu12r3pJWVNRfjXpxybYyomPsQhGV
	NC1e4KTjJaN9B5WHIreFoOnlca/EwehPoFRmSG8TXjpfF7N/+Iqv/85ZRNqQnY8vBWoSejFW/ddAA
	TIur7/d8hgTEPOC+1ZKMG/vFETwRqa2mInyvHo4z3z56ucMgfzwJLFdKxeWE3+GuWGnzsgY0oKnmC
	qizhtn5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmpc-000000063j8-3Uc5;
	Tue, 24 Nov 2026 09:28:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmpZ-000000063ik-4AaO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:28:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E497339;
	Tue, 24 Nov 2026 01:28:49 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EFEC3F86F;
	Tue, 24 Nov 2026 01:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795512532; bh=KmBsWytUnf1WwuD/N2D/GAHKXq3lrlOH7DiAXeXeCh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KEWXWVbHbe0tVeC51l5S9VkRC0+G0K1LrphX3FMsAM814zGsbdqxxB1dU4m0il041
	 slx0SH1YsTfybof/RafJh9woWYh3Ra21MGy6RmlW8U7zrm6i1uxjUb/N39NAtNyd4L
	 TiXF5VROsnlj+e9jMVIeU5Xp6ibj5EgjIv5km+E8=
Date: Tue, 24 Nov 2026 09:28:49 +0000
From: Leo Yan <leo.yan@arm.com>
To: Song Liu <song@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 04/25] coresight: perf: End AUX output when an event is
 throttled
Message-ID: <20261124092849.GF9176@e132581.arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-4-35cf6f297d20@arm.com>
 <CAPhsuW665wcpXxE8pfzRMfdxZwh9ogGsvd1aEBFREq61cz4Y5w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW665wcpXxE8pfzRMfdxZwh9ogGsvd1aEBFREq61cz4Y5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_012854_155314_677ED51F 
X-CRM114-Status: GOOD (  18.98  )
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

Hi Song,

On Mon, Nov 23, 2026 at 11:07:37AM -0800, Song Liu wrote:
> Hi Leo,
> 
> On Tue, Sep 15, 2026 at 8:49 AM Leo Yan <leo.yan@arm.com> wrote:
> >
> > Since commit 9734e25fbf5a ("perf: Fix the throttle logic for a
> > group"), the perf core stops every event in a throttled group by calling
> > the PMU stop callback with flags set to zero:
> >
> >   perf_event_throttle()
> >     `> event->pmu->stop(event, 0)
> >
> > The ETM perf stop callback only ends the AUX output handle when
> > PERF_EF_UPDATE was set. For throttling with mode is zero, it skips to
> > end the AUX handle. When the event is later unthrottled and ETM tracing
> > is started again, perf_aux_output_begin() sees the perf handle is nest
> > enabled and triggers a warning:
> 
> While testing this patch, we found a crash:

> [20123.449766] Call trace:
> [20123.454671]  arm_trbe_irq_handler+0x58/0x4d8 [coresight_trbe] (P)
> [20123.466920]  handle_percpu_devid_irq+0x80/0x1b0
> [20123.476029]  generic_handle_domain_irq+0x3c/0x80
> [20123.485308]  gic_handle_irq+0x174/0x328

...

> LLM suggests the following change should fix it. Does this make
> sense to you?

Yes, the change below looks reasonable to me overall. I have a patch
series to refactor the TRBE driver [1], and patches 05 and 09 make
similar changes.

Do you mind to test the series (or apply patches 01 ~ 09) to check
if issue can be fixed?

Thanks,
Leo

[1] https://lore.kernel.org/linux-arm-kernel/20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com/

