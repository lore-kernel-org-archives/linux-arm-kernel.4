Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA621606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=11wq5Vl3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RO5WZQnA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=; b=11wq5Vl36g1K0N
	vynOba3sTlDSk0nPBRc7MefeAhvqSN3wapCn22n1FrpwkL4OiYYa5a0XBB/iQN6PGtj8/UaBkoTlF
	HMOLUK3E9/z3RPSTfRxcNB66H7shMCIVT4Hbozq4LXlTSNCoilcTDxVfk8CiKVufMQV5KnqNSTMm6
	53Gt+2aJiuYojLmkYENzRHNcjh7c4uIKbTawtVUrvL3GySVTqBdPZr23F10jlpMZBwDkUGDugYxw5
	6gvoRoRfUbizCurIsNNgNDi+UosHEYgP/feVnZm+bLW+9CAI2gFXbXGNPlyOmnpzPdtd75jT4iqAc
	0fmpxVKvn4K/Jn4kVKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Tk-0000000CwBL-2cSQ;
	Thu, 19 Nov 2026 18:03:24 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6TX-0000000Cw3J-3Vze
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:03:13 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-71ad2c6491fso715552eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111391; x=1795716191; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=RO5WZQnAay+F97UWEre/yc8YgctJXMR+xppGmciaDC09GSr1Myfk3WbCUuAUH14Wb2
         UddLoMzYcFq8oUwNczvQgJvYV9FPZmnvo43yROXKzy+wXkdJSuCvoqN2+txihwi4mgoF
         xlrJDT+SKj6P+Im8I+dEdWT+WSEUzKHCK0zPcmYg6WjqaVFUDsuLv6kxP148xr4qgOYk
         okIENDiDhlo7+ML7RqQY/Fnf+ZVJA597ixeJiXwWjVtSlSxiaQzZJrCn9wreKOxNMbrA
         z2INJlRvNvjkpaLBIEUFpfbm89DMwO7G6N5E3F3keOR5srR4IAGDhMsGjgOEPkAlyMoz
         r0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111391; x=1795716191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=A0CbTeqVNsUKjNyZQ+j8esGuAZQqTqi8OwRxFrsf7SVnEP13eD1L0j//GpmAys31u/
         8a9m4/WZCUha0WU7YUKcedKlc1P73LVBJsL9vQ7V55q85t3706n4T6RVlfRSr2NrZ57G
         OdihYBeIGC3gRpr7qsaVTFRZvGHiUCIsT3myqYnJpmH8CfL7p1e5ajaM5w85E0mnTyo9
         Ge9+hFPR40zRKWiGYCDUYbxXin4ZmRVbFp2aHZx5PfBc0bFAV3Hec0nb2m2sBzsJcjG8
         YuNfnx4+dKGssfgeQFl1THhQNiko8BnBGOIBa1/g3T02Ed0y31zBThFo59dJJXQ5fAgu
         A/RQ==
X-Forwarded-Encrypted: i=1; AL+hErExRzPhhekwp2/hR4bvj65cNVyADJjv/IM1XpjOyL8WDWUvMWP1ILlEtipOhPn6Bn5oqhXXbDcrJ9BXEnoU8N4y@lists.infradead.org
X-Gm-Message-State: APuU4Z/wU5o5O7axw4DSVkGwq2ZJnArd5T1CFT7Ap8yxMIHROh0ZwP2C
	yHsrMWjSZiWKTCUMACIRHrwUU+Fw20ktHvK3V/0v4m2QudCpAWUaCf6Z
X-Gm-Gg: AYBFou33Kd5/s/babrtLkmQXAijYiZ2tq01uOl+T69VOfcJyIVQNadCzAjFxp+qWg96
	KyoEnkHLrHbHw8cKX5Qp7U7OidOQ4zMMVrnIFhumL4EdvSwAZWssY4uYgbP5holL0uMNcYJPBqS
	s7MI+cQzd3KpJl0B8FQSaMaJvFFWGV1Qt/+Z37xqPbDfF15hUveW2u+oCn18DGnTBzeFN7K9nkn
	m7dpFZmLWgrGPxbBCN4fqdI8YLDN5F4xPU3o3RrBDAJ9kTGDn+jQrGbbVDcbSZz5jAR6sp7Pyeu
	IvGAf8LzayiFC+0VNMTNaYpDVG8Jb8WifY+F64XjwOp+yQwMsuxxMZ7WCxnpROGp6/V/k/AIU6S
	sp8bTYdN7fQUTPAfL7h6KgnkmCkB8csFeGE16dJFnwHvbPgExktGXpmyrhGbN69XoR8O4EvWdfn
	M7530apGJEws3zr/u4RU8wZx5blicnJed6VT00mEKUwTkhcqp/YgjUs5fqmk+SR65HD8+vmpxqp
	DJVa6asxgkT+zwLmC4j1PMLR2PfECV+6sUDKtnCs3HDqawxR8+h/xhstKCOLzyGXV5+h6M6AYjW
	bgYkDUiQ2N+e354ogmQn3hw5MTQNOYWxuh4kzuQueyqi9PGEfnj2OG/z1C8BlUYToN1XXGFJ+HO
	8mC0hAT6HbHUx6CBeXQA599BzNc6Z1aXWOrEq6W0HEPzaY4Sb7samA7NrNM62esnSc/7zuVPTCa
	2Uv6ewSx/Fh58Y2BPhss+REbSF00kSvwAeF0h8ncLjs6zXjXtE7/szhA==
X-Received: by 2002:a05:6820:248a:b0:71a:f035:823e with SMTP id 006d021491bc7-71b3945d5demr218426eaf.7.1795111390594;
        Thu, 19 Nov 2026 10:03:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 11:02:23 -0700
Subject: [PATCH v3 3/3] dmaengine: sun4i: retire interrupt state before
 channel reuse
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-3-3935aef58db9@gmail.com>
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
X-CRM114-CacheID: sfid-20261119_100311_897850_CB5C788C 
X-CRM114-Status: GOOD (  19.61  )
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

The IRQ handler samples pending status before looking up the physical
channel's virtual owner. Another CPU can terminate that owner and start
a transfer on a different virtual channel using the same physical channel.
The old pending bit then passes the new owner's association check and can
complete its transfer before the DMA has finished.

The handler also releases a completed transfer's physical channel before
masking and acknowledging its interrupts. A replacement transfer can start
in between, only to have its interrupts disabled or cleared by the old
handler's deferred cleanup.

Clear both pending interrupt sources when disabling a physical channel,
and read the status back before allowing the channel to be reused. Disable
the sources before releasing a completed transfer's channel. Re-read and
acknowledge each pending event under the owning virtual channel's lock,
before completing or rearming the transfer. This rejects stale status and
keeps the old handler from clearing a replacement transfer's events.

Fixes: b096c1377d1e ("dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun4i-dma.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index b0c91dab62f0..6ecc45cadd91 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -400,6 +400,13 @@ static void set_pchan_interrupt(struct sun4i_dma_dev *priv,
 
 	writel_relaxed(reg, priv->base + SUN4I_DMA_IRQ_ENABLE_REG);
 
+	/* Do not leave pending events for the channel's next owner. */
+	if (!half && !end) {
+		writel_relaxed(BIT(pchan_number * 2) | BIT(pchan_number * 2 + 1),
+			       priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
+		readl(priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
+	}
+
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
@@ -1125,14 +1132,13 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 	struct sun4i_dma_vchan *vchan;
 	struct sun4i_dma_contract *contract;
 	struct sun4i_dma_promise *promise;
-	unsigned long pendirq, irqs, disableirqs;
+	unsigned long pendirq, irqs;
 	int bit, i, free_room, allow_mitigation = 1;
 
 	pendirq = readl_relaxed(priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
 
 handle_pending:
 
-	disableirqs = 0;
 	free_room = 0;
 
 	for_each_set_bit(bit, &pendirq, 32) {
@@ -1142,10 +1148,13 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			continue;
 
 		spin_lock(&vchan->vc.lock);
-		if (vchan->pchan != pchan || !vchan->processing) {
+		/* The channel may have been reused since pendirq was sampled. */
+		irqs = readl_relaxed(priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
+		if (vchan->pchan != pchan || !vchan->processing || !(irqs & BIT(bit))) {
 			spin_unlock(&vchan->vc.lock);
 			continue;
 		}
+		writel_relaxed(BIT(bit), priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
 		contract = vchan->contract;
 
 		/*
@@ -1183,7 +1192,7 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 				vchan->pchan = NULL;
 
 				free_room = 1;
-				disableirqs |= BIT(bit);
+				set_pchan_interrupt(priv, pchan, 0, 0);
 				release_pchan(priv, pchan);
 			}
 		} else {
@@ -1191,21 +1200,11 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			if (contract->is_cyclic)
 				vchan_cyclic_callback(&contract->vd);
 			else
-				disableirqs |= BIT(bit);
+				set_pchan_interrupt(priv, pchan, 0, 1);
 		}
 		spin_unlock(&vchan->vc.lock);
 	}
 
-	/* Disable the IRQs for events we handled */
-	spin_lock(&priv->lock);
-	irqs = readl_relaxed(priv->base + SUN4I_DMA_IRQ_ENABLE_REG);
-	writel_relaxed(irqs & ~disableirqs,
-		       priv->base + SUN4I_DMA_IRQ_ENABLE_REG);
-	spin_unlock(&priv->lock);
-
-	/* Writing 1 to the pending field will clear the pending interrupt */
-	writel_relaxed(pendirq, priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
-
 	/*
 	 * If a pchan was freed, we may be able to schedule something else,
 	 * so have a look around

-- 
2.53.0


