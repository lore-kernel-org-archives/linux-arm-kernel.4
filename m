Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91755606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dHBL9IAB;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=XzGArB9/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0R4ASB7SjKyeA0M33Yk9VA1tZHdpbIHAE/YA5+B9MfA=; b=dHBL9IABKw2MSy
	uQ4KXLg/XAjjK8USg2MNZK1CH83YLrnNKhyVbiWRmM/G/atJ4uCCGrQh+N4BucJDDCiH/ivKnwgiD
	EQzfzzMbysH6+k92ifzWT7GJuC0Zh/AYJvb1+D9g6OqpBsH9lA1/J3MC+SAjk4MrHuwUOc55ycQXK
	8/ESZT8waoMfGqO216YZOHZ3/OWRj2415y6l6pROz6tqfSNrDGxXV4ucIaDz+0xwyKGionhmsi0Ho
	2/HlBRSPcij+49BZCkxCL+XrG74gQh71/DJtpoqMqUpSBv4KoACTwTxYFA4N/UGtELB07u3dje1Re
	fpfLCfDdamWvZZhIQ3uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6WJ-00000008gWs-2Dvr;
	Wed, 25 Nov 2026 06:30:19 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6W4-00000008gSR-2Zif;
	Wed, 25 Nov 2026 06:30:07 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 6C61B4C940;
	Wed, 25 Nov 2026 17:29:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795588196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0R4ASB7SjKyeA0M33Yk9VA1tZHdpbIHAE/YA5+B9MfA=;
	b=XzGArB9/Y1KL5VmP4qd+YqweVeWV6JohoamDplXmk7uFU+uasBCMtbG0JsInuTXxIPAhBD
	UQA5G+VKt8m2YzyEGCdxh7UI7cadLdNMX1zyGtdA6go5p2ug6c0W86nNc8XwbcczTNPbXw
	2/XEA4VH1T/YlCmWYu6rDVS4l6e6mVlAqOU3aZ+uzMKYfUbunsAH9P1LSz7q5QUYmZF98/
	XaDp1vC04xHw0zmr9t+zjfTe66WZtUcI2y1THKBZCyCie3P8uvJ1MKBZdw0ezn0QE9idma
	yKWDS7d9sM95B3haG5LfT62+nZFwKdH8CI8+WFsJO2gkU9Fn/qA73O+1FASufg==
X-GPT-Reason: legitimate; the email is a technical patch submission
	for a Linux kernel-related project (devicetree.org) which aligns
	perfectly with the personal mailbox of alastair@d-silva.org; the
	From domain (d-silva.org) matches the sender identity and the
	personal mailbox context; there are no marketing signals, scare
	tactics, or suspicious links, and the content is a standard, professional
	technical contribution.
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
Subject: [PATCH 1/5] dt-bindings: phy: allwinner,sun60i-a733-combophy: Add binding
Date: Wed, 25 Nov 2026 17:29:44 +1100
Message-ID: <20261125062948.1234677-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125062948.1234677-1-alastair@d-silva.org>
References: <20261125062948.1234677-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_223004_807742_C77B0237 
X-CRM114-Status: GOOD (  11.84  )
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

Add Devicetree binding for the Allwinner A733 (sun60i) Cadence Combo PHY
and register the SerDes subsystem syscon compatible in syscon.yaml.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../devicetree/bindings/mfd/syscon.yaml       |  1 +
 .../phy/allwinner,sun60i-a733-combophy.yaml   | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 945a168b613db..e58f5004c8cda 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -30,6 +30,7 @@ properties:
               - allwinner,sun8i-h3-system-controller
               - allwinner,sun8i-v3s-system-controller
               - allwinner,sun50i-a64-system-controller
+              - allwinner,sun60i-a733-serdes-syscon
               - altr,l3regs
               - altr,sdr-ctl
               - amd,pensando-elba-syscon
diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml
new file mode 100644
index 0000000000000..5e6727acb832a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/allwinner,sun60i-a733-combophy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A733 (sun60i) Cadence Combo PHY
+
+maintainers:
+  - Alastair D'Silva <alastair@d-silva.org>
+  - Chen-Yu Tsai <wens@kernel.org>
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description: |
+  The Allwinner A733 (sun60i) SoC integrates a Cadence Combo PHY within its
+  SerDes subsystem, supporting PCIe Gen3 (up to 8.0 GT/s).
+
+properties:
+  compatible:
+    const: allwinner,sun60i-a733-combophy1
+
+  reg:
+    maxItems: 1
+    description: Cadence Combo PHY PMA/PCS analog registers
+
+  allwinner,serdes-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Allwinner A733 SerDes subsystem syscon
+
+  clocks:
+    items:
+      - description: SerDes PHY clock (100 MHz)
+      - description: SerDes AHB bus clock
+      - description: SerDes MBUS clock
+      - description: Reference oscillator / DCXO clock
+
+  clock-names:
+    items:
+      - const: serdes
+      - const: ahb
+      - const: mbus
+      - const: ref
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  phy-supply:
+    description: 1.8V SerDes PHY power supply
+
+  "#phy-cells":
+    const: 1
+    description: PHY type (e.g. PHY_TYPE_PCIE from dt-bindings/phy/phy.h)
+
+required:
+  - compatible
+  - reg
+  - allwinner,serdes-syscon
+  - clocks
+  - clock-names
+  - resets
+  - power-domains
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun6i-rtc.h>
+    #include <dt-bindings/power/allwinner,sun60i-a733-pck-600.h>
+
+    phy@6ca0000 {
+        compatible = "allwinner,sun60i-a733-combophy1";
+        reg = <0x06ca0000 0x20000>;
+        clocks = <&ccu 226>, <&ccu 68>, <&ccu 81>, <&rtc CLK_HOSC_SERDES1>;
+        clock-names = "serdes", "ahb", "mbus", "ref";
+        resets = <&ccu 92>;
+        power-domains = <&pck600 PD_PCIE>;
+        phy-supply = <&reg_serdes1v8>;
+        allwinner,serdes-syscon = <&serdes>;
+        #phy-cells = <1>;
+    };
-- 
2.53.0


