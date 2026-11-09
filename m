Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C2A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qc6KvKdH;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=lhlIhGdk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wTizsQHmQ+rXI1GiMeTkhVnCjMdbW9vj/hK9gwEqu3U=; b=qc6KvKdH10cnff
	x28IQeTjHBfsnpUysvp30WwSpvu/ppmkZhw3R3mhqECP+lIvb31lDOwYdgTxRn1rx3S4QWmt15iGC
	BwMkr9vqIB/98ZwAbh48hlzqw0orr0gyZCXGQsiWTxkifdCnvWxE2jJy4CJK5BL0zdTnhis+8wL24
	NZwEB8/DWVp++j7JjuLCXbc7o2YjaGc4dH8qGhybwF8NnWktcajfi6EGenguPS8pM2Zdkb0CPka3e
	+exm5cdpG2SjL5m5+js9svDVjxL5dzW1AK9XR1NMkOssmTkeE/K2tz2oJ+LXjvKGzeDhZyDcID8FU
	4H7XIlEQ0BlZVYGcq5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSC8-00000001Buw-3MlJ;
	Mon, 09 Nov 2026 16:26:08 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSBw-00000001BpA-2owB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:26:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LM4hPy23B2+bWUCCBGgqXsfg/lwt5fm9Rh6Y3Q/NERGUqTDJZDZ3x6T6v8Tx308FL/qsqNV4mJGvQXGOVCkf8j2M3tYHE/BS7lfKUpBn/UIEbq1JtmocKgFWT525/9D8iyKpk+w0vZoY7SqxrDgho9mrWdX52wc4xCTHboG9Gq3z3lS0eYkvtLdcLE3U5n7EYkqGO339AhL9U/8vXoqVUTbNH1U1Ckm1RWAqlekXkbrWsdK+q68nuOlj8je6P05FBImLnMuPFvNcN2z17kdC2cHeZU7fO1eJ+srvICTRdrcH3VLBSM/iD/zFOr5gmsxoX3NYaZacEm6DolqR+5ShZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTizsQHmQ+rXI1GiMeTkhVnCjMdbW9vj/hK9gwEqu3U=;
 b=dk/ep0jOBJhtL0SYqwPQkgcpJAXIdlMOoqMgd7FopmzjPXEz/PP3vceJYTbupZXqXhkeKXhJlcaqs93dlWbTaYHThpcLOS5uFO8n4XleRDGa0v+8OC3jnQVGrka9KJeY++d7syyqLhFS65hWQVre6zxVFcrwNzIP0TP/6dwTJth+p5dD+9sauYAMb7Ti7xFjCJ2iemy4ZpmFtowUKENkGzopz5JmKSqEpwFkptUqIoPGFCiZdGcGGRRTussjXv86X/4cObXJBGyT065LglkW9NkHb+VxfN1mfCV8SHkP7SnBWsjgCaJNA0QVUylNLTZAtz3c6TKXvxiLStetaLExYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTizsQHmQ+rXI1GiMeTkhVnCjMdbW9vj/hK9gwEqu3U=;
 b=lhlIhGdki5+nFoaEMqWEa55hrZSajsKC5bHNL56ZUFYToqIAabgWLPz/oSgLvPKb6lIsDKJbmK79I5db4a4bDJkfUCDfciBmNg/2WdT5W08jNrYgoc0PVpm13qUuqWlb5U3OA4UA6Hkf+iYXbXM35RBYsvn7Ulxh5BIAx8h9J4wwTTi8U5MNaSB92gBOBQD53PGXtvUZRNZpkKhzLFVOdvG+U5YoOqN/1UXiHA431Tl/JBmpk9kbFT7fwBMG+lryoOWTB7/j+IdUpEn0RVxrqYytSQYt1WZu43oFwNC0IjNBx1cFntuPlVzCmOg3xPiVrhuyFigWpuPa7Y5n6y131A==
Received: from PA7P264CA0224.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:374::10)
 by DB9PR10MB6617.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Mon, 9 Nov 2026
 16:25:50 +0000
Received: from MI3PEPF00008557.eurprd05.prod.outlook.com
 (2603:10a6:102:374:cafe::e) by PA7P264CA0224.outlook.office365.com
 (2603:10a6:102:374::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 16:25:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008557.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 16:25:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 9 Nov
 2026 17:26:46 +0100
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 9 Nov
 2026 17:25:49 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Mon, 9 Nov 2026 17:25:06 +0100
Subject: [PATCH 4/4] arm64: dts: stm32: Use hex timer addresses on
 stm32mp251
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261109-timer-use-hex-unit-addr-v1-4-b4abfa457adb@foss.st.com>
References: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
In-Reply-To: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut
	<marex@nabladev.com>, =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?=
	<goran.radni@gmail.com>, =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?=
	<boerge.struempfel@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008557:EE_|DB9PR10MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: be07872b-883b-498e-00b9-08df3e7e1e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|36860700016|82310400026|11063799006|261021121427099003|261021123027099003|56012099006|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: B2il/IjK/LieWI2rgA5903gAV9xK3chVOlF7EQdmPnOFEgC71yViRILFSMRJHWf+hrI2rtS+61ljL15jl5Cab/RwhU0U/fqwZCEJTDI9AWoxgQlnteeCGBg4Xcw3L5iuXs/mK/Ertru28wKhCv3LoTS467a6qYZ5FlAziVkYuxHtt/kAQDKmPSbrK8w9PsEtFWH0bj3h5fwHavTqn+SOp7e3qpY1ZPl2gryxSMyKHedL9cUnjs2qrM1NibwjTbJXOD5A6WeIaSiZmfllgKr9MMH9b6dobVfJhfOo9txgQMhDVDq0vahQRrzcCFXX18/1HJHT9sE/X1ff8CFQSQm6zCaX7IPAMpgkUaYSDf+xGDWGz1UJ07tF/ijKckVhfqcqoqvRPTmfO10CeFCH5Up7ajXTnQoX0VYQr8xaW/fywwl1qf1erAEhC+w1+Hq0Txfkwo7cA5LBv7WI7rnfjCyZ9cwCY9kkVhkx4nn0zzicYUWCX+ns1EGYCHt+GX90jsXH6jvTfZiMrR3IM8LbxIeqB2lTgmmzkcnFy69zmuZIX6tPgxJRnl7q1vEzHXKgNORAEKI4w/YyfqubOOcNp0Fn8GIVYHBs7B6l6PrntkQjCQ2i180tj3CySKEzTNhCqMPLSCStM5jn/Afr6fXsOa+9uGmBDZcFg3hCARtX9lSHixo=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(261021121427099003)(261021123027099003)(56012099006)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eEDh9aF48ukDj+fptfwPgTK1/ybGfdm/mqUmfYzhahm7ykYAfNfNs/KBR8uWaib2locvc1n8q0NpWV5kc0bjhDc/3DhWrgGttJ1GQc4hDUf83ZOmCHxxELfZwW6sd7fNOEeCFaJBVIr1O3B+lBB6RoaIAzE2X5SH4LOKav4ddsK42/oYA65ySce9sZVqGy5t1V8gy1rKU0ZGG/T2g2/80N4ouaUK4/FplFXxus+mGycMSCZf9+wqySsJ9nvNJuO60hzo4Az2GiinOZ10YNEiFWPOb/4ne9y5eNJYW65RSIYaV9gCNNFYybaSuZ2oPSD3vMKirt6ENoiyWZ3sEIgzZJe6Yzh12SvacXO0QZcW2W30Lc4jqU91M+UHMonlHdUNI49TAR8PUgm6usnICr4EE+6rq8ZnSIK0bbVxOvqOm7rPvdw0qi3CgJMT+hLM/C8v
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 16:25:50.1243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be07872b-883b-498e-00b9-08df3e7e1e19
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008557.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_082558_460380_DCBD819B 
X-CRM114-Status: GOOD (  10.43  )
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

Use hexadecimal unit addresses for timer subnodes. This has been raised
since ("dt-bindings: Use hex unit address patterns").
Also:
- adopt hexadecimal format for reg properties.
- update stm32mp257f-ev1 board accordingly as it uses timer 12.

Link: https://patch.msgid.link/linux-devicetree/20261102135330.2493332-1-robh@kernel.org/
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi     | 60 +++++++++++++++---------------
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts |  2 +-
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dac3d2d23ff0..343160bae0b5 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -332,7 +332,7 @@ pwm {
 
 				timer@1 {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <1>;
+					reg = <0x1>;
 					status = "disabled";
 				};
 			};
@@ -363,7 +363,7 @@ pwm {
 
 				timer@2 {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <2>;
+					reg = <0x2>;
 					status = "disabled";
 				};
 			};
@@ -394,7 +394,7 @@ pwm {
 
 				timer@3 {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <3>;
+					reg = <0x3>;
 					status = "disabled";
 				};
 			};
@@ -425,7 +425,7 @@ pwm {
 
 				timer@4 {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <4>;
+					reg = <0x4>;
 					status = "disabled";
 				};
 			};
@@ -450,7 +450,7 @@ counter {
 
 				timer@5 {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <5>;
+					reg = <0x5>;
 					status = "disabled";
 				};
 			};
@@ -475,7 +475,7 @@ counter {
 
 				timer@6 {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <6>;
+					reg = <0x6>;
 					status = "disabled";
 				};
 			};
@@ -504,9 +504,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@11 {
+				timer@b {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <11>;
+					reg = <0xb>;
 					status = "disabled";
 				};
 			};
@@ -535,9 +535,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@12 {
+				timer@c {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <12>;
+					reg = <0xc>;
 					status = "disabled";
 				};
 			};
@@ -566,9 +566,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@13 {
+				timer@d {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <13>;
+					reg = <0xd>;
 					status = "disabled";
 				};
 			};
@@ -604,7 +604,7 @@ timer {
 
 				trigger@0 {
 					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
-					reg = <0>;
+					reg = <0x0>;
 					status = "disabled";
 				};
 			};
@@ -640,7 +640,7 @@ timer {
 
 				trigger@1 {
 					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
-					reg = <1>;
+					reg = <0x1>;
 					status = "disabled";
 				};
 			};
@@ -928,7 +928,7 @@ pwm {
 
 				timer@9 {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <9>;
+					reg = <0x9>;
 					status = "disabled";
 				};
 			};
@@ -957,9 +957,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@10 {
+				timer@a {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <10>;
+					reg = <0xa>;
 					status = "disabled";
 				};
 			};
@@ -993,7 +993,7 @@ pwm {
 
 				timer@0 {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <0>;
+					reg = <0x0>;
 					status = "disabled";
 				};
 			};
@@ -1027,7 +1027,7 @@ pwm {
 
 				timer@7 {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <7>;
+					reg = <0x7>;
 					status = "disabled";
 				};
 			};
@@ -1115,9 +1115,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@14 {
+				timer@e {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <14>;
+					reg = <0xe>;
 					status = "disabled";
 				};
 			};
@@ -1146,9 +1146,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@15 {
+				timer@f {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <15>;
+					reg = <0xf>;
 					status = "disabled";
 				};
 			};
@@ -1177,9 +1177,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@16 {
+				timer@10 {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <16>;
+					reg = <0x10>;
 					status = "disabled";
 				};
 			};
@@ -1341,9 +1341,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@19 {
+				timer@13 {
 					compatible = "st,stm32mp25-timer-trigger";
-					reg = <19>;
+					reg = <0x13>;
 					status = "disabled";
 				};
 			};
@@ -1539,7 +1539,7 @@ timer {
 
 				trigger@2 {
 					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
-					reg = <2>;
+					reg = <0x2>;
 					status = "disabled";
 				};
 			};
@@ -1574,7 +1574,7 @@ timer {
 
 				trigger@3 {
 					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
-					reg = <3>;
+					reg = <0x3>;
 					status = "disabled";
 				};
 			};
@@ -1609,7 +1609,7 @@ timer {
 
 				trigger@4 {
 					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
-					reg = <4>;
+					reg = <0x4>;
 					status = "disabled";
 				};
 			};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 782b4bb843ee..7f4f39a423ae 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -498,7 +498,7 @@ pwm {
 		pinctrl-names = "default", "sleep";
 		status = "okay";
 	};
-	timer@11 {
+	timer@b {
 		status = "okay";
 	};
 };

-- 
2.43.0


