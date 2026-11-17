Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88BD606A88F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nCqel1G5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bDgjq6qt5mQy372YVXoX3SsrgTjbojm3RamylfK+X60=; b=nCqel1G5qhKwKJAp4s2XN6JcYi
	A5OdeO7xZ8hapq0s7fdHg4bi8dc2fuxK2GBnWK+adM0dwBe+jIw/xCExDZcG9dAJfMlbJztTtOHcE
	yB8BOPCkXej9GuEvffoiOKw+h5e22f1RZD9E6N4E0iLKvNMXQgQJen7vZnYgtPULyJBIjcHEtHA6c
	A5cP94TCTdK9muvrsPHKgoGLFSXNn1cHlzLM+o7/yiCXRUaxeaLr3NtbmqaNXfAqUmUatogr8/+h7
	ptCU+UTFThJR8Uf9++hC6O+hxo8A87QxoMBuElmbCgfbucl1JWfqDlu9vLdPcanc1sd3Jj/oFMBYf
	INhnO59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEeS-00000004uGC-2Lde;
	Tue, 17 Nov 2026 08:34:52 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEeM-00000004uEU-0w2w;
	Tue, 17 Nov 2026 08:34:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L665nvRdGHTVCxZyOCx4iJFoOUZLUzaPeR1VcIXhjDomrsS4Iiba6zx/gtXdVyVmagJtLW/dtTbwHfXUx75x51BJcSQIOaNFY/MflBdY8PGcvusRBdI/445VHH9/4cGnct0tKT3VjIMSOgF31PWIEX1GpjkxqDwmbTTx0gzf4qMYZuTymgPIWIwRt7vj1mJLgBM49e9Qt0GzpxB2VVHxocjhfJWw0nomMC6dbp9Uhp8qBShAXVHcaqt6ktHYBv4URYx0WkFLfV/TLL3Ats/C1D8qHNbzb/N5qaFHkoOeVO+fir1VDchiWjQebR3y9ibeCDINOSnUr9tiQKD0NAko3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDgjq6qt5mQy372YVXoX3SsrgTjbojm3RamylfK+X60=;
 b=IVDU5msraNrKfL8IcGmBrKbUlhsEuvzTXq8FSEYC71F0haPUp3VNn/YKU7hgDxgqxLGpDd2bSvrxvgvCpHXxY5JcUOaLp5Iob2tbPyYCWapm4Ma4K+TwVA6IN88oopm57Zq9zc2CVQahEzbDyJ8uMgm1CWv1Uf8RtVG2Y5SoIIE0/s4z694FJIA2rG+gytHlqKjw8uYko/OELPPThULlds2FyLb9govbHiajaz3BDs76uqOFGNXqiSDlJ/ozirhXBjMUAzOV6DDb87FAIt89yMY/GXlDogdRwbKThUzQH6RcJW8EjEIm5xZG2FyINFG++a3+kyUB9MVotx3HklFEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR02CA0007.apcprd02.prod.outlook.com (2603:1096:990:5::12)
 by TYSPR06MB6575.apcprd06.prod.outlook.com (2603:1096:400:480::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 08:34:36 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:990:5:cafe::32) by JH0PR02CA0007.outlook.office365.com
 (2603:1096:990:5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 08:34:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 08:34:35 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C5799427EFCF;
	Tue, 17 Nov 2026 16:34:34 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: Gary Yang <gary.yang@cixtech.com>,
	Luo Liu <Luo.Liu@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: add CIX Sky1 USB/DP combo PHY
Date: Tue, 17 Nov 2026 16:34:33 +0800
Message-ID: <20261117083434.3414417-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261117083434.3414417-1-gary.yang@cixtech.com>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
 <20261117083434.3414417-1-gary.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|TYSPR06MB6575:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7448662c-e8ff-4db0-74ea-08df44859cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|10067099003|56012099006|4143699003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261102123227099003|261009223027099003|20046099003|21026099003|22082099003|18002099003|5123799003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 838KfTQFc5Gxbi9NCvQVLGEGgz5iivePtm5AvlvLLR59CWzbw32OG8u7mRQ1JGwoyQvw87Gu5FNG/n/FsyOKVnqm2pRieyX15mrmL0Ds9Hs+4T15LmC//WK8lrqVxennWnNODeDTj0Q4SXolw4HRgL9RvvcleWvBDH2sSFpN6jfhDTRakap+CAoPTWBw1eUjwYFzchvKKLidN0On3l5/2J8pFYUH6QKqrhDaRaDTZLj7Bhv/06PN79YAd172g2nBlfpfnX2+Ye7zOpy3Y3FG3Ya7fp1SRJErOQdpNehlt2vytWTEmJwmZOFBW6iSi1ETMJQ5EWPX6fzSS/qAW5QrndRqk3oZiyF/2/wKD4cbzPbInKCAvjueHZIqzqQDlsnXjlyfjHQ5b3rVxwJfEobUIwewvwWTookv3q+mSL4un9LggxzWYWy3DbYSNSfygW+0BRwBHoaMnqcQbE7ITdb4zvaQ6neM7NlLvQBPYx8fxAgUfY0f83W4wRyW90MgBww43duF5jvi89T6cxvDrng9gqzwNipYkMXzwaMOyxAjDuBIzkak0f6aIQ0vLngPYX7mJdTexZjUkYVr33IUR/rK6LfIzM90my688RyiXkg4KT1Q8xHVnrPvbX4FLpiHr+vfyCOA+nFBjT2II7sbotOLTg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(4143699003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261009223027099003)(20046099003)(21026099003)(22082099003)(18002099003)(5123799003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WSjcyYWoPxzOBx9uwefhSezPI/urhVtTdTeUMVBrALqPBTm/5/OXzQGpZ7gKB3J3A65oNj/3CxPoAyM/gcPlEOCbLOu6MF2jMNgqDG4utIVcqniCkkAnZ00sx5Arsc2SH1+uuOHv4Q1h6+3oX8d3E+nhfdlOGXuMWLNA73MF0UvfiBaP3d1s8uTDuE0hFaIPjp83qxVicGj7nDribcV/L+OOt2kGD31fuI2o6lKocF5Og1qSp4Ke66Desu/rbGmUPitdmfVo3kVMIpE0s6lhBmkT4QU7nALHDP5H0pYOq6VfOBWVw7fGaGMcZuerTnqxj4EgtVRoPXnJQOip1GehFhfDI1EW+SoiByjuxBvG/NxTl4ZwGfYmhY/FqQbnbAUnyoeS6BH4aXXiUtpD+SZQ2KTfnKekiMTdqcAD8/Qyi6XP8d8LA252oytVpe0mjVYd
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:34:35.7569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7448662c-e8ff-4db0-74ea-08df44859cb2
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6575
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_003446_270790_0244F047 
X-CRM114-Status: GOOD (  15.37  )
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

Document the USB/DP combo PHY of the CIX Sky1 SoC. One PHY instance
provides one SuperSpeedPlus USB lane and up to four DisplayPort lanes of
a USB Type-C port; consumers select the part they need with a PHY type
cell, using PHY_TYPE_USB3 or PHY_TYPE_DP.

The PHY performs Type-C plug orientation switching and USB/DP lane
muxing in hardware and is therefore described with the properties of
the common USB switch binding. The plug orientation is switched through
the S5 system controller, identified by the "cix,usbphy-syscon" phandle
followed by the PHY instance index.

Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/phy/cix,sky1-usbdp-phy.yaml      | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
new file mode 100644
index 000000000000..9bdd01e348b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cix,sky1-usbdp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 USB/DP Combo PHY
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+description:
+  The CIX Sky1 USB/DP combo PHY provides one SuperSpeedPlus USB lane and
+  up to four DisplayPort lanes for a USB Type-C port. Which of the two
+  functions is in use depends on the Type-C alt mode and on the plug
+  orientation.
+
+allOf:
+  - $ref: /schemas/usb/usb-switch.yaml#
+
+properties:
+  compatible:
+    const: cix,sky1-usbdp-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    description: |
+      Cell allows setting the type of the PHY. Possible values are:
+      - PHY_TYPE_USB3
+      - PHY_TYPE_DP
+    const: 1
+
+  clocks:
+    maxItems: 1
+    description: PHY APB clock.
+
+  resets:
+    items:
+      - description: PHY core reset
+      - description: PHY APB preset
+
+  reset-names:
+    items:
+      - const: core
+      - const: apb
+
+  orientation-switch:
+    description:
+      The PHY handles Type-C plug orientation switching.
+    type: boolean
+
+  mode-switch:
+    description:
+      The PHY handles multiplexing of the USB and DisplayPort lanes.
+    type: boolean
+
+  cix,usbphy-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the S5 system controller
+          - description: PHY instance index within the system controller
+    description:
+      Phandle to the system controller used for Type-C plug orientation
+      control, followed by the PHY instance index.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for USB, or for DisplayPort when
+          configured into 4-lane mode, which should point to the
+          SuperSpeed port of a USB Type-C connector.
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller.
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the DisplayPort controller.
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - resets
+  - reset-names
+  - cix,usbphy-syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    usbc_phy0: phy@9030000 {
+        compatible = "cix,sky1-usbdp-phy";
+        reg = <0x09030000 0x40000>;
+        #phy-cells = <1>;
+        clocks = <&scmi_clk CLK_TREE_USB3C_DRD_PHY3_GATE>;
+        resets = <&s5_syscon SKY1_USB_DP_PHY0_RST_N>,
+                 <&s5_syscon SKY1_USB_DP_PHY0_PRST_N>;
+        reset-names = "core", "apb";
+        cix,usbphy-syscon = <&s5_syscon 0>;
+        orientation-switch;
+        mode-switch;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&usb_c_connector>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&usb3_controller>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+
+                endpoint {
+                    remote-endpoint = <&dp_controller>;
+                };
+            };
+        };
+    };

