Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13933606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dYPH10zz;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m6nDiycu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=d90ll7FAqo6oPiF9VJDJ3t9cPa5ddaSwh42tVXJ/uGw=; b=dYPH10zzkB2ygFCMxlMXWJh74b
	xhkQw4saUCJYWWf2F03tcevvCrKSiy0xNbkJw4tou9RJx3A1QaaCoZTpFEUoL347BBlvfpCki/HOJ
	kOJ0G2/dQp5z4GZLeN+mmQG1c+4/LzskjUn6Bc98XSyVrS6r5X4POIbSKt8nB3sWjKAoQqF6/tolK
	fifgfZa4WGV5X8ycro1PJLraFxIfxtpAlCP8E7qD+Jl6Zh4yDGzz+NWeodFD8h8M6g5UVm6pa3UVJ
	1z4IgPxa0+Jr/WmQIoyMAgReN3TDd/IH9bgF4Dl4caEYv9ACm+/Lp3xdblinwGsOKz2qgzeQ6UJnv
	tIpmNnhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvkF-0000000DpxC-1gmv;
	Fri, 13 Nov 2026 18:11:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvkC-0000000Dpwh-1bCc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:11:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso7186235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794593483; x=1795198283; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d90ll7FAqo6oPiF9VJDJ3t9cPa5ddaSwh42tVXJ/uGw=;
        b=m6nDiycuXqbBukDywdoE0Ll0L6kd9SkiP+hewXBgnwlwSrlK1yF5YEHeZNPHixGD44
         Vg7MhhCsMVM6YBSmpOl3Us6MxdHp1ggMW5qr2VJrG/SeUFAIGmXUQTbsYJzkSf8mCkif
         7JsgzQTHlCEXrrFmUIwCiOaTTBVvdP/duwcXhb6FsalKbMMJUPxaKqbEaTqjB87hv4hq
         aSoIb9PjKEp05ItSSqxAIThi6vwUgt6Fd7nfA8zKR62xi7ZCregdxXPdrugqtuMfdmwC
         K5hO/wVeJqKmjWcJls1t9aTa2Y9W5u3wH1LcWysW1LV3OG31ka2G51NUxEbzsJffnesD
         17kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593483; x=1795198283;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d90ll7FAqo6oPiF9VJDJ3t9cPa5ddaSwh42tVXJ/uGw=;
        b=AO5AJYg4HjL5SjkSja8YJOQdT8fF1gWBrvFinyTMuQShc7b8XK2wv3yw+koji5ouit
         pTUvkZpypCxsQtw8J3KYOiwFHCPuXYuHaUrBpzGvVPUS+7HNqXiiOJwXHElmkVEAmYUT
         AeSBEpSoENV6Hczky1+uI6TUNAS2Y3fHq3ndxIVfzasZj0Xhl76uwDlJQdy4E17Ek/Cn
         VXmORjlQAXJ5sbmUI5fyZZOlFEByF9kCgXXAI6OioYZGICyAsOhbKhNwMQ5jB/T/NuP4
         /xdtLaguAe4HV1LNwkR3VGJj04KSm+C3WI8v7y7VK7WAO2Bzk9IcKqiiB1iE8O9Fd78F
         EXCA==
X-Forwarded-Encrypted: i=1; AL+hErFtEsUAC/gYN+1+jY7XeMELuqMKsZAJhl0DiNvYQycormpB/bJD2wIQ3IIQmjvBUZ78oOHvfic122JNrJNIu8MH@lists.infradead.org
X-Gm-Message-State: APuU4Z9Gr5Al8hEpIIaH+kz95C66MV12fm5SKWHhjCK/ibzso3FEiZkQ
	wEtXG01biR9Y2LAKZleifXS+4giUhtF7oY5wC0oOiYGCc0hIGrqmJhDg8HjDCx0M52Y=
X-Gm-Gg: AYBFou15jePURCBn2q6iAGaYXuOQFnpYiUSgkfSRE8QwUQY12l/+tzGXREb7a+myqw3
	eeSnci5se/LMgSbGga/Rtq4LLZ5AU8nHwQ1fVFMV4DMs+UBVZteJLdDQVXl17zEdOEX5XmEZlyE
	nDTZueM9jR0WS8EQt52OV+ZFTiUsZztydHAxlM/YSCcy1jZkHyNMqC6maD2l5amPCxHDUdbMsdI
	cm9p8XcuzqtxzVtTCpqdwcRcJigRBJu2eQ+jg1H+XcBNuAEND3eWpEKTNwMv0+ZpqXp4r1YjqTI
	pGKBjlzfaHThfTl+TChTTTB/aHyx3W39hL1XymLb1n2QqeQ3jIvzAn42n2sRwMmUkZgQ+4swFCH
	duv5Jgvm50vG5aM9ENYizuJNKqizYIgw2LVwvX7HM6mBbhSHzfOk7I5s72CuxV48qfgEXAszz3f
	zpICVKsJbKqGfLVuetGZxYzsff9WljU4VfyB9QG+E4MzwsBDYOhoq/RHkk1MgKGamAyPU3dClzP
	rFBrq/7RF8j9vuq0d+PelLHuabwaid0IUNS8ST7Dy3OraMrxXBVwWeZtvu2wiWkZFx4MgiGQ1T2
	TeJRSNyd4iSU5/usret3XgvNxmrbfxlC9v/NPOxE1AaOUw==
X-Received: by 2002:a17:902:e801:b0:2ed:1ca2:ea5a with SMTP id d9443c01a7336-2ee0dca839cmr36180785ad.51.1794593483028;
        Fri, 13 Nov 2026 10:11:23 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2ee0f7cf7bbsm13900955ad.29.2026.11.13.10.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:11:19 -0800 (PST)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Fri, 13 Nov 2026 10:11:05 -0800
Subject: [PATCH] ARM: OMAP2+: pm34xx: add NEON wakeup dependency before
 clockdomain idle
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-wip-omap3-vfp-neon-mismatch-v1-1-3f6f67b25251@baylibre.com>
X-B4-Tracking: v=1; b=H4sIALhS92oC/yXMTQ6CMBAG0KuQWTsJA8EQr2Jc1PpVxqQ/aRFIC
 He36vJt3k4FWVHo0uyUsWjRGCrk1JCdTHiC9VFNXdudRaTnVRNHb1LPi0scEAN7Ld7MdmKDYRy
 sYHRoqQ4pw+n226+3v8v7/oKdvyUdxwdCJ8FlfwAAAA==
X-Change-ID: 20261113-wip-omap3-vfp-neon-mismatch-ae585c1e8fe0
To: Andreas Kemnade <andreas@kemnade.info>, linux-omap@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Roger Quadros <rogerq@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3137; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=nUGlnUeigsEQ9AGsMFJlNERG2aNHvO4BKiJ3p/GPSeY=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBq91LGetFzLY6wDOP+zWqz8i+v7KabRu5ykL5A0
 zJKG155IuWJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCavdSxgAKCRBZNxia0/vG
 ZcRvEACXiYcDk4LIQVYi81KCF8Ic+S4yw8GMXbsTzj/GRFeOW3QFjiwlNHs8uDx3gT+UXUrf8Fc
 qv4rO98ZLCgQJXf/MSP6i2xNeJa2ZSvoS0+qVuDNN/4zbzrqe5+k6ksJKbDWC5ozYjXgKM6H5hs
 9jq18Xs1Gi7ROFUNxfcCWuYVKZRTL22PogIUhAzzxhdqqWUotMYy3osyE2zZo3HPHFhrxIzo4B9
 YFUN984Bi1n9vvzl2rwsFzGa4aIh7zb7k2UuBZIARhMFV7VkeU58ke6p7gBrQ4qV4bTcEA6SZdz
 I2ncXp8F6dSYOKw0z3Qj1RLslxv1/lgPx+P1iHY2Be1NWOBYl3ovhzjCsDEaLnonpJNR4FAuPDO
 F61xUeY6u17W3hCvAy9UW0OX89aSVkhZTzzmsdeufLCiCBjrgf64P2UudyqkwEiKQZT8aK7xFVl
 9RzxVOLHnW4/Vdn8XVRo2HWvf4EZ+DaU1CAkBpd3CH+0ePmaUJFrK5RPAqRPyzj+rO6Os8X2UON
 tya//RQ6Ve89dvFW3B3ZwBTi5HVypzbdfHgoMtMsrb/Y0h7KhiBfG1s9UdYkXBh8LPCGuRjZKck
 IuExQVPzWHsK/Kc6Yp2qGS3Ot0kUWNx+V2oDdnukr5638VPpH1GijitY62WmU9DcorZtzeIFFkG
 DawOHbfsB/LhfGg==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101124_433671_FF1F1213 
X-CRM114-Status: GOOD (  12.55  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On OMAP3630 (BeagleBoard-xM), about one boot in three dies early when
a context switch touches the VFP, which traps as undefined.

The VFP is unreachable because NEON is powered off while the MPU runs.
omap3_pm_init() sets NEON's next state to OFF/RET and lets all
clockdomains idle before it adds the NEON -> MPU wakeup dependency, so
NEON can power down immediately and stay off until the MPU next idles.
This was visible in pm_debug, which showed neon_pwrdm OFF:1 while
mpu_pwrdm OFF:0.

Add the wakeup dependency before the clockdomains are allowed to idle.

Tested on omap3-beagle-xm: 6/17 boots crashed before, none of 25 after;
also ran 50 suspend/resume cycles each on omap3-beagle and -xm.

Fixes: fa3c2a4fc99f ("OMAP3: PM: handle PER/NEON/CORE in idle")
Reported-by: Andreas Kemnade <andreas@kemnade.info>
Closes: https://lore.kernel.org/r/20261028212302.75ec622e@kemnade.info
Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
This patch combined with an omap_device fix from Andreas makes OMAP3
very stable on suspend/resume, including off-mode for OMAP3630.
c.f. https://lore.kernel.org/r/20261110211531.679943-1-andreas@kemnade.info
---
 arch/arm/mach-omap2/pm34xx.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

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

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261113-wip-omap3-vfp-neon-mismatch-ae585c1e8fe0

Best regards,
--  
Kevin Hilman (TI) <khilman@baylibre.com>


