Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F5360A2623
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t+LBUvAo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbXXSqXh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Mp9IyFvT16+hX88RJrtjgklK+/LOWFoJEWqYM2GWuMQ=; b=t+LBUvAogOQCgE
	o9Vey7cF9jhHpxENiX4m682ZRJyVgt6/WCTWFogvTYRkzyuCTkP+4+VNkQ0+q6hv6IXIyZSuLFnVm
	qpLB1+j7BH9bvFSCLcLTnWjIoiZ21j2RGLUjjwcJ8cfkCgi01TsqRUhgK+jCzLTP5I2eZ+ZhRgQn9
	43pgbz+Hte5juSDACRAYD2bEQRSwIqG6tUvXnTjrvRZV9qQbxwXSFBfgSQy8/bmXDrIxUvO4apMtF
	DB0I2Sb2UlNeUqVs3lBBPeAhcEba8bS7utFvCslx+alYNUspBpGhdCp2HWbYFSBnmaxKRD4qS5Iha
	pVFtuaENoTxN5r9bOHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh3w-000000034jK-3ghK;
	Tue, 10 Nov 2026 08:18:40 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh3r-000000034Zi-47fE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:18:38 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1a607a2e2bcso48537c88.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 00:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298715; x=1794903515; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mp9IyFvT16+hX88RJrtjgklK+/LOWFoJEWqYM2GWuMQ=;
        b=XbXXSqXhp4n8eiwxn0x8r61PHyp0PDnN6f1lUXdwPWvuhcgcVZo23UrZNjqUmXxSJ1
         5e7fOuoVou08sGqptSuv8l8CFXpFw2mL6C4uPMdK2ad+v19ZGbqJTcQPy9bML4pDcC1m
         iC46vx9LJx4ob+SmP9ai8a5Vuee91WpSibTSuMbHU5pXfjrNSRRjrQQ/RdqV/zRFJXAC
         Zw76ldFQGZOTMSdLKlOOXr3Jy9hAUAPBSJlyMi3LsVSvReMIKGmJK11rHDv1HownyXdy
         dKjzlOXPsP1IBcNnruT7gCpWD2JA/3F/4RrkAf2J5D3Z/fswjhZtNdMfYGdDTyoWLV2O
         v4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298715; x=1794903515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mp9IyFvT16+hX88RJrtjgklK+/LOWFoJEWqYM2GWuMQ=;
        b=IU5aUFxvnmsTtX7uvpnwHw3J3kpYhK8ZGaxN1gUSAYCQiYi+r6W5Gu8OqLYqpY8YSq
         zTgNjmCzRyk51zkRiPDmdoVTclZehSUMZM6RJ9gBQIh+wR0mqcCSpRoJKheoLWJ7uZQ8
         PVUIYBrJKIg3ib6ATMtDsFgfT5xlBZbHaO8YsEJd+0RdibpBMgcJViHcy8BLOMSE4lMM
         9tAomRpdWy2zFE7g5ZjY3Z1IkuEKd8gXDSONNIcj+1LpbxOl0NFTxFx4tokxwSkEZXz/
         KuDUI1iJMyxXjwwWmFiTtZrlRDV8yxsXJBomWPp1PjnDH91ocLdKrwWA/Fxe4m8kYDfp
         ctTQ==
X-Forwarded-Encrypted: i=1; AL+hErEuFvPcBYOSsAlpdE07Gtrk92UPAsH/NJrEGf9tvjsmRamk3I8xpyoUu8fejzQUOj/4BudhJu95YkaTbNwvUQE6@lists.infradead.org
X-Gm-Message-State: APuU4Z/fGuupbRcbJ0F0+NKdxPcc4ugfpVKAhC6CkHmx1bXl2pWAi26o
	CWO3FeC2eBmPVvGsYMCM2zzqBO0nuD7qsytyzueVPCxYrSHzkIQCGBhz
X-Gm-Gg: AYBFou0V5OvjMp4L+U40oSl7kskIfu6/TSLAdBJs4hra08njLb3+NiDzmGFG9mA/7o6
	U5CzVqUggnUMJyuE02NRak4Ex6HIxMxtUQIKiqW3UWJSSv57G05GeS/Sd5XoIjHIwLghwwsDslx
	Ed9ayoq30cYz9YUaVl9pCPwnJDcxR2MCmjK7eXDwkx7q6LaZdRPk3QyN8GaCoywIF4yTzCM9Bb6
	cELf2W1HYRKcTZZtiLan07l878VjYgTA6uHNI1A/5SpXABSvmtijRaQacuC7HcdTyXTwo8PMjWW
	kopHHNhTnVh2rTEVm+bfbzAiTrPFgkhOJaW9tKDV4h8nUK4qQ1Z04JjVx8C9ceuYRlRG+5JbCij
	xCLfVbuloaIVlHM5QkDDcKzhcX8XMT0FTF5ol0OyXDok+xJ3iqITCMrrZKnEzuiwzYOpBr5PPlk
	uZBIlTME+OjzRGzdEhqKpRrTAcyh3pWRNwYv0ziKrI+ayZvvq4+fSehh6S4StheolO6dutUIDje
	zFaCkvUNafm9PRhim1H/CBvx5grzYQ0OOHUHylojm/ajTx5SaWAFtG5e6NPTqWfIO4TFTpprmOb
	ZDHNBgIRHUMO49cqj9Fv9vWtq/DhFvOWmQt0dE1nxyDfcHE3Zeo3Ooug/iqHb+S2dxUq/Cvx1Ga
	vsF4LTQ==
X-Received: by 2002:a05:701b:290a:b0:16b:4f52:a08 with SMTP id a92af1059eb24-1b3b5bc5b75mr3383821c88.0.1794298714350;
        Tue, 10 Nov 2026 00:18:34 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:32 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:07 +0800
Subject: [PATCH v6 4/9] phy: rockchip-samsung-dcphy: Always write the
 rate-dependent registers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dcphy-rx-v1-v6-4-d681ba20b36a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298691; l=2619;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=LIh1d9RdBI9/gBSpmLf2Ww3xecRtR289gfN7TNiw1rk=;
 b=vh7WtesJEslT9LQa1QgtXchs2lhrai6pBKF9E8aFtdAdpc8JEMUwWFHoiWRWDV5rnQJfNXII2
 CyvmkFGqTM0Cpv/XpwfG7MNyurBRtigfnqqPGRKy5yIICDDKwRT+Ojn
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_001836_071192_B809C924 
X-CRM114-Status: GOOD (  13.20  )
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

The lane timing init functions write DPHY_MC_ANA_CON1, the four data
lane ANA_CON1 registers and DPHY_MC_DESKEW_CON0 only above a data
rate threshold, and the registers have to be zero below it [1].

Today the APB reset at the start of every power_on provides the zero.

A later change moves that reset to runtime resume, so a power_on at a
lower rate after a higher one would keep the old values.

Write the registers on every power_on, with zero below the threshold.

[1] RK3588 TRM: sections 22.4.2 (reset values) and 22.4.3
    (DPHY_MC_ANA_CON1, DPHY_MC_DESKEW_CON0)

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 24 +++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index ce1bc62497c5..7a009d87a665 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1228,7 +1228,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MC_ANA_CON0, val);
 
 	if (lane_hs_rate >= 4500)
-		regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, 0x0001);
+		val = 0x0001;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, val);
 
 	val = 0;
 	/*
@@ -1259,7 +1262,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	 * under 1.5Gbps or equal to 1.5Gbps.
 	 */
 	if (lane_hs_rate > 1500)
-		regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, 0x9cb1);
+		val = 0x9cb1;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, val);
 }
 
 static void
@@ -1284,12 +1290,14 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON0, val);
 	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON0, val);
 
-	if (lane_hs_rate >= 4500) {
-		regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, 0x0001);
-	}
+	if (lane_hs_rate >= 4500)
+		val = 0x0001;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, val);
+	regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, val);
+	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, val);
+	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, val);
 
 	val = 0;
 	/*

-- 
2.43.0


