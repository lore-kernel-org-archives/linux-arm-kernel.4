Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72AF606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Omry+k9z;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YV0jBzAA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GQKJXNTQW9v+01dsyTFFERDStZLJXqLVmjUwVOCY3Dw=; b=Omry+k9zT8Gj5V
	gXO12ua3c+o5XDlfEiLfmMW1QeS6+J1nnKKgQBlWinKcgDHy5QobXin960cMrB+YEQAkzlevZOrOG
	QDdi1tIUo9N6mxPvy93pmsRZdyITvOMsw0IjQHwqw1W1dNTOjH4eODb271RlfAf4qMpoMr2/Z8RyO
	+nP5MZPbVHGrL55bGxUJyiMoPqGyhIlFRlmt9gWb3lS2qGf9vV0O/pjCWuAfc30+UNiwSXf6cLigG
	SAgOS9ZdjPBS5uQrRWI0sthJQgNbIy0n/A8qe/nHkQFJ3aWItoG0d3nZXrv8ylK9c8bx/+I66Xw2h
	3QhKm42WKJ4QFOw1Jp+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8SI-00000006pDn-2Jiy;
	Wed, 11 Nov 2026 13:33:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8SE-00000006pDH-1Hb4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:33:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72D591576;
	Wed, 11 Nov 2026 05:33:28 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2BA83F673;
	Wed, 11 Nov 2026 05:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794404011; bh=o3tyiYm4DJAr6V2NiisE1PtJ+Fj0j7GWcQIp093iIn0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YV0jBzAAJbiQ8M0NjHzMqF97YbOZ3nYwy8vmXccgy0CldPbNLNEaY73UEUCDryope
	 rPRlrP0y8fD6ryfLpFYfFnS9/OeVK2Ws8ikjIalXF75XRMgVfaJzeKdH6ZXPc2fxPw
	 R6gHqC2gvutG1voSrqleT0of6OOEw2YW2T41ardY=
Message-ID: <3479391a-ec0f-46a8-9384-ec084017d344@arm.com>
Date: Wed, 11 Nov 2026 13:33:27 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: suspend: Save POR_EL0 over suspend
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261105-arm64-fix-sysreg-suspend-v1-0-f4d9a99fec46@kernel.org>
 <20261105-arm64-fix-sysreg-suspend-v1-1-f4d9a99fec46@kernel.org>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261105-arm64-fix-sysreg-suspend-v1-1-f4d9a99fec46@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_053334_417834_3E7ED105 
X-CRM114-Status: GOOD (  18.06  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 16:05, Mark Brown wrote:
> POR_EL0 is a live EL0 register on systems with S1POE but it is not saved
> and restored by cpu_do_suspend()/cpu_do_resume(). This means that the task
> that initiated suspend can return to userspace with an UNKNOWN value. Fix
> this by saving and restoring the value over suspend.
> 
> This increases the size of struct cpu_suspend_ctx.

This seems to be implied since we need storage to keep register value, no?

> 
> Fixes: bf83dae90fbc ("arm64: enable the Permission Overlay Extension for EL0")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/include/asm/suspend.h | 2 +-
>  arch/arm64/mm/proc.S             | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
> index a5abf0615594..eb9ce315f146 100644
> --- a/arch/arm64/include/asm/suspend.h
> +++ b/arch/arm64/include/asm/suspend.h
> @@ -2,7 +2,7 @@
>  #ifndef __ASM_SUSPEND_H
>  #define __ASM_SUSPEND_H
>  
> -#define NR_CTX_REGS 15
> +#define NR_CTX_REGS 16
>  #define NR_CALLEE_SAVED_REGS 12
>  
>  /*
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index b1516630904d..664ea9e3b9ad 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -117,6 +117,10 @@ alternative_else_nop_endif
>  alternative_if ARM64_SME
>  	mrs_s	x2, SYS_TPIDR2_EL0
>  	str	x2, [x0, #112]
> +alternative_else_nop_endif
> +alternative_if ARM64_HAS_S1POE
> +	mrs	x2, REG_POR_EL0
> +	str	x2, [x0, #120]
>  alternative_else_nop_endif
>  	ret
>  SYM_FUNC_END(cpu_do_suspend)
> @@ -160,6 +164,10 @@ alternative_if ARM64_SME
>  	ldr	x2, [x0, #112]
>  	msr_s	SYS_TPIDR2_EL0, x2
>  alternative_else_nop_endif
> +alternative_if ARM64_HAS_S1POE
> +	ldr	x2, [x0, #120]
> +	msr	REG_POR_EL0, x2
> +alternative_else_nop_endif
>  
>  	msr	sctlr_el1, x12
>  	set_this_cpu_offset x13
> 
> -- 2.47.3
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

