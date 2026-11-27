Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B34606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s3zvrTFK;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=G1zVlhQZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CKw4sWprE2Ul+TtVWYzdYET0k07qC46nb2OuMsfTntI=; b=s3zvrTFKWXo9KJ
	xDSepJ/3A79Xja6OGwgvr68O6mbiPOGGApVRFO8niiCu9BwS9wtV/qvHVYFgRyXlHQk3Yms22zpMo
	sJeHdYQzKToGqi0fxHm96J3qAnUzGZY1FopEaSvmvKaP0CxGxXAZg4bLBw/fqOgc9dHo2+yIUQnZU
	qFZ7hWiwQh7X23N2nzEgD13pIb8H/i4n6fbRUjCxGuCQLJ//1wf5rnmuDbhxtJaKkd68rE7n4geJX
	vJzvLaYWrYG3PuRDhFe0sBUpFqY5QxJQItUD/fsZbvJjXp0KKn1GscbZkmHzzljsw7SsJ8CEUYlvj
	AM5HR3paGHHAfbpUUdTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuux-0000000G3F7-3tS1;
	Fri, 27 Nov 2026 12:19:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuud-0000000G2wH-0goZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:18:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso7233274f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781925; x=1796386725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKw4sWprE2Ul+TtVWYzdYET0k07qC46nb2OuMsfTntI=;
        b=G1zVlhQZ9u2h9FDlDooC5JPWelm9jHGO266c3cfCt51QRPO9V5z5C6O5bgRtGk8k+m
         qTin1asAOb/n1I3cTaWHftqytgU/jp+gXbdEoVev9dxAHVjstWCxOiQslobJ7IVSDgK7
         /TqIw6znTQn3Jw4U8Vfexi/Y+hYJU/wUh/2Uf9hibNgCbxNKpMX843svjrkaHCfzQ6xe
         DqxXa/KX4Zj5H5mxYMuOtoXqip4cD8e964KYizPEk4cKH9Xp+u2CuOIdRGQ05eYHIhH/
         2kpfWjQlAev3f0CS3YbT+5iTV/0225JpV5q+5sQq0ws82f8bhDqdBo4GuPMDMIs3SJLq
         BEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781925; x=1796386725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKw4sWprE2Ul+TtVWYzdYET0k07qC46nb2OuMsfTntI=;
        b=njg7Ll5z/YqkdiWRZWff6OPDqVTbp/WPrLIt31ZkOPojcdWjjMFY8q4cuN5Pbf/R9A
         PFmxAlH/YQv9TbTnYhmSq+1/rNcF1UR6YDCwJ7Ri6D/L1UZ3DC0EOkEyImeef2LKzOKT
         6+11AuY+dnldppX0Q2pckcidzqMPD+0u9M9T8dsSMp4mL+35cv+cfqfAPQshusudPMfz
         B/YVaVlsWNFiHHcbKc3NDUcglUXLrotQS3AwMZaEqDM8LFP4YM8sXYC4mrh/lx8Yfop6
         iJIZbY8FyWd16v3JxQ2Ld5iKETTo4pEIsK5rnbJ+cLb2JTlyUsPNtwoNPQbfMjvw0Dgk
         GVBQ==
X-Forwarded-Encrypted: i=1; AL+hErGwEL6xqtWn4r31P7UiPZadG7WsbknrcWi+AgDUEav46EFbda5iVOLg2lwCufD3D54gaDmofJPU4XZDOmkpYX6+@lists.infradead.org
X-Gm-Message-State: APuU4Z8YYRzav18GXkI+pMCt42wyv4dwQVqu4HQxW1Ua5YqF4ua+zr8I
	Dhh1eNywjSAn2B2yOzt88XvqIOLU438ebi1ksqcjH2Z0Fk4NYTN0VaP+LgxxTj6iI8Y=
X-Gm-Gg: AZFdTZfrtpI0yEZ5gJwopG3uD/lP1zW/WilhehggBvax+G8esUJ5QETNQKa7tBQmHdt
	nJ3UUaM8mt1XWyyO7vtcZPI3JLQAgwXRgs84XmQAq2GDCzChLmz/z1yhgsEe+lZd964KYNVEJ12
	4RlPNW92eSNprBz5nXd3JXC6Q/LGrCyJYRiWBUkkNkqQpyGBiNXe6qxXK1bNnlWokZRnSIiTNsq
	ZHy+DJhVp0wye7XN7vqfOBMOn9uxmmJ77T/sy8gRNlU9QcCXbsANMHt17Ay73Q0SdstLJdS0fxe
	mgNHaixA4y1DJiM+sc+7OdwM1q1jUaOzjQI9p5t+BWSZyyiqu0ElhBMC11qNTzYCuxrJ/KCSaTz
	bBNr9bgJFW/4SJY8WmlA7RYfrUswr0LGeDNKfDWa+DDUEO3QBQL8ZZKEFiKpGA4xLVgAelt5TGB
	wShkK+gzsUaJNYxfwNkQZHjmQHGTSJ+aBnEiWAWJAWV71sPySAP90H0KutLwezdkAw2nTcMzCHi
	YSr6P6t1N1Kb/YUOD4QLQTAANLca1LnMimqCBb7HxAC8UbDLk6XpFJ8vRyi9RYOqNSzX8ZkXXTw
	5H6TrA5PquU3ZP8PmwObDEzKiFsv
X-Received: by 2002:a05:600c:1911:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb8880cf84mr498430495e9.16.1795781925146;
        Fri, 27 Nov 2026 04:18:45 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm673667305e9.5.2026.11.27.04.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:44 -0800 (PST)
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
Subject: [PATCH v4 03/28] dmaengine: bcm2835: Add support for per-channel flags
Date: Fri, 27 Nov 2026 13:21:53 +0100
Message-ID: <20261127122236.4976-4-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041847_246054_DEE8C0F4 
X-CRM114-Status: GOOD (  20.85  )
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

From: Phil Elwell <phil@raspberrypi.org>

Add the ability to interpret the high bits of the dreq specifier as
flags to be included in the DMA_CS register: the AXI priority and panic
priority (used e.g. by the HDMI audio channels to keep the MAI FIFO fed),
the wait for outstanding writes before signalling completion and the
DISDEBUG flag. The original motivation for this change was the ability
to set the DISDEBUG flag for SD card transfers to avoid corruption when
using the VPU debugger.

The flags occupy the same bits as the corresponding fields of the CS
register, so they only need to be masked.

Since the flags now affect every transfer issued on the channel, clear
the dreq when the channel is released, so that a later user requesting
the channel by capability (e.g. for memcpy) does not inherit the flags
of the previous DT client.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 036a7a1727a5..5a9854a3c08e 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -33,6 +33,8 @@
 #include <linux/of.h>
 #include <linux/of_dma.h>
 
+#include <dt-bindings/dma/brcm,bcm2835-dma.h>
+
 #include "virt-dma.h"
 
 #define BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED 14
@@ -143,6 +145,15 @@ struct bcm2835_desc {
 #define BCM2835_DMA_WAIT(x)	FIELD_PREP(GENMASK(25, 21), x) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
 
+/*
+ * Flags of the DMA specifier to be set in the CS register, they have the
+ * same layout as the corresponding CS register fields.
+ */
+#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_FLAG_PRIORITY(15) | \
+				      BCM2835_DMA_FLAG_PANIC_PRIORITY(15) | \
+				      BCM2835_DMA_FLAG_WAIT_FOR_WRITES | \
+				      BCM2835_DMA_FLAG_DIS_DEBUG))
+
 /* debug register bits */
 #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
 #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
@@ -435,7 +446,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 	c->desc = to_bcm2835_dma_desc(&vd->tx);
 
 	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
-	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
+	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
+	       c->chan_base + BCM2835_DMA_CS);
 }
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
@@ -462,7 +474,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	 * if this IRQ handler is threaded.) If the channel is finished, it
 	 * will remain idle despite the ACTIVE flag being set.
 	 */
-	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
+	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
+	       BCM2835_DMA_CS_FLAGS(c->dreq),
 	       c->chan_base + BCM2835_DMA_CS);
 
 	d = c->desc;
@@ -512,6 +525,9 @@ static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 	free_irq(c->irq_number, c);
 	dma_pool_destroy(c->cb_pool);
 
+	/* do not leak the flags of a DT client to the next user */
+	c->dreq = 0;
+
 	dev_dbg(c->vc.chan.device->dev, "Freeing DMA channel %u\n", c->ch);
 }
 
-- 
2.51.0


