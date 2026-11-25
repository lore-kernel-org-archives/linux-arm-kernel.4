Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBE2606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bnRbFl3m;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=S1aa31r3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bZtvMP9+H7m4O3MSFK4QXTitx+cgmtzv97eFmZZGwz0=; b=bnRbFl3m6r1nuh
	9aOrPD1CF+A/cQqJNMN/zPSr3mMkKJQ63Ic8WJsslhYkNXJclCI60g1d14cZ4FzdvPQqJtzioMwbC
	K9b+vaDDuNEZtszdEr0U3/E+dej8pnqa0+A+7gXcjdvElsmfz2ftakc9qo2U7WD0PJKKqCq1oPzAR
	ExYgQgD3nfcvmyngV5Gl6SgxYq7hUqLvU0TdvKRGhVjejc1QUXwCU07ODAi9PDkg+f8gW787wHEzl
	mgLu58FjYpZp6wIiOH66YYBzJ4hkTqxPQ0lM3JNFKw5Of1H15sbmXLkQlHTjfTojkrPlsL2enxYE7
	wgtSOANbqdoipDrHfZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Wb-00000008gf2-3Z08;
	Wed, 25 Nov 2026 06:30:37 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6WK-00000008gWS-0KOk;
	Wed, 25 Nov 2026 06:30:22 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 2FBCE4C949;
	Wed, 25 Nov 2026 17:30:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795588209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZtvMP9+H7m4O3MSFK4QXTitx+cgmtzv97eFmZZGwz0=;
	b=S1aa31r3AtnJ5RxxiHVQNyc4aBA95Zcvr4TV+PThDlbqsU+leQ/pRjfo+r+RR/NSiDbVDM
	z2v+UkgaJSslZQDjZEyO931qrh/x1kP4kNOTLdYK9dpr9HQQXBnCM2cqdnkoaJLwNEKE7T
	/52ljJixzd3ZNU5g+7+Zbnm1tv9a/zUaBnf96snsmstIL046KgrWzWHYDvH71OADlt71Td
	/06R1qjJzNrWSGj89iJCJhComKQYrZSpBicsHovplUrCn4RgbMKZ9VwVeJVVPvw6AaSJdM
	I1liq9CzVI3xwCzIkP2hOmjCUDk5pLZJwpI9dGFkpQK4L89MIIR4kb3+kHyTlQ==
X-GPT-Reason: legitimate_personal_business_communication. The
	sender domain (d-silva.org) perfectly matches the recipient mailbox
	(alastair@d-silva.org), indicating a personal or professional correspondence.
	The content is a technical patch for a Linux kernel/device tree
	binding, which is consistent with a developer's workflow rather
	than marketing or a scam. The message lacks any urgency, fear tactics,
	or suspicious links, and the subject line is highly specific to
	a technical project.
From: Alastair D'Silva <alastair@d-silva.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 3/5] dt-bindings: PCI: allwinner,sun60i-a733-pcie: Add binding
Date: Wed, 25 Nov 2026 17:29:46 +1100
Message-ID: <20261125062948.1234677-4-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125062948.1234677-1-alastair@d-silva.org>
References: <20261125062948.1234677-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_223020_326711_231127F4 
X-CRM114-Status: GOOD (  13.43  )
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

Add Devicetree binding for the Allwinner A733 (sun60i) DesignWare PCIe
Root Complex controller.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../pci/allwinner,sun60i-a733-pcie.yaml       | 187 ++++++++++++++++++
 1 file changed, 187 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/allwinner,sun60i-a733-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/allwinner,sun60i-a733-pcie.yaml b/Documentation/devicetree/bindings/pci/allwinner,sun60i-a733-pcie.yaml
new file mode 100644
index 0000000000000..71ff657d15c59
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/allwinner,sun60i-a733-pcie.yaml
@@ -0,0 +1,187 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/allwinner,sun60i-a733-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A733 (sun60i) DesignWare PCIe Root Complex controller
+
+maintainers:
+  - Alastair D'Silva <alastair@d-silva.org>
+  - Chen-Yu Tsai <wens@kernel.org>
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description: |
+  The Allwinner A733 (sun60i) PCIe Root Complex controller is based on the
+  Synopsys DesignWare PCIe IP and inherits all common properties defined in
+  snps,dw-pcie.yaml.
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: allwinner,sun60i-a733-pcie
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers
+      - description: iATU registers
+      - description: Allwinner application registers
+      - description: PCIe configuration space
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: atu
+      - const: app
+      - const: config
+
+  clocks:
+    items:
+      - description: PCIe auxiliary clock
+      - description: PCIe AXI slave clock
+      - description: PCIe ITS/master AXI bridge clock
+
+  clock-names:
+    items:
+      - const: aux
+      - const: slv
+      - const: mstr
+
+  resets:
+    items:
+      - description: PCIe controller reset
+      - description: PCIe power-up reset
+      - description: PCIe ITS/master AXI bridge reset
+
+  reset-names:
+    items:
+      - const: core
+      - const: pwr
+      - const: mstr
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: Application / SII legacy interrupt
+      - description: MSI interrupt (when msi-map is not used)
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: app
+      - const: msi
+
+  allwinner,serdes-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Allwinner A733 SerDes subsystem syscon
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: pcie0
+
+  power-domains:
+    maxItems: 1
+
+  vpcie3v3-supply:
+    description: 3.3V PCIe slot or M.2 power supply
+
+  ranges:
+    minItems: 2
+    maxItems: 3
+
+  dma-ranges:
+    maxItems: 1
+
+  legacy-interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI INTx interrupts.
+    type: object
+    additionalProperties: false
+    properties:
+      "#address-cells":
+        const: 0
+
+      "#interrupt-cells":
+        const: 1
+
+      interrupt-controller: true
+
+    required:
+      - "#address-cells"
+      - "#interrupt-cells"
+      - interrupt-controller
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+  - phys
+  - phy-names
+  - power-domains
+  - ranges
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/allwinner,sun60i-a733-pck-600.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@6000000 {
+            compatible = "allwinner,sun60i-a733-pcie";
+            reg = <0x0 0x06000000 0x0 0x00010000>,
+                  <0x0 0x06300000 0x0 0x00100000>,
+                  <0x0 0x06400000 0x0 0x00080000>,
+                  <0x0 0x20000000 0x0 0x01000000>;
+            reg-names = "dbi", "atu", "app", "config";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            bus-range = <0x00 0xff>;
+            device_type = "pci";
+            ranges = <0x81000000 0x0 0x21000000 0x0 0x21000000 0x0 0x00010000>,
+                     <0x82000000 0x0 0x22000000 0x0 0x22000000 0x0 0x06000000>;
+            dma-ranges = <0x03000000 0x0 0x40000000 0x0 0x40000000 0x3 0xc0000000>;
+            clocks = <&ccu 224>, <&ccu 225>, <&ccu 49>;
+            clock-names = "aux", "slv", "mstr";
+            resets = <&ccu 91>, <&ccu 90>, <&ccu 0>;
+            reset-names = "core", "pwr", "mstr";
+            interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH 0>;
+            interrupt-names = "app", "msi";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc 0>,
+                            <0 0 0 2 &pcie_intc 1>,
+                            <0 0 0 3 &pcie_intc 2>,
+                            <0 0 0 4 &pcie_intc 3>;
+            max-link-speed = <3>;
+            num-lanes = <1>;
+            phys = <&combophy1 PHY_TYPE_PCIE>;
+            phy-names = "pcie0";
+            power-domains = <&pck600 PD_PCIE>;
+            allwinner,serdes-syscon = <&serdes>;
+            reset-gpios = <&pio 3 22 GPIO_ACTIVE_LOW>;
+            vpcie3v3-supply = <&reg_vcc_3v3>;
+
+            pcie_intc: legacy-interrupt-controller {
+                interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+            };
+        };
+    };
-- 
2.53.0


