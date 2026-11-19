Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE57606B312
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ocO2Jf4q;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1t1S9fNU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WXIQw9qwsPCENrvFRFHLFJG32Kf+BMQHROaPEklqr/c=; b=ocO2Jf4qwOwKkbd6eqmH2HEaMQ
	e5wTsq+FJ4yTdeGh79eXin0r8FVEccVBFmB2lGulF30hpAg4u1N07OSKSeHzsYkW7idHqK4zqUFr4
	pYsH9Jzkn4DZIXNcIulrU8HMB5V9zLkf6PNU8WPlqcLlMjFxbvvDVh6o36IuX0ud/vPWWh4YgSMB0
	yAJj+vCvNfa8sWGvBOtMGQri/K/HoH6EbnvBgR+gXuYcmMHq4Ag2jlBkdJHjpMF6mrjwB6Ou97PCo
	Dq3MiIv8JR+d5YaLR0EQd+DoiHtxYc4ZEeBFAsEK/WX7Bd8B1rfIOtFpt/NahZaAnxpTyOZ+2r8EB
	EUtvnDHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Ga-0000000CVtL-36zx;
	Thu, 19 Nov 2026 15:41:40 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4GW-0000000CVr0-2Pzq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:41:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1kpRYsEUZ7ch4D/8McwLjHZkv5irEVlAJmkkzprO3bdSgYBqHk2IWjfxfU5F1MgIXvsgWtg3nPrkpXpNuqUkgbHOX/Br3CongB4Ryo8REAythLcXn6GCc8ccqcUXUCwMFr91xydGGSVC0AsAMFqWZY6PS/5HAIGdUF7iwWqewheI+wq8lpL8Ivn/vSHuQjX7ApYemlP54P9dJt9K8xrw2Uw+3LcPbGV5gIjTcpmPtKffBwBOKgbo6PeiWVEpJUlZjqeUgUcIHr2+ilOFTcy3G6gc7trVSuTcSoX02vW4rjUsmjicL2fDFSMjwWw6+JlrHt39QHzwjrKHiexXy0EPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXIQw9qwsPCENrvFRFHLFJG32Kf+BMQHROaPEklqr/c=;
 b=TqPRrNzaMneh8ZONKYZqGSPWoICv8R5vstBVnGKrGAw8WEI/gnbYarT/QbO/iP5grV8ScBw0D9qXv2ZGPUXIuiI3V0/OwR7hRD4Bf3hdar4zStsupRk0y+Oqz456uOnMJD79yGr9pjilmsoEEmBc2ayGjw4DiLHJirVUhz5Rks18844iAJ7T8XgxWkTPkp5ABtA4sN6yxq4VvCVNZ/PhbVZ73tZ/N5Uw03wq2PpqUJ591Ll/CsuRMGMVv4ZNFxkfKwlav81OjNglOHo+cOyrDpMbju5vEElUdyJwyuYQt1H5cMweuOPHp/HkeA4WPZm8x6fvi0goFMoEPW27WQ+NBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXIQw9qwsPCENrvFRFHLFJG32Kf+BMQHROaPEklqr/c=;
 b=1t1S9fNU8nlX9xLur83hg6fRXd+MBZCWvVWctCkrE2+ffLU3jumNHACqdgr6c77/O3JE6qf7mOktPEgD/CVnWM9VtkdMQaKdc1WsMpw9mD1tAVSWrp+a/XtlPGv9Q888zAhsTrglaKnMfbGzVUEmdGka/5c3KHfChPOqGHDKy1E=
Received: from SJ0PR03CA0028.namprd03.prod.outlook.com (2603:10b6:a03:33a::33)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 15:41:29 +0000
Received: from BN2PEPF0000A892.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::64) by SJ0PR03CA0028.outlook.office365.com
 (2603:10b6:a03:33a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 15:41:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A892.mail.protection.outlook.com (10.167.248.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 15:41:29 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 09:41:09 -0600
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 09:41:08 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/3] arm64: zynqmp: dts: Wire gpio-delay driver for USB hub reset
Date: Thu, 19 Nov 2026 16:40:43 +0100
Message-ID: <0a89dca2f18a465b3535f3c01e454d4fbaacadc5.1795102838.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795102838.git.michal.simek@amd.com>
References: <cover.1795102838.git.michal.simek@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8716; i=michal.simek@amd.com; h=from:subject:message-id; bh=IO7c5/XEPi7FoXMSKwGdPC6iI2+Jy9QqXRIs+LhLrGg=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9l2hdKcGpepLtwhXzXIVlCZ4lzk8tYyY537i9Q1bnU fd/02vHO0pZGMQ4GGTFFFmmM+k4rPl2banY8sh8mDmsTCBDGLg4BWAibSsZ/nAccVj0hTO1IvfV moL+q1v55Uxqlz/WL7x1bXGwf/YE2QRGhtsxFg80px/5ukx/sV3rPGE1yZX7+LfLrnr/fdnOFp0 DbxgA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A892:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 110f0377-5b9a-4042-5f56-08df46539416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|260925021911599003|260925022911599003|260925021311599003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|56012099006|261022105027099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: r7XCpchRbt9dUyPvEbABN0Y+mBAulUb7BZ770kyq/mWTSwVJYEHaLL+IffVz4oj15uajti+VwicVRfuiuH5hevW65+2W+nndn+ryFRnajhZxoYKKiOnVwmXh8vlTIPWd64AO6b0grQi04fOvZ5FZYkw+O2bfLQYqZcpi9T/vI6Dh/kIhRgNZll0tLHt9xl12mI+zMx1zuK3nPBfR/OpryBfnUB7Or/fEHdy9okGSWBaqZnHttLB6AIIN4le6aApqwWpMSF9LslwJT30MutQXfCUXIEpB1zjqZ2KudFpjBa95aPdTMtLUaFmBpUrbUMC1E+8W/iItpY08PHM8wOuIQJXp38Xvo6Uawlw9mlCDiWkWBqvhlPvIcP0CPY1vhggcHzMGztIWjK7s0JOVd3JTcdaXcROxF5ZLfRRz9wxtGB1/SmJz0A6xmBtN4VqwI0nebQAvtDJy30BPmJOoPjfV/NKJEyKQiELZQaZSTJ4FAf1GDPa9P+6C6F91UBVeawfHWHYpWwojnOxa3wwMqFH5MxoaPc6padQY74xPIFZC74Tp+OGi39DJG1bALa7obQwSoPxad0wAjBwnPxPSPsqTX2ypR68Rzd5kESgveLVViuQ9iRLzT4igG7LecFCnH9alZ0S6jAtP1GDQZkp6jaAROA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(56012099006)(261022105027099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lgEyAV+ltWE1HRLxY6J3z60jwTXN3VaNErjDlzrBjmDl5IPYBefsX7d6yEhaJJXMRlHPjLZE+r5i4gkEJWbMS/E3AMeE6HYi/vBEdF51D5Gao4DNTYrHNL142itsjSjDdpVlhE/AXoylXr42IN8moajNsVtXUJq7pFyIzHvEaVGWhviNh6iHwCnBqu9S88LCbb5CoGRWM2JYRoDT0pUAbBBf8epz1MWqMg3x8daQagEZheMGyodvxru/REtaxX22yKz1swH8mmx11llcBPGMHC0b1e874iz9CczQlP3ezGABrmd9MI/S0uuV3PtV418x9iBwQVs5ORIBVnTDeIeAvZPYCuSNDy++w3DGhqaZoBHFQWxK6YCUYm318CvY08WxX9KCz9q1zIR1y/xt+m/p8nAMwc9j+H56tPMB/q3i3oWwG54CpIvx1vzRk+S0lVSq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:41:29.0174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 110f0377-5b9a-4042-5f56-08df46539416
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A892.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_074136_638157_C4B04143 
X-CRM114-Status: GOOD (  13.69  )
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

USB hub requires longer delay to get out of the reset to work properly
that's why use gpio-delay to ensure enough waiting time.

The USB 3.0 peer describes the same gpio-delay reset provider, but that
provider is required only to initialize the USB 2.0 node. Mark it with
post-init-providers so the USB 3.0 node, a child of the USB controller,
does not pull that dependency back onto the controller.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

There is dependency on:
https://patch.msgid.link/c552d657b81c55f0ac2ae78b8d8abbde5deaebdb.1795095853.git.michal.simek@amd.com
---
 .../boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso | 14 ++++++++++---
 .../boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 21 ++++++++++++++-----
 .../boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 19 +++++++++++++----
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 14 ++++++++++---
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 14 ++++++++++---
 5 files changed, 64 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
index ffc14b1f871f..d20b6ea2ad0b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
@@ -3,7 +3,7 @@
  * dts file for KD240 revA Carrier Card
  *
  * Copyright (C) 2021 - 2022, Xilinx, Inc.
- * Copyright (C) 2022 - 2023, Advanced Micro Devices, Inc.
+ * Copyright (C) 2022 - 2026, Advanced Micro Devices, Inc.
  *
  * Michal Simek <michal.simek@amd.com>
  */
@@ -43,6 +43,13 @@ clk_25_1: clock5 { /* u92/u91 - GEM3 */
 		#clock-cells = <0>;
 		clock-frequency = <25000000>;
 	};
+
+	slg_delay: enable-delay {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		gpios = <&slg7xl45106 3 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &can0 {
@@ -115,7 +122,7 @@ hub_2_0: hub@1 {
 		reg = <1>;
 		peer-hub = <&hub_3_0>;
 		i2c-bus = <&hub>;
-		reset-gpios = <&slg7xl45106 3 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 0 10000 10000>;
 	};
 
 	/* 3.0 hub on port 2 */
@@ -124,7 +131,8 @@ hub_3_0: hub@2 {
 		reg = <2>;
 		peer-hub = <&hub_2_0>;
 		i2c-bus = <&hub>;
-		reset-gpios = <&slg7xl45106 3 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 0 10000 10000>;
+		post-init-providers = <&slg_delay>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
index b82a056be2f9..b3084f44a4ca 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
@@ -2,7 +2,8 @@
 /*
  * dts file for KR260 revA Carrier Card
  *
- * (C) Copyright 2021, Xilinx, Inc.
+ * (C) Copyright 2021 - 2022, Xilinx, Inc.
+ * (C) Copyright 2022 - 2026, Advanced Micro Devices, Inc.
  *
  * Michal Simek <michal.simek@amd.com>
  */
@@ -77,6 +78,14 @@ dpcon_in: endpoint {
 			};
 		};
 	};
+
+	slg_delay: enable-delay {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		gpios = <&slg7xl45106 3 GPIO_ACTIVE_LOW>,
+			<&slg7xl45106 4 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &i2c1 { /* I2C_SCK C26/C27 - MIO from SOM */
@@ -184,7 +193,7 @@ hub_2_0: hub@1 {
 		reg = <1>;
 		peer-hub = <&hub_3_0>;
 		i2c-bus = <&hub_1>;
-		reset-gpios = <&slg7xl45106 3 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 0 10000 10000>;
 	};
 
 	/* 3.0 hub on port 2 */
@@ -193,7 +202,8 @@ hub_3_0: hub@2 {
 		reg = <2>;
 		peer-hub = <&hub_2_0>;
 		i2c-bus = <&hub_1>;
-		reset-gpios = <&slg7xl45106 3 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 0 10000 10000>;
+		post-init-providers = <&slg_delay>;
 	};
 };
 
@@ -221,7 +231,7 @@ hub1_2_0: hub@1 {
 		reg = <1>;
 		peer-hub = <&hub1_3_0>;
 		i2c-bus = <&hub_2>;
-		reset-gpios = <&slg7xl45106 4 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 1 10000 10000>;
 	};
 
 	/* 3.0 hub on port 2 */
@@ -230,7 +240,8 @@ hub1_3_0: hub@2 {
 		reg = <2>;
 		peer-hub = <&hub1_2_0>;
 		i2c-bus = <&hub_2>;
-		reset-gpios = <&slg7xl45106 4 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 1 10000 10000>;
+		post-init-providers = <&slg_delay>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
index 4dcf92a2158f..fdb6eae87eb9 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
@@ -3,6 +3,7 @@
  * dts file for KR260 revB Carrier Card (A03 revision)
  *
  * (C) Copyright 2021 - 2022, Xilinx, Inc.
+ * (C) Copyright 2022 - 2026, Advanced Micro Devices, Inc.
  *
  * Michal Simek <michal.simek@amd.com>
  */
@@ -78,6 +79,14 @@ dpcon_in: endpoint {
 			};
 		};
 	};
+
+	slg_delay: enable-delay {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		gpios = <&slg7xl45106 3 GPIO_ACTIVE_LOW>,
+			<&slg7xl45106 4 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &i2c1 { /* I2C_SCK C26/C27 - MIO from SOM */
@@ -185,7 +194,7 @@ hub_2_0: hub@1 {
 		reg = <1>;
 		peer-hub = <&hub_3_0>;
 		i2c-bus = <&hub_1>;
-		reset-gpios = <&slg7xl45106 3 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 0 10000 10000>;
 	};
 
 	/* 3.0 hub on port 2 */
@@ -194,7 +203,8 @@ hub_3_0: hub@2 {
 		reg = <2>;
 		peer-hub = <&hub_2_0>;
 		i2c-bus = <&hub_1>;
-		reset-gpios = <&slg7xl45106 3 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 0 10000 10000>;
+		post-init-providers = <&slg_delay>;
 	};
 };
 
@@ -222,7 +232,7 @@ hub1_2_0: hub@1 {
 		reg = <1>;
 		peer-hub = <&hub1_3_0>;
 		i2c-bus = <&hub_2>;
-		reset-gpios = <&slg7xl45106 4 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 1 10000 10000>;
 	};
 
 	/* 3.0 hub on port 2 */
@@ -231,7 +241,8 @@ hub1_3_0: hub@2 {
 		reg = <2>;
 		peer-hub = <&hub1_2_0>;
 		i2c-bus = <&hub_2>;
-		reset-gpios = <&slg7xl45106 4 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 1 10000 10000>;
+		post-init-providers = <&slg_delay>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
index 52954761c9f3..09ed585cf91d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
@@ -3,7 +3,7 @@
  * dts file for KV260 revA Carrier Card
  *
  * (C) Copyright 2020 - 2022, Xilinx, Inc.
- * (C) Copyright 2022 - 2023, Advanced Micro Devices, Inc.
+ * (C) Copyright 2022 - 2026, Advanced Micro Devices, Inc.
  *
  * SD level shifter:
  * "A" - A01 board un-modified (NXP)
@@ -78,6 +78,13 @@ dpcon_in: endpoint {
 			};
 		};
 	};
+
+	slg_delay: enable-delay {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &i2c1 { /* I2C_SCK C23/C24 - MIO from SOM */
@@ -159,7 +166,7 @@ hub_2_0: hub@1 {
 		compatible = "usb424,2744";
 		reg = <1>;
 		peer-hub = <&hub_3_0>;
-		reset-gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 0 10000 10000>;
 	};
 
 	/* 3.0 hub on port 2 */
@@ -167,7 +174,8 @@ hub_3_0: hub@2 {
 		compatible = "usb424,5744";
 		reg = <2>;
 		peer-hub = <&hub_2_0>;
-		reset-gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 0 10000 10000>;
+		post-init-providers = <&slg_delay>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
index e919155bac9d..50f451bcc7aa 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
@@ -3,7 +3,7 @@
  * dts file for KV260 revB Carrier Card
  *
  * (C) Copyright 2020 - 2022, Xilinx, Inc.
- * (C) Copyright 2022 - 2023, Advanced Micro Devices, Inc.
+ * (C) Copyright 2022 - 2026, Advanced Micro Devices, Inc.
  *
  * Michal Simek <michal.simek@amd.com>
  */
@@ -74,6 +74,13 @@ dpcon_in: endpoint {
 			};
 		};
 	};
+
+	slg_delay: enable-delay {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &i2c1 { /* I2C_SCK C23/C24 - MIO from SOM */
@@ -146,7 +153,7 @@ hub_2_0: hub@1 {
 		reg = <1>;
 		peer-hub = <&hub_3_0>;
 		i2c-bus = <&hub>;
-		reset-gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 0 10000 10000>;
 	};
 
 	/* 3.0 hub on port 2 */
@@ -155,7 +162,8 @@ hub_3_0: hub@2 {
 		reg = <2>;
 		peer-hub = <&hub_2_0>;
 		i2c-bus = <&hub>;
-		reset-gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&slg_delay 0 10000 10000>;
+		post-init-providers = <&slg_delay>;
 	};
 };
 
-- 
2.43.0


