Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0913C606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 22:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jNLXm+NR;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=yw0/XLxK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vdmEB9hxIyAN0h7tY4BnByy/5E+TrrNwykX7GIFe6RY=; b=jNLXm+NRfP8qft
	T5MT0AyjUlODwNhOtMPOnyQpvZ3GWprewrlkq6hCP84YRuW1Hn3JLoPawPGYHHJKHbcKWytAXlXhX
	RRMiPWAVvjAZtxXbfE9vCd0u070fC62QtbehBh/BQKwswV1JYc55YNUMt1ELn3KU/StGj4TIiqRXZ
	DaY04UGaj3QhFsLlc6ck9z/Qr21Q8q4np+BUuLgf37FAjBu2F5xdNDPASvmfyi+PJfkB+3iUrLSz6
	RCIrIcSfOIEfuAgSsb0HPCti460E/B2D9h2hO+gtCnuHnaB1g1m/COPmQ75caAc2u+ZLILsThjXr1
	xaMIjJj6znonvhb3/JLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzQ5-0000000EerD-44IU;
	Fri, 13 Nov 2026 22:06:54 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzQ4-0000000EeqL-06hz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 22:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=vdmEB9hxIyAN0h7tY4BnByy/5E+TrrNwykX7GIFe6RY=; t=1794607611; x=1795817211; 
	b=yw0/XLxK6g0LIH0wQI0KRy9KaPxvsyrw3QXtKFeV0VqymRW/+21RGk7CLTykYzgNcZI5wosMLW6
	sndbZ0C54mDVeS1fokgfi2wUZ0H94GhN1LYeRrxsk0brmRY6MyH4rPkHtWwMcqp0i4+U4O4RHdpp4
	9OLhBsVxSE3S8WhJ/2P5Gt45anhS5y9Rxx8R60bLmqMkZArknkv9dki5djYlE2kNMKWLDhOSvbsVi
	G0A9QEbdpb5UiPnELTVTr1h9TXpNzpOYPp66xCDd3WedLD0/tlrwW00dK215aRe5CD/kFLQa43/9x
	TKMxyEb7ehDh0we9+C2/BgBQeyxO891zYnDQ==;
Date: Fri, 13 Nov 2026 23:06:44 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: linux-omap@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Roger
 Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: OMAP2+: pm34xx: add NEON wakeup dependency before
 clockdomain idle
Message-ID: <20261113230644.237c39ed@kemnade.info>
In-Reply-To: <20261113-wip-omap3-vfp-neon-mismatch-v1-1-3f6f67b25251@baylibre.com>
References: <20261113-wip-omap3-vfp-neon-mismatch-v1-1-3f6f67b25251@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_140652_077509_9F5A3F8F 
X-CRM114-Status: GOOD (  22.57  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 10:11:05 -0800
"Kevin Hilman (TI)" <khilman@baylibre.com> wrote:

> On OMAP3630 (BeagleBoard-xM), about one boot in three dies early when
> a context switch touches the VFP, which traps as undefined.
> 
> The VFP is unreachable because NEON is powered off while the MPU runs.
> omap3_pm_init() sets NEON's next state to OFF/RET and lets all
> clockdomains idle before it adds the NEON -> MPU wakeup dependency, so
> NEON can power down immediately and stay off until the MPU next idles.
> This was visible in pm_debug, which showed neon_pwrdm OFF:1 while
> mpu_pwrdm OFF:0.
> 
> Add the wakeup dependency before the clockdomains are allowed to idle.
> 
> Tested on omap3-beagle-xm: 6/17 boots crashed before, none of 25 after;
> also ran 50 suspend/resume cycles each on omap3-beagle and -xm.
> 
> Fixes: fa3c2a4fc99f ("OMAP3: PM: handle PER/NEON/CORE in idle")
> Reported-by: Andreas Kemnade <andreas@kemnade.info>
> Closes: https://lore.kernel.org/r/20261028212302.75ec622e@kemnade.info
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>

survived a git bisect + several other boots on GTA04. (tested the identical
change in a comment before)

Tested-by: Andreas Kemnade <andreas@kemnade.info> # GTA04
> ---
> This patch combined with an omap_device fix from Andreas makes OMAP3
> very stable on suspend/resume, including off-mode for OMAP3630.
> c.f. https://lore.kernel.org/r/20261110211531.679943-1-andreas@kemnade.info
> ---
>  arch/arm/mach-omap2/pm34xx.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/pm34xx.c b/arch/arm/mach-omap2/pm34xx.c
> index 9992549c7336..d11967c2f4bf 100644
> --- a/arch/arm/mach-omap2/pm34xx.c
> +++ b/arch/arm/mach-omap2/pm34xx.c
> @@ -510,6 +510,20 @@ int __init omap3_pm_init(void)
>  		goto err3;
>  	}
>  
> +	neon_clkdm = clkdm_lookup("neon_clkdm");
> +	mpu_clkdm = clkdm_lookup("mpu_clkdm");
> +	per_clkdm = clkdm_lookup("per_clkdm");
> +	wkup_clkdm = clkdm_lookup("wkup_clkdm");
> +
> +	/*
> +	 * Add the NEON wakeup dependency on the MPU before the clockdomains
> +	 * are allowed to idle: once pwrdms_setup() has programmed NEON's next
> +	 * state to OFF/RET, an idle NEON clockdomain otherwise lets NEON power
> +	 * down while the MPU keeps running, and VFP instructions then trap as
> +	 * undefined until NEON is woken.
> +	 */
> +	clkdm_add_wkdep(neon_clkdm, mpu_clkdm);
> +
>  	(void) clkdm_for_each(omap_pm_clkdms_setup, NULL);
>  
>  	mpu_pwrdm = pwrdm_lookup("mpu_pwrdm");
> @@ -523,11 +537,6 @@ int __init omap3_pm_init(void)
>  	per_pwrdm = pwrdm_lookup("per_pwrdm");
>  	core_pwrdm = pwrdm_lookup("core_pwrdm");
>  
> -	neon_clkdm = clkdm_lookup("neon_clkdm");
> -	mpu_clkdm = clkdm_lookup("mpu_clkdm");
> -	per_clkdm = clkdm_lookup("per_clkdm");
> -	wkup_clkdm = clkdm_lookup("wkup_clkdm");
> -
>  	omap_common_suspend_init(omap3_pm_suspend);
>  
>  	arm_pm_idle = omap3_pm_idle;
> @@ -562,7 +571,6 @@ int __init omap3_pm_init(void)
>  	if (IS_PM34XX_ERRATUM(PM_PER_MEMORIES_ERRATUM_i582))
>  		clkdm_add_wkdep(per_clkdm, wkup_clkdm);
>  
> -	clkdm_add_wkdep(neon_clkdm, mpu_clkdm);
>  	if (omap_type() != OMAP2_DEVICE_TYPE_GP) {
>  		omap3_secure_ram_storage =
>  			kmalloc(OMAP3_SAVE_SECURE_RAM_SZ, GFP_KERNEL);
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261113-wip-omap3-vfp-neon-mismatch-ae585c1e8fe0
> 
> Best regards,
> --  
> Kevin Hilman (TI) <khilman@baylibre.com>
> 
> 


