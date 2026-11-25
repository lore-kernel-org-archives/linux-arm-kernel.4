Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE92606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DEObwcgm;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rLQr2Z96
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d18K+H/b8DLcR1yid8CBC4dKDHrXYqvvItV0tAwBSjE=; b=DEObwcgm9/1Mfa
	1JOReE3J7VrE54xdaGptVMQPhQEzl09Ee1BmqF8sCd7YSPmtpBTUTlGlmhHdXgjTx3PF+h0Lu11LS
	bIspVhkv0hGbqBuvHnqZUlwEhskBriHW2dZiHsvR0hJPIZwa0akwvk3N9hB2dFAVEt5OaVmPfwKqi
	l4Ewosx7GuW2B5JGC17GH5ftRnfTS2Bti+cyirUda+lAj3CiIT4xaXkum/M3dSIzam6gE3D4YIlEh
	RDtxm8zRJ75BPQdIPOOFQYkF02Cpicuo1/uqx3rmAr/yw7JZ4auwN3ELj0tzDPf6GwtdJI0qR3jWO
	ShRvbmX48mdccYY0fdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEGx-0000000AECg-1Kv5;
	Wed, 25 Nov 2026 14:46:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEGu-0000000AEC8-2K68
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:46:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B00322F;
	Wed, 25 Nov 2026 06:46:52 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A250B3F632;
	Wed, 25 Nov 2026 06:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795618015; bh=oP/8jDv6hrPG1LLSG/dxqYqTwLl4v7NTT5/6t7aYkxg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=rLQr2Z96qIvloK9X5Gesy8USel7a0+z913J7svRwbDd91xRXCxez7tbA/bI78gyW3
	 a6CQpS0z7F7FM2RNrTGqA2Bi0yX+XUfDNdbJmLIMEYaHXctp2A4eA9zT6rWQ05bmib
	 noZ1+Z5dQRpqgu+lOd+JKxFPFKlukNndBH1zvFDE=
Message-ID: <18952733-d1a6-4292-ad30-7d45d1b1d3a9@arm.com>
Date: Wed, 25 Nov 2026 14:46:51 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/39] arm64: replace local_daif helpers
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org,
 liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, maz@kernel.org,
 will@kernel.org, ruanjinjie@huawei.com
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <20261112132042.129062-10-vladimir.murzin@arm.com>
Content-Language: en-GB
In-Reply-To: <20261112132042.129062-10-vladimir.murzin@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_064657_326855_90BA6281 
X-CRM114-Status: GOOD (  21.82  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 13:20, Vladimir Murzin wrote:
...
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index 681aa2bbc399..b488e04249d0 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -33,7 +33,7 @@
>  #include <acpi/processor.h>
>  #include <asm/cputype.h>
>  #include <asm/cpu_ops.h>
> -#include <asm/daifflags.h>
> +#include <asm/interrupts/masking.h>
>  #include <asm/smp_plat.h>
>  
>  int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
> @@ -388,48 +388,43 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>   */
>  int apei_claim_sea(struct pt_regs *regs)
>  {
> +	arm64_exc_hwstates_t hwstate;
> +	bool irqs_disabled;
>  	int err = -ENOENT;
> -	bool return_to_irqs_enabled;
> -	unsigned long current_flags;
>  
>  	if (!IS_ENABLED(CONFIG_ACPI_APEI_GHES))
>  		return err;
>  
> -	current_flags = local_daif_save_flags();
> -
> -	/* current_flags isn't useful here as daif doesn't tell us about pNMI */
> -	return_to_irqs_enabled = !irqs_disabled_flags(arch_local_save_flags());
> -
> -	if (regs)
> -		return_to_irqs_enabled = !regs_irqs_disabled(regs);
> -
>  	/*
>  	 * SEA can interrupt SError, mask it and describe this as an NMI so
>  	 * that APEI defers the handling.
>  	 */
> -	local_daif_restore(DAIF_ERRCTX);
> +	hwstate = local_exceptions_save_mask(ERROR_CONTEXT);
>  	nmi_enter();
>  	err = ghes_notify_sea();
>  	nmi_exit();
> +	local_exceptions_restore(hwstate);
> +
> +	if (err)
> +		return err;
>  
>  	/*
>  	 * APEI NMI-like notifications are deferred to irq_work. Unless
>  	 * we interrupted irqs-masked code, we can do that now.
>  	 */
> -	if (!err) {
> -		if (return_to_irqs_enabled) {
> -			local_daif_restore(DAIF_PROCCTX_NOIRQ);
> -			__irq_enter();
> -			irq_work_run();
> -			__irq_exit();
> -		} else {
> -			pr_warn_ratelimited("APEI work queued but not completed\n");
> -			err = -EINPROGRESS;
> -		}
> +	irqs_disabled = regs ? regs_irqs_disabled(regs) : arch_irqs_disabled_flags(hwstate.saved.flags);
> +
> +	if (!irqs_disabled) {
> +		hwstate = local_exceptions_save_mask(NOIRQ_CONTEXT);
> +		__irq_enter();
> +		irq_work_run();
> +		__irq_exit();
> +		local_exceptions_restore(hwstate);
> +	} else {
> +		pr_warn_ratelimited("APEI work queued but not completed\n");
> +		err = -EINPROGRESS;
>  	}
>  
> -	local_daif_restore(current_flags);
> -
>  	return err;
>  }
>  

Shashiko told me what it wrong with this approach and I'm planing to have a look...

...
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index a707deba6ae7..49914965b790 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -38,7 +38,7 @@
>  #include <asm/fixmap.h>
>  #include <asm/cpu.h>
>  #include <asm/cputype.h>
> -#include <asm/daifflags.h>
> +#include <asm/interrupts/masking.h>
>  #include <asm/elf.h>
>  #include <asm/cpufeature.h>
>  #include <asm/cpu_ops.h>
> @@ -311,7 +311,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
>  	 * IRQ and FIQ will be unmasked after the root irqchip has been
>  	 * detected and initialized.
>  	 */
> -	local_daif_restore(DAIF_PROCCTX_NOIRQ);
> +	local_exceptions_cpu_init_mask(NOIRQ_CONTEXT);

Although end result we get is what we want it is not quite
right. First of all NOIRQ_CONTEXT is wrong here since what we really
want here is NONMI_CONTEXT. Secondly, the reason we still get what we
want is not obvious and applies to local_daif_restore() as well - this
code runs before CPU feature discovery, so both helpers cannot do
anything other than updating DAIF.

Interestingly that for boot CPU we build exception state step by step:

 - we start with DAIF (and ALLINT) masked
 
 - unmask DA in setup_arch() so we get daIF (ALLINT still masked)

 - later in smp_prepare_boot_cpu() once boot CPU features are
   discovered we update PMR

 - finally we re-sync the state, allowing pseudo-NMI (and I think it is
   where we should unmask ALLINT), in initIRQ()

Note that for secondary CPUs we are taking different path:

 - we start with DAIF (and ALLINT) masked

 - secondary_start_kernel() updates PMR

 - we unmask DAIF (and I think it is where we should unmask ALLINT) in
   secondary_start_kernel().

So, I'm inclining adding extra changes to make it clear:

- switch to direct DAIF write (plus updating the comment explaining
  gradual build of exception state) in setup_arch()

- once arm64_debug_exc_context() is available add exception state
  checks in init_IRQ() (we expect to arrive there in NONMI_CONTEXT)
  and secondary_start_kernel() (we expect CRITICAL_CONTEXT before we
  transition to PROCESS_CONTEXT)

- that also implies that we cannot unmask ALLINT in CPU feature enable
  callback, so that callback would be removed and ALLINT would be
  unmasked in dedicated flows for boot CPU and secondary CPUs.

Cheers
Vladimir

