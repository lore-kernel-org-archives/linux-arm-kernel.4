Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F20606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AUacVJhY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BdIE8R/bzxSVd2WmbbN6K8nNATk8upKcAMkubt0TIMI=; b=AUacVJhYZ7orpdGVpD26AhMhHG
	GHu2RiXJftTES5VijT6WXNw2klDGWSM3fZzlaZMIN62lbmqn5bwXK32c3svC4hBsK24miw2oL9V52
	1eamf7fAik97wGda9UfkgCqcU58ZtQRBOnV9kuVjqnrYOOrrktX3XBF+FL9hc6jHKEdYB+pE53m/q
	G3FJL1B58b1zUtKu3GYrcQOB63iK178skVMV1LEtRUHsBqiGXEdSmfVHzeEQEx2qUL+MRR3ntB1UA
	BRkwdM9SidT1mPy8tSfyRHVEOBq4clKK3KnFqZnzxDyJvwfvawtgtrXzqnQGFmUU0A47PQnb96zVa
	SPnAK2pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeEk-00000002VtE-0fxm;
	Tue, 10 Nov 2026 05:17:38 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeEg-00000002VsG-3xeI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:17:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVxekQt7XS9sQR/qUYTp/Q9pOjNe7hCaEfShlgMCHUVkDK4FkR89thRtILLG+26d4mS++rAYDylWwyl6X5h04dXtR3wJ4+WC5Qd1Qy3eXyg5TgNCNNpkKCgP6GlSjPwKRamP0NrNkcP9zJWrYHyxCERuicy2WX1mKFEtToxBUK1hIFz9+zxan7S2Aa48k3lu0/grQ1TjAKZmWZWPRmzdnJHWQTYO7A5CnQ/2oOFZRkq9ROq9XyLRDz3Q0RGXMSTr1NUb17VU/D1W3jUSdATtyZjvE20bmjCkEdXH/wZhMWG1i6G0dJoIMjCjVqlQ/SnFUEZr2Ucjpwndh6CsBmH47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdIE8R/bzxSVd2WmbbN6K8nNATk8upKcAMkubt0TIMI=;
 b=uYeW7jH3VsZVCC4YMJTviIzvx4KdRDtAoBb2SoQnk8542WC9mnFyX7S5K6rXoCPgrllkEaNA4hFMK5TM0JR/DnEdwRZVfgiY3AmmSLzpvpYRSwv5dIP7XSsTSuGG4K4JHm4E5FZQZBGm3ustFqtC7r7YF8anZb47pcU4Ica3tNQY1qW3pYSVCc2XSnMWASi1tOMobCdhicSoainc00MUrXlXqpPJMSef6JnCkUeoHxOjM4ZGTX048OXPHm4ugMn3aSaJlK83DyS7OycSEpeA+Cr91v+zwAJrRUlanxJiB1k1garwQEg04rF1ndICAtAhFgTQbk+bA4XIwiYtQdgkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0005.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::16)
 by SEZPR06MB7289.apcprd06.prod.outlook.com (2603:1096:101:24d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Tue, 10 Nov
 2026 05:17:25 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:301:16f:cafe::9a) by PUVP216CA0005.outlook.office365.com
 (2603:1096:301:16f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 05:17:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 05:17:25 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id F20124102E74;
	Tue, 10 Nov 2026 13:17:23 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	gary.yang@cixtech.com
Subject: [PATCH v3 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C port controller
Date: Tue, 10 Nov 2026 13:17:22 +0800
Message-ID: <20261110051723.434009-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261110051723.434009-1-gary.yang@cixtech.com>
References: <20261110051723.434009-1-gary.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|SEZPR06MB7289:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b942ee5e-2917-47e8-f437-08df3ee9e844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|261009223027099003|261028144727099003|261026121527099003|261021123027099003|261102123227099003|261022105027099003|261021121427099003|261026140227099003|261022075727099003|56012099006|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: iGCP1uIjuaUhOrvGPqIHKbW7QA9aaZCCJ65BP56H+YhC1EVRa9nYXR1FB00UWgJuti/HWMgbUtZcdYEv/ghdwknT93HKQ/KpSS353WXgkaiW8QheRTkzdlwZF4BiUfb/B3z7S9lU5cXuO68O0F2cQQYXUJFVDL5yW/of2ICxw0X6JQTR9FEhOmy2PI1iV+mcIScHlnQHZrHDf4L+6CVATFsdhwdka3nMgStvOt8v5oI2oxp5IZSFdkzbhjPKy3hIjhGAtjyMVKQbqzJCWoi26suRcxh0U2sFmw7Cvv/jm8J/oU81EQNa/n/6Sk8Pm3sdK4DXTklOpLcfNbad6QESSOSiO3ByJl8/oCsItdNt6d3TWBAlB9wq+dfeJROpfG69QZdpoCOEwHDcrDEczxam4NdZ3rTT3l8X5FP2mrnM70LOFIlbhhZgv/eSOyQ8jTRpmcEhJJwaOM0efWQYkhc5hHadwnXClzE4DsT4FPRknX2uVS1Gro9bLAAvONSrJ2ZeXKxgkuLR+pUNVhcy9lxvUwctDUT7ocjy9w8jBnR84R6Wf9o4IMvf0oKiZrMwSWGc6xXg8tt6ob3C4FKP4kdwK9vSKhEUe1O7d89Svgkv9+TvcfMbKw4MqSC4xaSg/2muiUmzBotNeSsNdg/7CTm9kA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(261009223027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261102123227099003)(261022105027099003)(261021121427099003)(261026140227099003)(261022075727099003)(56012099006)(3023799007)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jYSpRs5/ocsNK0ZA5v+BWDVvgkljnw8+CYtACuZ75s3SJFzHE6GJwB31/qTplthvVU+yJoN54RtzXiSKzUnXY+d+Lxk99Tta/ZHUKMyDYPAvuBbaAqQcLZnVgEmouTMLksDwIXMJ84Y9/nzsOO/etshnI7gXfbHOo33vViwnkM8Ck2r9NJE4wIl7VD/HV9qV660rdTEV30VgbieJhWRPl+q1EeTAlLgMsTuVeiL+Th+PyO/pcbXs+H5tmWkzmTsxklWJDFtDx5t6mt14Pehu+1Mevy2Fgtg4UvokDm3WD3cH0oiulL8yHqToVnojj3bTpn6qxwgHpGEoqe7+rYL2+tuXnSwUyc7Ww805sm2L6Zmr3AiLoij56bSPc4/CG+kXUvRJ6mj4gEfwCTjfoqn8stnpo6HPFYQUGUyAfCgcy8ptFtVka5Q+qEVP3xXZoX//
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:17:25.2616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b942ee5e-2917-47e8-f437-08df3ee9e844
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_211734_978238_26F7C206 
X-CRM114-Status: GOOD (  12.53  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the Realtek RTS5453H stand-alone USB Type-C port controller.
The controller is connected over I2C and manages a single USB Type-C
connector, described with the generic USB connector binding.

The connector's OF graph links to the Type-C orientation switch and
mode mux provided by the platform PHY.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/usb/realtek,rts5453h.yaml        | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml

diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
new file mode 100644
index 000000000000..14bbd563e66a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/realtek,rts5453h.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTS5453H USB Type-C port controller
+
+description: |
+  The RTS5453H is a stand-alone USB Type-C port controller with USB
+  Power Delivery support. It is controlled over I2C and reports
+  changes of the port state through an interrupt line.
+
+  Orientation switching and USB/DisplayPort lane muxing are performed by
+  the platform PHY. The controller finds the Type-C switch and mux
+  through the OF graph of its connector node.
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+properties:
+  compatible:
+    const: realtek,rts5453h
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+    description:
+      The USB Type-C connector managed by this controller.
+
+    required:
+      - data-role
+      - power-role
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - connector
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@30 {
+            compatible = "realtek,rts5453h";
+            reg = <0x30>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+
+            connector {
+                compatible = "usb-c-connector";
+                data-role = "host";
+                power-role = "source";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        typec_hs_ep: endpoint {
+                            remote-endpoint = <&usb_hs_ep>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        typec_ss_ep: endpoint {
+                            remote-endpoint = <&usb_ss_ep>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+
+    usb {
+        usb-role-switch;
+
+        port {
+            usb_hs_ep: endpoint {
+                remote-endpoint = <&typec_hs_ep>;
+            };
+        };
+    };
+
+    usb-mux {
+        orientation-switch;
+        mode-switch;
+
+        port {
+            usb_ss_ep: endpoint {
+                remote-endpoint = <&typec_ss_ep>;
+            };
+        };
+    };
-- 
2.50.1


