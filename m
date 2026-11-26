Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C66606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iNqNSQcq;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=pPqUZudV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KEXOtHWT0uqAXGgE1nWJVQ79RuQaE2Au3Bc1f0PlGtg=; b=iNqNSQcqwK375V
	r4YNmOgVrf5KP7Q3+yY6u5a49kGwrTyVHEbUk3iqczfUeh+bS+4eYRNmErfrnKGvbyAvdXRTCKa+N
	WttUdMMbD3AA6hU2Far4nV+Os2SyMhZHWAtiET6F2gxcB35totLE6qTgznmx8NPeBY+fEsVBRq4Tu
	WA1oWz2HjkSjSRfU2HdGLEdfpH1yU77/+WCwV2zudNapmW6AyzQFs90juY7s7UUv48johqTRKvLZ1
	4EntB1GqwbVNdCDy3sYAvFIcf0yaixOqSZ4Ux3HEXemeB8ooDAELr+qoKyKJ6izPxjEqr4Rj6p8Uk
	NxAGNAfzvweBB1VZ/29Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb2N-0000000Dewi-1dBE;
	Thu, 26 Nov 2026 15:05:27 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb20-0000000Den6-468A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:05:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1lGo8qrD1P4PsVTGXLvctbwo+M3jrd8bYGRQdBcS1zeMIMbuaOYxAo8l7YRVq9jjvYhxJPUUN1W2PlQAlQc5pCldale3oykMdwO8+sgarlJ3Ew/CKQTOQvnzDZ8WoTKnBlBwXZ1S026bN84rqMyuvrWYKieJYCUgkKahqi165Va9DqWx4cwoF3KHFjAtHQiTN0BGr4E/gcf9+GNkBpkrYbz/dJTQB8W9CYYjROwhRQuQf7lD2qrsHtiwdMXeGoZFeJpu/oW7JZv+Kb6G9xvw9bBwUcOU/Bs4+AURFpuYOaI/TRnrxSx9XzXXsXsmeIZOBpXQWFohwtwowmR+vf7zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEXOtHWT0uqAXGgE1nWJVQ79RuQaE2Au3Bc1f0PlGtg=;
 b=rCMpkEIR026ng7inPXJpBiiUVDv16W/zOj9AvZagaKNBWRqtrCFwB1cwneHqs1gUnKCttazld6+tGpKeMSFSWhzZOUJ+Kz11i247f9cqJNPOkFWjiL3/xiKA4Gptoc+8RMKnZZUcVTSPw1d6tBTASXxaYQtJW/zex22HWTlmrHKoQVMqTJe+n3BVdarqqaPr1PJy6wXy8vJHDsXWuR43/yVtdEBvEdV4opzvgv4u8bg98vnY/xhzAFEYsHy/jmy8w3ZbrhEvO+e30sSDAeVFb+wFljRqnA4hyWv1JWohYumr76e4E0/oVmlNev0n0/y4m1lYZgNrOR1WTO+FeW/E+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=nxp.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEXOtHWT0uqAXGgE1nWJVQ79RuQaE2Au3Bc1f0PlGtg=;
 b=pPqUZudVJP85yAV6SsnV/VzyVJeY0SUoq/FIeJOSUNcKneubrNEw73AYJA7BdcNYGDTXH+nVatQnew06qlM0IEW9oOSMWLF18uIkEzooSe7vKGhHUxOEu1NaT8yCpfAiyBiiiHrYNb+qjbExWqil2Bu61RArrRQVQFcsIQeGD8wORGFb3heDR655QevjzVHa725B/nwH0kh9YpdkgDswk802V0dQi057iZ1/ST7/arToQKoGWDD9eo4u0ihU7JOiAzTV+YjapG402JF1Cjc+PVfs1PFuCtNimGhstYSGoL5Hwgc3w15W8zC6x/2rUXaakbQHrcnWnfTDhQwj/Y7CGw==
Received: from DU2P250CA0024.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::29)
 by PAXP195MB1152.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:19a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 15:04:59 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:231:cafe::51) by DU2P250CA0024.outlook.office365.com
 (2603:10a6:10:231::29) with Microsoft SMTP Server (version=TLS1_3,
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
Date: Thu, 26 Nov 2026 16:04:54 +0100
Subject: [PATCH v3 3/6] arm64: dts: imx95-phyflex-fpsc-g-som: Add temp
 sensor overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261126-wip-bhahn-imx95_upstreaming-v3-3-a2bda009bac8@phytec.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795705493; l=1781;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=xnrpxkCNIqOhYCpNpdYHbtCsiV4tUlzVv4gLjVGZEAQ=;
 b=RtARCYIf1PKrIn4A8zVTsqgPQcAggzqAi5S+MFhWGNNwk8DBufM1iKPlKFIs5+muRSgXz12AI
 xHyWE3aYptdAkYhGcAfP3JhIP8dHkieZRzDwxwPP6uhpg/sF9k9uRyF
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|PAXP195MB1152:EE_
X-MS-Office365-Filtering-Correlation-Id: bfac1b41-f8b3-405f-f3e3-08df4bcea3ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|7416014|82310400026|261102123227099003|261021121427099003|10067099003|56012099006|11063799006|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: KtK9HmeDqLPj42JZfjRZXtvx0qIj630aNiLPMXTxkpJJ+ldLD9Aaq3VHgIpdl1VltLA5HtkQVU7/V0fxPrYGdPEibRjmZWL+jmeYhAVjrz4PahRmn2kPvJW8tBS6zoIXor5i7Oh6WkhCLHe7YJjZ7XmmjV2YSPLnJ5PE66TfA9BGBU5/HBlSxwBmL9RLZQbb+QVZM3F4MGOXN1en6H/T2dEZo6H/UcYCNIk5umuW2YRZFZukHRBbzkiAnuW5/BTHLkHycFyPyOuPJJ6+W/Wnhjj09QJQT+zK+lFNJr0M85DysIULGLWAc9gkPJu6w1/zOf4hL0DfVcvHAcYuBqTj/0ygL/J246bnXaf5XHYiiKQr0PR/R6e45KzP3QOr+WpuR4P7plMDFjRhGPR4afSSpJy3M4SuzCkWm0EjO4VTb4i4+1kN4UBDNqDEtoOUMfJGs0/RddaBzsGjXGcDEJqWrx2dI7Tei1SGgwpFhAtpP413n+8PD7RK+ePbFNJb4ssfPGwLYKoWSZ8igRb0Yx98/iEKLifvccKdM9VPnG0ZKW4gt3vDyhW2SkWo3yDmNTDyhri9way+U+UCJrwc9mRXOHPpyHBmZvfIgkAD7Ev9Ozv466QGPxTeqRsjxbi3y7hgNnrb+2YKAr24F8N5q/sc1fsR31wIrvM4CFkrSGA8E/nVmoy6bKf+OzEgjny6BCx/wLWe1ITU5h+rF909Sg/zKw==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(7416014)(82310400026)(261102123227099003)(261021121427099003)(10067099003)(56012099006)(11063799006)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qzwqvRZSQz+7mCK9CBgVj8W5Sp4W7pcNnbD61bkjJMYpkpRX1oVhxEgotEBqf/Fx06ukbxN33BtiHp+bnL4S1OdMGSUg6uwzLXnKePnVo7FNwbgySMx7y4NHHxwdQYnoIe0pCpeC2CeHPirGMeJg5KngSVmmj1feTTXQ1Mlz0HLs8BRwaKGBn17Sx/4A2Z2q0qOWkfsuZyZlSZ5cs8gD+bX/D1FYPPFBVFbVqqnUj5mdG+8dOKSem4D30JLuIeH96MaXGpPi18IzXK2ygkRQwIrKsxRWtrShNmBlXioytbmilbb94C964rUadlW/gLApAkEAchiuurWFkJdN6IZU6hZc1+m5iz55wgC/x1Sr0q/uLo5CZtIIgTd774mGdraMU7zdNnYkqphYX+PNZlahZeEZ0mO/f4RzVrXSD42nI8jeUtr72KOXEkVLApAdWPQY
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:04:59.0364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfac1b41-f8b3-405f-f3e3-08df4bcea3ac
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070505_029053_0C89A02B 
X-CRM114-Status: GOOD (  12.06  )
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

Add overlay for SoM temperature sensors. They are optional and will not
be populated on every SoM.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 +++++
 .../imx95-phyflex-fpsc-g-som-temperature.dtso      | 23 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4eb7508193e7..fd0e3b160ddb 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -739,7 +739,12 @@ imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 
+imx95-phyflex-fpsc-g-som-temperature-dtbs := \
+			  imx95-phyflex-libra-rdk.dtb \
+			  imx95-phyflex-fpsc-g-som-temperature.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-fpsc-g-som-temperature.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso
new file mode 100644
index 000000000000..84afe1ff9f06
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+&dram_sense {
+	status = "okay";
+};
+
+&emmc_sense {
+	status = "okay";
+};
+
+&ethphy_sense {
+	status = "okay";
+};
+
+&pmic_sense {
+	status = "okay";
+};

-- 
2.53.0


