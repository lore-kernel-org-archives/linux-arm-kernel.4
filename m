Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E45606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o4UYazCd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QqAV7S4c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mXHs4M+7tfkoIg4sYbiMPquQrDZ3R0cBJAsjaurMG7I=; b=o4UYazCdrEwdht
	L970DzkEcsE8i579UbB0HJr2nqKDbo8EszWsKX0ZKH1u3T/AhQV1NccEalv3C69wNMW2YN9dNyzob
	9FBRMFg6Ur8kq0QPWan0kXmjIdr6wwQ2EvCV9KnU4BVBOA1eM1MO6myH/anCY9Il4yn4AnAry9GUx
	YU/HxI2wLfEee6a9UAzF1hcULs+T9wk9UOokRkjmu7oL22170AIkl0YVLnki0cl1kjY9rjXgbdimO
	pCeCkqGeykmZUiv7c9vmzKZ2/HHTBPy5pRudDskhbQa5pPISiU7msBCxjWtURNQf5X8qZiigRZ+Fb
	Eyo1JxLzElj1IH2nH60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuNy-000000022gC-14M8;
	Mon, 16 Nov 2026 10:56:30 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuNm-000000022UW-3RFW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:56:25 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b360828905so29713637b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 02:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826577; x=1795431377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXHs4M+7tfkoIg4sYbiMPquQrDZ3R0cBJAsjaurMG7I=;
        b=QqAV7S4cFwkpP8uPlNiKM13EwFqxElFPqqxN1iq25+RBpC61POAWK3SeUhsHIh54UF
         EK/ngzya8bqkUaIhfdvZoP6R+IDYg0OImyEl+ByMkPqNwltn1961q7Ppi6kVnpmz2yJC
         zVjB6jXPnzA+jAyakqCYs+1RYC3WotRx70z5jiCMTGK5oW7RlRHzHgfGLr4tBSF7j/Sd
         mBIuSieEMKcXSRiZ3Dfo18R4kzJfGYCxyonwmtpuzCGAtRvUhP2r0k8R9+Q6yAFye8o6
         OBn5wo9C0ydts8aOHOuh6mfsLpgwZ4druzOBFbFXBKaHhjxJ6JKbdVKYkTzmbZpDxCVV
         6MKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826577; x=1795431377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXHs4M+7tfkoIg4sYbiMPquQrDZ3R0cBJAsjaurMG7I=;
        b=Mn6ul4wYjiMcf2kg6CAjDRR7xVF/mEZNPdIfP+Yy7b/qnaITumb0Qm2K9GR4ZwPsam
         xajvyv+P2DxysGIulWULZ8U97wxs7uhWNmGmASyy3a3I+Y9Kysy7RDgQqkg+YW7Dng7I
         XE30yn45r4rouyZQqD2ANulsvP6rUCGdDTGkwNvA0G95oZnttSVTcXb8X47TnFjguj1I
         zR2a5Hcp+0hBj9+E+7cZ9JSG4QxUVCXF2sB+NF7Nc7wpmkijzsNr7x8e4YowhGG5gg7I
         2RBd44H20JyQ3y5zMLan9jlg/xr7hM3RK8BSgCn1+NlYsEYdK0sIquxilAYGzTZIt3W2
         5b8A==
X-Forwarded-Encrypted: i=1; AL+hErE9tNMS8XZUzv3I+JG/VTvSxyqZ2+t5dl5y1otE87OBn/JLmqvkDI6tiH9hxuscuOjJQ4q5GQkCR1W6+GZl+csm@lists.infradead.org
X-Gm-Message-State: APuU4Z9kR5e5fqZGXDLuMSrmk3nfYWTPYK7boEGTawAi4eiqxAvXXQ7j
	u79iEEfePkiDvi6TFky8sEdWo3mmRbERt1mkqIN8fDhAlMRwVAngzZJa
X-Gm-Gg: AZFdTZd2nGWbx3OXBGqRJx5uxS9NHd/W1xYwt4N3c6i1BP+gSQ0D6L7rgklVDqHI3J6
	bmavQsp/uAZl974l9hCh+d7kuxIFKfJIlb1jcbLeL3e28cyLsuZ/4RTpWPNRtmn2wuaHFOvGooT
	oC5QlAGRqtTf9u3zB18dSCVWkJEC8HDLIpwJBQD7NRvSCkvcH9XgAljBa7IWLqCCca1n0XCIlBD
	MKRHPccekk6zWS4fhODWfB7TY3/jAGQFWaXYmCMYkSVJ/phEHXrInRQedeqz1EyZ8eHPLN6cp/E
	R6bM11xNjSqz8GlZG/sCoERQUEw34VluQecCKnjT4/NyljIJllQwoN0D/SgDElOprooknpYK0ri
	wtUJyX8/wy3p7ZehdpyMdbYdhMXSGAutYdpR5va4B8qeLDXHUfmNQpIWz2CqvFG8X0TFTl0YykM
	TbYv9KXjdZAcWuXM2xJdN9FcHvrpdd1jbDd64Fev0VD53erRQawdSmcVVKXUxNhXmNVyJiJkN8i
	G4uJifdhzdepAJMHYd4Q8bxYim2WFn2cq5FdjhHeJqbpwR7pypP4u/zFwlaUYNOkh633mth+YCG
	mYKUHZwHXG1Ooa3oAAboi8e2Xx6uiInTAAwZ3qFZdY+LMdAmg95A8qm5IQRmXN8+ZH08HQssouj
	NcYZnOMK7I5/bCE65LZCefE91np9fsW5DPvhC
X-Received: by 2002:a05:690c:fcd:b0:8b4:cc58:7901 with SMTP id 00721157ae682-8b4cc5882e4mr22480827b3.8.1794826577207;
        Mon, 16 Nov 2026 02:56:17 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa41:8a69:2b8b:32cb:351d:f30d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm82274987b3.1.2026.11.16.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:56:16 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] phy: sun4i-usb: clear SIDDQ before the PHY reset on A733
Date: Mon, 16 Nov 2026 07:55:44 -0300
Message-ID: <20261116105544.669029-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_025618_972961_A549B1CC 
X-CRM114-Status: GOOD (  19.28  )
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

sun4i_usb_phy_init() deasserts the PHY reset first and clears SIDDQ in
the PMU HCI_PHY_CTL register afterwards. The order comes from the H3
support and the reason for it isn't documented.

On a Cubie A7Z (A733), the Wi-Fi module on USB1 sometimes came up
at full speed on the OHCI companion and failed enumeration with -62.
This happened in 3 of 40 warm boots with a separate local PHY tuning
change applied.

With that tuning disabled, the current order failed once in 31 warm
boots. Clearing SIDDQ before releasing reset had no failures in 60
warm boots in the same interleaved run, or in 10 cold boots.
Why the order matters is not understood.

The vendor BSP clears SIDDQ while the PHY is still in reset, in its
common host path.

Add a config flag for the early clear and set it only for the A733,
whose config is otherwise the D1 one. The other SoCs keep the current
order: the manuals don't specify one and they weren't tested.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 35 +++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index e2fbf8ccf99e..c918085a9281 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -105,6 +105,7 @@ struct sun4i_usb_phy_cfg {
 	bool phy0_dual_route;
 	bool needs_phy2_siddq;
 	bool siddq_in_base;
+	bool siddq_before_reset;
 	bool poll_vbusen;
 	int missing_phys;
 };
@@ -253,6 +254,19 @@ static void sun4i_usb_phy_passby(struct sun4i_usb_phy *phy, int enable)
 	writel(reg_value, phy->pmu);
 }
 
+static void sun4i_usb_phy_clear_hci_phy_ctl(struct sun4i_usb_phy *phy)
+{
+	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
+	u32 val;
+
+	if (!phy->pmu || !data->cfg->hci_phy_ctl_clear)
+		return;
+
+	val = readl(phy->pmu + REG_HCI_PHY_CTL);
+	val &= ~data->cfg->hci_phy_ctl_clear;
+	writel(val, phy->pmu + REG_HCI_PHY_CTL);
+}
+
 static int sun4i_usb_phy_init(struct phy *_phy)
 {
 	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
@@ -270,6 +284,10 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		return ret;
 	}
 
+	/* Some SoCs want SIDDQ cleared while the PHY is still in reset. */
+	if (data->cfg->siddq_before_reset)
+		sun4i_usb_phy_clear_hci_phy_ctl(phy);
+
 	ret = reset_control_deassert(phy->reset);
 	if (ret) {
 		clk_disable_unprepare(phy->clk2);
@@ -321,11 +339,8 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		clk_disable_unprepare(phy->clk2);
 	}
 
-	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {
-		val = readl(phy->pmu + REG_HCI_PHY_CTL);
-		val &= ~data->cfg->hci_phy_ctl_clear;
-		writel(val, phy->pmu + REG_HCI_PHY_CTL);
-	}
+	if (!data->cfg->siddq_before_reset)
+		sun4i_usb_phy_clear_hci_phy_ctl(phy);
 
 	if (data->cfg->siddq_in_base) {
 		if (phy->index == 0) {
@@ -1013,6 +1028,15 @@ static const struct sun4i_usb_phy_cfg sun50i_h616_cfg = {
 	.siddq_in_base = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun60i_a733_cfg = {
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
+	.phy0_dual_route = true,
+	.siddq_in_base = true,
+	.siddq_before_reset = true,
+};
+
 static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = &sun5i_a13_cfg },
@@ -1029,6 +1053,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	  .data = &sun50i_a64_cfg},
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
 	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = &sun50i_h616_cfg },
+	{ .compatible = "allwinner,sun60i-a733-usb-phy", .data = &sun60i_a733_cfg },
 	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
 	  .data = &suniv_f1c100s_cfg },
 	{ },
-- 
2.43.0


