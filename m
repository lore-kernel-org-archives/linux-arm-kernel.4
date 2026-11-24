Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5FA606A682
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cXEJWbE9;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AkywgZpa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4cstgabnzyvQWcjW9OtSnLla0UEfMsg39zv/uimwWEw=; b=cXEJWbE9cE9nJO
	tgGjy4JVc8bUAjgCsr4vL14wZuUcC6vuk5ap6sNCvi4eglfU66xXHnsWTUJEHDm0cy8XHwiotvjno
	AI/n/uPozuBmSEprRGIGtojZZ7uECWvj71tGrdHu/HGTWeh6M+j6MZz6P/lQuOGLDJ2rYV1xqOlg/
	SeRrCpPrwWk8cQkzY19BfiCwg52DqZ6KdM3+Tc7stfRt7UaAiQhwhF1RISqg1o2HgTVczYvSz+9Mk
	Wnqst9E/a8hCk3X6PWjCpqRdIL1s0o77k9Okdfsxj0APlZHjG9PkXJugRyt6lVIAtdkKUheBXqrB1
	RTbvdlAHABti4BtRnVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu0C-00000007GJU-1BDE;
	Tue, 24 Nov 2026 17:08:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu01-00000007GDC-2xD9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:08:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BED5016F2;
	Tue, 24 Nov 2026 09:08:05 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E206C3F763;
	Tue, 24 Nov 2026 09:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540088; bh=YFPFNBXhBD1CXPeK2Wq6Z/VUC4VhFtphR7lzgA1Ui78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AkywgZpapMGlKcqTq7iIcGD1bBfvTJ6KlTcC6ZdIc3Ksi7SfxSTnzkZISTGYvJh26
	 phJfE5CVO0p6Zrs/4P9IoWgqLxoU61Y99JWlniUmqcwObJvAcvohBNcVt12ehGVkel
	 +6tMNvOIrgHB314jZwXXuaTOEQ7jQCsmM0/dLilc=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:30 +0000
Subject: [PATCH 02/24] dt-bindings: media: Add bindings for Arm Mali-C720
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Anthony McGivern <Anthony.McGivern@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=3423;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=sgdFsuZ6uHTYokOroU8tJBLGEB1eDQ8iHNdg9OA06Fc=;
 b=PVdqOPaygsmysE/+LcUJtccmw6tfTlTpGOLFVyuW32hdKZizA+axQxuy6aDGiTr/O+2erHFLQ
 B+7mvbv4Sj0D0twl7cLkFf7lFZmC13M0MUqX3Kmp+vj/+POqjql6Ikf
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_090809_856230_7FF5177B 
X-CRM114-Status: GOOD (  12.01  )
X-Spam-Score: -4.4 (----)
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

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add the device tree binding for the Arm Mali-C720 Image Signal
Processor.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../devicetree/bindings/media/arm,mali-c720.yaml   | 134 +++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c720.yaml b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3bd261bcefbe371b7b4610afdde8e556b2a2ae22
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/arm,mali-c720.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali-C720 Image Signal Processor
+
+maintainers:
+  - Anthony McGivern <anthony.mcgivern@arm.com>
+
+properties:
+  compatible:
+    const: arm,mali-c720
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: ISP main interrupt
+      - description: ISP fault interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: isp
+      - const: fault
+
+  iommus:
+    minItems: 1
+    maxItems: 3
+
+  clocks:
+    items:
+      - description: ISP main processing clock
+
+  clock-names:
+    items:
+      - const: vclk
+
+  resets:
+    items:
+      - description: ISP main processing clock domain reset
+
+  reset-names:
+    items:
+      - const: reset
+
+  memory-region:
+    maxItems: 1
+    description: Reserved memory pool for ISP DMA allocations.
+
+  power-domains:
+    description: Power domain containing the ISP.
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: Parallel video input ports.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port 0
+
+        properties:
+          reg:
+            const: 0
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port 1
+
+        properties:
+          reg:
+            const: 1
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port 2
+
+        properties:
+          reg:
+            const: 2
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port 3
+
+        properties:
+          reg:
+            const: 3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    mali_c720: isp@400000 {
+      compatible = "arm,mali-c720";
+      reg = <0x400000 0x200000>;
+      clocks = <&clk 0>;
+      clock-names = "vclk";
+      resets = <&resets 0>;
+      reset-names = "reset";
+      memory-region = <&isp_reserved>;
+      interrupts = <0>;
+      interrupt-names = "isp";
+      power-domains = <&power 0>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          isp_in: endpoint {
+            remote-endpoint = <&csi2_rx_out>;
+          };
+        };
+      };
+    };
+...

-- 
2.55.0


