Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74717606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rAE4AgEJ;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=XXaW0nCN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P/nXM10j6ULWI7FbigADtXC4dipwTIL5bgjP6+T+OZ8=; b=rAE4AgEJUWsw25
	ZsxvcYYSnXEgvqxWNeUZ9tkFp747zUejD3iBHqktTMySmgcTKZAa5UYzIHqgv/k1RuHUeKAl8A9dR
	Ic+IgAAC9ak0gCDBdWNpsXjWRkqfCAXmHUo2MptGE/i3+g+/keImv3zwGfdGnL3t8wnpaXlrie4oF
	wCBB3xWFWmOoqif5N5slCh79pI1xmi6MoG32bcrEuZRg3uY9A9xW2/P35cc+q4OADzeaBqqk+2Q64
	RnGHaACPnhLg4wb0PPl1fUlXLtDnJa+Cy0GzjL56HBopxDRmwHiZ94OpJX2NgJR67vK/wSJi05pRw
	a+4zBEGK5LivFbVlGYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqmV-00000006fWK-3tzY;
	Tue, 24 Nov 2026 13:41:59 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqmJ-00000006fQ0-0DyR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:41:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWx4xwj8kfK4tw1HfKVgtKeiyPrIx7DCejRfKY6K+qDpDAnM0V5RGwk/d5zUynlnSW/9vXmKxIGxoDLUnVPSC1Ke2zULlOaDpkbAGI/Y1XSQ96CaNUC4HZCL/aQg/AE/Q+lsfYNGVvh3M9Ppu4aYo5nER3ey1qbKrCqKsEuaORIgC6OLvLNl8iTAZYuWoaQm1FltpzQjNVnobCiIEIsazegxe2Gro4zKkLYw9lN7eWRtJybbTtXMa9HdCZGj6oH060SPZtRx/iqS064jlU3iMKVwFFzwssHc/W5HICpUj8VrngQWP9zC2QapSWFM/M81cxhZch8B1PiqL5QkNRwdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/nXM10j6ULWI7FbigADtXC4dipwTIL5bgjP6+T+OZ8=;
 b=hAHvH5aFUQNIQCK2+D9qj7uWuoO9uu1g+8nR+9Jtt7Bu2x22Piik2jH8kN8sW+5Mfg2jVVJOqifuo1WQcH0ezqA8Dq9LKRqoqj/1GlXMdcRuOtDulAMUSPoXz52iiD3gUc0AgzkDU4rVJyoYKxMzfACTDujaiTJtIflhxzB03pCCHMaIJSovLcS2r70OBPH2w9F9/Ni/4anz8cVQzUSbiVV3zUa9gjwRH48RgOjzqgjHWxnKnqORh+q0zIyvxvP7kwjObatdmo9bhICmY8Ro7I4pFrdZM7Qs2fRByoHSjZDQ1CRRAc+/9v87alxFczWHFZoS/BA22S8At+HPUI9I3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/nXM10j6ULWI7FbigADtXC4dipwTIL5bgjP6+T+OZ8=;
 b=XXaW0nCNbsqDhOwMBZzm6EbWPl3HSaVyxMth3Gkozi/h3vhTGibsE+DWTPRFoS9ZBN1lf6B9UK6x4PTAaW9UO1N7/RUzqvfoux1NR3vKv9iL2EI0T9OK0xBUAEKRW1hwk7H7ihDQXHDk9M6e/i2aOpdCKAc4BkST2YBIbgVQCzQ5W5ig0GQktIv8s4CqQivecF8/i4sfwQXsk3wqcmYNNx9GLmJmjQlVAsMVtdwWcC2MwXVWZ1Oszqp4PO0OnZVYQUBZj9hJzgo4n/d0LDb7s30SA6o6O+BrtvMgJxeLa3BEn3AL25DnauGUGmssyWINYcyifHMW17Qvdgd1esoGPQ==
Received: from AM9P195CA0017.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::22)
 by DB9PR10MB6315.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 13:41:41 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:20b:21f:cafe::16) by AM9P195CA0017.outlook.office365.com
 (2603:10a6:20b:21f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 13:41:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 13:41:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 14:42:45 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 14:41:40 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 24 Nov 2026 14:41:11 +0100
Subject: [PATCH v4 5/5] arm64: dts: st: add LTDC pixel clock mux inputs on
 stm32mp25
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-ups_mp25_clk_syscfg-v4-5-894d95dffec4@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527696; l=1087;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=4dXblQTzCZM3TRWN7qnmeHjXClFZIU+VAyWz2uAcbG0=;
 b=NcODy4kE7zj4Y3dJuNwQn3N5adofEzainjM/fYJoIqph/ovsGdbS3NG2ihqu6L/la2dj7WbHK
 urzKWzBLeFWBZMmls1xivqZ/QkjIBwWxpDGGNdiDP19QycqBP6iVjBw
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F7:EE_|DB9PR10MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: efa6e481-ebdd-4686-778c-08df4a30abde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|7416014|23010399003|1800799024|82310400026|10067099003|56012099006|11063799006|261021123027099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BJKUNTgD/fWmUs+8N0BDOKp0K5L+Kxbqwi/ToQXxHSxsptXHYq8AGYCAVtLmWaXIUhJ8iApFKWseJVIvB1Ohp6XsEt3luVpP1f1hwJmr0rW7fNHNBrdvpltLI5P1BLYQ/NRBSj2fpvswz42UT59ptsGVgjCXtFuN+5UzmBJ/yroUWjWNSaO+SbZzG6lQDIA096ogtMlp5LbMKIZTIz+ZxVdMHygCakVScLn+WOVFlPQ1xdbxEUTNKwInrnz/p40WtDIkXzdw6xwE6bukTDM6DnN03AJltXvf/wGkDQ7WOzJUjgI3WjtpzekkBTcyqfotGdNH9SeeOrqJqcfvXpbRG6ZczgO96FWBtdzaFE32jOk4FdFHiHzKypPPepGLl7LoOLXUG2rpuhWRqjyZqM9qU/pMBL/sk+gT3F2v9WwSEA3wA6E+g3FMQmZzFfbTTWoWfDK1CL+hn5ee0+RfY6G3TkHc2B4VeoXtjLxKkget7Lb4MFFED1FIziFgnJTQFjAjzJNtXbcnf3FzqmbsSEQ0qjMMjy4/gkvS2c6xGQBzGF9YrOrR5dWFPRBtII1fdqot3p0JhKAvzbC6jqcXVKmKmSid8eEfuc6X+RfcpEPaMhO0ihqH4YHuczp3cW2IEP9K4hvMcGR/zTNcwhPruXrccSXHD8088BF+kX63NGMzMGW88oNeJxZ63QGlM2HgyjNMUWJQFJFCOO8jV9OWhoxuRQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RfbmRp4gmfoEKxVI486vBgfHccs01FyG6MYFqhmAZvHevEX/kDeRLubZfCdkI4+EnEanm6LErlFvz10PSeUFmiDUiPv6GFzCkydA5dgaSOkfd3Lq6r5DQ4VPhylYoQpdhbhs6jLnh5HGuGof73U7XxxSSjMNUlKaYcj/oZ7LS5UM0Mntt4o651rsfveRgJZ1bxevuiIjhV8vYOI3iuz6TSiEc5bnLhrl+jUjR1jJlICxo7d70uq5rM+nd860uYIjvQXsLAz0A/s3Dwg8SWYyGY6jXnLRStozXw5QbGhoVChH2Ya+sHp6/HSV8+RJFkQG7nJEph6dTST2STpB+xrCAc3w21NWsw3610gFFyoRiGT9Cf3b+n96ZrAypaVdFOR2Q4/s+eeVcj99Gx3QJ+GxM3372Sdm2JiL3h0QQINupaaceVYYxrhr17426AjApA6y
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:41:41.1106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efa6e481-ebdd-4686-778c-08df4a30abde
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_054147_142652_902BC00B 
X-CRM114-Status: GOOD (  10.29  )
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
STM32MP255, which is the provider of the LTDC "ref" clock, and add its
SoC specific compatible.

The LTDC of STM32MP251 and STM32MP253 doesn't use this clock, it takes
the LTDC kernel clock directly, so their SYSCFG node is left unchanged.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp255.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index 7a598f53a2a0..4d4d100d3f89 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -40,4 +40,10 @@ venc: venc@480e0000 {
 		clocks = <&rcc CK_BUS_VENC>;
 		access-controllers = <&rifsc 90>;
 	};
-};
\ No newline at end of file
+};
+
+&syscfg {
+	compatible = "st,stm32mp255-syscfg", "st,stm32mp25-syscfg", "syscon";
+	clocks = <&rcc CK_KER_LTDC>, <&lvds>, <&clk_dsi_txbyte>;
+	clock-names = "ltdc", "lvds", "dsi";
+};

-- 
2.43.0


