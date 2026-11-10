Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008FE606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=awnNRjo6;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=6isnN9nb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c7+UI0GUfDbfLEtSpboSlipdO1srQg2d508IiAHDWDw=; b=awnNRjo6UpufVS
	XqGOSbpYeMyf8w3w7EOvs7k7VMPomgOOQIAOYibhJjIhsH4iLUfOOfujEmcHes8k3kXv4Pn0WWEDb
	pQZHKhkpIFSHnjQsqE5HyADh3CL/FFFtU+/Ub9aTXqrgcHInkCc4uztvLMnWWb1AaStduZ3gdN1LC
	7oMHpBKeED3qXsrqoVPVEcikVWnYl0Sob0QO+0dlwOPyAcSCZDxGRT8qt7Lq3IsZYgAi4n5qH88e7
	Of8HHfqz9jmYjKCWKvxheoiPbQkNc1Q7t/7RcXQxmrG7k31/p3VPeAScV6GCGUc75j8GTXCS9ykuq
	VTp5QvF0tRUI9pz5yeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsNj-00000004yKN-1dk2;
	Tue, 10 Nov 2026 20:23:51 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsNg-00000004yJk-1eR4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 20:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=c7+UI0GUfDbfLEtSpboSlipdO1srQg2d508IiAHDWDw=; t=1794342228; x=1795551828; 
	b=6isnN9nbYYJXl8soryzi08gvacAQAh47qK28aammGnezdth5s2TVA6leDb8yrMc2CQ4Xt7Iy6m+
	kDkKgVSNLihQTKAnosmNgBeyaArAV+xQlsx4teQuWPtKMYSzskpbLEA/x+bgByl4eOvIr/KPOgBeX
	kgElj5AcjCzB9Z6DvMX889qjf5O2vWQsc8/8qW+62jirCAOwzf3lbD6Eiu9VpndEn+eK2OgDpYBpl
	aKU3PmdYRJit3FuFm2YqFZFLbz/Am/CnaZ5cZaEbgpLFeIKcAecl8ESIUkXfUs53VKwNM5Ou5CJGS
	ixKfD1Tl458vtN+FCN1Y37Khg/+jwpYwNcUA==;
Date: Tue, 10 Nov 2026 21:23:06 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, absicsz@gmail.com
Subject: Re: [PATCH 1/2] ARM: omap: cpuidle34xx: balance cpu_pm_enter/exit()
Message-ID: <20261110212306.39327765@kemnade.info>
In-Reply-To: <7ha4ngv55s.fsf@baylibre.com>
References: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
	<20261028-susp2-v1-1-174b52857d89@kemnade.info>
	<20261028212302.75ec622e@kemnade.info>
	<7ha4ngv55s.fsf@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_122348_443373_491C6808 
X-CRM114-Status: GOOD (  34.06  )
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

On Tue, 10 Nov 2026 11:48:47 -0800
Kevin Hilman <khilman@baylibre.com> wrote:

> Andreas Kemnade <andreas@kemnade.info> writes:
> 
> > On Wed, 28 Oct 2026 20:15:11 +0100
> > Andreas Kemnade <andreas@kemnade.info> wrote:
> >  
> >> These calls are usually done in a balanced way, so allow notifiers to
> >> assume that these calls are balanced under all circumstances.
> >> Seen some spurios vfp issues probably connected to this.
> >> 
> >> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>  
> >
> > Looked again at some discussions with Sicelo testing such things:
> > He had observed a NEON off count 1 but MPU 0 in /sys/kernel/debug/pm_debug/count.
> > Probably more involved, but lets not freak out things here.
> > So that is definitively a real problem fixed by this. vfp_pm_resume()
> > would not be called to restore the state without a patch like this.
> >
> > So this is
> >
> > Fixes: 1cd96478cf150 ("ARM: OMAP3xxx: CPUIdle: optimize __omap3_enter_idle()")  
> 
> Even with this fix, I found on OMAP3 (beagle and beagle-xm) that there
> are still intermittent failures, and the NEON vs. MPU count mismatch was
> a good indicator to dig a little deeper.
> 
There seem to be different problems, cases where MPU sticks to INA
but does not go OFF (reported on N900), and that spurios vfp crash
I have seen on the GTA04.

> I think the fix here is to add the neon_clkdm -> mpu_clkdm wakeup
> dependency before the clockdomains are allowed to idle.  Otherwise NEON
> could idle immediately.
> 
sound same. I also looked at the wakeup dep, but only in the running system.

> With the patch below, I don't see any intermittent VFP crashes anymore
> with early testing.
> 
Thanks for that patch.

Then this ordeal comes to an end, I first thought that these are hw
issues. But then maybe it is time to reinit my automatic testing stuff.

> I'm still doing a few more tests, but will sent a proper patch with
> changelog after some more testing.
>
I will do that too. And then time to do some bisect to catch some omapdrm
bug. 8250_DMA also smells.

Regards,
Andreas
 
> Kevin
> 
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
> 
> 
> 


