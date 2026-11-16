Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFC606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BRarF9OG;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=nQVtYFlM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3f7QSlnofrRCflb98elmk1jgK+OxDoPAB2NyRU56Zoo=; b=BRarF9OGcq1Q+4
	zdf/Lcu5KswGJfEqSJ1UWGB1/y1P0l8ZTuermP6uaFt5kw59kpEC9yswVtnaK86+jSNOCU3xZ7G4C
	6hN9HFzqI0CYXXFVSrxJjWzC+rzIz3KAaeyYdGSJdpC5z/g6x9wRD+RLNJOLgvTuY0hWwfG6sEe4O
	NtULfqrF0ihD3hdIYTtysO1Hj51cio6eh/pjQyvTdguWpt1gwRpcu0MTk6hiOugCLXljUSeqPF93D
	oHTv9aL49YCdD72Kd6HMkUNzxh2N2+ojyJj6b4/KPYDOhJzdocCgqowk0mK4pFxT8KkTxlW0/JDx+
	PTazQHv7sQpkdOF39JvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwhP-00000002bRd-2yXu;
	Mon, 16 Nov 2026 13:24:43 +0000
Received: from mail-northeuropeazon11010025.outbound.protection.outlook.com ([52.101.84.25] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwhI-00000002bMD-2Xwt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:24:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tw3VqQFMxZkzZARghtt08AVxWemfNjsnceNisLLGizuVTN1kyO5Gqc4aX+nPtaqZuOz/nQOhJzgb2DzEjoATVAbzc4boTccdpe2rM3NUy77fCnCP2lfaPelKA7RiEulMiDbZQTEpWYjt0QcU5NIj/3+ww6rnnf7Yrwt+j6KXNc9ixMy6gVlK0sBiNmdix+znrLJPfEI9DvHLLrpaa4wGysUm/Pei63kiweEOhz4kreZVA+4K681jeSngt0Jq3zXRlmRz7yd7OuauO90Hk4iugiQtpntzTAGMO20dPaTU66JLZ2Uf2BCvHgHpaKzovhLO3um5Tnb/v29NaoBrO7+oTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3f7QSlnofrRCflb98elmk1jgK+OxDoPAB2NyRU56Zoo=;
 b=JtluSXsisF+C9PgZamHjccVrKI8Enl/w3mdAEnkILj2R3R59iG2Mt5t1+M5SvpVPTp/4ZXWimj9+kgrcvYRbSL3E5d2UAWoHPg6vRnk4kkWktauW3vxJdkDRGguzC4gwvay+U2wnI6BWGvlPBvw7FDVZjBVNukNpsAeUkkhqCJ2MdFxjmZafoDS3iCs5lYHTGu4ZDKPDG+D3xFMOlnqk1eW0FejPjsmihsNGYaq8qn8N3lRHy/Erok6w8svYbtjzmyVqbVYJTHVvtRrSbayaLfFhHYSrtCHw3LqCcE230kgmGDZT2kzDLmQ24W/3mmG0mt5/m34e91XGe12+qEOlCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f7QSlnofrRCflb98elmk1jgK+OxDoPAB2NyRU56Zoo=;
 b=nQVtYFlMYVJikBINI6j/b+luAIhKGkvrF0uSWa0wtyA/VoaRZAHcb8SwkItqz6IIvZOkCY5JyllSaE1AsoU24mVck85Zjgi2/eHoT8qbktwL04Cio54Q2Fok1piFIW3ovY7PEIDrZoCM71/xLK7kVKw74zYqsrBc4YNVyxtt+lzCZ99uDI9VIjzYLVXsrlmjJ4bJGQ7D76mXCDj1iRJK64MP/EhAv1hM8sN3gEFPUoyJpJUqeBe7JpnLBquSKxtuQVb2jXVKUVi/sy6QW6jR603cF1YyIdItk0DQ+ji9TOmD9LL21UqkdwNQug/evjb7AP4vCUt+dqcw/gAG/mXDOA==
Received: from AS9PR06CA0211.eurprd06.prod.outlook.com (2603:10a6:20b:45e::15)
 by DB4PR10MB7520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.4; Mon, 16 Nov
 2026 13:24:27 +0000
Received: from CPH1EPF0000052D.eurprd05.prod.outlook.com
 (2603:10a6:20b:45e:cafe::1f) by AS9PR06CA0211.outlook.office365.com
 (2603:10a6:20b:45e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 13:24:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF0000052D.mail.protection.outlook.com (10.167.241.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 13:24:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 14:25:06 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 14:24:21 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Yannick Fertre
	<yannick.fertre@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-watchdog@vger.kernel.org>, =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 04/15] watchdog: stm32_iwdg: detect whether the watchdog is running
Date: Mon, 16 Nov 2026 14:24:05 +0100
Message-ID: <20261116132416.1184447-5-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116132416.1184447-1-antonio.borneo@foss.st.com>
References: <20261116132416.1184447-1-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000052D:EE_|DB4PR10MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d63e118-810f-4e11-d1da-08df43e4f068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|921020|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022115727099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1OR/6C6bfZkd37gObxSNseaGmWhya7AG+J76g6r5NZeW3COuf5YnC+b6DgfMTq+Sx5UjoFYL5lODPMgXuvuStY3G9y08gf6uX+CCXOzBdcyJuZ8SHQZd+Mi6MewwiIDIUiZELgIlL8i6HQmlmOhBWegXXcG1LRKUg1cnvkUufv/WKMAQ57wzVH3FbkZMAyFOab5VZukzPljsDEeaFuWWNQP6M2MjTxkx3m9aSNDG/Afh70SOIIQrFUzTYCioWW6xQD2fWNEQoPekrZML5gZNddLIjpu99SapCi6ilzQC/LxAfXe4RAG3PXn+lNY+t8MnJfD1JLRALFl9ZjZ/iJSwyQr0ta37Varl1c0hVfz0VlVQayLuXbQkPWD4rX4f1YqeG3cgkAD4s+khNqzO+DIEd7BpdjszFtLx9bJdl0IdyfOL8cKEidmDxoadCOSWZVLcsZZwfwm1p6DitiTwYBMU6caMBzHS0U56PpsQk50SED20/GftEh2kZBs1CajwLm/eryfXKKmJipAsRZVR/4duvBaQQ724PqMf+QKBTl2dHONXoQ5gmWp8aNk+qjHY84Nswtbjvum+j0uMUOOobeq1aTXAyWlflVYP2thfb3UWqRmA06Slz5sTZcL43DZCnXXWFD8UG7I+9qkeLUwIFOjZ/hjY9TQnxk4mpAkpVFtiQDGVRoOa9bXBTOmdPlDrW2zHUL/6G1tNetaDMR8aI9bibbEcJuO0Y0kYvVucKJn4/S0Yk0KTAuGcH5r0g/Otv/J0
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(921020)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022115727099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mgQgaAcnKqImDQ/ziB52c5uW3G7qNnujRhChAeDL1gDv3FK69kwAKtflenfuZUZ3B0xkG7GbFP7QG/hNCF7SCF3KX5LG6neBYDj0GeJvjvwrbrZpJC3pOkAeW1ZR6YF1nXzDeVjduKJ5TyPHO0KOCqhiGgzxs33hwGZcqE3DdcFT69OvvEwazg0/9XBWZc7a8MqHxqhos6hc8gxRFAhTAng/Ua8WRb/XQY4Qg05I3ipqFoA6XspV4qVM6j0xoeBDf6yu27F3W16ZLdrGU6bx3ZyqsQFvQn3mFYpT6NS+bJg3lQBSV0M8F19ontb7rU2h2He/XOn9BBD4M4GmzdFL+M8mz6B1pMobWvejUPSq68U6fNna46RcN59SR0Sp0pYG4uoPYiRb9aLCCVsk3Vt+dzVeb00NguV1TzBOW/E93XhqtDPtHDoQZ8bSkYbMPlaw
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:24:27.3931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d63e118-810f-4e11-d1da-08df43e4f068
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000052D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_052436_673927_6ADDE341 
X-CRM114-Status: GOOD (  19.58  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

On STM32MP13x and STM32MP2xx platforms, the ONF bit in the IWDG
status register indicates whether the watchdog is running. This
feature was introduced with IWDG hardware version 3.1 and is not
available on older versions, such as the one used on STM32MP15x.

On older hardware versions, determine the watchdog state by
writing the current reload value back to the reload register,
then checking the RVU (Reload Value Update) bit in the status
register. The update completes only if the watchdog is already
running.

Use this state information to service only watchdogs that were
started by earlier boot stages.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/watchdog/stm32_iwdg.c | 40 ++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 9a0dc52a96bc7..1a5715ff9fab3 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -50,6 +50,7 @@
 /* IWDG_SR register bit mask */
 #define SR_PVU	BIT(0) /* Watchdog prescaler value update */
 #define SR_RVU	BIT(1) /* Watchdog counter reload value update */
+#define SR_ONF	BIT(8) /* Watchdog enable status bit */
 
 #define EWCR_EWIT	GENMASK(11, 0) /* Watchdog counter window value */
 #define EWCR_EWIC	BIT(14) /* Watchdog early interrupt acknowledge */
@@ -58,6 +59,9 @@
 /* IWDG_VERR register mask */
 #define VERR_MASK	GENMASK(7, 0)
 
+/* IWDG Compatibility */
+#define ONF_MIN_VER	0x31
+
 /* set timeout to 100000 us */
 #define TIMEOUT_US	100000
 #define SLEEP_US	1000
@@ -261,6 +265,31 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
 	return 0;
 }
 
+static bool stm32_iwdg_is_running(struct stm32_iwdg *wdt)
+{
+	bool running;
+	u32 rlr, sr;
+	int ret;
+
+	if (wdt->hw_version >= ONF_MIN_VER)
+		return (reg_read(wdt->regs, IWDG_SR) & SR_ONF) != 0;
+
+	/*
+	 * Workaround for old versions without IWDG_SR_ONF bit:
+	 * - write in IWDG_RLR_OFFSET
+	 * - wait for sync
+	 * - if sync succeeds, then iwdg is running
+	 */
+	reg_write(wdt->regs, IWDG_KR, KR_KEY_EWA);
+	rlr = reg_read(wdt->regs, IWDG_RLR);
+	reg_write(wdt->regs, IWDG_RLR, rlr);
+	ret = readl_poll_timeout(wdt->regs + IWDG_SR, sr, !(sr & SR_RVU), SLEEP_US, TIMEOUT_US);
+	running = ret ? false : true;
+	reg_write(wdt->regs, IWDG_KR, KR_KEY_DWA);
+
+	return running;
+}
+
 static const struct watchdog_info stm32_iwdg_info = {
 	.options	= WDIOF_SETTIMEOUT |
 			  WDIOF_MAGICCLOSE |
@@ -375,16 +404,7 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/*
-	 * In case of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set
-	 * (Means U-Boot/bootloaders leaves the watchdog running)
-	 * When we get here we should make a decision to prevent
-	 * any side effects before user space daemon will take care of it.
-	 * The best option, taking into consideration that there is no
-	 * way to read values back from hardware, is to enforce watchdog
-	 * being run with deterministic values.
-	 */
-	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) {
+	if (stm32_iwdg_is_running(wdt)) {
 		ret = stm32_iwdg_start(wdd);
 		if (ret)
 			return ret;
-- 
2.34.1


