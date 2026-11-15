Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B415C606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NNSxmOoO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1y5OD36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=; b=NNSxmOoOqMoPdm
	ACJWWiUw++bQNFIwbBz8Gz1JDLJpkWUhaUSat/+1ydj4yOda/bMzLgmzSw1vLPLCDRWZdmAjxGgky
	3tzhEXqPvD/vU7VGc01EqqdzuCS3NrpLs5ZR8gvhJUHJSQ48TdWkKrzs7FH/ETa0TCOx8wErI5ef9
	ydiHE9OlAIDFqz/w+dqb8esmTJc3fNkX1qr9SsN5slYanUukGFzCNJiPgDRyISOscugRMGyWLDyx9
	MM/1TQ4NhTU+zXK77j7PAQOp7bKmXFkqfOwO/J0KvImlVIynKF/NB4/ynuNImpZhGG9ata0/EVEjh
	M1uqBHC9ugNGsMZTENmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWCW-0000000HIO7-10nl;
	Sun, 15 Nov 2026 09:07:04 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWCM-0000000HIJ9-0neP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:06:55 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6d68de53053so1523588eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733613; x=1795338413; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=W1y5OD36AbEIudhhXpZpiivRE48wAMoKlmamMHuzwZyq/q32/GcVXSYJsk3rI4ddsR
         DK0aI7nXEZy3pAaCBrhU06yGKJwfeqp2q+RcNpjABdIC55k8PFQozbp2cnSGvpuCCRzR
         Y22ehBXF3H8W5BK7HwPKvPw7mLfylhNMaf5Q7j2gmT2n9/gW+kCjj13VcYm2jqp8p5b+
         EtasRI5oK47jHltbQh7f8TwOraiqpvDBWY0sJRddi8J/ecu0V3pV0W3HAAJyR1vsUVAZ
         BLTxvHmfojec8m5LGbfMkcBsWPL/u96dASX0+rNjmkV1tMBNCkUiLETw5sIAqPCK+xQH
         6dsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733613; x=1795338413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=PnGa+eNtUUNR7Swd7c3Q3pdXKTM/tDIQ2ktPLBQYzoYS7rIRYRz0D+uwG1UwRqkbe1
         kexE9geDlTBsmnhhQ22EXqXDyDyFsGa9zwcY9ZrGiFacLZCj4bjg5ciMhtx8ygiZDLXe
         xgGI28+XYNl9+Yo2EDOkdTjvO1N4TWl0NkHPJ1VrbUXuHiL7mP4fC59F2RPi53OGLYzs
         d7fm2UgzMuC8laj2xUgsC+i8DwXdQJTLrBgjMeYhP5s2wJKo1m0JRvMhRjTbEmaX/e0a
         shHY0CgTFMhUDA/Fc/p/iO4BdsudTf2B5+iemkF4rOu28jsK9X/1TZIO7qkLmBYW5p0J
         o5wA==
X-Forwarded-Encrypted: i=1; AL+hErEG+rzLJJT2hJWgLGUBKM68X6jFmY3La4oGjpISwfWxcTXwL7O6SzgFmgk1iCbgn3v6a7qAazBp7i4xv1fxJnN8@lists.infradead.org
X-Gm-Message-State: APuU4Z8KFUcIpitwsmIJ2zAaRGyGbB8lZmIBNS9SMlNgiNkpdolyK/xc
	49d0avkVJ76zhuEiMclVQjRxvQkIz7i3XuDwD2VaI4c0Hwfoe3KXfETd
X-Gm-Gg: AYBFou2OMcS+5xKRGXo8bASQjWmmQI+ny8ScYCbGOSwvw2pjLDFiiGTBrmV43o4ReTT
	BRfJF2h+OPNVcSq1B79ecW2gwDYXREpK4O5OZn1s9bkYuQNNVnqExInGhw3GzI9daFs0oLajC7D
	l+rUBKIz3X2XuLIrU1hikYNQjr3F6PD02fmVz9uomiznyCIEoUqnwkHPuZEuHMG3OjOAnPXJN9q
	r/YsbbEc1NTO5s+MIgHw5WtTykk1T2QA1AqeKjX+P69BUCTljFGawthxUBZUyhUDRP6QkR5oZwc
	eIgXScTnk2cb4EiNefrt283njyUG0B8IVBDSIl0JWdaeOOY93V87GUF2qB7eGlIOUeGqBhVKwC9
	baGW3k9eJ/vh/bp03y994ulAmR9JFj9V3G3cRk4m17gM6drPuMg7455KAtE5YiMuzjiQ54HPyKf
	GeU4ffQr5oJoY6+WoAy0ROnvQb4gI1mwWA5H2WqvTlGl0d8+tAg6qzaR+yNaa8vNocAt/J6GpLr
	T103W07hHm//f58xT0VCT7ajJp078iytpeZuM2nQ1MwHr2zdg4Jvm9zXLoy8dIR8FqnXXmHg6XV
	3KyAVDQaqHBSYOO44LOPKnJjfJI3rtsExg1PeO8tvGGa63jZHwWziOwKz8joqKlAu/YAONvLGG2
	pP+zv2hy4e14yAM7ShGrfXZgLdY1sgT+EwTsUN0HyeXmTW19Hz1lQS37x/39GNrdSjZceoWxsDP
	eFopeUipLS+U0tqks3EMF0smXTAbHm8hXTCl7bac16TVTnmI7s2ViQ
X-Received: by 2002:a05:6820:1c98:b0:716:d143:4692 with SMTP id 006d021491bc7-71ab50b23e5mr4407570eaf.33.1794733613075;
        Sun, 15 Nov 2026 01:06:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:06:35 -0700
Subject: [PATCH v2 2/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-2-fb7d258702f8@gmail.com>
References: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
In-Reply-To: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_010654_246336_D09B8D84 
X-CRM114-Status: GOOD (  22.23  )
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

A cyclic IRQ queues a virt-dma tasklet with a pointer to the active
descriptor. sun4i_dma_terminate_all() frees it without clearing the queued
cyclic callback or waiting for one which has already started. The tasklet
can subsequently access the freed descriptor. There is no
device_synchronize callback to let clients drain these callbacks before
releasing their own resources either.

Serialize both half-transfer and end-transfer IRQ handling with termination
under the virtual-channel lock. Recheck the physical-channel association
after acquiring that lock so an IRQ which looked up the channel before
termination cannot use its detached transfer state.

Use vchan_terminate_all() to retire descriptors until synchronization. This
clears any pending cyclic callback. Retain them until a new synchronize
callback has waited for the IRQ handler and drained the tasklet. Drain
callbacks before freeing channel resources as well. Termination itself
remains usable from atomic context and from a completion callback.

The shared helper retains all collected descriptors. An in-flight
non-cyclic callback still owns its descriptor on the tasklet's private
list and retires it when the callback returns.

Fixes: b096c1377d1e ("dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun4i-dma.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 225e4a53502b..b0c91dab62f0 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -293,10 +293,20 @@ static int convert_buswidth(enum dma_slave_buswidth addr_width)
 	return (addr_width >> 1);
 }
 
+static void sun4i_dma_synchronize(struct dma_chan *chan)
+{
+	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
+	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
+
+	synchronize_irq(priv->irq);
+	vchan_synchronize(&vchan->vc);
+}
+
 static void sun4i_dma_free_chan_resources(struct dma_chan *chan)
 {
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
 
+	sun4i_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -322,7 +332,7 @@ static struct sun4i_dma_pchan *find_and_use_pchan(struct sun4i_dma_dev *priv,
 	spin_lock_irqsave(&priv->lock, flags);
 	for_each_clear_bit_from(i, priv->pchans_used, max) {
 		pchan = &pchans[i];
-		pchan->vchan = vchan;
+		WRITE_ONCE(pchan->vchan, vchan);
 		set_bit(i, priv->pchans_used);
 		break;
 	}
@@ -339,7 +349,7 @@ static void release_pchan(struct sun4i_dma_dev *priv,
 
 	spin_lock_irqsave(&priv->lock, flags);
 
-	pchan->vchan = NULL;
+	WRITE_ONCE(pchan->vchan, NULL);
 	clear_bit(nr, priv->pchans_used);
 
 	spin_unlock_irqrestore(&priv->lock, flags);
@@ -970,13 +980,11 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
-	struct sun4i_dma_pchan *pchan = vchan->pchan;
-	LIST_HEAD(head);
+	struct sun4i_dma_pchan *pchan;
 	unsigned long flags;
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
-	vchan_get_all_descriptors(&vchan->vc, &head);
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	pchan = vchan->pchan;
 
 	/*
 	 * Clearing the configuration register will halt the pchan. Interrupts
@@ -991,13 +999,14 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 		release_pchan(priv, pchan);
 	}
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
 	/* Clear these so the vchan is usable again */
 	vchan->processing = NULL;
 	vchan->pchan = NULL;
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	vchan->contract = NULL;
 
-	vchan_dma_desc_free_list(&vchan->vc, &head);
+	/* A tasklet may already be using the active cyclic descriptor. */
+	vchan_terminate_all(&vchan->vc);
+	spin_unlock_irqrestore(&vchan->vc.lock, flags);
 
 	return 0;
 }
@@ -1128,9 +1137,15 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 
 	for_each_set_bit(bit, &pendirq, 32) {
 		pchan = &pchans[bit >> 1];
-		vchan = pchan->vchan;
+		vchan = READ_ONCE(pchan->vchan);
 		if (!vchan) /* a terminated channel may still interrupt */
 			continue;
+
+		spin_lock(&vchan->vc.lock);
+		if (vchan->pchan != pchan || !vchan->processing) {
+			spin_unlock(&vchan->vc.lock);
+			continue;
+		}
 		contract = vchan->contract;
 
 		/*
@@ -1138,8 +1153,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 		 * interrupt (odd bit)
 		 */
 		if (bit & 1) {
-			spin_lock(&vchan->vc.lock);
-
 			/*
 			 * Move the promise into the completed list now that
 			 * we're done with it
@@ -1173,8 +1186,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 				disableirqs |= BIT(bit);
 				release_pchan(priv, pchan);
 			}
-
-			spin_unlock(&vchan->vc.lock);
 		} else {
 			/* Half done interrupt */
 			if (contract->is_cyclic)
@@ -1182,6 +1193,7 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			else
 				disableirqs |= BIT(bit);
 		}
+		spin_unlock(&vchan->vc.lock);
 	}
 
 	/* Disable the IRQs for events we handled */
@@ -1276,6 +1288,7 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 	priv->slave.device_prep_dma_cyclic	= sun4i_dma_prep_dma_cyclic;
 	priv->slave.device_config		= sun4i_dma_config;
 	priv->slave.device_terminate_all	= sun4i_dma_terminate_all;
+	priv->slave.device_synchronize	= sun4i_dma_synchronize;
 	priv->slave.copy_align			= 2;
 	priv->slave.src_addr_widths		= BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 						  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |

-- 
2.53.0


