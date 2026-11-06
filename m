Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597B0606D805
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vEFbnf4m;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sVAFxjo3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sVfAXVYZ6FXAyGhrwa2GYGqDIM1fZELZB/+nyD7WsYo=; b=vEFbnf4mjbkAtfFCC10o9cn4kK
	MihkThtNdMFFE3WTEVrP2zngj8xAmWKAlTXcLWj1jytCSuRbQd3lrmvOanDy+GLVWS1SQUr8S+dLv
	tWubCsQ9KF+jJoltWRP/NnVlEPHseKZQxXNCF2QYIHfvVEJrjPS4rO7MO8REQqhS95t4q5QQh584E
	qRr/sCmqaLMWuwi3Y8lcRZYvK121svoQTKovoSioLY20yj1C7DWWxduoQPYqcOQRTGNknrxHiCb0r
	oaknrGqXKnu7SPD7dt9mSxSrvvOXfKvhL/d3vg4EtdX0FIJujmAxlHw2oGvpyMuLprYuG+97OpI+L
	V5WzsDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMax-0000000D0jE-0Kng;
	Fri, 06 Nov 2026 16:15:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMau-0000000D0hk-2dYc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:15:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85702143D;
	Fri,  6 Nov 2026 08:15:06 -0800 (PST)
Received: from [10.2.213.24] (e137867.arm.com [10.2.213.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01B1E3F673;
	Fri,  6 Nov 2026 08:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793981709; bh=IQ3sgomSiBn9gKzrzkAyQrVz3yw2Rr15QPLg09Ba0Ec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sVAFxjo38ELex2XbmZkIS1mAV1VYURD8Ona57+AktCEEwLskVfJZUuxu2N8T7MXY6
	 8X2PYWYpvfi41yClUaZl4MyK5hSGCA2d/d/g5GMAvllrNAQJXemnhWZ1qOmdSyLVuR
	 CRKaR5f8Xa7TeLY4e0CHDNv2YWThOD02s62PxpcI=
Message-ID: <1bae50ad-a65e-4ccb-b247-8d9544e4c5ee@arm.com>
Date: Fri, 6 Nov 2026 16:14:56 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: sdei: Run the event handler on the kernel
 vectors
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>,
 Usama Arif <usama.arif@linux.dev>
References: <20261105120835.3321912-1-kirill@shutemov.name>
 <20261105120835.3321912-2-kirill@shutemov.name>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20261105120835.3321912-2-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_081512_762711_2B5D341E 
X-CRM114-Status: GOOD (  36.52  )
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
Cc: "Kiryl Shutsemau \(Meta\)" <kas@kernel.org>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, mrigendrachaubey <mrigendra.chaubey@gmail.com>, linux-arm-kernel@lists.infradead.org, Breno Leitao <leitao@debian.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On 05/11/2026 12:08, Kiryl Shutsemau wrote:

> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> With KPTI, VBAR_EL1 holds the trampoline vectors from the return to EL0
> until the next exception from EL0 maps the kernel and installs the
> kernel vectors. The trampoline vectors only handle exceptions from EL0;
> their current-EL half is zero-filled.
>
> An SDEI event is dispatched regardless of PSTATE.DAIF, so it lands there
> whenever the CPU is in user space. The SDEI entry trampoline maps the
> kernel but leaves VBAR_EL1 alone. [...]

This quite broken indeed, thank you for sending a patch !

However, given this and Catalin's comment regarding PMR save/restore,
to me this sounds more like `arch/arm64/entry.S` is not doing its job
properly for SDEI events, rather than the SDEI handler missing something.

In fact, it appears that the SDEI trampoline misses a fair amount of
the "regular" kernel and trampoline entry in general, which might subtly
break more assumptions...

> [...]
>
> Install the kernel vectors in __sdei_handler() when VBAR_EL1 holds the
> trampoline vectors, and restore it before returning to firmware. [...]

Given that this is done in `entry.S` for a regular kernel entry,
I feel like this should be done there too for SDEI : bringing the two
paths closer rather than needing to do some additional special handling
in the handler.

`__sdei_asm_entry_trampoline` and `__sdei_asm_exit_trampoline` already
check if the CPU was running at EL0 and maps/unmaps the kernel accordingly.
We could swap VBAR to the EL1 vectors and back to the EL0 trampoline there...

> The IRQ-like resume into user space must still go through the
> trampoline to map the kernel. do_sdei_event() takes the interrupted
> VBAR_EL1 and keeps basing the resume address on it.

...and to maintain the expected behaviour on return, rather than using
VBAR (which would bypass the trampoline in the EL0 IRQ-like resume case),
we could explicitly choose the correct vector base for KPTI=on ?
Something along those lines in `do_sdei_event()` :

	/* KPTI=off => vectors or the appropriate mitigation, KPTI=on => trampoline */
	unsigned long vbar = __raw_this_cpu_read(this_cpu_vector)
	[...]
	/* KPTI=on => have to bypass unmapped EL1 exceptions of the trampoline vector */
	if (arm64_kernel_unmapped_at_el0() && mode == kernel_mode)
		vbar = vectors
	[...]
	if (mode == kernel_mode)
		return vbar + 0x280;
	else if (mode & PSR_MODE32_BIT)
		return vbar + 0x680;

	return vbar + 0x480;

> Fixes: 79e9aa59dc29 ("arm64: sdei: Add trampoline code for remapping the kernel")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>   arch/arm64/include/asm/sdei.h    |  3 ++-
>   arch/arm64/kernel/entry-common.c | 21 ++++++++++++++++++++-
>   arch/arm64/kernel/sdei.c         |  6 ++++--
>   3 files changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/include/asm/sdei.h b/arch/arm64/include/asm/sdei.h
> index b2248bd3cb58..a78a5337ff85 100644
> --- a/arch/arm64/include/asm/sdei.h
> +++ b/arch/arm64/include/asm/sdei.h
> @@ -44,7 +44,8 @@ asmlinkage unsigned long __sdei_handler(struct pt_regs *regs,
>   					struct sdei_registered_event *arg);
>   
>   unsigned long do_sdei_event(struct pt_regs *regs,
> -			    struct sdei_registered_event *arg);
> +			    struct sdei_registered_event *arg,
> +			    unsigned long vbar);
>   
>   unsigned long sdei_arch_get_entry_point(int conduit);
>   #define sdei_arch_get_entry_point(x)	sdei_arch_get_entry_point(x)
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 11d3f888fcd8..8a17e3720f81 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -31,6 +31,7 @@
>   #include <asm/stacktrace.h>
>   #include <asm/sysreg.h>
>   #include <asm/system_misc.h>
> +#include <asm/vectors.h>
>   
>   /*
>    * Where the context being returned to had an active percpu GPR critical
> @@ -1040,6 +1041,7 @@ asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
>   asmlinkage noinstr unsigned long
>   __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
>   {
> +	unsigned long vbar;
>   	irqentry_state_t state;
>   	unsigned long ret;
>   
> @@ -1065,10 +1067,27 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
>   	else if (cpu_has_pan())
>   		set_pstate_pan(0);
>   
> +	/*
> +	 * With KPTI, VBAR_EL1 holds the trampoline vectors from the return to
> +	 * EL0 until the next exception from EL0 maps the kernel. They only
> +	 * handle exceptions from EL0: an exception taken here would run their
> +	 * empty current-EL half and never come back. Switch to the kernel
> +	 * vectors. The IRQ-like resume keeps using the interrupted VBAR, so it
> +	 * still goes through the trampoline.
> +	 */
> +	vbar = read_sysreg(vbar_el1);
> +	if (arm64_kernel_unmapped_at_el0() &&
> +	    vbar == (unsigned long)__this_cpu_read(this_cpu_vector)) {
> +		write_sysreg((unsigned long)vectors, vbar_el1);
> +		isb();
> +	}
> +
>   	state = irqentry_nmi_enter(regs);
> -	ret = do_sdei_event(regs, arg);
> +	ret = do_sdei_event(regs, arg, vbar);
>   	irqentry_nmi_exit(regs, state);
>   
> +	write_sysreg(vbar, vbar_el1);
> +
>   	return ret;
>   }

With what I mentioned above, this would be completely replaced by the
changes in `entry.S`, with no change in `__sdei_handler()`.

>   #endif /* CONFIG_ARM_SDE_INTERFACE */
> diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
> index 778f2a1faac8..260c13106009 100644
> --- a/arch/arm64/kernel/sdei.c
> +++ b/arch/arm64/kernel/sdei.c
> @@ -200,16 +200,18 @@ unsigned long sdei_arch_get_entry_point(int conduit)
>    *  SDEI_EV_HANDLED -  success, return to the interrupted context.
>    *  SDEI_EV_FAILED  -  failure, return this error code to firmware.
>    *  virtual-address -  success, return to this address.
> + *
> + * vbar is the interrupted context's VBAR_EL1, for the IRQ-like resume.
>    */
>   unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
> -				      struct sdei_registered_event *arg)
> +				      struct sdei_registered_event *arg,
> +				      unsigned long vbar)
>   {
>   	u32 mode;
>   	int i, err = 0;
>   	int clobbered_registers = 4;
>   	u64 elr = read_sysreg(elr_el1);
>   	u32 kernel_mode = read_sysreg(CurrentEL) | 1;	/* +SPSel */
> -	unsigned long vbar = read_sysreg(vbar_el1);
>   
>   	if (arm64_kernel_unmapped_at_el0())
>   		clobbered_registers++;

And this part would be made more explicit as to what vector base
we should be jumping back to on return from firmware.


What are your thoughts ?
I understand that this is a completely different approach, but I feel it
would be more in line with what we already do for other entry paths.
This might even allow us to de-duplicate them in the future and reduce
the chance of this happening again.

If my suggestion is not sound, apart from what Catalin already mentioned
the patch looks good to me !

Kind regards,
Ada


