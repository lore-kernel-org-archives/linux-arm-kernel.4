Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FAE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ow3KoUot;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XMZDjw8K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C/nooMgmJG/3mp0rQ1JdOcq7TiihZwhR9+Lq4gd1ZqA=; b=ow3KoUot/CeeKV
	Eru+5Qc858/MsPuYtNdBysrTiRnoHq/UE7gR7QCQEi7AaOKK78mKzn6Nua82fW/H3V2fh4wnhTLX8
	xgUw1ZAitPvO2aZFSW6lpZh/YsFBEhqHJ9VvuLSJBAdFCAOgX0Lobc3VxtSugtbH+BYVVq5mY7hqI
	/GtAXKoDreKmAJizG7RSkV2ligUVG8zyuJCDxh2m4kHI2J9rXMSMIyohHmbDW15pldZumW+Fpj9hZ
	e4hFfj5Q+x7Qws1Kz9lo/dRZOZigT1nfIjwom2uAvDO720SIOI/py+RfgtTx/O0cSzBDfGsOKH0pA
	eRm/iX0NYH8bo+dP8ElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8d7-00000006rbF-27wl;
	Wed, 11 Nov 2026 13:44:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8d4-00000006raW-3isT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:44:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 841C31576;
	Wed, 11 Nov 2026 05:44:41 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC9EA3F673;
	Wed, 11 Nov 2026 05:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794404684; bh=w2VNZqXDGorpHrLLSd9Lolnep92uG7Tj6Jtn26G8qZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XMZDjw8KwZgkZXf/BmInpGUc/Nu/+rD12k7JhOUze6J6Xxre4SfOdq5WVwxjfiWTa
	 9/eDyVHQTNWpHi+d18HTtRra8Hh3YqU0K4XAOeQV5OSptnSeNSVquJujUod3s+tLxQ
	 jSMziHEiA/pMBzLCDPi5kiv7vPRnqrAFnAB9u5XQ=
Message-ID: <282608f5-a13b-4695-aa17-f834bf5d8272@arm.com>
Date: Wed, 11 Nov 2026 13:44:40 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: suspend: Save GCS state over suspend
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261105-arm64-fix-sysreg-suspend-v1-0-f4d9a99fec46@kernel.org>
 <20261105-arm64-fix-sysreg-suspend-v1-2-f4d9a99fec46@kernel.org>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261105-arm64-fix-sysreg-suspend-v1-2-f4d9a99fec46@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_054446_976123_86E4FCEA 
X-CRM114-Status: GOOD (  17.69  )
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
> GCSCRE0_EL1 and GCSPR_EL0 are live registers for EL0 on systems with GCS
> but are not saved and restored by cpu_do_suspend()/cpu_do_resume(). This
> means that the task that initiated suspend can return to userspace with
> UNKNOWN or incorrect values for GCSPR_EL0 and GCSCRE0_EL1 (many fields
> in GCSCRE0_EL1 reset to 0).  This will in turn lead to ongoing
> corruption, including not restoring mode until a task with a different
> GCS mode is run.  Fix this by saving and restoring the values over
> suspend.
> 
> This increases the size of struct cpu_suspend_ctx by 16 bytes.
> 
> Fixes: 5d8b172e7005 ("arm64: Add Kconfig for Guarded Control Stack (GCS)")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/include/asm/suspend.h |  2 +-
>  arch/arm64/mm/proc.S             | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
> index eb9ce315f146..8e9c97aab15a 100644
> --- a/arch/arm64/include/asm/suspend.h
> +++ b/arch/arm64/include/asm/suspend.h
> @@ -2,7 +2,7 @@
>  #ifndef __ASM_SUSPEND_H
>  #define __ASM_SUSPEND_H
>  
> -#define NR_CTX_REGS 16
> +#define NR_CTX_REGS 18
>  #define NR_CALLEE_SAVED_REGS 12
>  
>  /*
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 664ea9e3b9ad..99aacf03367d 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -121,6 +121,12 @@ alternative_else_nop_endif
>  alternative_if ARM64_HAS_S1POE
>  	mrs	x2, REG_POR_EL0
>  	str	x2, [x0, #120]
> +alternative_else_nop_endif
> +alternative_if ARM64_HAS_GCS
> +	mrs	x2, REG_GCSPR_EL0
> +	str	x2, [x0, #128]
> +	mrs	x2, REG_GCSCRE0_EL1
> +	str	x2, [x0, #136]

Have you considered using stp?

>  alternative_else_nop_endif
>  	ret
>  SYM_FUNC_END(cpu_do_suspend)
> @@ -168,6 +174,12 @@ alternative_if ARM64_HAS_S1POE
>  	ldr	x2, [x0, #120]
>  	msr	REG_POR_EL0, x2
>  alternative_else_nop_endif
> +alternative_if ARM64_HAS_GCS
> +	ldr	x2, [x0, #128]
> +	msr	REG_GCSPR_EL0, x2
> +	ldr	x2, [x0, #136]
> +	msr	REG_GCSCRE0_EL1, x2

Have you considered using ldp?


Cheers
Vladimir

