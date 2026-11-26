Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3929B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vQ9cuPG7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=TMmllrp8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ugpoNR0m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=; b=vQ9cuPG7eXhVwS
	uDcrM+3OMGBYei/BPHbRjuMIDbrUhQ6zRzxgEqN3WjiIs8P70W3EGZJvOCww8wz+EgrorssOOF9pq
	6uqaq2CYd1G0pgVL4w9o6txqeEuwJARSEs2GEqKleia9X2f3o9UfW75yPYiij3+Q65fsJmc0BQ8h2
	C2F+7G4MDSIE+TFZwXzKYSMb3a0htmdibZmW5CKCFvjuRnGl7YIteFkc1KdviCH2/5fO/pvIlEzv/
	LFFpwvyfvyZzxlmmdKKl8ssYLqpO/fJs9lY7iXnY5VgtBLhAI45PQ3jt6bnr8mAxhsZCCpPHfiVLo
	dDxtqetVrrMf7ocBjDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhHH-0000000Ea8b-1fKa;
	Thu, 26 Nov 2026 21:45:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhHF-0000000Ea5l-2P0w
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 21:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=; b=TMmllrp8IMMM0R8fPNiscQbVI5
	MajhnKqChGgllcKa6LmYkOnuE0kHg4sQPuuGCk21iA6MIw+RRJMko3hBLGKrgBk9+gWrJpUhLzqEC
	zh0GNIJv7E4Ove1ZStXUkRMcE6hQdK6Y65Tpef7ZxhvVvu+XL2AGhAz9o5hSkYV2I2oy4rwuzotfB
	DRQcGSVrM0NnkRv34KiiSW0L+VkL6n/LpPdBYVrnTzFT1pxnr+C69M15NdryYyZfIhwsetCYgHq+z
	3M/hzG3dHlmAyHqa95YfaLzVyqptDDDP0xdJCgCTE7f7JOy3blpDAEyLYw93WultuipcpAqwUQ6lK
	F67A+eAg==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGr-0000000CvO9-3jc2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:45:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso6706120f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729488; x=1796334288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=;
        b=ugpoNR0mgB7Xji9OiT1LJf21FoII/7rjne7CtXvCVgSTlRzBbMhEHmMiutPMjCwQHF
         h4wgq9+5qFeKVtKLqYQ3/8kFbn7nOp1497IRvPWSABRYvm7BtXnM+9+s3FwgltTqRidN
         3P//v00EhH0noZGzd0COloaj6AWcURo/pO88OgtbuRZSz3+0suznOaFSitYzInvQ99Gz
         gJrHIEPX+IKbn956DgDD40L2m6A9eLrzfjjzd55smJhtqD4UnJ0HhwxShulLOIgl6yQa
         Ywt8k9Tut3B5N3ZOqj74eNrwDuPNRtzbtGA/sbouhzg+gAWaT7eFFLUqE08IVrArWZLw
         9cqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729488; x=1796334288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=;
        b=lnqhhCSwd9A46MriWpt0tLQl0xLQ44RyCqjG6/n2r1FMi5zL0k0yh5TVc0jgGX+IYB
         8oGSh1GiWGm13o8oWHx+SqN9L/SXKAOOf/ZS5q3FHQ1pB/NJTsSqoDArZPOwzWcrzDRU
         bX5eyWc5L+I1NM2FiDSdFkWFjb5Kz5XpDRRQvCXKoydYYyuzr1yj4wVed36cfI81T1kZ
         pxqMZ3Dq0KIfyjz5PGeG8zsT9CN8sDarEc7OMzeaEnzPfBFYnKN5fRwHctJ54txqgtxS
         gFUaEYm56/BsOIXUq6jE9HUZD59IA4X8wIoozeIujG295drWvCo0QmDvWXHHpvLwagza
         M2hA==
X-Forwarded-Encrypted: i=1; AL+hErHn2EtQGQHzo/wRtqnPdPZTbY5InU1jYeqKV1uVj7Bbyo0gmZJKKP4w8EmeswI63GJtHI2PKDm9gMk52NEBX31S@lists.infradead.org
X-Gm-Message-State: APuU4Z83Wrade89faSL5cv0SFU0q/JRaDsWR1zR7xHWwC+dekSzUX9QE
	y6sl1v+YbRIOXzZc/7Hkxb0VTfYfyNiH+SbYOyZcTmxVe/MfXmKhPYoN
X-Gm-Gg: AZFdTZeJ0e00a172Bkl7Cis5VM7ADD/dCOlpTeJPIWOV0nT7cTTqa8jmq1FdrgcSLhP
	OUzh6+XlcTdMd5UiGyK6JPk8wd+h1pCdjIERQ4CM2UPxLTAAn41kS8fcafJfmb9yyKzYCqfcVL+
	9VYuX135hEpl/hUOw7DtrELk1WwpLSQodCKDxuceyVwp3LnKXdHXets1Q6N723rKJ8yaiUsnePB
	Rw2pHiv1Sm5dCkOxx8wba2BQ8ZCMiTrV7//diCLyaNTaU87dBQ/0r2S+z3eU0NBrMiGOxk/+5Iw
	k+NUVqwVexYdr6uEPxSdNWvPhWuuv+jfy0bUYuyHHC8gtGWJcvwIeoMQ6PniNFdkz5R+2zUSJqr
	b1N4M4VOHAtARVeWR/vXIbElCDT91iALrLskhSAmsEKm+SpPn1DD2QXlXQb01AiqbMlz6zuynzW
	M98so189A8rq8RL2fSzVrzzQMS/kZr0nI+qj/pkrHZPflMlAslvV37sGGSfE3Tnm3Po1cqZZTU2
	2+CRMu6GDtm33mqWxX3vocWIgyRqK9d1qfKYiTtqkeJjEhi8J8oU6I4frNqCCU8fLcVYH1r5GNJ
	JI9sPtRblXECWGif1T/Rh8U7M4yiP4VinFoymrMsVV6ArzwdTpkIx3yzg+RNYG2sEpt7+hMlhKF
	jWfWiVXkVO/lcGUf+elzzf6a0hQhKCTaZWb9lrzM4duXQGYGUrx0HNkZpKis13l5SCMG115Fccs
	DI3ycmD5Pjw3k+VY5A1+pPhiZlwOKg4ByEKdHfwISyY0aXtD7UjXNRDyVEgO8HrP59iWw/Vbzax
	UHIwJ4cT03jMdsFgn3Ju3TGnqXNgAHGGd8ece5/JQ==
X-Received: by 2002:a05:6000:2c13:b0:4a7:9630:7b57 with SMTP id ffacd0b85a97d-4abb43dece6mr43971087f8f.44.1795729488089;
        Thu, 26 Nov 2026 13:44:48 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:47 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] drm/sun4i: tcon: Add support for R40 LCD
Date: Thu, 26 Nov 2026 22:44:28 +0100
Message-ID: <20261126214433.3562326-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_214456_165304_50E6EBD5 
X-CRM114-Status: GOOD (  16.52  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

R40 TCON LCD supports LVDS output. It shares the mux function with
TCON TV, so use the same set_mux callback.

Each TCON LCD has analog registers for both LVDS PHYs. TCON LCD1 drives
the second PHY, so in single link mode it has to program the second
analog register instead of the first one. Add a LVDS PHY setup callback
which selects the register based on the TCON index.

Add support for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 49 ++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 77b6026bc895..0cbd6ae66c4e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -139,24 +139,25 @@ static void sun4i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
 			   SUN4I_TCON0_LVDS_ANA0_EN_MB);
 }
 
-static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
-				      const struct drm_encoder *encoder)
+static void sun6i_tcon_setup_lvds_phy_reg(struct sun4i_tcon *tcon,
+					  const struct drm_encoder *encoder,
+					  unsigned int reg)
 {
 	u8 val;
 
-	regmap_write(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_write(tcon->regs, reg,
 		     SUN6I_TCON0_LVDS_ANA0_C(2) |
 		     SUN6I_TCON0_LVDS_ANA0_V(3) |
 		     SUN6I_TCON0_LVDS_ANA0_PD(2) |
 		     SUN6I_TCON0_LVDS_ANA0_EN_LDO);
 	udelay(2);
 
-	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_update_bits(tcon->regs, reg,
 			   SUN6I_TCON0_LVDS_ANA0_EN_MB,
 			   SUN6I_TCON0_LVDS_ANA0_EN_MB);
 	udelay(2);
 
-	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_update_bits(tcon->regs, reg,
 			   SUN6I_TCON0_LVDS_ANA0_EN_DRVC,
 			   SUN6I_TCON0_LVDS_ANA0_EN_DRVC);
 
@@ -165,11 +166,17 @@ static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
 	else
 		val = 0xf;
 
-	regmap_write_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_write_bits(tcon->regs, reg,
 			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(0xf),
 			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
 }
 
+static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
+				      const struct drm_encoder *encoder)
+{
+	sun6i_tcon_setup_lvds_phy_reg(tcon, encoder, SUN4I_TCON0_LVDS_ANA0_REG);
+}
+
 static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon,
 				       const struct drm_encoder *encoder,
 				       bool enabled)
@@ -1410,6 +1417,27 @@ static int sun6i_tcon_set_mux(struct sun4i_tcon *tcon,
 	return 0;
 }
 
+static void sun8i_r40_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
+					  const struct drm_encoder *encoder)
+{
+	unsigned int reg = SUN4I_TCON0_LVDS_ANA0_REG;
+	struct device_node *port;
+
+	/*
+	 * Each TCON LCD has analog registers for both LVDS PHYs. TCON LCD1
+	 * drives the second LVDS PHY (LVDS1 pins), so in single link mode
+	 * it has to configure its second analog register.
+	 */
+	port = of_graph_get_port_by_id(tcon->dev->of_node, 0);
+	if (port) {
+		if (sun4i_tcon_of_get_id_from_port(port) == 1)
+			reg = SUN4I_TCON0_LVDS_ANA1_REG;
+		of_node_put(port);
+	}
+
+	sun6i_tcon_setup_lvds_phy_reg(tcon, encoder, reg);
+}
+
 static int sun8i_r40_tcon_tv_set_mux(struct sun4i_tcon *tcon,
 				     const struct drm_encoder *encoder)
 {
@@ -1521,6 +1549,14 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
 	.has_channel_1		= true,
 };
 
+static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
+	.supports_lvds		= true,
+	.has_channel_0		= true,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+	.dclk_min_div		= 1,
+	.setup_lvds_phy		= sun8i_r40_tcon_setup_lvds_phy,
+};
+
 static const struct sun4i_tcon_quirks sun8i_r40_tv_quirks = {
 	.has_channel_1		= true,
 	.polarity_in_ch0	= true,
@@ -1562,6 +1598,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun8i-a33-tcon", .data = &sun8i_a33_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-lcd", .data = &sun8i_a83t_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-tv", .data = &sun8i_a83t_tv_quirks },
+	{ .compatible = "allwinner,sun8i-r40-tcon-lcd", .data = &sun8i_r40_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-r40-tcon-tv", .data = &sun8i_r40_tv_quirks },
 	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = &sun9i_a80_tcon_lcd_quirks },
-- 
2.43.0


