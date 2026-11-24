Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B510606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tPlxXFNs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QiwE5SX1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/IFgNsJGkeuNU4ObYMEQqv131/wZU3KxT8YGF0h9LuA=; b=tPlxXFNsiWdD+n
	X7gcuDXeEBuq7rDNK3SV29DoQliCPKkZ+BB4E/5x8cino9GJNT1CimaqVdXhRPbE7gB/9TheGWwK2
	VDq2m4rzQGBpzaVtjHp7513VcECXEztaqqoZJ5Ei5g0txjAqrHtwZcLNLwUPwx6mg+mbzMHpZjwSv
	z5Gd1eGli8PXgzGKTj1f8IJDXs5Fr3kyMDRIoWkS3PxU+vhLfxI0vnjkQoB+X7rz/FWheaNWfuTy4
	UFFxnV3pvGzNDhzebYbHbwNw+MIB+4EcCkHDajYaueJpl/h7d2V8FKF5gIMaqf8Y2HxAFuHpEYTNT
	WmCfwO67oT3QNjgdgacQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQX-00000007lbv-2ZyS;
	Tue, 24 Nov 2026 20:47:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQL-00000007lWU-16Px
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:47:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AB7E42D5F;
	Tue, 24 Nov 2026 20:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853461F000D2;
	Tue, 24 Nov 2026 20:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553252;
	bh=/IFgNsJGkeuNU4ObYMEQqv131/wZU3KxT8YGF0h9LuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QiwE5SX1Yi0ed8cX6cU0GTbqWuvhoGVj91Io6qHSQrGP0bHS/FS6/KnpRgDr+6jOg
	 CkCAiTh1nbh/OJX52+VtVjvMxExjai9F9AIzHXKwPaSAdCVoFnrALKEMqkHPHQ0CLR
	 IViwEwIIV/+FqrSK4q+UdXJpNVPkrsobbA+SOTO+wUm/XlJ3MIOYKHoZpmUpBETTXZ
	 zxb06E0JSSbHH4EnpYlWQkkDDsdycDM3BayAEpUTg3uYeiuiBWQ+skmSdC/Y442pEr
	 rSCKWCFiLRRQhUkAAV13NJpaBR3VnxWJfLoZnzah6Y2Odl12PmPkShyUrtQ0JtFMAh
	 ItDwI12WBfbXA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:34 -0600
Subject: [PATCH v2 1/9] dt-bindings: mfd: Add Marvell AP806/CP110 system
 controller schema
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-dtbs-marvell-v2-1-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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

The Marvell AP806 and CP110 lack specific compatibles. Add a dedicated
schema for the Marvell AP806 and CP110 system controllers and their
child devices.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Update compatibles to avoid old legacy ones
---
 .../mfd/marvell,ap806-cp110-system-controller.yaml | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml b/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml
new file mode 100644
index 000000000000..20110a033415
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/marvell,ap806-cp110-system-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell AP806 and CP110 system controller
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - marvell,ap806-syscon
+          - marvell,cp110-syscon
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  clock:
+    oneOf:
+      - $ref: /schemas/clock/marvell,ap80x-clock.yaml#
+      - $ref: /schemas/clock/marvell,cp110-clock.yaml#
+
+  pinctrl:
+    oneOf:
+      - $ref: /schemas/pinctrl/marvell,ap806-pinctrl.yaml#
+      - $ref: /schemas/pinctrl/marvell,armada-7k-pinctrl.yaml#
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    $ref: /schemas/gpio/gpio-mvebu.yaml#
+
+  "^clock-cpu(@[0-9a-f]+)?$":
+    $ref: /schemas/clock/marvell,ap80x-clock.yaml#
+
+  "^thermal-sensor@[0-9a-f]+$":
+    $ref: /schemas/thermal/marvell,armada-ap806-thermal.yaml#
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: syscon-common.yaml#
+
+unevaluatedProperties: false

-- 
2.53.0


