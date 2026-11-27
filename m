Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF918606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WkYz0uT5;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SSBdfxml
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nnn/mFpoR7L3dnATqzoKoqtIs3zKchqzDBWjzMLVr8g=; b=WkYz0uT5ewdrO7
	MNIK5CoNUJHrhoVi5VsYRjPEXpW8XKAUDoW80WrV+6ygZdPiykwmQOGqApNcm+yORUFtGvdWPql/G
	If6BxqG6StpSIcFYfI7B4YW7UwTNb+qw0s/jPHj7pv4fUN3lUYw/n2nKZAI0EzqJeVmt4sBUQGUst
	azGsqpPBHbpOu0Y+p43Gigkhwa4yl6ST/iVZfxQWpC2xyULBorVLzxv8rfb9j03k2afGW8Ez1QM7n
	QpP6KwCc9n86VT9gMQdPL/RqZfnZN/+EXoiJ8RqntHIO2+vvjK6KgrcgfIJVVVoM+Thcbkrx5DH6L
	iGDo5LoF8Oam9Z2oCT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuux-0000000G3EJ-2Vs2;
	Fri, 27 Nov 2026 12:19:07 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuuc-0000000G2vf-0BNp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:18:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so6256680f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781924; x=1796386724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnn/mFpoR7L3dnATqzoKoqtIs3zKchqzDBWjzMLVr8g=;
        b=SSBdfxmlZs8kjOqqLF+z6QY33uJtXrQY/MIyQF97Ac3XC04RPHHt/iqbwAc9yUHr3r
         TFDDXKdFrsce1EjF9xONZNry46+jUAiuyXUoVZOu2x9Y4RC1WP93rWiEBeYVuPNDJX7O
         jtZUGaWIEn67fn+CAWMTZ7O7T8v1BtvJU2SOwz/RmIp4hb4WYne5LRL2muaPyw1zwe2p
         mY+yDQ+uKLWuMFR6sUOGHjRD+MqT8oiMAuu5wzcqmfR2b+aY5AT30dkoUwrrQ+17HGSC
         h5JHXidXKzjdyimHpmS5KLwsDxB84bW3JcyEV6Xe4Hxo3aaZbDjNuPfiEJ6FglQkgT4I
         fyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781924; x=1796386724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnn/mFpoR7L3dnATqzoKoqtIs3zKchqzDBWjzMLVr8g=;
        b=Z4H06Ih8IPOGmxctNIv3Dra0azmx5rNKnE4X+N6JDUjEH8F46KufFnRlXcXeyLJoBa
         OmE+orETPXfE15hsgCgEMOfCmgRqNBD7zMW5PcFIiskbxJ8gPFgdkryWjc1YmRFlgvY4
         kFI13C7u9oK9+iTUVkSIku7u6md0l1dB8KuKdfrK6V1DgH0Nr45w2zHAp7pu/o0fbj/K
         Vm2PpjK2vxjdCdU+x7Jcl5rkUY5T3SuftO23zXYjN3aC94uDJFmS/ijQRLX2TQfIkXmJ
         sJ6MyLKzbdUqOAX0nRMOWHReqlNgIL3kjYGnyyUcf9yMivGwVNZiCafb1uJllu8gziYJ
         iYhA==
X-Forwarded-Encrypted: i=1; AL+hErFKbprTvRpat99vLJA6yImotDiZAVnBIL7YPt+1MpNQqacKnV4UnyZkteZANnXQX1OGwSYDJl7b0BiJ9X32ONwE@lists.infradead.org
X-Gm-Message-State: APuU4Z/Un17MIr7EKd6zQllyWv+4nvJpnbHQ2pBh8WL8IVFjJx+l1AqC
	+dRQQ9ojc9pJ/Qw0rLwlrwQfCd98uNI3atSA+V2+BYkQLQ7aZwRoUfU9xL8R4ZpT1gs=
X-Gm-Gg: AZFdTZejajz+YPu2n3A9yeAJ/27Hp8m9fHnNMpbmdGug445AwxhndHNgFtNPWvir4X0
	ivDBnUWizbUVUQKThcnUpaZYB5uB6fiXMOZyhFKE57OoOV84LzUdiD7MqY6svwHaXiRktph8+vp
	bNrwQzVd8RPh6MMgMvCYlJ8PgFNgX+eKZY2R/4T5XR7JWGNTS5HbP04tYwi01NRVFcgS9TKn3mW
	y/Tokjcx087TnqyRJ4aUp/z9rKtsvXJEEBH0DgrVPnF588bfbXZx41nzt3Tlc0IuCS70lyFl49W
	uYCi30gyNKN5go6MkH+YixNDHhmEIN4Q4fxHBLrEU5Oo3AeByRwDkB4dI4BNnLqIoC7ZefJRn5+
	6Cv2X/CmTj04YEmI3ItIuWKSrN4rBCDl8TpKH3H2VQi8T1pOhKNPafU2/qfCp6u7U9Z4frnq2Kv
	/QIzH+WFeisYZC/Pz2ESurrvCpb7jnD8KVL3RFvBBXD8z4nTGS/bH6Ngt5ueqTolEVglLzNgebD
	bRW7m8mCRYKb7RMkY/vrGN+md7J8eRUOOb8fA2UqKFcyyAwaQoC0ONeAgUmMhXoFQy3wa7S/d6t
	ltvc59b8+fTfl7Ej6GNXOzhLTMmm
X-Received: by 2002:a5d:64c9:0:b0:4a6:bc53:2478 with SMTP id ffacd0b85a97d-4abb0d5256fmr47792743f8f.13.1795781923925;
        Fri, 27 Nov 2026 04:18:43 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm47786781f8f.13.2026.11.27.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:43 -0800 (PST)
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
Subject: [PATCH v4 02/28] dt-bindings: dma: brcm,bcm2835-dma: Document the flags of the DREQ cell
Date: Fri, 27 Nov 2026 13:21:52 +0100
Message-ID: <20261127122236.4976-3-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041846_100672_91808A22 
X-CRM114-Status: GOOD (  17.47  )
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

The single specifier cell is not limited to the DREQ number: the upper
bits carry per-channel flags (AXI priorities, wide accesses, burst and
write-response handling), which the downstream Raspberry Pi device trees
have been using for years and which the driver is going to support.

Document the meaning of those bits and add a header defining them, so
that device trees do not need to open code them.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 13 ++++++++-
 include/dt-bindings/dma/brcm,bcm2835-dma.h    | 27 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/dma/brcm,bcm2835-dma.h

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index c9b9a5490826..f81740e49301 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -37,7 +37,18 @@ properties:
     maxItems: 16
 
   '#dma-cells':
-    description: The single cell represents the DREQ number.
+    description: |
+      The single cell contains the DREQ number in bits 0-4, optionally
+      combined with the following per-channel flags, which are defined in
+      include/dt-bindings/dma/brcm,bcm2835-dma.h:
+        bits 16-19: AXI priority
+        bits 20-23: AXI panic priority
+        bit 24: use wide (128-bit) source reads
+        bit 25: use wide (128-bit) destination writes
+        bit 27: do not wait for AXI write responses
+        bit 28: wait for outstanding writes before signalling completion
+        bit 29: do not pause the channel when the debug signal is asserted
+        bit 30: use multi-beat bursts
     const: 1
 
   brcm,dma-channel-mask:
diff --git a/include/dt-bindings/dma/brcm,bcm2835-dma.h b/include/dt-bindings/dma/brcm,bcm2835-dma.h
new file mode 100644
index 000000000000..ace34c32a860
--- /dev/null
+++ b/include/dt-bindings/dma/brcm,bcm2835-dma.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Flags of the DMA specifier of the BCM2835 DMA controller. They are ORed
+ * with the DREQ number in the single cell of the specifier.
+ */
+
+#ifndef _DT_BINDINGS_DMA_BRCM_BCM2835_DMA_H
+#define _DT_BINDINGS_DMA_BRCM_BCM2835_DMA_H
+
+/* AXI priority (0-15) of the channel */
+#define BCM2835_DMA_FLAG_PRIORITY(x)		(((x) & 0xf) << 16)
+/* AXI panic priority (0-15) of the channel */
+#define BCM2835_DMA_FLAG_PANIC_PRIORITY(x)	(((x) & 0xf) << 20)
+/* Use wide (128-bit) source reads */
+#define BCM2835_DMA_FLAG_WIDE_SOURCE		(1 << 24)
+/* Use wide (128-bit) destination writes */
+#define BCM2835_DMA_FLAG_WIDE_DEST		(1 << 25)
+/* Do not wait for the AXI write responses */
+#define BCM2835_DMA_FLAG_NO_WAIT_RESP		(1 << 27)
+/* Wait for the outstanding writes before signalling completion */
+#define BCM2835_DMA_FLAG_WAIT_FOR_WRITES	(1 << 28)
+/* Do not pause the channel when the debug signal is asserted */
+#define BCM2835_DMA_FLAG_DIS_DEBUG		(1 << 29)
+/* Use multi-beat bursts */
+#define BCM2835_DMA_FLAG_BURST			(1 << 30)
+
+#endif /* _DT_BINDINGS_DMA_BRCM_BCM2835_DMA_H */
-- 
2.51.0


