Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA717606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aQ52SRjX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAIF3k7k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZogHg7F2r1KKspZv8agum3WlkUtYxRkISXz130hGnsM=; b=aQ52SRjXQTtOzxv5/owjht+mmK
	OhtLfvZPOyOEZq9InNwiC3EuEtRKCWshn5+p7aGczeFv5987eupUm0fjUB3/jaZBoQK68T6Wdyct0
	C0+GKGIYXt7X6CNSUXes0pl3oVNdP5cKI1agrtd0Zrv7LMXI6yjZ2syoYjE65+2HfZ/xY+lCWIOIi
	RzHw6zwIshrbKwURVI0NqK0Ij4GtfKQ9A57rN5MjnXizjXx+83lYvNi4BMG+MYVmiguFvkRmhjgUC
	QO0L54FNY6KeUCGi+8onWUrKhRvyQolV7HZ/SBUf3WHr5YKN8QX81/DNNBHK9zfvt0zdmrYwY8Ojg
	6I2tkBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsEL-00000000Ihn-1oiz;
	Sat, 21 Nov 2026 21:02:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsDz-00000000IUV-08GP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:02:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C0CF545A44;
	Sat, 21 Nov 2026 21:02:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795294938;
	b=H7MUdZJq71+OlTgZeo5/siqKCn4GzqHzSGAE9whSyvirQghB16NgsapYBWtTrM70mcQC
	 NlBw9hhXUdhYuwh7nQ5j/lcVM9dSjy+CQOLoKNsjBXWqWIy3MNyu/p270+ma0vk4++gJC
	 CyeSjza7o2XVIUtyRc9d7FZ8kqmSi47W6rO9ECD8N5oOWtdIjX7rYgVyIZdFZE8xnrCAS
	 ClJ7TchykKQFkUsceOcUEujGXHo/XEFpOBn8EOJiXwUcNcjXs+Q9FqDBYU3YBFN7qr9Gr
	 FnFYRSsJ74goL0c6hEIIIyX9bLTDjEpOUX1RlYcRuTI7mLdy/isQZBHeqn9Jql+DxSg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795294938;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZogHg7F2r1KKspZv8agum3WlkUtYxRkISXz130hGnsM=;
	b=JrQmQ2RUpU/0nCOjIyHLY/qlKySG080ZPhVcul2AHfxlZcp+BSZIM7K6UNwdyW0EHDIF
	 draAJvX8GrUQEKDom+WeLn12oEv2MALR0LgcdsWmfZ7eytXphPaKqzuPVFc59ZWcR579C
	 XvV8yr4WyY22UfToItMi7EQD6+n0cONhRxbvpVASUP5o9ouK2xIqzz/b7ON1MNI3C/7AX
	 aLRtbdaZ9gBJ5iRVRi8xUAapsQg3DD/PsCMNuH2yIIFhQ122qyg+GyEuWBwQcdpBPxKn/
	 J73edajbOrQ61HBTpdLrddFptG+0nWRcDS6UPgDnmKQm+m3gWOVvMNO/WOOyo6g9pWw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CC8A1F000D3;
	Sat, 21 Nov 2026 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294938;
	bh=ZogHg7F2r1KKspZv8agum3WlkUtYxRkISXz130hGnsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KAIF3k7knTsx/UDWqyAsCwr5/hMAyEQU5zgXJZ4kzUirPcEUuX3sbdCa42UNb2dU6
	 +L+lUSsW+10omo8JAwRMSJaweaHGAUUtkMJTSc9lLQgjywIyVSmKwRtAq4tRo+8NNO
	 nLG4vBy7gLUmUTcTDKtcgbSog1bgEqiWGXCsjkfgUkx96TucxcuoqFWg/HdNvFpQl1
	 Peu7gfi6pQ4V0IBfvAWUc4Ri1Ve5CYGGe13c6kLgZIbbuw6288gUhZZ+lEmEhUypkO
	 kA5OvHtiLsfDDYFZZSIgGdsjlEsOEJGyAU5q+31GsHWIfir529wOCTYxvtvJIRmTIJ
	 0UgMYtbnKFQIw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C88844BDBA;
	Sat, 21 Nov 2026 21:02:11 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:01:51 +0300
Subject: [PATCH v8 06/10] dt-bindings: serial: Add Cortina Systems CS7542
 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-cs75xx-v8-6-5f971b0dc69c@gmail.com>
References: <20261122-b4-cs75xx-v8-0-5f971b0dc69c@gmail.com>
In-Reply-To: <20261122-b4-cs75xx-v8-0-5f971b0dc69c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795294929; l=2007;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=4OEni5PfKeJ3reVZQoQVj435vRxLkT5dV42lrfoFdbA=;
 b=A5bVd1PoCpW5njZSQnlc7ul9KKp4EEyhLN0eAaQlaTxLhgdS4r4JQw9bjgaiLXxlczmDzYQxp
 HBGYlLkYxmAD48JQ3gvYlglHPHeDtTnyhtn7tg+dWnjsGXAg3owAqfZ
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
index 000000000..2879a7188
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
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
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
+        interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&apb_clk>;
+    };

-- 
2.53.0



