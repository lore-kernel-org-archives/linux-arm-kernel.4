Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D699606A689
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QoSqD73Q;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cq+7RRkq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sf8+RM3rZAmgEliui/kkekjO53zVsUUHkw04g1zpK5E=; b=QoSqD73Qp86o9kCgyyMf//Hia0
	2Zb+K9la8HfjYI+dIXJeYoMWnB/CpUzrYR549LLYSA63z0dIIrTjoiSV3gWXUN1YLJ95QsgWYEzW0
	d2BEeNUS1mmVm4NxKSlmkd5d4D2WZ4LBVU4J8eHYCAo22hELgqR7X9Z9hJx0reDh80rBl5yOiSxNe
	EoN/qHvY03pDvbAQHsCA3KKPXjJTmX6ul5PKsVGHMkipZN1mDDjkRgtGHW0YeZ7MQx7j1dZJcQLUk
	j0r8LxFo6am2u5aG/WNAR44T3LBuMKsB66+vHPLILtrdikHsQknK3bDAzeizBMlDBGgAfC2tXc8x9
	QdGK5IzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzH-00000004WPT-2UKg;
	Mon, 23 Nov 2026 18:41:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzB-00000004WLy-2lDE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:41:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5634B40A00;
	Mon, 23 Nov 2026 18:41:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459312;
	b=lzp0bJfgUAftepscQq7vHcWjxSPo2Kt7h9yopS4FQc4aXgzNsGGjGl4eQkXyLTdcRmJ/
	 Wie8lMjUQCy2BBV9who7OGMy4dEibb085sKSkOaA3/GwQGbwzvHflclD4IyDzH8pr8juC
	 ldhf/dwiAy4WYZpGtOHarSfHI+OyXxWvxZhnLB7NpCLiKLJbE9ARmfdwMTOL5Tq7c/wD8
	 7RfgBoqoWE0Rc2yJHx/jtruMJblnksiH6jrrbQ+v+XOUKqgyBLNWD+4sTdIhtdSfRcCy0
	 A9qR2QO3+hKubISqlYTXGxd9WLwQiCzUvR1Q4LAJRazkh7h06vmCbBlgeGzS+Zk458Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459312;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sf8+RM3rZAmgEliui/kkekjO53zVsUUHkw04g1zpK5E=;
	b=OWR8+MlRiF1uwJofPe64LDjsdDtUCytLy9z6djHlKzsxfJjTHD97077qJqY4Ah9anLlg
	 Du+1BrFme7YpRa6Pa3PreJ/iMCKwtD791OxsgPXZAtGtRS+InxJRT7arWubeh/V+pWhKH
	 M549cXxS0bpCDmMMb1Do6nyYK+XSxat2n67PNLjfUFJcFxC430RMgZkCwC3gUfFdRPME8
	 pya3H2L232xdNN+jnbt/aVV7PuwVZNIkY6sw+kWOiru5U+rTA4e9kpeBpi7dn0BeIoFXu
	 Ulte69t64UWDPeIteXDiEf1aNjVAsh2yeRsbbyKoylsWok9o7odLKRuHfxEtiNKwTkA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 752191F000D2;
	Mon, 23 Nov 2026 18:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459312;
	bh=sf8+RM3rZAmgEliui/kkekjO53zVsUUHkw04g1zpK5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cq+7RRkqhFoNE9JmAblFgxcAQtQB2qBGU1A/DQvyadJQX01YyHLWe5x66ZglIA29K
	 ymiON7MCo8s+d6MmWMSfRfaR6hcLCAKhvNqBDMHkW13sTUA7raeNis89XzZldofLqF
	 0qDP1nNDwYj3khCIa+/T/WBGO5/V7VC/qRikx+Md5fxLCfrLlB2CZLuhkIRjFuI3k1
	 ZbkLnEa6ZuAfhy+T1lJhecidZFphFeRXwdqIVQMKKas3P4eynlI6U1DQSVkCAJ18hL
	 wWQoRnVAhzpSCGM6H+wgLy8z9u00pfhTczdtx/T/VX2gxBfE7UeFZkUUnIkpXueGp+
	 reSgpF6kj26vw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3BAC44C5D1;
	Mon, 23 Nov 2026 18:41:35 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:34 +0300
Subject: [PATCH 1/3] dt-bindings: rng: Add Cortina Systems CS7542 TRNG
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-trng-v1-1-92d9ffcee531@gmail.com>
References: <20261123-b4-cs7542-trng-v1-0-92d9ffcee531@gmail.com>
In-Reply-To: <20261123-b4-cs7542-trng-v1-0-92d9ffcee531@gmail.com>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459294; l=1529;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=h3Rkf84iDXCJIMnadYFK8kaa2zOPjoZm3reYLlt/sOc=;
 b=CAksPJdPCf1i8DCqnPWzq8mAGuYAdij5H6veRCIsvGhokheBm/cE6ThpGZw1x7g7G1ryAJPRx
 dxNjxnxvRTJBj4dxlUPfE6mikU3wyRqzBhwyXBH3UqEXft5mdB5SPxq
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the Elliptic TRNG register block and its reference to the
shared global control syscon.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/rng/cortina,cs7542-trng.yaml          | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/rng/cortina,cs7542-trng.yaml b/Documentation/devicetree/bindings/rng/cortina,cs7542-trng.yaml
new file mode 100644
index 000000000..9118397d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/cortina,cs7542-trng.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rng/cortina,cs7542-trng.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 true random number generator
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+properties:
+  compatible:
+    const: cortina,cs7542-trng
+
+  reg:
+    maxItems: 1
+
+  cortina,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Global control syscon containing the scratch register at offset 0xc0.
+      Bit 5 is set before initializing the random number generator.
+
+required:
+  - compatible
+  - reg
+  - cortina,syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    rng@f0600000 {
+        compatible = "cortina,cs7542-trng";
+        reg = <0xf0600000 0x20>;
+        cortina,syscon = <&global_control>;
+    };

-- 
2.53.0



