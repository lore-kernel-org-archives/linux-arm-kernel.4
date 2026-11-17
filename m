Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD93D606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rnaphe3D;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P7XmZhhX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7PGWvy46LTnU0expiNZafmv9HXl2dz3Bu7LWfRKGOEc=; b=rnaphe3DGG8VIa822P1t2u+bDk
	d9C3dgzNw+qxK5XU//LroYUlBdgnbJ/TQ9gUgbqzVVbiCZB0nmErz0oS2RZ/dwVVfTjtec5y+OCv+
	mOavNl1suL6KoI7asXJ6u9Z1byW8v8xV6LyXs1TmJhl889Xig5eeCxWt1/CoBMlXterM2PH8LO+Vq
	li8FmeFOL7ct8/7YX9U9DFVHKntwk1dv8eNCUaXc8SOSEUKKeDnEcGIb9bVeNbtAuwShQfv91TfQC
	pytKijIQhBmnwuYi9l9K2S9FkH0r4i0Qh22Cc51Ib2qEr9BS6ZCntHVSR0h4mUyFhXQVnlG865F/k
	/Zf6Tr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPnz-000000070rT-3Yxb;
	Tue, 17 Nov 2026 20:29:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPny-000000070r6-1quo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:29:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29A9A601C4;
	Tue, 17 Nov 2026 20:29:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794947364;
	b=QCtTJahE9g5BsuJ4cX+WIf+jghVeLwp9OIuZmIOZzE+enaeTtRkNlTqliNiQdwes3nIz
	 jeUOyLqDhLMZns+Ug9JHhHkq6QbMpht64n76fPTBlwOvBWH6TqNAth2kjgFRcrQXLrzKm
	 qkXEmb5/nbfWdvdsSRDcrsYk62w3SJfSbKOAK/ArandlcvxmQ2SVdFdy2R6ZiUeE7XX7a
	 j295IhTPmNUfI9Q22y0sIgTp9uTLggH2uSUlJ34CUhyBY4I4pd/pF3oDG872bRQ/d5BWY
	 O4b9+MKMRVtO491z83QMU6QV5Red55Hpsndi/ubUAT0Uvot7MP3zHL+j0id/CADnMig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794947364;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7PGWvy46LTnU0expiNZafmv9HXl2dz3Bu7LWfRKGOEc=;
	b=vd9hZMDgfkHl35yhkAXa7gxbVQsSX+GmAlpnN21ubTg+n78tSfWpWmNBuoTwrwdhpDBi
	 rNoI7b0Qa9ukmRSraDrgxnIP0X4tPMfGSH+MMO8qHxUMofRqdld/1IP43BxQnxQf5puki
	 X4tPzPTM5ipO/s9k48LRBV/WaqVj8rQljfi9XmhcSTUY9moeXcVal2s1GFa3xRVmCHQvi
	 /1tFvXK86ueI552WM95l+Xqp1aQdhpkpDRbfgB8T3GAeSRf8fPt5ZvHb2JHU+BnPtv+Hu
	 d5iWLAnZm97/In86woMiU1U4rn6BCNS3076cQ87hB3sWyN6lcuoqxk81854XVU/aAgw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E4491F000C5;
	Tue, 17 Nov 2026 20:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794947364;
	bh=7PGWvy46LTnU0expiNZafmv9HXl2dz3Bu7LWfRKGOEc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=P7XmZhhXYyeyYR6lnUwwJo8FypOzreG/btRJQfi5EV+FHyymsOTtpeOuX6TLjX70F
	 0EeKw4swMVuv0f+k02o42QPIyKVL1dFIqh5nJuHHtMYhhbWiNXVMjRYFoSnM6gU0fu
	 s3YlBdu+3hRaFQlgOQZ5xFoWwUewBOA/BkwGOY1qNduFFfZGkPjHweJkPCowMvLFaR
	 AFx/atljc7SXvp5i+1jtjxWjG4GEc6sy70PvNxizQRWVzwGp/eGyUNnew7GZ6fuvcD
	 S3xurpJxodGnZ9m9xc6jD66WiQBTIB+yZJiKzi8XvyidEoLTlIH62hz2mPdBo3IZUj
	 pMNVOxSFo50pw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C0E514AAD4;
	Tue, 17 Nov 2026 20:29:23 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 17 Nov 2026 23:29:23 +0300
Subject: [PATCH v4 1/2] dt-bindings: interrupt-controller: Add Cortina
 Systems CS7542 peripheral interrupt controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-cs75xx-intc-v4-1-0a678f35e5f3@gmail.com>
References: <20261117-cs75xx-intc-v4-0-0a678f35e5f3@gmail.com>
In-Reply-To: <20261117-cs75xx-intc-v4-0-0a678f35e5f3@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794947362; l=2389;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=m01hcJJ8xuXAEtFmd0R1Lw/ptpQwdip1II1Pbh1M174=;
 b=a08qu7Da3/pmTatk0TPaP2A+BvY8F15Gznd80NAfJMa45L2Mk6+ka5FIYIOj3kqn7jTlPElov
 gNuO2M2J1bCDD9hrbr2fpkVL3IB5MrOrq17a5YaQhPs0E0cXX6TkrFM
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

The low speed peripherals of the Cortina Systems CS75xx SoCs share one
GIC interrupt. A small controller in the peripheral register block
reports which of its 15 sources are asserted and allows masking them.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../interrupt-controller/cortina,cs7542-intc.yaml  | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml
new file mode 100644
index 000000000..2963acaf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/cortina,cs7542-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 peripheral interrupt controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The low speed peripherals of the Cortina Systems CS75xx (Goldengate G2)
+  SoCs (two software interrupts, two timers, the AXI bridge, SPI, the five
+  GPIO banks, I2C, MDIO, SSP and the random number generator) share one GIC
+  interrupt. This controller has a status register showing the level of the
+  15 sources and an enable register to mask them. The sources are cleared in
+  the peripherals themselves.
+
+properties:
+  compatible:
+    const: cortina,cs7542-intc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description:
+      The number of the source, 0 to 14. All sources are active high level
+      interrupts.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    interrupt-controller@f0070004 {
+        compatible = "cortina,cs7542-intc";
+        reg = <0xf0070004 0x8>;
+        interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };

-- 
2.53.0



