Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7618606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zw9e+ssT;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ojst14kb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XewHIkWxTFmMQ4BeNxtdv86Gk5Riz4t7IY3ZuKOVSBc=; b=Zw9e+ssTti9e4H
	9eIPPNcXU3zBSUi9nCJXzMVm7wD09tjj6VZ3MLd2zDpqh6zukWE5w0xAmut+PPgbk1NhE4/jR7cnD
	kGaKoM4xcta3qflIFcTQ4MqVrYLEVT8AtbQV5IE15HFapQRskbYCX340eh3VIWs+5F+koM0Rbtxlr
	Al5rTLKYFvidvSaHDiVegFYCcYwuW1eRoZbaEDj3DX9ZvzHjoxm81YS5NIN+fZEGXlJk8pxQfDul9
	KraPsvoYUEWgBQqgjvBEZAWKbzbadRkyKMAPk/GwPe1rUZ59qkhV5XHL3ZaloWUHSTIWBlKx5+RTg
	Zxu6jDK0gnG1zvmoc1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLzG-0000000CqWn-2nLB;
	Fri, 06 Nov 2026 15:36:18 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLz4-0000000CqGq-2IxG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:36:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcwgQRqDsPWOWBjD3Dt1QXf8G61cWA+dTJqXPOdaFY/ymk6YXany8x3qFrNVDwQ7g/53vaA2TtM9VXFPwp2tDvdKgS3aSjM3V0bjagFtxD+kqTvalaC6aq271fOztvhvL+KUtig540uqsP9A13TG2Wzguff19dwLC7wjSjVdXcibkscPFmGYJEDgOUm/rSUl2ypTbUQ6AdjoX7U2/1yjCs2SFDvW8a7x9eyviKhNQORSEy7pqg/f3v01ukx5TE/nQ8cCKUEkPPpEcM2MBGd3mHNGoTq95803eM74R5u3HBFUzAAk2emfpLrdHqVuk05kMKSHWt9T1gM88O8Wz/Q0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XewHIkWxTFmMQ4BeNxtdv86Gk5Riz4t7IY3ZuKOVSBc=;
 b=N8CCcZj/RRUe5EEjBk4oSr7ck5AbXHX+A5Gv5BaN772ySzY8ojr9cbJ7/XW6CroC8nzHiaLvNHOS0KSJum1zO1PZXVxO3Zyi7Y+hDX/h76brGqSHkeRYI4da1vTZSpaOkGjbyyaPX2qHritipwb8YcWBNJhw8dOPQmmIPH6uljgWFWb2VkqDJ01zybbOWx30PIy75c8wgr0+8uvmcegXCqFAbFTDOtSOprEckVLilmngqz9P+UI+p2RKwRpRsZ3Lpw8ELTxoywjK5VZ7OnCkEVBF1/CNU8KSo3m0f2+8JOpBMNnL9K+4S2h7Vu9jArL6gQzFSySuDlFWCE1Ty7aagQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XewHIkWxTFmMQ4BeNxtdv86Gk5Riz4t7IY3ZuKOVSBc=;
 b=ojst14kbwnfACdSI7msseXza64kv69KgqwzdnlU1AW16StKPWo6wLR+0q4Uhd3Rn1g/wqbTiuZCYAqnCtMYV+ZYKauG9iGyvb0gHw4gwkm9NLE21l86NM2oeAOeAkW6cyOa27a/MTXDAOSs6HX2yUF4MS75DXfQg+6dpyJ3TzRrXt4+gNrMEDOHQRmwt20/Bfitk+7eQYx7qw2b8muFXNXGJBgvoMfIQrbGnRstaG3M/cVEni31jsCpwRrxIEArC7j2L9pkf8iX1Vbl4tv1q0Q9LEP3oip0/z6uOd7YpAmw48uq0JCnEDZC2F/TyFr435iJzp0u7kqX6hZXrRNoLdw==
Received: from PA7P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36f::10)
 by DU0PR10MB6754.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:475::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 15:35:59 +0000
Received: from MI3PEPF00008499.eurprd03.prod.outlook.com
 (2603:10a6:102:36f:cafe::65) by PA7P264CA0178.outlook.office365.com
 (2603:10a6:102:36f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:35:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008499.mail.protection.outlook.com (10.167.240.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 15:35:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:36:40 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:35:53 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 16:35:36 +0100
Subject: [PATCH v3 7/8] clk: stm32mp25: add ck_ker_usb2phy1_stp clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-ups_mp25_clk_update-v3-7-4a32f68119ed@foss.st.com>
References: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793979349; l=2839;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=tzeOTXkKeq3tV9H6W50ELVPUNBn9EbNJLSzzkRQDRPU=;
 b=v/XrpgkcHfNTJWpEbZFi8PwuG1vDoU8nETX3FqsVeN6D6LQv9sYJGYl0zY0mZBJ5OoraYP+HO
 FGwC3Qx+1YuBtXWZd/g8txeIk2KxC1wwel0cQerDKaikxaTxl7+3SDZ
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008499:EE_|DU0PR10MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 7679aa6f-7c79-4a8c-30b4-08df3c1ba7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|23010399003|10067099003|22082099003|18002099003|56012099006|11063799006|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: LAO15hzU63NWnIj9mw2mOHLAE/+z3+PGqdf5MmP+i1PT1w8aSqEfiff0z4kXxT2HzXhWAlbUMJ0wKVVrmRJmAx5Dyx01vodRWmp+XY9r8991ELgvRKKIOQrLLSUQLsDiVUmrKGbsi6ShjbGmPAb1ArN+b1mFuPFL/EeNlcFcS43lYBGqXkGzlRAlKPzfy+taJ+zJUJO5JK5csRFRl7+sJr62r6/QXiOur4DGbINOcNKPA7M4xCLUVlK3Dm9lw0RyHY5K5yLnQBAS0r0v3tNUzmlf0PrtVrathyq8iyrk6EVgmrfEilWS2eXYAHeHyr3mmZ3JYGFgUDRMJCWvn9S/qi81XHtrHyQ+NzuW4Lvz9yv8VQobDxjNKNjhI0ZGNIgdAnh3N9N9S7oZ8J0jXfysGJeYGQdbz5QI99iTdmV4O4npl9tGixUAEoOffwibtPiVAQmN2hftcVw7ulHLi7j7FdcrccO+jZscQ7upAI5DTt2Nv4MlG48eOfI8IcVEd1oJhKOmhk9GCbW8I8oqhTMhweHx0Bf0HwkeDoVvVtJnuthbJw6xlan/dBUjU8njgJdvUuW9/VLEhyUunhTwlwUQe8J/33E7s2Iu2r0S5Pp0MfgnrgvakKdS7D4nQu8Wz97hbv4lamw84Nch35+b0HB1+53w2Z/k0gSLFg2CPmlCVTqD8nL02Yd4SQVpD+HFK9is70MdC8Y3KKBTbk+1EaGmYw==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9MI0gWTFM1Q+WEBfPo9Hr2T5AZkZR5yeLQKxWuFyTzhAhEHMEVSHHv2Ei5Ad54I22m57yXK+ved1g6RpFykO2JVrLQgZ2o00nBoFHz3W4GndFHqfD7tAXvSvIuTlleEn3h+HkMhKBMoD4DFEyr7j1+86LvoatpdpNJnOYOXHHI6Mo9mscSxUNJIRkeXVmkmfbIGFa18dOPXUlXXBwOdy+Gcr2vI7YSrZB+nb5laUkMJ4OZF3h9vwzd0CxyqQdVqfxFfDZScF/4qaCkp/cHfSwqoduG1WrQWX6CPS4CrTHkoEAbpiTo38uhnd7cAMJmLgyCaH2HYnAcUPqpBspF4Y9HfQFzq/yjPffVP0qsiTgO4ZkIIDvm+NDGKdKXzhuLezlRsV1oTlUfMe29TIJMB3PxL4/AjBynduX/b+l56pjEmv4WTWSKyj6llQ1rg0dU7Z
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:35:58.7169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7679aa6f-7c79-4a8c-30b4-08df3c1ba7d6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008499.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6754
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_073606_608962_2F2DEE7A 
X-CRM114-Status: GOOD (  13.10  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the ck_ker_usb2phy1_stp clock required for USB Host (USBH) low power
support.

Set hse_ker_ck as the parent clock of ck_ker_usb2phy1_stp to ensure it
remains active during the low power modes. As this input clock is optional
in the binding, it must be described in the device tree for the parent to
be effective.

Update the number of clocks of the provider to cover the new ID.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp25.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index e3a2e5ea775c..a8bf9d570272 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -18,7 +18,7 @@
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
 
 /* Number of clock identifiers of the binding, SCMI ones excluded: highest ID + 1 */
-#define STM32MP25_LAST_CLK	(CK_SPI8_AM + 1)
+#define STM32MP25_LAST_CLK	(CK_KER_USB2PHY1STP + 1)
 
 /* Clock security definition */
 #define SECF_NONE		-1
@@ -356,6 +356,7 @@ enum enum_gate_cfg {
 	GATE_USART6,
 	GATE_USBH,
 	GATE_USB2PHY1,
+	GATE_USB2PHY1STP,
 	GATE_USB2PHY2,
 	GATE_USB3DR,
 	GATE_USB3PCIEPHY,
@@ -506,6 +507,7 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
 	GATE_CFG(GATE_USART6,		RCC_USART6CFGR,		1,	0),
 	GATE_CFG(GATE_USBH,		RCC_USBHCFGR,		1,	0),
 	GATE_CFG(GATE_USB2PHY1,		RCC_USB2PHY1CFGR,	1,	0),
+	GATE_CFG(GATE_USB2PHY1STP,	RCC_USB2PHY1CFGR,	4,	0),
 	GATE_CFG(GATE_USB2PHY2,		RCC_USB2PHY2CFGR,	1,	0),
 	GATE_CFG(GATE_USB3DR,		RCC_USB3DRCFGR,		1,	0),
 	GATE_CFG(GATE_USB3PCIEPHY,	RCC_USB3PCIEPHYCFGR,	1,	0),
@@ -1635,6 +1637,13 @@ static struct clk_stm32_composite ck_ker_usb2phy1 = {
 					    &clk_stm32_composite_ops, 0),
 };
 
+/* Parent clock of ck_ker_usb2phy1_stp is HSE_KER_ON to ensure it remains active during low power */
+static struct clk_stm32_gate ck_ker_usb2phy1_stp = {
+	.gate_id = GATE_USB2PHY1STP,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_usb2phy1_stp", HSE_KER_ON,
+				     &clk_stm32_gate_ops, 0),
+};
+
 /* USB2H */
 static struct clk_stm32_gate ck_icn_m_usb2ehci = {
 	.gate_id = GATE_USBH,
@@ -1993,6 +2002,7 @@ static const struct clock_config stm32mp25_clock_cfg[] = {
 	STM32_COMPOSITE_CFG(CK_KER_ADC12,	ck_ker_adc12,		SEC_RIFSC(58)),
 	STM32_COMPOSITE_CFG(CK_KER_ADC3,	ck_ker_adc3,		SEC_RIFSC(59)),
 	STM32_COMPOSITE_CFG(CK_KER_USB2PHY1,	ck_ker_usb2phy1,	SEC_RIFSC(63)),
+	STM32_GATE_CFG(CK_KER_USB2PHY1STP,	ck_ker_usb2phy1_stp,	SEC_RIFSC(63)),
 	STM32_GATE_CFG(CK_KER_USB2PHY2,		ck_ker_usb2phy2,	SEC_RIFSC(63)),
 	STM32_COMPOSITE_CFG(CK_KER_USB2PHY2EN,	ck_ker_usb2phy2_en,	SEC_RIFSC(63)),
 	STM32_COMPOSITE_CFG(CK_KER_USB3PCIEPHY,	ck_ker_usb3pciephy,	SEC_RIFSC(67)),

-- 
2.43.0


