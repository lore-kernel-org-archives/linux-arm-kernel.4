Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591CD606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v2Jeko00;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=T6FzKTCQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4kIbyOmE6k+9MidOvtjG4oBjgYG1kw0gVKeYNIBwHwE=; b=v2Jeko00RjBGtY/tMhD1fePi3y
	RSI2ND6YD0/vUol0MmpkcDFO6eQMRQ6+1JDzVI4tZkffCqp2q7n3BSSwPN4oKxS38R6BhVMVEC/AJ
	ZfS0PwzilerFZse8353aT6ovPncenFYZVT8OE7AMpLahbQYp7gII322i9188PmgsiN3e1JUFRl3wU
	5g4mh77aNDzUTx/4Hn3KOXO+NSpKd0ftX3FoPg22HeRoVQMXIHuS8/7qf3yPUR8UMYiKN1VngPc5e
	DIyNDuNqcr8ZywKtIiFmXU4qa41AqX4oquutRJz9AbU/d11Hk30n1dE5jy2SYgxO6DxMhxrVxIOka
	1jYiIYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjJJ-00000003Uu5-0gcL;
	Tue, 10 Nov 2026 10:42:41 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjJ8-00000003Ukv-2Dis
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:42:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wa0/5xyHZv4BAFElzYShIzgv6pdKBcLcwXCZabldHXKXRJodPyMqC0dCkLLhu97cySO1/t+ZGrayUQ3tQUsE7WBsGODHTniMURdVx/WGSrzfbTGHFxrFn8D+EubiJ70TlG9YKzC2QZIGCfbwQwYsthYXO4AuooLdeN37tA6b8E4pTOLqVVevyd/7aLF7gyFSjVM3sl9U/rrdrOp1NKs1/LoOJzB4K1diphwa/icTWKWhQYpTWI9ZNR25AI2AhwZQ0fLlcsmyYZXkJwevWXHA8CllgBbqMBMCkgF3BMSbwIV3KhXVFFYghVHIubFNELiERhkwJkhz5+ojbF3GdhW6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kIbyOmE6k+9MidOvtjG4oBjgYG1kw0gVKeYNIBwHwE=;
 b=ZCsUQUglhFW+FL4V5McK7NJFa3KqKxIzpyhVhfyZKbP9blBV1+vV0c3J0UDBxUkPEgjm6QR0fOpDXgouGdu8AD5e1Y3fz/Rp0Z51gq7YObvOoELogT59KTr6pfc+fHVtQFLbkxLs6vb8eVHYocFXr/z5tMiGc/zro3ml9Ds1lAcEmxddZDBCG9RoAIg3Bh0mqyTYyL1oN/XVHTTSMxkE973WsN/bDyxet9JmKiNKA8i+lT1B5q3+vovPBAQyFcUsxw2bZbQVnd2Qm1FJGbAF2/nLEKhfEVNVu0Apy13svLdoB0z4ieBpe8PjGvGY/gdWZee9EwcSYZ3XyazYbOFH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kIbyOmE6k+9MidOvtjG4oBjgYG1kw0gVKeYNIBwHwE=;
 b=T6FzKTCQRJ7oK9uunizLWbZLllGetQSdricS74bcHvet2CxRBO590K7UNyi1Vv1UyVVrFIsbG0vFIYNyx5kxQgIW7tmv+xtaJg0sx1h6tvCuTqPgEAIKAbZSWsrON2xK4EJqe5w+l4OV52uVLbt2dO9xlXWrPLCQH/CpiJcEpAGI1BausnI93GU8L1wZn97idY4jB3zU5qyrTahjUmCjDjzDIsb469ozbeG2kSfBecYNuAaMK6n8u0r1z8FKEuaZtCTYBpxr8H2rbFrQTOYUIOHsetJIpgCY4lTTFCnMMyWP6ncejrXnnWzM30s4NBCdGQTAWbKq6q0ueI0rL2g43w==
Received: from DU7P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::34)
 by DB8PR10MB3673.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Tue, 10 Nov
 2026 10:42:21 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::1d) by DU7P189CA0030.outlook.office365.com
 (2603:10a6:10:552::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 10:42:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 10:42:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 11:43:01 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 11:42:20 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH 0/5] clk: stm32: Add the STM32MP2 SYSCFG LTDC pixel clock
 mux
Date: Tue, 10 Nov 2026 11:42:15 +0100
Message-ID: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAf18moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNj3dKC4vjcAiPT+OSc7PjiyuLktHRds0QTIyMTQ1MzE2NDJaDOgqL
 UtMwKsKnRsbW1AJcNK4ZlAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794307340; l=3035;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=9iPaPP6RubjXHAbzgwAZClaxS54/KCe9PgnAB3TJ7P8=;
 b=+njQ30oso779ipLNpVtnZWK2fYmmwgNIZtZSb0aKSIQjwLks8+OyCyz4rZ/7W3wSC5MOEKfAx
 UttoDq5JkJsBoDxN/wFqUfxearrJeQ7ZmDyp7QM1yx3BeVDTn3Saxim
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|DB8PR10MB3673:EE_
X-MS-Office365-Filtering-Correlation-Id: 748c83e4-6aa4-4f43-dda5-08df3f174ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|36860700016|82310400026|260925022911599003|260925021311599003|260925021911599003|261009223027099003|11063799006|56012099006|261021123027099003|261021121427099003|261009221227099003|261102123227099003|261026121527099003|10067099003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: U2l99aqirP3CWmziRtn7EVan7xfxQFnU0bYvmzcm0RbvEBpUDFcLc+xLJh5NNGOYYXk7LMG6DbFxRtnWb+mG31bq5aNDjUK496fFgLlDV/7yMKshMSuQq8gJmurjd7MaPVznUlQl2jdthTfNBWivbpt3mSaBnYKNgk2UwZ/hUlh/YWUFoxK6wjfGSZdFmNT+6Jld+57zrnEL5iTzZX88YSoEYXJOXpUCegkpfNtWLNGprbBwK4pLqL9meqL+Vo6MnCOZODvwBPrY9/puTUeK/VLUQEqRB/Q4R3COSY5V3ycJ7VYr05N3KK73YNh/rPMFAVsxrs0SEDPH/gCpEarrLOl9mE5t0t4PVsqgRFmbg8bhEZ62Mx3P+7UVAHrdANrJ1Zp2ygZ36WQQxF1fbpb0XMl/ef4OqC4Gvdu6EliEbZZVWDiR5guyknhRHsOkm6XF3C6WIJtMYCqbhvvi0iO1vMcZkG/QXsPgu5GQ7+4bQ/RFetVQ/ACsG+p3u62Qg8m3P8JLAaZ5N1zG9CWZaphzQvv7lTk9XGAUrGH8Oxb2zLaX8Z+naMhppIeBW4aWJyZCTQl4i1GhNEw02AsnckjRo80lrRU3BWt/aJ2xNXGgoV24lZ7xDxR5ikFir+/qO7kPO5YCkQlmxaXy5oqRQHi1Bq7K4oUK88Aj9+dcQHe0qhM=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(36860700016)(82310400026)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009221227099003)(261102123227099003)(261026121527099003)(10067099003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qG+4Cm9gVUMh3CySMIoirBnOXzviJF9QlWCTdMkq39aYXA2pKZ5JjjZHautsihFG7KJA9R934BkIzjQyuOU8D190NbwTF1RaRGtcr/XkxMrr+x7AyUn1OISfX906dVfzEaot2sF54gJ5z/p7rL8EvjX21mwYVGK3/f4w/JLAaspoBIDIusxW/Q7ccTNi3YLduen6HgtDcaYPrOglpnyS5WL0rmAjBs34SgGRMO9DuTioGj48W2TZ56ffrRJBaDPIZbbNLgw8D8bizfAFWQWvBn97uQ8Mflnw4KOhUG/OYggwGrgIsKyY4CTWXDBCG0JjiwGtJGtnIjQUSzwEji2abd9puLNgpQHSa2wldwBNUbmDYKf2FPzD1lOBteUfhjP70OO8BewWVbk9Dsd3bW7a5nU83O53Nc5za62jcNv9SqBGe+RaUC9gVWC+o7RstZrs
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:42:21.5988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 748c83e4-6aa4-4f43-dda5-08df3f174ce9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_024230_621646_156947F6 
X-CRM114-Status: GOOD (  13.62  )
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

On STM32MP23x and STM32MP25x, the LTDC pixel clock is selected in the
SYSCFG DISPLAYCLKCR register among the LTDC kernel clock (RGB output),
the LVDS PHY pixel clock (reset value) and the DSI PHY byte lane clock.
The SYSCFG node is already referenced as the LTDC "ref" clock, but no
driver registers this clock, so the RGB output can't be used.

This series adds a clock driver for this mux. It is based on the RFC
sent by Dario [1] and on the driver delivered in the ST downstream
kernel.

The SYSCFG node is bound to the STM32MP2 SYSCFG driver, which populates
its sub-nodes. So, instead of an auxiliary device, the mux is described
by a clock-controller sub-node of the SYSCFG node:
- the mux parents are taken from its "clocks" property, so the inputs
  which don't exist on a SoC (no LVDS/DSI on STM32MP231/233 and
  STM32MP251/253) are simply omitted,
- it uses "#clock-cells = <1>" with a onecell provider, so the other
  clock selections of the SYSCFG can be added later without changing
  the binding.

The SoC devicetrees now use the clock-controller sub-node as the LTDC
"ref" clock instead of the SYSCFG node. Since no driver ever registered
a clock on the SYSCFG node, there is no functional change for existing
devicetrees.

Changes compared to the RFC [1]:
- clock-controller sub-node populated by the SYSCFG driver instead of
  an auxiliary device (RFC patch 3/4 dropped)
- parents described by clocks/clock-names instead of global names
- onecell provider and dt-bindings header for the SYSCFG clocks
- SoC devicetrees updated, Engicam board patches dropped (see above)

[1] https://lore.kernel.org/all/20261028135915.2665857-1-dario.binacchi@amarulasolutions.com/

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Gabriel Fernandez (5):
      dt-bindings: clock: Add STM32MP25 SYSCFG clock controller
      dt-bindings: arm: stm32: Add clock-controller sub-node to STM32MP2 SYSCFG
      clk: stm32: Add STM32MP25 SYSCFG clock driver
      arm64: dts: st: add LTDC pixel clock controller on stm32mp23
      arm64: dts: st: add LTDC pixel clock controller on stm32mp25

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |   6 +
 .../bindings/clock/st,stm32mp25-syscfg-clk.yaml    |  61 ++++++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |   8 ++
 arch/arm64/boot/dts/st/stm32mp235.dtsi             |   8 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   8 ++
 arch/arm64/boot/dts/st/stm32mp255.dtsi             |   8 +-
 drivers/clk/stm32/Kconfig                          |  11 ++
 drivers/clk/stm32/Makefile                         |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c           | 134 +++++++++++++++++++++
 .../dt-bindings/clock/st,stm32mp25-syscfg-clk.h    |  12 ++
 10 files changed, 255 insertions(+), 2 deletions(-)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261103-ups_mp25_clk_syscfg-6a4224156431

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>


