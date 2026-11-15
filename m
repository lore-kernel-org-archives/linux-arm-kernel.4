Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF72606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2zqimFM7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6qATJdq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=; b=2zqimFM7iieaQG
	eUunZkVjHku1O2BHyV97+vt/PJZz8c7N+RkRjHkWUvWcpuzj5ANTOiqESgmzrUGoDwpG0oMgGQiwV
	7TFjTzqmnOwuNzYlyRRk+kODKYy/1vo3qScuS7ayFAsZpHbHmrWUw5kEKBxEn+b8Ort+b8ta9W4No
	rrg4CCcKjw2XsIHWuLvSjwurFzf3aYaGlXhif5W7yEI4zWEUBkBihamsQUeEbWlIWaj9EdnJMVG0U
	qgLNk8axRnOQIVrkjVaWzxC0ryHKvp236q0DHBymhTgrAau5oRzu0kJkjGxwLDIgLfwGkAKQ5VTiL
	PSabA6wjxBL/G/vNuVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWCW-0000000HIOU-1SXB;
	Sun, 15 Nov 2026 09:07:04 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWCN-0000000HIJg-13FP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:06:56 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-71acdd32a53so425529eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733614; x=1795338414; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=U6qATJdqP3ptvC3NyFsm0VtuAe+jFExp5ibK6CBiwTJId9Au5iBQRXFSyY61c0w6LR
         ODYTyVfIEadYtVDJ/08lSiLes/Q9ayW5Mhvkp+TXUr6NHzycwlYuqgwKuzmE3eZGDmhY
         wBt72a3xyRhP6zim9uElfvvlf042yETDdpcaP6y5/6bk0wuglE0Y0Q0DjbT2i+srYHGB
         kRJkZjx4rKJZKkZqZpQtiSw6VPyTwPNxNoW8R3GwtogHJ63btbEsgP7GZexUF1lw5xj4
         llbUXpGkiVq5bkS4J9CmHynEfyJiuL5bfkzN1c/IFUCKvxD1k4TZYzDDKbS510cwUqMW
         QJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733614; x=1795338414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=yI83K3ffD0Aao615VyKMS2O0CQMITzE1MPnPJN2PgANEGWnk4dPd/vOXZMIvbLk63M
         Jopx7DslnWmBjGV+Vap8hAh0B79JD6aCyW9Jfi2F7ZIsNsln6zJitLK3z7L91SscfMC0
         2uHahnVCsIWwoF/vnZeETtPL5ezOIxiyCFboSU+Fku23DQu2qdmWbnoxYbqHBHe771cF
         G9JAEJsBCO1ChiH2gh6C+hp8aN4ywt27IWShTsIdxRqeQp/ZD45n8P84ip599LRG61zC
         C2ZHvyi+rm/ATAsf3MelvRFY6M6F2CIV3kNfMTqiccwVNsKJvrLWvIT/CDiSjt3+jBps
         mCjg==
X-Forwarded-Encrypted: i=1; AL+hErG+ANCF1q+6Vcp8L/UoaETl5tJJmHh7sDbb1c3WId1EbiUi2oOzi3c1g7balNTIeOYnTLZqnED9xkA9EBnXQipV@lists.infradead.org
X-Gm-Message-State: APuU4Z/LXY6y9BDlABBLNU/R5vGqITDUHI8I72uu6NXMGHbKAgEVByqw
	F2Q4zSnLUHc8578KaA6fIp5HOo5ki459KQXokMKCr6c2GR9u1EAVn8q1
X-Gm-Gg: AYBFou3kJScJiOoYlFn94gm/vQEtFo/R1bHO2ovqtBMDYfZm0owNJWRj98fPtoGW0yj
	ads7eivvptRAL/z+HfOMNcBSZiUHLMQL9zH29jzWni+AwkvpDr2guTn/wmvFBjVE7IWUwCBV+dy
	VHuiiJzNNqTGzZPvC1Wx2wfBit6IQD0DmsMTPYRakcSK59O5myCCJCnjupRWr3onH1ngc7ZEaRO
	aJT3mDzpOgUPJOL8KtGNUYaCWpM1Pu2uZhgp4Y3GgNoKvhRlCDpU9deNnVdPCSz0DuOnYrhyA3N
	RVEbqfBWsBNbovfvOIFxZGfWwQ3dFwGdCbgONjoWfUl0OrzOvovtCPI0y69z77OtRjhkWG6BD1k
	ATnaZ6zS8Fi/amyyIcyYO/FoRRJ/EiiOtJGWClQDS+oQ1gzvBNvRsEEUavintIr3w8Mr6ClFJzI
	VIdC4tzMNw2Dmg2+7fQeNFJlt0UiLa4/WOQNwcaVoO1dVWQIhuD6VsBBXCHthuJKyN4DhP1mmHs
	HTitjOSHBvvJjWDCyGgRH2KVORU15IX0Ghi0XSff9JWeB23SS4zvPPwSuavrILgNLsIlKmKV58a
	ynxlvjCKmkQsUjKL475wrBuy8MLvAwDdebOvxK9FyaHmLIzh8pLnoDqqgI2AKw+czeikKR6jgnz
	UPbi7e6+aAQ+hbdHg7G3DXgT15sBxCI4LB555CuAhBW4qK2eKXJADH0FQbi0de0SLnPyaGhK6xE
	RS/1g6PLIKAxuvimGT2/8ibU3M9r1VsHih52lcQmRAEl4ONELdUVBf
X-Received: by 2002:a05:6820:1caa:b0:71a:e9eb:6b9b with SMTP id 006d021491bc7-71ae9eb6f5amr480181eaf.21.1794733614395;
        Sun, 15 Nov 2026 01:06:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:06:36 -0700
Subject: [PATCH v2 3/3] dmaengine: sun4i: retire interrupt state before
 channel reuse
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-3-fb7d258702f8@gmail.com>
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
X-CRM114-CacheID: sfid-20261115_010655_310612_CD2B4474 
X-CRM114-Status: GOOD (  19.52  )
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


