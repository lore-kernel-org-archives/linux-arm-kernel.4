Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA6A606B3CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AlFxB7y1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kPvW2uyy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ab+IA1pUCd9/4D6jxdIphK5teeAP67ldeGaydg5uTlo=; b=AlFxB7y1J+dcqkFaR5YXA8BOJT
	c03wtX2VLW6qvBpm1L0KpIQhKQwzi5UwKjBFThec0su26RbVTZ+FkJv2BJpBui+fTCk4Xq4139Egf
	CYpG5KXCmFPhYFGJBqttChvOFrRv4UDr/iw7zGVyKV7AL6kitpK/EQHLr3fvJQIZf8GK7vHJZEMDW
	hk018oiYZ9LBMhdvebu4+6tbCWXoH0L8l6iSfKC3/thzZMOjaGq4ZDLu+1m9zmdQBu/SgaSkwyUi0
	ro92Mq4AnhPcFRFOEJQUyQx0odzw41QXloxFm6ShKKovbhBi+hiNCyl8d36dBqfTt59ZIhvLMZN6q
	smxSp+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsyD-0000000FZFI-1op7;
	Fri, 27 Nov 2026 10:14:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsxh-0000000FYx6-17S2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:13:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B24D446D3;
	Fri, 27 Nov 2026 10:13:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795774428;
	b=xpa/QVAagB3onw4tOTKqfSPc39xnfgPty1Q1Xx/MH/gNXdvlcRZI8SJ3WhiKLC8wlG8P
	 d4w1vgsfmrfqa+npzSUquRwCoNSVf5Hv5jldjS9ULHQLcAAEFzesE1p1zDu8uKaVmwRXW
	 8LL0f39SM/iON6KCs4I4S4+EZvJANBVSissejDt8x1MymBvL9b69dmSIqfvSjKhkbEwqL
	 DHPnTdW3LliqoTgw5hmkrJg0pmnVwx1C1hkL//7GHSyplHZ0XjDQS6SInuibqAgCb0ZId
	 er0G4vMcYMiMnDBFfQwtAfka4YZpoc83mUaKhI9y11pvQ76eLypDXUYBvbmIgJyw77Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795774428;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ab+IA1pUCd9/4D6jxdIphK5teeAP67ldeGaydg5uTlo=;
	b=HU5LsahJQydteypHqaEIwlc00VU0a7KztA2BSkfhd0wh0PSAoAYfEuzRxID1sR07lz8C
	 FQpKh9z/6UvQMufaYXUhUZtoRcypjgFhiHofP/pi5omGPvbd1eKflDQy8ZU7sE3T4k/9w
	 6GocjVLcg0J+pDmHy92LjCxsWQyZIC/nHFktGjOt+uwL3Cxpdp3igKQj6JPEOuokxyQ91
	 b1QDzonLHCzv96v8EefRB9UiBZxqDcroWae9JBWak05AZdFSqRIU0Lubjogh7nmzQG4tW
	 DJ20MXc3UiEApXQfw9J9QX2iDCuFVgdMZQPPsMkcmCO84jf3h/WhfpDtBNiQ72JLz/g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 172E11F00A20;
	Fri, 27 Nov 2026 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774428;
	bh=Ab+IA1pUCd9/4D6jxdIphK5teeAP67ldeGaydg5uTlo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kPvW2uyyL+SUip+h2wn2B94c5/XeaFlr0PT4J9XZBp9Px96J/8luXHAGgDhl5RI+O
	 QDSZSMlcB37Sb97OQVcWkkH1UqRfpSUnjBaaDq5ZnWTFeeNyhRCIHqRm8rpwWD057c
	 9CqsG0i+NzTmAZiRPNekP4zE8YJ0JKLvjv1e2A55Zosk38dqftOYl05gpFCiTmhCvb
	 xVbYnrclq47MOgbMuouOrr25jbJigqa/Uf8ZCDumIhfx6L4u5EE8qw53d9oktK0Nik
	 +tV3bx7lM8s3KE3kcYZMgixdJXiPwtvda0hefsMEx4fC+1YmhubxqsxpUNTYgqJSOp
	 m4vgNoJ/Ohu9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 56F834B6FF;
	Fri, 27 Nov 2026 10:13:22 +0000 (UTC)
From: Yuugo Yoneda via B4 Relay <devnull+yogo.0917.sabu.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 19:13:06 +0900
Subject: [PATCH RFC v3 05/13] dt-bindings: timer: add SiRF AT550 system
 timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-at550-rfc-v1-v3-5-f2221008912b@gmail.com>
References: <20261127-at550-rfc-v1-v3-0-f2221008912b@gmail.com>
In-Reply-To: <20261127-at550-rfc-v1-v3-0-f2221008912b@gmail.com>
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
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, soc@lists.linux.dev, 
 Yuugo Yoneda <yogo.0917.sabu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795774399; l=2417;
 i=yogo.0917.sabu@gmail.com; s=ypl514-20261117; h=from:subject:message-id;
 bh=5gGQGTX3cM+T0BMuz1s2NpjICGlgOs+GfmuaL+bCzNQ=;
 b=pRlW0u6gEj8qbdsRaY3sCiniOo9eUP3bRI12cHyfuSHotulUU6+0zHRbuN6oB6Jza2lOjtIz2
 kUg6CfHHCI8AbY3fxl67gPsRQFi4WAzW8TpoKKJHWy3BdSjFp2yE3Du
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
index 000000000..48a8895cd
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
+  clocks:
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
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@90050000 {
+        compatible = "sirf,at550-timer";
+        reg = <0x90050000 0x1000>;
+        clocks = <&counter_clk>;
+        interrupt-parent = <&intc>;
+        interrupts = <0>;
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
2.56.1



