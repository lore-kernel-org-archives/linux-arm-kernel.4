Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D844606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T1Irx/Lt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymUUZJ/1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jXCW++VVO806qSYM/VOtniyWY+nkvvMGcOGUW1ghuaM=; b=T1Irx/LtuGxqZU
	HOvX3j/8xxB8+iJND1z0QQQLAGMchBMDq7M8uyv0MH0RiG2sGbc16tbmf6x6mlB3CHHnhfUc0bSMa
	7++KVms2NP1HnI7UJTTApvkywyEllG+pEKz2WTqPootFtkD2Euhzj49duNjuA6668yZ/dum5PM7MC
	huk7G5OEWjmyHacyCFhKCj9usN9RNdce1x97Vu4BHuS5q0bweDMFhdqwS+400sakTIb/O8bscLIvu
	0YWJ6NPZOZuEWrZl4SUok/te+zIH3viS4vXNfTkwsD7TlImWnU8u5Pbn9j242mLnUSfZ/Ds/QTTRp
	87o+WSKNEUJESgPRHemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh4C-00000003598-3TI7;
	Tue, 10 Nov 2026 08:18:56 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh43-000000034uQ-43PE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:18:50 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-17e82de56ccso47287c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 00:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298727; x=1794903527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXCW++VVO806qSYM/VOtniyWY+nkvvMGcOGUW1ghuaM=;
        b=ymUUZJ/10HrVioSE7W88pkILqdYa4KnMPdIP1vMk9bgj8Zz8dPrYxOAaqzWAmSrjVB
         /tIHm9Bzdysz4wFodVORNNhOWlFd2s51R634EOFePHKdsFygdEFSy3hjJS5GS4lwMYmV
         4DYCHjooK54/nxHKv/JP3HsvQ7SOCuJD6jH8OPhiq7GSHjfejPpn3t3baHlOFo0nErN4
         QliJhJEm8DparDadA/XzPF88Xk6UnbQxlNFsxgEUDgZB/nHGMUOzDjXmqz72GQ8Zq25y
         O0w3V2rUh5G6JV8UvRbHfuv4j7ahgTdxUr0Nj0fP5q5OOAwiS3Mk79R046QjjkYi3p5Y
         UUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298727; x=1794903527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXCW++VVO806qSYM/VOtniyWY+nkvvMGcOGUW1ghuaM=;
        b=EOLlhyft1a+iz2apI9UYi/+rJwh0d/EF+w7tZuinX08AyCxIkaG5O7xVYhMWFaEXJd
         nRq9ELW0xR/y8ZdLJY7q5O5L5SFGboQpX06xngq90R4OBJt5zeko+WFgACSWuR+Or4OM
         EWwo2NIrs1K30zot50fDNHpbhikMnIX1KzB3TzHb0Ce1vCZPYoXJDsbwUgwn8p3hKPcO
         Y3zk7U+SOI9v/RmP7P0WXC0vYW/v2SHR9mgj0zXMIiAT/0Vu632WVfDafedvMvirhJTN
         03uBXxUMQMWPYEqSwYE1VpUrgQTMQ6QqeRt6Jr0Ky84xA/VxdV4tq7jNywGEHiPcWha6
         VMfw==
X-Forwarded-Encrypted: i=1; AL+hErEF9GEoMj88HuRnmyqBHYrHggK2jHJRiMoEZ0JbUA20o/auc4THOYBGpg7PX3I7lYwERsuTV6jpYsaOfIGeyfdB@lists.infradead.org
X-Gm-Message-State: APuU4Z/77jgSOSZSuHqMKjSNGtKeOz3vQQYVZshPUGqCfE1jV+fG9mBH
	f5W7PiVBJQFQ4ZQ7j70L02eSAyJnUBSDpEw4W8+E0AE2Gj+RM6vfUh7G
X-Gm-Gg: AYBFou0kiLsvOjZojpo7rt6VItZEwF2xnZYPN3vK+7RYm1xUlrwGA6C32kWvDuXo1cH
	1clkCsh0FR8I6Q2d0HOoAaMYySkW+ilNbeCc+vngWhwkYspbVxGmyVzqmMsc5LBcn38p9ggTdhl
	dS/YJW8lhXm3YM25buBEVSb4t4RR3LwLg8sO1R15lwkdUdxm2M/YUXjTIU0A+pCPHIkwVu+elvI
	0hs6iLVctlopFnVsbbDUKkIttcVN6jHln1ydh5CO8lM/wSWgHTxkpgrhXL9MC4viNkamE+/h13c
	NvQ3/9ObS+vkNCQI4OmvcZ1c4z15tk5FyweJenNwZ63JHkLf06YXtnyAbRocHmlY2Vqy58ZN+BR
	f/v15c2veycr5lTuh7iA/ykJnTnTgDFX22Za6dnZqayc7dRWLWqt3HArsqEcxoRPPwR2Kl5iwpL
	myTbg3lfvWLhw+JqmGHbuX2Enr5PM3R0HZc4M7anCs1A3AO4M7vDGGiWBr8fpMONqhuBtZisyhn
	VFy7NVe8TIkeT2Wwb9d3q+bw3sH85GPku63Om0f3ZmqutKp4pISDzjUK3qmLUJ+h7arbvZQDpAW
	SI1kk/BrkjcaWSsqoV8Al4Sp8Nn9goTEAMSXheGufUePbjhSugZp/mMzkNPf
X-Received: by 2002:a05:7022:f502:b0:17f:641e:7f6b with SMTP id a92af1059eb24-1b3b5fbb37bmr3714465c88.1.1794298726441;
        Tue, 10 Nov 2026 00:18:46 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:45 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:10 +0800
Subject: [PATCH v6 7/9] phy: rockchip-samsung-dcphy: Support the new
 phy-type and direction binding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dcphy-rx-v1-v6-7-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
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
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298692; l=3244;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=MPlZcYdBOTjm8N+T+zD2aiKGVlTXPixFaSZAXRG0uQg=;
 b=XVX/t4VGDXdsU4HAGnmDCJBr3P5Q0oy9IN4FMcahsrkLVyV+WADTyFODqoZvgPE50AThjSsY1
 ikf+XRGvmjbDHUXbklTj1jfDUcwtwaj85cfRiGe8zNBMKCeJSDQxIOb
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_001848_033726_CE26787E 
X-CRM114-Status: GOOD (  15.72  )
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
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 32 ++++++++++++++++++-----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index c40c84791eca..e8e229fc4856 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -297,6 +297,7 @@ struct samsung_mipi_dcphy {
 	struct reset_control *grf_apb_rst;
 	struct samsung_mipi_phy tx;
 	u8 type;
+	bool legacy_mismatch;
 
 	const struct samsung_mipi_dcphy_plat_data *pdata;
 	struct {
@@ -1376,6 +1377,9 @@ static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
+	if (samsung->legacy_mismatch)
+		return -EOPNOTSUPP;
+
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
 		return samsung_mipi_dphy_tx_power_on(samsung);
@@ -1549,13 +1553,21 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
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
@@ -1566,6 +1578,7 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct resource *res;
 	void __iomem *regs;
+	u32 type = PHY_TYPE_DPHY;
 	int ret;
 
 	samsung = devm_kzalloc(dev, sizeof(*samsung), GFP_KERNEL);
@@ -1620,6 +1633,11 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
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


