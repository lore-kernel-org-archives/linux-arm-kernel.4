Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2D060A5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=00VfnJlY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bLpmXzck
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L3uorpJsDuQi8hiKfbI2IIOCDoZSKWRJ97N9hJn2fYU=; b=00VfnJlY/1punOmaBeWNelSxHy
	BtanHRsyxFDMz8DwmT9UAcMWNk7HOJsg6marPvBvk64UqLeBJcElk58M7klaTdSG+9hQNBzQeDeun
	+8WHJwHQN5mq2AkxcyT4khdBNwFEpqK3Xy2LIieARLeLO0HLiF4crI10xwoNkFS1Fy7oxKrWX0mUC
	P1qWn8QtSICFYFvyXgC5EcRNHqAhTsSB/ju1S78CTRM+t07uxCZmuB0F+6XAuktzpU2VkV8FVkGFs
	3f3B6NS8al5oTZx1XCcj1Cj3Hq6PXJclIC0D/AQA6wtFNZ2PX3E0yKquGpxa+FlMwHhXrG0F9TXjn
	77YwQD2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsyA-0000000FZE1-0dP7;
	Fri, 27 Nov 2026 10:14:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsxe-0000000FYuq-18DV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:13:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CD41459CF;
	Fri, 27 Nov 2026 10:13:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795774425;
	b=H4dG7uF0jCrmuxY2elm3DTsFvHOo37hi2XfBPyCxMFdxT7e9XtrSJI0xTHUE84J5lX1U
	 7NYaxPb9I8+jpAOL2XWhQF9qEI5O9P/6/Z9bbBGanQDgjiXcqvPRqvNjoffoC2BvYlQO9
	 9NfrNXbnoLfn8berXPElC6Af2BwOxd/7Iw+iSWCQ69InrigxEo3tOT9HlR0sG6EZ7nE8T
	 iUNnf+JQfbrx2ixaTqDlTSlw5I9CZGA+isuNj3iZ9bTLBMwiGEiNEqZg1I+cHSDzoJmaV
	 p5evMIgeVWCDhwj2VEyCZVb1klfiM30jCFCD5e6LFfE+Pgi75HRbAONRQYk8wAhycEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795774425;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=L3uorpJsDuQi8hiKfbI2IIOCDoZSKWRJ97N9hJn2fYU=;
	b=zItJXyhjaRfIBs9ejqrv2co3vh/SQMHMa1zg/9/xyXlaZb6QA86uaRdGQoWDCgLZtkbA
	 /67oqr5Chy5WNThokKoKymAZm/+vsdVj4SvVoZ0+e/6m+ezkpFaFeQ+BGQ7CSNbbhvmPf
	 ePcN9lJI/lsCHuYtanOJ6Ia1PApnFUbwHqq7A22qSlDL3jObAK7NsaEYajwNKyVpMIGlZ
	 DH678LAVAfPMDUzHLD0GTzvr7sXmm/DaZ5Uy+xLMhPUrrhsgxqgNRpWyxqKKSbAkH9OAM
	 dBjoVilYIkv1tNpFkILNcpI4g1GYZzbcUoH3KikizmZe/ObdQgWW/traQFw5AdjB4Vg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 816361F00919;
	Fri, 27 Nov 2026 10:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774425;
	bh=L3uorpJsDuQi8hiKfbI2IIOCDoZSKWRJ97N9hJn2fYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bLpmXzck+8l9P8LUK+2aIeR9vwlqmJ073m5oaNcMe2Rg85sG3hoWR2yh2zDQZi+nJ
	 0rVnB8Z0YIejiP4j22fvWSq3VfiJ9W+V/lCIR1jFkqA4u1uKu9p/YO4mkXQwJXnbge
	 NRnbjpjMOz++RfPhwTJgjCn7fxtxr38fIfX2Fqk5mGq0uc2eGQyCmeCMiCGkI+dBiU
	 +z0Wz2HCA58pTiXmfrHJUr9Wc3kCceHqiN+K4cIrrAjMEaW0/kj8CGd9JI6X3oTLlX
	 jLLec0S7EOxzBRZo6qd+o27Wi35Gyn9zAvxDK4iwri4Bb+LGI8RSxpMxXX5PgyV81n
	 jXyycQ1naHoMQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1035D4B6F7;
	Fri, 27 Nov 2026 10:13:22 +0000 (UTC)
From: Yuugo Yoneda via B4 Relay <devnull+yogo.0917.sabu.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 19:13:04 +0900
Subject: [PATCH RFC v3 03/13] dt-bindings: interrupt-controller: add SiRF
 AT550 interrupt controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-at550-rfc-v1-v3-3-f2221008912b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795774399; l=2262;
 i=yogo.0917.sabu@gmail.com; s=ypl514-20261117; h=from:subject:message-id;
 bh=F60mi4ewot5gPQAYKYIRAeZ4rErv6ktzSFwpDWHu6xY=;
 b=TyCXSzk5Q2h/ZYk3LbPQWnuhQdFVxFL6RWlbhpnvJAc2Qrj+IAKUj744D0gvSW28eOsu2ccZL
 xNsjoxpdA13BiV6tNin18IELHG/RL245E0NaStgGdI20VD0jXpZV1Pk
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
2.56.1



