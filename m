Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8088A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U/IQLDqG;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=qYrec4g2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZRjZOv/8i6ieYj7D2uL3BhEUUZX4Fu4OCFhUQZQpJ/Q=; b=U/IQLDqG8wR8xa
	t8WbNJcKmb+1Ga5OIOkAmPcohfZd+uTfXb95Wywre+FvmZPWGLrSvQ2ig1zvTxR1Hwe7UlEE56geI
	hlls0SOchBq5pD0XFVOTHSwqIAPomGq0eN/xZb5NYdaUnWKehxVyoJ+nYOkbo95RTBvBj8kudY0QR
	1wAQNRdJyppwl5JSB3lheEgfZ7RVXHRABGYA+izKYYtFRnI33dtSFfaqS5tX7UmzmvD5kmy24covy
	u8h9WlFAOAXDTIOVNubiU75B4wD738jMTmpU5XgcLvThl8ANk4KL/OxWQ515t7GVa8Anz60raofZh
	+Kd71Ay6Naa9/eGbtETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKBj-0000000BLIi-0nPz;
	Wed, 25 Nov 2026 21:05:59 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKBW-0000000BLGd-0r1U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:05:51 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 9F6E24C95E;
	Thu, 26 Nov 2026 08:05:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795640738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZRjZOv/8i6ieYj7D2uL3BhEUUZX4Fu4OCFhUQZQpJ/Q=;
	b=qYrec4g2dcaHEqYhOV8PM6G85OTouIfVkJSHtEtMuqsAeEwbFyIVRPtA4i22qwHYVnDJls
	Cp9R5Xyp3NSxeRednoIKv0cRQUz/ugYNZJfJaIjR84HyTlqRbosxaplZuio8rm1kqlCIud
	i8592KtFCDhEjtJuP88QaMjSu3Kvxke5oea7l+K4RR4V4Kd2+ao5ol1DCzzDrEZbx6TWVk
	JfNp3Ks5nfiROgAGr6UToK2l+8JbflarEJVFKqM7ZzbIs3zd54hTr+6bwU6Eknm98lJ7Kv
	9ZihY1szrkqDVa3at+LDgCN+SVLzknRf/FI7SrzFVR5WqP9FhUbE210gMItRyw==
X-GPT-Reason: This is a legitimate personal/professional correspondence.
	The mailbox (alastair@d-silva.org) perfectly aligns with the sender
	domain (alastair@d-silva.org) and the content is a technical patch
	submission for a Linux kernel-related project. There are no phishing
	indicators, no urgency/fear tactics, and the subject line corresponds
	directly to the technical documentation provided in the body.
From: Alastair D'Silva <alastair@d-silva.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 1/4] dt-bindings: crypto: Add Allwinner A523/A733 Crypto Engine
Date: Thu, 26 Nov 2026 08:05:29 +1100
Message-ID: <20261125210532.695823-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125210532.695823-1-alastair@d-silva.org>
References: <20261125210532.695823-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_130549_564343_12C621CC 
X-CRM114-Status: GOOD (  14.32  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the Allwinner Crypto Engine v5 on A523 and A733 SoCs.

The A733 block is register-compatible with A523 and adds an optional
low-power/entropy control register. The separate CE_SYS clock and reset
belong to the secure TEE instance and do not apply to this node.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../crypto/allwinner,sun55i-a523-crypto.yaml  | 68 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/allwinner,sun55i-a523-crypto.yaml

diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun55i-a523-crypto.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun55i-a523-crypto.yaml
new file mode 100644
index 000000000000..00606c7dcfc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/allwinner,sun55i-a523-crypto.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/allwinner,sun55i-a523-crypto.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner Crypto Engine v5
+
+maintainers:
+  - Alastair D'Silva <alastair@d-silva.org>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun55i-a523-crypto
+      - items:
+          - const: allwinner,sun60i-a733-crypto
+          - const: allwinner,sun55i-a523-crypto
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: Module clock
+      - description: MBus clock
+      - description: TRNG clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+      - const: ram
+      - const: trng
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
+
+    crypto@4603000 {
+        compatible = "allwinner,sun60i-a733-crypto",
+                     "allwinner,sun55i-a523-crypto";
+        reg = <0x04603000 0x1000>;
+        interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_CE>, <&ccu CLK_CE>,
+                 <&ccu CLK_MBUS_CE>, <&osc24M>;
+        clock-names = "bus", "mod", "ram", "trng";
+        resets = <&ccu RST_BUS_CE>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3..757ab4e59f61 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -892,6 +892,12 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
 F:	drivers/media/platform/sunxi/sun6i-mipi-csi2/
 
+ALLWINNER CE V5 TRNG DRIVER
+M:	Alastair D'Silva <alastair@d-silva.org>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/crypto/allwinner,sun55i-a523-crypto.yaml
+
 ALLWINNER CPUFREQ DRIVER
 M:	Yangtao Li <tiny.windzz@gmail.com>
 L:	linux-pm@vger.kernel.org
-- 
2.53.0


