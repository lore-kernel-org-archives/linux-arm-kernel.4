Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DF4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zo8ndmze;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HDCBx/5k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=etweggmvewghqZeCOi7wUZ9wIdIXkNXXNOxh61ejO+Q=; b=zo8ndmzeWSmSOawXKT52/zQ7pC
	Wp+7OWIeU+5zUdQggZ+F20FHGL4B2a/ZP4JpZ1esFjOqdaiQyVwxSjWlLVxmf2/zpYDM8f0QEZbWc
	O8cacD+jEmJxDPOObsh2MDu1ZSOseN/jz6u6xssO32B69hx1mNC2uw87g7FmsJy4CQOuzjH5htR3d
	lUKFNOHs+O556pqGEIsFKz5ETTlBDbSMNfw35tsvhLx23F0D7S6xClY02XMBxwDzVM1PKHimYDXuD
	94fpE1HZr8TO2suoLb16gbxKIuCxI3LkRzX4zPVUeoPfIdW8njncsWCnTDGGfdQXxA2umrhvzx2WV
	10VrCXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVad1-00000004p0z-2U44;
	Mon, 23 Nov 2026 20:27:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVad0-00000004p0q-11xz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:27:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EF916247B;
	Mon, 23 Nov 2026 20:27:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465624;
	b=Hca5SzEFNJNFNxn8dwgk6RYCMIH7GIrOHfLKIYMuBWMnMYAeSKVE8xu9BBnt6LaPnaFB
	 oAHQo4Pb0KLZZjDQwmNQtaz1QSe2ZPZ6dTtCWN9Pby1r7ZXpCPSDfC18XdchVCV/EiHZy
	 INHaUFHcnskgXUSIlD3hoBBj1gfoM1zQRB7rFd+n8tzXnvx8LA1a1OR9+VMTZ+uR1dfut
	 I2ioaEfkTApCBcJlTYZJCIqjVCTeUr4ykDFZ+g0QapO9YC4mS2tEdXt2n2EKKXWht2kDH
	 vgTP/ELf4Gu69qB6ALuQv6F7oBkGCUOyg2jIPTpFJT8v4EnOty3xtyiBh//d3ueOr+g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465624;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=etweggmvewghqZeCOi7wUZ9wIdIXkNXXNOxh61ejO+Q=;
	b=GswKGq8CU8mD1k43P8YtHNZtlItEwXY82z5VBSBKzX1kdtZ8p2UFPlBlAI84jr4mTTQj
	 Ot4jjkcQLGuGesjQmNU1+J6nv0AUO8scvtTkZ1QqvhtQxLeWzCwOJLYx7UHVzxFod2osZ
	 hsJiQpX/g3JpPl8XdoiE5PEE0pMl07RVBlsPv6q91y7HV25a9OEvySKQ+ZY8FCiHUBJ/O
	 0wUFlzwmxGSutYUhtAoxo1H7oh/pxct3+LFdgyOyQuwekpp5oP1EKwDgKIrDgLzSa9mUc
	 pWtmtRguz90dl6y+wplnVDoP6ECmOwCWE5YkyaCiuDw9LZ1ZVI+tGWSWg8byOW1XPiQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B51181F000C4;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465624;
	bh=etweggmvewghqZeCOi7wUZ9wIdIXkNXXNOxh61ejO+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HDCBx/5kEhJnHc6TMy99sgojmZsqPB16Hare43hVfykqGf5dKDrmWaY/ShKCiURef
	 ORCwdehUUjDWTPWgJsKkIoK9HuK5wwCG7J7mWJ8z4Fs2H0nrJ8JfLAcx/YKHiAH7DW
	 ++X7Y0Nc8dnbMz3OdZLq0UjkpUQozjpB7g/P95tgnB4q5B+kQq7Jo3dGODZDDlZljo
	 un0BVt6wZNMMvWuDOblDQCiv/mkrMT3TGrB3kinL0oLXBGrVuFEbx9rBYP8vD3n655
	 LcvEVvcuN8rgup3zARzpKfIYJPpxtp7XlrcZePi8lLESJKa1pWJjPjYEHFm3CMcjKo
	 bxiihkAFh3znw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 397994C6CB;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:26:55 +0300
Subject: [PATCH v2 1/5] dt-bindings: soc: Add Cortina Systems CS7542 global
 control block
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-cs7542-syscon-v2-1-1cd74b2522f9@gmail.com>
References: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465614; l=2734;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=FpK/rtN440rKXrT4wuja3g3AXioE5n0xbhhWrVDfiGg=;
 b=ipRGVR0liCQjBfbPvnA26IUI9W9GGepF2VaOm+/bXlvPaqbrCcpP4bUSV8WHhC3NX+J4IDHAy
 PcVVeMO+ubKBmJyrDhQqLxgra6qTHJsYyrtDI3FnrwRgtyB3mAARPtN
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

Describe the shared global register block and its strap-selected APB,
CPU and AXI clocks. A pinctrl child will share the syscon regmap. Keep
clock IDs in the order used by the previous out-of-tree CS75xx clock
provider.

AI assistance: Codex prepared this change from the existing OpenWrt port
and GPL vendor sources.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../soc/cortina/cortina,cs7542-syscon.yaml         | 49 ++++++++++++++++++++++
 include/dt-bindings/clock/cortina,cs7542-clock.h   |  9 ++++
 2 files changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
new file mode 100644
index 000000000..fb074de87
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/cortina/cortina,cs7542-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 global control block
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The global control block contains the boot strap status, GPIO/peripheral
+  mux registers, reset controls and the secondary CPU release register.
+  It provides the APB, CPU and AXI clock rates selected by the boot straps.
+  The clock specifiers are defined in dt-bindings/clock/cortina,cs7542-clock.h.
+  The pin controller uses the same register map through its parent syscon.
+
+properties:
+  compatible:
+    items:
+      - const: cortina,cs7542-syscon
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/cortina,cs7542-pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@f0000000 {
+        compatible = "cortina,cs7542-syscon", "syscon", "simple-mfd";
+        reg = <0xf0000000 0x100>;
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/cortina,cs7542-clock.h b/include/dt-bindings/clock/cortina,cs7542-clock.h
new file mode 100644
index 000000000..34d544238
--- /dev/null
+++ b/include/dt-bindings/clock/cortina,cs7542-clock.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_CLOCK_CORTINA_CS7542_H
+#define _DT_BINDINGS_CLOCK_CORTINA_CS7542_H
+
+#define CS7542_CLK_APB	0
+#define CS7542_CLK_CPU	1
+#define CS7542_CLK_AXI	2
+
+#endif

-- 
2.53.0



