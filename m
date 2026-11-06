Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A268606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wLc9GfTo;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=QbTRfGRz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tvHvFSBlrhl/un9dHKexf1eB1p1PyxYzF/0GBOgNslw=; b=wLc9GfToCtBTzE1lu9MxC8sGFh
	QREfiddXGCloVxNaThyIdrenJiP0L2X3zL6ukV92q91qv4g+NSQEXRrNM9eKPH+9rd93FNdPW0rcB
	YBejeWE8FRGkfg2hXkKtvcOHBOP6G9SDv/X3ty98lSSjEkV0VmckBh0aLT1CFgLTHFYp9tVLpRo+M
	NI+W/bQFk5OqdE93MLeKkRMVlqDKhOQ9vdWKcJ2qli7W9TygjFRpwR7/Oh7AEUJdG2pRI3tleBHIO
	IH4d3zzgplKj3Ed/cpduJKMtYVAKNgiIvqIp7dZV7dRacYT62xhrxz8k/kOzN4e3/XOebSt3y8n8i
	JVqgq5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMuE-0000000D58e-1pbr;
	Fri, 06 Nov 2026 16:35:10 +0000
Received: from mail-francesouthazon11011023.outbound.protection.outlook.com ([40.107.130.23] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMtr-0000000D4YD-397T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:34:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EaqD8qCpIRcbP/Nb+f84t6nzzp5KKbnU1Sz8qjzkZkmJOzfuDTFeGE99kmnQpsoSY2OyT1/HlhpxACQdiY6UwI6ZBs5CeU5zFLM+7E0OotQuSrtQBCqE3YitIZ7ZnFKVUnTrxgqQb1boMbgFNHgOZkFSzjwXY1bsfAfwFaRD/c0LqpywCu615OH41E8IxhAdEYD2gfGZzxSDwbqk+kz48StoahwKuyX8/D0TWuF5rULzWd1SXH7OtOtHnDiZgbdmSb40CkKUCwsT8LDhiK/KcdH+gLbvnvia1vUoJbSqg4+/KpF7PBx3SQa67asSo7B0OQD2l5d8kAncOOGElIiPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvHvFSBlrhl/un9dHKexf1eB1p1PyxYzF/0GBOgNslw=;
 b=BXXQCCj7/yTl9svhmgqoZkCIhPvDVnjPpugnX/RWPyDHoA61784Ary8Wxmqdze3mih7bPf4qo97qebXeT6ubVTbrjivHuuhmKk3y0gvNjmk6ps2mb5fqwSCPAgMsAHvAaGX5T7tEcXzqSf6oQQmgR+DYv31T2AaAnmmV4OcAv1x0WkTFRYUpq7tNrkAGlD93w9Iyq7kwfcbZ4owavt2HmR2pc3zHlspyfgL/vgVxr4dd/1T9lLPE6URCsAIzBzaj29e+aJ9/cOgdTVDs0kM76n55/432R7D7SXxeqvcXrZ8YW/yRPDndaC8AnyVKOZ2iWbs/ULvZxbzyEHT9ZlnlgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvHvFSBlrhl/un9dHKexf1eB1p1PyxYzF/0GBOgNslw=;
 b=QbTRfGRz3kSHnJv4pVO3sulzPnIqYcHahpmZu+7BEKHtpg3RXIBlydgzSSOdOdmXgJsBHSsIF73k09mYPMxm53GOO88o/gq5IrZ5MDoNhm7TyQ5utq0LeSOdgsbLxGUQohg3MxiBCDPUCBxlW2pi7BvIF2CkCYZWp1tpQefX1m+UAV3+lT9BZ/uCi712LY9UjM0wV5jGsYpJ73Jecw04xtGevIuuCYNtCfmkQYfrsBDqnDmUjnqJDO33MSbZCmQxuycWAddqbVYdxwFJUSkUZwor9cMdUfHMfU1QGnVu9zhabcIm0evHzoTz9zELJ4ITo67jz3dONxS5aIgA26nMlg==
Received: from DUZP191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::18)
 by WA4PR10MB866235.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:1d0:30::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 16:34:41 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::9) by DUZP191CA0058.outlook.office365.com
 (2603:10a6:10:4fa::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:34:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:34:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:35:10 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:34:40 +0100
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
Subject: [PATCH v3 11/13] arm64: dts: st: add iwdg1 and iwdg2 support to stm32mp231
Date: Fri, 6 Nov 2026 17:34:27 +0100
Message-ID: <20261106163429.618392-12-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|WA4PR10MB866235:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a74efaa-c526-4148-f648-08df3c23db59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|36860700016|82310400026|921020|11063799006|56012099006|261021121427099003|261009223027099003|261026121527099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mdM69HFUF7+9bdy3UlC/GqaBojhoyJYuTUQ46un16w+SQA5DMBG/eDB2BU9bwVh/+XmJYVf2oY35t2cvf2Ox6xFRiV6CBnvFDcJyV/P+707ii05TQEZ2ONYih1g3wSv9IBR9S6kAA0/f7VCPPV4ZcYlaHNLaKODbiGCcjX10Z9t0p7go+f5qulGrlT0iOODd+V2MhPD6Pz36mrzsjw+8/kg+16SWKXj/vbgiCx9g+KNVS3fwAvPpeeURNXZgAjgtIkQzWP9bpr1ZxnazjpNXZyHp8pONIXRirEHjpIVgoYk6s5CQvOzGv8++0goILfcuTyRw5p2nbTLd0f1H95zY1lO9D42/OZQJMPYyeYddUOtAVZH4htBpkB9f7Moa4BLL2GybVNzrbMObteuLEQruOQZou9d44AEQIH2zqgh+u9WDucqtne3Ow+ViKpk+CNXcLdlje75U7Vvg/5oCD/Q5heTcLc08r8Me4WwkAcIITB5iGyXXL+V53ABNQ7I/iAtQxbXgTYI/L5cSMQJQ0Q+ZGarcxpE+5AlE7fPv02d1wxvaMeA572uCEuh6B3VeMfxy+g1gwX58d1ecZ1DkTc1GWcfKUm2ltyssCsQDR+tnFFUbSHLDdVJ2Hpk2KgC0PT36HJ3CEUeymQPOOiUBg4UppmyTNiN0DXxkoGpYSryC+A4upye/QFT+iUBfqZkqCKa+GRNMjEYU/EoZClkDOk2gkDQXe197dAl/wcqX0p3XICGgmCP11j2lnBU3ZwOAQJV5
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(36860700016)(82310400026)(921020)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261026121527099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aYhh6fv71JRnNkN9mXVoimDan5cywRigxNiiuKFjYzeLhLXUVFIYfvVqRZMYMbiNGgf4lXuNoyWNXtDTY8+TMdNir3ExE0Gm+3iB9D4o+W1mqVNNsy+TUsTEBIff3jzbA55khlgyw7svyLtdoYiFDWFjQx0MmIwVDQoyuYZSnNXz8riD91KPWS2scPNzA95ixZxEmyIYDMfHai/WvNgnZEBr6HwcDY6ZHb9sA7G3BbDlzQ69k7SbbBDDwq6uWDliR8XhRUKSuFB6RPa5q/ZF2usPVaHUsYaTO0LU+Tzf4ZhZZ/8XR9q8qxgYjiEL2ZqwVZU1fGVOz8CR/gI7eNWluNFI355MslyNL0wdvsmZjSThlh9591xd1oOF3FVBTQu4RET8hFvwlVSrT5raop0/3HdGqDKvN01pV9TKEwx8CVHd1PSZdcfO7NR3FyCZLErY
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:34:41.0426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a74efaa-c526-4148-f648-08df3c23db59
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR10MB866235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_083447_819761_B0E4F60B 
X-CRM114-Status: UNSURE (   9.71  )
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

Add the watchdog nodes to the SoC device tree.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f1537..db19429896eb3 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -724,6 +724,26 @@ rng: rng@42020000 {
 				status = "disabled";
 			};
 
+			iwdg1: watchdog@44010000 {
+				compatible = "st,stm32mp1-iwdg";
+				reg = <0x44010000 0x400>;
+				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_BUS_IWDG1>, <&scmi_clk CK_SCMI_LSI>;
+				clock-names = "pclk", "lsi";
+				access-controllers = <&rifsc 98>;
+				status = "disabled";
+			};
+
+			iwdg2: watchdog@44020000 {
+				compatible = "st,stm32mp1-iwdg";
+				reg = <0x44020000 0x400>;
+				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_BUS_IWDG2>, <&scmi_clk CK_SCMI_LSI>;
+				clock-names = "pclk", "lsi";
+				access-controllers = <&rifsc 99>;
+				status = "disabled";
+			};
+
 			spi8: spi@46020000 {
 				compatible = "st,stm32mp25-spi";
 				reg = <0x46020000 0x400>;
-- 
2.34.1


