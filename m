Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8E0606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ARL/PB8t;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=nl71Rjnx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tvHvFSBlrhl/un9dHKexf1eB1p1PyxYzF/0GBOgNslw=; b=ARL/PB8tZuECkBKcGCG2AcUmNj
	9JnZrachXpwSF5S8TqXJsXm82DD49HoLc7LRGwVqPEuykRRai+AB4hzqOZVr7CLtCmOYxntHXyloP
	6Az8HJ0EVOjzvqW5Zq1FYPdtH0S1tMYWIKpQFQxd9yWG5k9gEIehlYYfTjVHPzE3O9IZa3Vba5Zpy
	tQqMFiBnofwm0j1BBFaY2rcXybzPCkUOLYbjnjsn4uh04Gjo84nE8EqhGjF5djNVgCtKin1lD6Pfe
	sLIhME3/G66UWHDkPSaearDFMHpq6dsssTyqzMzBSWjuImg7LY8DzvQU2cErNnHXIfLBbEGg0qtlN
	o+/AsePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwiX-00000002cTf-2tfy;
	Mon, 16 Nov 2026 13:25:53 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwiN-00000002cLM-3oRG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:25:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXBX+LVrNJG3Gnybfh6gjMpJkdMl1phHN/USqmBcrGmZ4OlUSihlJVVTt+EvQs3oK8CWIJaC4wnItLTblXgY/sEeqUlQzM/BzpisdGISY91cxoODgutQM/tSZbIen5Al6kBaN5UZvbqRdtWN1aSrCHbL6GsCe79Bxxc9emXLEPzWo3g6R00wD+FMv2PCYsIsPyzvhUcePSwJaghrOfzwlyGK1v7decSXhoeBns7fANhJZOurYSqfLOlH7IRP/x4rtaedpZtPN66l5ityVQIuADviW0w6b6hxwxccUQ8AXqy6xjaCiTDsQSeSE9p8WpBOtbg6FxRwRZsFK915dAwfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvHvFSBlrhl/un9dHKexf1eB1p1PyxYzF/0GBOgNslw=;
 b=P99oJtCtxLxtIP7Z7Obbhc4y3XCbIWJo8D36UzkHV2GUvzU76d7Y8OdwCNFMdBH0m1mzQFVIdPV9fFoe+G1Rf26dEeC3otUO2NdjX+ytM13slPZ/0pjBmyNgx8XbfI+gCVyYdq9QYb+g5UA2wvoQVnkJg5wCTY7Yug5QDfLNemjKgaQkZ832U726RUFL5gRkHR09JCcE26W65GPuEZM9qY95cn3Sjzq/thrBhBbnnFhiCu2YcC42+NI/WPcOhoilYeOVTyssNAkN8N+xj9EDj07fLpY9M/ppGaVeup/k/wUqx1chMozqX6dJeJPwKBVx7/EVjd/EX9p8Iu6DjlVWJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvHvFSBlrhl/un9dHKexf1eB1p1PyxYzF/0GBOgNslw=;
 b=nl71RjnxygPdSLEE2dktAG0VzoBJYICud6A1/S7aezuZcaTQyO27TSA17oY71rp5cr2jQtq7MtwugZkzdG1/qmMaBBbghImbmCHIW28e6tJ6iankcFPxDeIfEZTUMbE6X4aOVPsz+m9I48gQHLJoxNVt0on39ijqqBmwH7zG86pnHGtx6Otpcds9dPiGASckhkvYAuJDGU+Q1RVoeZccDKX2/RcEgBMRaaMuZRoSmXyNrlMpczk3b3Hl/slCj/kezchZkbrvYxp+qs4bz01EtNlldznc1OT8jtTb4RpcW1WrAttQYb84gyaAtbIsEKM+tiUqpjGNbPrVT1SW91jJsA==
Received: from PAZP264CA0091.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fb::18)
 by DU0PR10MB5170.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:342::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 13:25:36 +0000
Received: from MI3PEPF00008558.eurprd05.prod.outlook.com
 (2603:10a6:102:1fb:cafe::19) by PAZP264CA0091.outlook.office365.com
 (2603:10a6:102:1fb::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 13:25:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008558.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 13:25:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 14:25:27 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 14:24:27 +0100
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
Subject: [PATCH v4 13/15] arm64: dts: st: add iwdg1 and iwdg2 support to stm32mp231
Date: Mon, 16 Nov 2026 14:24:14 +0100
Message-ID: <20261116132416.1184447-14-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116132416.1184447-1-antonio.borneo@foss.st.com>
References: <20261116132416.1184447-1-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008558:EE_|DU0PR10MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 13986f75-dc00-4319-e478-08df43e51736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|82310400026|1800799024|921020|10067099003|11063799006|56012099006|261026121527099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1mlLQUyDQ0RSqedxqO5n8c93EaUrWA9SWCHINFQaaD4ICxp1jnAVhXmmir0onEn6aK1Er3HJWfsypT8sPuuruxi7C/WcnvCSE7w7SQR7n+lZujVQrlM4srTzM6gieHHGOIXlHQEeE4p3m7dCeIb9bJSsBpEPMWBNbSvYW3LpNk4Q1MmkBYykE8o4HU0n1t+4ApMO6Rlx8p6EacEkYLgVnMRZfZ8G+fHlGewiTnjKfnh2Z3rg4QozjIAtoae/kZoYwAyX0YRTA/oXV/7fix65JO4BOrOfuqV9ecTRMRkjR9zqoOhOyTrVj0QxV6u68ItK7COL1s2ZvDtGtt8voPxGGv1GLTgKBMDR2JMVCIHATi7WnYgNYhB1V6HKQz8QpbgDMU+HkZw9/90F4jFzlfNrsp4ibHc95+Dz1/oMy5rtZ/Nq3WLLjsViCA4NCnhAczktGe+I9NqB8uhWxDKS2xHm5BC6geJrok5GOXzjtrS5cXaY46zo0t8zqOH1hIte1r0dGFKlTBeTRPMlg9buLEeGsWBHJNIR7oIeqnufrf/HEmLgrscgvIqYz+Jqrz6sqyR+KcDr47S9DitHCz8P5eH/rN3gMJKqySE/gMbYsxlAEAlJfEwvs06aR8R9BT2eLnHLnw/kcq9wmCt4qqUYcsDmqXV+SJnqApBYwlii5X/aqnHmuYEFKxzq/tKDQol/B61J0Qyk+v4KAfVKLbV8wuLOasXTr8rCFOaeF8QU0Emvrzl4fph7mg0wraQLYeTVaynv
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(82310400026)(1800799024)(921020)(10067099003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oI3QhDFAx3QljlWEnbhIZ4vvyNf4j+KOjB+VcUMmRdS3SUesv73x1FuF5TK7Em8WLyKYgHBYSYHx8BedE5jnru/u4XH0c3kLZHh/KYUPxzItpzCHh5RYnYa0AAorFxhX+cSicqu8/WBcaAJBZx9BTiiLYqJ2y686S5EUHcBPMAA6u5e5nP0JudF6ywNoTNUAlY4r6GpfwgKYZJYEAznzQHjO5vAsN1nPqwQnxVx+MMNgriI2gQ5/+TgIEwo62AcLSc5UniISSuYD3nHcdTYbQE0WkxRleslSV54X65QS5/u/jTxi3rWT0XLlJLANw4lg/5WzD7E3K2Y5t/IFTFx7BFdk+MwYqfK8cm1xb2eUYAPpPkYY6AAfD37rUSmtjih2XB5puKGSYQ/Y0Cuc7E5sJwPWK8WjRdTj5tjCHKJhgf3xYOv0BxCMGJkeWY9ltueH
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:25:32.5455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13986f75-dc00-4319-e478-08df43e51736
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008558.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_052543_975873_B3923D3D 
X-CRM114-Status: UNSURE (   9.43  )
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


