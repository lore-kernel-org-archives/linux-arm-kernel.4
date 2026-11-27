Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D059C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kR4db1y1;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=c0h0KGUE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dfPiPGgacAoCxgZJbx8kmxB69fBWSizgzDEFHrpHNg8=; b=kR4db1y1kQOdo9CGdcd/Vl0yMK
	fiksBtwvElBILskjtNM1WXq5Ea+ZSB8OyF49gRnZkMkv085tMOGPMu5QbU4udIjdccG5d8E6haKlJ
	KGimzmQrrLwH5Fazl9icFR6hj5t3TlFouZpId8Y/xiN/1FYK/STeHFc/mj5ibogMTewRx8d7zWtWx
	lIjHJda0DgVo6aEGSe/lVkMSo0lxTjvI/XjhuBWJd3hmdfXP6sXpreE6W5eQOXB++oY/xFl0pLFLl
	ppMXxnGa4fCo2//07b5UfAz8zwvtqRyICMQrUrH7vGggivpOXCM2DNWfhfEyzzhfTOZXdG6mqna6X
	9qwWVxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0ZB-0000000HOmv-2UlW;
	Fri, 27 Nov 2026 18:21:01 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Ya-0000000HOWX-1x9q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:20:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWgINLjgW/fNjzbYA0e5zZvmYYYRXor0sqTN/J10y8UBD4fTURLs69b7hg1rW9ny1XJlmJi0MT1Tel5cTuRLhJs9eLsB+V2qTUQBSIiYB1Vmc8uiCaqTq0IgHAWr+uFSm+S7OrqKJ/S8xEa01KddFZRuZDgApEdI9sdozFwjB8CXWAq5tOmEFBEPdLrrpEJ5YNrHdFyL7vpS6fi4id4IhmM5Cqx7MihKol++aIGbtDi5OiTFExZ4ntLLu8rAkQf/j/nJ0M2x9E4gFxoCb5GFVARdReTymLVQcoCmEsuF2TgQpfHlSd4ObM00DjOfAKE77A6hToXx0mX0CvOxw83HAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfPiPGgacAoCxgZJbx8kmxB69fBWSizgzDEFHrpHNg8=;
 b=vGZvtOxyO2cjb1BVU6YlLGhNwffAMVUHuBQnRIdSfpfeObAKgnJJeIkmjoVLWnWUT0Lbb042Evbh8Dzy8dNrZCdGuMbH7hxzDMq8otn9dft38hf/i5tRU1OT3TpB2jbOjCJC8YBmxssBtqIMb6N/i1mTl4Vkv8oMlsf9SarNP75W7P094h+7IvImxFtcD6uyhCFutpUB2PwrLQ8YwSBmJdcdlgmxLdsET1XcP0TjWfJFrZlROnzMSlShLbx1pks/BsnIm8t2p+zir4IvuVoKVSdDOYzfXFRZAGktgozHwk/ASSAgErxWmaWHmomM3FZ6go4L8WjRYVWdZaf1JWdGaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfPiPGgacAoCxgZJbx8kmxB69fBWSizgzDEFHrpHNg8=;
 b=c0h0KGUENVWlVc/4Hrx9T3vV8y5B11s1MxKZO3plQUvU45V0MAdldnR7AtyZErb9b9fDRf+m1rLKjTPzHz5EESKghCud9Fejl5YCFLrG5SEcWn8ctmJ/j9Rn1lfJlpGljwGfq/9c3Iqd62gSD+ZA/HiewhhSSFrg1ZSRDtJPt1EzjyWtE85bGJZ1+u+EOBO4PJ3xWggupYdI9ei+uTo+HtJ/h8+LS6LfNWAPsSY2+vu/769awq60+OV4Polb+x7k+E+eRuuahSQmaUv9UkFH7e4yF0CjBAg5UHZCvmaLUMC7D/N8iwexGP+1lcDSNtK67cQgjsOdD0axc+u4yha4zg==
Received: from PA7P264CA0262.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:375::13)
 by WA4PR10MB477642.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:1d0:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Fri, 27 Nov
 2026 18:20:16 +0000
Received: from AM7PEPF00000052.EURPRD83.prod.outlook.com
 (2603:10a6:102:375:cafe::37) by PA7P264CA0262.outlook.office365.com
 (2603:10a6:102:375::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.11 via Frontend Transport; Fri,
 27 Nov 2026 18:20:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM7PEPF00000052.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.0 via Frontend Transport; Fri, 27 Nov 2026 18:20:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 27 Nov
 2026 19:21:05 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 27 Nov
 2026 19:20:14 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-pm@vger.kernel.org>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 7/7] arm64: dts: st: add power domains for STM32MP21 family
Date: Fri, 27 Nov 2026 19:18:31 +0100
Message-ID: <20261127191823.v2.7.Ibc243544a13186cabedd574e63a3a1f881f9fcad@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127181958.113639-1-patrick.delaunay@foss.st.com>
References: <20261127181958.113639-1-patrick.delaunay@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000052:EE_|WA4PR10MB477642:EE_
X-MS-Office365-Filtering-Correlation-Id: e61d1500-182a-4510-b839-08df4cb315d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|11063799006|261009223027099003|22082099003|18002099003|3023799007|10067099003|56012099006|261026140227099003|261028144727099003|261026121527099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|44046007;
X-Microsoft-Antispam-Message-Info: bFtjtUdG3TbObTswlgl+PZL1VbNwktPA8UIJU9uQtacnYQEyBzgJfQuadG6/PGlJbye83zpu3FUcVvGOrEFVSmViZhaST19ZFq6sfuuKWiiBTsXyDvrHSkSkTQyOM3+D5LwpOtuv5pqAJkcy3RvIPN0U1zTAt/zoCi+W3l13C3ZK4TvpZc+3e1LUjJGxfc9pPPskpIcn1e69+aY+ULFZCNgNgWlsMCFGCSXxdkWTMRigxHeKPpLU7ThjqY8WCBBTuUw8gR/whDFRirEA1oage9ERZGxKXtrFrCJgrDG6assuXchXFPOF8Xu6T+9ZxexZiKy5D1k9Ms8H7UIN81sE++ZdcshJQbzPLM7qoS6p6s/WTCj7URQT7EN90tHKpX5/XWvIh0mK4+xpiFAlONQJIS6ePyZU8rwb8lXafjjj2Z+IKz5cT5fcwq/Y6enIcwBW/IAiBnhuA+95OlKdSo8WlZRwGoNVR7zrIWY6qEAa74jtyGZqWwgSZJIBriKLVa/ma9tmHrA0yzC//V1X6Rp0R77XGQaZlWedOx07UXyghqzJpzPSQYv7kEOZGxVKniM52BQhCufmSZ+u7D9iIMDFKOhcM7xYW7/9t+dpjmWfwlyZO/3RiGZ5qbAR29cV3LKC/TofNfJIfQXdR45/HVpklUF4urRBBZNHTtSBOQsL3gtjE3eL1WG8a/nNyBxSGVuAyF9u5QwS2LpLV/o7FpgukFlb7e92979/RHOlrKx2lHeD7Okdz2z+n8I7qZ91YQr+
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(11063799006)(261009223027099003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261026121527099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(44046007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E/KneeBtbTIfyMWlxPXpzaPEMZg/tixDqKUoUbd7tf6MWe8anl8Km7bDyWkOuU2e6TPmfoivaBX0X9DCmXdRKYzDDnlRX2YSVo9LBIHCjAtkqnRLhNI+izkuOYzjQ1LVBJMLJtr9FHMACqjJX7bx4d5+um284xtHFOLVHuQqArH1+o+MdgAq+mWRjLirVNS2JAJqQ5F8ooq/W7GpLDZA61FPC0JEXfyzZj+opS430ORmMaB9gSBEiUnB9F4oVdK3zPI6TDPR+PoYlGVUNBJIMKmGO5//FJ5B1yEKAuxYy7vC1+E23vfwGj7xrVKtKBmZlPqxZyRYjwSwJKYnks6k+AArfHKSBckU+OEWBqKsXkxjcxVteDbTxo7LPb9erUAAFTal7q3ooxH0k2ZrNaAvgQdtMPHFvbCqx/YgM+fOgmP+MwgI3npQb6+ZGxOhaeFn
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 18:20:15.8488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e61d1500-182a-4510-b839-08df4cb315d8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7PEPF00000052.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR10MB477642
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_102027_499424_6CA3FEAF 
X-CRM114-Status: UNSURE (   9.48  )
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

Add PSCI CPU, cluster and retention power domains for STM32MP21.

Define the CPU idle state and connect the CPU and cluster domains to
the PSCI hierarchy. Add the D1 functional-dependency domain and assign
the affected peripheral to it.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- replace "power-domain-d1" by "power-controller"
- update commit message

 arch/arm64/boot/dts/st/stm32mp211.dtsi | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bfd58b26b51..4da0ac7771b5 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -18,6 +18,21 @@ cpu0: cpu@0 {
 			reg = <0>;
 			device_type = "cpu";
 			enable-method = "psci";
+			power-domains = <&cpu0_pd>;
+			power-domain-names = "psci";
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00000002>;
+				local-timer-stop;
+				entry-latency-us = <150>;
+				exit-latency-us = <200>;
+				min-residency-us = <1000>;
+			};
 		};
 	};
 
@@ -70,9 +85,30 @@ scmi_reset: protocol@16 {
 		};
 	};
 
+	d1_pd: power-controller {
+		compatible = "st,stm32mp-pm-domain";
+		#power-domain-cells = <0>;
+		power-domains = <&cluster_pd>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		cpu0_pd: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
+			power-domains = <&cluster_pd>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			power-domains = <&ret_pd>;
+		};
+
+		ret_pd: power-domain-retention {
+			#power-domain-cells = <0>;
+		};
 	};
 
 	timer {
@@ -108,6 +144,7 @@ usart2: serial@400e0000 {
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&ck_flexgen_08>;
 				access-controllers = <&rifsc 32>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 		};
-- 
2.43.0


