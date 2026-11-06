Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD8A606D816
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=avVzd0kr;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bXBzLFNU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CPV4T6OdWuxAsZtn2up/ABfSyARsD7uC8DyRFXT/bS8=; b=avVzd0kr+aU8UCzlw+ZQSC5kV4
	BIU8MFvb6qfA/AisDddA/+O7jmHZWMYhwi/96eVYW0ECGoomrCT0zB4Tb6ySjpkmEFohOwCqLePBo
	GWArKze79i+4VfhvgPFFHCn7mvSUdG5ICXJanb14KENjiIKfbjuu4AhbnfWPMVgUjtYWrqSTMPeAi
	Xyijws3XbH9znnOncBFfERbt4pYkYsnQ03gKIhJzs4+J8tu5JNlO11PykTIWZOU71U/XgYOls0W9M
	BwSaHPJ5eQgbaQSe934b+8gA+0nLdW50m8txq6C+1z9iJ6nJZKIqOd8K/xEc1FIHS+7cCqW+CMYae
	T5z0qA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMtt-0000000D4eE-0x9r;
	Fri, 06 Nov 2026 16:34:49 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMto-0000000D4Vf-3UZc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:34:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdilWBaPtfwEsmuJYdUy9sxkvDj74rfnEScnGk0NN3Cik0f4h1WtxXUlUkbGUYUY+9bj2TzgX1aEBdLrn+iHEAWmOpQtMVvGl5pA/O5rpXoJg0UyQr5qXC8aBcEsldY0x2iaCflqNLMaVH4tZQplfA+Vvgt3rCegEH2ZjraUcFlIOs5ldgG7nvMneRZlyU7tCRJq5agWoDPR3Kcm9FmHmu69cMTyQmoquJIZfqsyBOUsHtqpKQyRb3XvNH6EVL//PEVfgGH+dp5oDlMhYfKRKH+XBCMFWbY4x4DIk+LuhJNqv7xABAiFUUvx4BFhkspJ8th+6lflYwljeRizcdDT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPV4T6OdWuxAsZtn2up/ABfSyARsD7uC8DyRFXT/bS8=;
 b=fF/daFzC2+PCq2DIYf+G/XhKbECSFdgOdcE4Y7GxcX4sc63B5oI3YsRkWadS5ffbnwcpn4ZVDrtFAd91HcwSBY1gAw8z8DyLC848I3BTgQ/KTj7mG1ABlYX2zyDRdKAYzTxLyBkoDk4BRKfOqJ2BkoKhJ4n0quRtq6QIKU6uVxJ3flGLxFMueSmpRehXmGWXmytTOxYrtxD8Y1akNh64hUgeSkmJLfG2n4jTt+66EvjDRJU/Z2EYGoYp+JoW92faXRN7hY3ua3lWvgdyvCcMifeWqHc7WvivBldvicJwpTsKquEP6miYRD7UZJP2ZCVNOX/6TXz6/EWZN89GNgKQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPV4T6OdWuxAsZtn2up/ABfSyARsD7uC8DyRFXT/bS8=;
 b=bXBzLFNUoobMX6fEm8zDLnsyiG8TanZgoYxcRniA/8W+NeVuM+MjImEAUJE7GkOJBkfLlyN0ZDMBediwzcbp0mB9U18ykdfvh81iU/zh3z369YauhTC47+6DfzXP1Hd1VYym3WfYmTpOPYS5JUCHlcGjWBZD+BB+V3H+F0x0QhVaYke/Dw0DC/DbJe2YilFqGawSLgNswAZiUnLk/xyw4xkVeB3GFUX2IQYV/Z0O70OgqCb64eWnIV30uVT42EKnC/MXGo1QPKFGqh058uNNKJ9uBY8AWJwglp19yW3MaMD5A3xIsPtt84UoG1cYPFoWj9tTYdpDyfTcvYIqJ/ndbw==
Received: from PR3P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::20)
 by DB8PR10MB3815.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:160::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 16:34:38 +0000
Received: from MI3PEPF0000847D.eurprd02.prod.outlook.com
 (2603:10a6:102:54:cafe::48) by PR3P191CA0015.outlook.office365.com
 (2603:10a6:102:54::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:34:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000847D.mail.protection.outlook.com (10.167.240.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:34:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:35:23 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:34:37 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-watchdog@vger.kernel.org>, =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>, Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [PATCH v3 06/13] ARM: dts: stm32: enable iwdg1 on stm32mp15x ST boards
Date: Fri, 6 Nov 2026 17:34:22 +0100
Message-ID: <20261106163429.618392-7-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106163429.618392-1-antonio.borneo@foss.st.com>
References: <20261106163429.618392-1-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000847D:EE_|DB8PR10MB3815:EE_
X-MS-Office365-Filtering-Correlation-Id: df3fd53f-74c3-4646-f5db-08df3c23d974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|921020|261021123027099003|11063799006|261009223027099003|261021121427099003|56012099006|261022075727099003|261102123227099003|261026121527099003|22082099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: IklQgsP8+gJizZoyYwR4J2XWOC5G0yOI+t17zkb0qAFs9eG/7CZy/GGMxQRJH2Y/eOijwWPilId2UyGnyagaVh0T4A2YHwzzEf5VSrFn6qgOI8zvp8YsWqwoCIbsLuKtIGVIkUBOnXaMHQjLSDBLoLNX/8RQj5GCz9IB0CLbg+Drnx8ODtaJI/mlt7owSWwtJADFKkA5ZZf7YgOouE6RtsPg/7Vk5cxsvVXbzJq2EE8saJUaPAfPVQFS6eh5Goi7J9QNL5/fkAV2w57nklFxQE67h1reFGYuYsl415w/uHtFtpRLauLUhHr+xq6Y4eYNOXmpfld0n2AkZOf2dXJZrvmoBud6stf1C1w1+I6X4cLntcTyE0HTiO5LYut9oiZqDBsygg4/KMj2Yb6m8AkUdThGve8TuCrr+qkx26jlERjEthOLfyxX/ygMY/kPpqyDsd2Pf/6mKv4tqgkNot2GtHzwWoAUcW7LQrnrVkOfa8fFLyEL3z2LhHpF2y1NQi282mD4t5pbVWV6+EqNCCmnXvhR08YI/H913ar73EKUrDH/iGJBsQMyGauOmrRkdoAKFlILrfBZI1BQZQ59Lc0D3U7wNOM9kiFbJFUU3sa2oTZSwlNQwc4GzYAS4LoJJGveDWeELv8rESifHYd4Ywryv2DKk2/KBejTW7gUJi2LuPhJ3pArpgnoC6xbQgyUm9o0hYJVhfYRzsulJgvI0rBVAMRiMy3Gb+P95aaU3201Tgxm1KHMQnhqRw/BBp3MeLZF
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(921020)(261021123027099003)(11063799006)(261009223027099003)(261021121427099003)(56012099006)(261022075727099003)(261102123227099003)(261026121527099003)(22082099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uNDKOrxz0nNJV0StWfpE4p2ENVdSsvQkdICpqbch2652lfrHq8brO3bhnLHSls9pBk5AwHTdQ4eHoogQOg1pYrZzqXeVM9sU5O2ks4j/E39SCCEgnRTZJBghiSyJBVPidR4H5S3vgmSVJAvYtU2vl8QqQbmviIxf1bqx7eFTN7zURrIPcCjJhcKjiG+ppfqH9mPNjPlpHD+LFuRh8nphm8S5ahO7oKJ3P5Na/YhfuaeTbOA8vHyvHDcdxzHOaxZzSZaunrRPMhMNXLczjpw2uf39SglHwu5/ATU4lefuGthyPyC+bJXM/HrUsLvpyWH5e8jftiHs3qq66eO7BpQ3L94ATKeAz1uEQoSnhmPRYWCSFsmvuNr47+/OmpT4ovLgVo6pJUYo8F/ntpwPI9l0WKXtAUbZ+HdCtHBHrHrNSF4reM4pm/bmMmuRuKOkPRXq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:34:37.9427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df3fd53f-74c3-4646-f5db-08df3c23d974
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000847D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_083444_905389_2974A576 
X-CRM114-Status: GOOD (  10.49  )
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

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

On STM32MP15x ST boards where IWDG1 is exposed as a non-secure
watchdog, Linux must register and periodically ping it if it was
started by an earlier boot stage.

Enable the IWDG1 node on ST non-SCMI boards that use this
non-secure watchdog configuration.

With two watchdogs now enabled on ST STM32MP2xx boards, assign the
watchdog0 alias to the IWDG1 watchdog that may have been started
by an earlier boot stage. This allows userspace to identify and
ping the appropriate watchdog.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi  | 4 ++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts  | 6 ++++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
index 98552fe45d4e0..cc9521b105262 100644
--- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
@@ -64,6 +64,10 @@ scmi_usb33: regulator@2 {
 	};
 };
 
+&iwdg1 {
+	status = "disabled";
+};
+
 &reg11 {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 49dd555cc228c..6c7dfbee29528 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -19,6 +19,7 @@ / {
 
 	aliases {
 		serial0 = &uart4;
+		watchdog0 = &iwdg1;
 	};
 
 	chosen {
@@ -331,6 +332,11 @@ &ipcc {
 	status = "okay";
 };
 
+&iwdg1 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &iwdg2 {
 	timeout-sec = <32>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 1a07ae09afb2a..9722e2ab07794 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -13,6 +13,7 @@ aliases {
 		serial0 = &uart4;
 		serial1 = &usart3;
 		serial2 = &uart7;
+		watchdog0 = &iwdg1;
 	};
 
 	memory@c0000000 {
@@ -511,6 +512,11 @@ &ipcc {
 	status = "okay";
 };
 
+&iwdg1 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &iwdg2 {
 	timeout-sec = <32>;
 	status = "okay";
-- 
2.34.1


