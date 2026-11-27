Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26B0606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W5RKMgQT;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=b3IAPT6s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R3AnFPOxgAgx5s9ofy+ghKg7a/HyXXQSnc09fl1YVw8=; b=W5RKMgQTqIz11R
	R2qS9K5Vjup3yaouVQb9345aR+yvstz4X+4HqVAHCR/UbGwMEuvWKX+bElU7lV79/Ho7hypJIHSlD
	G7SYgiMgbOywoQH6PJRxVS+5u0SGmq+h30kl+wVRbAk12KZK4PbBxy1bvLsIz5D15mtA2Lp+E6YSP
	ziS50fYQX0XqQMHFWN7oJsz3Jkgk3gENwRpv4zWA2RtwF5ehOFMXruijXpkKBSPx9+wg4MmmtX57x
	cVl7iVUxq4EFzPf8oAHpvvPhonnosj7voqe6UIVmx3NMiOLnSyTtgKW1KLgbrQNBY8cv+TL5jG61n
	Eq4Nd8lfYuS81rsYEkFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuxF-0000000G4ir-3i9S;
	Fri, 27 Nov 2026 12:21:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuv3-0000000G3KX-1nku
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4b467581b98so77467875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781951; x=1796386751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3AnFPOxgAgx5s9ofy+ghKg7a/HyXXQSnc09fl1YVw8=;
        b=b3IAPT6sHHjh2pB9L74Pct793OUailR+nS7jQ34AW1ZeV5LKRueKFZC2fhQpj+yVYD
         SEO4UgQwUqIHZM4zOZTP8WHuiBr7aQ9UXOcYsWuHFOT164qv0TMy77ZsROXbuY+yBuB5
         QLU2oyZ67i8jcY0QOrRFiXXW8Mz88JsujOf9ykKSZV0lPUMBAP2fCnNaleZRXUzxlAfF
         8DDUMqFJiigQVq4qM4q+wpq5gTRjy+ynNq7jNL2uMmuB0F06Y/5PF86VFEsVMLn2YA++
         he8kHBqYWekUAPP0IMR4nqX6QtpHR3c+kyy/lS04ECd4ulJKDN3QRFwV2U266RpwWv+g
         VEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781951; x=1796386751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3AnFPOxgAgx5s9ofy+ghKg7a/HyXXQSnc09fl1YVw8=;
        b=w+vdNEYJjLNpUNtT56TB1s60g0FOMRDOuwf+p34KgFZobQlJ8et/tIjw4+6Om9IdDH
         fABP2ZyhILgwqGoB5tECtU9LAdOr5eG17enBSMt+D9iwCj77JG5CWY91Xvkt9PDE3VlO
         3NPIS6O44OhGHqRnHBnnzjABKNdVNR7vOHqUlzQs3VdiwevfTxuMRIjlIJdoeiEkMMQb
         b7GOXJpzrkAwSlBOZTv4KGdqGcsyUcDjaJRFa/ldnGL8O1elMHIPEugHS2KYhC144tVE
         TkqjYDzcNvvhcFDhTgaG+QmuX8nxLUj9C/a6WwUJ7aDAB7NAfz6XIRikrU2J/o9+5ZnO
         tK3Q==
X-Forwarded-Encrypted: i=1; AL+hErGFvUp4iMPJO9QSPnvGCdFAqKXTLNY7iaZIBaphvX7P6OXJ3VOsTxZXObWiRFk2M95o5n4LtChNiUX+l1uTQBq4@lists.infradead.org
X-Gm-Message-State: APuU4Z8UoJkOMOzO9jps84PPVWImEJlRAK0FYBF8KSkRXS7cbqcWCQ56
	DnkVBp+TAkMSvxylT75sN0tZwOBf4tCR8dSU1p0/TzIwm7o3uqIKoJfBHBZ49rkfoXs=
X-Gm-Gg: AZFdTZcxO/26mlxcwk6vdim73u3+hnACV9yviC1MTGGZt7kzr3HgHpwGD8W01Vr5148
	hRlZgkisyygXCFxVazQu9c/N73dfFb8fyhsHglsj6WWxlPfqlEXlm9W+E82qVq4FDHxOdmnO9lB
	NGsIJbEMNWaIWwjcK2jTwA2FK80W5mRQBTw4Tm+suVHZj8zvRZBSSqmIOxT9SbJwrUqstf5NGre
	aRIcFdPHhperTSgwUi0nyfG8qF0gce7BKNjSyZcqhi1rQJfYcbh29xW9kwkqH9LpYsjB0G5Paw9
	MlQb5P1xUNJyDNIZBQBxA50+ZAK18hTfcquZLlVz3z0wmK6d9McpH3tqQhXGhTtIiTR263r+SZZ
	AmeWAbnSruAtweAH3STks7nqe9X+DHPMQArKa8SNDwVYnhCqXDboA8JGaUXF12pwgHy3uj+ZguG
	ojLJbEJwyC/j6E54PRYgbMEqdL++rpy1eN2LjxpdShSath5Xv1IR+4g75d73heNOaDef53sENsl
	cZUBF5avcKX9a6njMK2d4OKpqIoKWadA4kCyIxTVd+SMLqKt51VVB3U+r2lODY6Do1/y64vVzkO
	x003Wwrr+isV3cpkDqBUH/GyvVti
X-Received: by 2002:a05:600c:a08b:b0:4bb:6651:9eda with SMTP id 5b1f17b1804b1-4bb88922ca4mr460860355e9.14.1795781951466;
        Fri, 27 Nov 2026 04:19:11 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm753770715e9.14.2026.11.27.04.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:11 -0800 (PST)
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
Subject: [PATCH v4 21/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 40-bit DMA
Date: Fri, 27 Nov 2026 13:22:11 +0100
Message-ID: <20261127122236.4976-22-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041913_500587_640FED8E 
X-CRM114-Status: GOOD (  14.83  )
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
index 51ad8bc33d5b..d4a7001d6f97 100644
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
@@ -120,4 +145,22 @@ examples:
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


