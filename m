Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB0C606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SHDdfJsk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7ZFZGyJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lDAm+zBD66b88hz5K7F1FDsYw+RIkjC9cHi9f3iS4y8=; b=SHDdfJskEBnPJxrVqYFYtHIAtB
	hPt86IPHWNY1WDRyMYoVUyWc831hPfWKbEKwkEQ2i7fHUMlvxC5vSQLJu3z3h3iLlsLcllCYQ0bzQ
	N7pdr/k1bEFxX5BuOk+p6myB+aGFsdaFZBHizaqSAUxm19D5Q2PJsL4VgwVIC+t689fQUdoxoBznw
	vzVNWFCHN/Xi+6ErMm20q1SzEgO8Ier46bTPxGVOPLiardacU5LPtekIukRyHdsI1ZYLrgoLM4oAg
	lTfAVpde6FBX//KFv4PJh9R6SSgFmrQhtbCZUBJ7nFVA1KRquexUbeVs8vz4zwEwt5qfNoRRkBS4z
	jiDdkVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxlS-0000000ENWD-32hp;
	Fri, 13 Nov 2026 20:20:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxlR-0000000ENW5-3ZtS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:20:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 978AE437F5;
	Fri, 13 Nov 2026 20:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EF9351F000C4;
	Fri, 13 Nov 2026 20:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794601249;
	bh=lDAm+zBD66b88hz5K7F1FDsYw+RIkjC9cHi9f3iS4y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D7ZFZGyJQXMWawyYsmDGFMzswQ9j6Aevq/SNOuHwRx809Bf/ZTxaitWJZrNI2+Rh6
	 hD1kHONqfBmuMRZnMtq2bozUvHa1QPt94QYnhlc2mnn5b6sWUNQYR6wZJzpFDtuKNA
	 mUDaEFEl+HNy725s//wTx85CURGa0YUOEsy4/S6z+K5Wh8/RwNxbwiu006YV2tAuSF
	 Tm820A1tX4ElFYz7M5MYxblO8aJ3v/r/xu7ZwIHxS0iXPCfPBx944QNBX2G+DeRUX0
	 nf8SVYjNbWC2zJ1X5aKvm4EBnBLGf3hMFYSityFxtvWOT6GqLBjiC+V4CjPNs9VljV
	 jtq1ViTjK/ZeQ==
Date: Fri, 13 Nov 2026 22:20:45 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>, apais@microsoft.com,
	rlmenge@gmail.com, hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1 1/1] tpm: tpm_crb_ffa: Only register driver when ACPI
 TPM2 uses FF-A
Message-ID: <avdxHSKkqubIrAZ5@kernel.org>
References: <20261112233807.70664-1-sidchintamaneni@gmail.com>
 <avdXkLKJwuNv0vZ4@kernel.org>
 <CAE5sdEgEFjGz6W0e5g4uxRVC2Otyvr4Pak-aAZogObWaFtNsTA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE5sdEgEFjGz6W0e5g4uxRVC2Otyvr4Pak-aAZogObWaFtNsTA@mail.gmail.com>
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

On Fri, Nov 13, 2026 at 11:31:31AM -0800, Siddharth Chintamaneni wrote:
> On Fri, 13 Nov 2026 at 10:31, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > On Thu, Nov 12, 2026 at 11:38:07PM +0000, Siddharth Chintamaneni wrote:
> > > Prior to commit 677042afb97a ("tpm: tpm_crb_ffa: revert defered_probed
> > > when tpm_crb_ffa is built-in"), built-in tpm_crb_ffa only registered
> > > tpm_crb_ffa_driver from tpm_crb_ffa_init() after crb_acpi_probe()
> > > confirmed start_method == ACPI_TPM2_CRB_WITH_ARM_FFA. After that
> > > commit, tpm_crb_ffa unconditionally registers on the FF-A bus at
> > > device_initcall time (and when loaded as a module) without checking
> > > the platform's ACPI TPM2 table.
> > >
> > > A platform's firmware may expose a TPM CRB over FF-A Secure Partition
> > > for UEFI boot services while advertising a non-FF-A start method to
> > > the OS in the ACPI TPM2 table. When the ACPI TPM2 table designates a
> > > non-FF-A start method, Linux has no consumer for tpm_crb_ffa and
> > > should not probe the FF-A TPM service.
> > >
> > > On Microsoft Cobalt 200 systems, the ACPI TPM2 table does not use
> > > ACPI_TPM2_CRB_WITH_ARM_FFA, yet ffa_init() discovers the FF-A TPM
> > > partition and tpm_crb_ffa_probe() unconditionally sends
> > > CRB_FFA_GET_INTERFACE_VERSION via FFA_MSG_SEND_DIRECT_REQ2/REQ SMC.
> > > That request wedges the calling CPU in Secure World (with Non-Secure
> > > interrupts and GICv3 pseudo-NMIs masked), hanging boot with an RCU CPU
> > > stall:
> > >
> > >   [    5.507519] ARM FF-A: Driver version 1.2
> > >   [    5.507519] ARM FF-A: Firmware version 1.2 found
> > >   [    5.507551] ARM FF-A: Notification setup failed -61, not enabled
> > >   [    7.150580] Freeing initrd memory: 293640K
> > >   [   65.515248] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> > >   [   65.521346] rcu:     10-...0: (3 GPs behind) idle=dd9c/1/0x4000000000000000 softirq=37/37 fqs=5262
> > >   [   65.530031] rcu:              hardirqs   softirqs   csw/system
> > >   [   65.535589] rcu:      number:        0          0            0
> > >   [   65.541146] rcu:     cputime:        0          0            0   ==> 30028(ms)
> > >   [   65.548102] rcu:     (detected by 66, t=15010 jiffies, g=-951, q=1384 ncpus=132)
> > >   [   65.555228] Sending NMI from CPU 66 to CPUs 10:
> > >   [   75.560686] After 10 seconds, these CPUS still haven't responded to the NMI: 10
> > >
> > > Check the ACPI TPM2 table in tpm_crb_ffa_driver_init() and return
> > > -ENODEV before calling ffa_register() unless the table is present and
> > > specifies ACPI_TPM2_CRB_WITH_ARM_FFA, matching the check_acpi_tpm2()
> > > pattern in tpm_tis.c. This ensures Linux only issues FF-A TPM requests
> > >
> > > when ACPI advertises the FF-A start method (for both built-in and
> > > modular builds), while preserving normal FF-A bus probing on platforms
> > > that use CRB over FF-A.
> > >
> > > Fixes: 677042afb97a ("tpm: tpm_crb_ffa: revert defered_probed when tpm_crb_ffa is built-in")
> > > Fixes: eb93f0734ef1 ("tpm_crb: ffa_tpm: Implement driver compliant to CRB over FF-A")
> >
> > Pick the older.
> >
> > I attached a prepending patch that caches the start method, which can be
> > later used in tpm_tis and tpm_crb.
> >
> > So that totals four patches:
> >
> > 1. My patch.
> > 2. Your fix using the cached value.
> > 3. tpm_tis update to use the cached value.
> > 4. tpm_crb update to use the cached value.
> >
> 
> Sounds good! I can put together that 4 patch v2 series.
> 
> Two quick notes before I spin v2
> 
> - Module loading with CONFIG_TCG_CRB=m and CONFIG_TCG_ARM_CRB_FFA=m:
>   As Sashiko flagged on v1 [1], because tpm_crb.ko directly references
>   tpm_crb_ffa_init() and tpm_crb_ffa_start(), returning -ENODEV from
>   tpm_crb_ffa's module_init would prevent modprobe from loading
>   tpm_crb.ko on non-FF-A systems. In v2, I will move the start_method
>   check into tpm_crb_ffa_probe() (matching check_acpi_tpm2() in tpm_tis)
>   so both modules load cleanly while still skipping the FF-A probe on
>   non-FF-A platforms
> 
> - regarding the location of caching approach -
>   tpm_crb_ffa never allocates a struct tpm_chip, and both tpm_tis
>   (check_acpi_tpm2()) and tpm_crb (crb_acpi_probe()) check start_method
>   before calling tpmm_chip_alloc().  Would it work for you if patch 1
>   caches start_method once in tpm_init() (subsys_initcall in
>   tpm-interface.c) and exports a small helper (e.g.
>   tpm_acpi_start_method()) so tpm_crb_ffa_probe(), tpm_tis, and tpm_crb
>   can all query it before chip allocation? (Also noticed a small '||' ->
>   '&&' typo on the header.length check in the attached patch.)

Move it to tpm_init() and store the result to a global variable, let's
say tpm2_acpi_start_method. There's only one of these so it's all fine.

You can then mark the resulting commit as:

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Co-developed-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

I just put those tag because it is easy to mix up with Co-by tag,
when using it.

Br, Jarkko

