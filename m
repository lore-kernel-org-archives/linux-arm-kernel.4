Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 19:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gfZvA//L;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xEi2+QNB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dEbNC3pIasfz+1kUIBaS1REGH5134TVv5RUDhMq/bQs=; b=gfZvA//LcDDNs8XMh1CKxxXA0R
	O+Am0+0aXaOpiPd65tXW/8IjKxDvJtws8vj5NaOiQdWOS1OMhbValxfQTGsnc5lisLSs+wR0fjUui
	T9hNFiQ9zUz6pebClXDzPnj7TWCcyflOpznGafORYcQ7D5G9swG7S9tpOxfjTxVjeflgxr+ZxgUpA
	F0LJ6QyG2D6VuPkfI9YNjKm7mss83FttYF2ZwPt9AVje2+vq7UPtsEoN2eFLLy/Rss2N4/g+2dkgU
	xhfFIy5CZybUH89RrhVQzZiWToAcKPE+/f00YM2YefV+IzHdEAq7zjsoYR1GY6b3d+IO/7zBS+VI7
	2JY2ABvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDaq-00000001fot-1ahb;
	Sun, 22 Nov 2026 19:51:20 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDam-00000001foE-2cks
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 19:51:18 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-67da3d03263so2599889d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 11:51:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377075; cv=none;
        d=google.com; s=arc-20260327;
        b=qKca395sY7NyS59SZZpJL6w7LQ1+fDptDLR/bF//VjUOjMiz8M177LSks65lna6j1Z
         2LWd+oFgvxjO1GHh8aM1PFBosOr9z/cng3EaHk6F81Fhgc4XJni2N+f27ho35hA8fTWD
         jnsDVrrH4c6yvOSn930d9/Wyh9fUq4IkHQpTTrF3+ro31FiHEr1a3iGyiKTnugx8TRXL
         lahD7EzmLC4Vg1Fv5682JTdrnp71PJnqeo8esRsxCRFXI1n/+RAQbt8M+WmDcZxdPyuE
         hS9Q4KRTP6b7gHc7THsrUPkHwOCOm8V1FOmiDAmqOHIb7twKoSXu1l3S63W4wnTR4wsH
         6Dqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dEbNC3pIasfz+1kUIBaS1REGH5134TVv5RUDhMq/bQs=;
        fh=qpf35JQB2vDZrKIXfBcuDRg7+qHMGei7Rc/7xkQ1+TY=;
        b=spN//Y0a/zaHSC2OJkyluEQZ8aTZ4S6bXQ+gAxUq/VXsljmS4ONdI+dUP5aWz+7LTb
         tQNSVNmRv8vGqhFj/0GB2zEsIhatpZJ17A5j4i37pc1g7c/f+rp9rQ02ADThnDx3QGjN
         WJfTAipBEnLBBHtUlrj/3/WsCavhJ3yNld7kIWiFUoid6U8ioE7wF3bB+TxxbT/HB4EU
         usNrr0JYAN+7G3EKtiOJW70WA/EXscz4qq0p7ZQwy/Qpz2xY62G/+Ix46Ttz7xofMn0p
         CYDW7X8rnYO0h2S/fdroyS52S93LAGYt81iEjE4FGEf9r9lSU4Df2ebqjaQWkWuigcPM
         +NdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795377075; x=1795981875; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEbNC3pIasfz+1kUIBaS1REGH5134TVv5RUDhMq/bQs=;
        b=xEi2+QNBNdLa9oSpOFJb5hczlF/q8cNMEb8zXDTMTW8voIO6WORPt2QOGe+yFBdkzO
         GPFlziVcTvOjrqvwC09bm4C+Qb21mNp0mtdVh0qXZxp4QAdFd4nogXduNlh0xu/hkySm
         WW5Dz9NupC575A5a8ZJGG7yC1mZ2ZXMOurvDglxZsCJqjKCvYQgoJrz0Tpwz5N+7yUh/
         BrT2xmBPiUQ1a+gcNUaalyzRFO6xFhAp+992iogu9vAqQwg4tc2smdpdGdqo8qzXOFzz
         4icPqUzDnvFpN9UTdqVTqgygIFdaqLzWFucpXoAXAcEeI6VmlMl1/7uPIb7Fu8QHHpM9
         +8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377075; x=1795981875;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dEbNC3pIasfz+1kUIBaS1REGH5134TVv5RUDhMq/bQs=;
        b=wEwLRT5S7jPZbMnc3k6GnElKkJCF6MI2YCgcVi5FCTRsPEDoyIIxL/vod4JQiE5wGX
         4nWuBtPOTmApVyybkdc/fPdoDw5/iGCQbsSCVCBGEv8U25M1R5gdq0SRyZsJ+Ctmg0wj
         OzOPU4YmjYPlaNSN8W4KqLw/zEsHwPwBrIazpaHDIOjAvB0UBSzyjnfZ19fPOpJMGJG8
         Y89fTdYrGtmQar/DZ2jkrsLSIW31K+SR4QMfqTOgVG/nmGb1jZpx4YzF2AqTfAS4Omau
         K95EMHlfS9tCw4kVjIm0BgvvdjiZn3Z1tW3uSxRZ2MAOqFQKWNjiadqGIYLyK047qpUD
         1X9Q==
X-Forwarded-Encrypted: i=1; AL+hErHTo2Ab27uRreId5dcMFgfyoMDTR3iQ6+knHTHoVv/n6LtxQUKYFDqUmxEeZ3mSf1/mAZBclSGnnA3+hBgsugJb@lists.infradead.org
X-Gm-Message-State: APuU4Z/k1q/v1dH/BGIkkknel5NYjypfFQ0xlroEhWqOi3DTA9Z5XBmO
	M0mADcfMH7lmqSCpj82lAVsp6UExZrgi/NUyK2TbCvmqoX31dLhTPtPzRqxiH0Rb1lZWDFcrpSb
	ub2KG3UvhcjqpPQ6uoDJUMNTj8tm5Cy4=
X-Gm-Gg: AZFdTZeKnSfPctin9n5muuZUnRU7wZ7GJkeKNYizdqljMCk4DxLGhIkNwXvbfrUb5Dl
	1MkrcxvQQ/VTq7dL7nFtoYl+pRD4nwskNtOA6IMYBCM7kd6tqK7yZzA71dmHNhRo/8c+DVXwgG+
	ZPbXTHxEoQYHKmdYw6lonT1R0cpW7gK+pD/MlCtSR0Na7+QPHW2n63Cafe7LBGGpYfu5oL/dqkF
	n8z6mVcZhPD6wDHOJDL1R9+BqnltWiwblmDidGKCdxW+UPfDlafIXLuPCdu+bup9E0/LYbe9U8n
	jdYDy59sHxNCZX8Qn0k6zYrMquvU30ak2dCoQQw2pCSzYHNP9D4EPlZQHg5jR9v02HmAuP+Ljmk
	kQYWwrJsP4beg5knk5a0McNaeZIwPHGTZlm1vossIC2PMqI1sogUlBFROxSUN8Q3o99IG/jD5FW
	ONEwWjXyVj8mLDMvt5zAhW48gP3/ovKCHDjLLMLWpiNmX5g4YJgU9FB6/14EJvYnEA1uX1aXe8g
	TdJCVKySA==
X-Received: by 2002:a05:690e:43ce:b0:679:be6b:42d5 with SMTP id
 956f58d0204a3-67df4456982mr1539736d50.98.1795377075124; Sun, 22 Nov 2026
 11:51:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117222224.1465328-1-arnd@kernel.org> <20261117222224.1465328-3-arnd@kernel.org>
In-Reply-To: <20261117222224.1465328-3-arnd@kernel.org>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Sun, 22 Nov 2026 11:51:04 -0800
X-Gm-Features: Aa3M54qSKnHMfRte544j7n37UHVtncPq8-RbJK8w975X-Kp2Zw1xOI3CE7bOY5A
Message-ID: <CAE5sdEim3Xz2SPwsb-xP+gp-+w5TOhDv4JtDf0ZbVZ2XSfK+jA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dynamically enable st64bv0 for SVA
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Navneet Singh <navneetsingh@microsoft.com>, apais@microsoft.com, 
	hargar@linux.microsoft.com, Rachel Menge <rachelmenge@linux.microsoft.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_115116_897003_662F614E 
X-CRM114-Status: GOOD (  37.66  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 at 14:22, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> I/O devices that understand the st64bv0 instruction for doing shared
> virtual access from userspace need to set the pasid value in the
> accdata_el1 register, but in general we want this to be disabled unless
> a driver actually hands an MMIO area to userspace that accepts these
> commands and installs a pasid using iommu_sva_bind_device().
>
> Rather than trying to find all threads that use an mm_struct by the
> time the pasid created, iommu_sva_bind_device() only stores the pasid in
> 'struct iommu_mm_data' and sets up the iommu domain in the device. The
> first attempt to use SVA from userspace traps into do_el0_other(),
> which checks that this is indeed valid and then sets the configured
> pasid before enabling SCTLR_EL1_EnAS0.

I've tested it on Cobalt h/w (ID_AA64ISAR1_EL1.LS64 = 0b0011, SMMUv3
with PRI) on top of Fuad's FEAT_LS64_ACCDATA series and our Data
Accelerator VF driver.\

While testing multi-process isolation on hardware, we hit the SCTLR_EL1_EnAS0
context-switch bug below, which Sashiko's review [1] also highlighted along
with several of the other corners listed here (note that Sashiko's cpucaps and
guest vcpu_sysreg warnings are false positives from applying against docs-next
without Fuad's series):

>
> On machines running KVM guests, KVM already handles saving and restoring
> ACCDATA now. If the same process uses SVA itself, the context is restored
> upon guest access. This only really makes sense if the host device using
> SVA is attached to the same SMMU using a single stage translation, and
> another device is assigned to the guest VMID for stage2 so it can use
> the stage1 translation inside of the guest using ACCDATA as PASID.
>
> This is pretty much a lifted from the x86 try_fixup_enqcmd_gp()
> function.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/include/asm/cpufeature.h  |  5 +++
>  arch/arm64/include/asm/exception.h   |  1 +
>  arch/arm64/include/asm/mmu_context.h | 17 +++++++++
>  arch/arm64/kernel/entry-common.c     | 11 ++++++
>  arch/arm64/kernel/traps.c            | 52 ++++++++++++++++++++++++++++
>  arch/arm64/tools/sysreg              |  5 +++
>  6 files changed, 91 insertions(+)
>
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 7d7b8eb7f72f..e5367344e817 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -914,6 +914,11 @@ static inline bool system_supports_bbml3(void)
>         return alternative_has_cap_unlikely(ARM64_HAS_BBML3);
>  }
>
> +static inline bool system_supports_ls64_accdata(void)
> +{
> +       return cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA);
> +}
> +
>  int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
>  bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
>
> diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
> index a2da3cb21c24..7c61b50718d6 100644
> --- a/arch/arm64/include/asm/exception.h
> +++ b/arch/arm64/include/asm/exception.h
> @@ -81,6 +81,7 @@ void do_el0_sys(unsigned long esr, struct pt_regs *regs);
>  void do_sp_pc_abort(unsigned long addr, unsigned long esr, struct pt_regs *regs);
>  void bad_el0_sync(struct pt_regs *regs, int reason, unsigned long esr);
>  void do_el0_cp15(unsigned long esr, struct pt_regs *regs);
> +void do_el0_other(struct pt_regs *regs, unsigned long esr);
>  int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs);
>  void do_el0_svc(struct pt_regs *regs);
>  void do_el0_svc_compat(struct pt_regs *regs);
> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
> index 803b68758152..40c47ee003d5 100644
> --- a/arch/arm64/include/asm/mmu_context.h
> +++ b/arch/arm64/include/asm/mmu_context.h
> @@ -16,6 +16,7 @@
>  #include <linux/mm_types.h>
>  #include <linux/pgtable.h>
>  #include <linux/pkeys.h>
> +#include <linux/iommu.h>
>
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
> @@ -247,6 +248,20 @@ static inline void __switch_mm(struct mm_struct *next)
>         check_and_switch_context(next);
>  }
>
> +/* switch to PASID if new task has enabled st64bv0 */
> +static inline void switch_iommu_mm(struct mm_struct *mm, struct task_struct *tsk)
> +{
> +       u32 pasid;
> +
> +       if (!IS_ENABLED(CONFIG_IOMMU_SVA) ||
> +           !(tsk->thread.sctlr_user & SCTLR_EL1_EnAS0))
> +               return;
> +
> +       pasid = mm_get_enqcmd_pasid(mm);
> +       if (pasid != IOMMU_PASID_INVALID)
> +               write_sysreg(pasid, accdata_el1);
> +}
> +
>  static inline void
>  switch_mm(struct mm_struct *prev, struct mm_struct *next,
>           struct task_struct *tsk)
> @@ -254,6 +269,8 @@ switch_mm(struct mm_struct *prev, struct mm_struct *next,
>         if (prev != next)
>                 __switch_mm(next);
>
> +       switch_iommu_mm(next, tsk);
> +
>         /*
>          * Update the saved TTBR0_EL1 of the scheduled-in task as the previous
>          * value may have not been initialised yet (activate_mm caller) or the
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index beb56891fc4f..03ecc73c44a4 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -807,6 +807,14 @@ static void noinstr el0_fpac(struct pt_regs *regs, unsigned long esr)
>         arm64_exit_to_user_mode(regs);
>  }
>
> +static void noinstr el0_other(struct pt_regs *regs, unsigned long esr)
> +{
> +       arm64_enter_from_user_mode(regs);
> +       local_daif_restore(DAIF_PROCCTX);
> +       do_el0_other(regs, esr);
> +       arm64_exit_to_user_mode(regs);
> +}
> +
>  asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
>  {
>         unsigned long esr = read_sysreg(esr_el1);
> @@ -870,6 +878,9 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
>         case ESR_ELx_EC_FPAC:
>                 el0_fpac(regs, esr);
>                 break;
> +       case ESR_ELx_EC_OTHER:
> +               el0_other(regs, esr);
> +               break;
>         default:
>                 el0_inv(regs, esr);
>         }
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index d6391ab20db3..a02dbee8c06d 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -13,6 +13,7 @@
>  #include <linux/kprobes.h>
>  #include <linux/spinlock.h>
>  #include <linux/uaccess.h>
> +#include <linux/iommu.h>
>  #include <linux/hardirq.h>
>  #include <linux/kdebug.h>
>  #include <linux/module.h>
> @@ -543,6 +544,56 @@ void do_el1_mops(struct pt_regs *regs, unsigned long esr)
>         kernel_fastforward_single_step(regs);
>  }
>
> +/*
> + * PASID/ACCDATA is shared by the entire mm, while sctlr_el1
> + * is maintained per thread. Keep things simple and enable
> + * ACCDATA dynamically on first access if the feature is
> + * available and a valid pasid is set.
> + *
> + * After exiting back to userspace, the st64bv0 instruction
> + * should no longer trap.
> + */
> +static bool try_enable_st64bv0(struct pt_regs *regs, unsigned long esr)
> +{
> +       u32 pasid;
> +       u64 sctlr;
> +
> +       if (!system_supports_ls64_accdata())
> +               return false;
> +
> +       pasid = mm_get_enqcmd_pasid(current->mm);
> +       if (pasid == IOMMU_PASID_INVALID)
> +               return false;
> +
> +       preempt_disable();
> +       write_sysreg(pasid, accdata_el1);
> +       sctlr = current->thread.sctlr_user;
> +       sctlr |= SCTLR_EL1_EnAS0;
> +       current->thread.sctlr_user = sctlr;
> +       update_sctlr_el1(sctlr);
> +       preempt_enable();
> +
> +       return true;
> +}
> +

1. SCTLR_EL1_EnAS0 is missing from SCTLR_USER_MASK (and fork/exec reset):

update_sctlr_el1() clears only (SCTLR_USER_MASK & ~SCTLR_ELx_ENIA). Because
SCTLR_EL1_EnAS0 is not in SCTLR_USER_MASK, once a task enables st64bv0 on a
CPU, __switch_to() -> update_sctlr_el1() never clears SCTLR_EL1.EnAS0 when
switching to another task, and switch_iommu_mm() returns early because the
next task does not have SCTLR_EL1_EnAS0 set in thread.sctlr_user. On Cobalt
200, an unprivileged process with no SVA binding scheduled onto that CPU
executed st64bv0 without trapping while the previous task's PASID was still in
ACCDATA_EL1.

Similarly:
- arch_dup_task_struct() copies thread.sctlr_user, so a fork() child inherits
  SCTLR_EL1_EnAS0 with a fresh mm whose PASID is IOMMU_PASID_INVALID (leaving
  the parent's PASID in ACCDATA_EL1 when switch_iommu_mm() skips the write).
- flush_thread() does not clear SCTLR_EL1_EnAS0 across execve().
- try_enable_st64bv0() can return false if SCTLR_EL1_EnAS0 is already set in
  current->thread.sctlr_user (matching current->pasid_activated on x86).

Folding in the diff below fixed all three cases (context switch to an unbound
task on the same CPU, fork(), and execve() all trap with SIGILL again on
Cobalt 200):


diff --git a/arch/arm64/include/asm/processor.h
b/arch/arm64/include/asm/processor.h
index 2f368889aa3a..c7243bd4849a 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -264,7 +264,7 @@ static inline void task_set_sve_vl_onexec(struct
task_struct *task,

 #define SCTLR_USER_MASK
         \
  (SCTLR_ELx_ENIA | SCTLR_ELx_ENIB | SCTLR_ELx_ENDA | SCTLR_ELx_ENDB |   \
- SCTLR_EL1_TCF0_MASK | SCTLR_EL1_TCSO0_MASK)
+ SCTLR_EL1_TCF0_MASK | SCTLR_EL1_TCSO0_MASK | SCTLR_EL1_EnAS0)

 static inline void arch_thread_struct_whitelist(unsigned long *offset,
  unsigned long *size)
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index b52d4f0cf5b4..6a1cfeb28bf2 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -350,6 +350,13 @@ void flush_thread(void)
  flush_tagged_addr_state();
  flush_poe();
  flush_gcs();
+
+ if (current->thread.sctlr_user & SCTLR_EL1_EnAS0) {
+ preempt_disable();
+ current->thread.sctlr_user &= ~SCTLR_EL1_EnAS0;
+ update_sctlr_el1(current->thread.sctlr_user);
+ preempt_enable();
+ }
 }

 void exit_thread(struct task_struct *tsk)
@@ -395,6 +402,7 @@ int arch_dup_task_struct(struct task_struct *dst,
struct task_struct *src)

  /* clear any pending asynchronous tag fault raised by the parent */
  clear_tsk_thread_flag(dst, TIF_MTE_ASYNC_FAULT);
+ dst->thread.sctlr_user &= ~SCTLR_EL1_EnAS0;

  return 0;
 }
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index a02dbee8c06d..be84e84c5fa1 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -558,7 +558,8 @@ static bool try_enable_st64bv0(struct pt_regs
*regs, unsigned long esr)
  u32 pasid;
  u64 sctlr;

- if (!system_supports_ls64_accdata())
+ if (!system_supports_ls64_accdata() ||
+    (current->thread.sctlr_user & SCTLR_EL1_EnAS0))
  return false;

  pasid = mm_get_enqcmd_pasid(current->mm);

2. Other corners (first three also highlighted by Sashiko [1]):

- EL2 -> EL1 boot setup (arch/arm64/include/asm/el2_setup.h): our bare-metal
  host ran at EL2 with VHE, so HCRX_EL2 did not affect host EL2/EL0. For
  kernels booting at EL2 and dropping to EL1 (e.g. CONFIG_KVM=n, nVHE/pKVM, or
  guest VMs booting at EL2), __init_el2_hcrx and __init_el2_fgt do not yet set
  HCRX_EL2_EnAS0 or HFGRTR_EL2_nACCDATA_EL1 / HFGWTR_EL2_nACCDATA_EL1, so EL1
  ACCDATA_EL1 accesses and EL0 st64bv0 will trap to EL2.
- KVM host ACCDATA_EL1 save/restore: regarding the commit message note about a
  host process using both SVA and KVM, even with Fuad's series applied,
  ctxt_has_accdata() in arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h returns
  false when !ctxt_is_guest(ctxt), so KVM loads the guest's ACCDATA_EL1
  without saving or restoring the host's ACCDATA_EL1 across vCPU run.
- Assembler target: arch/arm64/Makefile caps -Wa,-march at armv8.5-a, which
  breaks Clang IAS (LLVM=1) on write_sysreg(..., accdata_el1); using
  write_sysreg_s(pasid, SYS_ACCDATA_EL1) avoids that (and the duplicate manual
  #define SYS_ACCDATA_EL1 in arch/arm64/include/asm/sysreg.h can be dropped now
  that tools/sysreg generates it).
- CPU suspend: cpu_do_suspend / cpu_do_resume in arch/arm64/mm/proc.S
  saves/restores sctlr_el1 across CPU powerdown idle states without
  saving/restoring accdata_el1.

[1] https://sashiko.dev/#/patchset/20261117222224.1465328-1-arnd%40kernel.org

...

