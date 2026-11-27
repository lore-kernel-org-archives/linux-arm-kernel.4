Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B97606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nr6dwK0z;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JGOq8y3c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Mm85sjHJqArC7LWLKyY5r/gaSqHpUQcpDUwxBHHWLZY=; b=Nr6dwK0zrKnRmr
	gDD5M5dDbIx3FWROCP7jDKyanfGE+zh+8h/3YkY2CqVeObb71vwtUOEtLBD7yT8gxoVTMUU/iNUR7
	TzSw3IDS6hlyRzOUwSCTvUijXpwu8G3JBrj18pIxxZ3N+aZntJem3eWAkrakeTFKZBOa/ez2e2V4+
	38vaXvNaBz/KS96xPkm5Wun5PPgX/xmMyd47Jn8HWpNK+eCm+mRI44nAsfsyB7rEV5B5NDlH0Hcxg
	+f/eAkGKzuRJ1AvE6cuL9b/xKbW7GRJl4ZmbpPjDVhheTEC3LPhJ1T+NovzKFYuyqONbOFnxdrVEV
	gBNHF64r8FsJY+MhG6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvx-0000000G425-0ovL;
	Fri, 27 Nov 2026 12:20:09 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuup-0000000G369-1WEz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so26069495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781938; x=1796386738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mm85sjHJqArC7LWLKyY5r/gaSqHpUQcpDUwxBHHWLZY=;
        b=JGOq8y3co/9fu/AwXWIPBOAinTBQ4X2waCsbeteMibvLCkjN8TzWbZxsAJyr0JRXr0
         L7nZuv48kPLqEYbB9u5n2OC8dHLuyyCajXZwFsKVSLfvpSVAcEHu9d73GEYibYRrjI7F
         GtNlGW60ZakzDk8/6MSZXq3zdFiwkVAYbHQvfbJdz2d2mjgiRZUSRCo3aMPlALOQBZWD
         IijkwWx8vKS8Av5IGifFde07thYTt7jx243IkbyPJEuDFuR6fgqWPeGxryqEW0eo/JlW
         M85So09H+XALqaTQG2E5Yqrl4fOiJI6rv6LLgsoDoXMBF9IcDIXh69hvrPlhpHDKx6gA
         t21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781938; x=1796386738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mm85sjHJqArC7LWLKyY5r/gaSqHpUQcpDUwxBHHWLZY=;
        b=0iNSzH3n1Yo33EKDVpkCz+NpXdjgMKKTIUuAZbZDposp+GEeHEbVUP+FmEFb0N2dkT
         pTfWrdFKEzBuVeYnCLL6JElAAFq1byS167ihV2RDYOx7+9SRR6NSC/QCch6plvzFctTo
         GZmClMKH5qo2ZrUK1IaL8ica4gav8JkGMgnoeRly39nmdahu+I/AMx01zM3v8TYowGpH
         6BDHkDCFRJft6O8xvjEbGmRggjUAHjYBhVbGIXjanUlMd9edNLgc1DhTf04F0JLdAyA+
         Qy9pOHiT7ibiTAV8UNTiN19+usb18oiDgP7Wj+TFBXln3Qa2k37j5ndbQX8T7UKJfP2s
         O1ww==
X-Forwarded-Encrypted: i=1; AL+hErFY2Cjg+dEM6n41FZlHAb/PpouCWSd5xm7NaewpbLt6XzFTVALVesvw/pUo4+miSDJXGPFwcWynx39FHBz0gshU@lists.infradead.org
X-Gm-Message-State: APuU4Z8pjB0M3E2xqbuzTvc8ul0rVM4BxyYnwErv1e9Q6ZulqJLViJtP
	a/OccfhMX9FRsc+lDQLKiS4DwdRGfzn5VQPvHiOP36y14NcOTbPWPxcfAcFADsM7OO8=
X-Gm-Gg: AZFdTZcGmTPhC+Iyb4SWfMqW3eBnnLKTrdpkbxUARx6NeVCgiWM8PZ77PCYmMP4FAPX
	xKdOa5r8M2amLp1sfBAlzF7a/w4trZyvI1rSNAgWJB3gvQ9DkZIav6RYzL3e6HxOBRZtBkuf7Tb
	i+pePEn7+ecd4WnPYL41OZrv4xxQX1wjSbLeGc2nlsN0FX9riaAUUasQqAcbvVxXQzryt04pGjC
	4j2iIO2i9JtAKQoXFzX9pforc1/FfHn1n9T8Lx63uaHoybOJfSa7Hnp2LZwAPRyaoJKpKvIYhru
	lgdSjNS8Pi54ilOKSQpTEpvhYUPNsNH8hOoBPP9kjYE9FESVY7H9bSvrkGLnvkmOcFskIy52Jdc
	yf3S/OxNXRDvoUX/A81oZnqIv2WPO6U7oCJnESYM3joVfHTbnyONHczHVjV/DNFHWXJD7X9UFIO
	TQ4Bfw0Z7GHu1XYn+SeX8KTnZkih8Io9U0GjwVRAzJR/T9vfKJnA5D4IMk3vRrDf/NzUm+tRaOX
	i1KY17vD4aS1K69xlul/seR0FzFbbZtSmmKKKKM9x4CZmpFxPwWZ05NJIoXcrnoAL3oOHJzvqx3
	931hhb+y4eDAYKOlLB7wy5fI2xNE
X-Received: by 2002:a05:600c:6708:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4bb88940848mr434618965e9.33.1795781937757;
        Fri, 27 Nov 2026 04:18:57 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm566215005e9.0.2026.11.27.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:57 -0800 (PST)
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
Subject: [PATCH v4 12/28] dmaengine: bcm2835: pass dma_chan to generic functions
Date: Fri, 27 Nov 2026 13:22:02 +0100
Message-ID: <20261127122236.4976-13-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041859_492035_CEBB93E0 
X-CRM114-Status: GOOD (  18.56  )
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

In preparation to support more platforms pass the dma_chan to the
generic functions. This provides access to the DMA device and possible
platform specific data.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 416d9882aeb2..42a7e6eaff9f 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -305,13 +305,14 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 	bcm2835_dma_free_cb_chain(container_of(vd, struct bcm2835_desc, vd));
 }
 
-static bool bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
+static bool bcm2835_dma_create_cb_set_length(struct dma_chan *chan,
 					     struct bcm2835_dma_cb *control_block,
 					     size_t len,
 					     size_t period_len,
 					     size_t *total_len)
 {
-	size_t max_len = bcm2835_dma_max_frame_length(chan);
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
+	size_t max_len = bcm2835_dma_max_frame_length(c);
 
 	/* set the length taking lite-channel limitations into account */
 	control_block->length = min_t(u32, len, max_len);
@@ -421,7 +422,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			if (bcm2835_dma_create_cb_set_length(c, control_block,
+			if (bcm2835_dma_create_cb_set_length(chan, control_block,
 							     len, period_len,
 							     &total_len)) {
 				/* add extrainfo bits in info */
@@ -489,8 +490,9 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	}
 }
 
-static void bcm2835_dma_abort(struct bcm2835_chan *c)
+static void bcm2835_dma_abort(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	void __iomem *chan_base = c->chan_base;
 	long timeout = 10000;
 
@@ -517,8 +519,9 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
-static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
+static void bcm2835_dma_start_desc(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
 
 	if (!vd) {
@@ -537,7 +540,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 {
-	struct bcm2835_chan *c = data;
+	struct dma_chan *chan = data;
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	unsigned long flags;
 
@@ -571,7 +575,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 			vchan_cyclic_callback(&d->vd);
 		} else if (!readl(c->chan_base + BCM2835_DMA_ADDR)) {
 			vchan_cookie_complete(&c->desc->vd);
-			bcm2835_dma_start_desc(c);
+			bcm2835_dma_start_desc(chan);
 		}
 	}
 
@@ -599,7 +603,7 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
 	}
 
 	return request_irq(c->irq_number, bcm2835_dma_callback,
-			   c->irq_flags, "DMA IRQ", c);
+			   c->irq_flags, "DMA IRQ", chan);
 }
 
 static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
@@ -607,7 +611,7 @@ static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 
 	vchan_free_chan_resources(&c->vc);
-	free_irq(c->irq_number, c);
+	free_irq(c->irq_number, chan);
 	dma_pool_destroy(c->cb_pool);
 
 	/* do not leak the flags of a DT client to the next user */
@@ -691,7 +695,7 @@ static void bcm2835_dma_issue_pending(struct dma_chan *chan)
 
 	spin_lock_irqsave(&c->vc.lock, flags);
 	if (vchan_issue_pending(&c->vc) && !c->desc)
-		bcm2835_dma_start_desc(c);
+		bcm2835_dma_start_desc(chan);
 
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 }
@@ -855,7 +859,7 @@ static int bcm2835_dma_terminate_all(struct dma_chan *chan)
 	if (c->desc) {
 		vchan_terminate_vdesc(&c->desc->vd);
 		c->desc = NULL;
-		bcm2835_dma_abort(c);
+		bcm2835_dma_abort(chan);
 	}
 
 	vchan_get_all_descriptors(&c->vc, &head);
-- 
2.51.0


