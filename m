Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487B3606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hrcUaP9T;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZGNflnUw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WZVIFiJUDu2/Fg3EPA3lEzUb/a4f/sw98rZcKXqawYM=; b=hrcUaP9TcFgcg2vSCB8kTtubWl
	wNAZ3X6Q7OqGjECRkLIFhXyKoK/FqLI77+coddAd5/RTzYMiDBMAR4UhszyqBNSQ6fYAuwbw1Fg1+
	YMTHwBJ5ce4ofW3KqC8/4WHnSSPKylDXT7/7J0oHgKd1Z7L+yaph3i7qAxSP6EFkobDjKTSIQQV38
	9LLfITQNell02rt3O5/burVlPmhOybflyakohkP56NFavXj4TQRFip5KSfPBVv878wxT+MJqZ+Li5
	74U55zvexXQS6vNEfs8W0l2PIlrfmGpD+502VcArd4jy6h0pCF+Jo9/7LngKeDByeaDUp41HgP1+j
	u2lIXM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUskp-00000000Mjr-18u6;
	Sat, 21 Nov 2026 21:36:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUskj-00000000Mdy-2Ojq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:36:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CD6145ACC;
	Sat, 21 Nov 2026 21:36:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795296963;
	b=KOBIIFv/vRVd28m86e57epFb8LmMGdAcq2qehXnXGxUMyBq34P74nObglhghqLpNmWqM
	 RHFbs9CtUNLYLP+Zu2s20CBLv77K5pGr1drAB6mZVCq6+IfrKMG9QU7L1f3WP0zWB0DA6
	 CmziXyvl4x1ObhMxzopNjq8FtUKxfLc1mfrW1SAnz90Cl+cTHwYO736BOLrMKmG1WRet+
	 oHp2SOpzgp/iCQe3mTcpIO7KCVh1+FGFIAfUaiD8AqgCtMsXjGvRF9ddQCGwbKcqIwyFZ
	 uvp4jbQFxKNgecVSLh+bLhHxlKbMBR5ImDh1mQQBpwlFSxDteSQX8T8SjkP/pACpj9A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795296963;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WZVIFiJUDu2/Fg3EPA3lEzUb/a4f/sw98rZcKXqawYM=;
	b=22ij5gobq9TnSf+N3wfgyt2JjqR/SbkXRjzOQbQhZhOgzsTuROmUqxkjfxftHAtVJ1z9
	 KyUnzm6Zke8GXbUo69bSbtJCMwIxWSs5O3S5960TfXlKhb5VfHlZt4u4p2DJlJD25fNuf
	 CoBS/fnzkYSKNxSzO/GQ/1J2/J00KSXkEO5jatU+nw0FXx2SyGFIFYfBSnc3H3hYR7Y9m
	 xXpDmyHopbDcUmfvPXYAlHXUjplwhbreZNhjauMaK36jbcCB6jXYP0+tBRFpi9+rGRwyL
	 38JKGeXDmeCu/kFvmN66ATW80CCfn0JMIpGRCTRMCOGungC8eumqfi8j4bWubOtRqLw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 590811F000CA;
	Sat, 21 Nov 2026 21:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296963;
	bh=WZVIFiJUDu2/Fg3EPA3lEzUb/a4f/sw98rZcKXqawYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZGNflnUwbE6xqmdZE4U7L3r2y8mHRB763TMPyknX8mfV4K3mHhPogkFGY7erJ5RTD
	 jnLiSqTYmXEfz2LfEJtcfKl3k1HUG+MQCY2GrHX8qcX6UbmSRO1EGj0gafVul1Sa2G
	 8HcISfxkK4gIBhMdM15ytZ08bYSVgSQb/jMSiEyjF4HSufc+bZTMp/pNBjNgWHzGwf
	 TNXYH2WQZafmVaZQU+vpcQ5BmDDDsWYD9N3/RqMy+P9HjxO+R7HVGXZulUfZ76PvLZ
	 xr1W6F+GgdGKfwRmFZR7M9hlPtF8LM3zINJfXyUPGnviRHfTnWnAxA0QdMxq1L3Qpg
	 gKEwJLDDOX83A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0C2C24BE01;
	Sat, 21 Nov 2026 21:36:00 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:35:51 +0300
Subject: [PATCH v9 06/10] dt-bindings: serial: Add Cortina Systems CS7542
 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-cs75xx-v9-6-1fc1b90bd097@gmail.com>
References: <20261122-b4-cs75xx-v9-0-1fc1b90bd097@gmail.com>
In-Reply-To: <20261122-b4-cs75xx-v9-0-1fc1b90bd097@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795296958; l=2007;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=zTU7TdprhBB5oPgA4d7D2ACpTGMQAb+yACsbn1DZcmY=;
 b=p3aLfZRKQtlY6rQSevp2fIFA7aYp/G3pwWWVe/6fbfXbENMdr6fm0b43mO/YgOZ/xJgpWlEeB
 gY4+EkbmTicC2klt6J/jJ5kEoqViNTqpIwvAsOg7PBjgjVYX200GzBc
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

Add the binding for the UART found in the Cortina Systems CS75xx
(Goldengate G2) SoCs such as the CS7542.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/serial/cortina,cs7542-uart.yaml       | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/cortina,cs7542-uart.yaml b/Documentation/devicetree/bindings/serial/cortina,cs7542-uart.yaml
new file mode 100644
index 000000000..62f80d722
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/cortina,cs7542-uart.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/cortina,cs7542-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina UART
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The UART found in the Cortina Systems CS7542 (Goldengate G2) SoC. It has
+  transmit and receive FIFOs and a 24-bit baud rate divider running from the
+  peripheral (APB) clock. Other SoCs with the same block, the rest of the
+  CS75xx family and the Cortina Access parts, are to be added with their own
+  compatible string and "cortina,cs7542-uart" as the fallback.
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: cortina,cs7542-uart
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    serial@f0070110 {
+        compatible = "cortina,cs7542-uart";
+        reg = <0xf0070110 0x30>;
+        clocks = <&apb_clk>;
+        interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.53.0



