Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816C9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JS5LSjfA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nD2RVVqf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nt20LNSpJZyk74iJVViod3D3oRlAha88rqlV/T40+5s=; b=JS5LSjfASY/1bGaxvRk+5nRRHg
	Blwgyfi5AUJZGjmn34KKrWXkZOB4UyMdVWPR4pFdK19kdUr1shndvHwPZNJGqmeaoH6vg7qXHx5dv
	VRratYz4WmUxRE2GqxYadyRzy6lR7epuzw5llPs0vsmABp8PQH4zmOgAGSHSw5/8j+qaM/Ugg4k3j
	8dufgdn47fl2U3eHBwe0gnZJZlipa6fWL4wRmx0+HO8RNlAAD8dRt/OZMfuStJpg0DjC76oN7bOIg
	n2krCBuKMabSvKkxDl9sUw86ILmJY+56Ec7TdcNqlXhtqxjuTQHmfV9J2ebeKrdJP9t2ksQSuLnGH
	cSrWFI9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0uI-0000000HSPb-1pbj;
	Fri, 27 Nov 2026 18:42:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0ty-0000000HSMB-0iHG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:42:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC73D411BE;
	Fri, 27 Nov 2026 18:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335B21F00897;
	Fri, 27 Nov 2026 18:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804949;
	bh=nt20LNSpJZyk74iJVViod3D3oRlAha88rqlV/T40+5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nD2RVVqftuOjIF75XmcD8Ok3XSQ+1UHtDlVfv10cHOHvu4bnndlPEjYajwooqYW82
	 VdjCFb4JRUE2zkgX18QfJJATRhvuRs1YIieXWozABIAZMYM53k84ba+rfaVpq8APvE
	 0jjZv74H3NsIH+g6PdeWtMb9WD7GitQDkMATuIOx3vFrynTTiG0D6XaxiaFksFlCm7
	 sXyIli6SbO1MfN3v5uL2fa0P9qpen9ThW9khYp/hRVWYqmgGf61JrOMt2Db6hWOw8x
	 wRg+JnqWYm8oeMmNrltA9EZRxlSIR44UrDKs/03gFXx5FRyRgsr1iQB86z7KWevULY
	 obrgULhOoHDfg==
Date: Fri, 27 Nov 2026 18:42:24 +0000
From: Will Deacon <will@kernel.org>
To: Haris Okanovic <harisokn@amazon.com>
Cc: robin.murphy@arm.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	peterz@infradead.org
Subject: Re: [PATCH v2 0/2] perf/arm-cmn: Allow userspace to select the PMU's
 CPU
Message-ID: <awnPEAxJyvdRmBFA@willie-the-truck>
References: <20260930231127.3094040-1-harisokn@amazon.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930231127.3094040-1-harisokn@amazon.com>
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

On Wed, Sep 30, 2026 at 06:11:25PM -0500, Haris Okanovic wrote:
> arm_cmn_probe() picks the CPU that owns the PMU and nothing but the CPU
> hotplug callbacks ever revisits it, so in practice all of the PMU's
> recurring work stays on the first CPU local to the interconnect's NUMA
> node. Patch 2 makes the existing 'cpumask' attribute writable so it can
> be moved, which helps on systems that confine background kernel work to
> a chosen set of housekeeping CPUs.
> 
> I made the existing 'cpumask' attribute writable rather than
> adding a new one. Every other implementation of that file is read-only,
> so I am happy to switch to a separate attribute if you would prefer to
> keep 'cpumask' uniformly read-only across PMUs.
> 
> Patch 1 is new in v2. Robin pointed out that perf_event_open() can latch
> cmn->cpu and then install the event after a migration has already moved
> the PMU, leaving it on a CPU which no longer owns the PMU's shared state.
> The window already exists via arm_cmn_pmu_online_cpu(), so patch 1 stands
> on its own; a writable cpumask just makes it reachable on demand.

Hmm. Not sure about this. It feels to me as though, if we want interfaces
beyond CPU hotplug to control the affinity of system/uncore PMUs, then
that should probably be something managed and understood by the core
perf code rather than hacked onto one of the many PMU drivers by quietly
changing the semantics of the established debugfs interface.

Aha, you did that over at:

https://lore.kernel.org/r/20261013185603.1347265-1-harisokn@amazon.com

do you plan to respin that?

Otherwise, if over-loading CPU 0 is the problem, I suppose we could hack
the probe routine to pick an arbitrary CPU, similar to
cpumask_any_distribute().

Will

