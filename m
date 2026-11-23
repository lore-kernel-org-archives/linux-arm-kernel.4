Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D9A606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hBYwZa8C;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GtbPfrhW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2ojavuWL7IswiT9p/75gc6DxtN1C14kg/yxfkQH6rLY=; b=hBYwZa8Cvzjm7f
	/9kD4ucpTGLUbKqKJ/DiKVLsih+8wVqRDCrCgy8bcq5BxoVpEjEGBAn608yOoUlE48Yi9DdKS+EeE
	lQzqHGulyjkKuFeYIQ+L46Lhv7Mhq65girYVpQIYNuS0yxNVjIWwT0neQDa4bItwRKuqGsy5tWWYg
	u9EgtESKL8iH+Nm1KueykeK+HmxAA2h2O6bctwJRJljwPRWNWDGnYc8Da6HNl+EAAna7MwkFkx3ng
	SoC2/wqJAFMifjLrZXufAzDmepFhK3NugN+Do7l4VWOs0kcQ4p3CGkiT6eqWD2wtb1EcT1jkVGb9v
	GAEMrpEOaPaDSzJW45yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVSo-00000003psQ-2wo9;
	Mon, 23 Nov 2026 14:56:14 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQh-00000003oeo-1vI0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:54:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-491971ac844so3134055f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445642; x=1796050442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ojavuWL7IswiT9p/75gc6DxtN1C14kg/yxfkQH6rLY=;
        b=GtbPfrhWdCDly47Brbf0ZY9ZGkTp/J5Ku5gb1K8SVfTFD0hDyGLSLF6tZGVKWKW6kd
         sryUYylrts6oZ87oWdVYC/Dq/IY+OVwi83yJSnMaUMQTpw5Z4wm+S4k+wFtyERTP+SFD
         1nEmKcEWJDt4StwJoqc6dMVcF2c/Jb92zoKSWGBWt7KF+/Z/plZ+Cq3h/RLxMNqlPtA1
         OP2xHsFW7ey5MhwUM8/fedl+lu4KCdjblJgRBAXxWnIlw7fcaNXrUa4sU89XESJtCJDv
         Uu+79Vgcjke1SX81e80S2abZYPlh0j9a0zkUg8crpQWT2cjN9FenEuYR3FZZX5kz0IRq
         zoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445642; x=1796050442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ojavuWL7IswiT9p/75gc6DxtN1C14kg/yxfkQH6rLY=;
        b=Z7mIiCoUmRIeRxW56S/HxvfOJSwyh8UhD05N8Dr4ZQ92twh7TFpkTPEBgkb6UEED3O
         g2xT8vu8VYXBPzE/dJ26fLy4iFR0M7uZZ/ADVgLeFcGYPngysmlb6B+pL8SRVjpoYwNJ
         AWysJuiSUEmIBYris8iFN+jKf1X1YQcesjwJyO9lpdqCUsT6bszSNXm6nK80bLXpafYF
         TdyBaVg7i2nFYUjT5tkzDp1LLfTp3smu5qwwsAj64Uob+wUT8iJ99rNGv5fYZm9iY1V2
         WUnGhbtCGPmKliPCpYRXaaTND0CcnyYbpzpbRHnojYkOKEFoxB9oBALOOhUvgQRBggpv
         So2Q==
X-Forwarded-Encrypted: i=1; AL+hErFHMkExcUqnPebFQfeR7EUaXcVdZz2yRyMeZ0k2TnRGCvr6mK9KBrZzLGGuRYk9VSfDXmC3sCpuLHc8OcWObXF2@lists.infradead.org
X-Gm-Message-State: APuU4Z88EmHgGdJUyKr3bOQtkaHS8XCnZW/+mj0TZSATnQlzoqczCHCs
	JFknD7NB7mfTokHd2hDoSLW14EdaQ2BhBDyhR8ykgzY33pnIoWt7ywISUnkiseD9L1U=
X-Gm-Gg: AZFdTZdiu44XQ8jH+xfLpCxNiiLdagWP24jm86eWW5dd9ys/bCwCk9zArcr0CFJy05S
	tCZIDnIGXQUgFdfAvGtSVbYmUhrTKrSqhtfGHy+NmINLxA2Uo2VBBuGRaW5HDiJ2kENjUEV7wTf
	b+jI6d2qsd3mTItvKNAsSXH/4qG06c+gLKojRZ4vDiOZMa29FHOI8p5x4Dgsqa+e1NWYmIgaHaB
	T+AwZecZZyWhYcABikQSZCD/JetoNhyor6jUgmlwrPTvJIAc79tBd2i51CxZ8yE/gDP2dryJG3b
	BZxhHAVajhNoekKz+K16TwevVKEzN52w+nY5mqlZIzX3ZY6WQtsYwGrIxv6XS/tS9Mg52yJ1d1K
	JieR9kwcDsRW4TpNoc5Sa7FJ2im9bfQT6SESDHgq3Q1VdQCaku+cqsRv+VYh50+A/+S5XOUBWy2
	rQZoB/I4sqAZ+c1MkfgAJE8FwTaCTsEeK2PyK/1rm/BL7oREFMuFfAMxt5zyCmvbsBvkMyWKcH6
	wNTYGYsCPtZ9LWMLOFZyv6yTvv2wOQzxT4bTY9MGcKBhK4A+AD80gmrCezJp7ClvzrrESLkDHSL
	/s8A/FMMghMSN/7Cly3ziwbWQR8=
X-Received: by 2002:adf:e886:0:b0:48e:3ebc:d242 with SMTP id ffacd0b85a97d-4abb2dda339mr17523667f8f.37.1795445641765;
        Mon, 23 Nov 2026 06:54:01 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm26379033f8f.21.2026.11.23.06.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:01 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 21/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 40-bit DMA
Date: Mon, 23 Nov 2026 15:56:59 +0100
Message-ID: <20261123145728.29082-22-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065403_527242_D319D86D 
X-CRM114-Status: GOOD (  15.06  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On BCM2711 the last four channels of the DMA block (11 to 14) have a
different programming model allowing them to address 40 bits, and are
described by a separate node with their own compatible. Each of them
has a dedicated interrupt.

Constrain the interrupt names, whose numbering refers to the whole DMA
block also for nodes describing a subset of the channels, and require
them for the new compatible.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index f619e395cf0d..b53652d5146b 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -9,18 +9,41 @@ title: BCM2835 DMA controller
 maintainers:
   - Nicolas Saenz Julienne <nsaenz@kernel.org>
 
-description:
+description: |
   The BCM2835 DMA controller has 16 channels in total. Only the lower
   13 channels have an associated IRQ. Some arbitrary channels are used by the
   VideoCore firmware (1,3,6,7 in the current firmware version). The channels
   0, 2 and 3 have special functionality and should not be used by the driver.
 
+  On BCM2711 the channels 11 to 14 of the same DMA block have a different
+  programming model, which allows them to address 40 bits, and are described
+  by a separate node.
+
+  The channel numbers used in the channel mask and in the interrupt names
+  always refer to the whole DMA block, also when a node only describes some
+  of its channels.
+
 allOf:
   - $ref: dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2711-dma
+    then:
+      properties:
+        interrupts:
+          maxItems: 4
+        interrupt-names:
+          maxItems: 4
+      required:
+        - interrupt-names
 
 properties:
   compatible:
-    const: brcm,bcm2835-dma
+    enum:
+      - brcm,bcm2711-dma
+      - brcm,bcm2835-dma
 
   reg:
     maxItems: 1
@@ -35,6 +58,8 @@ properties:
   interrupt-names:
     minItems: 1
     maxItems: 16
+    items:
+      pattern: "^dma([0-9]|1[0-4]|-shared-all)$"
 
   '#dma-cells':
     description: |
@@ -119,4 +144,22 @@ examples:
         dma-channel-mask = <0x7f35>;
     };
 
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dma-controller@7e007b00 {
+      compatible = "brcm,bcm2711-dma";
+      reg = <0x7e007b00 0x400>;
+      interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "dma11",
+                        "dma12",
+                        "dma13",
+                        "dma14";
+      #dma-cells = <1>;
+      dma-channel-mask = <0x7000>;
+    };
+
 ...
-- 
2.51.0


