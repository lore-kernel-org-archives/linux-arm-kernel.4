Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF10E606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M4N/YLAK;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=jc2zj8hd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Te2tqa2UGx5NP0LT4yvQMRyrSCQPCV1I5I7fyIoBAU0=; b=M4N/YLAKBGFWvJ
	mmEkH5ajy812ZHIpwKk3xo0uvrjXKgvVLO3//K+fiO9Ih9Lt8T3hcc/Cs/53NhtawZIkbyhw0naI7
	gh1xraf/mDHx5WlKJxAWVZ+5BGEGrXgN7tnrIXVn29Rh4Ma0UXujegu0jwsIlp1hxy5iCOJHjQFvj
	DgbUlVhfpWtQ4vsX5SajQEIkJyPZ2D1DZvV3GRrz0gZrd5rAFkzVBwhSqaqLZG3+ithOSUh1U6CGc
	E3LBcc77Ch82MD+vvpDv5kTwRQ8Sz8DIfusN4eKzRJGtbpNa8LOwiAx+NAuGg3enVEaIgok91l6AL
	kALObfChjFM26vRRPeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeKh-00000008mWw-0EVt;
	Wed, 18 Nov 2026 12:00:11 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeKB-00000008mG2-349V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:59:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMG/ao/26puVR5KwnabtVIrPkDRuFoiVQa+UXFdxCrHaXDTMPRpKSLeJ1efHkz7OAqUF4IuIfyrKHJuSu6JxA73hyIBqZ4Uy2cBayJ597K4u6Vtlldv9VU3mdjzc7VfXaW2IXU8fP+TxifzNBIMYemRXGc1AUmFkb/znTeEXxNBOHb4ecxbtAXnhOgCBpiL3WyIaHbra80QU7pbTx6Jj1hhtd0RRciPbNJPuQc7xQgXt9Qet89z/70P8fR2IA5f/nTdM9RvgZhXHqTIV8brX1zmtElvMlpeESY2IDwonvdaamB25+roS+xRqSEA8b3POOD3BB8lVgonRFnFk+60vhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Te2tqa2UGx5NP0LT4yvQMRyrSCQPCV1I5I7fyIoBAU0=;
 b=GA7l6hbTHv/aEcj8UlXLjd1n2yj3wUlWA6f1r2o6YBDV0sTJH83Ucm8NnbyKcmBCmyir6Sq395iJxXJ4IhZEPsIDGDo1K6xN6bytapfb6G4Uzzw2eTKYKG5H9iiLCv39tivhquq33XDBIeUsx+HqTf+Fe1kATzHmXe+t4V+Jo4aFLjOqxbrc64OPa2GHDNC3GT9TbmZDSN3u61004Agbn7PUajld8e6jdbKR6Jp9hoG0IyCP4JV2ezCTM0xfyu4Qd7U2Au262xUubvc0XtBFilOjo9F9CVj6xggJ0K7k/cKzv1jiJErFVxBg+RUZ/toWQZqMZ2GzpT0BwHAhtJlBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Te2tqa2UGx5NP0LT4yvQMRyrSCQPCV1I5I7fyIoBAU0=;
 b=jc2zj8hdWvOLmQ6BEvH4ZLe5Ha8z95gaKDnuvcQS1EKFKccWi2wLaerhO/Bz7nN49bbc84Pcr2amaiCgZqCXkbuzkyTEJ4DmI7BBoqHc906krwrvabYgxKTPyVYi+nWZFsr3QnrRIRWf8cBpg3w2Gz7iDxAg8XH+LKZ/O2OlIWjj3VqMhuyO0MaYZz9xiy5pImB4j7hAUaV118RnzExdgaHhBi7IHmwx7u5unNb7fEC5YDiNc6J/T5CwFtjLwTLGBEYx7xFiOXnm9KpzvE6YIIOJ9OnsiMR8FhbJlbN2RXwC11bkiKHiIA1hcvGGQ5y00QR5r4iVravWwBVDaSvKqg==
Received: from MA3P292CA0060.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:49::19)
 by PAVPR10MB7308.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 11:59:31 +0000
Received: from MAD0EPF000008B6.eurprd04.prod.outlook.com
 (2603:10a6:250:49:cafe::2e) by MA3P292CA0060.outlook.office365.com
 (2603:10a6:250:49::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 11:59:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008B6.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 11:59:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:00:25 +0100
Received: from localhost (10.252.6.76) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 12:59:24 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 18 Nov 2026 12:59:10 +0100
Subject: [PATCH v3 5/6] arm64: dts: st: add LTDC pixel clock mux inputs on
 stm32mp23
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261118-ups_mp25_clk_syscfg-v3-5-935de791a4ce@foss.st.com>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, <patrick.delaunay@foss.st.com>,
	<yannick.fertre@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795003158; l=1426;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=tL+ZahkUamPkYRVwlsRuYKNAH4UOKfC+bI3kNfkpOTE=;
 b=Tg58s9Ia2zSrWKoSc0Lp8gnzKg5g9xnn1u3ihxIYF6gHKwzehydPnLtYd2SGPKxoQDQj9Yv1X
 GtxWK8HWhG6DS9f/UVFBTR9iGuYNChfEQmGtfmpQqWP3d3KsA0qxzIO
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B6:EE_|PAVPR10MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: b79ea3b9-b35f-4810-8108-08df456b67c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|82310400026|1800799024|921020|10067099003|11063799006|56012099006|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1OIQRJ89fY/Cv2EMt3DZ3lVNDBm4FZCLNuHX0O9anKiBba8UQG3ELmpdhFh0qa7yGuhz1f7hJfZlCGVK5/ApDJGWSidi6vz2G0SxVOYt2kLrdJRjl5k+kQ9/730JM7u+vc3RRQlva6d42ix0+FnXHOeUm7qVA68UEfPmEWYlufoO/eJV19wG1kLR3rLvxw5SRVILjek4CMASJrXhKz7yxYrlT0V3cpCofm4oG0EZbv2KeGe7etoI1sPMZgWkkHcwgDY6PkwhADGbSRcQwCxkIjKkwpA3cBVpmzw2+V1kPK/uZSiTKOKxGpA2S8AMEOeHOnb5tYUc/wDwQcnA85l2cuTNdL3fikqYqLWPSO10c177DLbdoPQlj1zNBxQ5gRb//YVSLOxQMQ1A2HgRkhiITtrG8HTc9ST3QRSV1YubHKtxtkhTfGll1s8CC5MLt7u+peOBBVTFyfz8qNJ2r3nJeLW6vY9AIhS+RSaqn3Usu5ilCJ4pgIutrDT+EAmk7BLogYI2fsl7RmG53bk1nMePyyFdqQ5x0WZD+wPTuRJDjEeuNMvIPMJz++Urwwj5pSA5IGprF0sD3WvrZpgt12ZaLyrwDDRtVWeIeHdT81dBwvoQffAZbm8EWqJCPmub5txJlklfoy5fkt2NXa+aQJfS0kM5lAbLFDakbEbCyNa/xzx052KI+Gkzn+qYs4p+h+qPUzzqf3LVoqObHbfHCPu9llEhT9a6E4pPn+4EikuQq5X0RYVNGBCZEEjt1L99rGZp
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(82310400026)(1800799024)(921020)(10067099003)(11063799006)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JEGhSBc77FFD0jcF8h1L3KAKAZYv0VnY8uZ2tlg2uhfho4HESo6qGPhwQXT9Cu1UrrRDPM8xy9UWX/Hb2hCLKHbUEhw40yJSZtC0yO5IcStel0AEa3nKKPLJRICOSH5lx0IIYDUTp93IMSo6mKg/9Fw4d6QXf8stT8yR5oQ7B6qeBS8mUS0su1sdG455jOe8bxgDMP6wfn/Q5W7TzK7416bS29C6Pix90jMfQWzFpn7i39KaOvqp7/xPPcos5qoVeK8dw+ZZ6dY7vDs/ltgzcJ9bg6KqWx3RwQKQ+69VuS67CYJqGRqvkcf4+WKojdG0pjk9AyVGPtK+sxbCmQYTMuN1yFx1KxreOSuy/x/woYlKSs29g5o+bp7rKsSNSWRk/9Yw2RMwQEDV7jPVQ0/GC5+MPjIr782++wFy3W0w/Pxa/p7QjthP75jFGSwz5Cfe
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:59:31.3605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b79ea3b9-b35f-4810-8108-08df456b67c5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_035939_781093_B7557C80 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Describe the inputs of the LTDC pixel clock mux in the SYSCFG node,
which is the provider of the LTDC "ref" clock.

Only the LTDC kernel clock is available on STM32MP231; the LVDS and DSI
clocks are added on STM32MP235.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 ++
 arch/arm64/boot/dts/st/stm32mp235.dtsi | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..128b14ecd353 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -1121,6 +1121,8 @@ exti1: interrupt-controller@44220000 {
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp23-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
+			clocks = <&rcc CK_KER_LTDC>;
+			clock-names = "ltdc";
 			#clock-cells = <0>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/st/stm32mp235.dtsi b/arch/arm64/boot/dts/st/stm32mp235.dtsi
index 7a87c344a4fe..d974f979330a 100644
--- a/arch/arm64/boot/dts/st/stm32mp235.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp235.dtsi
@@ -32,3 +32,8 @@ vdec: vdec@480d0000 {
 		access-controllers = <&rifsc 89>;
 	};
 };
+
+&syscfg {
+	clocks = <&rcc CK_KER_LTDC>, <&lvds>, <&clk_dsi_txbyte>;
+	clock-names = "ltdc", "lvds", "dsi";
+};

-- 
2.43.0


