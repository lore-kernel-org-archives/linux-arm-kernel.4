Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90350606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UQ9aOKI1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tABFLUeA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=; b=UQ9aOKI1zCg03G
	742B7SYE7C8z1Vc+3g+LM1olzfpMKr6shwq2dqqw4kVZstty5PO6/4CdT3r1XINuM6f1Ofcv53Q0P
	VM+eExUNo3DKdlun8B4zmleRMFwt8MkoHJhrvt0pZQGq3kdI7/es1u83y3CHgdQM6R5hqySomWv1P
	xlhubJUb2yXOaPs1ua2uJdNX4C7gzFjC+Yntu65GN8tfr74WVVfTQ3HVAl2OT3tMOl0jY+3SHRHtJ
	WXL4tkcS+6h06dnUrbwOQ2/JcXnTXrrIiW5ILT970DpimdhwWhuLHqAtkCp0GZYOEL0Cv0hL7UoiW
	6gzn6QjbeNRavs4O6CNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Tk-0000000CwAp-0lc6;
	Thu, 19 Nov 2026 18:03:24 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6TW-0000000Cw1x-0vXH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:03:11 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6d290b10a35so1208374eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111389; x=1795716189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=tABFLUeAtyPH5M6zwonMXtllqde9Jlwlf40LFfoI21jYP0oqJTvxf6OU6UjkulslJg
         LVSz0iKWY28gOU9mHUgw3swO3Kj1Cv8mGHh8+DfmljRvX8HlYTR5KriEVIXRpeTsuELc
         JbW9qVzshZ+sMUronVccbstkbwkrQGXmLL3r2SzssoHQ7PoPzvXZDwtB1vWwnvQS8+iV
         TmBaz6Eax+RlaP5g7Kt7fn3L9UEXW+xDfkqDpRKHNw2ikkbIZ4aiwLmuLbpkoNlZIyHz
         9GU0Yvz7fkTZebq6u6UBz9uuFvgZveTxtfqlNwdAsLc/ydkFq1IzmSSrbc1mdX5ZBL9k
         PQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111389; x=1795716189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=LsQZVlBX4+YyldufBU8kbcq67RBoFFeVoPwCaAg0uvsrmHBKhXdohOzmiRHHeGCyuF
         V4qHEO0je/ZZQ//ebhVCA0Anfdfksh85b2VhVO6dIkh2AOXnw7f+Xp+B6aG0zzpXhAWr
         OvYrZGx3eLBPR9Sn6U0Icp6+Y17LutpW0Ez0MgHb4R/lWy4OejGmguWlpIEvNQqOiQfZ
         ZQGdUNwsxCNOC+kWGU+xOqj97Nf3kTGsy29Bb7+fupaQ9lhWbo11kskMb5P1pEVWs71m
         7ofqXHnLHqwdLQcV9LCvXmTGfT8NTe/Av8XkEUinbS38S1J2BZBhRqRTu2kfq3Xn5IX0
         mPyw==
X-Forwarded-Encrypted: i=1; AL+hErEjS93Kx6H2RdSBkWKP0pFHknWWUnp/TwCRztRIq42aaP6Go0TbG69vQksUC85Qkq9o7REFOFzm+dnCi2NTFabl@lists.infradead.org
X-Gm-Message-State: APuU4Z9LfeA5LtGAi0XJ8ek6AFNfMUUmG5Qer7ung9y2cMVbC39HeHpM
	Ix4F39fR1PEk4e8PCTh0vk/bKOqa6uADDrr3Acg+BZgAPDxmzfz8hoJs
X-Gm-Gg: AYBFou0byt6YD53xF8c6bKo9EpOXnEIP9nMjnhcLvBtBajawvoM5/KoiBCKrGa14dnw
	bgekTsFTEBu3dOZ2wzIWqW1+5lwOVz6nHnKbHNbOGpMGUBB1LH7xxrNgNqem4nwwfigfopwKQHr
	cPxcuGxMtK9EYbeGjoA5WvvdGoeUZ5GZBXF+jKua3KPYLl/uYjp1Q7HE9b6iKNE4sr/53J35iVd
	u8WfikLTr2FcC4Tu7p4Qp6HOZ2TcyziGMFJDerzZI4T6FSdpJuxJgHlkcs7J4oHrK4iSasssedX
	YhkVVZJqKvjz4M+dLti9GXgQ0qwFfCDnOl6iMzeyrACK8pNqDAXlB7KrVxLNngOuK0Etd68T13P
	VYPhj7WKdcFu35bTP49BibRLvvcOmD5OBeJ9YQ67HKoJ35wfBLi4VZveRk96jmlZ8ph9bv+z8jZ
	eVFhZ42TpUsgvc3TwOk2+sMW67sfWXqBeNakrc3cL+WGBdNn+0jUTWzKUTl6FP4sYGpsHJ/d2tc
	lBHzmrjIiR2ZhawoD8p+cruC3ERy1jM5A5MmnjYVV3BorgPyJljrliMf5Oprgmss5655418aza+
	kT34giBJhacsonPflQa/iqyudbRjqrQ02hloW70IHgEOHblWFqjEE/1Syx77KpigE/4fSTlPxuy
	FXENcIIoMK8SXp6FklF7lfsqvMze+4Gz8tcOVCVwF0jYDFIj/99CIAqdDZbvy2FMwU04sDsm3AZ
	2Gx05AmuGYCzff/EDtB1Vf63KPjq6P8RUZbyMZA7I/IYY2STKmhR7Y
X-Received: by 2002:a05:6820:614:b0:71a:f794:49c6 with SMTP id 006d021491bc7-71b39566d0cmr341259eaf.69.1795111388904;
        Thu, 19 Nov 2026 10:03:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 11:02:22 -0700
Subject: [PATCH v3 2/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-2-3935aef58db9@gmail.com>
References: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
In-Reply-To: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100310_281019_30FC7102 
X-CRM114-Status: GOOD (  22.21  )
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


