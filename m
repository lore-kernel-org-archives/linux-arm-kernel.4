Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8772A606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1TThAEWY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OahA30Te
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4LIzQt/DQgIXoOZ9O3B+nqftavt+TN5r629iXz/ncPQ=; b=1TThAEWYg8q5zsFJ32EYBq2eEW
	fU2p3SYvNsL7iQp9Tsd8KU5LP5SWlreL+XXOE/RvYrWezW8PZmUuOWuWT1ZEJphmq3eFJ6QbaV1J9
	c4N61yNzJJtcxRlPjMtir7qbnR0rQgkbLLWqxsjIgbZ0rbTniKrZv2JmUqcP3XRRyxvY7P583tbo3
	9hUukZer0S2Eo/3rYmyRqH67hCIpfjHLz71MwjLZhzsWuOLYuol0R8lHFJRtWk+ufHtUgKKw2Fo2C
	Xqk8mOJYid5MDPI0qeOBAan0U4LfMd5rMGkDdmXeykm5cfEv60e/j4Vmov/Uhtpeq3x2ro69Z5IL9
	kDOgLPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMot-0000000Eni5-0u06;
	Fri, 20 Nov 2026 11:30:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMop-0000000EngU-2PjL;
	Fri, 20 Nov 2026 11:30:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54D9A40F10;
	Fri, 20 Nov 2026 11:30:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795174214;
	b=GKEXT4WC79ZBzYhTCc5nablnPQc1DodslTQy3nWjHq4dVINvQD8Mvz1CUL3cWD5Eoz6a
	 WQyoRQBFfIsW8hKZ8MqRAQ93dw/TVJC125njqxPFth2Ynf/USR0H9BD+7gnbvqs4JskPa
	 +WNc6qvyyL/rrXWjsAd1Hla2wmVuqlL6zOgDKJ4Y0/uieuWomwCW7p6IA/oy6vaa7pclS
	 YdmlAkRXU6ZXbZxSMussqTqajTOxdn1+NRGxiDR0sJQBhVB6miEXN9a70/Cm9lJ8e6LU8
	 zn5oi7frTj5EoAmZrwbLMw0JJCOR27lvR1pUXLObcoXab+aQt0HiO0LYYqvFJddkm1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795174214;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4LIzQt/DQgIXoOZ9O3B+nqftavt+TN5r629iXz/ncPQ=;
	b=IcSnGHV2DRHqEzK6ypVEOi+mU5Twldssgdg/rIRz9GfGq+JKmcvIJAQ/eEBq9yw+v1uC
	 +O7OfkNgJpTs0/TFZUku5/mqyQ1P9NVyAndhuoFh2/yqnBZyr7yX5Xy/IzxunYQl/bMga
	 Z2ssNjK6/Mp8J8AyANl9LsPrOFV3NEf1ystpaJIjNM1PUoSnfdmXhT1aOe/eCiEZhAgMx
	 QJDf5AZaakdt88DF8FNJdJVVG6oh7JLJnfWF64ixxm9ZXQ1MK/fbTlHLXC2gHOpK8PIMe
	 KSxtl63b/MmAXTUv8RCjlVWxwIZ9FsstElgwMTECw0mJ3dAVsMWW+iq/nzpjOjDs4xQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 351E61F000C0;
	Fri, 20 Nov 2026 11:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174214;
	bh=4LIzQt/DQgIXoOZ9O3B+nqftavt+TN5r629iXz/ncPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OahA30TeXZzxKF3rGqaZh6zSM7RQniEbSZVIrs7FcKxRFjvfrQ6UIC1SuBuz0NgbQ
	 HIffiT6KhZJeAvkfpbnN++KsC7ZdOrjFlCaiEHLJ8U3UaPGg60J/erhQm64TVQjfoA
	 06jMMIFf8r3MEg7AzMTE0zxgqx56EpV8O5J81M0x/obNaqHCTuKCi6k5jVrSBziRzt
	 z8xcH8wOWwx60ITzz4STRhJqqZ7hqRqd1ELgQtIF++yDEZO72VPmUbWMaP2Sf/ODfi
	 NCfSrUYpasjEo0QKWxWZ9jG/TPLseImsnN3oFyCg8zRKtLsAQ9UcjUyIo4EkXmi6wq
	 /QPscPNcYg0oA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BCA1249855;
	Fri, 20 Nov 2026 11:30:06 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 11:30:06 +0000
Subject: [PATCH v3 1/3] media: dt-bindings: Add Rockchip IEP2 deinterlacer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-iep2-v3-1-e94eb9f629d2@gmail.com>
References: <20261120-iep2-v3-0-e94eb9f629d2@gmail.com>
In-Reply-To: <20261120-iep2-v3-0-e94eb9f629d2@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Alex Bee <knaerzche@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795174206; l=3925;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=n4KILm6BwMQjCx6dZ8wQr4y9LP2CWtSTAmdHnZxoWJU=;
 b=hsHlKx7K4Itk5j9MbN/iCqRwbcU7CUnlLgTKroFPELtGyNV9ZxaqRq16FrbV9ksblX58yvaFd
 PnYf5iMM/gUD5tiiC0f/+7fNgIkZuF6QIrkYYDicVLcreOiC1WSzep6
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
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
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

Add a binding for the IEP2 deinterlacer of the RK3568 and RK3588 SoCs.
It is a different block from the IEP of RK3228/RK3288/RK3328/RK3399,
hence "iep2". The RK3588 block falls back to the RK3568 compatible.

Clock and reset names follow the RGA binding. The resets are optional:
the block has its own soft reset.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../bindings/media/rockchip,rk3568-iep2.yaml       | 95 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
new file mode 100644
index 000000000000..0c7666de19f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-iep2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip IEP2 image enhancement processor
+
+maintainers:
+  - Arun Iyengar <aiyengar1990@gmail.com>
+
+description:
+  Memory to memory video deinterlacer of the Rockchip RK3568 and RK3588
+  SoCs. It has its own IOMMU, with which it shares its interrupt line.
+
+properties:
+  compatible:
+    oneOf:
+      - const: rockchip,rk3568-iep2
+      - items:
+          - const: rockchip,rk3588-iep2
+          - const: rockchip,rk3568-iep2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AXI bus clock
+      - description: AHB bus clock
+      - description: Core clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: sclk
+
+  resets:
+    items:
+      - description: AXI reset
+      - description: AHB reset
+      - description: Core reset
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: core
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3588-power.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      deinterlace@fdbb0000 {
+        compatible = "rockchip,rk3588-iep2", "rockchip,rk3568-iep2";
+        reg = <0x0 0xfdbb0000 0x0 0x500>;
+        interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cru ACLK_IEP2P0>, <&cru HCLK_IEP2P0>,
+                 <&cru CLK_IEP2P0_CORE>;
+        clock-names = "aclk", "hclk", "sclk";
+        resets = <&cru SRST_A_IEP2P0>, <&cru SRST_H_IEP2P0>,
+                 <&cru SRST_IEP2P0_CORE>;
+        reset-names = "axi", "ahb", "core";
+        power-domains = <&power RK3588_PD_VDPU>;
+        iommus = <&iep_mmu>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f4456f4589a1..74a85e1653f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24285,6 +24285,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
 F:	sound/soc/rockchip/rockchip_i2s_tdm.*
 
+ROCKCHIP IEP2 DEINTERLACER DRIVER
+M:	Arun Iyengar <aiyengar1990@gmail.com>
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
+
 ROCKCHIP ISP V1 DRIVER
 M:	Dafna Hirschfeld <dafna@fastmail.com>
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
2.55.0



