Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA342606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TaC6ygDt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LqanlPaV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=etweggmvewghqZeCOi7wUZ9wIdIXkNXXNOxh61ejO+Q=; b=TaC6ygDtshieCHSEEo0Km2ejs8
	BnHnfjzMvwR1jFJIIDgXedJxnv3p4Es5aEZr+0COTlKQS9YJquNZeee4W2kqsbG5cN00M4+hvr9Ei
	Bw+EgC8Mf4UFMToY2waH42V0lg4R3uFIVKTgoK3wjNhqNQY7Rb0h0QNvYerAR5E+pRMD45F2a5n4V
	sGW2FCPurTbgJxg88d5HGJ99g5G8uTZVl8M0GWM6ywjSYJAFYCg4B9J8QxjXUvpCPW/ClDrxlzRG5
	nYK1vtQSX5M+ZXo021JZ+2FxRoQG/OrfGj1dGUYfzA2GnkyD/4jfrO0JR68Y7S2wYrD2BbAqzYLsK
	VCqkjXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYyo-00000004W9p-0mxa;
	Mon, 23 Nov 2026 18:41:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYyg-00000004W7w-3QMC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:41:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DEAB44632;
	Mon, 23 Nov 2026 18:41:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459282;
	b=V5m9pbVMVm72Nlidenx8lzySdZYL8J5iRz0ttsop3pTmuzyNmQQyzcSDy3kZSw10eF1g
	 fAw1AEB6/wD6xgugdXos5yO00heCZyzFDTedJpls6HSyLii8aukAFasNdo6gfKGMUmC7X
	 AijCWuHw8jfM99OFW/we8ukfUhKv5ENL/pCWmX7MBpryrQ6NyYk5BZEGP7WtrNjam2hcS
	 KLdWn7Toby0HLNrI6Ba5tRJahVDVDy20MDSMIAPEbdnpQOAj8GvtRz98scbd4uzga1bV4
	 U+0MQ9LxykUp1xOOPQtlgTNyklLW3MAB4lL7rfC90/vsMw8KrGLvrxN/sOOoet5LYkw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459282;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=etweggmvewghqZeCOi7wUZ9wIdIXkNXXNOxh61ejO+Q=;
	b=Rt2xGV+dRG414T+HDb3PGPG+CITepVscNf7NAWnTvMiM8LvGeWUmnOgKhBdVi7jgr5qs
	 5P9SBrsRQQH/JQ2aIpGOCFsrU/kIYqJlmAfRQn8uBBHjON7U/Q50kLwmz3HyAG3nmI/Go
	 oL7tBoPQnMBgUnkfx2dj0seQcusquYaXySf1w7WQpbFmLiT0pI3i5AAF52aq8C2FoW/ni
	 eM181/RyfjCYS7aBBbQoOZpGXszWLOGFHESpRY+gNEnt/hc5yxB0UbulZnSiWJVAJMrBn
	 2kAMFd2Wf4X7XXrPnHeeZsHpFiaaGNAR58Vpxam1IRFLPTlKuLo42+BXskQNCmjtQZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D3321F000E1;
	Mon, 23 Nov 2026 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459282;
	bh=etweggmvewghqZeCOi7wUZ9wIdIXkNXXNOxh61ejO+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LqanlPaVdVslqpa8pijZ/2zTI3tQtkLc7hDsR5HQV0dh2maatazdvZDBpsWyMAh6X
	 +kyy7UDSpiOJ2BCERZHZT5zexmnNZ636tdgQTREkzMiCU21YnluXI4em+6l0oKRGAe
	 QI701/xs3K1vV9Yw/a9uc2t/POQZnk60VBPVS81mnWJLIfV1eiRRbRouqM3gTbu2YX
	 kUalMz1gqJUsbpfpyeqiK/vysa6HurHBRaVb6welvdBMdHDFn3ord/TsaNFWw+8ZMC
	 99CbFzsqNRLLArXXgBMUrYGssgWFXoGlb+tNmpniU+p/oGBK87EZzcxrBgMy86cJas
	 AQ4L3d8W0fBhQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 315BE4C5A6;
	Mon, 23 Nov 2026 18:41:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:12 +0300
Subject: [PATCH 1/5] dt-bindings: soc: Add Cortina Systems CS7542 global
 control block
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-cs7542-syscon-v1-1-49858e631449@gmail.com>
References: <20261123-cs7542-syscon-v1-0-49858e631449@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v1-0-49858e631449@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459271; l=2734;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=FpK/rtN440rKXrT4wuja3g3AXioE5n0xbhhWrVDfiGg=;
 b=dMCDcND35ZLUQP4SaDj3fquLpIXW8sGrBp5IFWt31xYIFau+g7bRCwpKRiJdVq1YMl2o0cVpo
 gmIpD/GJ7YFCEATjt9Hn8mHKArGTmC3F5daYW6+oOYiB9smjW1mWfhz
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



