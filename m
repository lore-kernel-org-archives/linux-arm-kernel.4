Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A24606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pESMNP1X;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GyCzHvBW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FZwsc4vEEFoPSZcA9FrAm9Zjfu5lDJ7Cw08Uku6ESbo=; b=pESMNP1X9eo0WmtQTcKDZVj2FF
	5YGzJm9fFoCS4OdiXeLWV2AIiGmvVbu+2I/vrNYiRMlQKENoJLmgdFx4H8cdowdos54Dz5xTFmn1F
	RNg4peWwulCZlEDmtJfWTuTBaVfdWjBiMwvUfBiBqIAnWyCi1V6djEOZmljYkxph5FCEtcGQfE7E7
	qcsEIJ08AlPLEErWp3I6bcV8IlsMNruuBGkdzkM0OYMTsTLQHklNbx4cJXPGo9ihf0mZqpgoBcZfR
	r71cCysPb4UGav0FDc8jZLxQpjCmYkCfz1PRqTkSGfnYfErtvgxFvCgJqVKrcEqs784LtUcnZGtc0
	SI+gOc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrpt-00000004wJI-1oeT;
	Tue, 10 Nov 2026 19:48:53 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrpq-00000004wIv-1qsk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 19:48:52 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1526401a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794340129; x=1794944929; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZwsc4vEEFoPSZcA9FrAm9Zjfu5lDJ7Cw08Uku6ESbo=;
        b=GyCzHvBW/0mz23TclU+i6ZwtMl3U+UHOvzFt4gqZxj1CCayt9zzqg0P17BDY99/zBE
         g9o/QAXz0zt35/8VW+sDsETkwjwS+Y4lQegHADX55EhfmTLA+TKH8p8Y2uR9Zo1wrQNu
         xUhiOl9h4PmevVcPS9bQyBKg1/MnCGpqLWtuNP9naBX+Rljsq916HhWzO+1fyF3dRpZg
         xYDvqOLQl3KpBwzvHxmjWCWN/0XLQDV7BiK+TgUnpC6cEWIjsoaRtkNBGpGSK8sA8i5I
         EnVWqCaDbQTVAw/PL+zbLmFF4w/MA1ZlTzXl6WgoU4XaypMD//EMKe3Ehs4Fc1Q4qC19
         0/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340129; x=1794944929;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZwsc4vEEFoPSZcA9FrAm9Zjfu5lDJ7Cw08Uku6ESbo=;
        b=v+mydCJJ0gUAMDJLzx9Ogwtho/EkoqTrH0IPPwGK5+F0imCn05Gw35d57E19lXX9pg
         FIGeuMAUjzcD0+c/aAN1CzSW0QLqkU75ROy5+7ECQzOfVJ7Pyj2hsD++eIPXnmRU3k9O
         GyuaAMTtf1O/fiB2s+CM3ZGZtLBuJn9Y0KzVIEImUxzes2fOPAMNSkVkO3+EtpV/VNCv
         K1E4BoMpwks8MI9+Zj8zQPyLV4pykMK7qTv+2iG2Bn2bb4RbIL6G1ihjWU0Apuj/FqXS
         OL6HYJ01lqvJrnq+QwPoAUp5cYFXbxpmt08C2MPJEGbmUGjdhQopXhS/N2fMiWW3lJUn
         kfXQ==
X-Forwarded-Encrypted: i=1; AL+hErGSpLRPfgsRe36Jy/BvLryPSZ4A4Vy0qy7fkqR/rOpHsyEi+u6ZPBcl7IFP4tJbYSJcE/0V4LmWkWkMNmIaj+Y8@lists.infradead.org
X-Gm-Message-State: APuU4Z9FwqnCa0B0rEU68wGGUkGnLRi7W8KBrzAi7wkdi3MtJVSuLNal
	Cw11VsAah3MtS97brt9BnRgfMZo0Z6Bix+xhVLkD+YypRgzXfZcNuhKtktEq7Ot+RRU=
X-Gm-Gg: AYBFou0xWyd98eGoxXIKs6KltzkXwmKAlhAfmZybs9sGkmcvY+6Gi8QHA0uqHI6BCOA
	KJh9l8f9lC/eF2UTYV3HXNd7zKJdHv6n2H46PdQTXa9l2I3DR2ToqeaXmiRwssE1UrQnywlFXeL
	t7P1H5HqCfvpTF97X4Z8XKQKm1anTx2vt3RiNfW7WktZ35O0WDhUmmUePc8fUemtdJhU5EWP4AY
	/IgbLPWIFGrl4AhXq3t3Znwe2tFOsUEAtdeHeA/3xi2VjUwmas5qbK+xn+jyBevXgz3I/igZBRp
	2jHjIlQV1xaUG342jT0hXdZV6yHTJ8ROx0LveP0FbxBXDb72/XwqlB/Ijkm2LyonLlA3q+kbFmf
	qFArgQPT+gxaweLYg2XH3B52oq+Akbbk1e72qKKy9c+rPqwd2NbF4DRlHNQ/DseXyulQOLLQ04C
	mvqcsB4ATf88q1fqlE9d72Vln6KIF+T4h59e4wMFkUSgMXUakeYpATVjqygI1RSlgFQaiPw3duP
	wBJoOWWH6yD22HpGJE0rFhePulcuOYmELvuHKCxV/rJpbt9bTncJPVHrh5YQ7opa5x7Nbg5n+4y
	GMbtyNr7MA==
X-Received: by 2002:a17:90b:33c6:b0:3b0:9e2c:9b61 with SMTP id 98e67ed59e1d1-3b182ee21e0mr8597a91.35.1794340129433;
        Tue, 10 Nov 2026 11:48:49 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b17dfb9827sm995022a91.1.2026.11.10.11.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:48:48 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, absicsz@gmail.com
Subject: Re: [PATCH 1/2] ARM: omap: cpuidle34xx: balance cpu_pm_enter/exit()
In-Reply-To: <20261028212302.75ec622e@kemnade.info>
References: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
 <20261028-susp2-v1-1-174b52857d89@kemnade.info>
 <20261028212302.75ec622e@kemnade.info>
Date: Tue, 10 Nov 2026 11:48:47 -0800
Message-ID: <7ha4ngv55s.fsf@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_114850_513280_53396C81 
X-CRM114-Status: GOOD (  19.91  )
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

> On Wed, 28 Oct 2026 20:15:11 +0100
> Andreas Kemnade <andreas@kemnade.info> wrote:
>
>> These calls are usually done in a balanced way, so allow notifiers to
>> assume that these calls are balanced under all circumstances.
>> Seen some spurios vfp issues probably connected to this.
>> 
>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>
> Looked again at some discussions with Sicelo testing such things:
> He had observed a NEON off count 1 but MPU 0 in /sys/kernel/debug/pm_debug/count.
> Probably more involved, but lets not freak out things here.
> So that is definitively a real problem fixed by this. vfp_pm_resume()
> would not be called to restore the state without a patch like this.
>
> So this is
>
> Fixes: 1cd96478cf150 ("ARM: OMAP3xxx: CPUIdle: optimize __omap3_enter_idle()")

Even with this fix, I found on OMAP3 (beagle and beagle-xm) that there
are still intermittent failures, and the NEON vs. MPU count mismatch was
a good indicator to dig a little deeper.

I think the fix here is to add the neon_clkdm -> mpu_clkdm wakeup
dependency before the clockdomains are allowed to idle.  Otherwise NEON
could idle immediately.

With the patch below, I don't see any intermittent VFP crashes anymore
with early testing.

I'm still doing a few more tests, but will sent a proper patch with
changelog after some more testing.

Kevin


diff --git a/arch/arm/mach-omap2/pm34xx.c b/arch/arm/mach-omap2/pm34xx.c
index 9992549c7336..d11967c2f4bf 100644
--- a/arch/arm/mach-omap2/pm34xx.c
+++ b/arch/arm/mach-omap2/pm34xx.c
@@ -510,6 +510,20 @@ int __init omap3_pm_init(void)
 		goto err3;
 	}
 
+	neon_clkdm = clkdm_lookup("neon_clkdm");
+	mpu_clkdm = clkdm_lookup("mpu_clkdm");
+	per_clkdm = clkdm_lookup("per_clkdm");
+	wkup_clkdm = clkdm_lookup("wkup_clkdm");
+
+	/*
+	 * Add the NEON wakeup dependency on the MPU before the clockdomains
+	 * are allowed to idle: once pwrdms_setup() has programmed NEON's next
+	 * state to OFF/RET, an idle NEON clockdomain otherwise lets NEON power
+	 * down while the MPU keeps running, and VFP instructions then trap as
+	 * undefined until NEON is woken.
+	 */
+	clkdm_add_wkdep(neon_clkdm, mpu_clkdm);
+
 	(void) clkdm_for_each(omap_pm_clkdms_setup, NULL);
 
 	mpu_pwrdm = pwrdm_lookup("mpu_pwrdm");
@@ -523,11 +537,6 @@ int __init omap3_pm_init(void)
 	per_pwrdm = pwrdm_lookup("per_pwrdm");
 	core_pwrdm = pwrdm_lookup("core_pwrdm");
 
-	neon_clkdm = clkdm_lookup("neon_clkdm");
-	mpu_clkdm = clkdm_lookup("mpu_clkdm");
-	per_clkdm = clkdm_lookup("per_clkdm");
-	wkup_clkdm = clkdm_lookup("wkup_clkdm");
-
 	omap_common_suspend_init(omap3_pm_suspend);
 
 	arm_pm_idle = omap3_pm_idle;
@@ -562,7 +571,6 @@ int __init omap3_pm_init(void)
 	if (IS_PM34XX_ERRATUM(PM_PER_MEMORIES_ERRATUM_i582))
 		clkdm_add_wkdep(per_clkdm, wkup_clkdm);
 
-	clkdm_add_wkdep(neon_clkdm, mpu_clkdm);
 	if (omap_type() != OMAP2_DEVICE_TYPE_GP) {
 		omap3_secure_ram_storage =
 			kmalloc(OMAP3_SAVE_SECURE_RAM_SZ, GFP_KERNEL);



