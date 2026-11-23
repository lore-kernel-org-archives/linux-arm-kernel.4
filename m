Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5A2606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dHTbUUAf;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fwrJVb+w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qYJrCDr9SjUNFo3GVLbkakmo30+eU1116o2xHWLjUDo=; b=dHTbUUAfkdU0Qg
	o7iZDzURWlhJgNrWHap/6L0b721IZl7N159CSnVAgIbAaAZl9+H8fC0eoo71/TrZe8juwPwVpEAeb
	EI8dG+zEVjHaMoJiA3gD6N40z+nVyIJaWshqSdktfGuODg+1yoBVy8ZI0WjWyFbLzC90ThWa4QopF
	iAq2eLjnnF+eIpxacylr04lVOoHZx7/W8B7N16jKs/Hrjk4Vy7rI2jsDlLpu7frz3sOK+bbOQJeCr
	zptDUqhomCUE60FutAITIQtbIK4/Hae2PjA1bvbSR73RxxCineMhP/ALM9wJfiRPF/clN5gajOl/H
	3ntn1YQ0d6e68kzJmsYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVSo-00000003psU-3YDZ;
	Mon, 23 Nov 2026 14:56:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQi-00000003ogB-3hZK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:54:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-49465892f7bso2474705f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445643; x=1796050443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYJrCDr9SjUNFo3GVLbkakmo30+eU1116o2xHWLjUDo=;
        b=fwrJVb+wENqzUC71GidV90lXah7AzPw+Zy+zXJ39xdBzpvynV64ewlVVRKUFzRvPoM
         28n5pwNOXRkCU/v/yx6iRgs/75bKJwuv9u7oyRpi8BKnaTW9JbpdPHiUhkDLl4RKeVzq
         EAl0VzjURi5J6nZeFGtLLXdobY7pd8DDByP97Cnc3z9MVUKIuNmRf5vq1uizBrHFGYod
         IlUT2PIPnYpWi/4VAi4rC5HJITa8fmyS60xODoPURngiSJDyf9r0ovLO9cmC64mWd5J6
         B+VRjOMru63P3ftyiO9GQqwaScTtPcWwAECnnAUlh4Z5g7Y29Ml998IGBKkOxwg40yHH
         RyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445643; x=1796050443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYJrCDr9SjUNFo3GVLbkakmo30+eU1116o2xHWLjUDo=;
        b=kHqOkKWOwLLkO9A0qM7I3zBCQMJmsFdDhEvLNB8+zG7Hmcnf9aoqf/zKfKf0pPHiR8
         dyYvE7sqKxAIPMgIA2+1jUMkWfUxrG7DxcZj5Dt/Dcdseq+RkgHLmfa98srDt0cz7TjT
         nifv7krP2cCaPVbBy+TxYviKkLlFVYfIyaMJbY46z293QSICj5BoPiersQoU7FqhP5tV
         rX75bAZdH/tKjWlPE7KRYBcuJHFESd/CENoW8eakBgmLXCvW0t9ZlD+wiXhA1g+9l2IA
         ynIoRk2+IGXgx7wj1yGzuS9rj4REUadxbKZmzPX4mDiCiVwVvO3Nm7PKaj24guTgogYR
         CfCQ==
X-Forwarded-Encrypted: i=1; AL+hErFe9x3I4VSZTI8pKyoHiKn7c/2aHkkaXrIahzec06tTl6AomlKN19HDWoCXNvNcxeEgqN3HTVDOrKDj4saA76+B@lists.infradead.org
X-Gm-Message-State: APuU4Z/5cOYkDJTS5e06eZVtRHpleC/ytQCNrnYNlzD1NHJNGLrp/T6u
	NVrb2IrE4bLkxdAYG+PgqkmT1g2qwWSxRTjiJQiuYm5gl+bN5McMjVpTU2P0DEelwvc=
X-Gm-Gg: AZFdTZdTgziD75F5M1dcJo6sVJ/1/wNehw8JBIyPrZ49upv7i0IYyffKDS8TObcIyjf
	jRKtkO9RqpqmWhZMOYrjteLNHXvZ5W9yYhfEyof2HC3HAAE5+wvMk++rVeXky7b5eiShwM6Djy8
	BvY0D1DT5MLyj13XGo8oRjEaPNlqiY3M98kpVroIm3bckVm35sSV8+wLjzw0S+p5vh2qZkOouDp
	nnwKpw3iPZiHtdehl1+3P23Fkkjpo3yPfCuHSpqZRmi0jAPSiDh1xtRaQTWcTW4TwEbxN+bSc/1
	iggH3zkyeVZO5A+xuuBLG4wgPm5tIkoW2q77IKYGKds/9/jEYqDjR63p84/b34hS7TIH2LdM5Ld
	0dKTydAIN7vBqMPvzBIa5+zFHCSNgK64WTXqfcNDy9cNqpLWviqyGIOVWuHn22m2d9KkXyxFUce
	LH00kbn46wIT2qCLV5nhcVINcOO/4kDpb2iD0ZkpwkKdfRXqSntmkGKVJFwKXs46tlGWud5ukk4
	YSqRWnIrEKbr/uRFKnXPnmEF6DTEUo2RjYLpZb/2zvmJ0rm4V1mQTvp8izUp9fqPgdKv24hpl8F
	H9rw444Ki5bSvIeEcs3cSAM9fWg=
X-Received: by 2002:a05:6000:46cf:b0:4a8:98fe:5f9a with SMTP id ffacd0b85a97d-4abb1d93a03mr13084710f8f.18.1795445643105;
        Mon, 23 Nov 2026 06:54:03 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm23614442f8f.31.2026.11.23.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:02 -0800 (PST)
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
Subject: [PATCH v3 22/28] dmaengine: bcm2835: Add BCM2711 40-bit DMA support
Date: Mon, 23 Nov 2026 15:57:00 +0100
Message-ID: <20261123145728.29082-23-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065405_068963_49F248E2 
X-CRM114-Status: GOOD (  27.22  )
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

BCM2711 has 4 DMA channels with a 40-bit address range, allowing them
to access the full memory of a Pi 4. They are part of the same DMA
block as the legacy channels, but have a different register layout and
control block format, and are described by a separate DT node.

The memory side addresses are programmed as-is, while slave addresses
are translated by dma_map_resource() using the dma-ranges of the
controller, which map the peripherals into the upper part of the 40-bit
address space. This translation cannot be derived from the ranges of
the parent bus, so there is no fallback for device trees not describing
it: the 40-bit channels are only described by device trees which come
with the proper dma-ranges, i.e. the downstream ones and the one added
by this series. Since the peripherals are only reachable there,
refuse to probe the 40-bit channels if dma_addr_t is only 32-bit wide.

The DMA mask describes the 40-bit capability of the channels, the
reachable range being limited by the dma-ranges of their bus. The control
blocks are however addressed through 32-bit registers holding bits 36:5
of their address, so limit the coherent DMA mask, used for their
allocation, to 37 bits.

Unlike the legacy channels, the 40-bit ones are stopped by pausing them,
waiting for the outstanding AXI transactions and resetting them through
the DEBUG register.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 343 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 331 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 0ea903274286..a98ea67d3406 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -17,6 +17,7 @@
  *	MARVELL MMP Peripheral DMA Driver
  *	Copyright 2012 Marvell International Ltd.
  */
+#include <linux/bitfield.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
@@ -72,6 +73,17 @@ struct bcm2835_dma_cb {
 	u32 pad[2];
 };
 
+struct bcm2711_dma40_scb {
+	u32 ti;
+	u32 src;
+	u32 srci;
+	u32 dst;
+	u32 dsti;
+	u32 len;
+	u32 next_cb;
+	u32 rsvd;
+};
+
 struct bcm2835_cb_entry {
 	struct bcm_dma_cb *cb;
 	dma_addr_t paddr;
@@ -114,6 +126,7 @@ struct bcm2835_chan {
  * @cb_reg: offset of the control block address register
  * @int_mask: interrupt status bit in the CS register
  * @active_mask: channel active bit in the CS register
+ * @dma_mask: addressing capability of the channels
  * @cb_get_length: get the transfer length of a control block
  * @cb_get_addr: get the memory side address of a control block
  * @cb_init: initialize a control block
@@ -128,7 +141,8 @@ struct bcm2835_chan {
  * @cs_flags: per-channel flags for the CS register
  * @abort: stop and reset a channel
  * @legacy_bus_addr: translate a slave address for device trees which do not
- *	describe the peripheral window in dma-ranges
+ *	describe the peripheral window in dma-ranges, NULL if they cannot be
+ *	supported
  * @chan_mask: channels of the DMA block using this programming model
  */
 struct bcm2835_dma_cfg {
@@ -138,6 +152,8 @@ struct bcm2835_dma_cfg {
 	u32 int_mask;
 	u32 active_mask;
 
+	u64 dma_mask;
+
 	u32 (*cb_get_length)(void *data);
 	dma_addr_t (*cb_get_addr)(void *data, enum dma_transfer_direction);
 
@@ -283,6 +299,67 @@ struct bcm2835_desc {
 #define MAX_DMA_LEN SZ_1G
 #define MAX_LITE_DMA_LEN (SZ_64K - 4)
 
+/* 40-bit DMA channel registers */
+#define BCM2711_DMA40_CS		0x00
+#define BCM2711_DMA40_CB		0x04
+#define BCM2711_DMA40_DEBUG		0x0c
+#define BCM2711_DMA40_TI		0x10
+#define BCM2711_DMA40_SRC		0x14
+#define BCM2711_DMA40_SRCI		0x18
+#define BCM2711_DMA40_DEST		0x1c
+#define BCM2711_DMA40_DESTI		0x20
+#define BCM2711_DMA40_LEN		0x24
+#define BCM2711_DMA40_NEXT_CB		0x28
+#define BCM2711_DMA40_DEBUG2		0x2c
+
+/* 40-bit DMA CS Control and Status bits */
+#define BCM2711_DMA40_ACTIVE		BIT(0)
+#define BCM2711_DMA40_END		BIT(1)
+#define BCM2711_DMA40_INT		BIT(2)
+#define BCM2711_DMA40_DREQ		BIT(3)  /* DREQ state */
+#define BCM2711_DMA40_RD_PAUSED		BIT(4)  /* Reading is paused */
+#define BCM2711_DMA40_WR_PAUSED		BIT(5)  /* Writing is paused */
+#define BCM2711_DMA40_DREQ_PAUSED	BIT(6)  /* Is paused by DREQ flow control */
+#define BCM2711_DMA40_WAITING_FOR_WRITES BIT(7) /* Waiting for last write */
+#define BCM2711_DMA40_PROT		GENMASK(9, 8) /* AXI protection, supervisor mode */
+#define BCM2711_DMA40_ERR		BIT(10)
+#define BCM2711_DMA40_QOS(x)		FIELD_PREP(GENMASK(19, 16), x)
+#define BCM2711_DMA40_PANIC_QOS(x)	FIELD_PREP(GENMASK(23, 20), x)
+#define BCM2711_DMA40_TRANSACTIONS	BIT(25) /* AXI transactions outstanding */
+#define BCM2711_DMA40_WAIT_FOR_WRITES	BIT(28)
+#define BCM2711_DMA40_DISDEBUG		BIT(29)
+#define BCM2711_DMA40_ABORT		BIT(30)
+#define BCM2711_DMA40_HALT		BIT(31)
+#define BCM2711_DMA40_CS_FLAGS(x) ((x) & (BCM2711_DMA40_QOS(15) | \
+					  BCM2711_DMA40_PANIC_QOS(15) | \
+					  BCM2711_DMA40_WAIT_FOR_WRITES | \
+					  BCM2711_DMA40_DISDEBUG))
+
+/* 40-bit DMA transfer information bits */
+#define BCM2711_DMA40_INTEN		BIT(0)
+#define BCM2711_DMA40_TDMODE		BIT(1) /* 2D-Mode */
+#define BCM2711_DMA40_WAIT_RESP		BIT(2) /* wait for AXI write to be acked */
+#define BCM2711_DMA40_WAIT_RD_RESP	BIT(3) /* wait for AXI read to complete */
+#define BCM2711_DMA40_PER_MAP(x)	FIELD_PREP(GENMASK(13, 9), x) /* REQ source */
+#define BCM2711_DMA40_S_DREQ		BIT(14) /* enable SREQ for source */
+#define BCM2711_DMA40_D_DREQ		BIT(15) /* enable DREQ for destination */
+#define BCM2711_DMA40_S_WAIT(x)		FIELD_PREP(GENMASK(23, 16), x) /* read-wait cycles */
+#define BCM2711_DMA40_D_WAIT(x)		FIELD_PREP(GENMASK(31, 24), x) /* write-wait cycles */
+
+/* 40-bit DMA source and destination information bits */
+#define BCM2711_DMA40_ADDR_HI		GENMASK(7, 0) /* bits 39:32 of the address */
+#define BCM2711_DMA40_BURST_LEN(x)	FIELD_PREP(GENMASK(11, 8), x)
+#define BCM2711_DMA40_INC		BIT(12)
+#define BCM2711_DMA40_SIZE_32		FIELD_PREP(GENMASK(14, 13), 0)
+#define BCM2711_DMA40_SIZE_64		FIELD_PREP(GENMASK(14, 13), 1)
+#define BCM2711_DMA40_SIZE_128		FIELD_PREP(GENMASK(14, 13), 2)
+#define BCM2711_DMA40_SIZE_256		FIELD_PREP(GENMASK(14, 13), 3)
+#define BCM2711_DMA40_IGNORE		BIT(15)
+#define BCM2711_DMA40_STRIDE(x)		FIELD_PREP(GENMASK(31, 16), x) /* For 2D mode */
+
+/* 40-bit DMA debug register bits */
+#define BCM2711_DMA40_DEBUG_RESET	BIT(23)
+
 static inline size_t bcm2835_dma_max_frame_length(struct bcm2835_chan *c)
 {
 	/* lite and normal channels have different max frame length */
@@ -487,6 +564,199 @@ static u32 bcm2835_dma_cs_flags(struct bcm2835_chan *c)
 	return BCM2835_DMA_CS_FLAGS(c->dreq);
 }
 
+static inline u32 to_bcm2711_ti(u32 info)
+{
+	return ((info & BCM2835_DMA_INT_EN) ? BCM2711_DMA40_INTEN : 0) |
+		((info & BCM2835_DMA_WAIT_RESP) ? BCM2711_DMA40_WAIT_RESP : 0) |
+		((info & BCM2835_DMA_S_DREQ) ?
+		 (BCM2711_DMA40_S_DREQ | BCM2711_DMA40_WAIT_RD_RESP) : 0) |
+		((info & BCM2835_DMA_D_DREQ) ? BCM2711_DMA40_D_DREQ : 0) |
+		BCM2711_DMA40_PER_MAP((info >> 16) & 0x1f);
+}
+
+static inline u32 to_bcm2711_srci(u32 info)
+{
+	return ((info & BCM2835_DMA_S_INC) ? BCM2711_DMA40_INC : 0) |
+	       ((info & BCM2835_DMA_S_WIDTH) ? BCM2711_DMA40_SIZE_128 : 0) |
+	       BCM2711_DMA40_BURST_LEN(BCM2835_DMA_GET_BURST_LENGTH(info));
+}
+
+static inline u32 to_bcm2711_dsti(u32 info)
+{
+	return ((info & BCM2835_DMA_D_INC) ? BCM2711_DMA40_INC : 0) |
+	       ((info & BCM2835_DMA_D_WIDTH) ? BCM2711_DMA40_SIZE_128 : 0) |
+	       BCM2711_DMA40_BURST_LEN(BCM2835_DMA_GET_BURST_LENGTH(info));
+}
+
+static inline dma_addr_t bcm2711_dma40_addr(u32 lo, u32 info)
+{
+	return (dma_addr_t)(((u64)FIELD_GET(BCM2711_DMA40_ADDR_HI, info) << 32) | lo);
+}
+
+static inline u32 bcm2711_dma40_info_addr(u32 info, dma_addr_t addr)
+{
+	return (info & ~BCM2711_DMA40_ADDR_HI) |
+	       FIELD_PREP(BCM2711_DMA40_ADDR_HI, upper_32_bits(addr));
+}
+
+static u32 bcm2711_dma_prepare_cb_extra(struct bcm2835_chan *c,
+					enum dma_transfer_direction direction,
+					bool cyclic, bool final,
+					unsigned long flags)
+{
+	u32 result = 0;
+
+	if (cyclic) {
+		if (flags & DMA_PREP_INTERRUPT)
+			result |= BCM2711_DMA40_INTEN;
+	} else {
+		if (!final)
+			return 0;
+
+		result |= BCM2711_DMA40_INTEN;
+
+		if (direction == DMA_MEM_TO_MEM)
+			result |= BCM2711_DMA40_WAIT_RESP;
+	}
+
+	return result;
+}
+
+static inline u32 bcm2711_dma_cb_get_length(void *data)
+{
+	struct bcm2711_dma40_scb *scb = data;
+
+	return scb->len;
+}
+
+static inline dma_addr_t
+bcm2711_dma_cb_get_addr(void *data, enum dma_transfer_direction direction)
+{
+	struct bcm2711_dma40_scb *scb = data;
+
+	if (direction == DMA_DEV_TO_MEM)
+		return bcm2711_dma40_addr(scb->dst, scb->dsti);
+
+	return bcm2711_dma40_addr(scb->src, scb->srci);
+}
+
+static inline void
+bcm2711_dma_cb_init(void *data, struct bcm2835_chan *c,
+		    enum dma_transfer_direction direction, dma_addr_t src,
+		    dma_addr_t dst, bool zero_page)
+{
+	struct bcm2711_dma40_scb *scb = data;
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction, zero_page);
+
+	scb->ti = to_bcm2711_ti(info);
+	scb->src = lower_32_bits(src);
+	scb->srci = bcm2711_dma40_info_addr(to_bcm2711_srci(info), src);
+	scb->dst = lower_32_bits(dst);
+	scb->dsti = bcm2711_dma40_info_addr(to_bcm2711_dsti(info), dst);
+	scb->len = 0;
+	scb->next_cb = 0;
+	scb->rsvd = 0;
+}
+
+static inline void
+bcm2711_dma_cb_set_src(void *data, enum dma_transfer_direction direction,
+		       dma_addr_t src)
+{
+	struct bcm2711_dma40_scb *scb = data;
+
+	scb->src = lower_32_bits(src);
+	scb->srci = bcm2711_dma40_info_addr(scb->srci, src);
+}
+
+static inline void
+bcm2711_dma_cb_set_dst(void *data, enum dma_transfer_direction direction,
+		       dma_addr_t dst)
+{
+	struct bcm2711_dma40_scb *scb = data;
+
+	scb->dst = lower_32_bits(dst);
+	scb->dsti = bcm2711_dma40_info_addr(scb->dsti, dst);
+}
+
+static inline void bcm2711_dma_cb_set_next(void *data, u32 next)
+{
+	struct bcm2711_dma40_scb *scb = data;
+
+	scb->next_cb = next;
+}
+
+static inline void bcm2711_dma_cb_set_length(void *data, u32 length)
+{
+	struct bcm2711_dma40_scb *scb = data;
+
+	scb->len = length;
+}
+
+static inline void
+bcm2711_dma_cb_append_extra(void *data, struct bcm2835_chan *c,
+			    enum dma_transfer_direction direction,
+			    bool cyclic, bool final, unsigned long flags)
+{
+	struct bcm2711_dma40_scb *scb = data;
+
+	scb->ti |= bcm2711_dma_prepare_cb_extra(c, direction, cyclic, final,
+						flags);
+}
+
+/* control blocks are 32 byte aligned, the register holds bits 36:5 */
+static inline u32 bcm2711_dma_to_cb_addr(dma_addr_t addr)
+{
+	WARN_ON_ONCE(addr & 0x1f);
+
+	return (u64)addr >> 5;
+}
+
+static dma_addr_t bcm2711_dma_read_addr(struct bcm2835_chan *c,
+					enum dma_transfer_direction direction)
+{
+	if (direction == DMA_MEM_TO_DEV)
+		return bcm2711_dma40_addr(readl(c->chan_base + BCM2711_DMA40_SRC),
+					  readl(c->chan_base + BCM2711_DMA40_SRCI));
+	else if (direction == DMA_DEV_TO_MEM)
+		return bcm2711_dma40_addr(readl(c->chan_base + BCM2711_DMA40_DEST),
+					  readl(c->chan_base + BCM2711_DMA40_DESTI));
+
+	return 0;
+}
+
+static u32 bcm2711_dma_cs_flags(struct bcm2835_chan *c)
+{
+	return BCM2711_DMA40_CS_FLAGS(c->dreq) | BCM2711_DMA40_PROT;
+}
+
+static void bcm2711_dma_abort_chan(struct bcm2835_chan *c)
+{
+	void __iomem *chan_base = c->chan_base;
+	long timeout = 100;
+
+	/* Pause the current DMA */
+	writel(readl(chan_base + BCM2711_DMA40_CS) & ~BCM2711_DMA40_ACTIVE,
+	       chan_base + BCM2711_DMA40_CS);
+
+	/* wait for outstanding transactions to complete */
+	while ((readl(chan_base + BCM2711_DMA40_CS) & BCM2711_DMA40_TRANSACTIONS) &&
+	       --timeout)
+		cpu_relax();
+
+	/* Peripheral might be stuck and fail to complete */
+	if (!timeout)
+		dev_err(c->vc.chan.device->dev,
+			"failed to complete pause on dma %d (CS:%08x)\n", c->ch,
+			readl(chan_base + BCM2711_DMA40_CS));
+
+	/* Set CS back to default state */
+	writel(BCM2711_DMA40_PROT, chan_base + BCM2711_DMA40_CS);
+
+	/* Reset the DMA */
+	writel(readl(chan_base + BCM2711_DMA40_DEBUG) | BCM2711_DMA40_DEBUG_RESET,
+	       chan_base + BCM2711_DMA40_DEBUG);
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -1199,7 +1469,8 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 	c->irq_number = irq;
 	c->irq_flags = irq_flags;
 
-	d->cfg->chan_plat_init(c);
+	if (d->cfg->chan_plat_init)
+		d->cfg->chan_plat_init(c);
 
 	return 0;
 }
@@ -1225,6 +1496,8 @@ static const struct bcm2835_dma_cfg bcm2835_data = {
 	.int_mask = BCM2835_DMA_INT,
 	.active_mask = BCM2835_DMA_ACTIVE,
 
+	.dma_mask = DMA_BIT_MASK(32),
+
 	.cb_get_length = bcm2835_dma_cb_get_length,
 	.cb_get_addr = bcm2835_dma_cb_get_addr,
 	.cb_init = bcm2835_dma_cb_init,
@@ -1245,7 +1518,35 @@ static const struct bcm2835_dma_cfg bcm2835_data = {
 	.chan_mask = GENMASK(BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED, 0),
 };
 
+static const struct bcm2835_dma_cfg bcm2711_data = {
+	.cs_reg = BCM2711_DMA40_CS,
+	.cb_reg = BCM2711_DMA40_CB,
+
+	.int_mask = BCM2711_DMA40_INT,
+	.active_mask = BCM2711_DMA40_ACTIVE,
+
+	.dma_mask = DMA_BIT_MASK(40),
+
+	.cb_get_length = bcm2711_dma_cb_get_length,
+	.cb_get_addr = bcm2711_dma_cb_get_addr,
+	.cb_init = bcm2711_dma_cb_init,
+	.cb_set_src = bcm2711_dma_cb_set_src,
+	.cb_set_dst = bcm2711_dma_cb_set_dst,
+	.cb_set_next = bcm2711_dma_cb_set_next,
+	.cb_set_length = bcm2711_dma_cb_set_length,
+	.cb_append_extra = bcm2711_dma_cb_append_extra,
+
+	.to_cb_addr = bcm2711_dma_to_cb_addr,
+
+	.read_addr = bcm2711_dma_read_addr,
+	.cs_flags = bcm2711_dma_cs_flags,
+	.abort = bcm2711_dma_abort_chan,
+
+	.chan_mask = GENMASK(14, 11),
+};
+
 static const struct of_device_id bcm2835_dma_of_match[] = {
+	{ .compatible = "brcm,bcm2711-dma", .data = &bcm2711_data },
 	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_data },
 	{},
 };
@@ -1343,15 +1644,6 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
 	int chan_count, chan_start, chan_end;
 
-	if (!pdev->dev.dma_mask)
-		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
-
-	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
-	if (rc) {
-		dev_err(&pdev->dev, "Unable to set DMA mask\n");
-		return rc;
-	}
-
 	od = devm_kzalloc(&pdev->dev, sizeof(*od), GFP_KERNEL);
 	if (!od)
 		return -ENOMEM;
@@ -1361,6 +1653,28 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, -EINVAL,
 				     "Failed to match compatible string\n");
 
+	/* the peripherals are only reachable above 4 GiB by 40-bit channels */
+	if (!IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) &&
+	    od->cfg->dma_mask > DMA_BIT_MASK(32))
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "40-bit DMA channels need a 64-bit dma_addr_t\n");
+
+	if (!pdev->dev.dma_mask)
+		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
+
+	/*
+	 * The control blocks are addressed through 32-bit registers holding
+	 * at most bits 36:5 of their address.
+	 */
+	rc = dma_set_mask(&pdev->dev, od->cfg->dma_mask);
+	if (!rc)
+		rc = dma_set_coherent_mask(&pdev->dev,
+					   min(od->cfg->dma_mask, DMA_BIT_MASK(37)));
+	if (rc) {
+		dev_err(&pdev->dev, "Unable to set DMA mask\n");
+		return rc;
+	}
+
 	dma_set_max_seg_size(&pdev->dev, 0x3FFFFFFF);
 
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
@@ -1383,9 +1697,14 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 
 	od->map_resource = bcm2835_dma_mmio_in_dma_ranges(&pdev->dev,
 							  res->start);
-	if (!od->map_resource)
+	if (!od->map_resource) {
+		if (!od->cfg->legacy_bus_addr)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "peripheral window missing in dma-ranges\n");
+
 		dev_info(&pdev->dev,
 			 "peripheral window missing in dma-ranges, please update DT blob\n");
+	}
 
 	dma_cap_set(DMA_SLAVE, od->ddev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, od->ddev.cap_mask);
-- 
2.51.0


