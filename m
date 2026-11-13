Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2146606B27A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IbXLDedi;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=lDuW68x/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tKq036ZM4sNp3YqJ4P61pnVIM/olH0cj6QOVO2iDOJo=; b=IbXLDedirfsQ3m
	GJiBgf61PAvQVDzKMeN2/c+Ca5DYCn7my5r6CXIa/jMKN92SzHKSI7IuNkGrWcOyGQwVMTQ3vtOFB
	6GBGRjHytC9sQVhuoNMX3Zz6dPOpxZyidmSsyTCJDicGSnorIu1GMD5g+AXLcww2Q3qA8eLeABu4l
	oHp+FchrjHPXVtiT+RRu4GJECWSI1biJslTwMR4sa6qdSWfjlqJl91m3/7nDL+uVp2GNiN1yDd/71
	czLKhA0KiBR6dy+vHYHa7/eYK0Dnys06BYcGpzfCiwv3Lx3TJUXSYzCavyxoRRUV3iL1vOY5e05AZ
	qCva2BYWkj8zsnNmR6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRovR-0000000CQ9t-2JzL;
	Fri, 13 Nov 2026 10:54:33 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRovN-0000000CQ97-3ozQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:54:31 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261113105426epoutp03240b4f53f9e8f9d067eeababcfebf952~nlWvZrcRV0724207242epoutp03s
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:54:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261113105426epoutp03240b4f53f9e8f9d067eeababcfebf952~nlWvZrcRV0724207242epoutp03s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567267;
	bh=tKq036ZM4sNp3YqJ4P61pnVIM/olH0cj6QOVO2iDOJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lDuW68x/JPI8IMYhr4gZgoxlVUqTU3lI0ZUIxRu6UlsJjjDTPqYGT7IcIxhPREnCs
	 /J8TFVavrn36BAQN/jePXOxv/Q1csMiMnQGQVDLwnE8GN1yaoG5vT9jelci/nBPPrF
	 NviQXkpXbOCZbapkjdzVmD9pn3ljvy1AHB4fAK0g=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261113105423epcas5p11c5de50d9cdb5ec9d48103260e9b8e7a~nlWsZwCMr0492704927epcas5p1I;
	Fri, 13 Nov 2026 10:54:23 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jQvJt4mylz3hhT4; Fri, 13 Nov
	2026 10:54:22 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca~nlR9RECkE1464514645epcas5p4v;
	Fri, 13 Nov 2026 10:48:58 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104855epsmtip2bc2e23b8a4aa3305c7f3dad364b60d71~nlR618mo_2220522205epsmtip25;
	Fri, 13 Nov 2026 10:48:55 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 10/14 RESEND] clk: samsung: exynos8855: add block usb
 clock support
Date: Fri, 13 Nov 2026 16:36:08 +0530
Message-Id: <20261113110612.3265841-11-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_025430_269623_534AD90C 
X-CRM114-Status: GOOD (  14.74  )
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
CMU_USB, this provides clocks for USB

Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 77 ++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index 0be1cefadb51..87c616c8487e 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -20,11 +20,13 @@
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
 #define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
 #define CLKS_NR_HSI                     (CLK_GOUT_UFS_EMBD_UNIPRO_HSI  + 1)
+#define CLKS_NR_USB                     (CLK_GOUT_SYSREG_USB + 1)
 
 #define EXYNOS8855_HSI_GATE_DBG_OFFSET      0x2000
 #define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
 #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
 #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
+#define EXYNOS8855_USB_GATE_DBG_OFFSET      0x2004
 
 #define EXYNOS8855_DRCG_EN_OFFSET       0x104
 #define EXYNOS8855_MEMCLK_OFFSET        0x108
@@ -1257,6 +1259,78 @@ static const struct samsung_cmu_info hsi_cmu_info __initconst = {
 	.memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
 };
 
+/* ---- CMU_USB --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_USB (0x13000000) */
+#define CMU_USB_PLL_CON0_MUX_CLKCMU_USB_NOC_USER                   0x600
+#define CMU_USB_PLL_CON0_MUX_CLKCMU_USB_USB20DRD_USER              0x610
+#define CMU_USB_CLK_CON_MUX_CLK_USB_USB20DRD                       0x1000
+#define CMU_USB_CLK_CON_DIV_CLK_USB_NOC_DIV3                       0x1800
+#define CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK     0x2000
+#define CMU_USB_CLK_CON_GAT_BLK_USB_UID_SYSREG_USB_IPCLKPORT_PCLK  0x2030
+#define CMU_USB_CONTROLLER_OPTION0_CMU_CTRL                        0x800
+
+static const unsigned long usb_clk_regs[] __initconst = {
+	CMU_USB_PLL_CON0_MUX_CLKCMU_USB_NOC_USER,
+	CMU_USB_PLL_CON0_MUX_CLKCMU_USB_USB20DRD_USER,
+	CMU_USB_CLK_CON_MUX_CLK_USB_USB20DRD,
+	CMU_USB_CLK_CON_DIV_CLK_USB_NOC_DIV3,
+	CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK,
+	CMU_USB_CLK_CON_GAT_BLK_USB_UID_SYSREG_USB_IPCLKPORT_PCLK,
+	CMU_USB_CONTROLLER_OPTION0_CMU_CTRL,
+};
+
+/* List of parent clocks for Muxes in CMU_USB */
+PNAME(mout_clkcmu_usb_noc_user_p) = { "oscclk", "dout_clkcmu_usb_noc" };
+PNAME(mout_clkcmu_usb_usb20drd_user_p) = { "oscclk", "dout_clkcmu_usb_usb20drd" };
+PNAME(mout_clk_usb_usb20drd_p) = { "oscclk_usb_link", "mout_clkcmu_usb_usb20drd_user" };
+
+static const struct samsung_mux_clock usb_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_USB_NOC_USER, "mout_clkcmu_usb_noc_user",
+	    mout_clkcmu_usb_noc_user_p, CMU_USB_PLL_CON0_MUX_CLKCMU_USB_NOC_USER, 4, 1),
+	MUX(CLK_MOUT_USB_USB20DRD_USER, "mout_clkcmu_usb_usb20drd_user",
+	    mout_clkcmu_usb_usb20drd_user_p, CMU_USB_PLL_CON0_MUX_CLKCMU_USB_USB20DRD_USER, 4, 1),
+	MUX(CLK_MOUT_USB_USB20DRD, "mout_clk_usb_usb20drd",
+	    mout_clk_usb_usb20drd_p, CMU_USB_CLK_CON_MUX_CLK_USB_USB20DRD, 0, 1),
+};
+
+static const struct samsung_div_clock usb_div_clks[] __initconst = {
+	DIV(CLK_DOUT_USB_NOC_DIV3, "dout_clkcmu_usb_noc_div3",
+	    "mout_clkcmu_usb_noc_user", CMU_USB_CLK_CON_DIV_CLK_USB_NOC_DIV3,
+	    0, 4),
+};
+
+static const struct samsung_gate_clock usb_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_CMU_USB, "gout_cmu_usb",
+	     "mout_clkcmu_usb_noc_user",
+	     CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_USB, "gout_sysreg_usb",
+	     "mout_clkcmu_usb_noc_user",
+	     CMU_USB_CLK_CON_GAT_BLK_USB_UID_SYSREG_USB_IPCLKPORT_PCLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info usb_cmu_info __initconst = {
+	.mux_clks               = usb_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(usb_mux_clks),
+	.div_clks               = usb_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(usb_div_clks),
+	.gate_clks              = usb_gate_clks,
+	.nr_gate_clks           = ARRAY_SIZE(usb_gate_clks),
+	.nr_clk_ids             = CLKS_NR_USB,
+	.clk_regs               = usb_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(usb_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.clk_name               = "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = EXYNOS8855_USB_GATE_DBG_OFFSET,
+	.option_offset          = CMU_USB_CONTROLLER_OPTION0_CMU_CTRL,
+	.drcg_offset            = EXYNOS8855_DRCG_EN_OFFSET,
+	.memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
+};
+
 static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1281,6 +1355,9 @@ static const struct of_device_id exynos8855_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos8855-cmu-top",
 		.data = &top_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8855-cmu-usb",
+		.data = &usb_cmu_info,
 	},
 	{ }
 };
-- 
2.34.1


