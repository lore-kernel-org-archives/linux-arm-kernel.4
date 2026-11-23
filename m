Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EBF606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=447cOwv7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZxxa04A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l9bZ/Z4zkSpMsXFfmdertwdtzZqERHTevFQJLNpFelA=; b=447cOwv7QhdvGwjrMh7m4+jMvI
	3f3/CnWm5rpd+Kb7W6q8UNHhm/Y2GtnL2aPiPemZo6QLi08nTtJX15oJKk2m/UH5FBMmM+7cKUfU8
	i6O+as+UEBB9swAav7ImRxgdZl6XF4XYg6CPTapO3wD4cdNbHFjj5tLx0geQp9D0qlY2KnsmCcyBs
	6dUzotDGWMmd+aptlFaMN00KOgrUoKLrGVxiA4mnY3e0YDpWkuKxj1ACBGPRNU2KjNQW7Ra4uWKuv
	zN6Nn4IkNb+KUho1qArbKOWgx9pK8/HkyhJElpNZxRVvl/f19tYRlyvyU7rse6rxv8tfYtNwdRDJa
	RSy7XSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVadB-00000004p3x-2mg2;
	Mon, 23 Nov 2026 20:27:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVad6-00000004p29-1ga6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:27:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D61246247B;
	Mon, 23 Nov 2026 20:27:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465631;
	b=ocUAre5jzjdFwaZ3XsZ1cGNxt/mhsn2oNzUixHR1eEfjSoqzz3DmRzqGbs6Xfm46P/2o
	 QVUNWIBwCf6mMeewPYPy/YnWSO6fJMbe1iJwC20CKZLqPIkAX0GQAcWfAK7sI71kz7A+7
	 PMZctTjS9pjAIL9POFxf8OBxorpgrs5+qcOD5JkFz3cxC4tZeNHgeH9IcT4S9qm+qjnoQ
	 UDwAgS0dHULEVU/mtxthg/zthBEaDL8ZoZCzKLRpsNxe24bq5gY4582bfGqZeIVXurrb1
	 LBT4H1XmLJ+OITTNtOwRxs31gRDveo/WSfHTSGa1DEKGgO6nzbYVNbLlqo9p5qqKnVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465631;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l9bZ/Z4zkSpMsXFfmdertwdtzZqERHTevFQJLNpFelA=;
	b=m2GlYTHjvOmipwh+kv31HLn6CoIRhotHcWdYhElbXBKU1+M4U8qC4tpDxtnfTiIGHqzQ
	 17mvrtPx4kR6R0nS743zfyp61MZIp8CN8P3VcndLGWiLfHPSUpSWWlZKP1NKoGGSi07/C
	 TjppSiJDjfiQjQmp/UXtFoRCkmX5uz6GXj/C2w+QUpzETlB1R6QksRwCdzg2f1AoE0ocW
	 y/HPfwMJyiEGwBetZJnZgRAAdrLEwLIwraNE0GseXeovR3kv0hLqU1cnxKcr0e/+tX5zl
	 wfg7xvTK9q9wAoL238eVb6M5LhliUL/UVTNFjV3u7dza02jnq9xAvJifbKF+Y2YKAlQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7E741F000CA;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465631;
	bh=l9bZ/Z4zkSpMsXFfmdertwdtzZqERHTevFQJLNpFelA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FZxxa04AzGuPYnQr2KskeCSG0MJQ0sk3iKKrqUNDBfN536EEJ1Nmd3Dl1kAWS4P8P
	 mdw2OsFEVxFKXa7l9cspr61digUMG1XCnprOgN3lTGjh6wFi5iDmjbS3vnU5kWXkOk
	 U3zeE+yw/zbzgIjbjopqo82rtsCVxpl3oZjRptqkq+6C0EpemFr9REDAfQ9QeSUC3P
	 2uxH4YXp2rxwSFER85fe4p/i/NuztU97uvzID2iRCXA35LWONgv+Gq/Gzk70/wCRpA
	 2vO2OFNWzvfmIrUH5KzhdwguAWoqZMKqCm5BY0MRXTQFrTthaGC5ME1wLrfOBy9XJP
	 RTGr+kgKq4+eg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 55A2A4C6D1;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:26:56 +0300
Subject: [PATCH v2 2/5] dt-bindings: pinctrl: Add Cortina Systems CS7542
 pin mux
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-cs7542-syscon-v2-2-1cd74b2522f9@gmail.com>
References: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465614; l=3060;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=F7pjXfN4EBv+S1ypEhkh5BVaKDFizMnbeKv3RXHbfp0=;
 b=1TGJ7kWa2uzt9MgqQ3tCTh3ok8nem6Xw/M61pN6pH/tv9BLuaqQS0yQtb0leMtlPDsi2KgvMP
 7z0anRIgcsRBhtVMIDiXzg/2XN0DcBt3M9dKI+8+Qh02jDtIXHZ2MqQ
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

Describe the GPIO/peripheral selector in the global control block.
Expose GPIO selection for all five banks and the UART signals used by
the OpenWrt port, without inventing routes for other peripherals.
Register offsets and masks are kept out of the device tree ABI.

AI assistance: Codex prepared this change from the existing OpenWrt port
and GPL vendor sources.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/pinctrl/cortina,cs7542-pinctrl.yaml   | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml
new file mode 100644
index 000000000..cd5c81a0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/cortina,cs7542-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 pin multiplexer
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The pin multiplexer is a child of the CS7542 global control syscon.
+  Five 32-bit registers select GPIO mode when a pin's bit is set, or the
+  peripheral signal when it is clear. Pin numbers match the five GPIO
+  banks, from gpio0 to gpio159. Initially only GPIO mode and the UART
+  signals on gpio72 through gpio77 are supported. Other peripheral
+  routes and electrical configuration are not described here.
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    const: cortina,cs7542-pinctrl
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        enum: [gpio, uart]
+
+      pins:
+        items:
+          pattern: '^gpio([0-9]|[1-9][0-9]|1[0-5][0-9])$'
+        minItems: 1
+        maxItems: 160
+
+    required:
+      - function
+      - pins
+
+    allOf:
+      - if:
+          properties:
+            function:
+              const: uart
+        then:
+          properties:
+            pins:
+              items:
+                enum: [gpio72, gpio73, gpio74, gpio75, gpio76, gpio77]
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@f0000000 {
+        compatible = "cortina,cs7542-syscon", "syscon", "simple-mfd";
+        reg = <0xf0000000 0x100>;
+        #clock-cells = <1>;
+
+        pinctrl {
+            compatible = "cortina,cs7542-pinctrl";
+
+            reset-pins {
+                function = "gpio";
+                pins = "gpio37";
+            };
+
+            aux-uarts-pins {
+                function = "uart";
+                pins = "gpio72", "gpio73", "gpio74", "gpio75",
+                       "gpio76", "gpio77";
+            };
+        };
+    };

-- 
2.53.0



