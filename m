Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B80606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HZm1VcD8;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=u8C6HlpO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fMIYl75aZu7vrGQvT2vVO2us1bwVx5ztzHE8ICinsSc=; b=HZm1VcD8LfAWH1
	vh/bX1LMypK9pi+bu3iViBUMMQfSZkukZbUkWPptciu3jtXdzjZQRDWLj/u+F27EqAyXFTKcf/kmZ
	8FKnAyl+0j+cnryTJpN1G5O8z66Evah7dGpWi5mvCIONxYV+NzYHExYjCr2YD6cl0qYB5VkIUbVmj
	/c6ji2xc/ROLnUWLRcOp81ywCpLWjOg9qhNXqQKJ5Yd0TRJl5cF2GVPcZm5aQTczERweiRkqTIBuw
	ot9WBgHR4r6tWsTTbG6igdQmWlBScHywdT+8ekm1E99SaJ79noZ4bijWQIn/OBJEqpz1vKX/oK2EF
	RFTwj7BAwek7l10jnzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcRA-00000008TDF-3NWB;
	Wed, 18 Nov 2026 09:58:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcR8-00000008TCr-0Gj8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:58:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 094991596;
	Wed, 18 Nov 2026 01:58:36 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3AB03F673;
	Wed, 18 Nov 2026 01:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794995918; bh=TABkyzRDh8je8alNY8PpqIpwdxSTGCUGrmil5Y9DvPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u8C6HlpOlYHwe4Wb68OnPYyW96TJkAbEjRxjwxYwQMNdgxkF7Ilr+2RVrUoWUhRzv
	 JpqkgRZ1HYh0dsGylGeAzFWpHtxsM7nHut5EFSPjYRLFLqcFzXz1sOpC54b5czkDOZ
	 eUsNG3ydx9ZFkvt7zuWmkbTlV7G3KEUsA8A4FRKA=
Message-ID: <628b2774-30bc-4399-98c3-2d99ad5090b6@arm.com>
Date: Wed, 18 Nov 2026 09:58:34 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: entry: sdei: save and restore PMR for
 pseudo-NMI
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Kiryl Shutsemau <kas@kernel.org>,
 Breno Leitao <leitao@debian.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Doug Anderson <dianders@chromium.org>, Linus Walleij <linusw@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Huth <thuth@redhat.com>,
 Dawei Li <dawei.li@linux.dev>, mrigendrachaubey
 <mrigendra.chaubey@gmail.com>, kernel-team@meta.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261117174814.95936-1-ada.coupriediaz@arm.com>
 <20261117174814.95936-3-ada.coupriediaz@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261117174814.95936-3-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_015842_197375_584EB67D 
X-CRM114-Status: GOOD (  23.55  )
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

Hi Ada,

On 11/17/26 17:48, Ada Couprie Diaz wrote:
> If using pseudo-NMI, PMR must be saved and restored on exception
> entry/exit. We do so, and set it to a known value reflecting that DAIF
> is masking all interrupts, in the regular entry path.
> 
> Do the same for SDEI, as it can interrupt the kernel at any point
> and does not mandate firmware to touch PMR, but does mandate masking DAIF.
> This avoids potentially returning with a different PMR than interrupted,
> and SDEI having the DAIF/PMR pair in a unexpected state compared to
> the rest of the kernel.
> 

I think we need to save/restore PMR into/from pt_regs similarly to regular
entry path, otherwise regs_irqs_disabled() is still broken, like it was
pointed in the thread [1] (and Sashiko has raised the same concern on
FEAT_NMI series)

Cheers
Vladimir

[1] https://lore.kernel.org/all/auzM-l40BLsT3clg@arm.com/

> Fixes: 133d05186325 ("arm64: Make PMR part of task context")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/kernel/entry-common.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index cb122163a68d..17a14c55532c 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -1041,7 +1041,7 @@ asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
>  asmlinkage noinstr unsigned long
>  __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
>  {
> -	unsigned long elr, spsr, esr, far, vbar;
> +	unsigned long pmr, elr, spsr, esr, far, vbar;
>  	irqentry_state_t state;
>  	unsigned long ret;
>  
> @@ -1067,6 +1067,16 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
>  	else if (cpu_has_pan())
>  		set_pstate_pan(0);
>  
> +	/*
> +	 * Regular kernel entry saves and resets the PMR to align with DAIF,
> +	 * but __sdei_asm_handler() does not ; do it now.
> +	 */
> +	if (system_uses_irq_prio_masking()) {
> +		pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
> +		write_sysreg_s(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET,
> +				SYS_ICC_PMR_EL1);
> +	}
> +
>  	/*
>  	 * Nothing saved the interrupted context's exception registers on the
>  	 * way in, and it may be in the middle of exception entry or return
> @@ -1110,6 +1120,9 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
>  	write_sysreg(far, far_el1);
>  	write_sysreg(vbar, vbar_el1);
>  
> +	if (system_uses_irq_prio_masking())
> +		write_sysreg_s(pmr, SYS_ICC_PMR_EL1);
> +
>  	return ret;
>  }
>  #endif /* CONFIG_ARM_SDE_INTERFACE */
> -- 2.43.0
> 


