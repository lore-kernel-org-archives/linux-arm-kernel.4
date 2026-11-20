Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32690606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AKtYmx4Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CHvIhMz508UDncotGFKOHG7RFcnM9BHq2q6TuXQUD6w=; b=AKtYmx4ZamaL8Al/jaePQd/jps
	mb7grHFTPUc1eekyY5U28uq+UxsaCWMpKRSG9AePqa0SZqcKPkzEVUWbn1LqbhLRF9K4rFPlpnIKz
	d4wemYUFUyv7D8A2FPNjEYTK+LCtuOHVO5UEj9CBTd9KCyRvWTHNI2HdClXkstGSfjqG0Qwo0/ZJc
	brJSnWez0D6aZKas+FW9D9kvzo1OYY+IaNS9ReW0wheKrnOsfQ5gX9ouJyQWKUwQOkC91UPU/GQ4q
	BCiEBCXZpVoauUpMDJp4ix92kD2fAGjcs1gGX0PPrPsxXTuG1OTW6Q4oAh8RobVlHpA7mKkTCaVS4
	r/fQAjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJfx-0000000EITA-05EA;
	Fri, 20 Nov 2026 08:08:57 +0000
Received: from [64.106.246.77] (helo=mailsc.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJfk-0000000EIOJ-13Qc;
	Fri, 20 Nov 2026 08:08:41 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 00:08:35 -0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-can@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 1/3] dt-bindings: net: can: add Amlogic A9 CAN controller
Date: Fri, 20 Nov 2026 16:08:18 +0800
Message-ID: <20261120080820.3340646-2-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261120080820.3340646-1-zelong.dong@amlogic.com>
References: <20261120080820.3340646-1-zelong.dong@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_000840_295890_86A829D0 
X-CRM114-Status: GOOD (  10.18  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zelong Dong <zelong.dong@amlogic.com>

Add device tree bindings for the CAN-FD controller found on the
Amlogic A9 SoC family.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 .../bindings/net/can/amlogic,a9-can.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/amlogic,a9-can.yaml

diff --git a/Documentation/devicetree/bindings/net/can/amlogic,a9-can.yaml b/Documentation/devicetree/bindings/net/can/amlogic,a9-can.yaml
new file mode 100644
index 000000000000..dd4ad6147f2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/can/amlogic,a9-can.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# # Copyright (C) 2026 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/can/amlogic,a9-can.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A9 SoC CANBus Controller
+
+maintainers:
+  - Zelong Dong <zelong.dong@amlogic.com>
+
+properties:
+  compatible:
+    const: amlogic,a9-can
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: CAN protocol engine clock
+      - description: CAN filter clock
+
+  clock-names:
+    items:
+      - const: can_pe
+      - const: can_filter
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: can-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        can@3a8000 {
+            compatible = "amlogic,a9-can";
+            reg = <0x0 0x3a8000 0x0 0x383c>;
+            interrupts = <GIC_SPI 82 IRQ_TYPE_EDGE_RISING>;
+            clocks = <&clkc_periphs 0>,
+                     <&clkc_periphs 1>;
+            clock-names = "can_pe", "can_filter";
+            power-domains = <&pwrc 2>;
+        };
+    };
-- 
2.47.1


