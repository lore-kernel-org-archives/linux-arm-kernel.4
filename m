Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CEE606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BQHHoAcV;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=qz1/Pr2T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sZVnk/oz8A3zFW38a83qldCkKYMlv3yashExOpt4mMw=; b=BQHHoAcVxkJ73R
	99TcDJnS0oMvrEKLz+enyTbk2GSZta2XpHLmekVuywAK8vSC+l6J27LdzRql17uvxw8bZkNbNEAvg
	WOUcefNYs08yq1ShoyZ1Fap7PEaMxTsFUBxNOEivEg3xWU7Wt0NNOlOLYOG8VIqAg1DBpwe2AcY7I
	Z7C6mG6irT4l0KOasHCBuMwCW5xE4TCJF2X0w6/PQp+rW2LAmFNFAKQHNkqusCYKW2ONaZcbbR0PX
	DOqoPsnvcemvS0xyzULuKMA5gWGN8Y2TPOCSc2zQnMGfVGDRLkPEnqSbEQdLUaLjooUIvREyRzmNq
	KQWw1zR5QNwdTfTw7Qug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb2N-0000000DexN-2gXk;
	Thu, 26 Nov 2026 15:05:27 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb23-0000000DeoA-0bM6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:05:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDK/ezU3Bjyu3oFN9BDz8R3US8BmKjaf5KW8oSGd1JnKAh7C/jV1YVF1rLqab7vkoonqHOmDr9o3kVbChA9iNWd6Nr4PbudlcVJzSCKSu0UgJ5EuKuP4/ZUAgpF8CziMC6bpKT5/OgW4/PRFSH/FsLb4JS0YjEb29Vd7UD/1GtMKHbjmVJ9OaYZseEXbAIE9gPIqjZOkwOmd/ml789QEbZTfdtqq1I+5eKLl15slh8CugIutAiYlkS7MnN2jHJfnPobAvclD6qP/sVQ4xdeyuuedwCiz8G4XdGjmJK323Pd4genG3imfQz5AxxrPM9qt/xdma+3bVtcLCq9nBLpMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZVnk/oz8A3zFW38a83qldCkKYMlv3yashExOpt4mMw=;
 b=Fzq3QJRV3CQHYvODeM7g1rZqgSV3t3cR5Fhvx7QZcomHh19Oairjvv7aN+6fdYZ4JzfNLeVJicHqfpozZcPwYRihL6EPm3F/Ky7bhW1nsRKjG13TSEDoHuqtOxhWl+d/nZsZRwmhPYNRW2Y+FqJ0J0ItGlGzBMHtUL/8NHgMMbrjWbbwmBVLX78OIXTkAK/J85xP/EPf2lgzuYWjof0iHwKP/CedmxHPBOJNeCcvbs62xYQ9rLfP5UBMJNeiDl3OWO+QnuzV+d+qQr6ekxFn5J1Ldl2ZDiDgd+km0zC5FZzyh3bOIeYoIkTD+6wn1PaYJs4+9ofIqdvPISygBB6j8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=nxp.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZVnk/oz8A3zFW38a83qldCkKYMlv3yashExOpt4mMw=;
 b=qz1/Pr2TuRRoW+hs9whVaNF2I8z1OUbIgY3S7RX9NrnHTtbECD4qV0BcDZj1ebY59nI9ARoxnPSz5HD+4i4IkCMv/qBXVGcf7LkML3qs80N7bdWNLyI2K7JZ621G9cUzPWi+5Dn5lKmQ3Gpi+lLGoqncSzCXauO1Igi2GCOLlpTDxBVYyiSqQ/vnjgBhIcB3m+BejDUB4J5Ik7OSdQ8/lr2v5xxVzCZRGAPoTCD8c9qJZD1Lcr7qiLz5Hw4c5VaUmMJ6ZYO1369wSsRfcg+fkaRJxuiemZ2DL1HN+FU7uUWbOMggUoB70INA9Qa4ykiP4ewyzQnMnkFC2HJoej5XOQ==
Received: from DU2P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::26)
 by DU7PPFAF973D492.EURP195.PROD.OUTLOOK.COM (2603:10a6:18:3::be2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 15:05:00 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:231:cafe::61) by DU2P250CA0021.outlook.office365.com
 (2603:10a6:10:231::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:04:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 15:04:59 +0000
Received: from [172.25.51.48] (172.25.51.48) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 16:04:55 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Thu, 26 Nov 2026 16:04:55 +0100
Subject: [PATCH v3 4/6] arm64: dts: imx95-phyflex-libra-rdk: Add M.2 Key-E
 88w8987-bt overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261126-wip-bhahn-imx95_upstreaming-v3-4-a2bda009bac8@phytec.de>
References: <20261126-wip-bhahn-imx95_upstreaming-v3-0-a2bda009bac8@phytec.de>
In-Reply-To: <20261126-wip-bhahn-imx95_upstreaming-v3-0-a2bda009bac8@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Yannic Moog <y.moog@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>
X-Mailer: b4 0.16.1-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795705493; l=1903;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=ZHd64N9/mQ2McMpdPpmM6d4ZBlRfpTrBvZHDkKBQ8Hg=;
 b=0qbZ7HgdYtaXKtOVXNH/cihH8/5jkjNUIHl76K0Q4HLqUz74dHomnSCSapJYicAmGYf4wK/eZ
 +ZWvGUtgTj9D+efc6N9Idv8t0PN3knjY0LV3hmPwsrlZIkeb79Rifgz
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|DU7PPFAF973D492:EE_
X-MS-Office365-Filtering-Correlation-Id: ef30d466-9617-4111-aa76-08df4bcea41d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|7416014|376014|10067099003|261102123227099003|261021121427099003|261009223027099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: j1r7+Tw7LDY/FLrrQgTOepctbAwEmRxUZglVcNf6KK0B+NlKkAu2aqRtQCWgCzKVvPOZsOW6Q+7OstlN5gKOUS5uDSL65BODnrPYMimXgtBOVvJt+7B0zu86qOcHodZiLS3Uj7X1aCAzdLIWVF2jghyJbgEIVAQWucpDzYIqB33jvcpBPXJsdmmRtuRXRNLVujwv7Rz7jtkHPIEJC84rpQRfB6/GDRCWx9RQiCr97bd2m2mEJnjqBFzDQLxVW/MZik4BNarxFGjGNd9n/Fn1OoGLrIT9fDuom1tH3k7BRgwrKQ9MvxIXReM+HY7GXVQ9zjCJ+WQLLCnwlD+y5+cXMGfVrDfTIMQzUJZsGCWyovsO4DRBk7m1htcuTdLQzM5Av9wVaoaOx3DeVUPmUl5QdNMLgPuUEWn0J+MSxvSUvOptikfkvvx7jLF1ofoFYvq73UamV9ykPbirvtaVkqHebkzvzJHm0mqfc78ZTaXAkQNsWwDZV9duFtUSKba0oFvyChwKN3+vMAqcJ/GOf2GmN7R1jU4psKYhQdgJGeIRxVTlfF7d5WIouFQ05RC01KCAsPF7QlrzQMf2R5D9NoNW/bhH2+2QkQfmAsIlBz66e+kuqDuT0iCkBHG4Nekt0Oe0TuMHMraPpX0SKmb34tR4cohtckW8i18+KG5qIg25LK7iT5ZRV7OeyTJszQCOLYMdSPDGNFRNg6GHq+B0KnmVFg==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(7416014)(376014)(10067099003)(261102123227099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZMKvsdnLrDEVklLyLg7sJfzcCoFyfJVnz4o0vySjjFlGvskH6/3Wgsqt3HWqUKB4754WQbKnarR7bjE/mzEPrR7Ze3weW8rT5K8ilu0tVPcBasd7T8qNsTfNvpBh7Wbnq6p7O7SY17qO9OZi9l0zq6iNx6bpQOtx4DKAczJ120A7fd2rhgMcBGvy2SyRShf7jJQHZl2b8akLCUsVvVuLqtYCU1UWmqArwyrPKNmaXucepmvxlb6Q/1VSX/vaXNVZMz3vpExvgW+flC3bqR8eQ0YLcsIJ/2KB/Vv7tPSSGWwmRV41z2xbqTEleb1MalxYfReofyW/KlDfG28K3qr76J73LkDXZ9lY4AAQLbACdhGL1KI8q6wqYyQFnQuxaFk8IKRIBjhhBp0obZTphpD7NrXJkyPuyBOskelmx9gDe5Lcw/gVtaeo6secnneKubhc
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:04:59.7737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef30d466-9617-4111-aa76-08df4bcea41d
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFAF973D492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070507_215250_DBD68542 
X-CRM114-Status: GOOD (  11.13  )
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

Add overlays for M.2 Key-E WIFI/BT cards that need the nxp,88w8987-bt
compatible in devicetree (tested on IW611/IW612).

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile                |  4 ++++
 .../imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso    | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index fd0e3b160ddb..17b357f4886a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -742,9 +742,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 imx95-phyflex-fpsc-g-som-temperature-dtbs := \
 			  imx95-phyflex-libra-rdk.dtb \
 			  imx95-phyflex-fpsc-g-som-temperature.dtbo
+imx95-phyflex-libra-rdk-bluetooth-88w8987-dtbs := \
+			  imx95-phyflex-libra-rdk.dtb \
+			  imx95-phyflex-libra-rdk-bluetooth-88w8987.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-fpsc-g-som-temperature.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk-bluetooth-88w8987.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
new file mode 100644
index 000000000000..c0a85005627e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&lpuart8 {
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		fw-init-baudrate = <115200>;
+	};
+};
+
+&uart1_bt_rs_mux {
+	idle-state = <1>;
+};

-- 
2.53.0


