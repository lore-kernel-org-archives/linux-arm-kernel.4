Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED19606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=32aZQFZe;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fAyAtLym
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jNPW/Pg0JpLswGfcRTLclR+xYs8LeJ8SC8w+XDaMugA=; b=32aZQFZepz5qWh+z/9uh1trDWx
	ZS0j0tn6F/61cUw+g/C8obeXIyhvNhTycjq1/WcpIB1VFp6TQ56rKRrH/ZXWoZ4/1qSd/sxjR0fEk
	P5DutzzlcwIZy1I9vP/rTGChCCpWpdYMnNAE7Fy7rWiA2jW2iPAqOsMDChOOw0JqXukaWp0cFJEZp
	Q3HsDuATtErIl9XYiBW8ts2yD4rBYIrbPQjd9LRcz8zE+VnigjzR5ZPeIrV9+bmO9O7BCDil+mPJj
	jpfK1X5VVR+q8hCK03uNMKqJi1g+WAbL9XFwUSdMqpYCwZ+3RLlR7j+EiDdnX5Fh0VEscSq6ZItnk
	Haf6WapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYrN-0000000DDX0-3dwo;
	Thu, 26 Nov 2026 12:45:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYrB-0000000DDLj-02ck
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:45:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8C944401B;
	Thu, 26 Nov 2026 12:45:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795697144;
	b=P0Sg6LSbajJIR3WKQ6i7HEyesqh9Nbm3+BHU4LqrV1UVg25tcDGISZxoaMKgpGNbWuot
	 +h0DvS2t4WLkiIU3dH7dn7aBEiQO2p8dRnSmXAPrxGgLsm3uFzCR9CFSRjqu3LfXSEGqm
	 WiLwi1lBgOkaRh+bG/rCNtUmHDjX0R3iliM2xsgraeuqWbiLU0/csFPG19QDb5f8m3anl
	 JKcbbL3PcaVbjzk5eecgD+QahCzo5HSLhcBJAzfQXpoIRz5nlKTr+bWNnYbyitKUNl9HS
	 pXiuyjISIS8o+M/PJs91cNzS2MGthrTwuXjlAdHB9MmGAiN78J1BXN64ZmP0QbNuvkQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795697144;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jNPW/Pg0JpLswGfcRTLclR+xYs8LeJ8SC8w+XDaMugA=;
	b=R/l5gmLQ2hL0Z6aoUJxwlSl2/GfxiNzU2hhDylKTDwTuzHsQPRsmbHkCgW/fhHInCv9p
	 G0SOhVRUBstWhJSsgzXBwZuAAwcqRfcdThN80tctYbVRYxzFkRuuQmz1pxLgpBnqstpPa
	 lZHDV10q7Tw8kr1ABETARRnmBTGvnrGZyrLaUg2jIVap9aXOysNof7qi4iG6gLl6OKU4r
	 efGybyXGSy18OAssNPkZmw7I0wieRq+xQx20eGF0qRRIIrkcOtcZn9DXKXC0yjySpTkTf
	 mqC2tUIAw1IGgb5JzPW026muZZsxr+2hCIXZ0o8Wda/vWSowJjUEJA0KfZJmBFGWv+A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68A8B1F000CF;
	Thu, 26 Nov 2026 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697144;
	bh=jNPW/Pg0JpLswGfcRTLclR+xYs8LeJ8SC8w+XDaMugA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fAyAtLympCZdZ2gtQL8PIilffuKrGOtDuMAkL2TmymSzNoEvuPTARkn0H0noZQJHQ
	 u2ApStLtKoMdWM+fcKuRs1VdDntj7gIqry6hMRnoJB1KwU/E4L5bOeZTQcXrXGY4II
	 K0uZWvAGrxqrHqFEE1/vloLExjAa6GUtzKzSKSmbRs61oWeAGeSOU1Qj6T3HPbgkbl
	 GkF/AXw+j/ck2nGr6sjNGTFzGl3NVaqtz9/BYGx8t//DDLwFt4alvnWq0F4yjIWZRQ
	 qgHYu43hJgL7n+TZozM03UFICrreqdxuMUxA5+2e47IvKKobJ/Oay/2VOc6yFgC5ch
	 mchaMNxTBoqOA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7EC014D50A;
	Thu, 26 Nov 2026 12:45:33 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 15:45:31 +0300
Subject: [PATCH net-next v3 1/3] dt-bindings: net: Add Cortina CS7542
 network engine
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-b4-cs7542-ethernet-v3-1-5db5d372e1bd@gmail.com>
References: <20261126-b4-cs7542-ethernet-v3-0-5db5d372e1bd@gmail.com>
In-Reply-To: <20261126-b4-cs7542-ethernet-v3-0-5db5d372e1bd@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795697132; l=5895;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=gW8wVv5EV4Zs86pnqMUV410Pvkh5hZkkf0TYPGZzyKQ=;
 b=k3XvSJ7GuhEEjrXXkxR+U0jWmnfJV1toVfJrUM4LtgrMKLnYbaoRI8THvHXBVDwQWneharEB8
 1+25JD8YHCbA5fcsuO8K663bUjMAjtNoS8R5yHQF1wB9may7BUOlWVJ
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the CS7542 network engine register windows, interrupts, GMACs
and reserved queue-manager memory. Require exclusive ownership of the
seven NI/FE/TM/SCH/QM/DMA/NI-XRAM reset controls from the global provider.
The shared DMA line includes both LSO and SSP. Use rgmii-id for the
example switch peer which inserts RX and TX clock delays.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/net/cortina,cs7542-ethernet.yaml      | 162 +++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml b/Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml
new file mode 100644
index 000000000..c5ba9b30e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/cortina,cs7542-ethernet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 network engine
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description: |
+  The CS7542 network engine contains three GMACs, the network interface (NI),
+  forwarding engine (FE), queue manager (QM), traffic manager (TM), scheduler,
+  CPU XRAM interface and packet DMA. The CPU datapath uses the DMA-LSO TX
+  queue and QM-managed RX buffers. The complete DMA-LSO/SSP register block
+  and the combined reset domain must be exclusively owned by this device;
+  a separate SSP DMA consumer cannot operate concurrently. A NAND controller
+  using PIO does not consume that DMA block.
+  The three GMAC station addresses share their first five bytes in NI
+  registers; only the last byte is independent for each port.
+
+properties:
+  compatible:
+    const: cortina,cs7542-ethernet
+
+  reg:
+    items:
+      - description: NI registers
+      - description: Complete DMA-LSO and DMA-SSP registers
+      - description: FE registers and indirect table interfaces
+      - description: QM registers
+      - description: TM registers
+      - description: Scheduler registers
+      - description: CPU XRAM
+
+  reg-names:
+    items:
+      - const: ni
+      - const: dma
+      - const: fe
+      - const: qm
+      - const: tm
+      - const: sch
+      - const: xram
+
+  interrupts:
+    items:
+      - description: GMAC0 CPU receive queue interrupt
+      - description: GMAC1 CPU receive queue interrupt
+      - description: GMAC2 CPU receive queue interrupt
+
+  interrupt-names:
+    items:
+      - const: eth0
+      - const: eth1
+      - const: eth2
+
+  cortina,global-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Global control syscon for network drive strength and status.
+
+  resets:
+    items:
+      - description: Network interface reset.
+      - description: Forwarding engine reset.
+      - description: Traffic manager reset.
+      - description: Scheduler reset.
+      - description: Queue manager reset.
+      - description: Shared DMA-LSO/SSP reset, exclusively owned by this consumer.
+      - description: Network interface XRAM reset.
+
+  reset-names:
+    items:
+      - const: ni
+      - const: fe
+      - const: tm
+      - const: sch
+      - const: qm
+      - const: dma
+      - const: xram
+
+  memory-region:
+    maxItems: 1
+    description: |
+      Reserved no-map DDR region used by the packet queue manager. Initial
+      support uses the upper 64 MiB of the 512 MiB DDR layout at 0x1c000000.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^ethernet-port@[0-2]$":
+    type: object
+    $ref: ethernet-controller.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        maxItems: 1
+      phy-mode:
+        enum: [rgmii, rgmii-id, rgmii-rxid, rgmii-txid]
+    required:
+      - reg
+      - phy-mode
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - cortina,global-syscon
+  - resets
+  - reset-names
+  - memory-region
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/cortina,cs7542-reset.h>
+
+    ethernet@f0010000 {
+        compatible = "cortina,cs7542-ethernet";
+        reg = <0xf0010000 0x500>, <0xf0090000 0x800>,
+              <0xf0020000 0x4000>, <0xf0030000 0x400>,
+              <0xf0040000 0x800>, <0xf0060000 0x100>,
+              <0xf0400000 0x100000>;
+        reg-names = "ni", "dma", "fe", "qm", "tm", "sch", "xram";
+        interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "eth0", "eth1", "eth2";
+        cortina,global-syscon = <&global>;
+        resets = <&global CS7542_RESET_NI>,
+                 <&global CS7542_RESET_FE>,
+                 <&global CS7542_RESET_TM>,
+                 <&global CS7542_RESET_SCH>,
+                 <&global CS7542_RESET_QM>,
+                 <&global CS7542_RESET_DMA>,
+                 <&global CS7542_RESET_NI_XRAM>;
+        reset-names = "ni", "fe", "tm", "sch", "qm", "dma", "xram";
+        memory-region = <&qm_reserved>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-port@1 {
+            reg = <1>;
+            /* Fixed MAC-to-switch link; peer inserts RX/TX clock delays. */
+            phy-mode = "rgmii-id";
+            fixed-link {
+                speed = <1000>;
+                full-duplex;
+            };
+        };
+    };

-- 
2.53.0



