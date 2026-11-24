Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA4F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d3hllKzC;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=OPQAyy2H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n4ZcNSZZ+ZHC7kjS1bKwGpzMqH1dQku8KSwO4y3uMZ0=; b=d3hllKzChh42O0
	feNxCzZUG7Sa92PLgXYfgHNb1dQpEb+CiW1tvKOT9uuO58+AeAuxQZ0SmhwXn4Al5TuDsb37pFqvH
	Xll8TvsFy/AOHu7y8aUFIIupsehpssCoXTjXAuHaoy+rGZXws7+PWHgOF5cdxKKOn5565fe7Wq0qW
	xt0bTuh8cIwmR3x9If0/tSjZXABsg/7IauVPsL1L/JzD02FTXjDDnptO4XGyVdn7ivzMN589JrxTn
	qegs6LIl0KD7L101ch/yisu8hY5OxuqSHjVaBstsHm382QNu8+N5gPi3jL1MenIj4zoU4dzT6+eXf
	4H+lci4Gm+6OPzFP6s6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqmW-00000006fWy-1fO1;
	Tue, 24 Nov 2026 13:42:00 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqmJ-00000006fPj-2wIz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:41:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTMy4N/cVD3FTRTYo/77j5rM2xFZtnKsUgCErlPTKvyuFgsIxrf/vdqlGzpj6t6RzO7ic6TJ6ab6mUidmeNNOGhUsSnnkG1ocZtZ4GguTiWGDc42iyqLi5/Ol+JeYRLZF43GtLuCW7p2vHmeHjQ3pZ+ouFOuO2H4fEjVX4QBebDkTVrGWnCOHf7aUaz84TOGDYQzKujO3BgMYeQVUoI+lSUBIDSMBULMkP4/3SsLV2kTkYvMiMiZehNwzXBClFb977J4M+qGvyq0e6R/XrMrMttA1a2Hi3+FARioRm6bjM4KUNyp/hcxTXQ57DHOqxTSxDOnTlWUqOeSzGDmA57zVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4ZcNSZZ+ZHC7kjS1bKwGpzMqH1dQku8KSwO4y3uMZ0=;
 b=aJgpM0j8WOV+CX4+/y7I7eWm4F+TCcPoLG105VNDwf87pwzuIVGRU3NyZFaFOHISo4qhKt77POXFwUfXMs6r2W6QX+bUyBVfYswm6gt5Wsv5Bsm/UDn7hswXQTlolTGq6vTCkb2aWzLEaoCC4cFNp4wQnsIeiSmzAlYIQFwUOcZK96ZcUWVA82060heOBjgdooY9BfYgbfSQgqFlfIVPqrHK76lYhYZpVBlPCLaT2tIMnwVlmUtq+Ggxla3GFTJeL6G1mX4vM3rDugLn38mHqq9sSZCvAOR9AO8kBGOuJ44n30a34nRKpHoPGbg8L30Z3+FO4SOsCrHEMiJhPcMWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4ZcNSZZ+ZHC7kjS1bKwGpzMqH1dQku8KSwO4y3uMZ0=;
 b=OPQAyy2HcFHk8ORjSBZYZrT7zKv82DgFLUOQk6QErnGNtyH9vzAs/qm1Vcn3Cjmb2+qKMaFS0CYxURJRB9PJGTJY6dOkqpSWxV7ihfQXRLHVAs+jJ8S3qPSBvERjtsN2ca7wbmmlkiXDRjzZiX0bcbfOuurHjpvFXTUukln5gJ0O7Iot2hQHYE5vnHWxXhwM20AWNVpsxgsyJ05Gn8qij+RkKJgxuN5L423rGvJGgN1O/nUh7RWsE4FD9v+gWU6cYBPMjIDQKAUoq1eCPQ2YTgv6hoPrmo5jNYLvUl0OiiwUKkJngbIuneH9x46N9AbihknTDVa3c5dMxdB/E96OcA==
Received: from MI1P293CA0012.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::10) by
 AM8PR10MB4067.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 13:41:42 +0000
Received: from MI3PEPF00008557.eurprd05.prod.outlook.com
 (2603:10a6:290:2:cafe::ac) by MI1P293CA0012.outlook.office365.com
 (2603:10a6:290:2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 13:41:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008557.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 13:41:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 14:42:28 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 14:41:39 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 24 Nov 2026 14:41:10 +0100
Subject: [PATCH v4 4/5] arm64: dts: st: add LTDC pixel clock mux inputs on
 stm32mp23
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-ups_mp25_clk_syscfg-v4-4-894d95dffec4@foss.st.com>
References: <20261124-ups_mp25_clk_syscfg-v4-0-894d95dffec4@foss.st.com>
In-Reply-To: <20261124-ups_mp25_clk_syscfg-v4-0-894d95dffec4@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527696; l=1002;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=YsVNqGbaHgcJ83NvIulPIre68SF+ZafNcCi3g8tMny4=;
 b=YBRPtvhiJaoOVZSQtNgF1zsi8E8rezflNYhzW6IjdWPhGH/sy9+uRweM7whE6z74NARfWdvYN
 xff981w74xlCeyDh6v0j+F70Da1makOsO3lDGBaW7YQBwh908lmvt+u
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008557:EE_|AM8PR10MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3e4474-2bfd-4bc3-12eb-08df4a30ac35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|10067099003|11063799006|56012099006|261021121427099003|261009223027099003|261026121527099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JJfE3sd+4uLQjjpmeryDRtbDBdwHA1OOKRl+zaqTokA2nVn0hvrsZbR4SzGIf3Hm6dqZiel9mWxaQrU+GKuzvyBTD6C30b6b4Us4f0hlZEYEbqpi/ZUXd/CJtR1FeSHCZmYNIxzEluvdWz8qjEbYSMZMUQfoP3GwTNv1OHSn1UFbV0q8m//BVTdhuRg6NpOXCyDs4nJyqb5Lm6/yMBY99FW21fjHDP1NWt5NlYIrYfmvLob9d7ApIjIVw5SrT7ygTHjPseUgc5uYnrjHZoNDOz+VsyaqxfbosdNTM8zP0qnneCdYv/8SWxCg++mOVbM9FmR0rJlYDs1nCsmmoV6JBArTcfYBaDijGRhtBpH59xEfi7QGNexoPAAJFBb4lxUtFLtjZm7dX1MAo9OTdw+3olPU4ZJ2mlOGr11FCqQhSC8HGvZmFqQYGULFiMOBGDYwCZuQjPqi8mV3rqI3THo0sKiO86O6yiVF91XkffFFkKILimaWDBk9NUWmdkU/6fXLJm00iyaV/d0sDnDp7meuC0wIm5qQsmagTAeWk50+1DT9yNb3yG5GdQGrpDazA9CQWAunQG8SgwtsS5YaSofacryTjwXGTkV17rtMWd6T4ZTXuv0hiCdsSNg03INXNtpSCzIkzUPz+qAht58i4ujvi7qkfZraPoNh0Oe+8FKVSr3hLUvE79ljFrPRRgJv8tXibsRxOobKOFal1RSSZL7MiQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k8PuFTuTEMk0WqjgDSnJBEBdiHF7VoG/TbvTTMRl+RxfYQUuDqGEJoJXGXeCrC7fbH7qqlvTPNWzK7QSU8vVelQL5E1Bxny9XJHnl1G01S/DfYYMwEf92FLpft1RpsIySDhdx6UKj2ztg3XklqbQ2ByzVcZl7ROKzdwsyVlpI+f5uOAUBjv54YCpmKt7hbKYeTr6t48ahWJsxaZrhbGr1rm6/RK+Q5TPGC7p8Z58qeGOj4UuKNq0bFf056IqrZdnLpAEcIXGmsdZhjjwMEGTlds5lO/D1Sryin/R8EoJ1JK0N3pJY+jUEzTjWXZumwROuWIQiWompjQ1xaDifLctJ1IErCPlGEvS1BqqNAiCTual8TBQjDa+KK3qbDmAV44P8uU9+5Me+x0a6v1mGg0RqCIBWQZIfM708/FZqyHGn6OggR9HLz0bLwHVmZ4Vx/2B
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:41:41.7318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3e4474-2bfd-4bc3-12eb-08df4a30ac35
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008557.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_054147_743837_25C7E1D8 
X-CRM114-Status: UNSURE (   9.07  )
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

Describe the inputs of the LTDC pixel clock mux in the SYSCFG node of
STM32MP235, which is the provider of the LTDC "ref" clock, and add its
SoC specific compatible.

The LTDC of STM32MP231 and STM32MP233 doesn't use this clock, it takes
the LTDC kernel clock directly, so their SYSCFG node is left unchanged.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp235.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp235.dtsi b/arch/arm64/boot/dts/st/stm32mp235.dtsi
index 7a87c344a4fe..a3423c247df5 100644
--- a/arch/arm64/boot/dts/st/stm32mp235.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp235.dtsi
@@ -32,3 +32,9 @@ vdec: vdec@480d0000 {
 		access-controllers = <&rifsc 89>;
 	};
 };
+
+&syscfg {
+	compatible = "st,stm32mp235-syscfg", "st,stm32mp23-syscfg", "syscon";
+	clocks = <&rcc CK_KER_LTDC>, <&lvds>, <&clk_dsi_txbyte>;
+	clock-names = "ltdc", "lvds", "dsi";
+};

-- 
2.43.0


