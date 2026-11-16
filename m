Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122F4606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CZcrykfw;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ixmAIKKS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w4/pr0ohBm/UjCMDMzro9naeXUbdCOIsAhZ0wx56tI4=; b=CZcrykfwoMsWZ5
	e1gFZL7Ntl9q5PFTOXDGk7JqQ2MpRSXDRJ/dreOkbBq2DtShOMqE8mFtMh6AbXwNt8v72tbUg9Ydp
	GOf4FOAcRUGYnBpF5E7w4eFozJlXTfvkEOuz4bNwWsaObf2QDwWq+HVW3aGvNWaR0joUm4zbB4lE8
	TMFpO7AcKu6R9W9REugxeYBE2I7cTeRThlJNzaHLV2mc3AG/pvpwmzpmydy27U6PG4qHw3uut1S2n
	z2J5BBsvvwZFeF84RDZB2DTBLmP7xeQVAgb5Euaiu2ZV62d41aJdbHAw/ICgGB7Ua2nEcyn3tdvyB
	j0Z/gTW1YYg2KMLjLjKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwi0-00000002bys-14Rt;
	Mon, 16 Nov 2026 13:25:20 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwhk-00000002bjy-22pU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:25:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rg0FKDmHsz6Qk0uu1aYI31ABpito6wDqosmi85sGZcLtY7kkyYFJxGi2QX9WuK8VJF24x2Dq2U9f9/lza3fRc2b8GCleTecnt+fkyr44JIZ/1EiZKO9zAL88HxT3orGXOq/mZAOAcN4RhAX0+7JLz6iX6XeiOz1cio7kzGMriMYnhkGGQzaz/xigs3jKaGL8oCfmDn3RoKAc4vfcMdV/BjBysdpan79YSygiEfWTtVD3UqjhJ4iK+PS1h3wGdaIlUSkFIq9eaxfbdZv+E4ZLMGFoa2Jfb/OWwfiingevC6EkW5uc+HRmzxzDMl1X76CaZvNVz4JruSqDfGob3RNrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4/pr0ohBm/UjCMDMzro9naeXUbdCOIsAhZ0wx56tI4=;
 b=cpZ9J52eoLflRtPY0K7JG4ALqDLW6IU+XtyZY3r1nRK+NZDV5qJoklmOqhBp5JDgAXuJ/a6/+UYJtyDDy8ObZEsbjTjU+4JL6ptIMn3I8d2/fO+/RmhU70UFXWmuFyH71Qk4bhaDJN9ozF0nwg0z60Q2LjBFyEbiTQK34YRZn4uX+ZCeL9CLNwUE3CS5n3OJLqAAVfyzPaDhzvOm5358nIGWxyrjC8o2pXwqdzfXIeHFcG34bYVNTj0EZfVeSP8Zx1pFlxHPXnGPpV3XamrYqWxZDCyT5JqpIEQoCab0rjtq8dFDA9uly5yDf1PhgtbkO70Bbwa45cBQyixgEQhJoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4/pr0ohBm/UjCMDMzro9naeXUbdCOIsAhZ0wx56tI4=;
 b=ixmAIKKSppa3nlpZDpQwiUEbhyM6odqC1yPkkZtextx9XONE2VcJOmhog5Dw2d1VV6mYSI3+k+HghM9zUS3ShLFBwWVXwPPrV1PlGHCmqDABG6gBZ0RutK/hQG0uliBMEvsyEteQtsA1RpzbryWNnAxPSXVK+t6C1HVjTnRZ66Ha7LPXFwlJ1ukylCmHQtlontCxBxNAFQF6F+H9BQTkJXMa35go/i8ggD6jMFA3GoPH2+i/D4Qfg759a5+fxDv+gDA8a1VCqUo603eXr7fRJouoy1ksV+nN0yEq2U2PhgUnRMTkIMVEOE6++qdOHYRNQnfzMwO7UuseALJ6V4TXSA==
Received: from PA7P264CA0180.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36f::6)
 by DU0PR10MB7286.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:446::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Mon, 16 Nov
 2026 13:24:55 +0000
Received: from MI3PEPF0000855F.eurprd05.prod.outlook.com
 (2603:10a6:102:36f:cafe::49) by PA7P264CA0180.outlook.office365.com
 (2603:10a6:102:36f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 13:24:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000855F.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 13:24:54 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 14:25:21 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 14:24:20 +0100
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
Subject: [PATCH v4 03/15] watchdog: stm32_iwdg: get hardware version during probe
Date: Mon, 16 Nov 2026 14:24:04 +0100
Message-ID: <20261116132416.1184447-4-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF0000855F:EE_|DU0PR10MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c844035-f817-451b-0b01-08df43e5005f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|23010399003|1800799024|921020|261026121527099003|56012099006|10067099003|261009223027099003|261102123227099003|11063799006|261021121427099003|261022075727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: liz2Gcb/JgqzdENwJhlqF5y80m3KsvmpEWRD61jZxLaJsTcffUruuPDdHTjEOSd94QagkuzJjK2S9PzBs/19esI/AUzh7GH44jPgzNrPIiZPJtfbrHOmWgwcbo5krJkqeT74R21xA94e7L7ofIamSC7jkjyQc8UCWY6DeD8w7FqhWyWjxycMg7YNjrepmMPqtgCe6QnfByeRenj4PYRbOg3Nik9ZxsC962/T8BzOBPBVM50JRLQ/notU7phbRwlF5yqI1q28UfGDebXtlugXQ+bl0XxSp4cmHrhxl1L66BTnGnImiGgI+cQQq60PIXVRkuv3Ove1i2z8AEzKX8ZDJTY4tC+GVpFlDSv6E2Dv6bJ/eSsdOAk9t12Qw7bE/Wgwue/jeeiUrXGxdFSQ1Xy6GT4ARHpFJzwhiGYBDtCd5wjNFoyDaHsrXXY4mzu4UeZM+NkLzsb4MODmW1PODbfQcQ/yDP5tcLTX71z8GflgkELbskr/H7H0A+VdOe3xJnJoC/txrbnYGWWQEuPTwf9u+ZZpkBUfeHt1wMn9rGpWRr4cPFe0EUXw67TDMXA4MCctctACbMLKuSGOlU/K2P89GTZ5ZQ0VyCC9pt+wPkuLRmz3Jh2s33AFQ/abF8yk+UyPyWkfUW+VwGcPPwKKpnwsUiEK3+nH8MXS6lOLi5nOy8C7TMiIcAvps3kNrsD97NGgliOFfhk6gwr3/+UNoqNNg1zvKr2e3tUMiUytlFGGiW0hN9FirqGkPeYbU2G+qn7m
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(23010399003)(1800799024)(921020)(261026121527099003)(56012099006)(10067099003)(261009223027099003)(261102123227099003)(11063799006)(261021121427099003)(261022075727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: s8Ws5F3BzKQhb3A+MSgiaaShys3cHsA3GBYUQ5UepLGbq2l7kGwB9ORi5pSJQx/fRrXqB7aDQjfw/D33P74FieYat0gdmG8Ox4ObCqPNkpdxLdkUOPSxuxGgx5h5siCC55PL/I05R1WLFMMSfx8Kmt3x9GNj0Tadr2cj6lLTn55UN0D6ASWKsGQzsPsqf2QVqhXcqnGYyPScHL6cDSQlajgX0GJjPV81mz7haNQ42V7xy8yYz4XdmHwaHB2Bz3OQgY7F7FDFU5r2h7/Aj2Bd3vY0BCAQ8qCDmTbMIKkmQv2Ch1MNUJXecQKzE5tANrfbRTIJgYyjGKj9jG3hCnsu351vlamA62Cosktj4TRBcSmGjA5FXpkhqNnn1l2VYED3Lvt6YN1FevCkN+UtYgBHmACfftN0L475GbKnqyrp3BrSfawIuhgAxMGh4vb1pthg
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:24:54.2244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c844035-f817-451b-0b01-08df43e5005f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000855F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_052504_538331_CA52469C 
X-CRM114-Status: GOOD (  10.68  )
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
index 487764b51667c..9a0dc52a96bc7 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -31,6 +31,7 @@
 #define IWDG_SR		0x0C /* Status Register */
 #define IWDG_WINR	0x10 /* Windows Register */
 #define IWDG_EWCR	0x14 /* Early Wake-up Register */
+#define IWDG_VERR	0x3F4 /* Version Register */
 
 /* IWDG_KR register bit mask */
 #define KR_KEY_RELOAD	0xAAAA /* reload counter enable */
@@ -54,6 +55,9 @@
 #define EWCR_EWIC	BIT(14) /* Watchdog early interrupt acknowledge */
 #define EWCR_EWIE	BIT(15) /* Watchdog early interrupt enable */
 
+/* IWDG_VERR register mask */
+#define VERR_MASK	GENMASK(7, 0)
+
 /* set timeout to 100000 us */
 #define TIMEOUT_US	100000
 #define SLEEP_US	1000
@@ -83,6 +87,7 @@ struct stm32_iwdg {
 	struct clk		*clk_lsi;
 	struct clk		*clk_pclk;
 	unsigned int		rate;
+	unsigned int		hw_version;
 	spinlock_t		lock; /* serialize IWDG_EWCR register access */
 };
 
@@ -359,6 +364,8 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
 				    1000) / wdt->rate;
 
+	wdt->hw_version = reg_read(wdt->regs, IWDG_VERR) & VERR_MASK;
+
 	watchdog_set_drvdata(wdd, wdt);
 	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
 	watchdog_init_timeout(wdd, 0, dev);
-- 
2.34.1


