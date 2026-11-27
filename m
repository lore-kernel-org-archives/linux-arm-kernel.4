Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A2A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2C8OkBNP;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eyCtg73H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lvnO97+HZnLeWD0ptxjSNdkuwUSjxRmnbj0wxFrkJfo=; b=2C8OkBNP0WgSJ8
	fgxBDlrNUk+/BfiE5YIdB8/P7nCYsEnWWBo8Ay8oOAIZVi45lqzfcLlseR6ohiFTXfiU6mh7yfvR6
	wJd1NaZRm7fz/Zy3JfXEysyutoBB2R6gPqOLxDyRH+IiZwm/pJOvuzu7hqbsOfvCY41a425FkGinn
	qnGhqR+bffWlcMDO6cInRZi0Z0RbHuJPeTTIg9AnTsHCe3ReM6tQRjLXhTW+IFdcfuI18hPcAWYgR
	2EmtXr7LzA7ns6KoPjB6pYSvaR+xMgmEmobYuZ2edpjglwBGepJrTxBTV8PQYd+el1fycWW/pyRlP
	/L32OHFQ79EMJw5DF9wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuy3-0000000G5Ds-2ZI9;
	Fri, 27 Nov 2026 12:22:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuur-0000000G38F-0S1q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso62352965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781939; x=1796386739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvnO97+HZnLeWD0ptxjSNdkuwUSjxRmnbj0wxFrkJfo=;
        b=eyCtg73HLrkhDIrfEoqXDve05vrfuKUY4mjI9v6XkGGZlYGzlaWQ/3dXVj3M2TKe1V
         Pp0XXNNbT/UpnA9fibDajXSafAZQUiNBwPfMWZlMGnBkfcI76MvzpI0LvUlrzb2ypckJ
         B1MrfD8JQusjDh/BpLcYxeDFBxI5AmLNwLo0eqWe5QQaUUYCSLKkTj6ugOf6CJdpC4wi
         TUFUJDU7ukAoDoKUziF8MBBydnnYJKLKNLwgkusfcx2wS3RZZ+rxcNvdHo0YW0j+BGuN
         pL3bzRMkgDoaya6MNlGdCWeOyLJGkHhVmkC8mjgEuTcksxAo77WGfqAvIjmuSVpaYUlC
         DMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781939; x=1796386739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvnO97+HZnLeWD0ptxjSNdkuwUSjxRmnbj0wxFrkJfo=;
        b=SkGCI3LCW75MrKlrEAJ00lklhyrdRnxWTjYwGc/yrQqp37BpLaMY5fbmrhR7OQVMsk
         G+H7EO2NVjTa6JcKbKFORhEt2aekfyBNVlfJ10fkCIxqKnT1wzP+okKFMxPs/mwyeScm
         wRhEhvJtk8QWuWRVPzn0nGvMTRBp1ZABa6h9GJbo0ONjQx4mT5G/vCoUvfhp92Q7wIN4
         yS+dds4xkMmf0fuDW+UE8+JU4woYO7Gfpg4uXby42NM4HnV0e6N8udavUBM/Azotyftn
         vdSlcX3ozCgRjavZ4k/9GDmq41bZQUIuEuzvbFmfLosbPh/+ynCWovyW4PSPSRxd0GOe
         4ZsA==
X-Forwarded-Encrypted: i=1; AL+hErGY7y29g1nSZh2NC0yDTiLFNaj0ROtz8zesNetVCZiSVO+kOYARoIpDaLKozfg7HGOwo+bfMBl5TbTsx56d+jZS@lists.infradead.org
X-Gm-Message-State: APuU4Z/MEtmoUyXvTUyrRHk9PKkoHhbwmU4N1OT1/rrrmFjMSCE7QORg
	AQUENY7hvk/qPsb51HDYc7HS1UniLM6xFncXnVp5PPirENcdsc0MXOUvjjuuF/5iLig=
X-Gm-Gg: AZFdTZeuyqnng5Pb4iVG93hZ+5k3eH/7UNC3yZD4faI5MFD/PkKdVP0R+yaldUuPmGy
	JLXKPqDNCJTbzGI2OC+9+h1JO0AH6qckLnO4+stanZoJcsPAQfZzAMZSFrgDF2hAvXJSzUPE2eF
	PQ09/JdQkmPlm9yUWEZtSDOcq2gH7XlBsD6SgHszz0hv1xjsZgsMcdqnHUoWbVi+sq2mJzaD69V
	Mh7jsuMQF9/ZEncppdEYZRTBf5mFmadT0J591Gm9NyJula96j2K/gZdRJArvmcJf6V5NYCccQFH
	oyxnyodG6fblAdjEasFTURVa3csRLyqG2YyWRHonxclQQl2QALtIBj1QzTWUWZomM+9QFYCOvRA
	kLQZl8yv2scCunNezN38GHXrakrM4oG8SaCwMv8Bb1s4O9BQr3TqfvloDWldiUZo+2Dt11RRvjR
	ex/PYLUl7+pZBP0ldhNTFueEej2gX5jJ2+vkkzf4VhOUB4gs7P9MCxCyZR1GCf74Vs+LoGX5mg5
	j2Lhqv/Fn6CUrM+HXgwWcUhZYPkZ3mwOxoLve8Arhf/4hcEDUZZtPWaGiinX5oRDeKUNwoB+nfL
	1qQh5KKCDNv7lLnnP1pUA0o3VZkU
X-Received: by 2002:a05:600c:a085:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb8881092bmr497851795e9.13.1795781939368;
        Fri, 27 Nov 2026 04:18:59 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm674672075e9.1.2026.11.27.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:58 -0800 (PST)
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
Subject: [PATCH v4 13/28] dmaengine: bcm2835: introduce multi platform support
Date: Fri, 27 Nov 2026 13:22:03 +0100
Message-ID: <20261127122236.4976-14-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041901_308539_4201E5AC 
X-CRM114-Status: GOOD (  29.32  )
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

This finally moves all platform specific stuff into a separate structure,
which is initialized on the OF compatible during probing. Since the DMA
control block is different on the BCM2711 platform, we introduce a common
control block to reserve the necessary space and adequate methods for
access.

The abort sequence is completely different on the 40-bit channels, so
make it a platform callback instead of trying to describe it through
register offsets and bit masks.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 338 ++++++++++++++++++++++++++++++--------
 1 file changed, 267 insertions(+), 71 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 42a7e6eaff9f..44dab42d94c6 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -46,11 +46,17 @@
  * @base: base address of register map
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
+ * @cfg: platform specific description of the DMA channels
  */
 struct bcm2835_dmadev {
 	struct dma_device ddev;
 	void __iomem *base;
 	dma_addr_t zero_page;
+	const struct bcm2835_dma_cfg *cfg;
+};
+
+struct bcm_dma_cb {
+	u32 rsvd[8];
 };
 
 struct bcm2835_dma_cb {
@@ -64,7 +70,7 @@ struct bcm2835_dma_cb {
 };
 
 struct bcm2835_cb_entry {
-	struct bcm2835_dma_cb *cb;
+	struct bcm_dma_cb *cb;
 	dma_addr_t paddr;
 };
 
@@ -85,6 +91,59 @@ struct bcm2835_chan {
 	bool is_lite_channel;
 };
 
+/**
+ * struct bcm2835_dma_cfg - platform specific description of the DMA channels
+ * @cs_reg: offset of the control and status register
+ * @cb_reg: offset of the control block address register
+ * @int_mask: interrupt status bit in the CS register
+ * @active_mask: channel active bit in the CS register
+ * @cb_get_length: get the transfer length of a control block
+ * @cb_get_addr: get the memory side address of a control block
+ * @cb_init: initialize a control block
+ * @cb_set_src: set the source address of a control block
+ * @cb_set_dst: set the destination address of a control block
+ * @cb_set_next: link a control block to the next one
+ * @cb_set_length: set the transfer length of a control block
+ * @cb_append_extra: add the interrupt and completion bits to a control block
+ * @to_cb_addr: convert a control block bus address to its register format
+ * @chan_plat_init: platform specific channel initialization
+ * @read_addr: read the current memory side address of a channel
+ * @cs_flags: per-channel flags for the CS register
+ * @abort: stop and reset a channel
+ */
+struct bcm2835_dma_cfg {
+	u32 cs_reg;
+	u32 cb_reg;
+
+	u32 int_mask;
+	u32 active_mask;
+
+	u32 (*cb_get_length)(void *data);
+	dma_addr_t (*cb_get_addr)(void *data, enum dma_transfer_direction);
+
+	void (*cb_init)(void *data, struct bcm2835_chan *c,
+			enum dma_transfer_direction direction, dma_addr_t src,
+			dma_addr_t dst, bool zero_page);
+	void (*cb_set_src)(void *data, enum dma_transfer_direction direction,
+			   dma_addr_t src);
+	void (*cb_set_dst)(void *data, enum dma_transfer_direction direction,
+			   dma_addr_t dst);
+	void (*cb_set_next)(void *data, u32 next);
+	void (*cb_set_length)(void *data, u32 length);
+	void (*cb_append_extra)(void *data,
+				struct bcm2835_chan *c,
+				enum dma_transfer_direction direction,
+				bool cyclic, bool final, unsigned long flags);
+
+	u32 (*to_cb_addr)(dma_addr_t addr);
+
+	void (*chan_plat_init)(struct bcm2835_chan *c);
+	dma_addr_t (*read_addr)(struct bcm2835_chan *c,
+				enum dma_transfer_direction direction);
+	u32 (*cs_flags)(struct bcm2835_chan *c);
+	void (*abort)(struct bcm2835_chan *c);
+};
+
 struct bcm2835_desc {
 	struct bcm2835_chan *c;
 	struct virt_dma_desc vd;
@@ -217,6 +276,13 @@ static inline struct bcm2835_dmadev *to_bcm2835_dma_dev(struct dma_device *d)
 	return container_of(d, struct bcm2835_dmadev, ddev);
 }
 
+static inline const struct bcm2835_dma_cfg *to_bcm2835_cfg(struct dma_device *d)
+{
+	struct bcm2835_dmadev *od = container_of(d, struct bcm2835_dmadev, ddev);
+
+	return od->cfg;
+}
+
 static inline struct bcm2835_chan *to_bcm2835_dma_chan(struct dma_chan *c)
 {
 	return container_of(c, struct bcm2835_chan, vc.chan);
@@ -289,6 +355,109 @@ static inline bool need_dst_incr(enum dma_transfer_direction direction)
 	return direction == DMA_MEM_TO_MEM || direction == DMA_DEV_TO_MEM;
 }
 
+static inline u32 bcm2835_dma_cb_get_length(void *data)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	return cb->length;
+}
+
+static inline dma_addr_t
+bcm2835_dma_cb_get_addr(void *data, enum dma_transfer_direction direction)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	if (direction == DMA_DEV_TO_MEM)
+		return cb->dst;
+
+	return cb->src;
+}
+
+static inline void
+bcm2835_dma_cb_init(void *data, struct bcm2835_chan *c,
+		    enum dma_transfer_direction direction, dma_addr_t src,
+		    dma_addr_t dst, bool zero_page)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	cb->info = bcm2835_dma_prepare_cb_info(c, direction, zero_page);
+	cb->src = src;
+	cb->dst = dst;
+	cb->stride = 0;
+	cb->next = 0;
+}
+
+static inline void
+bcm2835_dma_cb_set_src(void *data, enum dma_transfer_direction direction,
+		       dma_addr_t src)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	cb->src = src;
+}
+
+static inline void
+bcm2835_dma_cb_set_dst(void *data, enum dma_transfer_direction direction,
+		       dma_addr_t dst)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	cb->dst = dst;
+}
+
+static inline void bcm2835_dma_cb_set_next(void *data, u32 next)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	cb->next = next;
+}
+
+static inline void bcm2835_dma_cb_set_length(void *data, u32 length)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	cb->length = length;
+}
+
+static inline void
+bcm2835_dma_cb_append_extra(void *data, struct bcm2835_chan *c,
+			    enum dma_transfer_direction direction,
+			    bool cyclic, bool final, unsigned long flags)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	cb->info |= bcm2835_dma_prepare_cb_extra(c, direction, cyclic, final,
+						 flags);
+}
+
+static inline u32 bcm2835_dma_to_cb_addr(dma_addr_t addr)
+{
+	return addr;
+}
+
+static void bcm2835_dma_chan_plat_init(struct bcm2835_chan *c)
+{
+	/* check in DEBUG register if this is a LITE channel */
+	if (readl(c->chan_base + BCM2835_DMA_DEBUG) & BCM2835_DMA_DEBUG_LITE)
+		c->is_lite_channel = true;
+}
+
+static dma_addr_t bcm2835_dma_read_addr(struct bcm2835_chan *c,
+					enum dma_transfer_direction direction)
+{
+	if (direction == DMA_MEM_TO_DEV)
+		return readl(c->chan_base + BCM2835_DMA_SOURCE_AD);
+	else if (direction == DMA_DEV_TO_MEM)
+		return readl(c->chan_base + BCM2835_DMA_DEST_AD);
+
+	return 0;
+}
+
+static u32 bcm2835_dma_cs_flags(struct bcm2835_chan *c)
+{
+	return BCM2835_DMA_CS_FLAGS(c->dreq);
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -306,16 +475,19 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 }
 
 static bool bcm2835_dma_create_cb_set_length(struct dma_chan *chan,
-					     struct bcm2835_dma_cb *control_block,
+					     void *data,
 					     size_t len,
 					     size_t period_len,
 					     size_t *total_len)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 
 	/* set the length taking lite-channel limitations into account */
-	control_block->length = min_t(u32, len, max_len);
+	u32 length = min_t(u32, len, max_len);
+
+	cfg->cb_set_length(data, length);
 
 	/* finished if we have no period_length */
 	if (!period_len)
@@ -330,14 +502,14 @@ static bool bcm2835_dma_create_cb_set_length(struct dma_chan *chan,
 	 */
 
 	/* have we filled in period_length yet? */
-	if (*total_len + control_block->length < period_len) {
+	if (*total_len + length < period_len) {
 		/* update number of bytes in this period so far */
-		*total_len += control_block->length;
+		*total_len += length;
 		return false;
 	}
 
 	/* calculate the length that remains to reach period_length */
-	control_block->length = period_len - *total_len;
+	cfg->cb_set_length(data, period_len - *total_len);
 
 	/* reset total_length for next period */
 	*total_len = 0;
@@ -369,15 +541,14 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 					size_t buf_len, size_t period_len,
 					gfp_t gfp, unsigned long flags)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len = buf_len, total_len;
 	size_t frame;
 	struct bcm2835_desc *d;
 	struct bcm2835_cb_entry *cb_entry;
-	struct bcm2835_dma_cb *control_block;
-	u32 extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic,
-						     false, flags);
+	struct bcm_dma_cb *control_block;
 	bool zero_page = false;
 
 	if (!frames)
@@ -413,12 +584,8 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 
 		/* fill in the control block */
 		control_block = cb_entry->cb;
-		control_block->info = bcm2835_dma_prepare_cb_info(c, direction,
-								  zero_page);
-		control_block->src = src;
-		control_block->dst = dst;
-		control_block->stride = 0;
-		control_block->next = 0;
+		cfg->cb_init(control_block, c, direction, src, dst, zero_page);
+
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
@@ -426,31 +593,33 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 							     len, period_len,
 							     &total_len)) {
 				/* add extrainfo bits in info */
-				control_block->info |= extrainfo;
+				cfg->cb_append_extra(control_block, c,
+						     direction, cyclic,
+						     false, flags);
 			}
 
 			/* calculate new remaining length */
-			len -= control_block->length;
+			len -= cfg->cb_get_length(control_block);
 		}
 
 		/* link this the last controlblock */
 		if (frame)
-			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
+			cfg->cb_set_next(d->cb_list[frame - 1].cb,
+					 cfg->to_cb_addr(cb_entry->paddr));
 
 		/* update src and dst and length */
 		if (src && need_src_incr(direction))
-			src += control_block->length;
+			src += cfg->cb_get_length(control_block);
 		if (dst && need_dst_incr(direction))
-			dst += control_block->length;
+			dst += cfg->cb_get_length(control_block);
 
 		/* Length of total transfer */
-		d->size += control_block->length;
+		d->size += cfg->cb_get_length(control_block);
 	}
 
 	/* the last frame requires extra flags */
-	extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic, true,
-						 flags);
-	d->cb_list[d->frames - 1].cb->info |= extrainfo;
+	cfg->cb_append_extra(d->cb_list[d->frames - 1].cb, c, direction, cyclic,
+			     true, flags);
 
 	/* detect a size mismatch */
 	if (buf_len && d->size != buf_len)
@@ -470,6 +639,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	struct scatterlist *sgl,
 	unsigned int sg_len)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len, max_len;
 	unsigned int i;
@@ -480,29 +650,21 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	for_each_sg(sgl, sgent, sg_len, i) {
 		for (addr = sg_dma_address(sgent), len = sg_dma_len(sgent);
 		     len > 0;
-		     addr += cb->cb->length, len -= cb->cb->length, cb++) {
+		     addr += cfg->cb_get_length(cb->cb), len -= cfg->cb_get_length(cb->cb), cb++) {
 			if (direction == DMA_DEV_TO_MEM)
-				cb->cb->dst = addr;
+				cfg->cb_set_dst(cb->cb, direction, addr);
 			else
-				cb->cb->src = addr;
-			cb->cb->length = min(len, max_len);
+				cfg->cb_set_src(cb->cb, direction, addr);
+			cfg->cb_set_length(cb->cb, min(len, max_len));
 		}
 	}
 }
 
-static void bcm2835_dma_abort(struct dma_chan *chan)
+static void bcm2835_dma_abort_chan(struct bcm2835_chan *c)
 {
-	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	void __iomem *chan_base = c->chan_base;
 	long timeout = 10000;
 
-	/*
-	 * A zero control block address means the channel is idle.
-	 * (The ACTIVE flag in the CS register is not a reliable indicator.)
-	 */
-	if (!readl(chan_base + BCM2835_DMA_ADDR))
-		return;
-
 	/* Write 0 to the active bit - Pause the DMA */
 	writel(0, chan_base + BCM2835_DMA_CS);
 
@@ -519,8 +681,24 @@ static void bcm2835_dma_abort(struct dma_chan *chan)
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
+static void bcm2835_dma_abort(struct dma_chan *chan)
+{
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
+
+	/*
+	 * A zero control block address means the channel is idle.
+	 * (The ACTIVE flag in the CS register is not a reliable indicator.)
+	 */
+	if (!readl(c->chan_base + cfg->cb_reg))
+		return;
+
+	cfg->abort(c);
+}
+
 static void bcm2835_dma_start_desc(struct dma_chan *chan)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
 
@@ -533,14 +711,15 @@ static void bcm2835_dma_start_desc(struct dma_chan *chan)
 
 	c->desc = to_bcm2835_dma_desc(&vd->tx);
 
-	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
-	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
-	       c->chan_base + BCM2835_DMA_CS);
+	writel(cfg->to_cb_addr(c->desc->cb_list[0].paddr), c->chan_base + cfg->cb_reg);
+	writel(cfg->active_mask | cfg->cs_flags(c),
+	       c->chan_base + cfg->cs_reg);
 }
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 {
 	struct dma_chan *chan = data;
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	unsigned long flags;
@@ -548,9 +727,9 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	/* check the shared interrupt */
 	if (c->irq_flags & IRQF_SHARED) {
 		/* check if the interrupt is enabled */
-		flags = readl(c->chan_base + BCM2835_DMA_CS);
+		flags = readl(c->chan_base + cfg->cs_reg);
 		/* if not set then we are not the reason for the irq */
-		if (!(flags & BCM2835_DMA_INT))
+		if (!(flags & cfg->int_mask))
 			return IRQ_NONE;
 	}
 
@@ -563,9 +742,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	 * if this IRQ handler is threaded.) If the channel is finished, it
 	 * will remain idle despite the ACTIVE flag being set.
 	 */
-	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
-	       BCM2835_DMA_CS_FLAGS(c->dreq),
-	       c->chan_base + BCM2835_DMA_CS);
+	writel(cfg->int_mask | cfg->active_mask | cfg->cs_flags(c), c->chan_base + cfg->cs_reg);
 
 	d = c->desc;
 
@@ -573,7 +750,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 		if (d->cyclic) {
 			/* call the cyclic callback */
 			vchan_cyclic_callback(&d->vd);
-		} else if (!readl(c->chan_base + BCM2835_DMA_ADDR)) {
+		} else if (!readl(c->chan_base + cfg->cb_reg)) {
 			vchan_cookie_complete(&c->desc->vd);
 			bcm2835_dma_start_desc(chan);
 		}
@@ -596,7 +773,7 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
 	 * (32 byte) aligned address (BCM2835 ARM Peripherals, sec. 4.2.1.1).
 	 */
 	c->cb_pool = dma_pool_create(dev_name(dev), dev,
-				     sizeof(struct bcm2835_dma_cb), 32, 0);
+				     sizeof(struct bcm_dma_cb), 32, 0);
 	if (!c->cb_pool) {
 		dev_err(dev, "unable to allocate descriptor pool\n");
 		return -ENOMEM;
@@ -625,20 +802,16 @@ static size_t bcm2835_dma_desc_size(struct bcm2835_desc *d)
 	return d->size;
 }
 
-static size_t bcm2835_dma_desc_size_pos(struct bcm2835_desc *d, dma_addr_t addr)
+static size_t bcm2835_dma_desc_size_pos(const struct bcm2835_dma_cfg *cfg,
+					struct bcm2835_desc *d, dma_addr_t addr)
 {
 	unsigned int i;
 	size_t size;
 
 	for (size = i = 0; i < d->frames; i++) {
-		struct bcm2835_dma_cb *control_block = d->cb_list[i].cb;
-		size_t this_size = control_block->length;
-		dma_addr_t dma;
-
-		if (d->dir == DMA_DEV_TO_MEM)
-			dma = control_block->dst;
-		else
-			dma = control_block->src;
+		struct bcm_dma_cb *control_block = d->cb_list[i].cb;
+		size_t this_size = cfg->cb_get_length(control_block);
+		dma_addr_t dma = cfg->cb_get_addr(control_block, d->dir);
 
 		if (size)
 			size += this_size;
@@ -653,6 +826,7 @@ static enum dma_status bcm2835_dma_tx_status(struct dma_chan *chan,
 					     dma_cookie_t cookie,
 					     struct dma_tx_state *txstate)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd;
 	enum dma_status ret;
@@ -671,14 +845,8 @@ static enum dma_status bcm2835_dma_tx_status(struct dma_chan *chan,
 		struct bcm2835_desc *d = c->desc;
 		dma_addr_t pos;
 
-		if (d->dir == DMA_MEM_TO_DEV)
-			pos = readl(c->chan_base + BCM2835_DMA_SOURCE_AD);
-		else if (d->dir == DMA_DEV_TO_MEM)
-			pos = readl(c->chan_base + BCM2835_DMA_DEST_AD);
-		else
-			pos = 0;
-
-		txstate->residue = bcm2835_dma_desc_size_pos(d, pos);
+		pos = cfg->read_addr(c, d->dir);
+		txstate->residue = bcm2835_dma_desc_size_pos(cfg, d, pos);
 	} else {
 		txstate->residue = 0;
 	}
@@ -773,6 +941,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	size_t period_len, enum dma_transfer_direction direction,
 	unsigned long flags)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
@@ -832,7 +1001,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 
 	/* wrap around into a loop */
-	d->cb_list[d->frames - 1].cb->next = d->cb_list[0].paddr;
+	cfg->cb_set_next(d->cb_list[d->frames - 1].cb,
+			 cfg->to_cb_addr(d->cb_list[0].paddr));
 
 	return vchan_tx_prep(&c->vc, &d->vd, flags);
 }
@@ -893,10 +1063,7 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 	c->irq_number = irq;
 	c->irq_flags = irq_flags;
 
-	/* check in DEBUG register if this is a LITE channel */
-	if (readl(c->chan_base + BCM2835_DMA_DEBUG) &
-		BCM2835_DMA_DEBUG_LITE)
-		c->is_lite_channel = true;
+	d->cfg->chan_plat_init(c);
 
 	return 0;
 }
@@ -915,8 +1082,32 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
 			     DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
 }
 
+static const struct bcm2835_dma_cfg bcm2835_data = {
+	.cs_reg = BCM2835_DMA_CS,
+	.cb_reg = BCM2835_DMA_ADDR,
+
+	.int_mask = BCM2835_DMA_INT,
+	.active_mask = BCM2835_DMA_ACTIVE,
+
+	.cb_get_length = bcm2835_dma_cb_get_length,
+	.cb_get_addr = bcm2835_dma_cb_get_addr,
+	.cb_init = bcm2835_dma_cb_init,
+	.cb_set_src = bcm2835_dma_cb_set_src,
+	.cb_set_dst = bcm2835_dma_cb_set_dst,
+	.cb_set_next = bcm2835_dma_cb_set_next,
+	.cb_set_length = bcm2835_dma_cb_set_length,
+	.cb_append_extra = bcm2835_dma_cb_append_extra,
+
+	.to_cb_addr = bcm2835_dma_to_cb_addr,
+
+	.chan_plat_init = bcm2835_dma_chan_plat_init,
+	.read_addr = bcm2835_dma_read_addr,
+	.cs_flags = bcm2835_dma_cs_flags,
+	.abort = bcm2835_dma_abort_chan,
+};
+
 static const struct of_device_id bcm2835_dma_of_match[] = {
-	{ .compatible = "brcm,bcm2835-dma", },
+	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
@@ -947,7 +1138,7 @@ static int bcm2835_dma_suspend_late(struct device *dev)
 		void __iomem *chan_base = c->chan_base;
 
 		/* Check if DMA channel is busy */
-		if (readl(chan_base + BCM2835_DMA_ADDR))
+		if (readl(chan_base + od->cfg->cb_reg))
 			return -EBUSY;
 	}
 
@@ -982,6 +1173,11 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	if (!od)
 		return -ENOMEM;
 
+	od->cfg = device_get_match_data(&pdev->dev);
+	if (!od->cfg)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Failed to match compatible string\n");
+
 	dma_set_max_seg_size(&pdev->dev, 0x3FFFFFFF);
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-- 
2.51.0


