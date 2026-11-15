Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2DA606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 06:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cc4oFjUS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxF8uhsU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=; b=Cc4oFjUSX6UpmY
	H2M9iJ4q/en/DsgtaiLtz18/5FPIh4aTZUFhq2hAe0WBMT9/UG3bCe008hJxoC00ECYRx5SZkUwgz
	4XRbEL+HxRrU/TcPz01gsE4ZEw0YAxYOc7c3aT1PJTbQ4q8afUlRo5E1Iz0lu+NTIOiQMsaQ6RExa
	9sqGMKH7iOrjegtq8wYu2sNJFh7KOAt4HlH0v1J2zo8k8NmOqVguTYrNe0xsNz36G1dO+1x2jj1uj
	aTswqWp94qYVGginzz3A60T24Vk8CM7lI/d+L4mtQcUB9kMSIFbZ8r5MuXkl6UXz45R5gKjaz0sSH
	lI0nQHLSR/Fc67G4sE/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSe-0000000H6eB-3awA;
	Sun, 15 Nov 2026 06:11:32 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSX-0000000H6bT-2cFw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 06:11:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so25620235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 22:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723084; x=1795327884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
        b=PxF8uhsU9YDQizX/4TsWwknIitgQg/9VPHH19JIkInDkBYcOWWRXGKOPtwPVh2X5d3
         r7gBXxX45FsVFRMZv6WOu29DFiLmeAgjXvIpx1aZqyzeY/nWEmmGDxGK8LeqM/XI9eqr
         W0+XF5zV/qSdQlwTmOiDHRH7M79eCecElNQcNKsOPuejFGWTQPf4VepN2PrPfmfIDfRk
         99Czt9lIKXdfxUz4Pt76KX/pSxzebRzS+57UZP9M8iOPnL66ebNPUKtGj9vQwcD086ns
         9BNAL/2PISMRRRW6uqjsSYoi4wyrnXlAGQtJrGsLUMpZmKur/up9/i0POqOYYtl4gSCA
         2nAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723084; x=1795327884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
        b=hqTC63pWpKM0YM+AStA51UySIKvythho6Bd02TdBs4owmmPAJIzkp3pPEKrH35pP82
         avQ+3JshAccttzcKAishlWHLx/GcFiQTJYo/lpgWO7NxykLentZfXpp/Yp70Fe65Mx3u
         dVsAQjI2MxAdyhv2aoirUtDSvPwWWteRrglNCOZl4sz/Oqm6Ratu+zDPESPRRIvXUBGf
         Ulb+Y00nerdbFkUj+pJX7Ec9O9x6DlmtQvWYKTsmQTSyaDvHcZjWvvgs3EtU2/ExumBT
         odI4wr1TOTskz1ps279VvqzPJfJ5qvv51OIINGn8Bu7bJbrb256ygjSkwLkfHvhfpvYh
         3PGw==
X-Forwarded-Encrypted: i=1; AL+hErFXRUJ0NA0IIuysfRjhwvkjXn8IH/d1VhSEawY8RmInasjvrUBDmnM0lf853RMfAlMg0wrt/kFY0TutrW2bslup@lists.infradead.org
X-Gm-Message-State: APuU4Z8u3GkMLI1YLstGRA9Chi/ILrpUWH+yiYck54ol6BpUbg6mOkY4
	oGyEwU4PaxyI78y9Wd9dfDJSjUBO7c4Rsm61fMfpeg4iO+VDY8tU4dzK
X-Gm-Gg: AYBFou1Z0qW830BlcPH9JCw4VbvFTfRhkJ4g9Ud5B+mS1l5AdXg33SvrNgtwlG4oPb5
	bZVBOkfQJ/r3hSI34iPTGyQnuM3kt/jA+ITS9G1SwObvrO/c9Epk+EUUGikuGmKyGbvoAuQ57OX
	+I5MFuB3gHQ1Em3gyhUmT/B2VXdDQtuWiec7hy1qTXYZUApeFK/zsmB1T9V7DZ/ehl/hcIJOwXW
	D6vUJODSHzU9AhLQta+nN64M/qOXDklf7HVhAU3djsJf7JRcYh/ApK+JXMG4dnpnbcV7/yQR1VP
	wBGkbr4nS4RNPvqvArx8WpBEzOAqASUW3LuX8MGV44yvQl4KdbS31I9aoMfrwheydHb8dflh/Tx
	qQgwqGsPkrilcmtLR8XBvZ/8uw6V3RAk2vybd8w7LVJ1joKs2JKS+D1DdAptx8qtk1jxk+WLfXi
	zgqhLq4aWNZ/y5R6HEpjzIpFCdYha33+QH51k1SpQf3xvk1EfDQr8RjZS6ZvepE5Mwrcsitl0F4
	Sw89iTkW/bTn0CZKdNPnyXo0h1JmMVZWgEQe+0L1prernP3MrGq/3ob/2d+19hc/l0DoVWYHsBK
	rK4bKTuxT54eOFNR/5ZDLW3PS8MUOfuIi7kMlpbd4thirV0ZMoTQEFWKX4t+ttSOz1fvi5ZbBW0
	/qSQ8E6PL/n8Bh8fSP5GxijpYl+IlH4GEOR74uwoYmd+f+SAEEyzGITMRyKzN3Wi12POXXHRq5A
	hsSiouk2NhuYzq1mKN1or1UdhLAWitEB13K+ivBEAS7dXnyH5abreuEZvn3XVCyJbUVL4n9exHP
	dP2TpjAIeKt8g==
X-Received: by 2002:a05:600c:4f90:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4bb55a47680mr145173255e9.7.1794723083470;
        Sat, 14 Nov 2026 22:11:23 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:23 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 2/8] clk: sunxi-ng: de2: Export register regmap for DE33
Date: Sun, 15 Nov 2026 07:10:56 +0100
Message-ID: <20261115061102.229680-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_221125_693685_A77C6AE7 
X-CRM114-Status: GOOD (  16.98  )
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

The DE33 clock driver presets the plane mapping, which is not something
that a clock driver should do. Remove that and export the mapping
registers through a regmap instead, so the DRM driver can set them
properly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 43 ++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 6ec6c0dc4c26..f17570efafaa 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "ccu_common.h"
@@ -283,6 +284,36 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
+/*
+ * Add a regmap for the DE33 plane driver to access plane
+ * mapping registers.
+ * Only these registers are allowed to be written, to prevent
+ * overriding clock and reset configuration.
+ */
+
+#define SUN50I_DE33_CHN2CORE_REG 0x24
+#define SUN50I_DE33_PORT12CHN_REG 0x2c
+
+static const struct regmap_range sun8i_de2_ccu_regmap_accessible_ranges[] = {
+	regmap_reg_range(SUN50I_DE33_CHN2CORE_REG, SUN50I_DE33_PORT12CHN_REG),
+};
+
+static const struct regmap_access_table sun8i_de2_ccu_regmap_accessible_table = {
+	.yes_ranges = sun8i_de2_ccu_regmap_accessible_ranges,
+	.n_yes_ranges = ARRAY_SIZE(sun8i_de2_ccu_regmap_accessible_ranges),
+};
+
+static const struct regmap_config sun8i_de2_ccu_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= SUN50I_DE33_PORT12CHN_REG,
+
+	/* other devices have no business accessing other registers */
+	.wr_table	= &sun8i_de2_ccu_regmap_accessible_table,
+	.rd_table	= &sun8i_de2_ccu_regmap_accessible_table,
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -336,13 +367,19 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * The DE33 requires these additional (unknown) registers set
+	 * The DE33 requires these additional plane mapping registers set
 	 * during initialisation.
 	 */
 	if (of_device_is_compatible(pdev->dev.of_node,
 				    "allwinner,sun50i-h616-de33-clk")) {
-		writel(0, reg + 0x24);
-		writel(0x0000a980, reg + 0x28);
+		struct regmap *regmap;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg,
+					       &sun8i_de2_ccu_regmap_config);
+		if (IS_ERR(regmap)) {
+			ret = PTR_ERR(regmap);
+			goto err_assert_reset;
+		}
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
-- 
2.43.0


