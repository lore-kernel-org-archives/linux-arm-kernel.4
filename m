Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5DB606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OZrbbkx9;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=LMqoti7w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7yKV4G281KMmHjowjvBVi18VjulmZtNhU3fwRVe3rbw=; b=OZrbbkx9XvweVXPTDutZZGORb6
	zPeDd6yOdeULHhkEv9IXe8VkLHHmGHP3TAkRjIr12kd0AtkFxKMDsPy5O+/2dvUBznLlA+Giq8yBD
	5T7DLShZNt283Ok9m2Yb40fQDgGTINdJlZBCyXrBKDCvBDp/cEVb+9hzBUpDaqbbwqlQY7RoyB9pK
	MYK2eYQ2bq+AnEgp/TcyM3evg53P9jvJNoaZWrZvFIXXeoi/PlTHG1ucKtsIQxG/sWPgV8j8/KWWY
	yo1iOh9t2KQeBpABrJi2nl/7VnvbKdeW8klrMatyVSepvXBPc6L8g1ciOX3xxo+6gyrD5LVxb2sbs
	nZ5zsJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU69g-0000000CsF1-0l7B;
	Thu, 19 Nov 2026 17:42:40 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU69d-0000000CsEF-2MeO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:42:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kquW2MpQiHZKbI1MOuTW/C96mvrA9URp32JK34VKluMlZXfVMcYaDetQ0jLJBlu6vnsD8NNDQrX8unDjVdabDjj+BSEFKRaFtl2fWw0/8jR1ApOPY2gLm2mdF4EMXe8rBkAtkAyHM1pldLXjyR2UrOirMjaGXpjVnKnoCLlBco5Kh9VgnWknuf/vbJJ7kl4owvyLokz8WdkLiiniijoADDWWmnUOM5vfAUErBHeKzK2/kA4LJBx1PDDDA0CJ3nnIwQ57cf6Vy7aUe1avSJxpksuyQoIfvVvp4cVFjyLNrnMyWcrjaV6+FOryQmFVfYlxMP0KusiGjAa4CkzDTGjBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yKV4G281KMmHjowjvBVi18VjulmZtNhU3fwRVe3rbw=;
 b=nebRuWNvVTm8zVk5/0iULOrdZ4AAQfpldXAXWMNq+3QPOXq8FVT1mPj1ubTSA5EqBBylZDRbwCYN6O1Q2iFqQvZQ7lwfW9TvgkNXBa553KbL1LuzkM3hIhJbladlkelM7rFbJkfFA0RASvwK7SKkxtpfO181LEdiSyHnXjfyVvpzsOWIcTdy1ZlRXyP3p8KryRf+W5xZIEvA/VUW+wpkPCVHh2wVPBiCRmQmM2cvSGtLrtU5lAjwR6jV2xvlzCrjjEz8W8QMwTv7lqTcvcMRcFTEePrzguf8qL5osW4J/eBgu5+ZyNyfj8nu0ctBrEdmkcaqZXKGkvyhk2gQjAcavQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yKV4G281KMmHjowjvBVi18VjulmZtNhU3fwRVe3rbw=;
 b=LMqoti7wQ2JuAtYgbBKARGzSjp8C0dJxmlTG/IeclVCtsduEEt3Cj4eVRck4lwL7DlyB2WkVTgweXHpymOiwjUFfbd/y+/6voKZBG7o7cayjMpSbd6TmGzUJoeM93FcuqQQj/xDl592FeWAjcrkVZ0rQk9V1AnyjZBWoQPoDCFAMcM4AjqxG6Q8bqDHoHWRvgCh19XPBIW9DK1YHWgO9gEKPu3Zx4RQu+1gx2TORXs8tDJ9on9lgo1R6oP/cfZUbKWeRix7foRCt94FRkRu9lAWSSuAFPHObt8lUQtGmV5e0GgqIA/P2rNNnYQsvpzQB6w/k/0yyOCQATxJNRHMxZw==
Received: from AS9PR06CA0473.eurprd06.prod.outlook.com (2603:10a6:20b:49a::25)
 by AS8PR10MB7523.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Thu, 19 Nov
 2026 17:42:30 +0000
Received: from AMS1EPF00000093.eurprd05.prod.outlook.com
 (2603:10a6:20b:49a:cafe::9c) by AS9PR06CA0473.outlook.office365.com
 (2603:10a6:20b:49a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.18 via Frontend Transport; Thu,
 19 Nov 2026 17:42:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000093.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 17:42:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 19 Nov
 2026 18:43:14 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 19 Nov
 2026 18:42:28 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains
Date: Thu, 19 Nov 2026 18:42:11 +0100
Message-ID: <20261119184209.v2.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000093:EE_|AS8PR10MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c6f74e-cc26-47c9-aeaa-08df46647c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|10067099003|261021121427099003|11063799006|56012099006|261021123027099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|13003099007|44046007;
X-Microsoft-Antispam-Message-Info: uxOl+DDxXSP28xUDMt5DrUVL+7xS0eoJJS1SFbImfbjhV5RCo5z0WqkGq/r2S/W310UOreHjWUzTcw8A7dMBeD9DPfjMjxRuiL43gSlQwqm5RwtxLk4jJ+QIDd2o9XH5NWCTSQbYjjo7osE+YCL1VIis8P/l5XiDL4eFlny1G69C/lgubre5LKCHwuH+Z35pgwbMFaXpj2BaLfdMzyetFUQ4DCdEWYxAxJmqSfd6MmtX3HdL5Mo+T2MC+jLmrzRF2OjA3JkeiGqgfK39ro6mzA35i/SWrHZ3IBgadLMLeYgRChQIve7+Ac4miaoZMB3gCi6CR0FKABE7BJUZPu7D6HU7Y76TYmsNCMW+oV3Pw+jI6GhV1RL6UzLd/Z5KFnsUdCsbijWS5QTnMYJ7NtHj+EJGXwGp545wPjeGPh/kZGiJYQYOnMVxmi4GHt17/hZVBvf2zKQdMkOkC6yvCFaC79I8Q+qERk2SESBAp9dLl998b6FXM9xBqZMj49JTDVCWue8yAlarkOiaURQ36wJLqRQNH2t1Dx9WwHeU5k2J+A7ze0LVhUJ1cZZfOxBrlajUK3/QBnHdiQNmu+7EZA5NbVgqDeMB2MAgn5y3aOYU5YM+1rsXIUKELyGUgpL3g8tidXLpqBft7kIBhL/70/FIDZzo4VxX7gNdiIkNXmSwyCB4ZkLsz+3N+d20XmeUSR/wVOkowl2Up/JW3glEnmUgGQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(10067099003)(261021121427099003)(11063799006)(56012099006)(261021123027099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(13003099007)(44046007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: X1kHLPpdEqmXNDue0TlaIaKYW80kUyH6T8FZF2lBwzYWzYOWJ7FFgWvdMQVgRlrheVMf5NdqcKC98fVmu25nsAoy0pZkTiSz7bDyJorBXW63THGj63PnMd88QrednAyDFfmqwXFSlPRTKtevmqhzlhC3DRBNuUKG92xhotqauKlDdnrHIa8UjsJ6bEfPbKTjfo9ZjA2ssbbtASwKp22pubGPMVWRmR7IZGmiCwLhggxn4Nu1N6xSghf1I+M1z8HOe6es/m2QlizF6RY3454qu0jhsH643qeVE3bam8QbYLsOVkrruVZRucRBGk1fUBiX5JYDraqg3O8P4urXVjqliAtT2e9z1rvTFEZ4QdDXw9AZpAiqGSGFaSo51onZ8QOOPROURNi224BXeGLsTtpUG+QzIw/nwgkhohJhJOwodg0M4mF9BiTGmkQhQQZqDtp0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:42:30.1348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c6f74e-cc26-47c9-aeaa-08df46647c13
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7523
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_094237_988683_F9B14D85 
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

Define a PSCI CPU suspend state and reference it from both STM32MP23
CPU power domains.

In OSI mode, PSCI power domains are initialized as off. The idle-state
allows the CPU power-domain governor to manage them, avoiding probe
stalls for devices that depend on the cluster power domain, including
SDMMC1.

Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
Link: https://lore.kernel.org/all/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Hi,

It is v2 of previous patch [1], with only update of commit message.

I add a link on previous patch [2] which changes the timer node with
compatible arm,armv8-timer, see Sashiko issue [3] for details.

[1] [PATCH] arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid/
https://lore.kernel.org/all/20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid/

[2] [PATCH] arm64: dts: st: mark STM32MP23 timer as stopping in suspend
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
https://lore.kernel.org/all/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/

[3] [High] arm64: dts: st: stm32mp231 cpu-sleep local-timer-stop conflicts with always-on
https://lore.kernel.org/all/sashiko-outbox-197300@kernel.org/

Patrick


Changes in v2:
- Add "Fixes", requested by Amelie Delaunay
- Add "Link" to arm generic timer patch

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/st/stm32mp233.dtsi |  1 +
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..27231e140fbb 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -24,6 +24,19 @@ cpu0: cpu@0 {
 			power-domains = <&cpu0_pd>;
 			power-domain-names = "psci";
 		};
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
+		};
 	};
 
 	arm-pmu {
@@ -123,6 +136,7 @@ psci {
 
 		cpu0_pd: power-domain-cpu0 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
 			power-domains = <&cluster_pd>;
 		};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp233.dtsi b/arch/arm64/boot/dts/st/stm32mp233.dtsi
index 78f4059fca5d..cebefd99906f 100644
--- a/arch/arm64/boot/dts/st/stm32mp233.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp233.dtsi
@@ -26,6 +26,7 @@ arm-pmu {
 	psci {
 		cpu1_pd: power-domain-cpu1 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
 			power-domains = <&cluster_pd>;
 		};
 	};
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
branch: master

-- 
2.43.0


