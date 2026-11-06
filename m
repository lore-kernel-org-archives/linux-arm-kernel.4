Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892D8606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ds2Yjk5t;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=cYRCgNYm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tqlY5xYUFv0RdLN0cRk2giX8p56Yy/hKtPHRD3zb1Pk=; b=Ds2Yjk5tlKJYYe
	JOnVeoHDIuWMusTufcveM1jPtpvZ5gAZ/vQR9Hf/vokV+YY6ahE0LEI9az0ycDheeqY2teYUk/fJd
	JsNVINo1aGt4Rpa0re5Iddyd2OuiN8oFIJt25Fc+0bO0/ttE2qAH50N/f1dlptMLxWRQfbRmcTl4h
	fbEMuGijiCvxE/XBlLVsr2JvUEyfkpm10Tc3ZOXyqE911vKgmmipe8Y69j3KKW/x1b1c+wxH9T0Wy
	dfrfGmkTNXcE6W5a5vBbLBEOMhrmJp49nVrdfCroIgIcd9tDizcM/NpbfqQqry9x5RkdDb9nwimw+
	GVg1vVryDzKfUMnoTmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLz4-0000000CqIz-3JUK;
	Fri, 06 Nov 2026 15:36:06 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLyy-0000000CqEB-10OE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:36:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uURbp7Occ5zKK9GH5kv7hlPpq89r6bcGpTTbWRp41pJp4BUSxIBvqkmRn6lmXLR4GC8zCknikC5orvrusBX+/Yn2n0IKDr8wvPf/g8q2lC0fxTlxKX8uP0ogLFkfKtvna70vMVpLoqWSr9LO6xZCQn1suT2ot7xO4fY0bMYGrxAmyFGFxKvHCYQDl7eBW7uBA214rW5eckBicf5fJMFT3MeiKQdixeiw4a0JXzBjk4HmxBWiK1OFlUieSJpu72d9wac2c6XHbTs57+qxmgMdBftBuu69pV5RWMDCqb7fJ4hyyR902zhMBkg8n5zJf6p1Qx1l7lACBqpiv7sDgXvySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqlY5xYUFv0RdLN0cRk2giX8p56Yy/hKtPHRD3zb1Pk=;
 b=QU6WwjoncB8W5QjQRVWFtBVyg+Kfw3zgQNI6JlVVnYJG5VxOhVTUstWttA3ZF1O67swWOwTrjbtODycngLKUz7IZZEzE6ly4TjyRINAlN/WwHC69l0CU2rV12ALYqcNsZZc84AO/OdhYU+YUlOCH9Mmp0s4viH5sThPcl84ZCHKsTpInuNCUPkxitoPmFdBuUCAtkELwZ2uXFInQQzeDhEdihpk/RbS0zP0SZT0kOXcUT3w3BWcm/ZJdnBgcXc2mmhDuOVqbkmKo1SWxs/A7PEUgv3VZ8cR4V8Mb5Y7Smvl89pcVT4KcqJ4EJFz5aupMrH+tR4lyiKYUTauENHdpQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqlY5xYUFv0RdLN0cRk2giX8p56Yy/hKtPHRD3zb1Pk=;
 b=cYRCgNYmYQBkp4Pvd/VlhSFlUM1caCdi0X1cqXQueYaH3m9cifX0NiywKUoA0QrCyJDfSjphCXICzICe2DMJyfSZfdOHUXTpKaA6tvOvbAaKlKJOiPz4U/ioLa7On1Ghl12KkD59RObsCOGsnuTmOxS8E2WaKYuoiSg7IU8gOxWCZz2iGeis8uS3724tcCL9pErVUtj6qB6VXFe3/lKxnCcWJV2r0eKeLnLT24FLsXqWgdFoo/4b9cYIr0ZGnYA3JMx9Iqis4J4zZsM/Ru01f/lFS1ngt2AwmAW4xxUJgHLaTJO+nlWYNpEFOezYBJGMqrivhWJnigrtc32FbDNgqA==
Received: from PA7P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36f::10)
 by AS4PR10MB5319.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 15:35:54 +0000
Received: from MI3PEPF00008499.eurprd03.prod.outlook.com
 (2603:10a6:102:36f:cafe::4a) by PA7P264CA0178.outlook.office365.com
 (2603:10a6:102:36f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:35:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008499.mail.protection.outlook.com (10.167.240.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 15:35:54 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:36:38 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:35:51 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 16:35:33 +0100
Subject: [PATCH v3 4/8] dt-bindings: stm32: add clocks for Cortex-CM0 on
 stm32mp25
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-ups_mp25_clk_update-v3-4-4a32f68119ed@foss.st.com>
References: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Gwenael Treuveur
	<gwenael.treuveur@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793979349; l=4215;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=RJfkAgARQrg1iiJq7FONoXel8toeOXvOhKXhX9cHbyE=;
 b=ty9v9kPDrbkiQAclYGvr1SqfWYM2UHiZPtyJcUQ7lM537BHRwe755eNUPsNbSed0CapreD5Qn
 ZzosMr7m+dlBnO2LPvIFSDitLikTGhTGek9AW43schq3jmq5O0LHENw
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008499:EE_|AS4PR10MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: 667ddee8-0284-41c7-6dc9-08df3c1ba55e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|23010399003|376014|18002099003|22082099003|10067099003|56012099006|11063799006|261026140227099003|261026121527099003|261102123227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: KlFCI5M9RGjQGsGgZiB55/b29EoYxgSbNFZ+bFFuEMAMUqOx6KK8dLeD3kChkQ/OEhWwOo/5lnZtcEkBd+Cckk8J0ZFQg09hpVWWv+y5OPLxcWU04q2g5n/nvJ7cmamIyXKGGJpohUM/MJ0/HdEfJxlnVCX5LfdSsnR5JbEzvyjNjN1f2ir2SOUiG9FqfASxUhbcMcp8EPXjjitgivTuAdeJQCyGIy1dctPcBOG3ZTwjK+jpOYZt4yq5oXmnCBakG8NizTN3M40x87ZnFI/yT+E9RnbaPw7cW99IFZqtvHhNb/ZPUySI9WyB2rDwUGYXxQnGQzzzliGK6qNmK0UNhQGvwnaz8LEZDD0EdxarPRzhqu2dE5yB9l0s62F4c9z0fGdT2FEmP1X+sDehJHU5teiJBhfj5JVoN8b6OBhNnOCwoQMkB6WTIOp0KjPj91uk0MA0QBHygUSWL/n32hLp2Uabx5iz6lno8FJAzu0FPPVSHuWhOmStBdkZ0T1PZfa2Y69lBLWuMkwUHY2lhazbiaMjPoQ+xoh0Qqi0yefD/P5DW/qurzZjUNntuBQLhv2NwnHblyWYW6L2i2eK1drncd83beSwrV1YvoF8m6oViLUSSgPZOuu47Nw5mKhAcixfH47RJR1WHd+zeWfCcE4QnOE9u5T/CCqfLfP4rJEkJvBfHJo5MJ6E7b7OWC1MeOrk96EMRGhhBZJzl/O6ZTCTSA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UHeVAmSmM+Jx6GAlKwG3GUeww/40HeOvKKo3ofMy+CzcdC/AgzTr3cIjIv/pACEt1ZihdAZLXxE9glPs7TMnsw/O16e/AmolbTt8nDlgfKAFK+yE+MF5cG/XE7Vl9WObq/a7xSsvHkOtubuIQrePZQ8EO6rcNPP3nKp9c0I4vZAPHW/PBou+46DSNZlCigEPg5N/jN/qzvf2YWrTPakeaOxOxqJBORa+8uyJKCAnm6pudUHTu+xqhN9mqxpcesOmnHIG314ngE942wXGSG2dOGBEd78lrVPS6qBYLa1DkdXyWFmqdJtNA1EKFiEweA6UZC7b/nmzl4WnGbF48hIyKOaLhxogFfBafO4wbFJSxWTgk1ziKd0aCRgwQLjXMcaWwZUiT1uKAIxRnyJt9fz3t4HaWrmHewm+5P63CTnyp2FuJDEgkF8qxqgx/xhyOQJP
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:35:54.5781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 667ddee8-0284-41c7-6dc9-08df3c1ba55e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008499.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5319
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_073600_344365_D073832C 
X-CRM114-Status: GOOD (  12.10  )
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

From: Gwenael Treuveur <gwenael.treuveur@foss.st.com>

Add the clock identifiers needed to allocate the D3 peripherals to the
Cortex-M0 (CPU3 domain) and to enable their autonomous mode:

 - CK_CPU3 and CK_<IP>_C3: allocation of the CPU3 domain and of the D3
   peripherals to CPU3
 - CK_CPU3_AM and CK_<IP>_AM: autonomous mode of the CPU3 domain and of
   the D3 peripherals
 - CK_HSI_KER_ON, CK_HSE_KER_ON and CK_MSI_KER_ON: kernel clocks of the
   HSI, HSE and MSI oscillators

Add the matching SCMI clocks: CK_SCMI_HSI_KER_ON, CK_SCMI_HSE_KER_ON,
CK_SCMI_MSI_KER_ON and the autonomous mode clocks owned by the SCMI
server (CK_SCMI_GPIOZ_AM, CK_SCMI_IPCC2_AM, CK_SCMI_LPDMA_AM and
CK_SCMI_RTC_AM).

The three kernel clocks of the HSI, HSE and MSI oscillators are also
added at the end of the RCC input clocks. They are optional, so that
the existing device trees remain valid.

Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 .../bindings/clock/st,stm32mp25-rcc.yaml           |  9 +++++-
 include/dt-bindings/clock/st,stm32mp25-rcc.h       | 35 ++++++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 3b7925d2c175..423016ecb602 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -32,6 +32,7 @@ properties:
     const: 1
 
   clocks:
+    minItems: 80
     items:
       - description: CK_SCMI_HSE High Speed External oscillator (8 to 48 MHz)
       - description: CK_SCMI_HSI High Speed Internal oscillator (~ 64 MHz)
@@ -113,6 +114,9 @@ properties:
       - description: CK_SCMI_TIMG2 Peripheral bridge for timer2
       - description: CK_SCMI_PLL3 PLL3 clock
       - description: clk_dsi_txbyte DSI byte clock
+      - description: CK_SCMI_HSI_KER_ON Kernel High Speed Internal oscillator
+      - description: CK_SCMI_HSE_KER_ON Kernel High Speed External oscillator
+      - description: CK_SCMI_MSI_KER_ON Kernel Low Power Internal oscillator
 
   access-controllers:
     maxItems: 1
@@ -214,6 +218,9 @@ examples:
                  <&scmi_clk CK_SCMI_TIMG1>,
                  <&scmi_clk CK_SCMI_TIMG2>,
                  <&scmi_clk CK_SCMI_PLL3>,
-                 <&clk_dsi_txbyte>;
+                 <&clk_dsi_txbyte>,
+                 <&scmi_clk CK_SCMI_HSI_KER_ON>,
+                 <&scmi_clk CK_SCMI_HSE_KER_ON>,
+                 <&scmi_clk CK_SCMI_MSI_KER_ON>;
     };
 ...
diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index 96b4cffbacb9..7d25c2747a9f 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -365,6 +365,34 @@
 #define HSE_DIV2_CK		343
 #define CK_KER_ETR		344
 #define CK_KER_STM		345
+#define CK_HSI_KER_ON		346
+#define CK_HSE_KER_ON		347
+#define CK_MSI_KER_ON		348
+#define CK_CPU3			349
+#define CK_ADF1_C3		350
+#define CK_GPIOZ_C3		351
+#define CK_I2C8_C3		352
+#define CK_I3C4_C3		353
+#define CK_LPDMA_C3		354
+#define CK_LPTIM3_C3		355
+#define CK_LPTIM4_C3		356
+#define CK_LPTIM5_C3		357
+#define CK_LPUART1_C3		358
+#define CK_RTC_C3		359
+#define CK_SPI8_C3		360
+#define CK_ADF1_AM		361
+#define CK_CPU3_AM		362
+#define CK_GPIOZ_AM		363
+#define CK_I2C8_AM		364
+#define CK_I3C4_AM		365
+#define CK_IPCC2_AM		366
+#define CK_LPDMA_AM		367
+#define CK_LPTIM3_AM		368
+#define CK_LPTIM4_AM		369
+#define CK_LPTIM5_AM		370
+#define CK_LPUART1_AM		371
+#define CK_RTC_AM		372
+#define CK_SPI8_AM		373
 
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1
@@ -490,5 +518,12 @@
 #define CK_SCMI_STM500		122
 #define CK_SCMI_KER_STM		123
 #define CK_SCMI_KER_ETR		124
+#define CK_SCMI_HSI_KER_ON	125
+#define CK_SCMI_HSE_KER_ON	126
+#define CK_SCMI_MSI_KER_ON	127
+#define CK_SCMI_GPIOZ_AM	128
+#define CK_SCMI_IPCC2_AM	129
+#define CK_SCMI_LPDMA_AM	130
+#define CK_SCMI_RTC_AM		131
 
 #endif /* _DT_BINDINGS_STM32MP25_CLKS_H_ */

-- 
2.43.0


