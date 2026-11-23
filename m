Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tlWnAOdS;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZOvPiFo2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Zvqnrlc7MSEtVSmfRRlydngWRQ+r+L5CkYiMb5jwDlo=; b=tlWnAOdS18IQtD
	IUfhavAzhEKP27OXukx6G9dcmkVXlHMta1xGlbAYAdrh4A5Y+4OALAZNwaFfJpXp0MNkOiygDvgJA
	yJfm/V6c8G6XCq9WHtxrEg0+1WR8928HJcsheRnI1zRlt/TMpaWd0X2FUPZaYzoU0FGARe5qcFrh6
	+e2hxuQyy948uarfnUSMDYtJU6OEsLU6QLFDCbBX/TfWx/gdnatqWFPv10B/2DFsdhMnjZU7XGXdl
	Ri+iXihK5imxk4qIp8Zk4tPbjmpfNz8wywxVQnjQo02GagNA1e89CeupACe2GHL7H2UldTUvgU9Aj
	Dt2puVxR628DV7ck7D2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVRb-00000003pL8-3o8a;
	Mon, 23 Nov 2026 14:54:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQV-00000003oVF-2Nk5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a42b34e930so2984884f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445630; x=1796050430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zvqnrlc7MSEtVSmfRRlydngWRQ+r+L5CkYiMb5jwDlo=;
        b=ZOvPiFo2WoQ4MyX2lM7lFdtPBEQSiEVJvciJvswBoYubB6vww0yJo7/PnUQfaS2aCh
         7Ochpj0G+GDeFSo7HIxpuoADMBH8C2ALUYLqlbO3tpj0yudpcpkVj7fLKld1fwpAoNOG
         SZr9phSJoutW4dnk4RlrDhSQnpgSHsZ4i9b7sE+qDzPk6TJExrtkXCL+HhZ0mRmHHUDv
         uWnLn+EJLICaXomExl5XOdBJWfjqtUoID0r3v8lGNGyrG8ja9y7npdvZkuLdmtF+btwK
         jOf9a7df0hKKUDjuTrP7bYUhRebxEpOklV88fK44jeHKBleDaMlj+BrVvlraAJ75S2Ml
         utEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445630; x=1796050430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zvqnrlc7MSEtVSmfRRlydngWRQ+r+L5CkYiMb5jwDlo=;
        b=QAKr0FEgDggal7JP/mU75ZKHL/bgZyPzgvQkk0/5q57ZtxLw2aJav8JPI+xT2jw6AF
         x5RsCel11SpGFEWJ7zywoNhlcpzvtwsArb7K975jLCJA92tTzNdmARbm+Zu88DVigIWi
         z2GnaKophLBKr54R/RCOEqHJO86bXE4JLMKvlqCokKnVXedNT7LdNoe+t6n/yMkuiOXg
         jsjnjZYydKo85e0IO2Lbn5VKEFWP2/kjnUeMX7gY9GcUv7QQbDXEVr6W9a3EFvXGpyD5
         fjGpn1aXUk9YpRdP+FrGhhlV4zknTyQDRcVdBY3XDzTnyEK+uRRAeURr2geMkQN9daBI
         EqOg==
X-Forwarded-Encrypted: i=1; AL+hErGSf70qQRqRDbpaI/IjDdwostSYhXw60TQNwztOBvkHZQ40c3LJrEfQRgwHrW2vs6UHk2n0tz5tx8s/LnegC/WH@lists.infradead.org
X-Gm-Message-State: APuU4Z/8tF5Hn3vVAENIWvcqxWsU/i0l6SjloPaPN9T3H5dIDbMFfDG+
	29dFBz84Ke1qWXVi8KVKYGWKILsjmRJ+8a38HBO5W7/o49WJTpLWVNJz9cI3+UNuqXw=
X-Gm-Gg: AZFdTZd0ByiBfKYukn8KVLF/nQHGgMSZvZ/N8OwbOksMpcVfUqzrHJ3Kv9ObaJ9gMDm
	oQoAHNDMdItPIZyggM9kTS85fIHAcSsOO25OGw/VMdOdIm+0oPnPh9V83VHR2cGIJYnOSWuPsqU
	7/+jopq7NhzuB/mCgzLsZXu/Fmeg6F0+YXINLfEnJfrmbNNIJYNq2btitj0FI9Ysgb/FhVl8jpt
	xgBq7iyWyUEn5g3OiHNnW3koOi/W9/WhuKsEqo+X7q8qa+F5U0X5WnNdqap1UJMc9E6yqi70gEi
	7AACrwrMH9CF7HeCA5HvlogBEal0FCBxz/dMzAvpRCbYeEdVcz2hdjB5c9Ejw/UDp9TgY360GaA
	eDzEO8ndAhrvqv+o0fDTr9StjNwW3ywee7FgHQ0RjCFB/Zaq+onihblRH5E1mthWb2FDcexcwVO
	nnnAm2cf4JCnFMPpxMHrKDAVzAo1VPa0PHUgvl4teO6dVjqqlWz8MwMM2SqXfa9yhvBKqAXAtxS
	yisFDAwLyf6e0uZYnE1VZXBcilBWyO574PSmNbp/AR3FMbVXXs3x1LH6kFXkqjhjOkvTauoNNCz
	VlBF7HjyCcBDJgbxsja4RFAeQBY=
X-Received: by 2002:a05:6000:2313:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-4abb4d70071mr25023593f8f.39.1795445629731;
        Mon, 23 Nov 2026 06:53:49 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm22090607f8f.30.2026.11.23.06.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:49 -0800 (PST)
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
Subject: [PATCH v3 12/28] dmaengine: bcm2835: pass dma_chan to generic functions
Date: Mon, 23 Nov 2026 15:56:50 +0100
Message-ID: <20261123145728.29082-13-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065351_637408_F3B8A5BB 
X-CRM114-Status: GOOD (  17.93  )
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
index 1d322cad4ca3..d048cb00ce5d 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -307,13 +307,14 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
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
@@ -423,7 +424,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			if (bcm2835_dma_create_cb_set_length(c, control_block,
+			if (bcm2835_dma_create_cb_set_length(chan, control_block,
 							     len, period_len,
 							     &total_len)) {
 				/* add extrainfo bits in info */
@@ -491,8 +492,9 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	}
 }
 
-static void bcm2835_dma_abort(struct bcm2835_chan *c)
+static void bcm2835_dma_abort(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	void __iomem *chan_base = c->chan_base;
 	long timeout = 100;
 
@@ -533,8 +535,9 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
-static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
+static void bcm2835_dma_start_desc(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
 
 	if (!vd) {
@@ -553,7 +556,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 {
-	struct bcm2835_chan *c = data;
+	struct dma_chan *chan = data;
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	unsigned long flags;
 
@@ -587,7 +591,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 			vchan_cyclic_callback(&d->vd);
 		} else if (!readl(c->chan_base + BCM2835_DMA_ADDR)) {
 			vchan_cookie_complete(&c->desc->vd);
-			bcm2835_dma_start_desc(c);
+			bcm2835_dma_start_desc(chan);
 		}
 	}
 
@@ -615,7 +619,7 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
 	}
 
 	return request_irq(c->irq_number, bcm2835_dma_callback,
-			   c->irq_flags, "DMA IRQ", c);
+			   c->irq_flags, "DMA IRQ", chan);
 }
 
 static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
@@ -623,7 +627,7 @@ static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 
 	vchan_free_chan_resources(&c->vc);
-	free_irq(c->irq_number, c);
+	free_irq(c->irq_number, chan);
 	dma_pool_destroy(c->cb_pool);
 
 	dev_dbg(c->vc.chan.device->dev, "Freeing DMA channel %u\n", c->ch);
@@ -704,7 +708,7 @@ static void bcm2835_dma_issue_pending(struct dma_chan *chan)
 
 	spin_lock_irqsave(&c->vc.lock, flags);
 	if (vchan_issue_pending(&c->vc) && !c->desc)
-		bcm2835_dma_start_desc(c);
+		bcm2835_dma_start_desc(chan);
 
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 }
@@ -868,7 +872,7 @@ static int bcm2835_dma_terminate_all(struct dma_chan *chan)
 	if (c->desc) {
 		vchan_terminate_vdesc(&c->desc->vd);
 		c->desc = NULL;
-		bcm2835_dma_abort(c);
+		bcm2835_dma_abort(chan);
 	}
 
 	vchan_get_all_descriptors(&c->vc, &head);
-- 
2.51.0


