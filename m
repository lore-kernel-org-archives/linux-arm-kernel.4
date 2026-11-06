Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC7E606D801
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g8yH6ENT;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=VACtzfEt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k128ZcR2Uar3siuYTAuf1rHHRp9uXYO9JcYIwAYL+FU=; b=g8yH6ENT3pRNFblqoi8VZMEa4C
	d2GB/TV5/3ODsqe9+BnIWnhT0xl3PmgVXEpdbvP9lCna2MBCy3epR8U/pGTV6LiDbej/WjucgtG+c
	KBz1cW41rlrn9dYzygz3ytNLCZ9h1PnJCVXEjAMLDIy4sMnKcvhPFePMA9MAvq4nsNmLCN7ZkVR1R
	/nWcbZVJaIdGD7L8Metv/BsTlFQEZuClAyfSSTeZfbcGvzghUAI8BsqFOvxuK1Oo9H0clm6L2Fs0D
	Re9MAT9rvqM98yOFeA3eQdN6gqDBqfOEU1yThwZHlpoBKcf2TjKH7+mhdN2/jzAA0bfpGspTsD1pq
	Pheyrxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMtq-0000000D4Z9-3Xi0;
	Fri, 06 Nov 2026 16:34:46 +0000
Received: from mail-francecentralazon11013025.outbound.protection.outlook.com ([40.107.162.25] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMtm-0000000D4UI-22CH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:34:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUYbcig9o83UKYIikwWoRQC4gII7VfdFQZxaKyqPDvAZ3CBtDiTYY0Yru0/9RJCL+ZNtbR25bAkn/8HVIdm3sUa5frLYIwtql/XrTpoDoEztaxIv1a8evHaP1SOSllVJIq9OoVYgCCG2+NlIX4XDzIyQBfbIFmUoB5JIke0bQOBLtbh3Vdg2M/dTIiUE7LQ9KDwaEs1rV0dgwzT3VgZn3mco3/qAOw7B2vd1X70m8Vf2qg1UvF69juGoX3sGdFhH1QHGWlguGlhAgld0gW40D2GXXohzDRHWiK4dMXxMuDtJ/wYGKkpZJCVAUn7fX+pa2XM1oDrkiYaJvFuVOf1tEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k128ZcR2Uar3siuYTAuf1rHHRp9uXYO9JcYIwAYL+FU=;
 b=wTWc2P+qNtXtGcdHfB+Uci4Ee7RR+P6br3leS/INKLuMyd/t7kdJviV2ovBURbiZLRhZW+gZC56TX1x0H/USNLmAJkxcnSXKu4Yq7+le7w5lTYG0sBWJ9t/1BUq6VNSPK5hbtikgK1ApP5/PikURvJGgr0YctL0dSIxxMv3mMXRmW15DiozT9DYXf8omMFu6+kCBrrdDLog3yYlSUhnzk9riF0t5rT1kDlK/hzks/3TIh/ZbZezFkOcH4nsHVf/mth6yzxyIzY0ycl97OqB+3IvIevK28mjoD93LHWy+jTTpBa5rP7of6DfyrnQT+8SRHbaI8auJYxDW8CkfLcEvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k128ZcR2Uar3siuYTAuf1rHHRp9uXYO9JcYIwAYL+FU=;
 b=VACtzfEtkWptkpcW9V7i6yCu/AuPdYRWaEEqQhkH3WU658PhaOheaiXhmJYKDw5bR1K+kTxQB86E8G89dan/owp9T9Ic2etnWL7wptRmxazfSuMPbR9FPbFiy1xHwD05TAnD6cynKdG4Bic1eL/eSeaNbuaqRhqzrf3hl+GJ6fA4Nib4grYpdK6MYrU6ZwBjVxuHsB4zeGhFa2xHLnQTh8xl8toQmIvqTJMczehIIbcG9jA+PslGbbsxFBE1QhNp/s8BtUfVQxAugrtuQsn7gbfM+47maP61v8dFpCtzNlbhbcNYmXTYX+1RVtFPxBEIDJNJZZNk3ORTWfMeJA2kDA==
Received: from MI1P293CA0019.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::16) by
 GV1PR10MB7572.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:a5::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4; Fri, 6 Nov 2026 16:34:36 +0000
Received: from MI3PEPF00008483.eurprd02.prod.outlook.com
 (2603:10a6:290:3:cafe::56) by MI1P293CA0019.outlook.office365.com
 (2603:10a6:290:3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:34:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008483.mail.protection.outlook.com (10.167.240.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:34:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:35:22 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:34:36 +0100
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
Subject: [PATCH v3 04/13] ARM: stm32: enable arm smc watchdog on stm32mp1xx
Date: Fri, 6 Nov 2026 17:34:20 +0100
Message-ID: <20261106163429.618392-5-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF00008483:EE_|GV1PR10MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b3bdb44-07d8-4c2b-bb59-08df3c23d8b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|7416014|36860700016|921020|56012099006|11063799006|261009223027099003|261026121527099003|261102123227099003|261021135927099003|261021121427099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: GPfvLJ7hvRQDYJ+yV0rowqXWnBfzgrIucNm9qjDz1zCKgHMnQohAg7jpuy5EqjxbT1MlVZhSLjk2iCN1qmyHUIk+eLCbNil2RCBv6DaJfDcp5ZW4ACmuNR6NlQAGeZFWRPyOBFiJbKv3O1/2IxF1fdNLMQMO/CsKKosXc3c0KnWQMcjMY63noAMJpnpbieoCRBnLQ1PRU8h99DEF4G6uXfEmkIBToXK/leHmWFImIzShtjUr1PQy6zRhBxdOhnDGRFfm7C7lZYO94iJB+iKJScBhzTEY3nZFVWaNlQmHyTTO9k6gNM33jTwQH176xJgsT2IDuN3g+UOO8S1S4o1FpL/vAR1PyVEc+lTBcabSO8k5yJxk9tOuOzT1Tm+hb6N4xBS6mCxKbcQ+pRQXDXWWd4pQpeQuBbptK52W4cb1wMTPfZsgbaHzLP/jRman3GR6xx9fGJewnExRuYu6Ebze2zCel5d2zU/MjgsJHz2hMK5ZRW3rouF8UiQZ58Xm45KB0otD7GJBy1hzFsGyTW0IVvpJ50y69xqkoTssFYVXnOoXHJyjxMBKNoa9tnNqDr1k1WsvAEy3TWrYah8dUT3WYNnm+y2Y9hgUgUgSZlF9pYKFGg4/KkCZD0AjKrw6wdsydTMiHEpvOI32tLJJf4vDrafHiN3XmKuRAnaNpdjSF7XUHfwxajBBem8c2dcsFe15FlYVkxC+U3vo4CsHxXqX1WgcRWOGn5Y9V25k033MqFOHBDkSLlsolQiI7TKKGGbT
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(7416014)(36860700016)(921020)(56012099006)(11063799006)(261009223027099003)(261026121527099003)(261102123227099003)(261021135927099003)(261021121427099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iuX0y6HysvwsnuIOcZADyWIA7Wpb65UQEyKBjgQfHsf0iXgi9tRpL+08JyJXkdMibzH0HTYQNoi4nsRbSapCbHCmg6wv2xrQf6zzKG7UnLjeGTGXUDjMsIwG9WU1mEtktG+Jqhj6EoDz0JHpCYgTJDeR0WT4wSsZtenqxcCL+7GyX3QPjlpHJ2FGfIMDBNZNkmPEFqqpaYJ0p+RNt/qJcobF1KePpAK+pvV+uZUJhyhu5yx2jXwnIgrwHjmw9C0EsXDXZgEHV2eduBkWNWsLmqWRo6LFeDrQjvZO8mUZUsjA5cYmk7OBsjvCNU66V2aagF6TPvhnFFbxzdeE7v6RjXIaK6gywUFTi2QIdQ492UeUoMksufvAnMATMZm1yY4ocrsvW9V4fBW2mZBxmcWuRX2edNlm721r7xrzQdQZVJ65wa1UgHyN9cRlzgPWS6Bd
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:34:36.6985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3bdb44-07d8-4c2b-bb59-08df3c23d8b8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008483.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB7572
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_083442_527517_B4969054 
X-CRM114-Status: GOOD (  10.82  )
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

The watchdog IWDG1 is secure by default on STM32MP1xx SoCs.
On boards that keep it secure, Linux must use the arm,smc-wdt
driver to ping it.

Enable the driver for mach-stm32 when ARCH_MULTI_V7 is enabled.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/mach-stm32/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 4ac3384e397aa..de09b2afa0f2e 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -13,6 +13,8 @@ menuconfig ARCH_STM32
 	select RESET_CONTROLLER
 	select STM32_EXTI if ARM_SINGLE_ARMV7M
 	select STM32_FIREWALL
+	select WATCHDOG if ARCH_MULTI_V7
+	select ARM_SMC_WATCHDOG if ARCH_MULTI_V7
 	help
 	  Support for STMicroelectronics STM32MP1 processors using Cortex-A7
 	  cores. Note that support for the earlier Cortex-M based variants
-- 
2.34.1


