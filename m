Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF914606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DBZWmZDT;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ATu9pVSH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RQ7PD0wiv0VHC6N2fQDz/R9Q3BvCGmwRHV2aZkr1bBQ=; b=DBZWmZDTqPN2rkSYzcqCHGn/0R
	tWhDYnVhmNHQGmBB5/tnOkv4E0VyLet1jED/RY5cx4D2vqyaLbD7rmDQWSUJghgFliYdKbGdJwvUC
	PPM3gr6ftGBPA65BXNCt+v7obV6CsQREeduhYCn/uQGL6BSgQeEZRuBC1a03r2rlfjPh3wkCwbHf6
	D0DbSXkjuy4FUSn71eu6ERYGiGAa+OU7drAzd0GliTkRUSOWpqY77Nf2SeYuPuFUMXv/w71/g0IR4
	JMulguQHN3q2P5pHM9QNBlglxyt0ekoDiRPSDZK6Ru+unBeEk7ulE0VczsgySd+UbbVAFNQ3+2z0U
	mOGLvEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU306-0000000CCor-26Ub;
	Thu, 19 Nov 2026 14:20:34 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU301-0000000CCmV-1H0H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:20:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fW/9LLikWEtlzjLDndRHtBS7HbR41P9f5ka8XKjBAtt6Jhjkj1Ec89bUJEVwsk52pJKlHsWaZj5WvAbR8rgzr3+gGqnMWXCN18pQvE5z+i8430METp0W/w08Mg7milj9RRGrVmdBFe3xSWC4k5/KFXfYi0HBIg6TtArTHWDKrSW79HsMFPAWjB+z60PA/hf5/M1DtlZZXwNQzzU5aCA5Hkk/62Q3Rwf1ECVOj1kQ1H18zMvGR0sLuvwpKFJDVoi6tE9cwSKIdKHnmBBH9MDsEmcrD3NrNrKV0jUmj2veIlKNKdDflO4lWag/vI5drJD/of891SQTS5ITQ+lvnSH+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ7PD0wiv0VHC6N2fQDz/R9Q3BvCGmwRHV2aZkr1bBQ=;
 b=sW/vaxf9dLI4HbWAWf+UJePMCUcWfoI3xgFf85fsVuL4Gb/boPiSNEq+rT3Ohj3X+av2jEtKlpxsRMrcA2Wemn+ldGE4DXQkT/jqEKsCHIE12NoS3+vqdTb/tKVCKCwCuKPqoJA8mYdzRFmjozcVPIa4gryp/eR/nsrWpzfAuStkmfMB7gblCTSP360De76ke8LA35J/gnyLthRyPXmJo+8qb5Yap7bT5+rZhgUPRBHMc+CPjahcZN9LvXf5HbRSenszDXxZSV2Xdv5afcMFFU759VRuN3xUG9VtY72s3lNlskqgDmEQDAcfAd21A9lkO9UXe2ltJ8hDRXeNt0aUag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQ7PD0wiv0VHC6N2fQDz/R9Q3BvCGmwRHV2aZkr1bBQ=;
 b=ATu9pVSHcAnx0rdaC8ehfci0uNO1Z1OceK/Uwdsacj6qZHhHFYXF53fILtoG7W02n0OC6QibASnxA/WkrccVLFQDC2hMMsyA+op1UibrIGBBuhVW+Iu5vgio8NyYYxpvoMmQThoSgFQ9Q5rHCHSLsN0QHSt3Q2V8/T+CMvL0IIs=
Received: from MW4PR04CA0251.namprd04.prod.outlook.com (2603:10b6:303:88::16)
 by LV2PR12MB5750.namprd12.prod.outlook.com (2603:10b6:408:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 14:20:21 +0000
Received: from BY1PEPF00026967.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::7a) by MW4PR04CA0251.outlook.office365.com
 (2603:10b6:303:88::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 14:20:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026967.mail.protection.outlook.com (10.167.244.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 14:20:20 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 08:20:15 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 08:20:15 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Harini T <harini.t@amd.com>, Conor Dooley <conor+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: zynqmp: dts: Add RTC clock nodes for ZynqMP
Date: Thu, 19 Nov 2026 15:20:09 +0100
Message-ID: <e660f7ed31d0e605ede493941cb2d18ba34fd7b0.1795098007.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=michal.simek@amd.com; h=from:subject:message-id; bh=AwEeBYhun7qKcgHhhR3sVbr2EIMDHpII5COdK2jpNrI=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9Z52z4w7/UjGdQ5xq+e/PbvknsMJmDquwQmj68WCVE 8/059dZdZSyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBEjFwY/seKZjjzyd44eVO8 /Zd+iEn0OqmCzusv34vPqDu3K1PM8irDP7MVsXecs+Mcdv7b3XVXvuTtc+OL1zd/XO61oX/uupb PrMwA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026967:EE_|LV2PR12MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: c640ee0c-9cfc-48d4-29e7-08df46483e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|261021123027099003|10067099003|11063799006|56012099006|261021121427099003|261102123227099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: n3Ng6h7xIe/33kOxXiBsH7My6UX5QDOiIxrXyEne7yyxYoGVS+nQQ6GhHnl4GMLw0XPPsb/b1uveYzgrUX4VyQ3IPmiayEvl0j7676g2Osv+a8IIN89twAgRvVZO/6ad6y/bduAHV/48nNsnCRepkP+fFPLnqPpM1HpF3lS2Lc6Sa3SK+Nb4p4Mezx31OU5UgVPo+lbJ/SDWTybpBjX/5WlWVPwp/BJ9dYCGBG/L5KdepsYFyKJNiwcPgShPxr41v1uKq2qEYgjhmkwjhlqXRkMZjluGh8oC5E/astwTeXQI2bbE1/aid2VAf/yOWVp45HwFaR2wCMdkBSNlpXeBF7cEYpQeKxEjXczlQT6oqqusScF022kLNMVGoS4epFBdyUx8mCl74OiudR9Dx6Mfvq2vfi/Eh9zZOIcvssOpKovj8fioYXvK9krQ5lkml6GKiNSmfrxUiM52QQMQxsKbPxhYTqnbzzHSWBaJs2ldkmitirY++u8SCneJRZ4uikVLHC4xe8VKw0trSg0xijjxFF6qDrm5pmnsAbdSSTV2arPp7V5MnAiPHPbfCGQOCl3mQiim/yfDCmpsRgxb9p2uczu19pM0aKlsx6VZ2wBrbp/MXfwOmAXRGjOzblNOlZlBtR4N15yLMr6/nqfVIespre3egl5Zy2yPIJ6c6VMIM21qA50BCkEh3+yxMByHVtBHQju50kLMm0s7yo6SNUuyOw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(261021123027099003)(10067099003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 53aVhC83xNfblFQmfrYs0iMWN+7NwfKl59pX0vLYSpG168xi20pSfOA4Bw6EcWJY/TmQQZArMpFaLFFbZtwBMzDJloVAeuSG2+7x9pGoLHUL2tEsixAjfgcPog+mXHrNKPp/CJaUta0UkOh/AkcvaHL70WcfPi3727CQC0lM7C7CD/tCPlF5cb7hRKFIAXKPsiRxbwoGAuNCmzGZWyxWA2Em7mdGPd6GucfkstP6ZqKDkk4+Lm1hJU20QMvRJQOVhp3Q2LiV4MbO3CM+jSiUJ6kUAANNW+ry6FLhuJs1sZ+gIVk6gEfIKIdEq9tN0dXcQAXoI2foEo85QfqgIGQB+cHLb+Ob3sExrHXqCaRHxtZw/qq8M6lJDICnqSSd3VV0owdYALQBxnkwrsRk8+Y8J32lFQSz8Ydbgrif/geE/3WErtwG7N10FmBn1TJL6m8I
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:20:20.8369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c640ee0c-9cfc-48d4-29e7-08df46483e76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF00026967.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5750
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_062029_352823_84EFB877 
X-CRM114-Status: GOOD (  13.60  )
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

From: Harini T <harini.t@amd.com>

Add fixed RTC clock nodes at 32.768 kHz for ZynqMP. The RTC driver uses
this clock to calculate the calibration value, replacing the deprecated
calibration device tree property.

Signed-off-by: Harini T <harini.t@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi         |  1 -
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
index 482f432ba7f3..a6e67473a8d9 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
@@ -49,6 +49,14 @@ aux_ref_clk: aux-ref-clk {
 		clock-frequency = <27000000>;
 		clock-output-names = "aux_ref_clk";
 	};
+
+	rtc_clk: rtc-clk {
+		bootph-all;
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "rtc_clk";
+	};
 };
 
 &zynqmp_firmware {
@@ -302,3 +310,8 @@ &zynqmp_dpsub {
 			  <&zynqmp_clk DP_AUDIO_REF>,
 			  <&zynqmp_clk DP_VIDEO_REF>;  /* rpll, rpll, vpll */
 };
+
+&rtc {
+	clocks = <&rtc_clk>;
+	clock-names = "rtc";
+};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 29058e633fe9..dfd824fc3e88 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -1004,7 +1004,6 @@ rtc: rtc@ffa60000 {
 			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "alarm", "sec";
-			calibration = <0x7FFF>;
 		};
 
 		sata: ahci@fd0c0000 {
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

-- 
2.43.0


