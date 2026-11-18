Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6220A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o30+rqVW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dzr984ns
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z7kSugSSk7HgKfc68Mdr1glQPFkvlFPKU9CnWrkkvLY=; b=o30+rqVWf+OThX
	mDD+I/kdVrepPI0L8XZ2Guu3d0L+OzwIa1xLZWbqoC3/PMp8v7BcNHiSXLz+EAVIKEBiqmWQROz7X
	kbGPrZoKJD7TvXPrIfEVT8r3z79Zb8BaDsMwy/8Kc/mdGUgeD/Zn1prUVxTFUoYWZdXt4WZcUINJE
	37HT5yBLaRmFopJCNS0KjKY/yOVAlYutN5bYNGEnYVmPH9yMGg0ZSnU8WA4zp0L2ZTreETdrVTPYe
	Mc6vM6VLqkKxkEfOBe53JjK3dwsLnB6pjgydppNhw1NU17dKQn6GckrmGYGszTuH0J+V2rt45WnhL
	/87xU8ghw4ylEskRJQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYev-00000007oge-1tDT;
	Wed, 18 Nov 2026 05:56:41 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYeX-00000007o7F-2X5i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:56:21 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8b5e147f101so58642b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981377; x=1795586177; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7kSugSSk7HgKfc68Mdr1glQPFkvlFPKU9CnWrkkvLY=;
        b=Dzr984nsw8U7Mzy3Ndb9orjeJJ4pBtfsVd70fKUjgBOMdna64sPgWzZWQoiXDCLY2k
         Ri8pcuhPs6BK5GN75gqlcRwlA0mGADGWiDuOUSKg7CT8qfDYn9liJeRXcrmKd3WzFZCH
         MHnCx3FxsLCKwGq7lJJgNI+eYAkd9eNYpHV6p+8Ubkgb1iW+9UuckpQJUgDMLQ2P+Mly
         tyYJbaH2rlmt90dBkLFt8PXGktFILYBKzoWo1Wr+vCgIZQoF7OMNRDm/eWNyWTE9wTse
         0du8tUyY8lyVA/ITZunMxXS94XNtlEsIyA+rffjQ35/w6bd9aF6gzCqmqETDGIszWWcr
         R8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981377; x=1795586177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7kSugSSk7HgKfc68Mdr1glQPFkvlFPKU9CnWrkkvLY=;
        b=pYwAlRd+EbDFKkCZVCkd2sMRNFq/2kP7IvuCOjSU6PkAdhihSTBLTG7yLmdBqfZSLl
         0Mb/NUu5EwmU9kTx9oh2EIQs4qskmIaPtBNFUsWJpcK57T+Z0Wq+32oh8wRD+hn57uff
         PI/NSsL3+xs7R1IizvIWbklY9yYCBzjYjOto2g6YjKbwiGDv7uqBLHp7Ovb8dP3WD5uF
         5jPl+ncB2pv3g6LVNUY0svz7wh0hoC8Ai4fM6j5c14DozXeNdLvf5V7m5MBN/id5UW2o
         P5STgIL81AMPEG8F++H8YD3Y3459e1XpIE0yPrByVrI4PvLjfBbCyC+iixNieK2/FohT
         t9Mg==
X-Forwarded-Encrypted: i=1; AL+hErFUxuNFGSDaWJVCKnAqUDkA/kCwNtaqlUaBYNkg8IBLyCeDcdI3pcUSDI1AQkhFvMu9XDM8p9Jo158qs7Ic835z@lists.infradead.org
X-Gm-Message-State: APuU4Z9WWsjnxyPh25u5orETOyoBljD+AyVHIJ6Dnk2UUX65yqJRcIO5
	hpGQFdaFu/ESI0TnFLQY0eWHkP3VHTF/m0nMwDnXloRYIgeRyY/yTxbN
X-Gm-Gg: AYBFou1McKnHmS5qBay8gaLD/YP3TYwhXszwkRHjwAb+4/lXdx2FcvgrniTmB+/py7Q
	WlcZJGV6E6QynXM980AcThdwXb3hvHtzFHGNs8GBboDYCzcUTYy1CdVaM3N3YKpal8y0d9ErG+K
	3wbvXEJejNmIl8H9CUEz0uuq5sxoKB9zUv9SfQ7Upi1kij+8/64G2tVe4Mofw5QFr+qPQU/Jgyv
	Mevm183vHvaTctmaj5fqdhqQWdxDv4fhVWCylw0DytJFNyviBaahYGEE8BTI92cL2/t4qJD85tH
	kXQIETTm0Sge0heC0F+6pZP8DzRK84XGDqIuM3SdqGHNetEcHbHUsL7oinNKac3oP1BttRFzQu6
	xD5N36eAO3NdBtT3N+JRRDRR+gMGd231lpbS/3y61ngjaUOp3LTZkzSxQdQyG/TyqH8PweTCkgX
	dk9th4l3FDlaDMD3px/E3H4pI10D8EqWjffAVLkPIX1TApDJbb8LGXpirhLrQTSlZbqkUuDDEHm
	HUuZmXVIGpJ1VGP8y5fuvDLnosAYhnFcCVFSsgtPUKw0JbwrKpgc+JrbOH9XLJpL2/QcqO++ecz
	9QNQou8zVbb3w6o39qcmEOzVHoqZF0JUtoiNm7qbnpI9BYFRDhUADxlCSV+bhAx2ZiRr8SKMuy+
	oJwTk7+yew3BLmjplJnJ9
X-Received: by 2002:aa7:9e1b:0:b0:8c2:da80:978c with SMTP id d2e1a72fcca58-8c5cfd99142mr1498206b3a.1.1794981376264;
        Tue, 17 Nov 2026 21:56:16 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:56:15 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:21 +0800
Subject: [PATCH v7 8/9] phy: rockchip-samsung-dcphy: Add MIPI D-PHY
 receiver support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-dcphy-rx-v1-v7-8-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
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
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=18286;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=gpHS88IwvE1q9+Jhxn5q1wdgmXKJG9xxKsJIQA68fts=;
 b=KeYFdRDBr4p4+GZXlJaBQdwS7fJK3ZQvykck/QU/EaH6qYnofPADfg0r/DBP0+bmdTVLUkczP
 WMVMo8yFbpZDn6/n96kUYyWgzEm0FZu9P9slsMh3YV1bliC1gfXwnOt
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_215617_717926_9C65127C 
X-CRM114-Status: GOOD (  21.07  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the receiver half of the block, so a MIPI CSI-2 camera can use the
same PHY that already drives a MIPI DSI output on RK3588. It follows the
receiver start-up sequence in the RK3588 TRM [1]. The HS-RX settle values
come from the RK3588 vendor kernel.

The initial deskew calibration that the D-PHY specification asks for
above 1.5 Gbps is not implemented; the vendor kernel programs it from
RK3576 onwards only. Data rates above 4.5 Gbps, the end of the settle
table, are rejected at configure time.

Tested on RK3588 with an IMX219 on the receiver and a DSI panel on the
transmitter of the same PHY.

[1] RK3588 TRM: sections 22.6.3 (start-up sequence, step 3 for
    slave-only use) and 22.6.4.3 (worked receiver example)

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 426 +++++++++++++++++++++-
 1 file changed, 410 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 1228bd794759..1dc1511c05bc 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -244,6 +244,70 @@
 #define T_TA_GET(x)		FIELD_PREP(GENMASK(7, 4), x)
 #define T_TA_GO(x)		FIELD_PREP(GENMASK(3, 0), x)
 
+#define DPHY_SC_GNR_CON0	0x0b00
+#define DPHY_SC_GNR_CON1	0x0b04
+#define DPHY_SC_ANA_CON1	0x0b0c
+#define HS_RX_LS_650UA		BIT(15)
+#define HS_RX_AMP2_500UA	FIELD_PREP(GENMASK(14, 13), 0)
+#define HS_RX_AMP1_700UA	FIELD_PREP(GENMASK(12, 11), 0)
+#define DPHY_SC_ANA_CON2	0x0b10
+#define HS_TERM_SW(x)		FIELD_PREP(GENMASK(2, 0), x)
+#define HS_TERM_96_6OHM		HS_TERM_SW(2)
+#define DPHY_SC_ANA_CON3	0x0b14
+#define ULPS_HYS_SW_DPHY(x)	FIELD_PREP(GENMASK(10, 8), x)
+#define ULPS_HYS_104MV		ULPS_HYS_SW_DPHY(6)
+#define DPHY_SC_TIME_CON0	0x0b30
+#define T_CLK_SETTLE(x)		FIELD_PREP(GENMASK(7, 0), x)
+#define T_CLK_MISS(x)		FIELD_PREP(GENMASK(11, 8), x)
+#define COMBO_SD0_GNR_CON0	0x0c00
+#define COMBO_SD0_GNR_CON1	0x0c04
+#define COMBO_SD0_ANA_CON1	0x0c0c
+#define COMBO_SD0_ANA_CON2	0x0c10
+#define SKEW_DLYSEL(x)		FIELD_PREP(GENMASK(9, 8), x)
+#define RX_TERM_SW(x)		FIELD_PREP(GENMASK(2, 0), x)
+#define RX_TERM_96_6OHM		RX_TERM_SW(2)
+#define COMBO_SD0_ANA_CON3	0x0c14
+#define SEL_ESCPOL		BIT(11)
+#define LP_HYS_SW(x)		FIELD_PREP(GENMASK(5, 4), x)
+#define LP_HYS_100MV		LP_HYS_SW(3)
+#define COMBO_SD0_ANA_CON7	0x0c24
+#define CLK_DBL_CTRL(x)		FIELD_PREP(GENMASK(7, 6), x)
+#define COMBO_SD0_TIME_CON0	0x0c30
+#define T_HS_SETTLE_MASK	GENMASK(7, 0)
+#define T_HS_SETTLE(x)		FIELD_PREP(T_HS_SETTLE_MASK, x)
+#define SETTLE_CLK_SEL		BIT(8)
+#define COMBO_SD0_TIME_CON1	0x0c34
+#define T_ERR_SOT_SYNC_MASK	GENMASK(7, 0)
+#define T_ERR_SOT_SYNC(x)	FIELD_PREP(T_ERR_SOT_SYNC_MASK, x)
+#define COMBO_SD0_DESKEW_CON2	0x0c48
+#define SKEW_CAL_CLK_COARSE_SET(x) FIELD_PREP(GENMASK(4, 0), x)
+#define COMBO_SD1_GNR_CON0	0x0d00
+#define COMBO_SD1_GNR_CON1	0x0d04
+#define COMBO_SD1_ANA_CON1	0x0d0c
+#define COMBO_SD1_ANA_CON2	0x0d10
+#define COMBO_SD1_ANA_CON3	0x0d14
+#define COMBO_SD1_ANA_CON7	0x0d24
+#define COMBO_SD1_TIME_CON0	0x0d30
+#define COMBO_SD1_TIME_CON1	0x0d34
+#define COMBO_SD1_DESKEW_CON2	0x0d48
+#define COMBO_SD2_GNR_CON0	0x0e00
+#define COMBO_SD2_GNR_CON1	0x0e04
+#define COMBO_SD2_ANA_CON1	0x0e0c
+#define COMBO_SD2_ANA_CON2	0x0e10
+#define COMBO_SD2_ANA_CON3	0x0e14
+#define COMBO_SD2_ANA_CON7	0x0e24
+#define COMBO_SD2_TIME_CON0	0x0e30
+#define COMBO_SD2_TIME_CON1	0x0e34
+#define COMBO_SD2_DESKEW_CON2	0x0e48
+#define DPHY_SD3_GNR_CON0	0x0f00
+#define DPHY_SD3_GNR_CON1	0x0f04
+#define DPHY_SD3_ANA_CON1	0x0f0c
+#define DPHY_SD3_ANA_CON2	0x0f10
+#define DPHY_SD3_ANA_CON3	0x0f14
+#define DPHY_SD3_TIME_CON0	0x0f30
+#define DPHY_SD3_TIME_CON1	0x0f34
+#define DPHY_SD3_DESKEW_CON2	0x0f48
+
 /* MIPI_CDPHY_GRF registers */
 #define MIPI_DCPHY_GRF_CON0		0x0000
 #define S_CPHY_MODE			FIELD_PREP_WM16(BIT(3), 1)
@@ -284,18 +348,27 @@ struct samsung_mipi_phy {
 	struct phy *phy;
 	unsigned int lanes;
 	struct reset_control *phy_rst;
-	/* TX only */
-	struct {
-		unsigned long long rate;
-		u8 prediv;
-		u16 fbdiv;
-		long dsm;
-		u8 scaler;
-
-		bool ssc_en;
-		u8 mfr;
-		u8 mrr;
-	} pll;
+	union {
+		/* RX only */
+		struct {
+			unsigned long long hs_clk_rate;
+			u16 hsfreq_cfg;
+		};
+		/* TX only */
+		struct {
+			struct {
+				unsigned long long rate;
+				u8 prediv;
+				u16 fbdiv;
+				long dsm;
+				u8 scaler;
+
+				bool ssc_en;
+				u8 mfr;
+				u8 mrr;
+			} pll;
+		};
+	};
 };
 
 struct samsung_mipi_dcphy {
@@ -304,10 +377,10 @@ struct samsung_mipi_dcphy {
 	struct clk *pclk;
 	struct regmap *regmap;
 	struct regmap *grf_regmap;
-	struct reset_control *s_phy_rst;
 	struct reset_control *apb_rst;
 	struct reset_control *grf_apb_rst;
 	struct samsung_mipi_phy tx;
+	struct samsung_mipi_phy rx;
 	u8 type;
 	bool legacy_mismatch;
 
@@ -979,6 +1052,228 @@ struct samsung_mipi_dphy_timing samsung_mipi_dphy_timing_table[] = {
 	{  80,  2,   0,  0, 28,  5,  0, 22,  2,  0,  5},
 };
 
+struct samsung_mipi_dphy_rx_hsfreq_range {
+	u32 range_h_mbps;
+	u16 cfg_bit;
+};
+
+/*
+ * HS-RX settle values taken from the rk3588 vendor kernel; the TRM
+ * defers the per-rate values to its Supplement Guide. SETTLE_CLK_SEL
+ * is read-only in the TRM but the vendor kernel has always written it.
+ */
+static const struct samsung_mipi_dphy_rx_hsfreq_range
+samsung_mipi_dphy_rx_hsfreq_ranges[] = {
+	{   80, 0x105 }, {  100, 0x106 }, {  120, 0x107 }, {  140, 0x108 },
+	{  160, 0x109 }, {  180, 0x10a }, {  200, 0x10b }, {  220, 0x10c },
+	{  240, 0x10d }, {  270, 0x10e }, {  290, 0x10f }, {  310, 0x110 },
+	{  330, 0x111 }, {  350, 0x112 }, {  370, 0x113 }, {  390, 0x114 },
+	{  410, 0x115 }, {  430, 0x116 }, {  450, 0x117 }, {  470, 0x118 },
+	{  490, 0x119 }, {  510, 0x11a }, {  540, 0x11b }, {  560, 0x11c },
+	{  580, 0x11d }, {  600, 0x11e }, {  620, 0x11f }, {  640, 0x120 },
+	{  660, 0x121 }, {  680, 0x122 }, {  700, 0x123 }, {  720, 0x124 },
+	{  740, 0x125 }, {  760, 0x126 }, {  790, 0x127 }, {  810, 0x128 },
+	{  830, 0x129 }, {  850, 0x12a }, {  870, 0x12b }, {  890, 0x12c },
+	{  910, 0x12d }, {  930, 0x12e }, {  950, 0x12f }, {  970, 0x130 },
+	{  990, 0x131 }, { 1010, 0x132 }, { 1030, 0x133 }, { 1060, 0x134 },
+	{ 1080, 0x135 }, { 1100, 0x136 }, { 1120, 0x137 }, { 1140, 0x138 },
+	{ 1160, 0x139 }, { 1180, 0x13a }, { 1200, 0x13b }, { 1220, 0x13c },
+	{ 1240, 0x13d }, { 1260, 0x13e }, { 1280, 0x13f }, { 1310, 0x140 },
+	{ 1330, 0x141 }, { 1350, 0x142 }, { 1370, 0x143 }, { 1390, 0x144 },
+	{ 1410, 0x145 }, { 1430, 0x146 }, { 1450, 0x147 }, { 1470, 0x148 },
+	{ 1490, 0x149 }, { 1580, 0x007 }, { 1740, 0x008 }, { 1910, 0x009 },
+	{ 2070, 0x00a }, { 2240, 0x00b }, { 2410, 0x00c }, { 2570, 0x00d },
+	{ 2740, 0x00e }, { 2910, 0x00f }, { 3070, 0x010 }, { 3240, 0x011 },
+	{ 3410, 0x012 }, { 3570, 0x013 }, { 3740, 0x014 }, { 3890, 0x015 },
+	{ 4070, 0x016 }, { 4240, 0x017 }, { 4400, 0x018 }, { 4500, 0x019 },
+};
+
+static const u32 rx_data_lane_gnr_con0[] = {
+	COMBO_SD0_GNR_CON0, COMBO_SD1_GNR_CON0,
+	COMBO_SD2_GNR_CON0, DPHY_SD3_GNR_CON0,
+};
+
+static const u32 rx_data_lane_gnr_con1[] = {
+	COMBO_SD0_GNR_CON1, COMBO_SD1_GNR_CON1,
+	COMBO_SD2_GNR_CON1, DPHY_SD3_GNR_CON1,
+};
+
+static const u32 rx_lane_time_con0[] = {
+	COMBO_SD0_TIME_CON0, COMBO_SD1_TIME_CON0,
+	COMBO_SD2_TIME_CON0, DPHY_SD3_TIME_CON0,
+};
+
+static const u32 rx_lane_time_con1[] = {
+	COMBO_SD0_TIME_CON1, COMBO_SD1_TIME_CON1,
+	COMBO_SD2_TIME_CON1, DPHY_SD3_TIME_CON1,
+};
+
+static int samsung_mipi_dphy_rx_lookup_hsfreq(u32 lane_mbps, u16 *cfg_bit)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(samsung_mipi_dphy_rx_hsfreq_ranges); i++) {
+		if (lane_mbps <= samsung_mipi_dphy_rx_hsfreq_ranges[i].range_h_mbps) {
+			*cfg_bit = samsung_mipi_dphy_rx_hsfreq_ranges[i].cfg_bit;
+			return 0;
+		}
+	}
+
+	return -ERANGE;
+}
+
+static u32 samsung_mipi_dphy_rx_data_lane_dlysel(u32 lane_mbps)
+{
+	if (lane_mbps < 1500)
+		return 0;
+	if (lane_mbps < 2000)
+		return SKEW_DLYSEL(3);
+	if (lane_mbps < 3000)
+		return SKEW_DLYSEL(2);
+	if (lane_mbps < 4000)
+		return SKEW_DLYSEL(1);
+	return 0;
+}
+
+/*
+ * RX analog tuning values from the vendor kernel; data lane 0 differs
+ * from the other lanes on purpose, as in the vendor receive profile.
+ */
+static void samsung_mipi_dphy_rx_config_common(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	u32 lane_mbps = div64_ul(rx->hs_clk_rate, USEC_PER_SEC);
+	u32 dlysel = samsung_mipi_dphy_rx_data_lane_dlysel(lane_mbps);
+	u32 ana_con1_common = HS_RX_LS_650UA | HS_RX_AMP2_500UA |
+			      HS_RX_AMP1_700UA;
+	u32 ana_con2_common = dlysel | RX_TERM_96_6OHM;
+
+	regmap_write(samsung->regmap, DPHY_SC_ANA_CON1, ana_con1_common);
+	regmap_write(samsung->regmap, DPHY_SC_ANA_CON2, HS_TERM_96_6OHM);
+	regmap_write(samsung->regmap, DPHY_SC_ANA_CON3, ULPS_HYS_104MV);
+
+	regmap_write(samsung->regmap, COMBO_SD0_ANA_CON1, ana_con1_common);
+	regmap_write(samsung->regmap, COMBO_SD0_ANA_CON2, ana_con2_common);
+	regmap_write(samsung->regmap, COMBO_SD0_ANA_CON3,
+		     ULPS_HYS_104MV | LP_HYS_100MV | SEL_ESCPOL);
+	regmap_write(samsung->regmap, COMBO_SD0_ANA_CON7, CLK_DBL_CTRL(1));
+	regmap_write(samsung->regmap, COMBO_SD0_DESKEW_CON2,
+		     SKEW_CAL_CLK_COARSE_SET(0));
+
+	if (rx->lanes > 1) {
+		regmap_write(samsung->regmap, COMBO_SD1_ANA_CON1,
+			     ana_con1_common);
+		regmap_write(samsung->regmap, COMBO_SD1_ANA_CON2,
+			     ana_con2_common);
+		regmap_write(samsung->regmap, COMBO_SD1_ANA_CON3,
+			     ULPS_HYS_104MV);
+		regmap_write(samsung->regmap, COMBO_SD1_ANA_CON7,
+			     CLK_DBL_CTRL(1));
+		regmap_write(samsung->regmap, COMBO_SD1_DESKEW_CON2,
+			     SKEW_CAL_CLK_COARSE_SET(3));
+	}
+
+	if (rx->lanes > 2) {
+		regmap_write(samsung->regmap, COMBO_SD2_ANA_CON1,
+			     ana_con1_common);
+		regmap_write(samsung->regmap, COMBO_SD2_ANA_CON2,
+			     ana_con2_common);
+		regmap_write(samsung->regmap, COMBO_SD2_ANA_CON3,
+			     ULPS_HYS_104MV);
+		regmap_write(samsung->regmap, COMBO_SD2_ANA_CON7,
+			     CLK_DBL_CTRL(1));
+		regmap_write(samsung->regmap, COMBO_SD2_DESKEW_CON2,
+			     SKEW_CAL_CLK_COARSE_SET(3));
+	}
+
+	if (rx->lanes > 3) {
+		regmap_write(samsung->regmap, DPHY_SD3_ANA_CON1,
+			     ana_con1_common);
+		regmap_write(samsung->regmap, DPHY_SD3_ANA_CON2,
+			     ana_con2_common);
+		regmap_write(samsung->regmap, DPHY_SD3_ANA_CON3,
+			     ULPS_HYS_104MV);
+		regmap_write(samsung->regmap, DPHY_SD3_DESKEW_CON2,
+			     SKEW_CAL_CLK_COARSE_SET(3));
+	}
+}
+
+static void samsung_mipi_dphy_rx_config_settle(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	u16 cfg_bit = rx->hsfreq_cfg;
+	unsigned int i;
+
+	/*
+	 * Clock-lane settle keeps the value of the TRM 2.5 Gbps receiver
+	 * example at every rate, as Samsung's own Exynos driver for this
+	 * PHY does.
+	 */
+	regmap_write(samsung->regmap, DPHY_SC_TIME_CON0,
+		     T_CLK_SETTLE(0x01) | T_CLK_MISS(0x03));
+
+	for (i = 0; i < rx->lanes; i++) {
+		regmap_update_bits(samsung->regmap, rx_lane_time_con0[i],
+				   T_HS_SETTLE_MASK | SETTLE_CLK_SEL, cfg_bit);
+		regmap_update_bits(samsung->regmap, rx_lane_time_con1[i],
+				   T_ERR_SOT_SYNC_MASK, T_ERR_SOT_SYNC(0x03));
+	}
+}
+
+static void samsung_mipi_dphy_rx_lane_disable(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	unsigned int i;
+
+	regmap_update_bits(samsung->regmap, DPHY_SC_GNR_CON0, PHY_ENABLE, 0);
+	for (i = 0; i < rx->lanes; i++)
+		regmap_update_bits(samsung->regmap, rx_data_lane_gnr_con0[i],
+				   PHY_ENABLE, 0);
+}
+
+static int samsung_mipi_dphy_rx_lane_enable(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	unsigned int i;
+	u32 sts;
+	int ret;
+
+	regmap_write(samsung->regmap, DPHY_SC_GNR_CON1, T_PHY_READY(0x1450));
+	regmap_update_bits(samsung->regmap, DPHY_SC_GNR_CON0,
+			   PHY_ENABLE, PHY_ENABLE);
+
+	for (i = 0; i < rx->lanes; i++) {
+		regmap_write(samsung->regmap, rx_data_lane_gnr_con1[i],
+			     T_PHY_READY(0x1450));
+		regmap_update_bits(samsung->regmap, rx_data_lane_gnr_con0[i],
+				   PHY_ENABLE, PHY_ENABLE);
+	}
+
+	ret = regmap_read_poll_timeout(samsung->regmap, DPHY_SC_GNR_CON0,
+				       sts, sts & PHY_READY, 200, 4000);
+	if (ret) {
+		dev_err(samsung->dev, "RX clock lane not ready\n");
+		goto err_lane_disable;
+	}
+
+	for (i = 0; i < rx->lanes; i++) {
+		ret = regmap_read_poll_timeout(samsung->regmap,
+					       rx_data_lane_gnr_con0[i],
+					       sts, sts & PHY_READY,
+					       200, 2000);
+		if (ret) {
+			dev_err(samsung->dev, "RX data lane %u not ready\n", i);
+			goto err_lane_disable;
+		}
+	}
+
+	return 0;
+
+err_lane_disable:
+	samsung_mipi_dphy_rx_lane_disable(samsung);
+	return ret;
+}
+
 static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_write(samsung->regmap, BIAS_CON0, I_DEV_DIV_6 | I_RES_100_2UA);
@@ -995,6 +1290,40 @@ static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *sams
 			   I_MUX_SEL_MASK, I_MUX_400MV);
 }
 
+static int samsung_mipi_dphy_rx_power_on(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	int ret;
+
+	if (!rx->hs_clk_rate || !rx->lanes)
+		return -EINVAL;
+
+	reset_control_assert(samsung->rx.phy_rst);
+
+	samsung_mipi_dphy_rx_config_common(samsung);
+	samsung_mipi_dphy_rx_config_settle(samsung);
+
+	ret = samsung_mipi_dphy_rx_lane_enable(samsung);
+
+	reset_control_deassert(samsung->rx.phy_rst);
+
+	return ret;
+}
+
+static int samsung_mipi_dphy_rx_power_off(struct samsung_mipi_dcphy *samsung)
+{
+	reset_control_assert(samsung->rx.phy_rst);
+
+	samsung_mipi_dphy_rx_lane_disable(samsung);
+
+	reset_control_deassert(samsung->rx.phy_rst);
+
+	/* Delay from the vendor kernel; the TRM has no teardown sequence. */
+	usleep_range(500, 1000);
+
+	return 0;
+}
+
 static void samsung_mipi_dphy_tx_lane_enable(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_write(samsung->regmap, DPHY_MC_GNR_CON1, T_PHY_READY(0x2000));
@@ -1534,6 +1863,53 @@ static int samsung_mipi_dcphy_exit(struct phy *phy)
 	return 0;
 }
 
+static int samsung_mipi_dcphy_rx_configure(struct phy *phy,
+					   union phy_configure_opts *opts)
+{
+	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	u32 lane_mbps = div64_ul(opts->mipi_dphy.hs_clk_rate, USEC_PER_SEC);
+	int ret;
+
+	ret = samsung_mipi_dphy_rx_lookup_hsfreq(lane_mbps, &rx->hsfreq_cfg);
+	if (ret) {
+		dev_err(samsung->dev, "unsupported RX data rate %u Mbps\n",
+			lane_mbps);
+		return ret;
+	}
+
+	rx->lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
+	rx->hs_clk_rate = opts->mipi_dphy.hs_clk_rate;
+
+	return 0;
+}
+
+static int samsung_mipi_dcphy_rx_power_on(struct phy *phy)
+{
+	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+
+	switch (samsung->type) {
+	case PHY_TYPE_DPHY:
+		return samsung_mipi_dphy_rx_power_on(samsung);
+	default:
+		/* CPHY part to be implemented later */
+		return -EOPNOTSUPP;
+	}
+}
+
+static int samsung_mipi_dcphy_rx_power_off(struct phy *phy)
+{
+	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+
+	switch (samsung->type) {
+	case PHY_TYPE_DPHY:
+		return samsung_mipi_dphy_rx_power_off(samsung);
+	default:
+		/* CPHY part to be implemented later */
+		return -EOPNOTSUPP;
+	}
+}
+
 static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
 	.configure = samsung_mipi_dcphy_tx_configure,
 	.power_on  = samsung_mipi_dcphy_tx_power_on,
@@ -1543,6 +1919,15 @@ static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
 	.owner	   = THIS_MODULE,
 };
 
+static const struct phy_ops samsung_mipi_dcphy_rx_ops = {
+	.configure = samsung_mipi_dcphy_rx_configure,
+	.power_on = samsung_mipi_dcphy_rx_power_on,
+	.power_off = samsung_mipi_dcphy_rx_power_off,
+	.init = samsung_mipi_dcphy_init,
+	.exit = samsung_mipi_dcphy_exit,
+	.owner = THIS_MODULE,
+};
+
 static const struct regmap_config samsung_mipi_dcphy_regmap_config = {
 	.name = "dcphy",
 	.reg_bits = 32,
@@ -1564,6 +1949,8 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 	switch (args->args[0]) {
 	case PHY_DIRECTION_TX:
 		return samsung->tx.phy;
+	case PHY_DIRECTION_RX:
+		return samsung->rx.phy;
 	case PHY_TYPE_DPHY:
 	case PHY_TYPE_CPHY:
 		if (args->args[0] != samsung->type) {
@@ -1626,9 +2013,9 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(samsung->tx.phy_rst),
 				     "Failed to get system m_phy_rst control\n");
 
-	samsung->s_phy_rst = devm_reset_control_get(dev, "s_phy");
-	if (IS_ERR(samsung->s_phy_rst))
-		return dev_err_probe(dev, PTR_ERR(samsung->s_phy_rst),
+	samsung->rx.phy_rst = devm_reset_control_get(dev, "s_phy");
+	if (IS_ERR(samsung->rx.phy_rst))
+		return dev_err_probe(dev, PTR_ERR(samsung->rx.phy_rst),
 				     "Failed to get system s_phy_rst control\n");
 
 	samsung->apb_rst = devm_reset_control_get(dev, "apb");
@@ -1657,6 +2044,13 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(samsung->tx.phy, samsung);
 
+	samsung->rx.phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_rx_ops);
+	if (IS_ERR(samsung->rx.phy))
+		return dev_err_probe(dev, PTR_ERR(samsung->rx.phy),
+				     "Failed to create MIPI DC-PHY receiver\n");
+
+	phy_set_drvdata(samsung->rx.phy, samsung);
+
 	phy_provider = devm_of_phy_provider_register(dev, samsung_mipi_dcphy_xlate);
 	if (IS_ERR(phy_provider))
 		return dev_err_probe(dev, PTR_ERR(phy_provider),

-- 
2.43.0


