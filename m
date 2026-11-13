Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gc4DxsFs;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3TOIlXg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pw/GtRqnRmkmoV0EVd3bZWIv5BPfPAggSs7FVXENh7M=; b=gc4DxsFsvqNWGluVrU5KMPW/Jm
	8kMgPQjpyrZJ0K+TjJxOvJsOQ7BVIuHiiWXn/QMUzAnuCONbxN9vcEPJzsMZsbNp+Wq+PCG3Vqoj7
	Y68RXdMRecqDaKXAJkkTequDAWqsHo6S5lUfXP/tgvI8SoKlDcZrdQHbcpYdobuiSrOsTjcRtTLw8
	Vy/R23YKVB0G57unN46hMOyErItX1KbtOZsOxUup9d58pbV7pvFqOW7Cq3X+H1wG3q5VrWy9CHG4W
	Br0+5pnuL8IsukdHfrc1A1pu+4Bcuimol81fceQEC8bMDxUmFo3s0LPccji7NGH3eNUb7KNkVZ97g
	AxmINWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRx0B-0000000EBp3-2Imt;
	Fri, 13 Nov 2026 19:31:59 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwzv-0000000EBnN-3QBm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:31:51 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-8b30cbfa628so14054417b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 11:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794598302; cv=none;
        d=google.com; s=arc-20260327;
        b=ie2Q0LbDpzYN+uaC62yHuGxs8quHm44uZUaRnENBPy1TOJqn7hpyCfpn/yXzbJprOc
         jpw496u+5CGS1kh3caruiDBhvqNViD2jJif/n1lm2HG3CFCZ+ylTvj2vAKqvzNQRDMNC
         hUX17MtKiQBSCYhIFRbSjyn3P07ALRXOb2ITUBu7v/a8j5FVowdnl64RV8/hThr6qyJ1
         sG4QkwXMxNB/s9GBhwDiusu9d52P6MyBaoZ/as5FAH9ZM6x3m+59xxrNY+dAnuvBIeAN
         s4LrtnK8ppbkpjhxsRCrdZKCuD5zDk1pEjFTAv4xlNsdYG/gA+Fgp0VuXhrnBu06ddaT
         mnjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pw/GtRqnRmkmoV0EVd3bZWIv5BPfPAggSs7FVXENh7M=;
        fh=PyPxLUcuXh2piaXLP9OkrmamOoJWd//ohw0xkbYbovA=;
        b=S0U06kFAMpRj0gBoTfnobXVdObHU0ZqhYZeaYjIBizJtrhZdmHwY3Eo9mQSGMtpLhP
         4sqCRx21l3LQ2gBQhoeMgq3eMaxgEeuJXUYMIFpkejr3rx5rJ9+Bgj/22Bv3d1bpjx9w
         GGdnie8e/hdKnlI/AAf+CGQeBtJ9BEfqZq0HzVlRYhqqqBET8zZiNDhLVANdjRCaDU9s
         cRGPW5Ys4Iq+x3XsPl5zBJfrSb/K+Ckq6uyONyVGTafaLApWvf4oC0cXKiHCQmG/gTXH
         NSGnYdXbRziDtJFoCZe8wzh2OH/799uoI3MxbM1alNHCxdOgHDnVdunJSKN/678BcBCQ
         SOtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794598302; x=1795203102; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pw/GtRqnRmkmoV0EVd3bZWIv5BPfPAggSs7FVXENh7M=;
        b=N3TOIlXgRlFDDL320LmNAJxd6YdeJ3ttDpSuTkB5VsB2eGbkpsnLYSTQ16D8Om50mJ
         8ZeA6syZg0hPZYsFK3ynH0T1w4FoOz4bmuoBDhgynRWqNzC1nIFERjbfJGE12wLhG2g0
         A9ZxVTWy3ZtNeA5cNSDQp7ySVwVzHDJO56Ooz86laZKW93ajN0rTRtEgiq0zPF+oqPe7
         owVFFPe3qMshlCXSmA9DB7C22i65Z7TdkwdCk57Hi6NWvrBJN54z6+fTiPXf296IMuSr
         ubYSQ+mnW5GxXLOk1ahSgKZAwfV3Sd4fYEP0sTGmu7P7oPLTlAwrXRX+V4AANgCN99ri
         xl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794598302; x=1795203102;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pw/GtRqnRmkmoV0EVd3bZWIv5BPfPAggSs7FVXENh7M=;
        b=F5zJbBMJl9/wlALeNb9YhLLDd8vjcMjabI8VE65DVZAt0dAdcOG/AT53WEaxOwv2PV
         AXRrpTR+agDbQFRVJYC99qBMQ5HGYxO/ZojHlpxjNj1xxBMHz04uO2CMIk+wixswsKQW
         s9zOKeIpGWvHBlKerqbB87ndi+4TwEAeUhzgvjuzhbwjJtNzc3vYffclG48bJDh2tZ/v
         eZPAfyy17CRmHMPtSas3kbAYnjNy+bcIt7/minLU6iD0ufqnhVulsGsOyiigCVK8+jwF
         90IoUjH6jSN6Oi2st4k+aUULlBjGJZcfVPIrLxcDJVkcxf7nYmiEFS6ETAVEnXMBFJtu
         YcwA==
X-Forwarded-Encrypted: i=1; AL+hErGJRKS0IA5tpmnnPDA1Btsg5POXVc8VZD7dhebgapkFPIGNTHz7fk00jqqscMhfhUcjlCASGIEvhaJfjD9R5uQL@lists.infradead.org
X-Gm-Message-State: APuU4Z9jGGf1SutT4SWo/4YYeWtAHxCG0akysPZvI/bu4VRcF7V3ZPca
	QO9ihf+WizUuVanCC2V9uqUIlhttdj0gjKbdbB0ewhl9v3BE50FFjtWoZSbf2xb8KQ5oS1pWfVZ
	LfHOrKiTuv2o2DK855S5AIENUicS1Ng0=
X-Gm-Gg: AYBFou2ocMLWmjZH9e74Q40Ps35+3/kkwmlRJNJauwVrkll1ZpfO6n7O80tNtcr4AZv
	FJgu7cSkbE5g0IuDUiQNPJIXvWUzoGkCnxilwLEb8aTGXMN1ruesGYI3ZzAbqioDSfnM5PYlt1m
	CbIl1a0dQmIQLG0erN8q4VJixehwx6TVx8qqg/3IOqGXOrVn/76JLwfptw8Z3JOf7RnRIhhEcrV
	i0m456qp3yctxKgdOS6+4P5kYbBuA0tWGMjUFff3LIHj8i1DbwGr2/Bq862KmkeOSniw/bxd/uK
	JmCE+CoAR/Prrlrvcx38BZdLoXE3fmDSzQyk/1qS2ES79EfqtmzgaHAvuVlvxZAFWrQ6g0DpfUA
	M0vPGZWOWnSRyYu8Hl8u98k+inZbpes7+KC5hXSTLh7/dyn5kWLCQcb99w3L5xlpJ3TGiWwmRHR
	mXO+/3sSvTjQQMTpZ9nTdfcO7KO9fJW7ejQdFZOTcmF1GtHjtc4Adjt9/lDBE69d/HrQA/Lli8U
	bfaz01m
X-Received: by 2002:a05:690e:1384:b0:677:d804:94b4 with SMTP id
 956f58d0204a3-67d896dbe48mr2401686d50.65.1794598302165; Fri, 13 Nov 2026
 11:31:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112233807.70664-1-sidchintamaneni@gmail.com> <avdXkLKJwuNv0vZ4@kernel.org>
In-Reply-To: <avdXkLKJwuNv0vZ4@kernel.org>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Fri, 13 Nov 2026 11:31:31 -0800
X-Gm-Features: AclHuK8cZbEkeSRDtbCQkhfrXJYZHXhWNH4fr0GNR6OJpPd_lgMe_pOQXSkn9K4
Message-ID: <CAE5sdEgEFjGz6W0e5g4uxRVC2Otyvr4Pak-aAZogObWaFtNsTA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] tpm: tpm_crb_ffa: Only register driver when ACPI
 TPM2 uses FF-A
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Stuart Yoder <stuart.yoder@arm.com>, apais@microsoft.com, rlmenge@gmail.com, 
	hargar@linux.microsoft.com, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_113143_900256_86E38E56 
X-CRM114-Status: GOOD (  23.12  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 at 10:31, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Thu, Nov 12, 2026 at 11:38:07PM +0000, Siddharth Chintamaneni wrote:
> > Prior to commit 677042afb97a ("tpm: tpm_crb_ffa: revert defered_probed
> > when tpm_crb_ffa is built-in"), built-in tpm_crb_ffa only registered
> > tpm_crb_ffa_driver from tpm_crb_ffa_init() after crb_acpi_probe()
> > confirmed start_method == ACPI_TPM2_CRB_WITH_ARM_FFA. After that
> > commit, tpm_crb_ffa unconditionally registers on the FF-A bus at
> > device_initcall time (and when loaded as a module) without checking
> > the platform's ACPI TPM2 table.
> >
> > A platform's firmware may expose a TPM CRB over FF-A Secure Partition
> > for UEFI boot services while advertising a non-FF-A start method to
> > the OS in the ACPI TPM2 table. When the ACPI TPM2 table designates a
> > non-FF-A start method, Linux has no consumer for tpm_crb_ffa and
> > should not probe the FF-A TPM service.
> >
> > On Microsoft Cobalt 200 systems, the ACPI TPM2 table does not use
> > ACPI_TPM2_CRB_WITH_ARM_FFA, yet ffa_init() discovers the FF-A TPM
> > partition and tpm_crb_ffa_probe() unconditionally sends
> > CRB_FFA_GET_INTERFACE_VERSION via FFA_MSG_SEND_DIRECT_REQ2/REQ SMC.
> > That request wedges the calling CPU in Secure World (with Non-Secure
> > interrupts and GICv3 pseudo-NMIs masked), hanging boot with an RCU CPU
> > stall:
> >
> >   [    5.507519] ARM FF-A: Driver version 1.2
> >   [    5.507519] ARM FF-A: Firmware version 1.2 found
> >   [    5.507551] ARM FF-A: Notification setup failed -61, not enabled
> >   [    7.150580] Freeing initrd memory: 293640K
> >   [   65.515248] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> >   [   65.521346] rcu:     10-...0: (3 GPs behind) idle=dd9c/1/0x4000000000000000 softirq=37/37 fqs=5262
> >   [   65.530031] rcu:              hardirqs   softirqs   csw/system
> >   [   65.535589] rcu:      number:        0          0            0
> >   [   65.541146] rcu:     cputime:        0          0            0   ==> 30028(ms)
> >   [   65.548102] rcu:     (detected by 66, t=15010 jiffies, g=-951, q=1384 ncpus=132)
> >   [   65.555228] Sending NMI from CPU 66 to CPUs 10:
> >   [   75.560686] After 10 seconds, these CPUS still haven't responded to the NMI: 10
> >
> > Check the ACPI TPM2 table in tpm_crb_ffa_driver_init() and return
> > -ENODEV before calling ffa_register() unless the table is present and
> > specifies ACPI_TPM2_CRB_WITH_ARM_FFA, matching the check_acpi_tpm2()
> > pattern in tpm_tis.c. This ensures Linux only issues FF-A TPM requests
> >
> > when ACPI advertises the FF-A start method (for both built-in and
> > modular builds), while preserving normal FF-A bus probing on platforms
> > that use CRB over FF-A.
> >
> > Fixes: 677042afb97a ("tpm: tpm_crb_ffa: revert defered_probed when tpm_crb_ffa is built-in")
> > Fixes: eb93f0734ef1 ("tpm_crb: ffa_tpm: Implement driver compliant to CRB over FF-A")
>
> Pick the older.
>
> I attached a prepending patch that caches the start method, which can be
> later used in tpm_tis and tpm_crb.
>
> So that totals four patches:
>
> 1. My patch.
> 2. Your fix using the cached value.
> 3. tpm_tis update to use the cached value.
> 4. tpm_crb update to use the cached value.
>

Sounds good! I can put together that 4 patch v2 series.

Two quick notes before I spin v2

- Module loading with CONFIG_TCG_CRB=m and CONFIG_TCG_ARM_CRB_FFA=m:
  As Sashiko flagged on v1 [1], because tpm_crb.ko directly references
  tpm_crb_ffa_init() and tpm_crb_ffa_start(), returning -ENODEV from
  tpm_crb_ffa's module_init would prevent modprobe from loading
  tpm_crb.ko on non-FF-A systems. In v2, I will move the start_method
  check into tpm_crb_ffa_probe() (matching check_acpi_tpm2() in tpm_tis)
  so both modules load cleanly while still skipping the FF-A probe on
  non-FF-A platforms

- regarding the location of caching approach -
  tpm_crb_ffa never allocates a struct tpm_chip, and both tpm_tis
  (check_acpi_tpm2()) and tpm_crb (crb_acpi_probe()) check start_method
  before calling tpmm_chip_alloc().  Would it work for you if patch 1
  caches start_method once in tpm_init() (subsys_initcall in
  tpm-interface.c) and exports a small helper (e.g.
  tpm_acpi_start_method()) so tpm_crb_ffa_probe(), tpm_tis, and tpm_crb
  can all query it before chip allocation? (Also noticed a small '||' ->
  '&&' typo on the header.length check in the attached patch.)


[1] https://sashiko.dev/#/patchset/20261112233807.70664-1-sidchintamaneni%40gmail.com

> Fast-forward when these are in the mainline, I can send my change with
> Stable-dep-of tag to stable@vger.kernel.org.
>
> Br, Jarkko

