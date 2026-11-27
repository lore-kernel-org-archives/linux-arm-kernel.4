Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2798606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dJVxaQgw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OeOpw33R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EIhmNBsounwkOzh9MPAQjE3uM4JPz9g9ngNewODK+ks=; b=dJVxaQgw8ae5hS
	nOIHZb/HSohLH7ChI/gPJDhrrbKkNkkbAguE88ks7EV0vEtXXzr35j0Nr5+e7EbzpqE4WICqp1lnX
	hcQRtMzWytz8xPBJqRaxFWTRXV3Pid75IdF/k4aribg+yftE7IFcvo09Lnn08XpXyZB486HpngUOX
	0kD7nbBlDxIfaiWTRmZOGzSE5raX2On6vSB5Zc3XlJTt9NpNTzIjeSD/KfsuwOYDPxJ25gNx8TV4G
	c6C4mSOwmuf55LrvxkEE70SIZedNGDePl3wywBr1vGV3vBglzVIR78NQ0hTTNcKue9tkoG9GyYIMf
	a7SckGWec/oy+c9AN7xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqh3-0000000FCBU-14V0;
	Fri, 27 Nov 2026 07:48:29 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqgn-0000000FBr4-0ELp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:48:14 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-38622e0dae0so837603eec.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 23:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765692; x=1796370492; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIhmNBsounwkOzh9MPAQjE3uM4JPz9g9ngNewODK+ks=;
        b=OeOpw33RTRg6NAEglgWVa/pcv6MXaX0v5hYxLBcoIdnvpJm8SCUcf9zIZPVuS6VHyy
         P2TeS3ttbzGkY6jpBRRoLjkgxfhkmrLpFsG/7QIlaTdxYEl4U4X+wmyQeXy9J3jXhr7c
         x9+n3LNcGY4ETL9LgyR3ejRHs6IFAHpaNs70wiTFikuqGpJnQ0mi4n5gclQPfjIFtwL4
         Vq8csbaLyvQZ3ymbnWQLM41nCedXINyEVkP7439/bBnx2pXbhVs5beX5qfSSv8TAuV/6
         dQ2kpTu738XFprMLpbPIpx+y5IgirMPUHR1IX4+AuQV+OTNknUbKVdXC+mGE5VYRaslu
         YX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765692; x=1796370492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EIhmNBsounwkOzh9MPAQjE3uM4JPz9g9ngNewODK+ks=;
        b=fxE3ukd8t2jTipQnh2Q41zGosEDV2X5RH5LIXSRyXDw5BTOsJKxuyi7lxC/DhPJ1Om
         /ZOrKQ+Mv7481hroTs2dUd/g8Glm26LAW44UUmT/zuOOaao0OLc+cNQMO3g0hsq89G8c
         iVTZYxYSMil0OU+BDsvlVXhq7j1qTONHZPvDVKzNi8ZFRcFSfmFMpTx0S8xp9cjHP06z
         j+5ueXeTR8Wm5R916Sofu12KXzqvKjazl37sz4RPpqq/Ns3c1UfY1BqEjC6TnU4WBlWX
         B7cYokyatjAyb0xc3n+Btqi8/ktT3pFFjwclbUoHlVY8AWAqRAVcDkDbZUDAUP8drmqh
         e68A==
X-Forwarded-Encrypted: i=1; AL+hErHxJ5TNHs8mT/8625PPe55QLq6Tcy2g/+o9hC4JA+xdDMIozaC+GcJW/vf1/vcEn2Jr+J4tPclmOfloevElZtqf@lists.infradead.org
X-Gm-Message-State: APuU4Z8seCbDl4aNLQYOgPj9nHtXPnsWGEV4tda9ba5PkdvKGgN4zLyZ
	n8upVCLII0ndYlVkxVLB3u9xh8XuOZ2JL1C4ED7QYOEdzw92ufJBcPz0
X-Gm-Gg: AZFdTZda3lMDf2HVTbZrrIwzkIkLbPTFQ865JyKwaojgsZ8QjOj9stBBUXj0Hvc1QLm
	6RT7me38Se99+Y8dW7cF3VJsO1rGNb2YzCPYq86Kxmj/VoDjV3DoKUWryWKiW6LjFrxnouV9alO
	gnmcilG2asZpPU3hUBwIUmDb68NYzI9Mq7TRu/8Lf1a72Dt3KLJV6mqBPfSnA9A2E1ajhZhOvqq
	xSO2KZLXECRnoAZX5usb+hfUpl+HjEG87uz/a6F9pLLrFsNiwKrTxQWx3W/aOr66E8WGFcEeomi
	Xm6D185oqVkEm6gMoTO/oYV7ie956Sl5vRsucOwf0FChQXbzLUZT7dP15mTCXjU+xnBJXsumMhQ
	rp2LMIDd4eWKw0OQMkeKGF1Dg4QJVvn64qztUVssegAMthZLW+My1mWgg+M9qaGGtKgkTAzrDZ7
	0K8b1Ardi2987l2K39zrVVLIU3kZIi6LYxsu6J5rEA2+gD3Totuhvm3qM/ljkIznZtryba8Sscv
	1NT4c9shYyzX5/Rb9Zzy9KGRSnkWkFGge/eaqYkRhFY6pNXomvj+kMji22EV5+mUorWhCOiX6sc
	13brRrvwZScXEduzGI4L3z+NHm2lHwcRUio61j2dA5M6KuFKWWtGSJOCuXx3grVMMw2+g90CUj1
	xUZHK5/cwxHeJV9AhRysi
X-Received: by 2002:a05:693c:829b:10b0:386:c3c4:b914 with SMTP id 5a478bee46e88-386c3c4ba54mr17607081eec.0.1795765691737;
        Thu, 26 Nov 2026 23:48:11 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:48:11 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:42 +0800
Subject: [PATCH v8 6/9] phy: rockchip-samsung-dcphy: Name the transmitter
 helpers and ops
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-dcphy-rx-v1-v8-6-9ddfef99221d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=16084;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=Zo8+/a6CFxDqnd22X5LZIaPTYR00Q/pHx4xsGGgESLA=;
 b=Iryu/snHbdGnq7R/Ov8is0xIUAmJcf5UFRzZWjB4TMjQeYB4m7+dYxL0Pel9luJoUOUdGAMBf
 1NIFeXtQLpXCwO5USrzCLTKkA6UGWc9njd9ut5bhx6ekjR46HjME4nP
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234813_137113_817DF720 
X-CRM114-Status: GOOD (  17.83  )
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

The block is a combo PHY: it exposes a transmitter and a receiver, and a
later change registers one struct phy for each. Prepare for that. Give
every helper that programs the master lanes a tx_ prefix, and move the
phy pointer, the lane count, the master reset and the PLL state, which
only the transmitter uses, into a struct samsung_mipi_phy that the
receiver can have one of too.

Name the phy_ops and its callbacks after the transmitter as well, so
that the receiver can bring its own rather than share these.

No functional change intended.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 193 ++++++++++++----------
 1 file changed, 103 insertions(+), 90 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index d6acc3e2d448..7a62db810d4b 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -280,21 +280,11 @@ struct samsung_mipi_dcphy_plat_data {
 	u32 dphy_tx_max_lane_kbps;
 };
 
-struct samsung_mipi_dcphy {
-	struct device *dev;
-	struct clk *ref_clk;
-	struct clk *pclk;
-	struct regmap *regmap;
-	struct regmap *grf_regmap;
-	struct reset_control *m_phy_rst;
-	struct reset_control *s_phy_rst;
-	struct reset_control *apb_rst;
-	struct reset_control *grf_apb_rst;
-	unsigned int lanes;
+struct samsung_mipi_phy {
 	struct phy *phy;
-	u8 type;
-
-	const struct samsung_mipi_dcphy_plat_data *pdata;
+	unsigned int lanes;
+	struct reset_control *phy_rst;
+	/* TX only */
 	struct {
 		unsigned long long rate;
 		u8 prediv;
@@ -308,6 +298,21 @@ struct samsung_mipi_dcphy {
 	} pll;
 };
 
+struct samsung_mipi_dcphy {
+	struct device *dev;
+	struct clk *ref_clk;
+	struct clk *pclk;
+	struct regmap *regmap;
+	struct regmap *grf_regmap;
+	struct reset_control *s_phy_rst;
+	struct reset_control *apb_rst;
+	struct reset_control *grf_apb_rst;
+	struct samsung_mipi_phy tx;
+	u8 type;
+
+	const struct samsung_mipi_dcphy_plat_data *pdata;
+};
+
 struct samsung_mipi_dphy_timing {
 	unsigned int max_lane_mbps;
 	u8 clk_prepare;
@@ -989,13 +994,13 @@ static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *sams
 			   I_MUX_SEL_MASK, I_MUX_400MV);
 }
 
-static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
+static void samsung_mipi_dphy_tx_lane_enable(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_write(samsung->regmap, DPHY_MC_GNR_CON1, T_PHY_READY(0x2000));
 	regmap_update_bits(samsung->regmap, DPHY_MC_GNR_CON0,
 			   PHY_ENABLE, PHY_ENABLE);
 
-	switch (samsung->lanes) {
+	switch (samsung->tx.lanes) {
 	case 4:
 		regmap_write(samsung->regmap, DPHY_MD3_GNR_CON1,
 			     T_PHY_READY(0x2000));
@@ -1024,9 +1029,10 @@ static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
 	}
 }
 
-static void samsung_mipi_dphy_lane_disable(struct samsung_mipi_dcphy *samsung)
+static void
+samsung_mipi_dphy_tx_lane_disable(struct samsung_mipi_dcphy *samsung)
 {
-	switch (samsung->lanes) {
+	switch (samsung->tx.lanes) {
 	case 4:
 		regmap_update_bits(samsung->regmap, DPHY_MD3_GNR_CON0,
 				   PHY_ENABLE, 0);
@@ -1049,29 +1055,32 @@ static void samsung_mipi_dphy_lane_disable(struct samsung_mipi_dcphy *samsung)
 	regmap_update_bits(samsung->regmap, DPHY_MC_GNR_CON0, PHY_ENABLE, 0);
 }
 
-static void samsung_mipi_dcphy_pll_configure(struct samsung_mipi_dcphy *samsung)
+static void
+samsung_mipi_dcphy_tx_pll_configure(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_update_bits(samsung->regmap, PLL_CON0, S_MASK | P_MASK,
-			   S(samsung->pll.scaler) | P(samsung->pll.prediv));
+			   S(samsung->tx.pll.scaler) |
+			   P(samsung->tx.pll.prediv));
 
-	if (samsung->pll.dsm < 0) {
+	if (samsung->tx.pll.dsm < 0) {
 		u16 dsm_tmp;
 
 		/* Using opposite number subtraction to find complement */
-		dsm_tmp = abs(samsung->pll.dsm);
+		dsm_tmp = abs(samsung->tx.pll.dsm);
 		dsm_tmp = dsm_tmp - 1;
 		dsm_tmp ^= 0xffff;
 		regmap_write(samsung->regmap, PLL_CON1, dsm_tmp);
 	} else {
-		regmap_write(samsung->regmap, PLL_CON1, samsung->pll.dsm);
+		regmap_write(samsung->regmap, PLL_CON1, samsung->tx.pll.dsm);
 	}
 
 	regmap_update_bits(samsung->regmap, PLL_CON2,
-			   M_MASK, M(samsung->pll.fbdiv));
+			   M_MASK, M(samsung->tx.pll.fbdiv));
 
-	if (samsung->pll.ssc_en) {
+	if (samsung->tx.pll.ssc_en) {
 		regmap_write(samsung->regmap, PLL_CON3,
-			     MRR(samsung->pll.mrr) | MFR(samsung->pll.mfr));
+			     MRR(samsung->tx.pll.mrr) |
+			     MFR(samsung->tx.pll.mfr));
 		regmap_update_bits(samsung->regmap, PLL_CON4, SSCG_EN, SSCG_EN);
 	}
 
@@ -1080,7 +1089,7 @@ static void samsung_mipi_dcphy_pll_configure(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, PLL_CON8, PLL_STB_CNT(0xf000));
 }
 
-static int samsung_mipi_dcphy_pll_enable(struct samsung_mipi_dcphy *samsung)
+static int samsung_mipi_dcphy_tx_pll_enable(struct samsung_mipi_dcphy *samsung)
 {
 	u32 sts;
 	int ret;
@@ -1095,17 +1104,18 @@ static int samsung_mipi_dcphy_pll_enable(struct samsung_mipi_dcphy *samsung)
 	return ret;
 }
 
-static void samsung_mipi_dcphy_pll_disable(struct samsung_mipi_dcphy *samsung)
+static void
+samsung_mipi_dcphy_tx_pll_disable(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_update_bits(samsung->regmap, PLL_CON0, PLL_EN, 0);
 }
 
 static const struct samsung_mipi_dphy_timing *
-samsung_mipi_dphy_get_timing(struct samsung_mipi_dcphy *samsung)
+samsung_mipi_dphy_tx_get_timing(struct samsung_mipi_dcphy *samsung)
 {
 	const struct samsung_mipi_dphy_timing *timings;
 	unsigned int num_timings;
-	unsigned int lane_mbps = div64_ul(samsung->pll.rate, USEC_PER_SEC);
+	unsigned int lane_mbps = div64_ul(samsung->tx.pll.rate, USEC_PER_SEC);
 	unsigned int i;
 
 	timings = samsung_mipi_dphy_timing_table;
@@ -1119,9 +1129,9 @@ samsung_mipi_dphy_get_timing(struct samsung_mipi_dcphy *samsung)
 }
 
 static unsigned long
-samsung_mipi_dcphy_pll_round_rate(struct samsung_mipi_dcphy *samsung,
-				  unsigned long prate, unsigned long rate,
-				  u8 *prediv, u16 *fbdiv, int *dsm, u8 *scaler)
+samsung_mipi_dcphy_tx_pll_round_rate(struct samsung_mipi_dcphy *samsung,
+				     unsigned long prate, unsigned long rate,
+				     u8 *prediv, u16 *fbdiv, int *dsm, u8 *scaler)
 {
 	u32 max_fout = samsung->pdata->dphy_tx_max_lane_kbps;
 	u64 best_freq = 0;
@@ -1208,13 +1218,14 @@ samsung_mipi_dcphy_pll_round_rate(struct samsung_mipi_dcphy *samsung,
 }
 
 static void
-samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
+samsung_mipi_dphy_tx_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 {
 	const struct samsung_mipi_dphy_timing *timing;
-	unsigned int lane_hs_rate = div64_ul(samsung->pll.rate, USEC_PER_SEC);
+	unsigned int lane_hs_rate = div64_ul(samsung->tx.pll.rate,
+					     USEC_PER_SEC);
 	u32 val, res_up, res_down;
 
-	timing = samsung_mipi_dphy_get_timing(samsung);
+	timing = samsung_mipi_dphy_tx_get_timing(samsung);
 	regmap_write(samsung->regmap, DPHY_MC_GNR_CON0, 0xf000);
 
 	/*
@@ -1269,13 +1280,14 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 }
 
 static void
-samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
+samsung_mipi_dphy_tx_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 {
 	const struct samsung_mipi_dphy_timing *timing;
-	unsigned int lane_hs_rate = div64_ul(samsung->pll.rate, USEC_PER_SEC);
+	unsigned int lane_hs_rate = div64_ul(samsung->tx.pll.rate,
+					     USEC_PER_SEC);
 	u32 val, res_up, res_down;
 
-	timing = samsung_mipi_dphy_get_timing(samsung);
+	timing = samsung_mipi_dphy_tx_get_timing(samsung);
 
 	/*
 	 * The Drive-Strength / Voltage-Amplitude is adjusted by adjusting the
@@ -1340,25 +1352,25 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MD3_TIME_CON4, 0x1f4);
 }
 
-static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
+static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
 {
 	int ret;
 
-	reset_control_assert(samsung->m_phy_rst);
+	reset_control_assert(samsung->tx.phy_rst);
 
-	samsung_mipi_dcphy_pll_configure(samsung);
-	samsung_mipi_dphy_clk_lane_timing_init(samsung);
-	samsung_mipi_dphy_data_lane_timing_init(samsung);
-	ret = samsung_mipi_dcphy_pll_enable(samsung);
+	samsung_mipi_dcphy_tx_pll_configure(samsung);
+	samsung_mipi_dphy_tx_clk_lane_timing_init(samsung);
+	samsung_mipi_dphy_tx_data_lane_timing_init(samsung);
+	ret = samsung_mipi_dcphy_tx_pll_enable(samsung);
 	if (ret < 0) {
-		samsung_mipi_dcphy_pll_disable(samsung);
-		reset_control_deassert(samsung->m_phy_rst);
+		samsung_mipi_dcphy_tx_pll_disable(samsung);
+		reset_control_deassert(samsung->tx.phy_rst);
 		return ret;
 	}
 
-	samsung_mipi_dphy_lane_enable(samsung);
+	samsung_mipi_dphy_tx_lane_enable(samsung);
 
-	reset_control_deassert(samsung->m_phy_rst);
+	reset_control_deassert(samsung->tx.phy_rst);
 
 	/* The TSKEWCAL maximum is 100 µsec
 	 * at initial calibration.
@@ -1368,13 +1380,13 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 	return 0;
 }
 
-static int samsung_mipi_dcphy_power_on(struct phy *phy)
+static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
-		return samsung_mipi_dphy_power_on(samsung);
+		return samsung_mipi_dphy_tx_power_on(samsung);
 	default:
 		/* CPHY part to be implemented later */
 		return -EOPNOTSUPP;
@@ -1383,31 +1395,31 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 	return 0;
 }
 
-static int samsung_mipi_dcphy_power_off(struct phy *phy)
+static int samsung_mipi_dcphy_tx_power_off(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
-		samsung_mipi_dphy_lane_disable(samsung);
+		samsung_mipi_dphy_tx_lane_disable(samsung);
 		break;
 	default:
 		/* CPHY part to be implemented later */
 		return -EOPNOTSUPP;
 	}
 
-	samsung_mipi_dcphy_pll_disable(samsung);
+	samsung_mipi_dcphy_tx_pll_disable(samsung);
 
 	return 0;
 }
 
 static int
-samsung_mipi_dcphy_pll_ssc_modulation_calc(struct samsung_mipi_dcphy *samsung,
-					   u8 *mfr, u8 *mrr)
+samsung_mipi_dcphy_tx_pll_ssc_modulation_calc(struct samsung_mipi_dcphy *samsung,
+					      u8 *mfr, u8 *mrr)
 {
 	unsigned long fin = div64_ul(clk_get_rate(samsung->ref_clk), MSEC_PER_SEC);
-	u16 prediv = samsung->pll.prediv;
-	u16 fbdiv = samsung->pll.fbdiv;
+	u16 prediv = samsung->tx.pll.prediv;
+	u16 fbdiv = samsung->tx.pll.fbdiv;
 	u16 min_mfr, max_mfr;
 	u16 _mfr, best_mfr = 0;
 	u16 mr, _mrr, best_mrr = 0;
@@ -1447,8 +1459,8 @@ samsung_mipi_dcphy_pll_ssc_modulation_calc(struct samsung_mipi_dcphy *samsung,
 }
 
 static void
-samsung_mipi_dcphy_pll_calc_rate(struct samsung_mipi_dcphy *samsung,
-				 unsigned long long rate)
+samsung_mipi_dcphy_tx_pll_calc_rate(struct samsung_mipi_dcphy *samsung,
+				    unsigned long long rate)
 {
 	unsigned long prate = clk_get_rate(samsung->ref_clk);
 	unsigned long fout;
@@ -1458,46 +1470,46 @@ samsung_mipi_dcphy_pll_calc_rate(struct samsung_mipi_dcphy *samsung,
 	int dsm = 0;
 	int ret;
 
-	fout = samsung_mipi_dcphy_pll_round_rate(samsung, prate, rate,
-						 &prediv, &fbdiv, &dsm,
-						 &scaler);
+	fout = samsung_mipi_dcphy_tx_pll_round_rate(samsung, prate, rate,
+						    &prediv, &fbdiv, &dsm,
+						    &scaler);
 
 	dev_dbg(samsung->dev, "%s: fin=%lu, req_rate=%llu\n",
 		__func__, prate, rate);
 	dev_dbg(samsung->dev, "%s: fout=%lu, prediv=%u, fbdiv=%u\n",
 		__func__, fout, prediv, fbdiv);
 
-	samsung->pll.prediv = prediv;
-	samsung->pll.fbdiv = fbdiv;
-	samsung->pll.dsm = dsm;
-	samsung->pll.scaler = scaler;
-	samsung->pll.rate = fout;
+	samsung->tx.pll.prediv = prediv;
+	samsung->tx.pll.fbdiv = fbdiv;
+	samsung->tx.pll.dsm = dsm;
+	samsung->tx.pll.scaler = scaler;
+	samsung->tx.pll.rate = fout;
 
 	/*
 	 * All DPHY 2.0 compliant Transmitters shall support SSC operating above
 	 * 2.5 Gbps
 	 */
 	if (fout > 2500000000LL) {
-		ret = samsung_mipi_dcphy_pll_ssc_modulation_calc(samsung,
-								 &mfr, &mrr);
+		ret = samsung_mipi_dcphy_tx_pll_ssc_modulation_calc(samsung,
+								    &mfr, &mrr);
 		if (!ret) {
-			samsung->pll.ssc_en = true;
-			samsung->pll.mfr = mfr;
-			samsung->pll.mrr = mrr;
+			samsung->tx.pll.ssc_en = true;
+			samsung->tx.pll.mfr = mfr;
+			samsung->tx.pll.mrr = mrr;
 		}
 	}
 }
 
-static int samsung_mipi_dcphy_configure(struct phy *phy,
-					union phy_configure_opts *opts)
+static int samsung_mipi_dcphy_tx_configure(struct phy *phy,
+					   union phy_configure_opts *opts)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 	unsigned long long target_rate = opts->mipi_dphy.hs_clk_rate;
 
-	samsung->lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
+	samsung->tx.lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
 
-	samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
-	opts->mipi_dphy.hs_clk_rate = samsung->pll.rate;
+	samsung_mipi_dcphy_tx_pll_calc_rate(samsung, target_rate);
+	opts->mipi_dphy.hs_clk_rate = samsung->tx.pll.rate;
 
 	return 0;
 }
@@ -1518,10 +1530,10 @@ static int samsung_mipi_dcphy_exit(struct phy *phy)
 	return 0;
 }
 
-static const struct phy_ops samsung_mipi_dcphy_ops = {
-	.configure = samsung_mipi_dcphy_configure,
-	.power_on  = samsung_mipi_dcphy_power_on,
-	.power_off = samsung_mipi_dcphy_power_off,
+static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
+	.configure = samsung_mipi_dcphy_tx_configure,
+	.power_on  = samsung_mipi_dcphy_tx_power_on,
+	.power_off = samsung_mipi_dcphy_tx_power_off,
 	.init = samsung_mipi_dcphy_init,
 	.exit = samsung_mipi_dcphy_exit,
 	.owner	   = THIS_MODULE,
@@ -1551,7 +1563,7 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 
 	samsung->type = args->args[0];
 
-	return samsung->phy;
+	return samsung->tx.phy;
 }
 
 static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
@@ -1596,9 +1608,9 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	if (IS_ERR(samsung->pclk))
 		return dev_err_probe(dev, PTR_ERR(samsung->pclk), "Failed to get pclk\n");
 
-	samsung->m_phy_rst = devm_reset_control_get(dev, "m_phy");
-	if (IS_ERR(samsung->m_phy_rst))
-		return dev_err_probe(dev, PTR_ERR(samsung->m_phy_rst),
+	samsung->tx.phy_rst = devm_reset_control_get(dev, "m_phy");
+	if (IS_ERR(samsung->tx.phy_rst))
+		return dev_err_probe(dev, PTR_ERR(samsung->tx.phy_rst),
 				     "Failed to get system m_phy_rst control\n");
 
 	samsung->s_phy_rst = devm_reset_control_get(dev, "s_phy");
@@ -1620,11 +1632,12 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
-	samsung->phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_ops);
-	if (IS_ERR(samsung->phy))
-		return dev_err_probe(dev, PTR_ERR(samsung->phy), "Failed to create MIPI DC-PHY\n");
+	samsung->tx.phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_tx_ops);
+	if (IS_ERR(samsung->tx.phy))
+		return dev_err_probe(dev, PTR_ERR(samsung->tx.phy),
+				     "Failed to create MIPI DC-PHY transmitter\n");
 
-	phy_set_drvdata(samsung->phy, samsung);
+	phy_set_drvdata(samsung->tx.phy, samsung);
 
 	phy_provider = devm_of_phy_provider_register(dev, samsung_mipi_dcphy_xlate);
 	if (IS_ERR(phy_provider))

-- 
2.43.0


