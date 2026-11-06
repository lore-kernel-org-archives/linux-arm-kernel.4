Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FD1606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OwVIupSo;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=VxUr/2xO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tqlY5xYUFv0RdLN0cRk2giX8p56Yy/hKtPHRD3zb1Pk=; b=OwVIupSop0ipoK
	gNTN/Ac8hqAxqXwSXckmZBbbSD8vlQcguD0WBSrfOLLqiWHfmqXz2kVYWZxfOKXilcBAyCNhl9Bed
	ZuKMwLyizlJQI5fEEylJrM7lQ+fidabpzw18iu07fKGm+6fp1danFnvbDO3tQ/sM3J5sixjHXN3Kv
	d2P570Dfhy8xwhDE9AGXEe3iNSVZ8jYTqladaha2KLXaq7ABQk4c7xN8yqIgsqpbqTpp7B8u3/nsI
	jhlTchHa44C+QYsI/yFoIM8koKUFLSr61O9ZsuLFso9uv2pFX+op7WulaAGtIO0OJ/9udIhOwoxh+
	mPJqw62JRrjJ7CUI3Mrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMcQ-0000000D13z-3RG0;
	Fri, 06 Nov 2026 16:16:46 +0000
Received: from mail-francesouthazon11011060.outbound.protection.outlook.com ([40.107.130.60] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMcL-0000000D0zz-2U9j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:16:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfKUIh+XgLlNGrGfP+5Oap3fdiRlJQAMXAmRooGCgjFjN5S0ufcvWeVMCZo1+R0YWuN3FWop7yz14vZMPwIIJRpWitc0VtyMt4mr3j2FLdXrfBefzQWo2v6qiF59PSS1i1GT14i7gUJrbsp/1f5tb6maUYGUcNrUVCkCs5zW5xBpJVhhq/BQOniVEdr8vdPVdrrZwbEO3Abb+fZmq6OiErD3jIIfdZ4VmJXPleXkFMiilSiYtTF5wCRcNjMecOB6B5DxPMdaYyu3awmUFUA+Iy7Oz+ILWNRPG4eu5yP2f73wZ+gHEn4rkoajphIF83ZMxLOHY0l7/Jm9h3v9W/qCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqlY5xYUFv0RdLN0cRk2giX8p56Yy/hKtPHRD3zb1Pk=;
 b=O5GUR0nImgN9VkJOjNKx6q1OYXGMUNx3953olcdJJDZHdSMAckRkld6r/XJvS1o7ocvrjcqbvxyrvGWKVbULgqK2xjqzhllV85Rr/67BS8V9c1sxcNnUxw5AoECo16Z7Y9Nmi1OkijAZTX8zHDSM50cMAM8c/Ygdf0n+hodfz7Ly9U010I5BDMmRewCafrLg5walZ2URyUNhU+EnQhnHpb7EiNRbtgtzVSnLyAQ5aCvTCVIaso4hRDT+w6869TQoji7Q098cEeLjzUlRGTZmU4QN1y7dvB529JFoAcYirS6oAis5g3qI+TuhmF0VevDKsVB3xtvyfzzqfE//Bs7ALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqlY5xYUFv0RdLN0cRk2giX8p56Yy/hKtPHRD3zb1Pk=;
 b=VxUr/2xOB4bQmJNtyxDN67/MmyOKSYNGaEKe/0BYRPU0+9kBoGZsycxRKvrKdWHs24ydLgbR2DbbAD9vjCryj7YwPwTe5o/4kKSbFT5b1R+Yd69d3s5j2KDFkCBvejI5+ZZkR5Z+yyoJWic14+oc2uQSt8HgHbKphlEWaYiNjMQtILG6uLgL9sdkcBdhJAPcwRlD+kof+C23WD9+AWAt3Wk8H46zsHkpFMzWWkk2A6ijDKE4BA+hjicRCoT6mKYyVJvgVciT90iyAHc06oH0K9QCY7DF6JSOVqaILrJdEDXzig0Xk9E6K1KUdNIbDo/6TpPo9PLNPIDf0tMbtFPbVQ==
Received: from MR1P264CA0021.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2f::8) by
 AS5PR10MB8122.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:654::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 16:16:36 +0000
Received: from MAD0EPF000008B3.eurprd04.prod.outlook.com
 (2603:10a6:501:2f:cafe::5d) by MR1P264CA0021.outlook.office365.com
 (2603:10a6:501:2f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:16:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008B3.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:16:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:17:05 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:16:34 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 17:16:34 +0100
Subject: [PATCH v4 4/8] dt-bindings: stm32: add clocks for Cortex-CM0 on
 stm32mp25
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-ups_mp25_clk_update-v4-4-9e32b817c38d@foss.st.com>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793981792; l=4215;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=RJfkAgARQrg1iiJq7FONoXel8toeOXvOhKXhX9cHbyE=;
 b=YhYXeeIVoEElzAm5lE1vt1hkRgb9V4130yoBp1kqxl/9coUBGw0XKAFf1xfq9iAfegVvxbF0t
 XGv6xk+SJbFAdE/J2Cnwc9T2Xl1JoT/4TJi5e9EKh9PCnJCK7VhZn0A
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B3:EE_|AS5PR10MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f00eabf-b77f-4b50-3b62-08df3c21544a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|1800799024|22082099003|18002099003|10067099003|56012099006|261021123027099003|11063799006|261028144727099003|261026121527099003|261022105027099003|261009223027099003|261021121427099003|261102123227099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 9SgReg8UUezUgokrgyd18616BYEspQN8bat+YybR0p5x8Rnkhu7HYoth3wojadHOC/yqDgZnMBhBeJuxVoKA9CzXi37K3UK4tPg13/eNeUv1R+bPVJK0n4anT/qJp74Mg/Noyx7kWUHhoLeeBpbCvUtuBvH+NQMtKZYPnpe8zeSrv3VwlmDVTcrLMa1pCAmuOFomVAlrsKRkeOxn0VKZ7RYBWwEmusg979alB9ZrpXl+skMmW/gGuOyGAa7G4clF09vXuXHLYgUv50bp3tn7frSLZvqcn2PHCUbFVWk71kq/MWsMTmC/0j/YeG6ul65uckeD/WzevfI9TRjyHvOij1HQZ47yREiFrT+V+WBJfncnvWsoUYCXiKDyBgwnQf4rCRi6pt6AyHinZNfc3kE3jn/fYTEwVnlG8jzWfiIdKHHWbOTAoNUPSp2AyTeTVA8U2P6fdYZ9FC10bSvEa+MkeYjDu7wwFSpzU3tc7DJgti8aPD0FasYa5t494V9HuGlTUAInI0YW5GsjjC9oQIfw4uS19H1nvcw17BXJYU7ora2/6q41Ik6cVwreGlVsoFCu9xcqZE4H//7IyRrpnPSw8rkff5PByXTMPJRWP/zNX8LBW1aChzF/jm1zG1zZ91BYAQeHSlDrcB3eaAzzfcD3YgswJjXWixfyBroH/QJ+l8Tu67mTqnZADlUz9jgqDG8ZdwVqOi8dpiOXZ2fRRyVhUw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(261021123027099003)(11063799006)(261028144727099003)(261026121527099003)(261022105027099003)(261009223027099003)(261021121427099003)(261102123227099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1n7S2Xk+rzL7nYRmYxjR9RACqy9rn4kq98Pbl+3qP5R5PGApnuKYRquklDHQbYAKvpGoOkrr0kDW/Q2//OKQDwCWd4wU+6t79/t0LP7X/s3eeT+loO9l2U5YWPI6rKFpolw/PvZgtUs6pZMPxLoCAasqAzLf1zcaaxtFS3nTUrBzOzM+ESY5QQXLteP6EsnW6sR51YWBE2awB83c1Wy/wpsumj+njA8trTd5z9XSCA3fz5qEmMMUYEkJCZ3SSHp2iiVaCXb25sns9qw0lSuAKZLRpjPUEdvaabNfrthQhaMafmKQgcI1+mETKi2WPFVFcsg65qrIgn4iDCRokzFHm9PYbg+wk6OsWZfJ4ylT/a81kKRvCLUGjcBi9X+fyIwTKcaIJSMoOR7XZ1AwIo6ylj8Qj1ckL0ZJBEZ2cF+IK6oVhqScnjuLsFxiQFqObLEF
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:16:35.4519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f00eabf-b77f-4b50-3b62-08df3c21544a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008B3.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_081642_316104_A4456E76 
X-CRM114-Status: GOOD (  11.89  )
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


