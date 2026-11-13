Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6B606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WELap9JQ;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qTzRNr0I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m2hCcThmFXYB/OeCygofrgjQSQPNYsGUPZd5pmVcOqM=; b=WELap9JQu8g9TZ
	6yGDlKUx60w2kPCMbZUINse8muur59ov1Kgf7jkBhGsHP7lOxRcw7/hbVB1kgqjWQyFcvuZli/u1B
	5b+IsmQeLOwuYKN9MKJkBgZf1OMqpxVjoJUVb0ii0gx1sM0PEjWs9bp1PvtLzuE2Mc2RFNxuEMj8e
	pbxXNpp8Wlgp5j8D/sxrOxel2TMOJ5qdEJrKt1CaQFnzqUJaRZYO9m79UyF/OsisQIPG4jUXso//i
	7PurqL5w4Grqb7v+O3CyrfekfbEevK84V18XENN5XCWg8QKBXyoBW1kfk/cyQGX3LeKmsGW5P60v1
	1Tk0VX3hoW39kuHyruyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRov4-0000000CQ4z-14Tv;
	Fri, 13 Nov 2026 10:54:10 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRov1-0000000CQ2p-1nh6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:54:09 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261113105403epoutp0489628848a1778e6e281e886ce0ed6935~nlWZhLJeG1082510825epoutp04U
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:54:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261113105403epoutp0489628848a1778e6e281e886ce0ed6935~nlWZhLJeG1082510825epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567243;
	bh=m2hCcThmFXYB/OeCygofrgjQSQPNYsGUPZd5pmVcOqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qTzRNr0IY8+/c3hDc+kTbLe7XHGmFlExotu/cei4jKc9R+YP3QWeCEXypVc2cAX/+
	 aV9Ib6xaHP5juBMvIqUZONgv2eELGKpoTTStonOOTeM994wLwL6Kc/JWO18ukaB7oG
	 gBlq1Rzt1EQg91wUlg8JEq+zKYLRALbZY5TitXE4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261113105401epcas5p39c1a435d01f3b03c4e4a28f4aba00fdc~nlWYDCzBt0093700937epcas5p32;
	Fri, 13 Nov 2026 10:54:01 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jQvJS5y9Lz2SSKY; Fri, 13 Nov
	2026 10:54:00 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261113104853epcas5p175c566a1ced2547e533c21b21e60e993~nlR4e2Ixu0456104561epcas5p1U;
	Fri, 13 Nov 2026 10:48:53 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104850epsmtip27edf9d9c1dd709e5af19a1b8b8b296bc~nlR1mSUOq2220522205epsmtip22;
	Fri, 13 Nov 2026 10:48:49 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 08/14 RESEND] clk: samsung: exynos8855: add block peris
 clock support
Date: Fri, 13 Nov 2026 16:36:06 +0530
Message-Id: <20261113110612.3265841-9-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261113104853epcas5p175c566a1ced2547e533c21b21e60e993
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104853epcas5p175c566a1ced2547e533c21b21e60e993
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104853epcas5p175c566a1ced2547e533c21b21e60e993@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_025407_885527_8E3A9A85 
X-CRM114-Status: GOOD (  15.22  )
X-Spam-Score: -4.4 (----)
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

Register compatible and cmu_info data to support clocks.
CMU_PERIS, this provides clocks for PERIS

Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 97 ++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index dcf58f2459b0..12b5ae54b560 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -18,7 +18,9 @@
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
+#define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
 
+#define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
 #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
 #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
 
@@ -1092,6 +1094,98 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
 	.memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
 };
 
+/* ---- CMU_PERIS --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIS (0x10030000) */
+#define CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER           0x600
+#define CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC                    0x1000
+#define CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER              0x610
+#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP                   0x1800
+#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP                    0x1804
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK     0x201c
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK  0x2040
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK          0x2048
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK          0x204c
+#define CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL                  0x800
+
+static const unsigned long peris_clk_regs[] __initconst = {
+	CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER,
+	CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC,
+	CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER,
+	CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
+	CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
+	CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIS */
+PNAME(mout_clkcmu_peris_noc_user_p) = { "oscclk", "dout_clkcmu_peris_noc" };
+PNAME(mout_clk_peris_gic_p) = { "oscclk", "mout_clkcmu_peris_gic_user" };
+PNAME(mout_clkcmu_peris_gic_user_p) = { "oscclk", "dout_clkcmu_peris_gic" };
+
+static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIS_NOC_USER, "mout_clkcmu_peris_noc_user",
+	    mout_clkcmu_peris_noc_user_p, CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER, 4, 1),
+	MUX(CLK_MOUT_PERIS_GIC, "mout_clk_peris_gic",
+	    mout_clk_peris_gic_p, CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC, 0, 1),
+	MUX(CLK_MOUT_PERIS_GIC_USER, "mout_clkcmu_peris_gic_user",
+	    mout_clkcmu_peris_gic_user_p, CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER, 4, 1),
+};
+
+static const struct samsung_div_clock peris_div_clks[] __initconst = {
+	DIV(CLK_DOUT_PERIS_NOCP, "dout_clkcmu_peris_nocp",
+	    "mout_clkcmu_peris_noc_user", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
+	    0, 4),
+	DIV(CLK_DOUT_PERIS_OTP, "dout_clkcmu_peris_otp",
+	    "oscclk", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
+	    0, 4),
+};
+
+static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_CMU_PERIS, "gout_cmu_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_PERIS, "gout_sysreg_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_WDT0_PERIS, "gout_wdt0_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_WDT1_PERIS, "gout_wdt1_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
+	     21, 0, 0),
+};
+
+static const unsigned long dcrg_sysreg[] __initconst = {
+	EXYNOS8855_DRCG_EN_OFFSET,
+};
+
+static const struct samsung_cmu_info peris_cmu_info __initconst = {
+	.mux_clks               = peris_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(peris_mux_clks),
+	.div_clks               = peris_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(peris_div_clks),
+	.gate_clks              = peris_gate_clks,
+	.nr_gate_clks           = ARRAY_SIZE(peris_gate_clks),
+	.nr_clk_ids             = CLKS_NR_PERIS,
+	.clk_regs               = peris_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(peris_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
+	.clk_name               = "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = EXYNOS8855_PERIS_GATE_DBG_OFFSET,
+	.option_offset          = CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
+	.drcg_offset            = EXYNOS8855_DRCG_EN_OFFSET,
+};
+
 static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1107,6 +1201,9 @@ static const struct of_device_id exynos8855_cmu_of_match[] = {
 	{
 		.compatible = "samsung,exynos8855-cmu-peric",
 		.data = &peric_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8855-cmu-peris",
+		.data = &peris_cmu_info,
 	}, {
 		.compatible = "samsung,exynos8855-cmu-top",
 		.data = &top_cmu_info,
-- 
2.34.1


