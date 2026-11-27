Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7957606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ude204B;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=qcaOcjvi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C+bJ9BBOPuWSSh0Gw46vWQDy5ZamIjfZNZHevfz3nu0=; b=2ude204ByQOFq2
	GxfB9cUolgEB016WiTJp80RoSdiVplAMumV/muD2UmhQewZgbXD+OKr5EA1pbqbjPJY+qPrgnon7U
	mmq+0sTIbm4hNlv7DkEZIK7Y7l6TsAYGY30/rq0kj3RH1PV3DB9fCoojjG3o83uHEH6mgP8fAyQ0i
	zQ03FIdGJwmlk1ZlDR8e+jq3t0Is5VEGqr0lDogEZQpqNVBN2W8WaLBj8t/0Dcg+NUJ0L4KJdmASy
	9kdebMvjSAZQTjHK0P181P6lM2/tTZ6UAOSPRhAuTn/GGT4g6rj9cI6YBCz+zAONW+4yaOZ1jBLFW
	vByTMPQlsmKlXwq+FhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqSQ-0000000F7fi-2kiu;
	Fri, 27 Nov 2026 07:33:22 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqSM-0000000F7cd-0X4T;
	Fri, 27 Nov 2026 07:33:19 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 113F84C95E;
	Fri, 27 Nov 2026 18:33:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+bJ9BBOPuWSSh0Gw46vWQDy5ZamIjfZNZHevfz3nu0=;
	b=qcaOcjvi3dVUx8TonrumqBdoAqrxorkeLAlM4pXhNlRbcECVxHrN91BRIFBEpwX4kEqxkd
	mf9WiwW3E17DwbYjDSMQYn9mw0VrVYS19eErp6uV9BO6xWNPrbUk6EFi5vm/QR8vNMpAz8
	yhSvSpOJ1U8Rw41uQOixLo/RbX4Z3qTLNCl6LSyuIixkFRxDRmfxM6IFaMb67A7dUGPCUB
	tQHMV/QHF624NTFe2i2d8IC3aUicfu3n7p/kL4Oqq6kOPqQbhZjwehU1/bqGwV3tKkx8b5
	JV9TgPrnngW8FIaed19oRaElksuPmeC0Y7e+08U4MGKmkdbwlc8tjA/tqscetw==
X-GPT-Reason: The email is classified as legitimate personal/professional
	correspondence. The mailbox (alastair@d-silva.org) perfectly matches
	the sender identity (alastair@d-silva.org), and the content is
	a technical patch submission for a Linux kernel-related project
	(dt-bindings). The message lacks any urgency, fear tactics, or marketing
	content, and the URL domain (devicetree.org) is consistent with
	the technical nature of the subject line.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 05/11] dt-bindings: usb: allwinner,sun60i-a733-dwc3: Add Allwinner A733 DWC3
Date: Fri, 27 Nov 2026 18:32:25 +1100
Message-ID: <20261127073231.1776847-6-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_233318_378830_61C5A534 
X-CRM114-Status: GOOD (  10.57  )
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

Add DT binding schema for the Allwinner A733 DWC3 USB 3.0 controller.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../usb/allwinner,sun60i-a733-dwc3.yaml       | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/allwinner,sun60i-a733-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun60i-a733-dwc3.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun60i-a733-dwc3.yaml
new file mode 100644
index 000000000000..012247ba0ac2
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun60i-a733-dwc3.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/allwinner,sun60i-a733-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A733 SuperSpeed DWC3 USB Controller
+
+maintainers:
+  - Alastair D'Silva <alastair@d-silva.org>
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: allwinner,sun60i-a733-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: USB2 bus clock
+      - description: USB2 main function reference clock
+      - description: USB2 suspend clock
+      - description: USB subsystem AHB clock
+      - description: USB3 UTMI clock
+      - description: USB2 PIPE clock
+      - description: USB2 system clock
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+      - const: suspend
+      - const: ahb
+      - const: utmi
+      - const: pipe
+      - const: sys
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  phys:
+    items:
+      - description: USB 2.0 PHY
+      - description: USB 3.0 ComboPHY
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  vbus-supply:
+    description: Regulator supplying VBUS in host mode.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - power-domains
+  - phys
+  - phy-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/allwinner,sun60i-a733-pck-600.h>
+    #include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
+
+    usb@6a00000 {
+        compatible = "allwinner,sun60i-a733-dwc3";
+        reg = <0x06a00000 0x100000>;
+        interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&ccu CLK_BUS_USB2>,
+                 <&ccu CLK_USB2_MF>,
+                 <&ccu CLK_USB2_SUSPEND>,
+                 <&ccu CLK_AHB_USB_SYS>,
+                 <&ccu CLK_USB2_U3_UTMI>,
+                 <&ccu CLK_USB2_U2_PIPE>,
+                 <&ccu CLK_USB2_SYS>;
+        clock-names = "bus_early", "ref", "suspend",
+                      "ahb", "utmi", "pipe", "sys";
+        resets = <&ccu RST_BUS_USB2>;
+        power-domains = <&pck600 PD_USB2>;
+        phys = <&u2phy>, <&combophy0 PHY_TYPE_USB3>;
+        phy-names = "usb2-phy", "usb3-phy";
+        dr_mode = "host";
+    };
-- 
2.53.0


