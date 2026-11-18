Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A870960A5BE2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bu3G2s0z;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=RA2rgKNg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R2hRvNE063oXpTU3lolVbJBFwhUHRzktH6MpZ8KmGhA=; b=bu3G2s0z519dYn
	eb1IM3N+kUE1gdRe6fgpynjIt6IMflwyOjen1d3xarE8OTqgcjjuVkcnBS8gZTTYxL6PmXZimBYNt
	kYG1h46ctJFRgu4pZtC8cD/YMR64yZNrTL9meBrEvRWc3UdWSrBrazAYEl6hSr+nNCPJqjFh6lfLO
	Q1HLoQGM9K4OTfu6IX2LeOIG1D9Xqo4uCMhRMEkanw7ySxQkHFGE3b8DoPmsPXZRA02dJr9ooYlNr
	v/AOjQSomL89JrtWrDz66t53tHTulaEP+jA8iuIU1aR1MhpcTNlKzYI0DWzGV7rYZS4TviFb5DLvL
	8lyB1maMTV11feAODNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThQL-00000009DZU-3uia;
	Wed, 18 Nov 2026 15:18:13 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThQI-00000009DX7-0DdD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:18:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXQjIp/wOKQgYByOgB+HLHrWaGYXfrnzTht5+1ibzv5zEmIiPRVDc0Q7/Qu4ErfenN87c/uf2CGAmZsNRQSRlFl7HlA1Gy+k2tea3juvp/GL53TGnxb0EGUSSgQmxumAIVR6+sL9g2LmbtzD0c7CFZ6mejmF54B9nqrNNfaniUK+djMwxJTgVU0avPHcpECdWNeUg15+8Makpbpn6oYsmSOqTfck0M/r2M9by3+9HwJQdZLnliFGjkfI7NqxAySjo1xRz8pxVZb8ngJO+vjvFXIIZKbEC90LlLp1hijJqheowp1wz+3GSn5V0y+l+Z62Odw9uVTFh0CumIwbcOpXuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2hRvNE063oXpTU3lolVbJBFwhUHRzktH6MpZ8KmGhA=;
 b=G6EB/0fJCklOqC9tqqsT2yNFepCWkyeWbzWCVgyhb0y79SZus+PQao7pWlNyzm9wQfPX+8AyyiaZPMqGcN9V1RQKufwU7BHz3SPlHW0nKv6KZHoXR7WtL9RSkoPTukWd/e29qjPAnTe03YfHANzlV+c2zRcBEGRhoTCGiyKrxbkXOylXic/3dfCob8julIw04Jrkn6SWCKl5BmjKEiulB/a/1hDawE90oj1wPJ5xc/9G7PAv22Zp61aR8LmIOjSbTCJdB5DqiTdR8nc2C0wtfeQ2wepsk6gMkmvXjECiGRx6YS3/jsXzncC9H8Vg/m4k3MCjIvwKk1gNB4DVXvv/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amd.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2hRvNE063oXpTU3lolVbJBFwhUHRzktH6MpZ8KmGhA=;
 b=RA2rgKNgovb+MpsHttHPE2mZZ+EHTARPHsj3t3Jg8DtYbjhcki2qsUSivqqv0p3T/jVJgmDjBsqAWin91suvuoICGSrbMZ+PCw9upHbpOrXhXMoVsCGzPZNff1QyvwHhweE7GxxtRMgEyJCLfzPKfisQlIn6zZjVH4eTA3rVZrZVgSwMP8nwrTnMbg5YnjxbTh+xCGjbUxNqY7vbjn8r99AUvrMTtvWDYJSzUQ5mg/JFnJG2ZW3QrA9GDU3JQVpGFoN7xi2XC9NwT7oxKdbqt5kBZKujwnMxkNqILJoOXTSnAdzvUlEukQwKiBUQa0UFzStEwdsg6RuYof6mqGmyww==
Received: from DUZPR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::7) by AM0PR10MB3155.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:18a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Wed, 18 Nov
 2026 15:18:02 +0000
Received: from MA3PEPF00000408.eurprd04.prod.outlook.com
 (2603:10a6:10:46b:cafe::1d) by DUZPR01CA0028.outlook.office365.com
 (2603:10a6:10:46b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 15:18:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MA3PEPF00000408.mail.protection.outlook.com (10.167.241.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 15:18:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 16:19:01 +0100
Received: from localhost (10.252.16.78) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 16:17:59 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
Date: Wed, 18 Nov 2026 16:17:46 +0100
Subject: [PATCH v2 01/11] dt-bindings: iio: adc: add stm32mp2 mdf filter
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261118-upstream_mdf_v2-v2-1-7939d3c3720a@foss.st.com>
References: <20261118-upstream_mdf_v2-v2-0-7939d3c3720a@foss.st.com>
In-Reply-To: <20261118-upstream_mdf_v2-v2-0-7939d3c3720a@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Sumit Semwal" <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>, Philipp Stanner <phasta@kernel.org>, "Arnaud
 Pouliquen" <arnaud.pouliquen@foss.st.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-sound@vger.kernel.org>, "Olivier
 Moysan" <olivier.moysan@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000408:EE_|AM0PR10MB3155:EE_
X-MS-Office365-Filtering-Correlation-Id: f7478202-b244-4822-90ea-08df458722dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|921020|11063799006|56012099006|261026121527099003|261026140227099003|10067099003|261022105027099003|261022075727099003|261021135927099003|261021123027099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: B05IjAh6IzuFJiJxRmFnvV2Gtgp+sXuMjRifu0UdH4AOjLd+LepFPZC553kOdUFXJPF6yfCuC+OfT3Yq6ILGku+gi8NMFPaCGYumfRbTs8Pbs/81T5890PYeEL7CANkfAW62zOFDlpZwC3f3Xlr2j/oZG7+SVNq8WR1W1+u9IuUfkeYqq0rhl1EdkN4oU/R4FeX5NMPNIs9umPGVesJ3SW3c1QhKUrV7mjW7FvXK65oEZy/FPZzVhgTFHRysIkbSH+Rgo18Fl0v2EuH+km3qCuk9/v9Rf1dJbk+oD9bMR0JsxNfaI78LKdsHAkxHAASJwg3frurNrGq1fGUE0uXM5OTz3FsZgv4xNKyLkMh1FfRESwePW9MfhrRk1Jo7T1Kk0QXV5kaWdgeUxgDJ5xnkUAuR6ot94tTuYoBrTM3QEXGg/tM98vnIicpgnaqvptQO1ZqPxtuJTtwzThjSEdrzZX80+2MVDm0JaVGOT0gizp+ilxpFnAmAPRvlFCB7nKLLp2zW/8bD9z54mXaBcdh56ZPgwBN7NhU6o6gj4vd9iPoz7z3U/fvwXUlPfcAyqe1rIOSvBhJ7PStSf26YTGXdAz54Q+fNgP6lxpsWToSME4o6VtFgYbZFZ7J/+2BLdmdI8kw/raI7LNkLP+DQ9uWXjRAOyu0eJuaWLZQ6IlT1i5ZqfwhN4u4WVYPXvmIpkC9B
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(921020)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(10067099003)(261022105027099003)(261022075727099003)(261021135927099003)(261021123027099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6YKPPvFbudaqsiAbJUT2dOsdOPPB3mly6AxDANAIT6QV9duEKIhjSHgEy+Rh7KJvxxWvTnx4SmJa1gDjdA2zpKJOmDIjyhv2IB+oWcwvs9HJNQ1N9FKpZ7utVPJapbzlNtQBtgZNVGx+gXcrFIeOLMrJOt6HBIxMB4Jgqgq4QmwNkkc4InQTScF8STM7ThbyS2IYx/Tsp66SuEHkbrAeN24WJkxMrkoZTj2TAZsh2zlZ9ysSGPa+f1+p46WjRvP5n2pbJ6KMq3v8Z+PLFNS4mvAzlVTgPqCFE52/yAY/8d1XuaROQMs0u4XBldK6WUc0XHnk+KMQY25uLPTGasz0f87rWkSWbXoXLxDp/U2bg42DvlAzHcPhM+tTC13CNax0NnJ+CscZX5Yh/j3WmIjDictQ0McceSssu0BYd4+dtrndKSrlQDGlf3WJoYSnIbHg
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:18:01.6549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7478202-b244-4822-90ea-08df458722dc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MA3PEPF00000408.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_071810_504449_1EEF4612 
X-CRM114-Status: GOOD (  17.08  )
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

Add bindings that describes STM32 MDF settings to support
digital filtering for Pulse Density Modulation (PDM) microphones
and analog sigma delta modulators, on STM32MP2 SoCs.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 .../bindings/iio/adc/st,stm32mp25-mdf.yaml         | 341 +++++++++++++++++++++
 1 file changed, 341 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32mp25-mdf.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32mp25-mdf.yaml
new file mode 100644
index 000000000000..e4925a38012d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32mp25-mdf.yaml
@@ -0,0 +1,341 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/st,stm32mp25-mdf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Multi-function Digital Filter (MDF) ADC
+
+maintainers:
+  - Olivier Moysan <olivier.moysan@foss.st.com>
+
+description: |
+  STM32 MDF ADC is a sigma delta analog-to-digital converter dedicated to
+  interface external sigma delta modulators to STM32 micro controllers.
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp23-mdf
+      - st,stm32mp25-mdf
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    enum: [0, 1]
+
+  clock-output-names:
+    description: |
+      CCK0 and CCK1 are optional output clocks, which share the same clock frequency,
+      but can be gated independently to save power.
+    minItems: 1
+    items:
+      - enum: [cck0, cck1]
+      - const: cck1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+  resets:
+    maxItems: 1
+
+  access-controllers:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  st,interleave:
+    description: |
+      Number of interleaved filters, starting from filter 0. For a value N,
+      filters 0 through N - 1 participate in interleaving. Their samples are
+      multiplexed into a single channel and retrieved through the device
+      associated with filter 0. Filters 1 through N - 1 must be enabled and
+      inherit their configuration from filter 0. If absent, interleaving is
+      disabled.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 2
+    maximum: 8
+
+required:
+  - compatible
+  - reg
+  - ranges
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+patternProperties:
+  "^sitf@[0-9]+$":
+    type: object
+    description: |
+      Serial interface configuration, managed by the MDF core. Pin control
+      states for the serial interface pins belong to the MDF parent node.
+
+    properties:
+      reg:
+        description: Specify the SITF serial interface instance
+        maxItems: 1
+
+      clocks:
+        description: |
+          Serial interface clock (optional depending on interface mode)
+        maxItems: 1
+
+      st,sitf-mode:
+        description: |
+          Select serial interface protocol
+          - spi: SPI mode
+          - lf_spi: low frequency SPI mode for low power applications
+        $ref: /schemas/types.yaml#/definitions/string
+        enum:
+          - spi
+          - lf_spi
+
+    required:
+      - reg
+      - st,sitf-mode
+
+    additionalProperties: false
+
+  "^filter@[0-9]+$":
+    type: object
+    description: Digital filter path child node
+
+    properties:
+      compatible:
+        enum:
+          - st,stm32mp25-mdf-dmic
+          - st,stm32mp25-mdf-adc
+
+      reg:
+        description: Specify the MDF filter instance
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      dmas:
+        maxItems: 1
+
+      dma-names:
+        items:
+          - const: rx
+
+      "#io-channel-cells":
+        const: 1
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      st,cic-mode:
+        description: |
+          Cascaded-integrator-comb (CIC) filter configuration
+          - 0: MCIC & ACIC filters in FastSinc mode
+          - [1-3]: MCIC & ACIC filters in Sinc mode order 1 to 3
+          - [4-5]: Single CIC filter in Sinc mode order 4 to 5
+          For audio purpose it is recommended to use CIC Sinc4 or Sinc5
+          This property is mandatory for filter 0 or filters not used in interleave mode.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 5
+
+      st,delay:
+        description: Filter delay in samples
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 127
+
+      st,rs-filter-bypass:
+        description: Bypass RSFLT reshaping filter.
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      st,hpf-filter-cutoff-bp:
+        description: |
+          High Pass Filter (HPF) cut-off frequency expressed as a fraction of the PCM sampling rate.
+          Cut-off frequency = st,hpf-filter-cutoff-bp x Fpcm / 10000.
+          If this property is not defined the HPF is disabled.
+        enum: [625, 1250, 2500, 9500]
+
+      st,sync:
+        description:
+          Synchronize to another filter.
+          Must contain the phandle of the filter providing the synchronization.
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/phandle-array
+          - maxItems: 1
+
+      st,sitf:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        items:
+          - items:
+              - description: Phandle of the serial interface connected to the digital filter
+              - description: |
+                  The phandle's argument selects the bitstream on the falling or rising edge
+                  of the serial interface clock:
+                  - 0: rising edge
+                  - 1: falling edge
+                enum: [0, 1]
+                default: 0
+        description:
+          Should be phandle/bitstream pair.
+
+      mdf-dai:
+        type: object
+        description: Audio interface for the MDF filter
+
+        properties:
+          compatible:
+            const: st,stm32mp25-mdf-dai
+
+          "#sound-dai-cells":
+            const: 0
+
+          io-channels:
+            description:
+              From common IIO binding. Used to pipe external sigma delta
+              modulator or internal ADC output to MDF channel.
+
+          power-domains:
+            maxItems: 1
+
+          port:
+            $ref: /schemas/sound/audio-graph-port.yaml#
+            unevaluatedProperties: false
+
+        required:
+          - compatible
+          - "#sound-dai-cells"
+          - io-channels
+
+        additionalProperties: false
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+      - dmas
+      - dma-names
+      - "#io-channel-cells"
+      - "#address-cells"
+      - "#size-cells"
+      - st,sitf
+
+    patternProperties:
+      "^channel@([0-7])$":
+        type: object
+        $ref: adc.yaml
+        description: Represents the external channel which is connected to the MDF.
+
+        properties:
+          reg:
+            maximum: 7
+
+          io-backends:
+            description:
+              Used to pipe external sigma delta modulator or internal ADC backend to MDF
+              channel.
+            maxItems: 1
+
+        required:
+          - reg
+
+        unevaluatedProperties: false
+
+    allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: st,stm32mp25-mdf-adc
+
+        then:
+          patternProperties:
+            "^channel@[0-7]$":
+              required:
+                - io-backends
+          properties:
+            mdf-dai: false
+
+    unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mdf1: filter@504d0000 {
+      compatible = "st,stm32mp25-mdf";
+      ranges = <0 0x504d0000 0x1000>;
+      reg = <0x504d0000 0x8>, <0x504d0ff0 0x10>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      clocks = <&rcc CK_KER_MDF1>;
+      #clock-cells = <1>;
+      clock-output-names = "cck0", "cck1";
+
+      sitf5: sitf@300 {
+        reg = <0x300 0x4>;
+        st,sitf-mode = "spi";
+        clocks = <&mdf1 0>;
+        assigned-clocks = <&mdf1 0>;
+        assigned-clock-rates = <2048000>;
+      };
+
+      filter0: filter@84 {
+        compatible = "st,stm32mp25-mdf-dmic";
+        reg = <0x84 0x70>;
+        #io-channel-cells = <1>;
+        interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&hpdma 63 0x63 0x12 0>;
+        dma-names = "rx";
+        st,cic-mode = <5>;
+        st,sitf = <&sitf5 0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@0 {
+          reg = <0>;
+        };
+
+        mdf-dai {
+          compatible = "st,stm32mp25-mdf-dai";
+          #sound-dai-cells = <0>;
+          io-channels = <&filter0 0>;
+        };
+      };
+
+      filter@104 {
+        compatible = "st,stm32mp25-mdf-adc";
+        reg = <0x104 0x70>;
+        #io-channel-cells = <1>;
+        interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&hpdma 64 0x63 0x12 0>;
+        dma-names = "rx";
+        st,cic-mode = <2>;
+        st,sitf = <&sitf5 1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@1 {
+          reg = <1>;
+          settling-time-us = <1000>;
+          io-backends = <&sd_adc1>;
+        };
+      };
+    };
+
+...

-- 
2.43.0


