Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467D260A5BDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vWTJKR6t;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hwksd7F4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZogHg7F2r1KKspZv8agum3WlkUtYxRkISXz130hGnsM=; b=vWTJKR6tG9CePPtITkEHm8E2sa
	njgyx/rt8LP43BlBEadJqgiY6ZyCgIkcHT3fSA89Zb2nX+7q1SulWGhwtTv7NJ/wfnjY0B/jwo2Uu
	zT06pXHV/0znU9WuDDaXlNd4eCRmSw7aKbIRf8z5ZRI8emnf7hdHrx7NA5RjP37SxBrR6hMSxweIN
	2C6hX5c//gT/GlfvYBJBYm79+Poy7pXXsqJC7fVYP3K/2hd9skwU/LRyDigQuxC7VCog3KRF7CfGh
	cdEe2oiLJGeBgnm0FHsCzumyxZMOG40Mb1suy7uvzhJhkEyzTuPhi3dW08cqJnJNJy6CjhZNJ4Dou
	lWsFsSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSE0M-0000000G8ok-3VCX;
	Sat, 14 Nov 2026 13:41:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSE0H-0000000G8l5-1lZk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:41:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AAD88627B5;
	Sat, 14 Nov 2026 13:41:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794663672;
	b=gS4FrVQ+MuyHeDkvDiSuhtuNjadI5X5DfyMd+69uKOGCcTQPYu5ZJTSUMIQUoAegA7au
	 DZel8+fchBnXu3SV09ZVoCW/Z6SiM8tOljhxrqMkz23nH8Kocsk8+WVUECbnNzGefOynw
	 Zw3flwG3PTo4mn76eP9/v51Psa3X5tGsj8UaY7VcA8p0AE22PtZEdyhDBa/pyrdasVRKC
	 QfqQ1D9DHYy9ldb0EpeuUtkNCk9m2U0FDyvC0LnzkBDpNh1vCgPx8aTWI7+2GKQC5QIe8
	 rpVDfI3AW/p/ReIhWLBXZn+NeoORGqbdmLAz04yeGFFJKOHe8lvzwIx1WoVeoxvn7uA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794663672;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZogHg7F2r1KKspZv8agum3WlkUtYxRkISXz130hGnsM=;
	b=w0CJgRylVXHanLa//h6Hsa2mJvAgajNBmWqAhrZvAYQNUMebTZkPmNd3Vb7giYoeStae
	 4aebim+NmxcuauTl6fNgN5xvqv3JQmQC3viy+vwbOcVdFgk7c6cKa1goNrKVuKePAuYVw
	 KaZMr2rIGw+ktOE3qaVnaW2ALP7O4yIAutk66e+66FJLFmeYb0ONQD5/sdj+kJnjbbHqM
	 eAwpD+/xR/UkVG8kDgi5VHJq21pIM4KVj6h+674aPRr1pWEhrbfNkQiq/vf8Zze8oY4kQ
	 hfSKswwbrZX2dDZxtD78Pi9lZvSKR/2+e15/ctlJOuwSGirnWD64PR+lcd8fs4H/g9g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0BB41F000D4;
	Sat, 14 Nov 2026 13:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794663672;
	bh=ZogHg7F2r1KKspZv8agum3WlkUtYxRkISXz130hGnsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hwksd7F4cfbIOIFVVqbbbRmblJSabZ+5urjSbTVl8fjTSHm8S+BkLy2GSs6upJwWg
	 bz+dt9M1BQJnSWu+vGvHjCUaQ5wpfwh+9JtsFmf4AX0JH0fQjU7i6TDlAjnPC+nBEc
	 pQ1/WJ7hr0Q0dxo3vjqaOR0kfJv55206IwC3ASW0lTq+x8ktgmelJNdLSuGYVYsfAC
	 p4FLZ30rEyB5hFVC8wjGwpkTRd+ByiyWg9e/4E4jqWjwxrQwhOIMTPfkC1xjfObz5F
	 fIxg3ynqi7HQO44OvaBbtjEuOHBGngTkIrxyZ5BJsIW7MQFq96kkfdJZCW09FFBO2+
	 jY34X7T51qJ8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 88D9B49DD2;
	Sat, 14 Nov 2026 13:41:09 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sat, 14 Nov 2026 16:41:11 +0300
Subject: [PATCH v7 06/10] dt-bindings: serial: Add Cortina Systems CS7542
 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-b4-cs75xx-v7-6-8f17f38821b4@gmail.com>
References: <20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com>
In-Reply-To: <20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794663665; l=2007;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=4OEni5PfKeJ3reVZQoQVj435vRxLkT5dV42lrfoFdbA=;
 b=ZVWYjbNLSMmz22q4aHwiNy0+RQR9MYiL1iFv+uzgICmrN3fcg5q1OtoBr4zURwqQir1LQu3pJ
 QywaoRMn26RC6NtU9wcykTZheboe0YisQk5kT97vfzHxHbb7hWyIZ76
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



