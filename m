Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E66606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y3f+DUw+;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PEEGfhxA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+tBgaZ/ue9EThyXCcpZYMbPnOM1Uj3AWIbOUVJpasCM=; b=y3f+DUw++dKqmI
	ADCJOlCzAIsIfcNtxVnvr6LhQj6RWcs3Nr6Tn6M1TW2oALqEgijs38ZCFP8UncYlk8RO9KBmG+9AQ
	lbQpKKaHnovHpBIXr+YYZbD8InfxtRz6FJ4OCwnDt/Ytbujcj6KjwRRSLFtjbm+XTedmTyEFWvrya
	inWy/zOffPiataN9IT+aXL8157a9UPNcKVz5QgI0hpdJySxhMUNwMI2nvEzn3+x/DlCtSVUXYZeJ5
	pbt4f30U3up/dxDThqt+f3LUTEjWRRhK420Szr+3wmBl56CiEQOS14SZvDrTgsET2lJ/kxtkxL3Vi
	BOaqGLXzNjYYcCl5zR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvu-0000000G3zg-3yOk;
	Fri, 27 Nov 2026 12:20:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuuo-0000000G34V-0XTX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:18:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so102797795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781936; x=1796386736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tBgaZ/ue9EThyXCcpZYMbPnOM1Uj3AWIbOUVJpasCM=;
        b=PEEGfhxA3+5yUqsHhkToie7PABmOJaqtLFz+9OSLku/BUQ3rOhp9qVlusXMl2cQig4
         tXGc4+TvuusCbY44KZN2/qd3mEfLnKZQmH/uL0NWjcccCoaugnXODlOx2oh4gJs4BkfI
         BaLmWWLYuTEs1GIulEHZORsuULXtTRr3nJHcpNboy0rWaFYn1gU+1ERQIx6JtOOPKM+c
         av95rUdzxobcNuABvHDBSx378eogGRrbM38z9RWai7SoTFqFeOa//l73tvSCLiu659RD
         HJokT8cZoHYftzlbsZlxsYidwbHhmZZbxEd4EfpzIlXoyJnWyNGaeemNVOeH+ID2mSFr
         GAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781936; x=1796386736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+tBgaZ/ue9EThyXCcpZYMbPnOM1Uj3AWIbOUVJpasCM=;
        b=iO3SgqJ7Q+1lJIIr05aVSU9qOU1F06XGrALtsdICMwVeVFx988iYQCAicZmRFG/YbY
         f61iwnENSu87JZztBKiFFH6wGRaWl6vIiKC9qjoHzp6wtwTecfqR9F/T+qhVsd1ojVfM
         OWoLwNdm4qk9S+Y1/MM1WawXizug1Xy8gKq9YSqZSumApHX3FWWBH1firr13ahWhH4kO
         V6n3VSLR/7dqK7gLDvMqa3Tfq5sumPl7S811CIbXFlaGySCpLRUrSvNRfuKN2kJQjvVr
         4tvgCVxpDfxb21Vd4PeUZrp7I1kDjp3G+iCrsz4KkDfT0AeLw1ya1CbD2U48Yq1fQijb
         vg8A==
X-Forwarded-Encrypted: i=1; AL+hErEPUtwzMisSm2BTTvu7SEb3ftPzOfW4XltHEnH6QMUMAB+xQ9zxAuML0oszbvwhTNlq4byPIpDxrCTWAtTneSav@lists.infradead.org
X-Gm-Message-State: APuU4Z/9e+bL+IaDIsr7B/M+PSXYdWnGGvLpRPv4pExrA2PWdDotgxyd
	qNeikYEpvfl9prUbzhlCwawkJJUei7kVj42dRLSbrJql5td9CzD81WoiQVB1u/BsC9s=
X-Gm-Gg: AZFdTZe8g3C9DSSjNBIGNReLI54FbPa+MdrA5pjwzQH/VOSLegsxpo4GFeQRrGxKxSw
	lsniBXIfXEaByGtHLv9sDGXx2QhbErXFBDo4WRS+ksHkbMGjx6wM/L32hozWtn0EbNOc+nax0/v
	PAtZkBbsjPSFLRgRdmjilSxft23gu2ccwGSo/3O4wTvexkJ6Z/S/iEhQW5Q4EJoOeueYrtOX8Vn
	uwa6QmdFohoMJ1w0zqJ47YneZNxh5YG2ZrMzmcsTgTrx/mXtmZuxnwSDeKLc5W7z31QcQ+VVFCX
	yH54umcWpez4RAnCBGw/f5h4VIBI6UGQMrkA/ZhyZ6g/VASn20QWgnV3dFpRxK6NC2yBVioitYn
	W1+d2FJcImVDvyYM5L58qnqF2BFUcnvZ9PhIZj/MzLNElY3vQCXERjyz6wv1LMAsxEgCfgbFS8W
	OuDGhl+NaIOo9q8hysII35HKcJODY09FMfxXKntS+i1C4e2YPW2c+E09Wt9TGqpH+9R/adlyqHO
	J0tbe5KyfIvNpQwWr16M9UbTovz28k/ut5Gj9PXDbBbUePNJO3FaET2Nz1tb7q+RoQjqjiMCO9u
	buILozgRNW4/xX42SD6r/VL+3iJ4
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr496613695e9.3.1795781936454;
        Fri, 27 Nov 2026 04:18:56 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm767331835e9.10.2026.11.27.04.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:56 -0800 (PST)
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
Subject: [PATCH v4 11/28] dmaengine: bcm2835: drop info parameters
Date: Fri, 27 Nov 2026 13:22:01 +0100
Message-ID: <20261127122236.4976-12-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041858_342598_F91BAFE6 
X-CRM114-Status: GOOD (  22.97  )
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
 drivers/dma/bcm2835-dma.c | 81 +++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 42 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 1fa7cbfe3c2d..416d9882aeb2 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -305,12 +305,11 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
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
 
@@ -319,7 +318,7 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 
 	/* finished if we have no period_length */
 	if (!period_len)
-		return;
+		return false;
 
 	/*
 	 * period_len means: that we need to generate
@@ -333,7 +332,7 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 	if (*total_len + control_block->length < period_len) {
 		/* update number of bytes in this period so far */
 		*total_len += control_block->length;
-		return;
+		return false;
 	}
 
 	/* calculate the length that remains to reach period_length */
@@ -342,8 +341,7 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 	/* reset total_length for next period */
 	*total_len = 0;
 
-	/* add extrainfo bits in info */
-	control_block->info |= finalextrainfo;
+	return true;
 }
 
 /**
@@ -352,7 +350,6 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @chan:           the @dma_chan for which we run this
  * @direction:      the direction in which we transfer
  * @cyclic:         it is a cyclic transfer
- * @info:           the default info bits to apply per controlblock
  * @frames:         number of controlblocks to allocate
  * @src:            the src address to assign
  * @dst:            the dst address to assign
@@ -360,25 +357,27 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
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
@@ -392,6 +391,14 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
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
@@ -405,7 +412,8 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 
 		/* fill in the control block */
 		control_block = cb_entry->cb;
-		control_block->info = info;
+		control_block->info = bcm2835_dma_prepare_cb_info(c, direction,
+								  zero_page);
 		control_block->src = src;
 		control_block->dst = dst;
 		control_block->stride = 0;
@@ -413,10 +421,12 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
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
@@ -437,7 +447,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	}
 
 	/* the last frame requires extra flags */
-	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;
+	extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic, true,
+						 flags);
+	d->cb_list[d->frames - 1].cb->info |= extrainfo;
 
 	/* detect a size mismatch */
 	if (buf_len && d->size != buf_len)
@@ -690,9 +702,6 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
-						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -704,9 +713,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	frames = bcm2835_dma_frames_for_length(len, max_len);
 
 	/* allocate the CB chain - this also fills in the pointers */
-	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false,
-					info, extra, frames,
-					src, dst, len, 0, GFP_KERNEL);
+	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false, frames,
+					src, dst, len, 0, GFP_KERNEL, 0);
 	if (!d)
 		return NULL;
 
@@ -722,8 +730,6 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -746,10 +752,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
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
 
@@ -765,14 +769,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	size_t period_len, enum dma_transfer_direction direction,
 	unsigned long flags)
 {
-	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
-					       buf_addr == od->zero_page);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true,
-						 flags);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -823,10 +822,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
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


