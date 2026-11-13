Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96B8606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BEAMnYjT;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Mt2h6zVq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gEmZYkKRuGStdrZ58CF2CeEnhOHYJIve1QUs7ePE6Q8=; b=BEAMnYjTVKfGtIN1kW0AfvNjHP
	T2Aij69+c60HXRDpJ3tFCXE/MjmF/jiisiUPuDGnfy7rD8V7V4SYNmdsfoutVh98J5CLCehx9dKsl
	BrNdXzcT7SwCnp1hwbd04/GERKBZxniwQoSMEst7oWXZ2qRCZnxEm1tS1WYqYxTu6/mjT7gIr/YJL
	vCt21BpuYa5IVqTgSowjgQf5vpw/lUpI9UHpVbN00Bi3qnExgPUUqxHtWp4V1aJHCZPZGWQ8DIsTP
	tvy3BOLcHupUFzz6yz15A/vy5h+v+P7OF3ji9JJN9Bs0DCaO6+kcSpMsAcwbmjRA3nNhSRf4ZCDtB
	pVhfqPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvwI-0000000DvLJ-1jBp;
	Fri, 13 Nov 2026 18:23:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvwE-0000000DvKW-1MDQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:23:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3313F143D;
	Fri, 13 Nov 2026 10:23:46 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C34D83F673;
	Fri, 13 Nov 2026 10:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794594229; bh=Uye60IuEv5YKw+O9A3I4dFufgEY3c8/N5h8UyJOLmU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mt2h6zVqGLFJ09H6KRxU3dWwcBUHVZ0UIrb2oB+psHtGR8Fgywu9/53rH37KaPtt9
	 OAIAwjxuiznfuOXIsODnqH8ROdqXBTWZ6/Y6KcsnL9CJ1wP6L8ITW4MzQcJq7vay23
	 b35sNlOniksb+h0Ij0p81WdnxukdtVy5qeDGUlm0=
Date: Fri, 13 Nov 2026 18:23:44 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: will@kernel.org, mark.rutland@arm.com, ardb@kernel.org, song@kernel.org,
	dylanbhatch@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: module: Use text-poke for late PLT/veneer
 emission
Message-ID: <avdVsAOC_fpoDNDr@arm.com>
References: <20261111073906.652400-1-qirui.001@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111073906.652400-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_102350_402570_D2C1326A 
X-CRM114-Status: GOOD (  19.55  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks Rui for respinning.

On Wed, Nov 11, 2026 at 03:39:06PM +0800, Rui Qi wrote:
> diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/module.h
> index fb9b88eebeb1..4a1a47f8ba1a 100644
> --- a/arch/arm64/include/asm/module.h
> +++ b/arch/arm64/include/asm/module.h
> @@ -6,6 +6,7 @@
>  #define __ASM_MODULE_H
>  
>  #include <asm-generic/module.h>
> +#include <asm/text-patching.h>
>  
>  struct mod_plt_sec {
>  	int			plt_shndx;
> @@ -29,6 +30,21 @@ u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
>  u64 module_emit_veneer_for_adrp(struct module *mod, Elf64_Shdr *sechdrs,
>  				void *loc, u64 val);
>  
> +/*
> + * Write a relocation value to @place within a module.  While the module
> + * is MODULE_STATE_UNFORMED the destination is writable and a direct store
> + * is used; once the module is fully formed the region is read-only and
> + * executable, so the write is routed through the text-poke API.
> + */
> +#define module_write_place(place, val, mod) do {			\
> +	__typeof__(*place) __val = (val);				\
> +									\
> +	if (mod->state == MODULE_STATE_UNFORMED)			\
> +		*(place) = __val;					\
> +	else								\
> +		aarch64_insn_copy(place, &(__val), sizeof(*place));	\
> +} while (0)

A nit here, I'd move this macro to asm/text-patching.h since
asm/module.h is pulled in by linux/module.h. Even better if you could
make this a function (either static inline or out of line).

> --- a/arch/arm64/kernel/module-plts.c
> +++ b/arch/arm64/kernel/module-plts.c
> @@ -76,11 +76,13 @@ u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
>  	int i = pltsec->plt_num_entries;
>  	int j = i - 1;
>  	u64 val = sym->st_value + rela->r_addend;
> +	struct plt_entry entry;
>  
>  	if (is_forbidden_offset_for_adrp(&plt[i].adrp))
>  		i++;
>  
> -	plt[i] = get_plt_entry(val, &plt[i]);
> +	entry = get_plt_entry(val, &plt[i]);
> +	module_write_place(&plt[i], entry, mod);

Sashiko reported PLT exhaustion/overrun and ADRP corruption when
relocations are reapplied after unloading and reloading a target module:

https://sashiko.dev/#/patchset/20261111073906.652400-1-qirui.001@bytedance.com

These look like existing problems, only exposed now because we no longer
get the ROX fault. I think they can be addressed in separate follow-up
patches. This patch still fixes the fault on the first application.

However, could we include a bounds check before writing the PLT entry,
maybe with a WARN_ON_ONCE? Once late writes use text-poke, retrying
after slot exhaustion can overwrite memory beyond .plt.

Thanks.

-- 
Catalin

