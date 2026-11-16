Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93424606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k3VCjYBq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l80TddO1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c6Vm071a/dEow9zT0/S+8fxSEB7JBU9lM9yuxvjQ8wU=; b=k3VCjYBqBc1j5E
	fD1J+QHRndxIpFLG7vuMMZ0rPyMVSHq91G8mIvx4sZyI6ni0byK8/gbmlwQ5l704HBmC/+VqsZtSf
	eWICYbNYd4SWmfqvDFNtfU1IslYS0gOozJL0xdUr+pJK29FkVPrZRVqiUujuDkIlbBn18xaJz98Xt
	eNjWRWMzBkGUiyzADmfTvAgPnv0gop2HGYeRde80XxWNKyg7HO501ya2Dy2eI7/M7J085myujwmdz
	oKhiIOwDLkf2OBkc79wPKxUXbDe0c4dh+0aT+JtR9y5nZbotPkhg4/MwHAwVsov5u6zV8L/QXqKHE
	NwITENM/LObAGt4MnwDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUE-00000002mK4-0vJZ;
	Mon, 16 Nov 2026 14:15:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUA-00000002mJX-4900
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:15:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4874B625C7;
	Mon, 16 Nov 2026 14:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808D21F000C5;
	Mon, 16 Nov 2026 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838506;
	bh=c6Vm071a/dEow9zT0/S+8fxSEB7JBU9lM9yuxvjQ8wU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l80TddO1p8vGXVkYshQA/hjFCyQTxsuFEOL38ggGfle1Iu9oypXQQIMaGs4xHLlvc
	 xmMh08EK3fW08igxmnfQuDBdBrl3CC/gn1x25vPIU7YR0NWL3nT3Oqitvux+jRhpHq
	 xXs0VWU5daVMiPTSIG3wXfiDlV+F86sCh0A79n3VWtO9y8A1enW9RlxyZwf5nwihJv
	 2lpf06/GsNQJ1Vt5PfjIBhsLpqnEzQl0bOq4pthbnrg/SaRQe0KZ0GNFl3jAjuwa8f
	 q28pliaDPt6Vz8SU7xc0lYXt22GZLKu/niOpkJ3myrdpQ1gQPhgiBlDRE/ghbnWxOy
	 CSbPw27IASDQA==
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
Subject: [PATCH 1/8] dt-bindings: net: Add MDIO demultiplexer
Date: Mon, 16 Nov 2026 21:54:35 +0800
Message-ID: <20261116135442.4827-2-jszhang@kernel.org>
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

Assume we have the following implementation:
          ----------
          |mmio reg|
	  ----------
             |
 --------    |      -------
 | MAC0 |--MDIO-----| PHY |
 -------- |     |   -------
          |     |
 -------- |     |   -------
 | MAC1 |--     ----| PHY |
 --------           -------

Both MAC0 and MAC1 have MDIO bus masters, and tie together to
a single set of clock and data lines, which go to some PHYs. While
there's a mmio reg to control which MAC mdio master can operate
the single mdio clock and data lines, so only one MAC can operate
the mdio clock and data lines.

We also need to fully support three use cases: only MAC0 + PHY is used
on board; only MAC1 + PHY is used on board; MAC0 + MAC1 + PHYs are
all used.

To support this kind of usage, we need a kind of mdio demuxer. This
patch add the dt-bindings doc.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/net/mdio-demux.yaml   | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/mdio-demux.yaml

diff --git a/Documentation/devicetree/bindings/net/mdio-demux.yaml b/Documentation/devicetree/bindings/net/mdio-demux.yaml
new file mode 100644
index 000000000000..792187d58426
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/mdio-demux.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/mdio-demux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MDIO bus demultiplexer with multiple parent controllers
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+
+description: |
+  An MDIO demultiplexer connects multiple independent MDIO controllers to
+  one physical set of MDIO signals. The mux control selects the parent
+  controller used by each child bus. Child buses and their parent buses
+  are listed in matching order: the first child uses the first parent,
+  and so on. The child's reg value is passed to the mux controller as
+  the state to select for that parent.
+
+properties:
+  compatible:
+    const: mdio-demux
+
+  mux-controls:
+    maxItems: 1
+
+  mdio-parent-bus:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 2
+    items:
+      maxItems: 1
+    description:
+      Phandles to parent MDIO controllers, in the same order as the child
+      buses.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^mdio@[0-9a-f]+$':
+    $ref: /schemas/net/mdio.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        maxItems: 1
+
+required:
+  - compatible
+  - mux-controls
+  - mdio-parent-bus
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    /* MDIO buses registered by two Ethernet MACs. */
+    mac0_mdio: mdio-0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
+
+    mac1_mdio: mdio-1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
+
+    mux: mux-controller {
+        compatible = "reg-mux";
+        #mux-control-cells = <1>;
+        mux-reg-masks = <0x4 0x10>;
+    };
+
+    mdio-demux {
+        compatible = "mdio-demux";
+        mux-controls = <&mux 0>;
+        mdio-parent-bus = <&mac0_mdio>, <&mac1_mdio>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mdio@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ethernet-phy@1 {
+                reg = <1>;
+            };
+        };
+
+        mdio@1 {
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+...
-- 
2.55.0


