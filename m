Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D783606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0nYROMne;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPDeXXYu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=btRAcHUeA6n57bmtR6kPYkSdBmN+obmF05HBvyePiOY=; b=0nYROMnexzTmO+
	QfK+qXRASY2XyjSDBWukbXELuOtlXYKsvrZ45p//EnqPWoKlbRbgvB/cJmNnvPM4AB0TeCFfakJkp
	+d/R2hQp01NwoALAuOOr6SZKOs3lJtcKnB91f+oXpblw6OT/pe87cg936rvU2nNcleoHt4vKY3dPH
	la2aXNypveGkyPZDSTTT1n6hvapfKqLCId37nyc605mi8QWaAkanGKIJKvyL+cPv0Z+gnJq20My4j
	24EMrs/ulrBsfhQ8/hP413MRiQSR2dmjFFnKHzVU3A2Tlevuo5QLflS7FRPt57UcbhOtmePQPT9IX
	DZVcF7rQU3wpfeGivvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqhU-0000000FCch-3sFP;
	Fri, 27 Nov 2026 07:48:57 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqgq-0000000FBuy-2wnM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:48:17 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3861d608cdcso985595eec.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 23:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765696; x=1796370496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btRAcHUeA6n57bmtR6kPYkSdBmN+obmF05HBvyePiOY=;
        b=IPDeXXYu9JNigjdOZzQEeeahJr1zoN8hrgFmi23AZB5P2bENcStdHyR9AlCBFKl5/D
         se/+g+LzUCrSl790kQldS4Gwkj7LOZAYTtVNkSXojBWaE59YV3GuV6OYfDk2U1sE1UNF
         PgFFt6I33Clp+2bDsDTHkPxzKMaEKMadk7nEa8IETxszKNuqDPKoQaY2BiTuVNgxzzeV
         wzHperDblQZNEe59xttQJWSC1QnJMd31ngnJRbPKk71o4Yzj2JKqexw0iLLLDtZONC55
         AhzlHwqGNujVNHbkuo6DQSWXqTVLLPN+VZpDLn+F4g3U3uqOTS5eyUtcmqFgaMw/K0Px
         M37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765696; x=1796370496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btRAcHUeA6n57bmtR6kPYkSdBmN+obmF05HBvyePiOY=;
        b=GkJFeWgKTplLOuvzDZcOwEFeOeM+1Hn/C3LsFYOYEqvamVf1GME3e7A1UPqvJCKn8q
         Bl5bVJHC14zoMiJHiZGQOPhp02MIALHOLL8YEI7LJD1MwnU57x7d8ALBBSPvZJGibbms
         1zXEehkTwIT5egW7XpKnnF502iV0RkXwF1M2uYENnXpER66x24/F24WeFed4Z8Zj7FFG
         YbAOlkf/0dyLEh9qmRodh1LreNYWb8NL3EeRd3DecB1OcDBN+k1G/B7oPBsmThNY65sj
         rVZIn/mSzz3rvUD+zUdNEiUzdeVcW0AcWDBU2c2vGN9Ro5YZ2BqqZ5QJ5VeQmufYErvb
         kU6g==
X-Forwarded-Encrypted: i=1; AL+hErG5mnjWdduBg8FrKstsX03jXNtpby4FHz9jlF3fZc91sjER4DjSkvkfYDUUnyKMnuLuGe3d+1o7QqdEf2oHMmqY@lists.infradead.org
X-Gm-Message-State: APuU4Z8rVOjKckENJnducoQkqoErohxj+ReHQ+GTQ/E9dLIoU/sk6tW0
	Rqq+xQgOUlkxrqR5CPQjjWvcSqOQuXK966n/RFp+jiZbm0sc+DIbKkpM
X-Gm-Gg: AZFdTZfTDneZnOuqpJufeGBS1QdqI3XUIY5tAtIIu6iPdxSM6p0KIO4RsZzlZoTyoer
	c1BgV+c+6zxwk26JDihDlWWZfpngBld0cefm/0rocjMXlbi+YNIkX3DNR7k+uB7CNmWG8zjqHT1
	JLW0LiXPGXH0irJz6KDbKdeB0M9cCHIqWaoDc6FiZB+YAKfBOnWGSFrHQXQ3HveCf/524fY1RQo
	6K5AITZDTo9rn4S453l+4wduzsHpLBeexOeRrafaSGWGI1HC4HIEvWrnsQP3/P4wfeBhIVtlGUh
	Tp7VeeJxzqgrNZhXH27BWE4OsrUh2HBLk8vPW4A9RyTGbygnVwh/CdEws8CvDWaODUYar9JE1Bn
	+081Hf/khWTFhD8E6VvN98qEaxfnVT/PZ/kWEEptTOOJuY5CpZIjNQ96Kh6E317zhKmJIxJZM8x
	0F5F0I2xdAW0GHTnRaRSde//HlzFXddGkMg0xXs1mOvqI/st02hGWDX4/jiOxNgtLFxPCU71/dh
	dXGq7Sxf+O2b4abckx/vhv08n02smkqU2I2WRZrtJJLwxosYhWLtOvjgQJUtNY5rSNVUPRJjY3U
	YDG5RLYi/KibD18i2Q5LI1t2bEBpZcLGishMtr3gkZsPz8Bsq4gfHt5pXTpLufOQuSlv2WRJqLC
	QovNnRD5XpG+Zh2i9f7AC
X-Received: by 2002:a05:7300:1c24:b0:384:a0cb:a6d0 with SMTP id 5a478bee46e88-3856de58f7fmr38385259eec.1.1795765695496;
        Thu, 26 Nov 2026 23:48:15 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:48:15 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:43 +0800
Subject: [PATCH v8 7/9] phy: rockchip-samsung-dcphy: Support the new
 phy-type and direction binding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-dcphy-rx-v1-v8-7-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=3409;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=v0EnQCVIVEgPp9E4a7EtrkAw5gnRZVFlWGkYOQI4nos=;
 b=XiX5z22zG63/plqtYdcSm4E2TGg/Wou7ui0q1v7PAXRCBGrd6wMD6SQdncjXk67WIz/1fFgAc
 GUjFYosi5NGAUuUppRZIHdIe39iOkjV7zHhyzD5BQKdlCRokfAjYp6v
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234816_741355_28BD8D4B 
X-CRM114-Status: GOOD (  14.66  )
X-Spam-Score: -1.9 (-)
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

The binding now selects the PHY with the cell and the mode of the block
with the phy-type property of the provider. Read phy-type in probe,
D-PHY by default.

of_xlate() returns the transmitter for PHY_DIRECTION_TX. The deprecated
PHY_TYPE_DPHY and PHY_TYPE_CPHY select the transmitter as today, so
existing DTs are unaffected.

A phy-type other than D-PHY or C-PHY fails probe. A deprecated cell
value that does not match phy-type gets a warning, and the transmitter
then refuses to power on, as in C-PHY mode today.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 32 ++++++++++++++++++-----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7a62db810d4b..1228bd794759 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -309,6 +309,7 @@ struct samsung_mipi_dcphy {
 	struct reset_control *grf_apb_rst;
 	struct samsung_mipi_phy tx;
 	u8 type;
+	bool legacy_mismatch;
 
 	const struct samsung_mipi_dcphy_plat_data *pdata;
 };
@@ -1384,6 +1385,9 @@ static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
+	if (samsung->legacy_mismatch)
+		return -EOPNOTSUPP;
+
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
 		return samsung_mipi_dphy_tx_power_on(samsung);
@@ -1557,13 +1561,21 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (samsung->type != PHY_NONE && samsung->type != args->args[0])
-		dev_warn(dev, "phy type select %d overwriting type %d\n",
-			 args->args[0], samsung->type);
-
-	samsung->type = args->args[0];
-
-	return samsung->tx.phy;
+	switch (args->args[0]) {
+	case PHY_DIRECTION_TX:
+		return samsung->tx.phy;
+	case PHY_TYPE_DPHY:
+	case PHY_TYPE_CPHY:
+		if (args->args[0] != samsung->type) {
+			dev_warn(dev, "unsupported phy cell %u with phy-type %u\n",
+				 args->args[0], samsung->type);
+			samsung->legacy_mismatch = true;
+		}
+		return samsung->tx.phy;
+	default:
+		dev_err(dev, "invalid phy cell %u\n", args->args[0]);
+		return ERR_PTR(-EINVAL);
+	}
 }
 
 static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
@@ -1574,6 +1586,7 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct resource *res;
 	void __iomem *regs;
+	u32 type = PHY_TYPE_DPHY;
 	int ret;
 
 	samsung = devm_kzalloc(dev, sizeof(*samsung), GFP_KERNEL);
@@ -1628,6 +1641,11 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(samsung->grf_apb_rst),
 				     "Failed to get system grf_apb_rst control\n");
 
+	of_property_read_u32(np, "phy-type", &type);
+	if (type != PHY_TYPE_DPHY && type != PHY_TYPE_CPHY)
+		return dev_err_probe(dev, -EINVAL, "unsupported phy-type %u\n", type);
+	samsung->type = type;
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");

-- 
2.43.0


