Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B1F606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 14:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ax01kHZK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qU4Ln5CxBhVjmkEhfipukTuR2scl1fb16n9ll8nNZug=; b=Ax01kHZKtjdeBsW05eybOK73Hc
	SK0NJYHtpRbH5LLhZ3IwiBVJCISa2sVAqQcaWKIAgCUS7i4ItqkwJGYYzXWeogb5oOhSSrdyKLYcC
	hWwP5xciAjWncLK1BKl45rtaCZWFbAOHy4ABogAATJ2ntAZo3iUNtDM4NLhMUigJrKEVAQZCtu6I3
	aJ5giwcHn9MvPSGuRD7wVm+HbjqlVsqAg3RCQDDn0x1kgayQO9RSvGj5uhc9nBZSJKbzvqSq29mbk
	X8kOLW1lFe5DbhLyqkGQig2xpPfcwkUbKkHAwZeOU9zuRYjEpJTLJfNekldibmnKaFykNvn3Upxbl
	i3oq0iYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSF9i-0000000GJT8-3Xfi;
	Sat, 14 Nov 2026 14:55:02 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSF9a-0000000GJOA-4Bnn;
	Sat, 14 Nov 2026 14:54:56 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSF9R-000000005Gr-2Ug2;
	Sat, 14 Nov 2026 14:54:45 +0000
Date: Sat, 14 Nov 2026 14:54:42 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: nicolas.dufresne@collabora.com, detlev.casanova@collabora.com,
	paulk@sys-base.io, ezequiel@vanguardiasur.com.ar
Subject: [RFC PATCH 1/6] dt-bindings: media: Add Rockchip RKVENC v1 video
 encoder
Message-ID: <8db82947fc17304e785815a7180d59cbb94b4b35.1794666330.git.daniel@makrotopia.org>
References: <cover.1794666330.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794666330.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_065455_049537_192650F6 
X-CRM114-Status: GOOD (  15.47  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the binding of the RKVENC v1 video encoder found in the RV1109 and
RV1126 ("vepu541") and in the RK3566 and RK3568 ("vepu540"). The block
encodes H.264 and HEVC from raw frames and reaches memory through an
IOMMU.

Describe the register space, the interrupt, the AXI, AHB and core
clocks and resets, the power domain and the IOMMU. The core clock is
scaled between operating points with an optional supply, and the
encoder is a cooling device of the thermal zones.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../media/rockchip,rv1126-rkvenc.yaml         | 104 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,rv1126-rkvenc.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip,rv1126-rkvenc.yaml b/Documentation/devicetree/bindings/media/rockchip,rv1126-rkvenc.yaml
new file mode 100644
index 0000000000000..9a83ce1499493
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rv1126-rkvenc.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rv1126-rkvenc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RKVENC v1 H.264/HEVC video encoder
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+description:
+  The RKVENC v1 encoder found in the RV1109, RV1126, RK3566 and RK3568
+  encodes H.264 and HEVC from raw YUV or RGB frames. It reads and writes
+  memory through an IOMMU with two MMU instances.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3568-rkvenc
+      - rockchip,rv1126-rkvenc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AXI master clock
+      - description: AHB register interface clock
+      - description: Encoder core clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: core
+
+  assigned-clocks: true
+
+  assigned-clock-rates: true
+
+  operating-points-v2: true
+
+  venc-supply:
+    description: Supply of the encoder core, scaled with the operating points.
+
+  "#cooling-cells":
+    const: 2
+
+  resets:
+    items:
+      - description: AXI reset
+      - description: AHB reset
+      - description: Encoder core reset
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
+  - resets
+  - reset-names
+  - power-domains
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rv1126-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rockchip,rv1126-power.h>
+
+    video-codec@ffbb0000 {
+        compatible = "rockchip,rv1126-rkvenc";
+        reg = <0xffbb0000 0xf00>;
+        interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cru ACLK_VENC>, <&cru HCLK_VENC>, <&cru CLK_VENC_CORE>;
+        clock-names = "axi", "ahb", "core";
+        assigned-clocks = <&cru ACLK_VENC>, <&cru CLK_VENC_CORE>;
+        assigned-clock-rates = <297000000>, <396000000>;
+        resets = <&cru SRST_VENC_A>, <&cru SRST_VENC_H>,
+                 <&cru SRST_VENC_CORE>;
+        reset-names = "axi", "ahb", "core";
+        iommus = <&venc_mmu>;
+        power-domains = <&power RV1126_PD_VEPU>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 9cd098f0d91f3..26991dd3a3569 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24544,6 +24544,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
 F:	drivers/media/platform/rockchip/rkvdec/
 
+ROCKCHIP RKVENC VIDEO ENCODER DRIVER
+M:	Daniel Golle <daniel@makrotopia.org>
+L:	linux-media@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rv1126-rkvenc.yaml
+
 ROCKCHIP RK3308 INTERNAL AUDIO CODEC
 M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 S:	Maintained
-- 
2.56.0

