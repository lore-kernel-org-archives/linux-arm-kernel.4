Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813CB606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hv7MJAgh;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=G2MOSQuP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+/91Y5fguaLopYroiSlEK7CH7r/H9L4xjLPB5SVLcSA=; b=hv7MJAgh2do7ts
	SVTzv14jziNvJkmhmANzTG6RfTPM1drKQfH0Lb4QOlD03aeiPHwkRbgWBsyxPEeIa5NG/cDEwAVmR
	E10whOzPSbjJVm/FEb1HdhX/tb8sNLUziVyYB9baUZtuRmNVNeQDlUbo2NJrAzlNFNSj8eY1Fgl6+
	DpD+/aIodBDwF7OV2UBMmqYqOazCaULmde6cGX81Q64OGti6THe8VauXt6B8/oezoOqlGyQQl+beH
	dEbUs/1eGoItkVCyY8VJBXRN2k8fIY/QGbAmiNKK8T+FVGscKkIcc1MlZLqSWjym5LbF8anSicxLS
	nGIaLx4Wra2ejWDVeRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqmW-00000006fWl-10Sv;
	Tue, 24 Nov 2026 13:42:00 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqmJ-00000006fPV-0m8v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:41:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgHqAATazvQQr3HMCRk8LJ7g3YVVfcqrjh4AueqSiM+IQhiDXdyTB83/S4mpzuI4013NUtdZuJgpVK9L8caQN4zjZdwwmsJ7rjRaJTgLBhRmbSi1GO0TAvKeCzJIgf2vH4QTJ4oOAIYn0PEKiO8WxWDGtzYY5GQCYOrH0US329ePuWzUBLMcIERVIdcJZm416D+IdYs8nKzDWrwSAd9VW4yvOfgEL0QqfvGjCfdHwrdJR9/QpRIeN6j2ir9bQmvqJJzXbz/vz5P0vqK+cxd/T5xpZCaxi+dMUHlD+KXFms5o4in4VV7WTs8fAtrdrLhJCP8s5AhBr7/sXFKJL1KMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/91Y5fguaLopYroiSlEK7CH7r/H9L4xjLPB5SVLcSA=;
 b=iHwKG9H2+DZ2GaEvnadaGlRYFC3QN/2czUUeexsCcf4uVmD1iAcNfNyxfteifpRtjj4Yd79bFRN6yWb9qPhSgKsOFGcFEVPbMFJlOQTNMu4AFfKMBnAMbuxBUVkT1zc5Ut9DTRThKFoDIRSBpn6pkibb+mXxJvQ9fbWANx3BaFVJfGshUfcclvRjyzGCRxqX9CSkkaa1lM1Z7Ouv60+nosymPThW7WHDRSGXI/QF/RXdGzIZ/HsACKHXmGlWs6yGNTxyivCocqmmFFfRK6AVuHWMMN6dRpY07TCwcS2E77lDurCki/hlTO/ImULjCCBKS6CK7wDcWmObLytlY4cs5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/91Y5fguaLopYroiSlEK7CH7r/H9L4xjLPB5SVLcSA=;
 b=G2MOSQuPB8q0/pxAqGWZ/3Y28LjKlg6l2WKwn56OjIFP2iZuXB9/pGeijVSVBvHt/PptV7UA5+zyIbdMe280V91RjQ/E+W6I8UDnyZAXBETHsFftL0C9uIpZJysNCZ4IUtOsGgRMUBh9bHPboMt1V8jEeDQj5JjMGWJs/bekTAysZ2w9ETMkoy096un1xq+8OwYaRCxHlht0isYa0t/Xffk3/T/tqVrvplFxDywzVR0KHhB7ihB3i5U2dd6g+kQ4ZgiAUuXyJAKcYvAIhdO9AqhtXBFUqSN36YTctEO9ICgIM3KsCwmFrNfKSGqdyVzP7h8WU9otXxJSsZMFQvwssg==
Received: from AS4P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::18)
 by AM0PR10MB9623.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:73e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 13:41:39 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::7f) by AS4P195CA0012.outlook.office365.com
 (2603:10a6:20b:5e2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 13:41:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 13:41:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 14:42:44 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 14:41:38 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 24 Nov 2026 14:41:09 +0100
Subject: [PATCH v4 3/5] soc: st: stm32mp2-syscfg: register the clock device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-ups_mp25_clk_syscfg-v4-3-894d95dffec4@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527696; l=1893;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=tNrscNAoEj1P9e2hgIBXvrrKqfLmrSbQXWsp8KXf6EU=;
 b=NuMZpTkBsnBQy13Fc3RnFHP4Nnz5NWO9LpOiDVxMEDI69JZiIK2kLqiSKqkG5juq1QZskhgVt
 3T6Xc1GpR/qAkIeavN04ZB2xhqyLqhHa67x5/P0+1cwnY6n4amdh5Ob
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|AM0PR10MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 3228bdfb-6fee-425f-0f47-08df4a30aadd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|261021121427099003|261022105027099003|261021123027099003|261022075727099003|261028144727099003|261102123227099003|261026140227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DJrBwt9rlPu8mDqFQvq5TRKguRHl2clHYxuLgixc7AW4jfjQMUuHSviYv3tBLf+PPXCr6N+hENbi9rRM+8XEyqXK+sTtH1MTcRDXYxdeddTLhpI7Mh/nkEak+Koqbqc4sw+NQlMvCYZBvyFnlZf9le9JtFTc8bmizHtPzylDs1dw36RIUOx/MuzeXpct+uCmU4+xoiooIJlZ45lKgtkeFjSbm3UlNHgQWz6p7qu/mU4K9U4EHyCPvN6rg3yDTwqh5SIvHBHOAgWeGqxL4CLpLexgCQQdOiSEAfEgc6mmEbf8IpdZSCktdoh67BhZ/bYJEp8LmVx0k2KZ4oMLc2JWknwh7PpbQo0apvQbgPtpZ34EAT196mi+RGp53kkCIPfnresWcZmy3l3ppzWigNFu0O7Ver/JYCI8seFiGfWtMWNS1ihi1JaIt4MNpf21nAYFsP3RL91iGICWfJzb8MXuhqTJe2C0fNbYhAi5H7C60eJLUhxJxm5pLjAggcYEqINByej4Ef5BpSFoMYfWUjiz1X22J4AGAzkgtD6rRMS1iWBmFOT1qCBJj0L5/tw3imVPXRxB2Fwl30A5MCqNeePDE+E1NFIPgVWVo1/9wcp/iVi1QS+NsNbH4FPNl1zf/Qd5q3WIcNQj+vW6aWa9k4cx2RE758CIRMoOS7oEeH7fJUbE29AjxnZ2wiGothEnRGpH3H0ysquu/DirmRFmKXiH3Q==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261026140227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +37BLbgUrzO07RfsEMkuZAj4VE2ZdSdMXFYs+ykQFNroCJKphOSyRBMkq0r6EFcLoUc8Esj8562zuFSTvMiKmApnTFE5ATAAWY+RHV26NWj6TtDDkkbSdnXgANb6IFAuKCbwt7zpzG7dZA9P9I4MmuvhVLZdsJJ0Erpk2rx4WFigCfLWiokazwczir0J7Q0Bx1bhIwC7i076e/YAzqtWB7qwgjkYZjBu/r/Fe1g7frOT3x6dP9VWKPfOkmPlz444kavNzC1b5r0wZdTUPKGVtw5N0L0qnaOCghs6oxzY7C7XExYyxs0yZETpxxmL6JvVDezUBl2B8CNvfSOlAmzBb96Nn7r0cyPkzCtwr6yIizl1fIU/QiyZmM8JCXf3LcCWLVvDKKI3e0gNhEIl/iMwZYVqj2HPELjZYBJj4YCj5AY/q3E2LoHr4rayVBmmCsoh
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:41:39.4215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3228bdfb-6fee-425f-0f47-08df4a30aadd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB9623
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_054147_277694_7AB64E23 
X-CRM114-Status: GOOD (  15.75  )
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
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/soc/st/Kconfig           |  1 +
 drivers/soc/st/stm32mp2-syscfg.c | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
index 2a9d6a77be45..62bbe8c63238 100644
--- a/drivers/soc/st/Kconfig
+++ b/drivers/soc/st/Kconfig
@@ -5,6 +5,7 @@ config SOC_STM32MP2
 	tristate "STM32MP2 SoC family support"
 	depends on ARCH_STM32 || COMPILE_TEST
 	default ARCH_STM32 && ARM64
+	select AUXILIARY_BUS
 	select SOC_BUS
 	help
 	  If you say yes here, you get support for the ST STM32MP2 family
diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-syscfg.c
index 770321a4a6f7..1160b65d3dde 100644
--- a/drivers/soc/st/stm32mp2-syscfg.c
+++ b/drivers/soc/st/stm32mp2-syscfg.c
@@ -3,13 +3,25 @@
  * Copyright 2026 Marek Vasut
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
 static int stm32mp2_syscfg_probe(struct platform_device *pdev)
 {
-	return devm_of_platform_populate(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	int ret;
+
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


