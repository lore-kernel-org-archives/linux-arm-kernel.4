Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDCF606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kZua6XrY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L8t5CH2/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zj07ninn3TRlAbXrfsnKq/CbWgNgO1BmZsbbDgLUkrc=; b=kZua6XrYE2ZcQ7Sl8g8+J5X+Df
	zknRzoQ78eXcngyDHdTw5Vt17tpKY3d7bexQRXlvO4NozzozxnCJ4+gbuBgMPU6nQTDrQOFYmp59+
	emfOKrvYvSHGTieqaj8eWqrWm13VX9Ayeq8HrO/v9GEcW4pU5vVaZAb72W1lsu2pLKc2Y6FyXPG10
	sMV3BxWCunkO4jNgol3lFydKtFwoWm/QeKpNvzBMINIndLb1BuZqEOFck7eXAf7EehoRuw8aJ2W20
	3C/axdanUleHqTp66LzbasE74EjxHE5xXU/o9Laz/HRPaAwP8E4tZ2uUNuUVnepdk6B6SpFLF5g7j
	A/nOFfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkRP-0000000HCWw-1iB8;
	Sat, 21 Nov 2026 12:43:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkR1-0000000HCL7-3mN3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 12:43:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A78024229B;
	Sat, 21 Nov 2026 12:43:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795264995;
	b=Ub0ze4qm65EBhI0YjvUCX7uOSz3zv3YL2x5btSYUwjGzPHiMZZQ1PzN8ngKD2HkvMxgu
	 DvpEBoyWrkHMcaKbszXvETj1XZhJWJftq5oZYwjZXSBMxD/jVODMe8jKoB6j2JWzNPBby
	 DpAmb6WYPdbmbWq3fWdVl87wR8aQ48i8CzY+dQs2NubmPTzpWpqMKf8f5xFsq6kooJgHz
	 y+R5pSt6METqV8ZifhhkcamXXwINS8Rv8St4IRgbazZpWLGEKir3CSRtUxBASdNzje0+r
	 GVyk5zCxMQRtuTqbC9vzm8Q6MGxkKz/1PloPSZw5nbCIwwtYhBJNbSh2rqAbh/94ltw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795264995;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zj07ninn3TRlAbXrfsnKq/CbWgNgO1BmZsbbDgLUkrc=;
	b=Wh3TX2oaUdLMejeH/ApW4FR0D2ExgUHFGsq704wOYz7MBL7qX2aL9HsZzm4nhsAIYfp9
	 oEymvDVQ3MAQtJJkwxYMknsvkeYLFrue4SAUXuMInMsPPHx5JPADJPF83slo+99Hm6pG8
	 ugSBnmn6GmN0pHG3mJaQXj2lZ/4+LS07RNOWRgTvaTw8PRZ9xycpnOeHlC831Xh+HaimH
	 luoyMhAJdDNvkdiySH8kS2HQOsJyF92ALzaJZbzu3EUCK52HBe6oiHZozk0Y0ovGUqnkL
	 vYmdxEnqVLBCiXvt4qN16oL3VKdSWPN71O3JpHFlg9vIjFGFbYRrOOvm/xQxJb1l/7Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DF831F000D2;
	Sat, 21 Nov 2026 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264995;
	bh=zj07ninn3TRlAbXrfsnKq/CbWgNgO1BmZsbbDgLUkrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=L8t5CH2/KD1Bk2ey3C4mrcfGVQNWqNebhx8EdjaAAzroEoqw+rBJT1vfkQCOmcny7
	 HV9DcB3YkZzfbC3o2DjY1Koc3ipLQVidsMTi6mvBrOiyPb0VT1DLNkdIZt4PXMrW+9
	 kES85sLBpN1Uik0T1x+czQXndwIhJZyWRXeuZJzh5TAF8Ia0+thLfEoma+NPOjuhDv
	 ey/q4wtDhOJS4ekGi9fh9mqHXwBagekGcliGU8V4EidQa6VCkVFC1xlAJCVOLgBaWb
	 1z4xya98i/hH2lDpq+WzK8qvE5UdIKXPaEGYigP8IpiMBiwlYetYZsaTS4TCgilJJ+
	 XyUFsEpkreYiw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6599F4BC46;
	Sat, 21 Nov 2026 12:43:13 +0000 (UTC)
From: Yuugo Yoneda via B4 Relay <devnull+yogo.0917.sabu.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 21:43:15 +0900
Subject: [PATCH RFC v2 05/13] dt-bindings: timer: add SiRF AT550 system
 timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-at550-rfc-v1-v2-5-b0309d0789b2@gmail.com>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
In-Reply-To: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, soc@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795264991; l=2417;
 i=yogo.0917.sabu@gmail.com; s=ypl514-20261117; h=from:subject:message-id;
 bh=dZNkcUac5AL1S7vwdLxO5MlCIcwUgq168srvwmaOOms=;
 b=YYOsBBNfiai4cC/74NLzqDIYLvpCtFDebjs55YUBRPvprZdIKDB1yBS8hmLeGGt6mKHH/7rrA
 UdtqKRqHzheDQcTYgT+L1agdexjl3JaJkaoyrGyl9JA+HJXAK+M/BbJ
X-Developer-Key: i=yogo.0917.sabu@gmail.com; a=ed25519;
 pk=TIQ8Tk4xQrxyn8rmk3GI2f5qg/kO6g2KZm7YOOyBHeg=
X-Endpoint-Received: by B4 Relay for
 yogo.0917.sabu@gmail.com/ypl514-20261117 with auth_id=1550
X-Original-From: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
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
Reply-To: yogo.0917.sabu@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yuugo Yoneda <yogo.0917.sabu@gmail.com>

Document the Devicetree binding for the SiRF AT550 64-bit free-running
system counter and six match channels.

Signed-off-by: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
---
 .../bindings/timer/sirf,at550-timer.yaml           | 51 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/sirf,at550-timer.yaml b/Documentation/devicetree/bindings/timer/sirf,at550-timer.yaml
new file mode 100644
index 000000000..6611dabe7
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/sirf,at550-timer.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/sirf,at550-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiRF AT550 system timer
+
+maintainers:
+  - Yuugo Yoneda <yogo.0917.sabu@gmail.com>
+
+description:
+  A 64-bit free-running system counter with six 32-bit match channels and an
+  internal clock divider. Match channel 5 can also operate as a watchdog timer.
+
+properties:
+  compatible:
+    const: sirf,at550-timer
+  reg:
+    maxItems: 1
+  interrupts:
+    minItems: 1
+    items:
+      - description: Match channel 0 interrupt
+      - description: Match channel 1 interrupt
+      - description: Match channel 2 interrupt
+      - description: Match channel 3 interrupt
+      - description: Match channel 4 interrupt
+      - description: Match channel 5 interrupt
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@90050000 {
+        compatible = "sirf,at550-timer";
+        reg = <0x90050000 0x1000>;
+        interrupt-parent = <&intc>;
+        interrupts = <0>;
+        clocks = <&counter_clk>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 354466e29..3c5a814f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25852,6 +25852,7 @@ M:	Yuugo Yoneda <yogo.0917.sabu@gmail.com>
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/arm/sirf,at550.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/sirf,at550-intc.yaml
+F:	Documentation/devicetree/bindings/timer/sirf,at550-timer.yaml
 F:	drivers/irqchip/irq-at550.c
 
 SIS 190 ETHERNET DRIVER

-- 
2.56.0



