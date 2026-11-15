Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1A9606A884
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zNkqWSD9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FW4gl3uc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PHAQXgA7Ag6ugvQaLzYJVeEvbSBqXCAOAmP+o62IFzg=; b=zNkqWSD9JrqsGe
	i+cQnv0D+IZivy1SmyR1rPPMeQ7IZeNUdQDpMQnilLVhEdBvO3FgAO/iQP94GYZSnxR4mAQ0oQ7e7
	2PipYLJJNliGWIkNkKL9Z4/aocTfZVZEhNVd5h2x9G3Nxny/yQ0qCWL3j7MmVczlkMpwoK9nOw+On
	lJnCWUdDw22rLX2YY2tuVPBGvdSWF99wvYjL0O3HLRP13aT/Xnhh5dabQa4YokCV0So70B1Jz3Ehm
	ASY45RGeIUiXab9rx0wz2Uo6iwiVrot5kx/RXG4XXnhpTr3b1YBfF2ebD86HCMbhSRaFjbmtNkCpD
	EVMoV9Iw3+af92vm/nCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWc0-0000000HK3A-24zB;
	Sun, 15 Nov 2026 09:33:24 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWbv-0000000HJzE-0bdo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:33:20 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-86156cf8a7eso2971868a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735198; x=1795339998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHAQXgA7Ag6ugvQaLzYJVeEvbSBqXCAOAmP+o62IFzg=;
        b=FW4gl3uc8oM7JN0YTEA7kVJ6P5Hcuek3bF0Rv6cf2JiVXs7DgEzX6wFeFOj506naxd
         jEI63Bxl9AzVy3jwAB6tApofaPCANKcFqPBokivwm1vcIq6JcJVoYj/XwW2TaRSzjRCx
         8V7RO7gb9S8aFYjCdjMhHA+o9Po2G9vL21/s0bX+2c567FtyOgIY0hP4iHLOvA1YYMvM
         dwCNrkAWpZpTjC1s7LRoSmWnaGLB4Y2eQJtVt2JZqdc5U3/i1TJxLHXnNkgWXvWvrtgO
         yJ9vj1RSrfNZYpVfmdDdhDDwciZnQbsn0cA7yf8Id7r2ANVyQVKATf7Y7Pz4U03u8dYD
         GnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735198; x=1795339998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHAQXgA7Ag6ugvQaLzYJVeEvbSBqXCAOAmP+o62IFzg=;
        b=niR3I7E3FpXnRU8f1n35irtJI9bwd7vCrSH14BcaBzCiPWa1tWYWcb5cQf8nnJ9680
         eU66zX3lyfHBi2h7AbRW4NMSZFiToH36X9hLaGim9VE7Bsqaezs+LugWwE1E6L4CQUUX
         +oYgGTGYWke36Su8LQ0dxEk2YCgDNqSG9aw1vcRvmvUUblCyePSjugTDrRuth2lakW7Y
         kMWurb5h5iDLby/r+8VaLi0NCmG6KCU2/H32/BCM5iWxu0WbcdHvV84i+W9dP0Gtq8KV
         kJJlKcss+UK14ICC2H3hyOOeq57STNpfgoh7V4xUAUNIInxls00cctRHaURW/LNyrMzG
         PpdA==
X-Forwarded-Encrypted: i=1; AL+hErERwHD6aVxdAD6X7zxLXRjnQ4m2oU0VeBAfa5ks31x2WePk8tfqNfeBfMkLLonPKMK3wbHKcauXqgtEq/v+yBZ/@lists.infradead.org
X-Gm-Message-State: APuU4Z9WTt2GhRBan+onqJr/69r58grPFHideM8l1B5m1H6ycDj5YAE2
	62RULKv57BHNoa7Dc3gQeZFVN97+K7t/gpsaPp6uLN87jqr+RbEgciIz
X-Gm-Gg: AYBFou0XKhS7MKhIStWDoohretGyr1gvgJ4W5yNqD5XX9lhBq/ahK4KqIhk46eOos8a
	Iez2sShISTlzACCCsEE9f3PwokZKCs5rFenslwUqqBY0FcqZcKEBWN1sF6aMgpd8TeaXaGvOUMA
	o7Xu8Cau4x4AXXicU1DubAhhgBUNmsnnkCFwDWO4ifpYI+o4erZxifYOzox82aehz0SusZMusv1
	H5SUYM/6KkmietIrlYXj/Qdp3tnLjKUlDsK9qUmdWR3+pj22ZPQfTknP8ck09S3hE73Kf4khzR3
	CAMQXuVhjpyjNJ1egsj7Bfa75gM2duKsS2kGNG0t3sIBljhE1aelTs+prfc/nPIquvj8csiYsoe
	DDkt9KVZ2K0jZYot1RBZa7qmGD+EdjqnnNrpcNEZPegSdvOkJoyM6gRIMDAiUQO0VbB3AoAdb4z
	Hi0tYWQZtHZJ0KVXwH1/DUkIZ4Rn5y7y+4bvjy1r7oVrvVTi2x1Gp+ATIOAumelPIVPZahyp5bA
	L4O3AK/KEAprmaPJxAax8kZQChdtTaXEo6v873waCxV826vtqwDPYM8HvHm3Sqmc9PqyvQW+FNw
	XMmSa6S8l+gBDLB/G/afPfc8mlHcXSI6APOl1yhmH/UlohPGrCBbOAUTBpmYtHtFs2NerhWgPi1
	OQkYD97INzGIzm03RfxThmizEoY1G3RahDEF9GLTISVOsWUcY9VB+jdK2BFbhbvmnmcPtOlHZi/
	nYOMnefTqddc4BAXn/nmyZoN7mJqwRVvMMVmiN3z1vDFXDPubTanE=
X-Received: by 2002:a05:6820:1caa:b0:71a:e9eb:6b93 with SMTP id 006d021491bc7-71ae9eb6f20mr396173eaf.1.1794735197991;
        Sun, 15 Nov 2026 01:33:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:52 -0700
Subject: [PATCH v4 4/9] dmaengine: sun6i: serialize physical channel
 ownership
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-4-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_013319_229481_F7152028 
X-CRM114-Status: GOOD (  20.53  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
termination reads the physical channel before taking either lock. The IRQ
handler also takes an unprotected owner snapshot. Termination can miss a
new assignment or detach an owner while an interrupt is about to complete
its descriptor. A sampled IRQ can also be applied after reassignment.

Protect physical-channel ownership with sdev->lock across allocation,
interrupt handling, pause, termination and residue queries. Read and
acknowledge IRQ status under that lock, and allocate and start each pending
channel in the same critical section. This also serializes updates to the
shared interrupt-enable registers.

Nest vc.lock inside the device lock when accessing descriptor lists or
updating cookies, including cyclic notifications. virt-dma takes vc.lock
independently when preparing, submitting and completing descriptors, so
the device lock does not replace it. Client callbacks run outside both
locks in the virtual-channel tasklet.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 67 ++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 0b8e5deb2252..5d39a2c0c2e1 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -217,6 +217,10 @@ struct sun6i_dma_dev {
 	struct clk		*clk;
 	struct clk		*clk_mbus;
 	int			irq;
+	/*
+	 * Physical channels, pending list and registers; nests outside vc.lock.
+	 * virt-dma also takes vc.lock independently for its lists and cookies.
+	 */
 	spinlock_t		lock;
 	struct reset_control	*rstc;
 	struct tasklet_struct	task;
@@ -526,11 +530,11 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 	struct sun6i_dma_dev *sdev = from_tasklet(sdev, t, task);
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
-	unsigned int pchan_alloc = 0;
 	unsigned int pchan_idx;
 
+	spin_lock_irq(&sdev->lock);
 	list_for_each_entry(vchan, &sdev->slave.channels, vc.chan.device_node) {
-		spin_lock_irq(&vchan->vc.lock);
+		spin_lock(&vchan->vc.lock);
 
 		pchan = vchan->phy;
 
@@ -547,10 +551,9 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 				pchan->vchan = NULL;
 			}
 		}
-		spin_unlock_irq(&vchan->vc.lock);
+		spin_unlock(&vchan->vc.lock);
 	}
 
-	spin_lock_irq(&sdev->lock);
 	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
 		pchan = &sdev->pchans[pchan_idx];
 
@@ -559,31 +562,20 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		vchan = list_first_entry(&sdev->pending,
 					 struct sun6i_vchan, node);
+		spin_lock(&vchan->vc.lock);
 
 		/* Remove from pending channels */
 		list_del_init(&vchan->node);
-		pchan_alloc |= BIT(pchan_idx);
 
 		/* Mark this channel allocated */
 		pchan->vchan = vchan;
 		vchan->phy = pchan;
 		dev_dbg(sdev->slave.dev, "pchan %u: alloc vchan %p\n",
 			pchan->idx, &vchan->vc);
+		sun6i_dma_start_desc(vchan);
+		spin_unlock(&vchan->vc.lock);
 	}
 	spin_unlock_irq(&sdev->lock);
-
-	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
-		if (!(pchan_alloc & BIT(pchan_idx)))
-			continue;
-
-		pchan = sdev->pchans + pchan_idx;
-		vchan = pchan->vchan;
-		if (vchan) {
-			spin_lock_irq(&vchan->vc.lock);
-			sun6i_dma_start_desc(vchan);
-			spin_unlock_irq(&vchan->vc.lock);
-		}
-	}
 }
 
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
@@ -592,9 +584,11 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
+	spin_lock_irqsave(&sdev->lock, flags);
 	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
@@ -610,14 +604,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
+				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
 					vchan_cyclic_callback(&pchan->desc->vd);
 				} else {
-					spin_lock(&vchan->vc.lock);
 					vchan_cookie_complete(&pchan->desc->vd);
 					pchan->done = pchan->desc;
-					spin_unlock(&vchan->vc.lock);
 				}
+				spin_unlock(&vchan->vc.lock);
 			}
 
 			status = status >> DMA_IRQ_CHAN_WIDTH;
@@ -627,6 +621,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			tasklet_schedule(&sdev->task);
 		ret = IRQ_HANDLED;
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }
@@ -933,19 +928,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
+	spin_lock_irqsave(&sdev->lock, flags);
+	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else {
-		spin_lock_irqsave(&sdev->lock, flags);
 		list_del_init(&vchan->node);
-		spin_unlock_irqrestore(&sdev->lock, flags);
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -980,15 +976,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 	LIST_HEAD(head);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 	list_del_init(&vchan->node);
-	spin_unlock_irqrestore(&sdev->lock, flags);
-
-	spin_lock_irqsave(&vchan->vc.lock, flags);
 
 	if (pchan && pchan->desc && pchan->desc != pchan->done) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
@@ -1009,7 +1004,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		pchan->done = NULL;
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
 
@@ -1020,19 +1016,21 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 					   dma_cookie_t cookie,
 					   struct dma_tx_state *state)
 {
+	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	struct sun6i_dma_lli *lli;
 	struct virt_dma_desc *vd;
 	enum dma_status ret;
 	unsigned long flags;
 	size_t bytes = 0;
 
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
 	if (ret == DMA_COMPLETE || !state)
-		return ret;
-
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+		goto out;
+	pchan = vchan->phy;
 
 	vd = vchan_find_desc(&vchan->vc, cookie);
 
@@ -1046,9 +1044,10 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 		bytes = sun6i_get_chan_size(pchan);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
-
 	dma_set_residue(state, bytes);
+out:
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }

-- 
2.53.0


