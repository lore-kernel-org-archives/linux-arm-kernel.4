Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE30606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sl0d9sD6;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kX9q8ozX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UgE8E0wwyWrSNV9lEIMlWrzgZhXkwN/rj4cwFpTc9Jg=; b=Sl0d9sD6XIlvHAgAVxbemzszXD
	uhjrkjoBa9hn92SXys+kG2nhcPQhuswr3TjTMuRcW0DD//S0tG6Pstmbr8L5WkySisBwuDp34uEke
	cPToi/KopyF2nEjHYd9l/aMYOTuyvfpX1p4d03GYsly2z6YtDBWM9QDR0ZPKbq0Zzs929NGsOYIbE
	d9j8T7T5JdVCDMrBdonrt0czDawe9R6uvRtPRTYxJET5EtxydsPdHUi1zPfWJj8jQ5ciUIJAHhdEx
	qr3gJDym+uqxpG8JjkXR36Qjtl5jO/VfO1bxbJAvcWAQRJD7pB5FB2V2ebYAwpTCxfPOL19vHlNCI
	M2e9Rmyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtun-0000000Fl8a-1wqY;
	Fri, 27 Nov 2026 11:14:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtuj-0000000Fl7L-46bZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:14:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5EB41756;
	Fri, 27 Nov 2026 03:14:44 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12CA13F632;
	Fri, 27 Nov 2026 03:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795778087; bh=gF7DAcDjFmtqtqB2ABYlm/QeU8ah6fV9j+HrkvyVNe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kX9q8ozXHmqTw2YWHALVtX0jNvoOkAcfZxOzgTD3hihmxTJyL2ACsEBXlQuqnVF74
	 Qq0wBivx+X5PzqPtdcbUWhrNZwKwgQxuvNASCUyOajnrwTAiANn8J0rI5ceDgeypQx
	 nonjrFdu7X1WP0BfCB1cTaF3D0pQeTkgBGasHcGA=
Date: Fri, 27 Nov 2026 11:14:41 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Will Deacon <will@kernel.org>
Cc: julien.thierry.kdev@gmail.com, kvm@vger.kernel.org, maz@kernel.org,
	oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, mark.rutland@arm.com,
	kernel-team@android.com
Subject: Re: [PATCH kvmtool 0/7] Fix --vcpu-affinity
Message-ID: <awlmIXJ9o6ssyBe4@raptor>
References: <20260917154932.193943-1-alexandru.elisei@arm.com>
 <179570874285.2888674.1910692252028588031.b4-ty@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179570874285.2888674.1910692252028588031.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_031450_063021_7413A308 
X-CRM114-Status: GOOD (  14.94  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Will,

On Thu, Nov 26, 2026 at 05:14:29PM +0000, Will Deacon wrote:
> On Thu, 17 Sep 2026 16:49:25 +0100, Alexandru Elisei wrote:
> > This is my attempt at fixing --vcpu-affinity, which I introduced. Patches #1-#4
> > are straightforward fixes, and they don't modify the current (broken) behaviour
> > in any way. Patch #5 fixes is most of the fix: with it, the VCPU threads run on
> > the physical CPUs passed to --vcpu-affinity, and most of the kvmtool threads,
> > except the virtio threads, use the main thread affinity.
> > 
> > The virtio threads are special because they are spawned from the VCPU threads,
> > and they inherit the VCPU thread affinity. Note that there might be other cases
> > where this happens.
> > 
> > [...]
> 
> Applied first five to kvmtool (master), thanks!

Thanks!

I'll just drop the last two RFC patches, there doesn't seem to be much
interest.

Alex

> 
> [1/7] arm64: Pass the number of elements as the first argument to calloc()
>       https://git.kernel.org/will/kvmtool/c/5b707c29743a
> [2/7] arm64: Consistently treat vcpu_affinity_cpuset as dynamically allocated
>       https://git.kernel.org/will/kvmtool/c/c1c630e7d331
> [3/7] arm64: Free the temporary cpumask in vcpu_affinity_parser()
>       https://git.kernel.org/will/kvmtool/c/e6fbd872f1b1
> [4/7] arm64/pmu: Consider kvmtool's affinity when searching for a PMU
>       https://git.kernel.org/will/kvmtool/c/8c3912c087d1
> [5/7] Correctly apply --vcpu-affinity to the VCPU threads
>       https://git.kernel.org/will/kvmtool/c/4c90ccf4c593
> 
> Cheers,
> -- 
> Will
> 
> https://fixes.arm64.dev
> https://next.arm64.dev
> https://will.arm64.dev

