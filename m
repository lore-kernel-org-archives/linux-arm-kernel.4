Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B11B6083606
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PAYStA3B;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=d6FjxgRK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MCQhLfQP6qSWIv/Bp/5GHKxAitrnX2ZTvxeIrW1XR1Y=; b=PAYStA3B6ivQWn
	0NxNBECz2Elxf+X7FvW5dQ2+r9eDKuUgr7REeCMvsGU2URs/NxSXOvJw+lTX0j1Ss0/11Zw1ZGTd3
	xb4Z8iVZcScxbgKdSwdVwT9np9PcPVYZrUSrapJaUmOFSetcAwemSiaGS1C38JlSAI0YUJpNZF/Vq
	20/5JqMy4gNRaUMj3/z2Y0crDISGS6+2I9emQXh+eKyx4IBwIKz0WZpC6qbazicaYN69JYL09FZLi
	7oKpjN6Qkuq+vzncKYrjY0DpbiPznNmZaTqQ4XjOYhduqaQVPSK976RxBR3/V9ynhBhINchO5bd3A
	n6IyFVf/7P4NuV+Rdr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMtn-0000000D4W0-2sNO;
	Fri, 06 Nov 2026 16:34:43 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMtl-0000000D4U1-0iY1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:34:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8QmdhCOXwHKA7gW045sYdw2PaAZryd14q+EwLcfSECSjrs2FUSht6fv0pCdrsoyij7MqOT1XPEK+qANEf464mhFle1eain5IrqoPeteg+WQDwPNughS/4cgfStZGha2L+7APt1xcAoD2YYNKVG37pFhAaXdfH1f19Z1LrtNoFIP3Eahgc1GYI1w6nC9XOeJ6WyX+yueUZBhbhqlqfJ/P16D9A7cqffdse6g3VKrzUB6rBJB4zLkMIRgGXlSPS7PQGXybHQ0igk67bDN8ZXUhrj3f3EhuW9aC5Qb1EaCG4ykJQ8vGIbcELMEEp5lkmdTYBq1uE2JrMjF/YYxMEMkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCQhLfQP6qSWIv/Bp/5GHKxAitrnX2ZTvxeIrW1XR1Y=;
 b=myqEfBO/oNh8/xktAERwpm6c5lH5M3lea9Q5RgOYS2yBi0Gzk6zeDvCpKoC9jk/GqAeD+Q8Uj1J6GZ/G32F8J9gfaYpPstz8pIOVxv9g7RfT7smDskj6/STa5RmHx60LC9x85amVX1HuhZEELqo5w2Ke4hEQ3w4SqYXl6PIRcdBF1uvH3r3GFdoTmlKLWw88tIcVFvy1hOHF0Q3TsE/nM+bky/ykJT+gCUciJMrtBPYy2Cs03MT50bNaDv5axEg4xnp8FPWyzJUaoja7Q9bZbY6XG+5JSq1T0ezMsdSl6C8Oe2eTRqtdtQHnRTe9qkANrRRPDMV6ni24vWj7PzpC7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCQhLfQP6qSWIv/Bp/5GHKxAitrnX2ZTvxeIrW1XR1Y=;
 b=d6FjxgRKz0nlGAo+JP0juDxy5gtqomF5tdsxZaW8yclsfnZyFPTa1l3MZZs8C4s/1/AdqCuS6e5S0r+gPpfPMyICxtjwBnqvc0jvrShw5hYZKU7edawlUQ/4m5O47HiGFr5X7bWTk3KG/vy/zZtTU5244ps1kg8lwXAn3OX97bA+TN87oESjSYJ7xwVGRKAGju3yDSzCFRsiLs7T4HOfgvjoxnotLRvhpzcKlozs5E5BOTyJhAKh5UJpnBSLtuCGdrz8PVB4ac1LJkReVRu29wdJilZk336p5YKD3LAQdztf9F8mXyKMtSHQo2xZdGTTmxBVhgjxMZsHXRiDSMJlZw==
Received: from DU2PR04CA0319.eurprd04.prod.outlook.com (2603:10a6:10:2b5::24)
 by AMCPR10MB992169.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:782::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 16:34:35 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::94) by DU2PR04CA0319.outlook.office365.com
 (2603:10a6:10:2b5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:34:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 6 Nov 2026 16:34:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:35:05 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:34:34 +0100
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
Subject: [PATCH v3 01/13] watchdog: stm32_iwdg: get hardware version during probe
Date: Fri, 6 Nov 2026 17:34:17 +0100
Message-ID: <20261106163429.618392-2-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106163429.618392-1-antonio.borneo@foss.st.com>
References: <20261106163429.618392-1-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|AMCPR10MB992169:EE_
X-MS-Office365-Filtering-Correlation-Id: 44772f21-e3a2-4ff1-d2af-08df3c23d7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|36860700016|1800799024|82310400026|921020|11063799006|56012099006|261021121427099003|261022075727099003|261009223027099003|261102123227099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Vv/VCTYzuKinLE/nG8ICWP7j27YhaBJb3V+r62LmaE/nUBJzmWwp+XILSd4N2TU9THutiIINzOh8FzmhpEWOz7fpVK/oWBaJf1T8EUd4+nFA8WXjd4Ptk8EZnB0JzDxCzf1PjllgCk8Kr7DAcWlxPCwHLQOtN8KTVWbIfrS7yKFGPkWZbVWSq/LuJFoeWdUoWT+GlmJujhfU0YxCuBKVoRdn3H6K9r3ahCmOaJ8r7eDYN5kwfHV8lS/evv3yXJPjgyUBWxIZeJ5IIQPwV0TmRmv8MkFQVqZtrT/zLI6s4AdeeJVIiXjjoVIU3+h7iIXjRM4Nuw8DHF3Cfwh9uGZxAx4fHlr5tFDMaE0IaEeyTpo02zyVs0dHaHCkPHpWFuIlb6w7bPqURDNw8/mWnde61TYKRZ3v55AcRop0AcAZcuK22d4BwPQG1asGnKX3zMItjacQ5oftTwJ0ya8FRMIPF1hZuvDB7r7o5+InSZL5N1y20qatUAzm1QiVTG9RBGFpdrxA7MCeERUp/tsqS/O7K/oSeBbLA/QnzItvsV87dziDq+UChIkfby7PMc/JedvP/AsYuFk4QybRksDf+QZ/eLzZxPSbhx9ZvD4A0xabLtacXlDydgwe4NDLpl77FoskcVFztrdvE1KkZ6B/UFtjLEGz/REAIqDon3QF0EZxQF8PnXY5iRwmdrjuVoO/8qEedivQu+jAp0P7p05qEM5z6PK/nQNIveQSgJKa9DmISLg6+31yvr0OIvEovMC38BLJ
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(36860700016)(1800799024)(82310400026)(921020)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ADivAItD8oY7IJ/bxxfCDRaR7uWD9YUrbMvzZQrZIGMY4eFB+y96fUKcI/baM3pRea0Hxom7uAie5Nbxo0iJ9+/BijzcfQCXa1O6jtoVsOjNrm8HWSxTOgvoRBWkGHpPH4uCbi/WOIy0kljYCC9jVNg0RH8m0bQmQkUTyXdnPQ9/SOu2uShZ7FzlAV6VvYKSFqqs2J4vveup3QrBlC2GeAOnj6rwfFR+WSWc2nnbkbZN0pCz7ay73wCB4JCGnDm+iS6g/Hg1dWUdoZFDS792Ijrif7v0ivIQb9AcI+8RQQrNhxHhVZzJYCvGcFnVHnH9EsJd+SK+VO4zQSjMTDLdOJwGysq3lOaARHOQrcZzE5dKkIWaauQgRQtXfXMvm/X1ZL2gBOyDPTEXctPQPLIIPGc73xpwMuL0KSKZE2AjOOkpSqeGu2k/gMjRs5tbvK9d
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:34:35.2137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44772f21-e3a2-4ff1-d2af-08df3c23d7e0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR10MB992169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_083441_324478_B321320C 
X-CRM114-Status: GOOD (  11.27  )
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

Get the hardware version of the IWDG peripheral during probe.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/watchdog/stm32_iwdg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index a8d2db2d3cf8b..30b4cbf20afa9 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -30,6 +30,7 @@
 #define IWDG_SR		0x0C /* Status Register */
 #define IWDG_WINR	0x10 /* Windows Register */
 #define IWDG_EWCR	0x14 /* Early Wake-up Register */
+#define IWDG_VERR	0x3F4 /* Version Register */
 
 /* IWDG_KR register bit mask */
 #define KR_KEY_RELOAD	0xAAAA /* reload counter enable */
@@ -53,6 +54,9 @@
 #define EWCR_EWIC	BIT(14) /* Watchdog early interrupt acknowledge */
 #define EWCR_EWIE	BIT(15) /* Watchdog early interrupt enable */
 
+/* IWDG_VERR register mask */
+#define VERR_MASK	GENMASK(7, 0)
+
 /* set timeout to 100000 us */
 #define TIMEOUT_US	100000
 #define SLEEP_US	1000
@@ -82,6 +86,7 @@ struct stm32_iwdg {
 	struct clk		*clk_lsi;
 	struct clk		*clk_pclk;
 	unsigned int		rate;
+	unsigned int		hw_version;
 };
 
 static inline u32 reg_read(void __iomem *base, u32 reg)
@@ -351,6 +356,8 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	wdt->hw_version = reg_read(wdt->regs, IWDG_VERR) & VERR_MASK;
+
 	watchdog_set_drvdata(wdd, wdt);
 	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
 	watchdog_init_timeout(wdd, 0, dev);
-- 
2.34.1


