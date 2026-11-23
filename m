Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93275606A68C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pFQHZka7;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GSVgxkdp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5yhgBCJg6Ol4mS/XuoylZsC4b2QM4BZ8ZLa608R7/9c=; b=pFQHZka7no/GnA
	XHKOfWVfBf6Dby7FhBlUkkhTJws810tkEVRkg9DOFmU4lyOu6MgUnkWBO7A6cxFoD4EM4bTa2Or/T
	77qRnVsQf0AHSotuJXCRoJlxy1QVsFJlY5bJ2vTQWqmUOMnN2tJEn+GDemjfB8sKjXKh57m67NXxd
	p5c9fMqh5xrKPWOWq0lzbinh9aE3BKAL/Erc1uvE3yVh2U9VgR7WvK/Mw2zkg8rhut6i/LppmUUzL
	bjkB7A+WzuHXOf6cZnUFo0zXQGWAyjEHkRiOLkw6XwdXKaFGGgCCOT6waUDdmrd7D4R3u3KGrSXKe
	tOVnsJhY5JIoqGPMzFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVRb-00000003pKx-2vtY;
	Mon, 23 Nov 2026 14:54:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQU-00000003oTx-0E7G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so31637455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445628; x=1796050428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yhgBCJg6Ol4mS/XuoylZsC4b2QM4BZ8ZLa608R7/9c=;
        b=GSVgxkdpCsjBtp9sivmoG8W1q9rEq5rRWxt2sKeVsMFhjY+NSfcjJbDPtAvGpmOMN4
         QsVk3NrmYV41jDxJ/eMTZqHE+5qhLYE8qrBUJioS2vISUb9Wn7HjpdOphWa7LzA1+CVF
         Lqka+OBEYNjd3XPwDlH+EswvcSNvU+urL1lI53RxAxLkHleb1vi0oRAsVL5KnHbjDKfO
         YOiYaE2d0zZf1FIX1IVRR7S4fxaSDECuC648aHpMeCx3SFOQokSvWbS1CvVCq8UZDBKZ
         K07V66qNG2VK/ZzDzuIVEYpTy1FV3hQC/QqXFbhAinP9Z6kTnlRVKKRLzD9huwicVDvL
         PwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445628; x=1796050428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5yhgBCJg6Ol4mS/XuoylZsC4b2QM4BZ8ZLa608R7/9c=;
        b=PwJOK9lCak/qFuK89iNZ0lEgJD4paZW9MK71oIYrA8MfHz6wUzOZmZv08xfOUJdADw
         mF3TC16DgLTSeW4Erb7KQU6Rfe7ZkUGTIsOMLY6RoJFmdx/h2pI4YEFq1wD7aBJqxz2b
         z34XMrZIheX5NN7ESO4lEemFSmqsfhXbUGyb3cmvO3S31K3xrmz3EiTYvaMs3I93Q77N
         b0CI6+DdDPTveKb4H/64YxeEwRR38xddezEDOtUs3ishAbIZNpryztOAVLTwwXNsjcFr
         zXam66LnpooLQsKjxoEupDSN1WpbJpCvNa6JXUUva3TSqEshVXi/DrfvgXjZcyDpwJJX
         O4Fg==
X-Forwarded-Encrypted: i=1; AL+hErFz4f6wJx6whVGa3ANtv1V9q7t49hocohfLuTYHMtusyOGmIlZa/jNFrKmJocKLqhzct1QidZpWf0lXJc2EgggV@lists.infradead.org
X-Gm-Message-State: APuU4Z9eVeSjk7bqxqEITrEWSc77F3MsEG7hbJc3axNXTvNCfFszqkyr
	SrXf8dyA+cLMWmdAxRwoRhE9cBT3eiWVqPUiGNN1Sy39HLByZMwcAlqqiHdZFOBdJDU=
X-Gm-Gg: AZFdTZej3SKJ4kYMUktQb0RPMccEamJi+czHCBafsyWTCDkivpxVQ5Vf2QUhLxEX6qH
	dDgigkL4R/TJt2iVZaQQfMS7qM6tPScNGsDj7PFlmu0JVYNVg9WXunXekxg1pMDA1xtSY1O22nN
	9jZLXnAQTqXkeufLbxbBafPy8LrKjo+owOC9ZTRC2KQ96Y5496s7lWAydkXr8sReuxybl0GRAbt
	9SeJdckBf6rTTuJrQ3/OnPQPOEEBvxFhY1fxleOrVF7W+989GYJ7W38fC7Yi1VAvgkk8hyRPkFa
	adG8gCIcszINnJQslU1p7j5mr+8sl/J3bin97++jfbsc1qjfKkgNTpvc/fPsC3U6z8G/KqOF9Jm
	n4IAb9vUUOZBuqkjV05humS1WPtTvbh39vjx+zw6aKFmJh5VE2lkZh6D2Sm7aE4fBQIidhVwID0
	ewu0xWq4sJXjgtCe6Ey99eskIRAiCdGBCLXcTAYn3tfplQ/67DjribV8soZ8OxBsSW5sgQ+oDHZ
	/g3V1qPBHZF8z/iF1RJR2Nvo+2d+OTdtpftZOc7QCgOo8QYBshY3ZiYTv3OmS7b1pTocIKYtml7
	tI+PCwn/N/0Rk4/X/NVvdr++NOY=
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr284054745e9.6.1795445628208;
        Mon, 23 Nov 2026 06:53:48 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm23613117f8f.31.2026.11.23.06.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:47 -0800 (PST)
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
Subject: [PATCH v3 11/28] dmaengine: bcm2835: drop info parameters
Date: Mon, 23 Nov 2026 15:56:49 +0100
Message-ID: <20261123145728.29082-12-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065350_150717_E4F45178 
X-CRM114-Status: GOOD (  23.20  )
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

The parameters info and finalextrainfo are platform specific. So drop
them by generating them within bcm2835_dma_create_cb_chain().

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 80 +++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 41 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 6180a2737e07..1d322cad4ca3 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -307,12 +307,11 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 	bcm2835_dma_free_cb_chain(container_of(vd, struct bcm2835_desc, vd));
 }
 
-static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
+static bool bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 					     struct bcm2835_dma_cb *control_block,
 					     size_t len,
 					     size_t period_len,
-					     size_t *total_len,
-					     u32 finalextrainfo)
+					     size_t *total_len)
 {
 	size_t max_len = bcm2835_dma_max_frame_length(chan);
 
@@ -321,7 +320,7 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 
 	/* finished if we have no period_length */
 	if (!period_len)
-		return;
+		return false;
 
 	/*
 	 * period_len means: that we need to generate
@@ -335,7 +334,7 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 	if (*total_len + control_block->length < period_len) {
 		/* update number of bytes in this period so far */
 		*total_len += control_block->length;
-		return;
+		return false;
 	}
 
 	/* calculate the length that remains to reach period_length */
@@ -344,8 +343,7 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 	/* reset total_length for next period */
 	*total_len = 0;
 
-	/* add extrainfo bits in info */
-	control_block->info |= finalextrainfo;
+	return true;
 }
 
 /**
@@ -354,7 +352,6 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @chan:           the @dma_chan for which we run this
  * @direction:      the direction in which we transfer
  * @cyclic:         it is a cyclic transfer
- * @info:           the default info bits to apply per controlblock
  * @frames:         number of controlblocks to allocate
  * @src:            the src address to assign
  * @dst:            the dst address to assign
@@ -362,25 +359,27 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @period_len:     the period length when to apply @finalextrainfo
  *                  in addition to the last transfer
  *                  this will also break some control-blocks early
- * @finalextrainfo: additional bits in last controlblock
- *                  (or when period_len is reached in case of cyclic)
  * @gfp:            the GFP flag to use for allocation
+ * @flags:          the dmaengine prep flags (DMA_PREP_*) of the transfer
  */
 static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 					struct dma_chan *chan,
 					enum dma_transfer_direction direction,
-					bool cyclic, u32 info,
-					u32 finalextrainfo,
-					size_t frames, dma_addr_t src,
-					dma_addr_t dst, size_t buf_len,
-					size_t period_len, gfp_t gfp)
+					bool cyclic, size_t frames,
+					dma_addr_t src,	dma_addr_t dst,
+					size_t buf_len, size_t period_len,
+					gfp_t gfp, unsigned long flags)
 {
+	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len = buf_len, total_len;
 	size_t frame;
 	struct bcm2835_desc *d;
 	struct bcm2835_cb_entry *cb_entry;
 	struct bcm2835_dma_cb *control_block;
+	u32 extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic,
+						     false, flags);
+	bool zero_page = false;
 
 	if (!frames)
 		return NULL;
@@ -394,6 +393,14 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	d->dir = direction;
 	d->cyclic = cyclic;
 
+	switch (direction) {
+	case DMA_MEM_TO_MEM:
+	case DMA_DEV_TO_MEM:
+		break;
+	default:
+		zero_page = src == od->zero_page;
+	}
+
 	/*
 	 * Iterate over all frames, create a control block
 	 * for each frame and link them together.
@@ -407,7 +414,8 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 
 		/* fill in the control block */
 		control_block = cb_entry->cb;
-		control_block->info = info;
+		control_block->info = bcm2835_dma_prepare_cb_info(c, direction,
+								  zero_page);
 		control_block->src = src;
 		control_block->dst = dst;
 		control_block->stride = 0;
@@ -415,10 +423,12 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			bcm2835_dma_create_cb_set_length(c, control_block,
-							 len, period_len,
-							 &total_len,
-							 cyclic ? finalextrainfo : 0);
+			if (bcm2835_dma_create_cb_set_length(c, control_block,
+							     len, period_len,
+							     &total_len)) {
+				/* add extrainfo bits in info */
+				control_block->info |= extrainfo;
+			}
 
 			/* calculate new remaining length */
 			len -= control_block->length;
@@ -439,7 +449,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	}
 
 	/* the last frame requires extra flags */
-	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;
+	extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic, true,
+						 flags);
+	d->cb_list[d->frames - 1].cb->info |= extrainfo;
 
 	/* detect a size mismatch */
 	if (buf_len && d->size != buf_len)
@@ -703,9 +715,6 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
-						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -717,9 +726,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	frames = bcm2835_dma_frames_for_length(len, max_len);
 
 	/* allocate the CB chain - this also fills in the pointers */
-	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false,
-					info, extra, frames,
-					src, dst, len, 0, GFP_KERNEL);
+	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false, frames,
+					src, dst, len, 0, GFP_KERNEL, 0);
 	if (!d)
 		return NULL;
 
@@ -735,8 +743,6 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -759,10 +765,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	frames = sg_nents_for_dma(sgl, sg_len, bcm2835_dma_max_frame_length(c));
 
 	/* allocate the CB chain */
-	d = bcm2835_dma_create_cb_chain(chan, direction, false,
-					info, extra,
-					frames, src, dst, 0, 0,
-					GFP_NOWAIT);
+	d = bcm2835_dma_create_cb_chain(chan, direction, false, frames, src,
+					dst, 0, 0, GFP_NOWAIT, 0);
 	if (!d)
 		return NULL;
 
@@ -778,13 +782,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	size_t period_len, enum dma_transfer_direction direction,
 	unsigned long flags)
 {
-	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
-					       buf_addr == od->zero_page);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -835,10 +835,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	 * note that we need to use GFP_NOWAIT, as the ALSA i2s dmaengine
 	 * implementation calls prep_dma_cyclic with interrupts disabled.
 	 */
-	d = bcm2835_dma_create_cb_chain(chan, direction, true,
-					info, extra,
-					frames, src, dst, buf_len,
-					period_len, GFP_NOWAIT);
+	d = bcm2835_dma_create_cb_chain(chan, direction, true, frames, src, dst,
+					buf_len, period_len, GFP_NOWAIT, flags);
 	if (!d)
 		return NULL;
 
-- 
2.51.0


