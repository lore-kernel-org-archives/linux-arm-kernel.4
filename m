Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16181606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sKg3ZiVB;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=fG8pgsRx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kgrvYO0ioCyvCXfaQw2CfkbdsyA7t94H7a4znljlMx0=; b=sKg3ZiVBalzymN
	n20Iw8ocaAp7QQ3buVAsIK0c2Cykc0aXzFr+6VJ50YN1FkpzEvZz1YYcPpr9IdlQr2OZI0boyQncW
	sJ2KhnRkTfZCFnf56QDfie5lFnOlPO4mqfrwzltFigVfVz8tbCiB0m2gghG0akLUsdAiDPCNuCmOR
	n1BC3HIFWbOY7wZtkZ46QbQY72wfrqTm/DEkYYLtotueZGxXj/UB2uqNVv5BL1LCFvr4vYLHjG86L
	IiXZo3vkn4RpP4cQGk7Cg6WY9Kb9XUGpQ6RFDtB+o92YCdDHAWtVZ8RidDEQ3K/V0om73VtwDjK4L
	+uXcRKqg6I+QOh2E2IoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtgx-00000007Bte-1sO5;
	Tue, 24 Nov 2026 16:48:27 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtgo-00000007Bmz-3rtt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:48:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9Cns9qc0Ee0lNuaNSHLkut2Si5Nt5Ubx7zDyWbnKPETTZFxOeNKGWLmN/jxt80XtzgGHbPGwhjjMGJ8FHv1D2CmEaUzB0g/F2y8m/OwQlaCX48yWlJU+GVcNdcwD1XZfjQKpYggOJXsROVx86LVpkh/TTSgSeLTrP2fqptwnsdKCZm+2S+46gtwsaXKIqJ6+3yLXjuBSXG4EeevF5mO61zjsif0Ffn4Z7+Lo9j4ST9S6D4+cHMSLnVl9rO3ymOxdnq1Y6J7pB82Z+1eck1RhMHrwIvfnF8fPG9YyX5woO1OswJDM/MkCQIbDVSWbHs9ISLoTUJJ+XKL7QLxG/kFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgrvYO0ioCyvCXfaQw2CfkbdsyA7t94H7a4znljlMx0=;
 b=WazunqWUabeQ5nUM1nmt4FM9yfbKXajn/tIBn7/MdyNbgP2UiotzWIIsXiGWlifSSw7w8LTffz5UiPpZaos5TRIJ7qz/Mbvk1UxrxsnK5mjmoJzOixf/z/vBIKWec/nfwK1kbifwJ20T3Knu/wWX2r3w3oTq1J41Q3JsqyhKAfoVcFz7RjODLX3BRbs2/7+jmC69x+QCaucpQQPoJjc64wwyTlDahNj2wQfsCgHPJZu/g0IARDjGthBGBp9NoIIGrlswcRFx/3xp5btEpA53VY60HWHErwLUmrpZnKX8Co/v1RtwsVO3ybZ3qS826XroW61fzmfa6CCaNOkV7OOzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgrvYO0ioCyvCXfaQw2CfkbdsyA7t94H7a4znljlMx0=;
 b=fG8pgsRx70rDPZqsDLd0QrYQSlHI5pkpSzhwR9PY7ZwfRds/kq3Gd5YVd+TdpSMsnbGrQhmC7NSbFiTpNFUzXwJmAadcrvYu+AORPOR0vS8BahgOEN+IckIObaWBLxzyiXOANVEfaDG3pqtgpFsOxCpXIy/Md/opmMD9x7tBhVbPKJXwK2Qoew+TzA4wXEIw1ReqrZruOd3Q7LJmN/FfPvp1jdtyERjKNIgglpnD/b/keICEgdp7NdZjFCrpVEyH6X+CNja/Gyn81toa0A+pc8dd321cpqCgI0/VtjZOu6N2IFNIEIpF1MdayES0WsHY1UBdTHJl2gnl5wx3uhvi2w==
Received: from DUZPR01CA0299.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::10) by PAXPR10MB7952.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:23f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 16:48:06 +0000
Received: from MAD0EPF000008B6.eurprd04.prod.outlook.com
 (2603:10a6:10:4b7:cafe::3c) by DUZPR01CA0299.outlook.office365.com
 (2603:10a6:10:4b7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 16:48:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008B6.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:48:06 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:48:28 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:47:39 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 24 Nov 2026 17:47:34 +0100
Subject: [PATCH v6 01/10] dt-bindings: nvmem: add STM32MPX TAMP backup
 registers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-upstream_nvram_reworked-v6-1-ea0cfccc20b0@foss.st.com>
References: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
In-Reply-To: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B6:EE_|PAXPR10MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 285df87d-8934-43b2-7586-08df4a4ab6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|36860700016|376014|23010399003|82310400026|10067099003|261028144727099003|261022105027099003|11063799006|261021121427099003|56012099006|261026121527099003|261021135927099003|261026140227099003|261102123227099003|261009223027099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: fNHxEGW/Jo/uFDfSV1NFkenIDWv7YLr4TV4bK0uo3YawiEPnOqYT2cuuLQyv0Tpy6mlpEj1ByxV8hC1VaEr8O+9woOJVl4iKwmxqnRHv99jgbO8TSm6TuKEoycmAmxdcfRXYOks4f5fW1J+y0mj8ZUx0w2ezhL2xDDPHrIjZtZ24hbLQzfpMU5cGLgm1ddzNrXvSSZNWG0/w8JL3P6MieU/INJFO3kxS+mrWA1LrY0wW7md6ZGp6mQwok5R2ztQ9sRf2L5OdtnMBx+yumwKVmgPvbZiNQlINGWBm4MeFFWwBmHNyjFeYrc0CuFarxCpKRdXOXP19wi1rbV/X4n9vYAXz1tEzEN7zvplQGbfBiDbxuKqKNk1kW7z183Yi3GZaY7CocGBhYqAg7vpMF1EUOQt7jrHK0U9FKt3/b5+fdmcRrAkHcyUMvMRYP2mO2bDybIlhFswtD3XOPotI/cESu+GfjZmFHbciHmoJ0RKO0pI7Bi44XdHYQtuAPKwQdrjxEgzcG/LClZrKvpTbHpAEPdHlGw1F3KEaBdBwmx9g85hh+btWaCm+kN/fQQgWl98JbxGmiSemDXmKF/RitAEvJG2TbGZCjX8zwdxksH2lLw2ws/eVA2lQLvjO6+HMCHtmyXqUP4NhFGyQC+Nv1x0+Rw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(23010399003)(82310400026)(10067099003)(261028144727099003)(261022105027099003)(11063799006)(261021121427099003)(56012099006)(261026121527099003)(261021135927099003)(261026140227099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1B5ErPjXC7kh08cJ0Jir+IGQ7ETeMt0fecVawZuddQ07XnN5CnSayIzdY5f1Lh61pTux5e1Knz9o+BYTuNMlmFVhLydV92C/oKzCR3JqDAZO1moEvuYF1jY3h3ByN0/sLfyoEXIY7mlporbeUaGKCsJV3yU3D9nKpXso3+fTM75LSOpVhHrMSFd36ASb44stnNAdStT7e1ldXfw3t5OG8/Qm0KnDEVf+8vaKItBI1imFap7U0VKKdLpkQYpqk+m2TODJXha8oMOVfIu7v4VdznKMC1VB6i/gw2HDoGsSuUDz4yLKoy5afCtbcIInpWqArstfLf5x2JvWwV4MaUSN8q1b37AaG3CjyQRI6DXdwFCcPb5vfrC/gboztR7pvB9BTCdUOB7XG5dSk6MMs8/x8rYnAjh3XHgeefvIqdSyvJWIDMKPl3RHDG+qGdTuw9Op
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:48:06.3508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 285df87d-8934-43b2-7586-08df4a4ab6c9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB7952
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084818_972320_E2D535B0 
X-CRM114-Status: GOOD (  12.31  )
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

From: Simeon Marijon <simeon.marijon@foss.st.com>

Adds the binding documentation for TAMP backup registers.
The backup registers is a part of the TAMP device of STM32 MPU.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../bindings/nvmem/st,stm32-tamp-nvram.yaml        | 58 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
new file mode 100644
index 000000000000..ae0027c77ce8
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/st,stm32-tamp-nvram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 backup registers as NVMEM
+
+description: |
+  This represents STM32 backup registers area presented as nvmem cells.
+  This contains various information (e.g. boot mode passed to bootloaders).
+
+maintainers:
+  - Simeon Marijon <simeon.marijon@foss.st.com>
+  - Patrice Chotard <patrice.chotard@foss.st.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp15-tamp-nvram
+      - st,stm32mp25-tamp-nvram
+
+  reg:
+    description:
+      TAMP Registers bank location and size.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nvram: nvram@5c00a100 {
+        compatible = "st,stm32mp15-tamp-nvram";
+        reg = <0x5c00a100 0x80>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            /* Data cells */
+            wakeup_sec: tamp-bkp@0 {
+                reg = <0x0 0x4>;
+            };
+
+            boot_mode: tamp-bkp@50 {
+                /*see boot mode selection feature*/
+                reg = <0x50 0x4>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..13f5c94b0bf8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26918,6 +26918,13 @@ F:	Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst
 F:	Documentation/devicetree/bindings/dma/stm32/
 F:	drivers/dma/stm32/
 
+STM32 TAMP DRIVERS
+M:	Simeon Marijon <simeon.marijon@foss.st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
+L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
+
 STM32 TIMER/LPTIMER DRIVERS
 M:	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
 S:	Maintained

-- 
2.43.0


