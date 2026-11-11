Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F155606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 00:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XzIK7ywr;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EDFP8ih8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J4oicOzhhzNrrESdfBNh/uYtU90CfHBxyRHjHAR9JIs=; b=XzIK7ywrRp1XmtPUaXUBEKHV+k
	2XDyqbQmXbuZfHBnHLv5hijs4yoV+gQ7rzVNJa7YQX9ZlWSSa2x80oCZni1++YXNHDrOy7yj6/isD
	Av3mGCA7H2xa0xXX+qemlP0c+zKV2vPjzJs5Nkuaon/2yF46BzDue8LfRGzw3HmUA/OIMVY02d7nJ
	yM9vw+B7ed4JEvIPBlFYehJyjCtGvyGQGyJaNhYiBPNEnJZGUZBwt8J9egXJ3q0NvxU6yuGRFd6lA
	wbyXBYNqSkY1MW+DgqzzOcvaWFY4rOG5dsugjPRHbqQn4nBx3H5cHzcao5cyZcB7ugSM1z7N1/hBs
	aaeBurcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQw6z-00000005IW6-3LII;
	Wed, 11 Nov 2026 00:22:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQw6u-00000005IVG-35bi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 00:22:48 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso15531205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 16:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794356562; x=1794961362; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4oicOzhhzNrrESdfBNh/uYtU90CfHBxyRHjHAR9JIs=;
        b=EDFP8ih8fJM3BxCp0hqWfOVC2HpJ/+oy0AX2sZnaCSqqn9NYFLOANl7Rh4j62J0lY7
         NnoCGJd4Gc1zaIlEb45mYpPTMU49OV2EK+l89JL0F3aWAg3VvGuQHJ42UXvSe2rM9CHj
         4bhgjg7IsTa/yJJxiexsANB2016bohGtgNdVTORsvJdMAgV9GetA4pqFW5knHa3VmEaK
         sYjZqZKBY/W5Uefrwzl1lzVW39Pgkv3R5xZ1cPGAE7iolnErD+zsHoW85PVSzQnz1SIJ
         Bdsz4YDAvzTq2LiB9IUTwCMSwBMBcrMljRyAfRnGghMvYUilZdXKqR3jhkJhBowj3XAF
         ETFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356562; x=1794961362;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4oicOzhhzNrrESdfBNh/uYtU90CfHBxyRHjHAR9JIs=;
        b=BZqnlb+6kswrNYSY/ikywlnZ0WYrTJQpvDEyjGtqBPT0YiB1VAjRuGF5soCCAwwSsJ
         OVBm5Ij76QsqZWdPr27GOiElD4QHcMEugS1TQzc/C/dprEjvjvPoqVLwmaLBI5xLoQMr
         FEpuKAykM5yzyczRkERXI8NyeHAe49Xx1cAL6hQ1UKCuCeH/q2xHUj+EXwOIU1CMtwBi
         +NJwxWRLy4Ev/0Nhh3W2/SEVlPtL8+NDSKF1Ldj/lqhr/54b8i/lAe1hFvZ2rAOxcRyu
         IU6X+7++1RT9P6n/EwSv/Isf68cYcThxgNwX+6s9aCHSLpMoFk1xaG7Cxus4VlPJZisy
         d1KA==
X-Forwarded-Encrypted: i=1; AL+hErEO3IGG31/X7oph9HiBOysY8iXnO4e2Hr/hTS68JG2apyrvDqOqp4u7orCg5YDRFqWyr2J2H9/YQ4VpMSCprtPA@lists.infradead.org
X-Gm-Message-State: APuU4Z++kLInlji4hSi6znMGm3ho4j9wQniBqT5TCnardQidMJcbLrR9
	3NXPYvOlJiWBpuutrUXi1ODngNlDMvOKbKjzsIMVp8FixwZI6KqrI2UCYLBPhhIYLFM=
X-Gm-Gg: AYBFou2pX/6C7a1FjcGJ610+tQckdon0vM+ICUhYCkkobPJDhjwDcjchmiNznFQoEAB
	/JSGdPE78f1yqkbISZRr/RT4WaX6a9HRmXCr40R9lnic6tfFmIh+p6Nu6RwjvH5wIbJW2TV7Ntw
	YcIQ83HTwNCCYnlkrxAjQCYqnB4MbPohuxRcbu6IpqmnCj0dQkGxHKZGYzStUmTpqs1dTn24qjP
	zuEmXH8FeTrArp5ivjBLiZqkiZLA4kw11zuGhisXqEVpBdek5ImbHVggo+4Dy3mSCAujGJWjw/N
	zcMtCpuHSi5pkNE2Zv+IDHN6u4EQfTF3VJatJWDAYzLZyk/TfJ7l9UaNq7ncm6Ynh6+NmJI1Trl
	y9WTu2Sc0+GhivJ2WgsivddoXqAZBEM3KPQ6E7FLpEh4x/UMsBWC+VXNGAQHCg7sMMZLmgeqnR6
	ltHjQW0l7AGyKhaZcdvMRi/JDPte5SR7qCtp3rIIYmG/oa9Brkih3pIVEkF/xeTROsrFYdAkJm7
	g0UPjsHMIpfjOcXVaJAxrbd/Q7OCDqLRLQjvpBClaeXJ/ZnZoK/o86Fdk91mAh2Qrtqof1y/LwC
	Iixl2FSRLQYU4T71mN0jd57W
X-Received: by 2002:a17:903:b47:b0:2e9:3395:cca8 with SMTP id d9443c01a7336-2edd7a4638dmr8404065ad.46.1794356562384;
        Tue, 10 Nov 2026 16:22:42 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2edb6a4234csm14094595ad.10.2026.11.10.16.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:22:40 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, rogerq@kernel.org, tony@atomide.com,
 linux@armlinux.org.uk, andi.shyti@kernel.org, thomas.richard@bootlin.com,
 wsa+renesas@sang-engineering.com, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ARM: OMAP2+: fix omap_device with noirq_suspend
In-Reply-To: <20261110211531.679943-1-andreas@kemnade.info>
References: <20261110211531.679943-1-andreas@kemnade.info>
Date: Tue, 10 Nov 2026 16:22:39 -0800
Message-ID: <7hwlqktdww.fsf@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_162244_798664_D9FC2AF5 
X-CRM114-Status: GOOD (  19.94  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Andreas Kemnade <andreas@kemnade.info> writes:

> Fixes cases where device runtime gets resumed in _suspend but then
> pm_runtime_force_suspend is used.  So the device is disabled, but runtime
> active in _noirq_suspend leading to duplicate runtime_suspend calls. So
> rather check for the device state directly to indicate if changes are
> needed.
> This relies on pm_runtime_force_resume being used in a balanced way.
>
> Fixes: 7da7fd7e66ac9 ("i2c: omap: wakeup the controller during suspend() callback")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> This really needs intensive scrutiny but might be a less invasive patch
> solution better suited for stable and paves the way to get out of the
> omap_device theatre without too much hurry.

This looks & feels correct to me.

I also tested this (along with my WIP patch for that NEON count
mismatch) and I have a very stable suspend/resume on OMAP3.

I tested on omap3-beagle (retention) and omap3-beagle-xm (off-mode) and
both are now reliable across multiple suspend/resume sequences with
these two patches.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin

>  arch/arm/mach-omap2/omap_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
> index 77a75b0b9ae69..52afc9089a5a0 100644
> --- a/arch/arm/mach-omap2/omap_device.c
> +++ b/arch/arm/mach-omap2/omap_device.c
> @@ -393,7 +393,7 @@ static int _od_suspend_noirq(struct device *dev)
>  
>  	ret = pm_generic_suspend_noirq(dev);
>  
> -	if (!ret && !pm_runtime_status_suspended(dev)) {
> +	if (!ret && (od->_state == OMAP_DEVICE_STATE_ENABLED)) {
>  		if (pm_generic_runtime_suspend(dev) == 0) {
>  			omap_device_idle(pdev);
>  			od->flags |= OMAP_DEVICE_SUSPENDED;
> -- 
> 2.47.3

