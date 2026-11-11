Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0392D606AEDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bFYmPwBB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knBlLdjs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=assGCdcm+gX8iTjpb0hYNlEGNwK5F8MMHtxVUUTgRdM=; b=bFYmPwBBpfPUIH
	/E3J4vyRrDHUtiyrs2G5G0UHg7V4Ae3Gko8QkwJ4IuRjWcha9VWJJav86Y97nwFgqKBMejRmqcLp5
	JhsqLRZkG0PUFmmozXGBb8TABNwPk5dZiMa+P0MGo2po161HqsrU27/+GJUFv0UOQkPKsI53FFigm
	ulvJBHvqkzaASClRLTuju8SxbjxVZjK7FlUrej/+BB8qXgd+6mWVCOB7yeRzM04UerCB/56I00GLw
	vItK6cDTQrQ9dVE1GRbZp2SQ6NnEnPR4kY8yOo//P3maKoyhEkhWyYe6JHoaFNyndM/gewXkqJgPE
	ysdUuYH/CNLJpmQPuWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2G-000000080GK-1WnH;
	Wed, 11 Nov 2026 22:43:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2C-000000080Dn-0zoI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:43:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CF7463B50;
	Wed, 11 Nov 2026 22:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F891F00A08;
	Wed, 11 Nov 2026 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436995;
	bh=assGCdcm+gX8iTjpb0hYNlEGNwK5F8MMHtxVUUTgRdM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=knBlLdjsWYDfvYYMk5ROzKwYObQVKmmiT/ns9w+szswPAkjcrj7SFXZp/R9yYrFz9
	 989dhOuGyAhem4O5TcxYW5TbYU0SMBeSGAOxKIeCxtALjGJW8Gmv4Q21b3NJKU+U2V
	 Tyhv8mLQY1uL/HRzFkzVJTZgiF3VtuG0pYblsmCcS8/bN+KXOPm0vmevgFj4lC0a5q
	 N0HP7A7Zpv8uI+ZdOEe5nLg4orY8h6uqOspeRV+T284GjuqX0iftSV2Nzi/0n/8M5S
	 cP2nExcyPOUScGacaJYlP8aogNL4abLDq0hXWbOZAZ7nGaAWncme+RlApjp/enCpmu
	 z0MlBMhF5459g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:42:58 -0600
Subject: [PATCH 1/9] dt-bindings: mfd: Add Marvell AP806/CP110 system
 controller schema
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-marvell-v1-1-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
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
 .../mfd/marvell,ap806-cp110-system-controller.yaml | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml b/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml
new file mode 100644
index 000000000000..4c43986c2c0a
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
+          - marvell,ap806-system-controller
+          - marvell,cp110-system-controller
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


