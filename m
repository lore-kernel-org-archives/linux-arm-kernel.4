Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBFD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SzOCsb36;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Jy8d/FKu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=08MzTx5X/iowrnK9g17kfK/ztUokokZyxvz2Psh3IJQ=; b=SzOCsb36a6pFZY
	bHEilpcxwBimhDZzqjIEb4XSrd/i9hhdfGhbnxslx3mpn/4mubWRcxjh6bLWKK2HcWvdZF1lDLqyO
	qSNWcLoSwyCAzWhrBBtLreqOC+7DSX+y+ux0IB/PoeggIha+l60BoM+JIOXtj4theeF3OcUidPLCm
	BfRNiUEotahfeSiSyjq4zcOSKJwrtatOAWHg2K7PAMOcyEXqprLkQh8lsNC773aAKyEhxV6ZYZuaH
	DRkn1FFu4juhCl1W5Aq0R43yz1ow7mfBmX4Xm4DcMpGsqJOW1BRItro7/E2Wgw3xsFoltEsuMT+sa
	Ml3i80WY4hWWXUimr/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqmV-00000006fWC-294e;
	Tue, 24 Nov 2026 13:41:59 +0000
Received: from mail-westeuropeazon11011059.outbound.protection.outlook.com ([52.101.70.59] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqmI-00000006fPT-3GCq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:41:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRDNXNybPP7bEjvItIdrKdRX0fBPG04Kh1+lxkeqVZV3I3aLDr4m91/9zcXHOi9y9A8tR5yD6myhynjnwCLfgN+3a0BPRQ2UMNcTwzieUcTRwQFPaA5cZBSjGY3uteSEnt7lnQar2eLPofYG3KmOg9pPzSasirpvop0DylyBATHEGypvurjwzQvbpyszWR/2qsWJSAwxtWcVnD4VfzF79OMIAeRlcRa3vUTRU77l61l+5Jc4kW11v+hHHBwmSiKljwfIrS4nILpxZ+mFkvPYCWcDENT/ZfV7XTsiEF2MGKv2QKFJk+J8J3+glVR1+SfgIt/O+H10YEKMJ6zQ4eaFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08MzTx5X/iowrnK9g17kfK/ztUokokZyxvz2Psh3IJQ=;
 b=W2hvJPp9nFaVHuMBzKBcUrTr3Sd/09rh7IkTUm/WPP7gFb5Lip2Xm3EDMi2ef+HiO4cgKvXbSpdeEd45wdGkWUxY41sF9/I+50ud2Bvzmpe2D4MHEujmrPYs8tqamliIb5TgeNSXiGwAGzsEWIyf+UOxdZHhu9PDjzmJjO90/0T2vHESyAkR7MlyEs1kqPLCJb66FaIgn3QTYt4bZ+VaeeqHxciHWGia0hsEY2AkF3ku4CUzquWV2DBk68z0Hpfm9cZZhjmM5LegSmp2mMIQD9PZHQ7lUjLoiq5NsuiVue1WbIxi7tN6GfHy9surC3ujS35wKCAtfxwzm9Z/THWRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08MzTx5X/iowrnK9g17kfK/ztUokokZyxvz2Psh3IJQ=;
 b=Jy8d/FKumMypSkVl9aZ2ZmRVIyew8t2NTMG4KWHgoNz7R9rbnXHmMqn5ffPEdKRBABuaaoUbJe+QejmZ3XZFhlw7OLFXQg85KnauHVM7iNYhE9daGG5cRoJ8WVicIUy5Z0z+0bG/hNadO+WKxGCh8CEtQWqmuPe7X2VhDlkfAbUJNU5Ncu03kPUyv15WzgcUyMD9OE3r3HQUDT5KZLP8DhmX8Rb7smk6xxZ+kX5u8k2yJc9R3VDZGzvp14cNd84AzQB+v3qigOqIIp8C+Eb+pqKX9lYW7vN8jXi1X4b6Ka80JzNDt2zKnPKRstKryzYBBDXjnBeMEBfudeEdRnL5Zw==
Received: from AS4P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::18)
 by MI9PR10MB992257.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:ce::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 13:41:39 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::20) by AS4P195CA0012.outlook.office365.com
 (2603:10a6:20b:5e2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 13:41:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 13:41:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 14:42:42 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 14:41:37 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 24 Nov 2026 14:41:07 +0100
Subject: [PATCH v4 1/5] dt-bindings: arm: stm32: Add clock inputs to
 STM32MP2 SYSCFG
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-ups_mp25_clk_syscfg-v4-1-894d95dffec4@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527696; l=3211;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=+ZlgxL749Bm9ez3tJRHBFvNdUqQAD5PgPBgRy9KKboA=;
 b=26/xXb7Pzcb1qG24ufZSywfjYdKF2uDIJeqp8kTHf7EKZObZQ60b5i8vn9k/aB2S1O0AwTB33
 lOO3vmDRQj5Aa5GuL4o6sW6j0/3mn4Ho3XzBRaE9svCJSlgsJwDWgsU
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|MI9PR10MB992257:EE_
X-MS-Office365-Filtering-Correlation-Id: fe63b41e-a376-42df-9594-08df4a30aa40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|23010399003|22082099003|18002099003|261026140227099003|56012099006|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|261026121527099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: uARhekjMHJls6WqB2Zqvsho+Hxuy9uJZp9bznXy09q4dqC4Ge+9fasgbSVFKziS/IGm6AwfTEOqhyn9CoIFIzcs1cPg0NAW1s0Bh3nmVyjvfWq1O5PJe4zi7FMISd2l27Rk2BK/5vrnrCWTNoMbFbuTRCklFOaAhY/fhbgVo7vUSV71M4seAh8efkN2GZ+Ki7Jr3r9FeYZAQBvXDvbC6jalUbYu9ffef0D1OLi4o8MVIFPtlRKNLhBANfguRn3SK0oQRP0KiNflGeApKQzoD6xwId3dNM4Tdou2gfC+QF4vtkvMD506U/t77CUcm/K4ImZcrOuGuqFEBCyiHDIdLc6camyGhNWEi1cq1/kxR6bH1lhs0GtADGk5d/E/PNISZh2cjlZAh/gBrDris4WbvMI96iT3xCS43GRwjzBlpcKXHgRDrNJ3qtlICo/4mx5zdEC0VyGt61RMKyg+340iQODSht9vxc4ZBexie50L3HlDFUuvWQn+aAeDAbcRDMmHiEZKpd/M4rrGV5Z1q0rCfoflZElIIBVQRhTusndo6E327EGWbmXUDFoiFAguhAh0J2RgxX1GqmrhJGB+yK0WDCFJBfm7gf6G+xJrnnNoLTlGgpLw+AG7MCKIRPHIkmjQbRuYHsaTsHSEZhF5+A2jh5Qeabr0RFYE/xKc1UiQR1LwkJk04y+mzCvjTMpvaV2WOhFPcLxTd6TXkpGFQOD0cFw==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(23010399003)(22082099003)(18002099003)(261026140227099003)(56012099006)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(261026121527099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: r0lNeMebbLCVUHmA1qS/BqWEceQjp6f/rGCTQVSPWksnUmqLSuKKJ94bNPQ85TbdbfH027RJY6Q8NqPW0ttCGgOmyZRsiWOyqxUR86W8YbNwxvaZQC/mWk9jsjkOt+8i5NTeibsU511Z8Wd77hFv0clsaWifjj8aqU/Bqx38HYXH3MjoWACizF6XdS0bp7uKzs55qX5Pf3l27AjA1EksPHBm31Hf7+Nz0d6bMx8suYmyv5639T//qsMm0IVgQClzKeDwx7NrfsT4JeGeONQC5cde7hPHf0zz0hmS/PToQvbS9IXP19UsPMJb/Wc8ItAvLDjoEtlnZ3sRjonRm2OkCvQrEo8IOyqPtHwHrFR8VJLONOn62FZYAXiT+iWtO9snh9oDvKCgITnUa3CKn9jtki3oCzio8WpnkHkYMiJwfJ6WtgSk4/I/tkTI8PmY+70A
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:41:38.3006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe63b41e-a376-42df-9594-08df4a30aa40
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR10MB992257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_054146_970548_C40E1B81 
X-CRM114-Status: GOOD (  11.28  )
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

The SYSCFG of the STM32MP23x and STM32MP25x SoCs is the provider of the
LTDC pixel clock, which it selects in its DISPLAYCLKCR register among
the LTDC kernel clock, the LVDS PHY pixel clock and the DSI PHY byte
lane clock.

This clock is only used on STM32MP235 and STM32MP255, which have the
LVDS and the DSI: the LTDC of STM32MP231/233 and STM32MP251/253 takes
the LTDC kernel clock directly. As the SYSCFG compatibles are shared by
all the SoCs of a family, add the "st,stm32mp235-syscfg" and
"st,stm32mp255-syscfg" compatibles, with the family ones as fallback, as
done for the LVDS of these SoCs.

Describe the three inputs of the mux with the clocks and clock-names
properties, required with these compatibles only. The existing
devicetrees thus remain valid.

The LTDC kernel clock comes first: the SYSCFG node being a syscon, the
syscon core takes its first clock as the clock of the SYSCFG registers,
and the RCC always provides this one, while the LVDS may be disabled,
which would defer all the SYSCFG users.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml        | 40 +++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index a559f8b03b84..2a3c0ce90391 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -25,6 +25,14 @@ properties:
               - st,stm32mp23-syscfg
               - st,stm32mp25-syscfg
           - const: syscon
+      - items:
+          - const: st,stm32mp235-syscfg
+          - const: st,stm32mp23-syscfg
+          - const: syscon
+      - items:
+          - const: st,stm32mp255-syscfg
+          - const: st,stm32mp25-syscfg
+          - const: syscon
       - items:
           - const: st,stm32-tamp
           - const: syscon
@@ -34,7 +42,14 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ltdc
+      - const: lvds
+      - const: dsi
 
   "#clock-cells":
     const: 0
@@ -62,12 +77,35 @@ allOf:
             enum:
               - st,stm32mp157-syscfg
               - st,stm32f4-gcan
+              - st,stm32mp235-syscfg
+              - st,stm32mp255-syscfg
     then:
       required:
         - clocks
     else:
       properties:
         clocks: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp235-syscfg
+              - st,stm32mp255-syscfg
+    then:
+      properties:
+        clocks:
+          items:
+            - description: LTDC kernel clock
+            - description: LVDS PHY pixel clock
+            - description: DSI PHY byte lane clock
+      required:
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names: false
   - if:
       properties:
         compatible:

-- 
2.43.0


