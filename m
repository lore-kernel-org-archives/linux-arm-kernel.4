Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F23606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WIedO3rw;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=SzOd0eSp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Aeoj9Aug6pPFKSq+h9xfGYr15hU+9V85q5aPZ5EBX1o=; b=WIedO3rwNi3HhF
	WRl3/7T78AaXNrBQTzRxNeVyT4a0q+ev9CUMuOAfmbXGIvQHnjIvCXEv7ZIwL7hS+4mQUPlP87zfI
	LuYk63lHG39iqpCUEug0HeY4Dmu7R/RtNuK9L6MmgvSAHstg37FnfrqySHdYZAqNTQZyy58D8P3sd
	Bg1Ou7jhWLuXuxzpkpvqgx4p8ugAN9uGElx5ekqf71TsssYaDIJ0DhD27py6FOsXUp00qcnYsv3wl
	fPUotDY7C0DzaCXz2G+yBFNO+DStaKDklXdP02z/rw9ul9Qduk4bBBzClyfekT4GQEdSkncqzLe4o
	gqvuOg8Ka0xi0KK+Bzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeKg-00000008mW4-2ubW;
	Wed, 18 Nov 2026 12:00:10 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeK4-00000008mA5-1nr7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:59:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vc6psLQ7vhROudF9dUqQJi5DpSEOBGsM24zz25c/CFznrF52+hXPKJk4+Mjjq8loxHw6L0Y+3bvNMsHcJ9yRgrLR9LctxzAe9RlrptNMshZCi10XIsyL2y02XgHNbCEObwp92f3QzISx2YNtgfzOfPDZ2xco8cA6OA84FnmRnKttVsAPDDjUQ9uMDYRvVVV3HAj9Pqq8WGdfdyr89TzbXJSEZxttkopWL08p1MjNvKNy86lKUCS24SdzjxB7qhKesE6QgzI3bNo6L/sOU+fEOtDjXjKKmP9aw68s0BSYVRGPkFDVu2pBoGpzOLRSXanxuu64uiZ6ETKGR5kkjwzPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aeoj9Aug6pPFKSq+h9xfGYr15hU+9V85q5aPZ5EBX1o=;
 b=b2pVM0zKDw4VBnM+Llbg1JmT1HOBqyIRfaLWVl7IQ6DHyi36EhUB4RESsmMJgR/y8uGcdMp0WhVCpt+uXhvgYUP84i15VA/Oq5pE6Be6CaiBnlETYwMgICh9jbns5tUdchiQ2PUtEuvw8QMnCuTCwX4T2QJr5esu3LysE1LnY9tlPU0yFdog1czgZPzuytte8z3NWUuxtiHUrgHT3Gl5Jx4iXFSuzqpTuANzk+kur6gIRYByfUNe9U2HuFsAGIJOfGo8Q1TXefKCjdc/BoEqxYpmZ+wqmcynohhZh6FAbg144y7tlufPTzjuMKc4mFIg9LEHjzbZUg/+2DaCOcJMsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aeoj9Aug6pPFKSq+h9xfGYr15hU+9V85q5aPZ5EBX1o=;
 b=SzOd0eSpPOXqzWaWYGGIuJZEUoaOTuILsf06zgtmjqbA3Ap6nzBel8Y8Nah5t8gkOOJuvt3cNrePApf7WyS0DylEXRHmCWTSaElTDRTO71c9BCebbJusWKC0fVUlDH17X1sHXwaV6XSZuYLr7g/DG24Y7l4qS62a67SJ17fvrV9ObuPCjfPXtJSl6WhqS9rh/klwOedXcNjhOPP54SfSeefopopRsWZoTpL5OuHrK/hYtB2KjpEiZnw3fSQov7j+sOo8dJ0BZFhz4/B+NGpc3oI/9tS+WlbsIetT/og8OJc7YDknJ9jl/0DbrL8DgGkXs943jm24e6ANuXe4fe8nEg==
Received: from DU7P194CA0012.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::18)
 by BESPR10MB992297.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:108::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Wed, 18 Nov
 2026 11:59:25 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::30) by DU7P194CA0012.outlook.office365.com
 (2603:10a6:10:553::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 11:59:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 11:59:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:00:08 +0100
Received: from localhost (10.252.6.76) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 12:59:23 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 18 Nov 2026 12:59:09 +0100
Subject: [PATCH v3 4/6] soc: st: stm32mp2-syscfg: register the clock device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261118-ups_mp25_clk_syscfg-v3-4-935de791a4ce@foss.st.com>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, <patrick.delaunay@foss.st.com>,
	<yannick.fertre@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795003158; l=1823;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=iaeLwi56RxrXNpFucs5d1ZeU69yHZZ7NfSr4MxhSJcc=;
 b=7+5oFrkPR+6qF1xf7Jz1xdeVpvxjR4SSwxQ8qnI0Kj24ji1SC6Pue+uP/btBbrWQD90JRkZ8c
 8MLgv4b+rQPCb4YUO6u2SVX1536RcCJ+ELSPorEV7t7oMuHMMsMLgtp
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|BESPR10MB992297:EE_
X-MS-Office365-Filtering-Correlation-Id: b10e7774-45bb-4de3-9022-08df456b644c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|23010399003|82310400026|921020|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261022105027099003|261021123027099003|261021121427099003|261022075727099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zrQnPVoOM6htZmFWk5DHuqDmw3ILELNR6scM2fPUL4thdDdiW8NBap68xmE8/ybzAkhmhadwn2a4zcsa8bqY2eh9bsEZ7ge40i6Z33hA/BDbdCKJ3+UmVj8V4eYspkZ9b7wr9+rjfSHSL3teuijVNpA5NgHerQfKtBvtTFgseqMlO/q+m5fCRgNTIOG5bDMIoPlC0VoBjy49Zr/OqxKzQ68yIyAZ6OW25MlKGH7lX+pRVa4U9xP7OjRLLO2e7ovRboe5E7iIE30bbcI6/IRqWc3EAsk5FRY2P3QGWczYwsolZJC+ZkxSssUFF3FfWXKfzsxpQIHoll68A4XyX92PAFd0d3HNb5El6a8dTjs/FX6SChN4CNYHjpa4ctDA6JvgnI4OyLAEbAZC73Q/+/8a2shJeSbi9Yse7D5KDbMB/Yq9+12PTyAA7xdHwgd5hvlCf1E5+CUa6HV6H0nQaeZcuoEOV+adQVhAWlj6lHokICgwiExNIVCV/mgtsvfVthDPzMJxvqgIOL6Ho1pTrJ3b/aQwAKiQO1gYZav5JeOftjvSJNStVG14BsOutLKalgdVycoD+QjZqSbQSD5vJfxT9J9XFfyNVTBfYjrN9GVCZL5E3hG2mOv8y+imRS9dbZQs+3LXoNqmXk0A9V5gV1z46A6+QtM9h+fXnnbyTuz7S1va4mztGr5fIQcVHdlfVPP4YqO/6jg6FjOGsYBr6uDmdyZFDf9+pjSesFt8IaBcu/nUqd1iYsWadmOfXN22tk9H
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(23010399003)(82310400026)(921020)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261022105027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GRj8+mC66duE8RrB4ETqtNyvILz3QkV7i4/UyR5Dk0t6uBouTzWz6Rop9O88pTB+1MLLG0vUnE7LjdOtagGA+YXylT41Q6ZiOLjhqxZOGt8wi8weHVHnBKQd+/uIYXAahrrQnJ0o0CGhPgK7iFTGubAoXyQc+qoxJESrncVJ5Ny6kXZg/zE9L2ID6Ujh2vCyQwTYOGPF2+eBTzbSiXZpPMIb+KEM9Y+FVlD/ZdusbMWf3HmFmmN8ERB2G8b/a2XyUxX0+N2mAfRiegCJuf9Jaad38s9hRLSkDSWZADmz4ytAjvyA9GXFnjxR7Z7F/ha+IUO5HjIh3S9lHrYugISISuSxyveAdm5JpbpiJbbVjb2uEWsqceE96UQ7Y8lM7KYBntwJB65G8E8xu29z+2QuuZRG8ldFgj66eANcYKwoHcMWRO48rDszh40AnupsIdVA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:59:25.5198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b10e7774-45bb-4de3-9022-08df456b644c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB992297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_035932_479318_04ED1544 
X-CRM114-Status: GOOD (  15.33  )
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

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

The STM32MP23x and STM32MP25x SYSCFG provides the LTDC pixel clock mux,
whose driver is an auxiliary driver since the SYSCFG node is bound to
this driver.

Create the auxiliary device for the clock driver.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[gabriel.fernandez@foss.st.com: create the device on STM32MP23x too]
---
 drivers/soc/st/Kconfig           |  1 +
 drivers/soc/st/stm32mp2-syscfg.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
index db3ce8e8111f..c132a6a1334e 100644
--- a/drivers/soc/st/Kconfig
+++ b/drivers/soc/st/Kconfig
@@ -5,6 +5,7 @@ config SOC_STM32MP2
 	bool "STM32MP2 SoC family support"
 	depends on ARCH_STM32 || COMPILE_TEST
 	default ARCH_STM32 && ARM64
+	select AUXILIARY_BUS
 	select MFD_SYSCON
 	select REGMAP_MMIO
 	select SOC_BUS
diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-syscfg.c
index 0d45fdef46b7..285561fb9f17 100644
--- a/drivers/soc/st/stm32mp2-syscfg.c
+++ b/drivers/soc/st/stm32mp2-syscfg.c
@@ -3,6 +3,7 @@
  * Copyright 2026 Marek Vasut
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -51,7 +52,15 @@ static int stm32mp2_syscfg_probe(struct platform_device *pdev)
 	else if (ret)
 		return dev_err_probe(dev, ret, "failed to register the regmap\n");
 
-	return devm_of_platform_populate(dev);
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return ret;
+
+	if (!devm_auxiliary_device_create(dev, "clk", NULL))
+		return dev_err_probe(dev, -ENODEV,
+				     "failed to register the clock device\n");
+
+	return 0;
 }
 
 static const struct of_device_id stm32mp2_syscfg_ids[] = {

-- 
2.43.0


