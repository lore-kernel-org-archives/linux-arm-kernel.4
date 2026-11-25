Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F15F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r1tuL28/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZT+BLMa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dbB8vlDFQn5XnWg+n7KR96SKHqcyEBWit0sDLa1+rqk=; b=r1tuL28/q3Fy9uA+n0S2gPnWwj
	pgK6gidAqOnIMGpu2TqA3x/+HWIRPbraTlUJOFOO+vW49F2AWBX1m7NSpn6whKTm8lcgEUKKfndlz
	e8hox8kzS/x4eQ/Oea1tBD73S3X+a+cNU6TX/zsBjnL9scVzJ40aV3kVesnM7mAWPjhYDiLSlXo82
	+PlErVev5nf5QGNSsgvKH7j/rDfgaELgkXJQLcGCv7mCUXkLahF+CpawA+pHIxMILCP8Zt4ajvK3G
	9c8HFnP7t+JfiG67HDXKoLc5Oh9nd/MalHZEHby78nc8JPPC1S8HPl/gJmwI1Y7ULwQPOMFgpu0eP
	wtZDMN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAL7-00000009T1C-31Av;
	Wed, 25 Nov 2026 10:35:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAKT-00000009SkI-2S4y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:34:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56E6842397;
	Wed, 25 Nov 2026 10:34:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795602861;
	b=Gk0AvEjTDm2Bz7H0qt0F5sr1DvIIXS5SI3GmdMDrBFkw23tUMY7GMhiCExZXAdySV61J
	 1CbH/9WQdRcP2YtH4ppmmhDfwfFqIb/xD2Jj5vlevSvWSSU9dI01K4BfyyyAvBsDE8bhq
	 W39qxExJwVABEW5+6nhk1ibXVTqt1jRx+DT6cHYiVwBuqbaCMEVJumPKkXOosLZSeoYn/
	 B/aiZaulynuCRBZDVyX3dieRSrFNWGR+gWQ4eS+EVPZ900cPwBb+4W5OuuDJLpPug4ssh
	 ySmZ6FM4OzCymGRNvtdrRPJ78mCDBkUDf62ova/07JK/KRT7Mn6j7Zv9mMzrl81dyxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795602861;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dbB8vlDFQn5XnWg+n7KR96SKHqcyEBWit0sDLa1+rqk=;
	b=R85zXin+y91JqY9GBvRMVgGwta9poHNU17cWGneytxlA5G0sUSfagLp9c1FA9dbHAkyg
	 ovqT4gvVbWTgLqL2buNKl2xBePkb9O/i4w2p74J0Ld56fhGrWYvLrsBSgTSdIGxZvXI0K
	 BKVU50yfXA0B/I5LisxUNng5TS17IyTrv8E28SkFHGY0TFpzUMVcMPop+EYg+T2uwXwln
	 CK1lqCZGH+hhaJ4c0VEiTc2GAV6vbEX3Nw24kJsmo/koSaSxau9a9HgnF8q9EMTkFgVnZ
	 TGQ4PUkyReMxRR8bGzIRlPUGRKr3lYDWHGvlyIRTBWpBM5VTmPo8lSI/8QpBuxKtkjA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B0711F0089F;
	Wed, 25 Nov 2026 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602861;
	bh=dbB8vlDFQn5XnWg+n7KR96SKHqcyEBWit0sDLa1+rqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EZT+BLMaW77A0AMPUEZ8WvMWpwHXm0hjA8h8VLRxDrpmRyh7gSjLiKEnBx51yiSF1
	 ITiVxfPxnb6JFohMkzbl1AjISSdltIRQfQsRu+AuCuGVJ/VkbFzjvRolYEeBnPI73t
	 49z57t6uKMByy+P19kTk8DL/llrpD/Jyu+NO6CEUEmeLCKdZwQR2k+oc3KCTXceRjM
	 XUQ8mLDC5LxoVpumOdnVFdn2EmBw4ryOplsBV0GCy43q8N5aukykvSyeV8zf+6DoNv
	 PmBe1kxJeGNe3Xje7tczPfAq5y+hwndMH4M0yrJn8PBqrMBAJKPzFR4tWvjxYdQtyk
	 hN25ec8CjTbZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A9E284CE4C;
	Wed, 25 Nov 2026 10:34:09 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 13:34:09 +0300
Subject: [PATCH v4 1/6] dt-bindings: soc: Add Cortina Systems CS7542 global
 controls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-cs7542-syscon-v4-1-3337bb0d3b48@gmail.com>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
In-Reply-To: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602848; l=4010;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=oMbBnadNt9Zr1iGu4MirHsHTm5dEUH08qquCfQb14rE=;
 b=DoBnnbRDu80WwSff4+ab4qgPwFmqoclnUkU7h7nAjaH/T7eLngif5afGfFuW7cKjZvdP71WG1
 kJH3cw9f+H/AHyGmmv4hbhHTlnbtrWanMxWMmOnV7GW9q0LjbyXWVgF
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

Describe the shared syscon, its strap-selected clocks, three PCIe
gates and level resets. Reserve the former group reset ID and assign
individual IDs to the seven network reset signals.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../soc/cortina/cortina,cs7542-syscon.yaml         | 55 ++++++++++++++++++++++
 include/dt-bindings/clock/cortina,cs7542-clock.h   | 13 +++++
 include/dt-bindings/reset/cortina,cs7542-reset.h   | 19 ++++++++
 3 files changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
new file mode 100644
index 000000000..561bb7b63
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -0,0 +1,55 @@
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
+  It provides the APB, CPU and AXI clock rates selected by the boot straps,
+  and the three PCIe clock gates and controller reset lines. Individual
+  reset lines control NI, FE, TM, scheduler, QM, NI XRAM and the entire DMA
+  block (LSO and SSP). The network engine consumer must acquire all seven
+  lines exclusively; it cannot run concurrently with a separate SSP DMA
+  user. SDRAM is excluded. Reset identifier 3 is reserved.
+  Clock specifiers are defined in dt-bindings/clock/cortina,cs7542-clock.h;
+  reset specifiers are defined in dt-bindings/reset/cortina,cs7542-reset.h.
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
+  "#reset-cells":
+    const: 1
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
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/cortina,cs7542-clock.h b/include/dt-bindings/clock/cortina,cs7542-clock.h
new file mode 100644
index 000000000..c68c6ba20
--- /dev/null
+++ b/include/dt-bindings/clock/cortina,cs7542-clock.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_CLOCK_CORTINA_CS7542_H
+#define _DT_BINDINGS_CLOCK_CORTINA_CS7542_H
+
+#define CS7542_CLK_APB	0
+#define CS7542_CLK_CPU	1
+#define CS7542_CLK_AXI	2
+
+#define CS7542_CLK_PCIE0	3
+#define CS7542_CLK_PCIE1	4
+#define CS7542_CLK_PCIE2	5
+
+#endif
diff --git a/include/dt-bindings/reset/cortina,cs7542-reset.h b/include/dt-bindings/reset/cortina,cs7542-reset.h
new file mode 100644
index 000000000..4998ca11d
--- /dev/null
+++ b/include/dt-bindings/reset/cortina,cs7542-reset.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_RESET_CORTINA_CS7542_H
+#define _DT_BINDINGS_RESET_CORTINA_CS7542_H
+
+#define CS7542_RESET_PCIE0	0
+#define CS7542_RESET_PCIE1	1
+#define CS7542_RESET_PCIE2	2
+
+/* Reserved legacy composite ID; never reinterpret it as an individual line. */
+#define CS7542_RESET_NE		3
+#define CS7542_RESET_NI		4
+#define CS7542_RESET_FE		5
+#define CS7542_RESET_TM		6
+#define CS7542_RESET_SCH		7
+#define CS7542_RESET_QM		8
+#define CS7542_RESET_DMA		9
+#define CS7542_RESET_NI_XRAM	10
+
+#endif

-- 
2.53.0



