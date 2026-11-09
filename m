Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E35B606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 05:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=djaUSMSA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JhwQxrIA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+2wCtwxXKIDkxHcE0WIbk0DNcnVd4qsfVLWBnePcPdM=; b=djaUSMSAnKWQex
	lBcMKIgyR+PKmeqEtdDZVHSbSo8uQrpiPa2PDo+F2WYk9LtUC8t+Fj2kBheaVv9Rmg1MIzuMY4sDI
	MWmKX9fjo1BicLGtUd/RRjszWQpAcuRMSmb0psuWQgqrqYewsdbsgQpOuJuHvb7/AHHqH73TnI2vx
	et9gr6AsX7KySvElEQiL0O6XC5iOljfljJqghtGcool5jEoFEQWRkH4W5RsZ+HM5Snwx6Qzz++9ld
	bgM9aA0y9bWbpDF4IPvYIyjm3aQ2vrzhcfIR04/nz3qLw96rhHL8H0Qj8nAZ1nlN/e3FTBMYnaAOu
	QjkHAMH9OkNCRNrR4mhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHwP-0000000HPhb-3eI6;
	Mon, 09 Nov 2026 05:29:13 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHwN-0000000HPg7-0GJK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 05:29:12 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so257479b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 21:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202150; x=1794806950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2wCtwxXKIDkxHcE0WIbk0DNcnVd4qsfVLWBnePcPdM=;
        b=JhwQxrIAU13efAhptef3pWHApF9z/YOtxIQigZZM6vModzBb6ssH19VR0btKS7OtMq
         riECWEos0Kafc5tQ85n8PqffZazHHa3Iu4WJ1VcFtn+6de/lUmnXVa8O/qx18e3GHZp9
         K4QUlhoHetJg9WoZ/ZrW+w5iSE0sKC9Bj6B8dJXjhV5tOtICzF9p6ssU9Fh1A/N85loq
         yHrbuAQSeU0+mqThj4FZdDcSr3/nf+edxIHOOFRULhv2LwP5k8PLQ3vyA3FmouEWC1Dx
         jUq7/2xAtP+/KAwvR0DdlGWvks47A5oDk7DdSwccQO6oOCB/kcUDSKMOzPjLDbLbffd7
         yiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202150; x=1794806950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2wCtwxXKIDkxHcE0WIbk0DNcnVd4qsfVLWBnePcPdM=;
        b=2kk1HNzICJFAgyB/YOkGz1FwfAgRceAil+ctvYu/oXgSAnX5V7VNoP1koZcKRlUzMd
         2RkmdGGqTTcw1tnO6tWlSKlBHGANLESDScUin8MZNs43dVxO3D0/VXIcoP0qU8wFrnCr
         eImtUOVvmpCmus2YTnKMThOhaOU3mY+NBp8m/uW4nclJaDJNPZm04SlVlRgZ0PP4an7m
         +kJE8CmIfLrtLWkKiHYMUtnJaYMH/MBSys6Oz1GoEU9kGJRFrNlu7ENSKZGq3rRpvzPs
         piSYprGHKRkE5qIHFtI03dSMch8f420EiJN7wQsqUMgIWyyJkM1t0MQCek6Xh1ys/J5e
         56dA==
X-Forwarded-Encrypted: i=1; AL+hErHzzCh4s5wisE3yX3cpyOOQLlpvCciL3bCxskZ9aLPfhOSVu3TY4KlYENy216de/XSRq2KX1Oa52qdYm55+LhWw@lists.infradead.org
X-Gm-Message-State: APuU4Z95EgTQmJSez405pyj9AL73RnIMshV6VVIyvpntQTRupp811dQJ
	knQtbEBkKrH0dZJaRXEcJ85pSuzB3GSvNjlYkCrIOpMpP8lLx5oL+mTZ
X-Gm-Gg: AYBFou0k5LtY2l/3pUG48fEwfx4gAqnSi9s81+umxugK8qfJTgouGWO+Sdn2dNxvoww
	PtzQYQClDOtrUA1yN987/6oumahKscHauuDHHzWE1IwUDxDBdQjTJ4LQbTHye7iUcazJSpx1cTK
	g8A0UeIItTBqgBghAnm7UwS5lk682VF9FBmEJK2bGStHgVzpH88a9erDczlT05A6kMHafQ8/UgU
	NDNN7r1z1c6XCHW+FaCsHfEjfrtZHf8rrul+bwNGEcnqmT170pglQ1hxFNWf4l/ElpK+5c5GwPa
	g/Qy/d3AWn3QSCNZrldlBmjUYDbsszShveAUnMdQGyUwYQQVUdZ/HdCxSJV59qq1cDR44twalbo
	eXA5d9SkUGpxvZxiY9mAWo9CB5NI5rYsC5jmSTLq3l6qpISRrlqUcUIsORZK8BJ6HUFvFT8y8pY
	jCzLjTyCST4gp7HdzPFGwstcBZR1+uhuJ4v+QvBAv5m8TOeUIJu0eDQrRXt1KtorJYzOawstFLn
	imLodxD+Xk9rMip6Mj4yp0zhCV/S5hRYo0HYjpfkaj9X6yX4jMP0aj9ZWpiuNPtDHZvU/G3ENYf
	k8dox6MqgtR2BaYxgKdX+4qApKEDn9OYoShWFAEqcvhfmAoWCEfkchA6AteuF39MyOqZuOyhzDo
	T5gkulZ171jGB8FU=
X-Received: by 2002:a05:6a20:ef1a:b0:3e5:904c:78d3 with SMTP id adf61e73a8af0-3eed5ce2668mr2545295637.69.1794202149963;
        Sun, 08 Nov 2026 21:29:09 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb9681385fsm1180899a12.6.2026.11.08.21.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:29:09 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
Date: Mon,  9 Nov 2026 13:28:59 +0800
Message-Id: <20261109052900.2960473-2-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261109052900.2960473-1-shanchun1218@gmail.com>
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_212911_103603_833EFB8D 
X-CRM114-Status: GOOD (  13.07  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add binding for Nuvoton MA35D1 PDMA controller.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
---
 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
new file mode 100644
index 000000000000..d05971662a5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PDMA controller
+
+description:
+  The MA35D1 SoC has four Peripheral DMA (PDMA) controllers. Each controller
+  has 10 channels and performs memory-to-memory, memory-to-peripheral and
+  peripheral-to-memory transfers.
+
+maintainers:
+  - Shan-Chun Hung <shanchun1218@gmail.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-pdma
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
+  resets:
+    maxItems: 1
+
+  "#dma-cells":
+    const: 2
+    description:
+      The first cell is the PDMA channel number. The second cell is the
+      peripheral request source number, as listed in the reference manual.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#dma-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@40080000 {
+            compatible = "nuvoton,ma35d1-pdma";
+            reg = <0x0 0x40080000 0x0 0x2000>;
+            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk PDMA0_GATE>;
+            resets = <&sys MA35D1_RESET_PDMA0>;
+            #dma-cells = <2>;
+        };
+    };
+
+...
-- 
2.25.1


