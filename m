Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0B6606A899
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C216XKcO;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=eaOuMNGX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EBWGoFoY6hiIrBdF+iItvO+m7HBmLD0taNMf8fK3B/o=; b=C216XKcOUaXCYi
	Lj+SMcF9WE/fJuhq4jkbjdNk5KfuCTKApLGb+gS/rAHe6dD98cwPMwDEghBID/VKv01d96FONKLuw
	ERhvC3i6ZDmloFeXLa4OKQtaxUDVPF4UeiG1jvIjTn0Koa4Fd0SXzDvRdRW/oiP5+hwXFSb6M2hWC
	ufvOnDxG/wqKHSk+A1CP/EcYcr0J9KZR+trvpQcsfIzVT6uAIKqtstAXc4L58H1k1VbJTCZLD4mGe
	jPVpMri3EkUVT6mBUHjOMqLkkdfgMzt/6O3WIgdhBaoImFzfa2tyXs8BhbscczYnb1zmDEdPWcjJL
	32V31kOB6uQGs4YnMHGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuND-0000000221s-0dv7;
	Mon, 16 Nov 2026 10:55:43 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuN7-000000021z2-2awO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:55:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xl0TN/dC6pY+DnVZ8nJsNRVtUI0xsDw5Y8HuRpmQ+WMolNsv1FqjqdTBtm763MU+47KV/1TRGJzJU8Kb5ZtIc3ATKA3Sa5RNEhF8qHbpfN3sNe/+zeKjPMWFIK0mhY5ZaZWZzttPci0j80pRen9umvx0rvl+vzf77fcY1JhNB4DpBgD8RdDOqBQeD8lfBwOP7dWkfI/9lCzo2qBe7iosPL6qjCA6K4LOGOJrvda7BirGgA+swBoq4H66KnIWAPLNFSk2tuKCSRAAXvE4tuVwnvqvGxtubvCPS3Gr4ZOIoo6+6GPW825LLItvhSbhk5UrOrms1UA4nsGAMJimamUP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBWGoFoY6hiIrBdF+iItvO+m7HBmLD0taNMf8fK3B/o=;
 b=iocjw+3X2azgjRneO/vUcz0YguoSbhQvKHF70XY9vWi64w0ETiBIFXywmRImAAr5OvPWrSApjhC3pDQOtZnLwNOcydu+YNh+6aj9CLtwzRa5zTpiv13d0Qv/NTfqSTKoVNd14umibndORpgx6CtAUz0NrFDPoW5zAqeksx3Paq5k+Pp2QEUyvz6uW57fSIzU0n6eh1cvBpHnRp7npBY22LHwD12AqsA6tYRf/pWXRuv0AMD7uCRHebTLMfIZNsev94iy2ig5DEaUbEx2zdlTjhmLUCBxHlJV9Cnjir9gr/SUOS2QeJvaa3cKOLFve7NXidaAzeZfx3f4FxYSJB07zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBWGoFoY6hiIrBdF+iItvO+m7HBmLD0taNMf8fK3B/o=;
 b=eaOuMNGX5ekfAz+4sZrl+XTPontrPydwkqjOrX17FAi6w+svlxQ6v1/qo+25sLZt7z+X4ZK8JSJgl4Fm/7dwrNeggC4FMfeRW/OIwYq791oxNXWmUG6t/Mo5sGNuUWlFEU78G3AEmqNiBKlHCzb+MaNih5Yso2BmrHOzE9J/jKSGpIVsilzAMJEoIPcyRiqR1RVYa5XBWrX8T3yW7ZSTSwXjlZJ/b9tinSlBC98r2AbnX09qn5BmRwYrJZ6cWRsWgH34HO6oI3Oi/CaPdQoYkCS7NkrXKoUk7pUkffAOZtacLqtSTMdc5QkNFIwBcd5R6hR2GmF2+7On1oYZvMnO7A==
Received: from DUZPR01CA0241.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::24) by VI0P195MB3107.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:2da::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 10:55:30 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::c) by DUZPR01CA0241.outlook.office365.com
 (2603:10a6:10:4b5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:55:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:55:30 +0000
Received: from [192.168.2.225] (172.25.39.168) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 16 Nov
 2026 11:55:28 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Mon, 16 Nov 2026 11:54:42 +0100
Subject: [PATCH 3/5] arm64: dts: imx8mp-phyflex-libra: add display overlays
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-imx8mp-phyflex-v1-3-4adcf8b4d373@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
In-Reply-To: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: Benjamin Hahn <b.hahn@phytec.de>, Christian Hemp <C.Hemp@phytec.de>, "Jan
 Remmet" <j.remmet@phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Yannic
 Moog" <y.moog@phytec.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794826527; l=9932;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=T+Kuezj0O/pipWxziGOQiu+JoG3WENYX4ENK+OaCfFA=;
 b=blyO8+S+yVv6/8J3SPWCio55CYV/OJkr9T8Ff3v00sFUi+nsPS37WiqdDd041nQydUlruQCYr
 dnbuQLgYpyLCTNDSASbkl9wVnt/0nGRrrtf5wDrGTaKwT7C+I39U+DS
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|VI0P195MB3107:EE_
X-MS-Office365-Filtering-Correlation-Id: aa0a55d3-0dcd-45e4-5035-08df43d0215e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|23010399003|36860700016|10067099003|11063799006|56012099006|261021135927099003|261022105027099003|261021121427099003|261026140227099003|261022075727099003|261102123227099003|261028144727099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: YFK+qEDM5d5eKfmd/6ZCYJ4QSWNFQmPUc3WFeyqz6Obs5OGafds+to4YRgxy677FT1H1AhStkA+yQuP9B7+eo41uGTePsD6oRrogUDZUI6KQTqvsf/kuLTLHe7UOqluX+gN/O8EfHc0ivTkJxffHag9wDpqcofKMN+zMf8l5X4wPfvZhnr165oEq3e8riZiHRoV7Z4WC9ATaMKij4xjIGM/ztpZjgj3CDPGAJfzZayXDQ24LAjDqacbducPU4Km5yilVyw+ZwuqPLMeUDofY2HeZSwQUgDvXzGTuDueeOXUs69FhukgEghWoCJI2Dv+Rviny0eq81w/Wy0+h72ittxrNBAPA9JR5kdYlAgDTuF18nKb3Fr8Dq7t2YJHvt3RkjGMSEOzpNuOYyxemLLDe33RqaOq0avEc3fqCLpXyrJ8GbPqfUFIqJJZgJR+yc4Y9xwMQg1o9En4kEK8DVqzbLamuHPjxQRB+LKtMKLNlmOSsrmgSq31bfKz+tERZpr/KzO9b2g6PjDyZEdb1IzQ0lL4DJxrcGv6yArofg28pkwvOPzlYR3HIs1ZPBEB5/454KD30/O8gmA2pOays4tn/cfk8TzL8XXUkrAvCsWJ3wZA6HgmdP6xBarRxsp61tc0Dqq1sMAeQkWnq+WVlr1nL3HWvbLHY7w0Ktm8RRVodcJEBX2P9qbd8Aup2wl82Q4eS8qCRWjNYhA8V/nTAfyJW7g==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(261021135927099003)(261022105027099003)(261021121427099003)(261026140227099003)(261022075727099003)(261102123227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V8xyS4gFqVi7cOI0PSSXf0XJTvp4+ng0nwQVRIimbwKlP+WRbcrBCbK7F7m3j30p3iftNWxONlR0+l8EgdIsQ/oNr74zizyblrNLxXqb00hqUoTZcvRjlcw8gT9jN3ZBLHbj/sedBHrzT0Q5JMu1hwYz4qa7iUz99pyTPDsVuANEES9HQnOC/e87WFMTGpuOcHq6q4EjGq1CLDz9Yq6PlCiejUWWaz5NZdisLNkB8QoYoD4SZ5OiO60ybOiS77aJIJxblYBwS30RWm0u1HEHkurcOSQ+8Y6E5+bvO6EqaP953l5ItrLtOjNyE7sx35XOpKinA/jf6TP43CvJk7TXhYQe3ZuM0PVpQXCdDBkgQRreaWLf8CPzWRjxeVl5T9B8LZPvN0HLrD7uATuLuteNS83UqxrIke6ICyNronmgYiivPtntnNfyD+7ES4834VfG
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:55:30.1314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0a55d3-0dcd-45e4-5035-08df43d0215e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB3107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_025537_850801_5E4DB5CA 
X-CRM114-Status: GOOD (  11.44  )
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

The powertip ph128800t006-zhc01 LVDS panel can be connected to the Libra
baseboard LVDS headers or to the PEB-AV-10 expansion board attached to
the Libra board. Since the PEB-AV-10 also features an audio out via
3.5mm headphone jack, introduce it as an independent overlay if only
audio output is required.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |   9 ++
 ...-phyflex-libra-rdk-lvds-ph128800t006-zhc01.dtso |  44 ++++++
 ...p-phyflex-libra-rdk-peb-av-10-ph128800t006.dtso |  45 ++++++
 .../imx8mp-phyflex-libra-rdk-peb-av-10.dtsi        | 152 +++++++++++++++++++++
 .../imx8mp-phyflex-libra-rdk-peb-av-10.dtso        |   9 ++
 5 files changed, 259 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c716beaefbf09..c63c0c8ea2c86 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -469,6 +469,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-ph128800t006.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk-no-eth.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-wlbt.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyflex-libra-rdk.dtb
+imx8mp-phyflex-libra-rdk-lvds-dtbs += imx8mp-phyflex-libra-rdk.dtb \
+	imx8mp-phyflex-libra-rdk-lvds-ph128800t006-zhc01.dtbo
+imx8mp-phyflex-libra-rdk-peb-av-10-dtbs += imx8mp-phyflex-libra-rdk.dtb \
+	imx8mp-phyflex-libra-rdk-peb-av-10.dtbo
+imx8mp-phyflex-libra-rdk-peb-av-10-lvds-dtbs += imx8mp-phyflex-libra-rdk.dtb \
+	imx8mp-phyflex-libra-rdk-peb-av-10-ph128800t006.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyflex-libra-rdk-lvds.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyflex-libra-rdk-peb-av-10.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyflex-libra-rdk-peb-av-10-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-prt8ml.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-basic.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-lvds-ph128800t006-zhc01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-lvds-ph128800t006-zhc01.dtso
new file mode 100644
index 0000000000000..9378f55bbc8ae
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-lvds-ph128800t006-zhc01.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight_lvds {
+	brightness-levels = <0 8 16 32 64 128 255>;
+	default-brightness-level = <8>;
+	enable-gpios = <&gpio_expander2 9 GPIO_ACTIVE_HIGH>;
+	num-interpolated-steps = <2>;
+	pwms = <&pwm1 0 66667 0>;
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/*
+	 * The LVDS panel uses 66.5 MHz pixel clock, set IMX8MP_VIDEO_PLL1 to
+	 * 66.5 * 7 = 465.5 MHz so the LDB serializer and LCDIFv3 scanout
+	 * engine can reach accurate pixel clock of exactly 66.5 MHz.
+	 */
+	assigned-clock-rates = <0>, <465500000>;
+	status = "okay";
+};
+
+&panel_lvds1 {
+	compatible = "powertip,ph128800t006-zhc01";
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-av-10-ph128800t006.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-av-10-ph128800t006.dtso
new file mode 100644
index 0000000000000..33677601789bd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-av-10-ph128800t006.dtso
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include "imx8mp-phyflex-libra-rdk-peb-av-10.dtsi"
+
+&backlight_lvds {
+	brightness-levels = <0 8 16 32 64 128 255>;
+	default-brightness-level = <8>;
+	enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+	num-interpolated-steps = <2>;
+	pwms = <&pwm1 0 66667 0>;
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/*
+	 * The LVDS panel uses 66.5 MHz pixel clock, set IMX8MP_VIDEO_PLL1 to
+	 * 66.5 * 7 = 465.5 MHz so the LDB serializer and LCDIFv3 scanout
+	 * engine can reach accurate pixel clock of exactly 66.5 MHz.
+	 */
+	assigned-clock-rates = <0>, <465500000>;
+	status = "okay";
+};
+
+&panel_lvds2 {
+	compatible = "powertip,ph128800t006-zhc01";
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-av-10.dtsi
new file mode 100644
index 0000000000000..e94ce6691a620
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-av-10.dtsi
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel_lvds2: panel-lvds2 {
+		backlight = <&backlight_lvds>;
+		power-supply = <&reg_vdd_3v3>;
+		status = "disabled";
+
+		port {
+			panel2_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+	};
+
+	reg_vcc_12v: regulator-12v {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <12000000>;
+		regulator-min-microvolt = <12000000>;
+		regulator-name = "VCC_12V";
+	};
+
+	reg_vcc_1v8_audio: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VCC_1V8_Audio";
+	};
+
+	reg_vcc_3v3_analog: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VCC_3V3_Analog";
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "snd-peb-av-10";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,frame-master = <&dailink_master>;
+		simple-audio-card,mclk-fs = <32>;
+		simple-audio-card,widgets =
+			"Line", "Line In",
+			"Speaker", "Speaker",
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack";
+		simple-audio-card,routing =
+			"Speaker", "SPOP",
+			"Speaker", "SPOM",
+			"Headphone Jack", "HPLOUT",
+			"Headphone Jack", "HPROUT",
+			"LINE1L", "Line In",
+			"LINE1R", "Line In",
+			"MIC3R", "Microphone Jack",
+			"Microphone Jack", "Mic Bias";
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+
+		dailink_master: simple-audio-card,cpu {
+			sound-dai = <&sai5>;
+		};
+	};
+};
+
+&backlight_lvds {
+	pinctrl-0 = <&pinctrl_lvds2>;
+	pinctrl-names = "default";
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";	/* ensure enabled */
+
+	codec: audio-codec@18 {
+		compatible = "ti,tlv320aic3007";
+		reg = <0x18>;
+		#sound-dai-cells = <0>;
+		ai3x-gpio-func = <0xd 0x0>;
+		ai3x-micbias-vg = <2>;
+		AVDD-supply = <&reg_vcc_3v3_analog>;
+		DRVDD-supply = <&reg_vcc_3v3_analog>;
+		DVDD-supply = <&reg_vcc_1v8_audio>;
+		IOVDD-supply = <&reg_vdd_3v3>;
+	};
+
+	eeprom@57 {
+		compatible = "atmel,24c32";
+		reg = <0x57>;
+		pagesize = <32>;
+		vcc-supply = <&reg_vdd_3v3>;
+	};
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel2_in>;
+};
+
+&sai5 {
+	assigned-clocks = <&clk IMX8MP_CLK_SAI5>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_AUDIO_PLL1_OUT>,
+		 <&clk IMX8MP_AUDIO_PLL2_OUT>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k",
+		      "pll11k";
+	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
+};
+
+&iomuxc {
+	pinctrl_lvds2: lvds2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28	0x12	/* FPSC SAI1_RX_SYNC */
+		>;
+	};
+
+	/* override muxing definition since pad SAI3_RFXS is used for LVDS */
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__AUDIOMIX_SAI5_MCLK	0xd6	/* SAI1_MCLK */
+			MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI5_RX_BCLK	0xd6	/* SAI1_RX_BCLK */
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI5_RX_DATA00	0xd6	/* SAI1_RX_DATA */
+			MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_SAI5_TX_SYNC	0xd6	/* SAI1_TX_SYNC */
+			MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_SAI5_TX_BCLK	0xd6	/* SAI1_TX_BCLK */
+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI5_TX_DATA00	0xd6	/* SAI1_TX_DATA */
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-av-10.dtso
new file mode 100644
index 0000000000000..1fd35fc3d77ea
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-av-10.dtso
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-phyflex-libra-rdk-peb-av-10.dtsi"

-- 
2.43.0


