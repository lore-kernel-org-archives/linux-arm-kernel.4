Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B56606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EtjPM1N6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lV4i1GjC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aCqK1uXLPdCs4Ldkr3opqdXBdv0PuoNLOgXFHdY57+E=; b=EtjPM1N6eMMT3PGHv2SEFp6i/c
	6sdw3MueBOf4uL+nQWmBGGy8lHCcpJ7hY+ffcwfrezEP3/TTq4HPMU6yBUvIFnJu5djkc9vfFstaX
	EmdsWPwFLBRQHZWbrGUPz/28epyIa8DNjDjknd0olFnpGTA6AOL1tRzYulZ0U6AUsr5CAxCR8I/WF
	+HZDkwCiD1nT1F394DXI0LDUgjDiW4aRHWBlVf5O/ZzWwQhL0zoPIYrIE3yj6UC6sav46y5VXR0rV
	IElIOJFZQaDmAJJDRhL2EF7GnW132/7R5XWaQPpqUuXdT6VFL9v7WkssrgjrYSn7C6RF0wN1Dt+XP
	vRbYy7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAM0-00000009TWX-1l2T;
	Wed, 25 Nov 2026 10:35:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAKS-00000009Sjd-3GEk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:34:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24C4442A55;
	Wed, 25 Nov 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795602860;
	b=QmorhgdhUJq+HxjOrX6+ro6UH809pGsL934LliEJJ05rXrHleLWmvx/LbSIbU3tWivEg
	 zh+caRGnk4UgND5awqrcVkrZZatNcwhokCbLUBkxDpsOTlqexWi7Gdh0dO8Nt9ZncHHqf
	 jAjvoLlDLoW4tLx1fd1YUnbfizxKLYS5f4Nt4vAifQ2Z12xUfR2MJvjMXMYzLOcFSRIlJ
	 jyPsbgS5dyHEUHCXye76r44WQWROFF/BSCnjKd2mDTATpdYK+yYoFu5ROMT17s7aJVl2+
	 szaZfuF2NRLRZfDccBn5ue4dqlrWJ4Af1bC5mwdFHsrxMTw1cIAtLc6AE2Y/XZdXruQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795602860;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aCqK1uXLPdCs4Ldkr3opqdXBdv0PuoNLOgXFHdY57+E=;
	b=L7IV/Ke0EuSZo2TkalsM4Y7ckaFEJPYmjagrn5eu3oK5aXLTxbvC5NYveiNzWZzuKpth
	 hHygkG60pps9YcwqV918hkKGzMWGYyYkETLzDxgigk1qf5PWleOPV7pOksAqv+HhhW+XD
	 g59SSAXBAz/Ygf89j1FZnjW+6rfiz4qhRE5C7fsajBM38LpSmSP1EXzTj5LI9p42rSzvn
	 Nm8HGap4Fr90SB/J7R/ZRSw5TtSenddZ5vtKi87o07goxC2IflC73MCDI4Mykfcmq8Mu7
	 VuESHvAzCNpL/ptOmqDUW1XByENpeTEP2QgtdjgU1h7LFOPud4PjSOWRb9WhvWIIL1Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47D9F1F008B2;
	Wed, 25 Nov 2026 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602860;
	bh=aCqK1uXLPdCs4Ldkr3opqdXBdv0PuoNLOgXFHdY57+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lV4i1GjCT7MVEeZP9EKvEKwENMcSxmXaxIL7oX6NTKHU7JPBaNW+rarO5wnZWTBOb
	 lGGBXbqLsSIkjqP5dClO8OqRsok18vrI5f842QQVPq3Z6QKj7ksdau5a+tPeoX7Ss+
	 FW1jXDhZxBBrfAH4szLYxNXHXW25tuxMgqU89kJulTCcr99ucB88uosUN64i8jU52r
	 2t19TZu7Q8GHxHwFI9jSQe1mX6/0QK36PZvxc0tFjmeQv+y31ZgB8plKZ+XjyFKVGs
	 8YLs8VManh7WD9jg17w7+TDafGg1GJCBFSdQT8o2mat1kBMsLZAT8ycq6h8R7qtg4S
	 x+BiNOWXh6C4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C6F404CE50;
	Wed, 25 Nov 2026 10:34:09 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 13:34:10 +0300
Subject: [PATCH v4 2/6] dt-bindings: pinctrl: Add Cortina Systems CS7542
 pin mux
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-cs7542-syscon-v4-2-3337bb0d3b48@gmail.com>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
In-Reply-To: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602848; l=3414;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=GXF3eV4Di05M7txSyaOSbXKuZUwi57EYWkuShSLxJwk=;
 b=pAWFBWv4AImGwJ4AUClltaW/LmOcv8n8fPdvAKH7T07b5F02HYkqOM/eiyHX/CqsaatHb/T20
 OjpwlcGQkgkDrmSTRi0HIPBha1tVzOsQn52mVBb7r9Pu1sFeaIqQU4z
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

Describe the GPIO and UART mux functions and reference the child
schema from the global control block.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/pinctrl/cortina,cs7542-pinctrl.yaml   | 84 ++++++++++++++++++++++
 .../soc/cortina/cortina,cs7542-syscon.yaml         |  4 ++
 2 files changed, 88 insertions(+)

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
diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
index 561bb7b63..fe839e46e 100644
--- a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -38,6 +38,10 @@ properties:
   "#reset-cells":
     const: 1
 
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/cortina,cs7542-pinctrl.yaml#
+
 required:
   - compatible
   - reg

-- 
2.53.0



