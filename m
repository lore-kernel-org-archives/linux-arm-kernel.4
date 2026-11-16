Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE9A606FE99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2zQ3XT4U;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=jERngUQc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IGnOiA0x9CKr+L+HJwDstHQe2wKKE1kXCubYYWWblik=; b=2zQ3XT4UHiAgtc
	v2awHTOygEXGF7vVOYWtuOrpW9RWx0BG0L93NlTHb+FbQgXkeq4I3KESrqAd9j2o4Z5+LxMtuO665
	rbat4pqp04wbkiGYE7pBSjS06oJ9Gv4mM/QWQbVnVlLVFg80aqE0oA+NXYZRk73PryHwpLRzQirLF
	KVd+lroOyEJFqVTB9B5ZgsPxCWyD+K8nAkb4pa4pV53niyhb6DHWDd1LnbHfLJ/jGe57Mn7ka1eB+
	lBtZ2UDpChcDWBQA1c/1p6g0NW9tqJDMSpLtcIwMuM9HS6bs66Esgj1YkcrPhAgJOePLiXKMDK6II
	ItSj4/MwUm1Ce0xrnFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSujJ-000000029KJ-0a9N;
	Mon, 16 Nov 2026 11:18:33 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSujB-000000029Fb-25Gr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:18:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBA5910D4A6;
	Mon, 16 Nov 2026 12:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794827899; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IGnOiA0x9CKr+L+HJwDstHQe2wKKE1kXCubYYWWblik=;
	b=jERngUQcHDXF+liNkWwQLn7p0Sfrg8qk/uCZkc93jBVbfYavQfTYJI/3A1XrNwnXB/Ped3
	hLcZmSSjfUqgroAmCum/gud97Ta02C6vmC/5izv8puQnik1jzNYSbM85BwJKU7+vtwYbLh
	pBJr5iRQd9PULMWXrmUve4vClQvGiLjLzBdM9jUbeM8le5SqzwXJvDLK9S6tdU5Avuq0eW
	2dhhHaS2wzX5xAcuLcip0l4b7I+6gnQ/sz1fHHaVjLwfjRIoVdvXjGChRws4zPhuscgpaX
	hOqg9fJGwRu354gaEE5gszC95i4oYS6b4OL7/87eLGaj+ed8xfqy/NY5NiGQEw==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v3 2/3] dt-bindings: hwmon: Add National/TI LM77 temperature sensor
Date: Mon, 16 Nov 2026 12:18:01 +0100
Message-ID: <20261116111802.2442456-2-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116111802.2442456-1-lukma@nabladev.com>
References: <20261116111802.2442456-1-lukma@nabladev.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_031825_751732_2C8A0A25 
X-CRM114-Status: GOOD (  15.68  )
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

Add binding description for National/TI LM77 temperature sensor.
When compared to LM75 - it has two output pins one for interrupt
and another one to signal the critical temperature alarm.

It also has only two I2C address pins (A0 and A1) - possible I2C
addresses are: 0x4[89ab].

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v3:
- New patch, as this IC description is added to Documentation/hwmon
  as a separate entry and not to trivial devices
---
 .../bindings/hwmon/national,lm77.yaml         | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/national,lm77.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm77.yaml b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
new file mode 100644
index 000000000000..fbb6e711342c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/national,lm77.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: National Semiconductor / TI LM77 Temperature Sensor
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  The LM77 is a 9-bit plus sign digital temperature sensor and thermal window
+  comparator with a 2-wire (I2C) interface.
+
+  Unlike the LM75, which has a single alert output, the LM77 features two
+  separate open-drain outputs: an Interrupt (INT) output and a Critical
+  Temperature Alarm (T_CRIT_A) output.
+
+properties:
+  compatible:
+    const: national,lm77
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C address of the device. Depending on the A0 and A1 pins, this
+      can be 0x48, 0x49, 0x4a, or 0x4b.
+
+  vs-supply:
+    description: +VS power supply regulator.
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+    description: |
+      The LM77 has two open-drain interrupt outputs.
+      - The first interrupt should be the INT pin (window comparator).
+      - The second (optional) interrupt is the T_CRIT_A pin (critical
+        over-temp limit).
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@49 {
+            compatible = "national,lm77";
+            reg = <0x49>;
+            vs-supply = <&vcc_3v3_reg>;
+            interrupt-parent = <&gpio1>;
+
+            /* INT routed to GPIO1_12, T_CRIT_A routed to GPIO1_13 */
+            interrupts = <12 IRQ_TYPE_LEVEL_LOW>,
+                         <13 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
-- 
2.39.5


