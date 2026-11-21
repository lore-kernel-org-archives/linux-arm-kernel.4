Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76443606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xOPcpoGq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RENiY9Y1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NUR5sQPJk7XLxAjWNCv2J34+6AGV8PKFFtI00bIEIzA=; b=xOPcpoGqPYhQVcPFGx+Puzeg0b
	q2oAUaUpRa3BCZ/BDUh7Wv53d1sN3sQuKtPSZGi0S9WC9Cjogkqsth1DffynXQXM9Zd/o1D/jgxUd
	95MiG5rFXdVVCAcS8doJkRzfXwu5VMfivbB2Y6dEY5pF+1XzidftCE+SZfDrmfHq+V4A5RxF6cWwA
	+XaNG1OJ3E5ZK/WrAVryEiEOVQEjp4iJV4UN3A1m+24WnX9jD1cKNPV8z0nSeO49BqT4oLKe4bZnS
	nHNxWnOJKO6h462h5GAU+TqVCZfJD12kfBr94fFeZLzYzrzc5lSLqvY7lCPBwZJeWm8+HGb/lENux
	Knr37PtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkRO-0000000HCVS-1g37;
	Sat, 21 Nov 2026 12:43:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkR1-0000000HCKr-216e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 12:43:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E606B45D37;
	Sat, 21 Nov 2026 12:43:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795264994;
	b=KgWIuUWL3+NZ2YggpVpa5Dsuyrx+6EYkLXFKT8qdwnl4kVkEzA5uwHAkptMU47d7LaEm
	 nHfjd5U8jhm+YWhzw6CTkhH2xv0teN0iYSaZ88EYEklzERm7M7w0geDD1JJ/ma+U6oh2G
	 RQtWk+4IY7D+87ejbKEFDQSXd3c9Mv9TniPkU+UubIjf0IYaY+moYyDZW5pPEC7gucwzo
	 vSsN2ubteTytHt9SuMMWqPWJMDhnlz2CJOAr/37ABhM+lqcMkurknOPPyiK9Tlw6Zsv4f
	 oRMoV552EpxXcaHV7Z/KL58akz2JHZC5w8TRi32y/4thCbZbEeZMWvAMnvBQ1MRwfow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795264994;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NUR5sQPJk7XLxAjWNCv2J34+6AGV8PKFFtI00bIEIzA=;
	b=lvmXzb1lfy7dIhNPB1FKlmdzBkJhV75pODeRfyUPetX3Qq6356d4dAo7THSJanENcuYW
	 C8Rj7c2BFSwnFKIj2QOMySH1u1WxLmbc3U4ZrKLFz4lG9IBRbYlj1QEEWLM1hTNgW7Zsq
	 jVRkVtcO58RT2TPf1s9ryoI8xeLGqy5E0nLFiqnnNU9oVEyYwk+I6IzfIDZqZ+iNAWXlP
	 I1EpjHpl1PsR73Bg5tZ6mYt7xWoB5a2jaDADQPJFLowCX/BnCcQC48LjKPojTJ+XhMkM3
	 oZ19918byJLJwqgFeTUg10un1Lfv5pxnLAcri4WMxxcGWw8eKKt2KaS90Zmd9C55iBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A037C1F000CF;
	Sat, 21 Nov 2026 12:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264994;
	bh=NUR5sQPJk7XLxAjWNCv2J34+6AGV8PKFFtI00bIEIzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RENiY9Y1xjHut7sZWF+Z2UsCpKXPU+DXwauVTZxDnbiehfhscRXnFv1RF4jq9lbC8
	 y4DHz2OIXw+sowR/Bgs89xDpVI2w3Qn0OSO5Awjt7AFjzwB9HVSjnPA2MC4A1Cmrx2
	 lYToDVVqTl8PS04LOFTgJuIVUr52Db8ZOqnXu8bZY3iU0TwkfJ3NS4TmKTSvxAkb6+
	 HmI9GI0B67SHQzZ8z5vZDhzd7joQ/0kOCC5cdH5aSbmqUjG35TKF180YUg2NhnLrxA
	 FUVEss0+ivXgQPVHduvunrIrc2+Yij2DKu5rR6i5cj4fRj+3YDUmlyomfqkU3T0uoZ
	 Xa0JTa1NoSafw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 324CB4BC3E;
	Sat, 21 Nov 2026 12:43:13 +0000 (UTC)
From: Yuugo Yoneda via B4 Relay <devnull+yogo.0917.sabu.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 21:43:13 +0900
Subject: [PATCH RFC v2 03/13] dt-bindings: interrupt-controller: add SiRF
 AT550 interrupt controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-at550-rfc-v1-v2-3-b0309d0789b2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795264991; l=2262;
 i=yogo.0917.sabu@gmail.com; s=ypl514-20261117; h=from:subject:message-id;
 bh=hQXi5o6uDCTP4E56RNB4IhOxolk7346NKiavrfeMedA=;
 b=WIlFzlInDyH3iaKROCkCJ79qmP2V3e+BWEsZN/YE/doff08yMT0dtpSHH8nNByCNmylgYiG82
 Nu2OcIauQIDChC+JqCUewwkWIG3SeiWaUcRwUjYXPVXQQGJWWvxhspF
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

Document the Devicetree binding for the 64-source level-sensitive
interrupt controller in the SiRF AT550 SoC.

Signed-off-by: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
---
 .../interrupt-controller/sirf,at550-intc.yaml      | 46 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sirf,at550-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/sirf,at550-intc.yaml
new file mode 100644
index 000000000..7effe6c9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/sirf,at550-intc.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/sirf,at550-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiRF AT550 interrupt controller
+
+maintainers:
+  - Yuugo Yoneda <yogo.0917.sabu@gmail.com>
+
+description:
+  The AT550 interrupt controller routes 64 level-sensitive interrupt sources to
+  the ARM1136 IRQ and FIQ inputs. Each source has a fixed active level; the
+  single interrupt cell is the source number.
+
+properties:
+  compatible:
+    const: sirf,at550-intc
+  reg:
+    maxItems: 1
+  interrupt-controller: true
+  '#interrupt-cells':
+    const: 1
+  '#address-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@90020000 {
+        compatible = "sirf,at550-intc";
+        reg = <0x90020000 0x1000>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        #address-cells = <0>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a825b3bae..e052d9dde 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25851,6 +25851,7 @@ SIRF AT550 PLATFORM
 M:	Yuugo Yoneda <yogo.0917.sabu@gmail.com>
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/arm/sirf,at550.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/sirf,at550-intc.yaml
 
 SIS 190 ETHERNET DRIVER
 M:	Francois Romieu <romieu@fr.zoreil.com>

-- 
2.56.0



