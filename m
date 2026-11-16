Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8F7606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pmBc0a1l;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCmhV8qt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K5NHzVXY3LRAB3acJJ9610fRkwObgwH6kG7Ys1BqKf4=; b=pmBc0a1la97IzE
	EMtJ5N7v91br1SxOdCC4LW61FPEoVpTy6s2xzuij8V47NhfqQ81gjZHcE2qo0yQf7bw837JjEQjRY
	f9wysmifW93beNKeVabzMnPZOVJpptFVRh82r9j13Xbw7sYbCmF+/hsGBjbCW7mYk12zKaoZYQ1SK
	NapoWUputy7mQkIhelLtD9BSpDffxa5PBL6sUspRFagysSbZO/bxwZ7QF0aKHGPn0Vb3n3kKnXd6h
	DUAh6d2FBLHT1R9uOyOs7dE0mkl0v8AD9bRgd1NW2+7EGNSVI6Zs2tA0mfmZIdTbJUEbA3sJepLg+
	J47mObbjjGFB/Qq1q/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUU-00000002mR5-1lnj;
	Mon, 16 Nov 2026 14:15:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUN-00000002mOA-1dN4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:15:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2832C41E44;
	Mon, 16 Nov 2026 14:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67A91F000C7;
	Mon, 16 Nov 2026 14:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838519;
	bh=K5NHzVXY3LRAB3acJJ9610fRkwObgwH6kG7Ys1BqKf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GCmhV8qttAXwtE2U3WfGcYJoOZxQXn3T24ec0r0wHcRoDrYG24fqdn1QwTQeeIBzr
	 Q9RbjmU2yYDLyLImV3rfJi4dITgG+a70I/YND49iJ+WZJfpWE7vIgpDBcIvfp7Yn/m
	 xOvyVNPJ5N46SHpMArhs0BTb/8j8kgYW0/v/1fMA4j4CpPLe3fIYUL2sEJ/HRrUaPv
	 nK8QQ6XFJUGRaq2fZCitRLP0IpXyFa9PqLA5YBPiJJfS1YuCnwsw1VkBrup34Wpop1
	 /87SDUDWY+r+SyjN2ZagnW8w4MRtW6qU6VGANJefu2w7ARbGRdtlfhilN6Mu8QMGQF
	 vxAiEmk/irFew==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/8] dt-bindings: net: Add Synaptics SL2610 DWMAC
Date: Mon, 16 Nov 2026 21:54:37 +0800
Message-ID: <20261116135442.4827-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Describe the Synaptics SL2610 integration of the Synopsys DWMAC 5.20.
The PHY interface mode is selected through a system-controller register,
identified by a syscon phandle and register offset.

Restrict PHY modes to the RMII and RGMII variants supported by the glue
and extend the common DWMAC compatible list for the new integration.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
 .../bindings/net/syna,sl2610-dwmac.yaml       | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2c4842404bf6..267340a5f45c 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -119,6 +119,7 @@ properties:
         - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
+        - syna,sl2610-dwmac
         - tesla,fsd-ethqos
         - thead,th1520-gmac
         - ultrarisc,dp1000-gmac
diff --git a/Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml b/Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml
new file mode 100644
index 000000000000..0748b623599b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/syna,sl2610-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics SL2610 DesignWare Ethernet MAC
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: syna,sl2610-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: syna,sl2610-dwmac
+      - const: snps,dwmac-5.20
+
+  syna,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to the SL2610 system controller.
+          - description: Offset of the Ethernet interface control register.
+    description:
+      Phandle and register offset used to configure the Ethernet PHY
+      interface mode.
+
+  phy-mode:
+    enum:
+      - rmii
+      - rgmii
+      - rgmii-id
+      - rgmii-rxid
+      - rgmii-txid
+
+required:
+  - compatible
+  - syna,syscon
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    chip: syscon@f7e10000 {
+        compatible = "syna,sl2610-soc-syscon", "syscon";
+        reg = <0xf7e10000 0x10000>;
+        clocks = <&osc>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+    ethernet@f7a06000 {
+        compatible = "syna,sl2610-dwmac", "snps,dwmac-5.20";
+        reg = <0xf7a06000 0x2000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-id";
+        syna,syscon = <&chip 0xa3c>;
+    };
+...
-- 
2.55.0


