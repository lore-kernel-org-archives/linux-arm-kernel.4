Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF674606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QUBVNIDa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPkaEVTq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZTu3X4QyB3nudJbrQzIVh4I/G0ZNmo+cjpo/1+ph+rk=; b=QUBVNIDamIC40GZYw+J5orfiQI
	zD2PRrhlxJkRZ858wX6UimSLE//P7LAbqLlepjc7pdjBLL60f+eVJH0r4Z5T+/lsEMTdybVoZn1T0
	O4upaw8kq6JL3Hj2H87D6d86hdaTozVHoSYdHf+IUGDnlKAe7kAtzgiCUatrLoQJ5QwpgH0saCDpS
	57BnRsMgDR2wYOZGcqF339up6/P7J4Yz7wsgv7qNv/gSop4yO+ZAL7KqK87TtW40KF6Caasn65NQ6
	hSUOprO8YSukvhW6Gm3yjhX+VSCsE0qOlEBU8KrfY3jJxapOLjGd007kl5DFH2nZNojBHuzFX+6t4
	QFdvv+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbKp-000000028Pz-1eGF;
	Tue, 10 Nov 2026 02:11:43 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbKm-000000028PM-3StE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 02:11:42 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6fe4372c5f3so871234eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 18:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276699; x=1794881499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZTu3X4QyB3nudJbrQzIVh4I/G0ZNmo+cjpo/1+ph+rk=;
        b=UPkaEVTq6uBojNioKLd4Tf+xip1aO5NE0pOsKX6X+2xPhMbjkV3tUqHqfULL+pUa/g
         jB5YBN4P7M/e+Tww02LIlbLLsWEzH24d58DdmsSy//T8/qgKMhbg5kmC6cKUefOJVBZc
         d1yLDH2/apnnAoLX9m6oohxNQe8mkTvWGWU3Zyx/ucuOIUME9w1PSIeqCCGvW1aq6Q3y
         NAlK0E63QKZOcBGuLtIBGL0KBIFuBo3OWL6sk6KoFyBpZmRNO7LkTrDPjODZv0Z/wIv+
         S7n0plJwpdvVPCQCDlI0AsymtymR/hDcimY5O4EPDqOl0S+YiL80ZKFxMkJRJn4y+n7t
         2VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276699; x=1794881499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTu3X4QyB3nudJbrQzIVh4I/G0ZNmo+cjpo/1+ph+rk=;
        b=tlLwdUAxzlNMvdTQQa+n4/Evfj9DqXEX5LMgONo1NGWgLpmpG6GIazRb9XYQlt04A7
         UVZYti02yz1/yQUJOCeb5WDXPtUyNyQ3BIsToYk8c0Xfvrh9Xq6e065t72luxeCo2xeM
         IJDkO107rL4k8ghflFeI21CXJuJzS3KgOTSymxm5kDdzYK1CMX5xDb6Nd12ZGll88Vpx
         raATrXmBsdgb1cIJQBdh5HoRrXhVFfatnGIWawMCvz64uNWRmoNxVMjcHeVOpZASn8ij
         pxWmgl3NwmMJxpG5jLDEqeRuBUI6QpIqU1nSJejCFnBNGX/rqaf4wwU1/wYLFRzkukXW
         t9aw==
X-Forwarded-Encrypted: i=1; AL+hErHi4OYUNyHnZi6bNkynpwu11iGumK+gYuYOUibHzFfrwlyqtC4rW2Qrsay0o+K84yq3HfpkOMSZ/4Dll84BTBVX@lists.infradead.org
X-Gm-Message-State: APuU4Z//LABqw8kfJ5SeO/jfCd8pWN6J9JhbS5sDrxxO4YN5MjFtFp89
	OSzFskspApzTJY/vJJRqckS8EknY6J9wf8U8QWyRCtm1Pq+Xy9lbVbuX
X-Gm-Gg: AYBFou1C7MVAxkzvtVhKpJiUSFTR+GpVvFwTCjmfDGBHxnlE0nMZXHZ2uoZkXNys98M
	xSvApHKYHav1V50B/a1Yc8ud5Dvf4giOtjoga812mpqkwwSAJzmAHli5L2ECK2G9z+N7cCPiIIQ
	xcKPb0BdLzH3Rm4fRnfELLbMWBiOqW+g0EKapI4qHPbecswv2nzn+LJJN3bYD9H7x0pmZldLvZl
	OT7QtTeR3R0d8NEWxDb8gdApYznNnSCogWhg+9JApy4jb5oW/XLVmi4UZKZ1hsz9aLkqMjZXYvB
	aqwbOO/5DHnTB7UWpCSVy83+tGlT3yJtSauNQ9pNUNHfVwpxYd31f0bmsUGoyheFvo4HmdTXaF/
	u54aeNoeh+wQyY5ddSscRfrbxlMrilppurW6VYz2Dh/9oM8wuNjAoU7omWQVQCQL5LNsR1T/ULx
	oxOi2q8hZ12WxgftDjI4+L+MgJjZcZ5ZBIJQPgajrAT4S4mppmrxREqyNhul/i/KiRTxx5817B0
	6NLdueETy90Oxtsi5lIjrC37/WfT1SZ/k4BhXoYPji56SQXYUFoKmYyuhXTiAGpx/NftGV8ce41
	Vixcj0wNoUFkaqs+C67h7t55IgJEFVqwT3sqcMqtwDIHS6qJHm9k7viQCnpIvM+DklQycpvJTb8
	PPd63
X-Received: by 2002:a05:6820:5055:b0:715:24e6:9529 with SMTP id 006d021491bc7-718a7bd98d0mr462083eaf.86.1794276699230;
        Mon, 09 Nov 2026 18:11:39 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a945ceebsm717268eaf.8.2026.11.09.18.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:11:38 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] pinctrl: sunxi: use automatic voltage detection on A733
Date: Mon,  9 Nov 2026 21:11:36 -0500
Message-ID: <20261109-a733-pinctrl-v3@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_181140_898248_6B87DC80 
X-CRM114-Status: GOOD (  17.85  )
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

A733 uses two-bit voltage-mode fields, but the handlers selected when
v7.4-rc1 added A733 support program them as one-bit fields. The R-PIO
handler also writes an A523 control register absent on A733.

Add BIAS_VOLTAGE_PIO_POW_AUTO to select auto (01) in every field of
POW_MOD_SEL at controller init and skip per-pin voltage setup. Use it
for both A733 controllers: the A733 User Manual v1.00 documents 01 as
auto in sections 18.14.6.1 and 18.14.7.20. Give A733-R a separate
descriptor so A523-R keeps its existing voltage handling.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
Link: https://lore.kernel.org/r/20261107000135.6b684277@ryzen.lan
Suggested-by: Andre Przywara <andre.przywara@arm.com>
Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes in v3:
- Set every two-bit field to AUTO at init on both A733 controllers.
- Shorten the description; retain A523-R's existing handling.
- Drop Vinicius' Tested-by because the voltage-mode programming changed.
  Keep his Suggested-by for the separate A733-R descriptor.

v2: https://lore.kernel.org/r/20261104-a733-pinctrl-v2@gmail.com
Replaces Andre's RFT: https://lore.kernel.org/r/20261013142351.771229-1-andre.przywara@arm.com

Tests: arm64 defconfig sunxi W=1, boot-stack Image W=1 and DTB W=2 built.
Not tested: board boot, 1.8 V switching, A523.

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 19 +++++++++++++++----
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  7 ++++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  2 ++
 4 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef1..006754c0645f 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,17 +30,28 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_AUTO,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc;
+
+	desc = (struct sunxi_pinctrl_desc *)of_device_get_match_data(&pdev->dev);
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
-	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
-	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
+	{ .compatible = "allwinner,sun55i-a523-r-pinctrl",
+	  .data = &a523_r_pinctrl_data },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl",
+	  .data = &a733_r_pinctrl_data },
 	{}
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..e095abbb7232 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -24,7 +24,7 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_AUTO,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 3ee5012463da..444930d3c389 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -732,7 +732,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 	u32 val, reg;
 	int uV;
 
-	if (!pctl->desc->io_bias_cfg_variant)
+	if (pctl->desc->io_bias_cfg_variant == BIAS_VOLTAGE_NONE ||
+	    pctl->desc->io_bias_cfg_variant == BIAS_VOLTAGE_PIO_POW_AUTO)
 		return 0;
 
 	uV = regulator_get_voltage(supply);
@@ -1659,6 +1660,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
+	/* Select auto (01) for every bank, including shared VCC-IO. */
+	if (desc->io_bias_cfg_variant == BIAS_VOLTAGE_PIO_POW_AUTO)
+		writel(0x55555555, pctl->membase + pctl->pow_mod_sel_offset);
+
 	/*
 	 * Seed the output latch shadow from the hardware so pins the
 	 * bootloader left in output mode keep their state; see
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..7b36c5c2263e 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -130,6 +130,8 @@ enum sunxi_desc_bias_voltage {
 	 */
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL,
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
+	/* Two-bit PIO_POW_MOD_SEL fields set to automatic voltage detection. */
+	BIAS_VOLTAGE_PIO_POW_AUTO,
 };
 
 struct sunxi_desc_function {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0


