Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8682A606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bAGi5H6D;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=dxF6mDms
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e/eh1vOuT+TpPDmUDTGrb8/JwSxCiZPJ7zrKwO3AwYI=; b=bAGi5H6D+8k4j/
	sZl4j7fK2+Fz0cb11xgl7A897j6yvRAByEUHRW7wcdUqdDAlJgwFkDTAdPWVeSoH7EBl8ZnBZO6+R
	c/Xy+zWgFoug6hH4wiyk/bsuqlgajGfcSx26t3exRtgfox8RXide0xfODu9FD6qfn7sThzk8g3laq
	RLpRhszwfxoPMk4DSmuPSRnQAtozmQfgqj+OYm2sqZlOzi9j3V1DhOhFc1U1DmRQa0gq1VuV+3T1Z
	u+p5mC3Z6QjAeMrfCOFrpFch7zV5ZwjKcOMzP7Wta115egEL7pPL6SDfE+6Gtah0fmtblFk7MdZ6r
	z/ZZBD99fk4jZ62KsUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9DF-0000000FbSl-3zqZ;
	Sat, 14 Nov 2026 08:34:18 +0000
Received: from mail-m1602365396.xmail.ntesmail.com ([160.236.53.96])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9Cv-0000000FbC2-36c6;
	Sat, 14 Nov 2026 08:33:59 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54aa88680;
	Sat, 14 Nov 2026 16:33:46 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 1/4] dt-bindings: phy: Add rockchip,rk3568-edp-phy
Date: Sat, 14 Nov 2026 16:33:36 +0800
Message-Id: <20261114083339.600986-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261114083339.600986-1-damon.ding@rock-chips.com>
References: <20261114083339.600986-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d930f2b703a8kunmf52e9804102250
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSU4ZVhhCHUIdGhkaTksYSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQ0xVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=dxF6mDmshrFM7qsa/3d9KDS6zRw14BXb5oGzh0K58dDvU1eAtKYSY15bxYCU0hdR9I3lF6QXxDeXYW6v4TeVc1StLuh8ELnqjrA6sVUFb1VjSPDQCaQr1px2hSLh1Il+0EKVExE6zdd1lrIxyBeEQbIOSMrQ6csHF8fPuLbM0tE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=e/eh1vOuT+TpPDmUDTGrb8/JwSxCiZPJ7zrKwO3AwYI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_003358_088206_6122D6A8 
X-CRM114-Status: GOOD (  13.10  )
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

Document the eDP transmitter PHY with Naneng IP block found on the
RK3568 SoC. The PHY has its own register window inside the eDP PHY GRF,
so its node is modeled as a child of the eDP PHY GRF syscon with a reg
property describing that window.

Also add the "rockchip,rk3568-edp-phy-grf" compatible with its own
binding schema, so the shared Rockchip GRF schema is not extended with
per-device conditionals.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Add the reg entry for the PHY node and the ranges/#address-cells/
  #size-cells for the parent syscon node.

Changes in v5:
- Move the APB clock (PCLK_EDPPHY_GRF) from the parent syscon node to
  the PHY node, matching the updated driver.
- Split the "rockchip,rk3568-edp-phy-grf" syscon node to its own
  binding schema, instead of extending the shared Rockchip GRF schema.
- Rename the reference clock to "ref".
- Drop the example from the PHY binding schema, as complete MFD
  examples belong in the GRF binding schema.

Changes in v6:
- Add Reviewed-by tag.
---
 .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 46 +++++++++++
 .../rockchip/rockchip,rk3568-edp-phy-grf.yaml | 80 +++++++++++++++++++
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
new file mode 100644
index 000000000000..06dd1d19dca2
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/rockchip,rk3568-edp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip eDP Transmitter PHY with Naneng IP block
+
+maintainers:
+  - Damon Ding <damon.ding@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description:
+  On the RK3568 SoC the eDP PHY is controlled through the eDP PHY GRF
+  registers, therefore the PHY node is expected to be a child of the
+  eDP PHY GRF syscon node.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-edp-phy
+
+  reg:
+    maxItems: 1
+    description: PHY registers within the eDP PHY GRF.
+
+  clocks:
+    items:
+      - description: Reference clock from the PMU CRU
+      - description: APB clock gating the PHY register window
+
+  clock-names:
+    items:
+      - const: ref
+      - const: apb
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml
new file mode 100644
index 000000000000..852420798f06
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip eDP PHY GRF on the RK3568 SoC
+
+maintainers:
+  - Damon Ding <damon.ding@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description:
+  The eDP PHY GRF is a dedicated register file on the RK3568 SoC,
+  holding the registers used by the eDP Transmitter PHY with Naneng IP
+  block. The PHY itself is modeled as a child node, with its reg
+  property describing the PHY register window inside the GRF.
+
+properties:
+  compatible:
+    items:
+      - const: rockchip,rk3568-edp-phy-grf
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^phy@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/phy/rockchip,rk3568-edp-phy.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      edp_phy_grf: syscon@fdcb0000 {
+        compatible = "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";
+        reg = <0x0 0xfdcb0000 0x0 0x8000>;
+        clocks = <&cru PCLK_EDPPHY_GRF>;
+        ranges = <0x0 0x0 0xfdcb0000 0x100>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        edp_phy: phy@0 {
+          compatible = "rockchip,rk3568-edp-phy";
+          reg = <0x0 0x100>;
+          clocks = <&pmucru XIN_OSC0_EDPPHY_G>, <&cru PCLK_EDPPHY_GRF>;
+          clock-names = "ref", "apb";
+          #phy-cells = <0>;
+        };
+      };
+    };
-- 
2.34.1


