Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30563606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FCZrC5Cq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fpBeyWAk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PuczV2jozFUeyJsXtX8bgTt59XDEa5cGyADBIgej+KE=; b=FCZrC5CqVtHh2D
	iFRQEaLfwyRQDUuBpOiQWRm07jYdB9nf3kK2qCX5nS2zaiCD5tqCTJZ8PsGBXJ2Ru/SH13Nn1zYRc
	tdSnU88lgfMG/Cdd8NgwW5t0v3L2IqSH1lQIfEj3/FwRbh39Ma2O/grfUQTMqp+34NBN+rvQOZw/k
	a1R8mqPMReDylOAMXMO/RmYEyNOkuYJTmtUbCgQGuvpDmhD4oFJwRLa8a5CA9Z/fzfsChB7ow2sQx
	QAzlR3dk9J5NzJgvZxXm5CLzTP8W8ohkbKZvb+djZ1+GscQ+hU61W1N8p+g3lAsVmeShpFnbHnJf0
	9aMRjZeqCbt4g1RnlhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWck-0000000HKWU-2D0G;
	Sun, 15 Nov 2026 09:34:10 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWc2-0000000HK5m-0Xr9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:33:27 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6de2f213b7aso905284eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735205; x=1795340005; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuczV2jozFUeyJsXtX8bgTt59XDEa5cGyADBIgej+KE=;
        b=fpBeyWAkr6551rBBG5nzn/Yl1tzrxUY9MsVaAM+kRNPts1rk7Ph78WvBZ6k2Mo+5ry
         kgvVD70qU/c0JgC7Z4yvYvjOZQY7vZJUINSNq1x1CxH9S9VRvmVQn8D5W/1HU/dPeafb
         OViQDLVdzcHRvT7+U1Td2lIxXMzXLeJ/1AElpcek6+oIfHBSKLRVb6uKzfFIxaStIL4F
         WEXIg3FDCi2AlolTqwTA40NyqaHcfiAGM9pCYkcpP46m9EyahMpb7iCTEpWwJMS8hJ1q
         wHDxDgiljIlaA6GfQgijtkj9VIer3iDgJmg2R4ZRiToVKP48m4mCJhmPaPPJgwTJi0Pg
         B9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735205; x=1795340005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuczV2jozFUeyJsXtX8bgTt59XDEa5cGyADBIgej+KE=;
        b=K3vR/wb7YSmnvHE5JQkyGsHqV1a7Bx0QFNK1NOqFmNlxFQIZNQc4UE8neHUbzvG+Bo
         bPfcVMPFYAaul6AJrYC7uVMQi5IRxGIsP2G6uHl9yCNGxyf/XEbB8TYz7VlktKNa5vP5
         wPCzeABoDn0Ajy0vLqWWDcT8mpq3d5PwpcceeDNyxBFxaD6omxW+1RtEgZ3TVrhvH2YG
         8xnjPUD28Lyf4wDjEfyZD6+RnK0ycunIfX5KyaRLPX8NyFCpB4zjmdC0ghOokizwc7NM
         OfdhHR2X1ICDLaaLACZnvxpN0jhll94PUaFHVmSCTqNBaF0Fh1wxZMukJTARWwQOw5cS
         VmUQ==
X-Forwarded-Encrypted: i=1; AL+hErEvQnWghbHZQTps9PNqY85ZVbbmN44oI2Gm8p1T5psOpjJGJHmM4Bx7ZXETJBhbREBM23ATGcNVjFOcz0onrkj5@lists.infradead.org
X-Gm-Message-State: APuU4Z/F8pVl7tf6bs4X0vvRFX0b5EWvbDNnIzmXT2y/lJwf+39masHe
	PwHOeptWTKXU396ZLT4h95SYgeQExibeNYw6b9Zms7Z7h1SwDW1cgsE5
X-Gm-Gg: AYBFou3Rkwn8MM9qz2pxB669RQHy6kjWVJMMt5n8Yjnt57DPznGaVEcDG5QfQIuLHZj
	v6/lh9/3RDMZznx3nQZGZjnaXAY1jyw+YFpSnxBoUvkKlLt+eH8AhnUNIhrspMi8x6E6rhnkgYE
	sl9SsmMB4bNwMEL66UEs0mKEp57ISZk/lGn/10/YV1QdOs8Vu21Mhe1B10ffOoYf54R8yIIeBik
	d3r30w2e2ShnpdHpqNbtTwkGKwmhvePOnigFacoZu9VyHRPogfYFRESGIKijwdVn2JmiyP2qA4t
	3neXS10Y7dLmBqDwinzrCFp6A27sHBXf5lw7Yz+40/yhRv8M8kfj4//ZoqxXIkMbK+TyBoLPgEu
	wRmiV2j4bxoKcUqMjS8BwYR8wlBHxu+kXBzflQbxdQjM1Y9owg05fYvEZt3HL1SjVQ4BTzVyCtg
	l/Jq81YMgWf2e+pDsctAPD5ZORtpoagTDmm6B10tR9t9j2bqogcl5e1nrIoxF4BE4utzkyWdPQZ
	I4UI1uOMjd+DRx3f6ZGoyANR9chpnX13kCvWHTj9H3kNd0MsxHkJKQfTl+NBq363nEPaxt8s5Op
	Qkv+dqbiRWzM1z9dYfY1UNS5ITZgM8ouU911/nN5edQV+tCvr42qrKBkzVV+Vt4PN5v1LiVUJCQ
	eYYxHSudoWUj6tDF0XaQE21oZvrt+zQy3AZHJTw/DemEWYx/CqUqg2S54vQHI5A36CZULicFd/W
	vQ0BbxmmDSupChnPAwVicdqilPg/DXp0q9i7jRqSML6iD4XKtRyys=
X-Received: by 2002:a05:6820:5604:20b0:716:c2df:d9a2 with SMTP id 006d021491bc7-71ab505077cmr2942230eaf.44.1794735204957;
        Sun, 15 Nov 2026 01:33:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:57 -0700
Subject: [PATCH v4 9/9] dmaengine: sun6i: keep cyclic state with the
 prepared descriptor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-9-043cd476a45f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_013326_199307_B6FEDC96 
X-CRM114-Status: GOOD (  15.34  )
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

Preparing a cyclic transfer sets vchan->cyclic before the descriptor is
submitted. A finite transfer on that channel can then select package
interrupts and take the cyclic callback path instead of completing its
cookie. Merely preparing an unrelated future transfer must not change
the active transfer or the meaning of queued descriptors.

Store the flag in sun6i_desc and consult the active descriptor when
selecting interrupts, completing a transfer and terminating it. Finite
descriptors retain their zero-initialized flag. This also makes callback
retirement depend on the descriptor whose lifetime is being ended.

The shared state was identified during the H616 cyclic UART RX review.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 8f8443e14719..7316631545c3 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -191,6 +191,7 @@ struct sun6i_desc {
 	struct virt_dma_desc	vd;
 	dma_addr_t		p_lli;
 	struct sun6i_dma_lli	*v_lli;
+	bool			cyclic;
 };
 
 struct sun6i_pchan {
@@ -207,7 +208,6 @@ struct sun6i_vchan {
 	struct sun6i_pchan	*phy;
 	u8			port;
 	u8			irq_type;
-	bool			cyclic;
 	bool			paused;
 };
 
@@ -509,7 +509,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -612,7 +612,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			desc = pchan->desc;
 			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (desc->cyclic) {
 					vchan_cyclic_callback(&desc->vd);
 				} else {
 					/* Completion transfers ownership to virt-dma. */
@@ -913,7 +913,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -1003,13 +1003,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		/* A cyclic callback may still hold this descriptor outside vc.lock. */
-		if (vchan->cyclic)
+		if (pchan->desc->cyclic)
 			vchan_terminate_vdesc(vd);
 		else
 			list_add_tail(&vd->node, &head);
 	}
 
-	vchan->cyclic = false;
 	vchan->paused = false;
 	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
 	list_splice_tail_init(&vchan->vc.desc_allocated, &head);

-- 
2.53.0


