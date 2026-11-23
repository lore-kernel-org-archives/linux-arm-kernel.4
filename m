Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472C2606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x9L0JGr/;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Z2eEVutf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GqH39ciBHiVFxAX6NEOYNJ4PuF/NMeDq3R9etuJCU9E=; b=x9L0JGr/NNA0I5
	wcNP+uRbrXqWpYFL/lPeawmtlfdepe8V2ZTuDnurEvHnMXgoRwYLhrTmjYUIzY8OUp2Bdu07ZdyGY
	xL0ZcHMuj2K9CybqSSxQWxbFxoS97bpWkPtWjzVksE4acbnlVXY77YrIQQqoX6XhZikZr6/jm/g0P
	q8ruoHMHPeCKkqXkDrcdqTFKv6EzVbzkOIFsrI8LeYUx17XlkSri3XgndUDRPdEGcyU7IoCL1WET1
	hZ7IENUoru52FEXbzeYcpPvAnZbt/21SSNMt2sf03VfiX19k+b21t9HwjHYFCLTTCRAZnaEr1Zc4v
	bAPKVIN5+2Fi3aRqBxaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQR-00000003oST-1rOu;
	Mon, 23 Nov 2026 14:53:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQG-00000003oIa-0jWl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so26690705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445614; x=1796050414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqH39ciBHiVFxAX6NEOYNJ4PuF/NMeDq3R9etuJCU9E=;
        b=Z2eEVutfRvdZOCBMGBqxX02t26J0gG8RjkhyHzsLfd2gKCYQdlTujJFpYI0h7djMH8
         ut2Y6l41ODfOOBWo83ByONb6Rg1YZcLco+ZeO+CFtGDkmEbSgmWnGf1poZi4hDh4Z6cv
         hykgZ1dwVc0RC6p0GzIKZI7auOQsitV2urRvTKEyelREL4izOzbASnKX6XsZWDco4woP
         BGpPXgK69wpf6WFarnpMSSpW9JtTvWr+TlH60/ypw94hdjCTeygAQFBlOn0vx7Dpewe1
         V38waF1ZHQ62hmoHXzvVPXz6ln16gqonvDQj6r2vWnxpQC+YRPtj1LfYq9mnv85lc1nv
         JmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445614; x=1796050414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqH39ciBHiVFxAX6NEOYNJ4PuF/NMeDq3R9etuJCU9E=;
        b=FRAoyYIrya0nqfFrpTddDQ2LltIp4GwsCRYSKJeg5a61CER4a45Y18y8nStb1WD9J/
         i45+K7akIzhZGbFqoVF/NDOT/D4V/mmpZBRugjD70cK2IHJ4V4z7L5j/7Mpf0fgMlQ74
         vDE9+bx/Q2dcfIWZZN6w66I//hqVHuOHk0EfcFqQ5GpYu9b0AqEaki71D6TG9ADv9/A5
         lNKHZCx+K3j7A00bR3KEkqrt6k0jTQROF41i9PBtD/XDLfbW8l8hY2KUbRP6fID6xAk7
         BFP9xMoxAdhuz59zKbHZKYJc8ig38JxI1/ySGRnfvTUgEzUH/u+fIIqe0UKFIPfJwA9G
         tmYA==
X-Forwarded-Encrypted: i=1; AL+hErFA+7CmCHfqUW11qcZvFBEbItyg7+w+1UTq/G85B+CkZc9jxEPe6YaSKcMHCbv5E8QqeG7RO3ThZ7PfTLsAgI4K@lists.infradead.org
X-Gm-Message-State: APuU4Z+5HPMwdvAGGlNqPoB9a5tNb3XJV/OrxY1VzfFIZAueL871TCjg
	z6h2rIFvpTgNR07rV3czPKAufW79l7SOSo+BH3+6AGoj1BbSa93vkUdAOiezpIcnMtQ=
X-Gm-Gg: AZFdTZeIQzO+7I8dY1YBf/acGPaXdCSp8+m9KkNvW9X61HB/BzHlNPIgy7BpoW/rkiS
	T4tk6A7uHS6fvT/00QYy9l3UbiAFsTHWihR/k0f2U4wZf4CqUhQ2YNM/sz2MGvIa4x2VVY8WU2C
	8evrsHPH0jP9Y3KKJXL5XHEw2UjNPyH69bIFeAFQ6zEKdMnnjGBF1M5QEMuw103YZ9Pk7AKNGmY
	Dv672Yur+nu7efhUuI358tbG2RkuMbkOGtp8DBYtZH7mDGFIHjUAdGDzG0wDWn5Gj/6M2nA4T5l
	Y9qTgnJic62Fk/nfn+XfET0xEVWtJV08gLF2hZVNZdPitqAk/IMjfMMJW9tiG8MkLKBTXLCFsuh
	UgncLpiGhBRPgCjDNHyAZTrU0mG2xVA4G/ore1SNMzzBincgpR2POwWNDbOmptMEfy7F3XFVjPM
	Cxzd8Lsouzl/xtHg2DODv96vo4wj/OSPOIEHYiWVlMcbs3xTaB3wPWenNGlHkjLw57BxykeqO9G
	ZI808vp5J0jgMSBOisNvu90LkmJNtNW20BHDZnv7oYRtQ7iCoaMFzsSR0pl7WUSck5OEfTUMOAC
	Jqa4O4csTd7zU4OYDSEFsYV8OIM=
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr240714045e9.22.1795445614229;
        Mon, 23 Nov 2026 06:53:34 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm421402265e9.11.2026.11.23.06.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:33 -0800 (PST)
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
Subject: [PATCH v3 01/28] dmaengine: bcm2835: Fix coding style issues and a typo
Date: Mon, 23 Nov 2026 15:56:39 +0100
Message-ID: <20261123145728.29082-2-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065336_290324_0A7CA36B 
X-CRM114-Status: GOOD (  24.01  )
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

Fix the coding style issues reported by checkpatch: use u32 instead of
uint32_t, add the missing parentheses around macro arguments, which
could lead to operator precedence issues, drop superfluous parentheses
and long int, and align the function arguments. Also fix a typo in a
comment ('missmatch').

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 83 ++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 06d830d36882..b19182c6e3df 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -51,13 +51,13 @@ struct bcm2835_dmadev {
 };
 
 struct bcm2835_dma_cb {
-	uint32_t info;
-	uint32_t src;
-	uint32_t dst;
-	uint32_t length;
-	uint32_t stride;
-	uint32_t next;
-	uint32_t pad[2];
+	u32 info;
+	u32 src;
+	u32 dst;
+	u32 length;
+	u32 stride;
+	u32 next;
+	u32 pad[2];
 };
 
 struct bcm2835_cb_entry {
@@ -116,8 +116,8 @@ struct bcm2835_desc {
 					       * AXI-write to ack
 					       */
 #define BCM2835_DMA_ERR		BIT(8)
-#define BCM2835_DMA_PRIORITY(x) ((x & 15) << 16) /* AXI priority */
-#define BCM2835_DMA_PANIC_PRIORITY(x) ((x & 15) << 20) /* panic priority */
+#define BCM2835_DMA_PRIORITY(x) (((x) & 15) << 16) /* AXI priority */
+#define BCM2835_DMA_PANIC_PRIORITY(x) (((x) & 15) << 20) /* panic priority */
 /* current value of TI.BCM2835_DMA_WAIT_RESP */
 #define BCM2835_DMA_WAIT_FOR_WRITES BIT(28)
 #define BCM2835_DMA_DIS_DEBUG	BIT(29) /* disable debug pause signal */
@@ -136,9 +136,9 @@ struct bcm2835_desc {
 #define BCM2835_DMA_S_WIDTH	BIT(9) /* 128bit writes if set */
 #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
 #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
-#define BCM2835_DMA_BURST_LENGTH(x) ((x & 15) << 12)
-#define BCM2835_DMA_PER_MAP(x)	((x & 31) << 16) /* REQ source */
-#define BCM2835_DMA_WAIT(x)	((x & 31) << 21) /* add DMA-wait cycles */
+#define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
+#define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
+#define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
 
 /* debug register bits */
@@ -214,17 +214,15 @@ static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 
 static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 {
-	bcm2835_dma_free_cb_chain(
-		container_of(vd, struct bcm2835_desc, vd));
+	bcm2835_dma_free_cb_chain(container_of(vd, struct bcm2835_desc, vd));
 }
 
-static void bcm2835_dma_create_cb_set_length(
-	struct bcm2835_chan *chan,
-	struct bcm2835_dma_cb *control_block,
-	size_t len,
-	size_t period_len,
-	size_t *total_len,
-	u32 finalextrainfo)
+static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
+					     struct bcm2835_dma_cb *control_block,
+					     size_t len,
+					     size_t period_len,
+					     size_t *total_len,
+					     u32 finalextrainfo)
 {
 	size_t max_len = bcm2835_dma_max_frame_length(chan);
 
@@ -281,10 +279,13 @@ static void bcm2835_dma_create_cb_set_length(
  * @gfp:            the GFP flag to use for allocation
  */
 static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
-	struct dma_chan *chan, enum dma_transfer_direction direction,
-	bool cyclic, u32 info, u32 finalextrainfo, size_t frames,
-	dma_addr_t src, dma_addr_t dst, size_t buf_len,
-	size_t period_len, gfp_t gfp)
+					struct dma_chan *chan,
+					enum dma_transfer_direction direction,
+					bool cyclic, u32 info,
+					u32 finalextrainfo,
+					size_t frames, dma_addr_t src,
+					dma_addr_t dst, size_t buf_len,
+					size_t period_len, gfp_t gfp)
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len = buf_len, total_len;
@@ -326,10 +327,10 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			bcm2835_dma_create_cb_set_length(
-				c, control_block,
-				len, period_len, &total_len,
-				cyclic ? finalextrainfo : 0);
+			bcm2835_dma_create_cb_set_length(c, control_block,
+							 len, period_len,
+							 &total_len,
+							 cyclic ? finalextrainfo : 0);
 
 			/* calculate new remaining length */
 			len -= control_block->length;
@@ -353,7 +354,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;
 
 	/* detect a size mismatch */
-	if (buf_len && (d->size != buf_len))
+	if (buf_len && d->size != buf_len)
 		goto error_cb;
 
 	return d;
@@ -393,7 +394,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 static void bcm2835_dma_abort(struct bcm2835_chan *c)
 {
 	void __iomem *chan_base = c->chan_base;
-	long int timeout = 10000;
+	long timeout = 10000;
 
 	/*
 	 * A zero control block address means the channel is idle.
@@ -421,7 +422,6 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 {
 	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
-	struct bcm2835_desc *d;
 
 	if (!vd) {
 		c->desc = NULL;
@@ -430,9 +430,9 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 
 	list_del(&vd->node);
 
-	c->desc = d = to_bcm2835_dma_desc(&vd->tx);
+	c->desc = to_bcm2835_dma_desc(&vd->tx);
 
-	writel(d->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
+	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
 	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
 }
 
@@ -543,7 +543,8 @@ static size_t bcm2835_dma_desc_size_pos(struct bcm2835_desc *d, dma_addr_t addr)
 }
 
 static enum dma_status bcm2835_dma_tx_status(struct dma_chan *chan,
-	dma_cookie_t cookie, struct dma_tx_state *txstate)
+					     dma_cookie_t cookie,
+					     struct dma_tx_state *txstate)
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd;
@@ -843,7 +844,7 @@ static const struct of_device_id bcm2835_dma_of_match[] = {
 MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
 
 static struct dma_chan *bcm2835_dma_xlate(struct of_phandle_args *spec,
-					   struct of_dma *ofdma)
+					  struct of_dma *ofdma)
 {
 	struct bcm2835_dmadev *d = ofdma->of_dma_data;
 	struct dma_chan *chan;
@@ -887,7 +888,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	int i, j;
 	int irq[BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED + 1];
 	int irq_flags;
-	uint32_t chans_available;
+	u32 chans_available;
 	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
 
 	if (!pdev->dev.dma_mask)
@@ -946,8 +947,8 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 
 	/* Request DMA channel mask from device tree */
 	if (of_property_read_u32(pdev->dev.of_node,
-			"brcm,dma-channel-mask",
-			&chans_available)) {
+				 "brcm,dma-channel-mask",
+				 &chans_available)) {
 		dev_err(&pdev->dev, "Failed to get channel mask\n");
 		rc = -EINVAL;
 		goto err_no_dma;
@@ -986,7 +987,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		/* check if there are other channels that also use this irq */
 		irq_flags = 0;
 		for (j = 0; j <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; j++)
-			if ((i != j) && (irq[j] == irq[i])) {
+			if (i != j && irq[j] == irq[i]) {
 				irq_flags = IRQF_SHARED;
 				break;
 			}
@@ -1001,7 +1002,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 
 	/* Device-tree DMA controller registration */
 	rc = of_dma_controller_register(pdev->dev.of_node,
-			bcm2835_dma_xlate, od);
+					bcm2835_dma_xlate, od);
 	if (rc) {
 		dev_err(&pdev->dev, "Failed to register DMA controller\n");
 		goto err_no_dma;
-- 
2.51.0


