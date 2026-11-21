Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69772606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wp51le0n;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f4ef/v33
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xUb80D30HN0DexKwD7t51Nu9644o2kzgN3wPWJ8IipE=; b=wp51le0nQB0q3IE00Lgh2YkqUQ
	+si5f5MltckoaGbcJJipaWxTW+ZtekuaBcMOpTGyPJWf/IYUQJeFVxV7k4XEBtwZKVyywGBeajxZG
	hSFXiiP7DJ5uBFtHgIj5tDz36Mp90ftlIbyqH0jcEDCRNHkQS8NXFThVCRSz7Qi0aGFKVqqKfdo+d
	v6NE7XBuxfHairNPitKfldyOqVlD6XBe3b7CPwzbMD7/Fp4XfZjco+b/gFXEOLWaYzAXl0K9gp6Q6
	IfazKllu4DCYglh/E4XrdcOCnu9OfR6XVeGo+SbR7S0uAarUm/0pjvhX28aVMrIEKEBjIb319Ef0j
	StIaNRSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkRQ-0000000HCZq-3VH7;
	Sat, 21 Nov 2026 12:43:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkR4-0000000HCMs-1fbE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 12:43:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F01540C36;
	Sat, 21 Nov 2026 12:43:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795264998;
	b=uDDbXblnLhDx2GPfwE6ChRzQb1aNvOl2kF+wPdDtFU8mK3sMcni3iQ3jbryQsQ082S+x
	 GLCNR40TWr/pdZjWpRyfKouifyyqT5YeM9gaHmPM6Q0i6hJ5FSuaQMIwTC6UHDhnPtK55
	 p+A2p/Fe4vGFqMmnyqLtg6X1GTZ2AfV2a2D94kTGk2C2J0ipczbSYJ87Cv8RUx2UyYzHt
	 WLoK3Fn7aEOI8sW5GvDdG+8L7NKj5b6EXABSKOGGSCKAnfZvgFOBfkpdEFuFy1XWzyYqj
	 gzqd8/qumUMfrzf1I/f29Ju9htPp66CaUzdq0K7TDEbwtoe8QutrjDWffopBTgdvxGQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795264998;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xUb80D30HN0DexKwD7t51Nu9644o2kzgN3wPWJ8IipE=;
	b=e08hB6PciCf4Mf7GgwNnsUXJR2ujhnGEqIGxIYazfzNLFNpRfqIAhXWV52hvUnxmapm0
	 h4N0M/adnTUtYBR5QBIWYh1WG2E9P4I9j4CFqs/Cu3AO9vxwh9TgqUdKIHfZmEtHPKNDu
	 3GY7ZW29/lVys9ykcIRMm5EwFiAwEN8KmpcU/bTH8tK5TuRoe24JcZWMg4DoJfg0Y/K6g
	 JrbJqHisNadxRobv9jnv25ZT+t4V5U4/ebf1pBG6LD8rm1XQgeq34BmdvFaK9E8C1qXzw
	 XbS0oz/dOt/yty50rZsTn9O10rqRVkhyBTHOvOPkfFDqGYAc6Ulavv2MNkOq6pF0GGQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B8C81F000E6;
	Sat, 21 Nov 2026 12:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264998;
	bh=xUb80D30HN0DexKwD7t51Nu9644o2kzgN3wPWJ8IipE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=f4ef/v332CSW1tGruCYNrhi1XpCPnOUKmrLXU5SvjUiC1Y8ZLpSbVLeondYmbbeIM
	 n6PbWZS+JH6enELa5YTuNQXAuxLNy5A9Byp693OSHnljZT4+XT1oryiEVctzKVPBkI
	 euWRAYSMJjHHbv4MI2HRunA46xgJ/pQuY3rHK3t4iKLmi7shvEOv4wrRkzeHg+CJfF
	 yNf94VLoa1kvaos9Aj1fPYi14h+eZYz1OQKEv78+6nz/FoayGGRvkvAjYPVt9NBcSY
	 mHDi8JDC+66ocQQ88HxqMR1jUJ842mxsQNRZXaRUyp5lWe8fCk24XXWOHaA6Q62/DO
	 KXi7MA6d1LAMg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CE02F4BC56;
	Sat, 21 Nov 2026 12:43:13 +0000 (UTC)
From: Yuugo Yoneda via B4 Relay <devnull+yogo.0917.sabu.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 21:43:19 +0900
Subject: [PATCH RFC v2 09/13] dt-bindings: mmc: add SiRF AT550 SDHCI host
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-at550-rfc-v1-v2-9-b0309d0789b2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795264991; l=2242;
 i=yogo.0917.sabu@gmail.com; s=ypl514-20261117; h=from:subject:message-id;
 bh=Cw4PW1ium2XRqrgyq5Y/w+tMdamgHyjj6FEWVO1PTf0=;
 b=a5zpJI5EjZIlhB/FD+UmNuiUUXzSTRIjkg4sO7w1rcWzckKK7gDVBjOIO3C0eFjJNY8WwdmVc
 UhNpbbAXLIQAkJNLHm9G7C7Wsjlcl3mCu9pYSehXwFqMXqfogeooB8J
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

Document the Devicetree binding for the SiRF AT550 SDHCI host
controller.

Signed-off-by: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
---
 .../devicetree/bindings/mmc/sirf,at550-sdhci.yaml  | 50 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sirf,at550-sdhci.yaml b/Documentation/devicetree/bindings/mmc/sirf,at550-sdhci.yaml
new file mode 100644
index 000000000..ca0c7c414
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/sirf,at550-sdhci.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/sirf,at550-sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiRF AT550 SDHCI host controller
+
+maintainers:
+  - Yuugo Yoneda <yogo.0917.sabu@gmail.com>
+
+description:
+  SiRF AT550 SD/MMC host controller compliant with the SDHCI specification.
+
+allOf:
+  - $ref: mmc-controller.yaml#
+
+properties:
+  compatible:
+    const: sirf,at550-sdhci
+  reg:
+    maxItems: 1
+  interrupts:
+    maxItems: 1
+  clocks:
+    maxItems: 1
+  bus-width:
+    enum: [1, 4]
+  no-1-8-v: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mmc@56000000 {
+        compatible = "sirf,at550-sdhci";
+        reg = <0x56000000 0x1000>;
+        interrupt-parent = <&intc>;
+        interrupts = <36>;
+        bus-width = <4>;
+        max-frequency = <25000000>;
+        no-1-8-v;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index df3d38c6b..1164152dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25853,6 +25853,7 @@ S:	Odd Fixes
 F:	Documentation/devicetree/bindings/arm/sirf,at550.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/sirf,at550-ts.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/sirf,at550-intc.yaml
+F:	Documentation/devicetree/bindings/mmc/sirf,at550-sdhci.yaml
 F:	Documentation/devicetree/bindings/timer/sirf,at550-timer.yaml
 F:	drivers/clocksource/timer-at550.c
 F:	drivers/input/touchscreen/at550-ts.c

-- 
2.56.0



