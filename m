Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84393606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rnStJ7h2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6UTD+gu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ykELsWqv0rr01vGMcfJTxNz9WxlFG0XTipq7Ly2y7EA=; b=rnStJ7h2hHchoF
	FgrgB0iJLT53FHy2NQY97ftDVb4IcRtcfe+ZjLQJ4QCX7tVRSjee1Vc/5G3r2VYuJ5HqXH8uDIQRU
	GNDLJdiJhXhfrdUyy0KmiVLCEK8U7eQtAe5L+IO6/wEcJ8XXCJMEYl71Y6QKMbKfPt8sroHICkuXu
	kAdunCefdap9lQeBBBa9T6DHmVmAkztsr7H1ueig1TUEycZv8dfwQPaMf7/X0BvqUWttCmLkSUU0+
	DxAIt4dDdOqYK+OM5z/PkPIqTq/W2hlHxS8VzNx6DZZDwlSTfpgz4SZUZCkFh0U4JQkGgzCzFO5Hl
	R8dURT9BKeTEWwStNPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZfC-0000000GavT-0iNK;
	Sat, 21 Nov 2026 01:13:10 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdE-0000000GZIF-1IaH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:16 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-4b28d9537bcso999582b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223467; x=1795828267; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykELsWqv0rr01vGMcfJTxNz9WxlFG0XTipq7Ly2y7EA=;
        b=y6UTD+guZHnPvU066aZIor/7AX1Rw8K+H9SCyRtfUqeDZm3EQQPPpzMXzeAmj13doJ
         wEjhUIuJ+BGUwR/QvpFibsDAtFV+6qILg3zJtDx8EACJKW/taEN0eP+LUTZPEZZ2113L
         KNEW5KD7W/olVzeD+VABHkNfOC0Uwb0aj+7Oddn74xDtf4JFv+clEnps4U61u3OzV2CY
         OcmzMOXT88gu6L7yZkHDaxbKEWrOm5lyTQLPctAwTLdhLf7VBVXwdeUdw64OWYxZYyE6
         xrPRvx2T3pV4Icxj9wLKtCoEOxQkNMBuQ7Ikiy0X61j7DcA+e8O2QKFoAH6CLK6q/RG3
         9aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223467; x=1795828267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykELsWqv0rr01vGMcfJTxNz9WxlFG0XTipq7Ly2y7EA=;
        b=FvT0BFuv6bWkuXOgtTTpvNaBVlhuY+qn8vlMZR8VTyVyXanRTwTGQNdLjzRot5uc10
         6+CWWCvZLYsQlzjyrNzAmlEeby/K7ASuKgdSfzqljylhyrN+QqW9z8W3c/oa6o7w6fjl
         3Nt+q9kvcxvb85Jd5U/w7TxNuCrge56gLKJfZ7oHqjPcZGAVDZKxgDiqPqwPhTIGZKTy
         2vJXoWGMsldtKxMmXkzA29YV45llJMww7PDA9hn4T9Dk9/L6ggYXhbImXzNd4oXXKNBO
         p7/hTb96hjKpNp7c91FJca4mx323XLcA3GEmb8EcRkcgLd3ZawsZzkGAI63KSV35Dk1f
         YVow==
X-Forwarded-Encrypted: i=1; AL+hErE9awraC4U/qFvXljQBECVGm12fQVih6pVyudh90CvVzCD6Igleb4LeVuVI6/qriUItWUXU1VqEA9HwvwoBD8ch@lists.infradead.org
X-Gm-Message-State: APuU4Z9vxNIjWOLHfj2WGj1YC45Xgl8mQK4YcVnfQdDhrY+vjBXEInJs
	+kbAGdT7egJeSWnpp049hVf5UiLuTgYFRbNFmgFO93JJjuBKJ+A1yTKK
X-Gm-Gg: AYBFou0E/oF9YALR3Kleh10TbBAJyEz9/mYy/VuxMFfAO5DUs1eoTIgtWQme6ElgV13
	Qw1vrH5Z+Cahdyd7qlhvt8rY3WW+wuuTFkbHaH77Z509+Gsi5O+DJrPKbUNOlF+tXCnBfA8wCIF
	puHlPT4P9yLCkuZXGBzFG7TLjAw+9wwfI9aDuJ7YlavHAkoy35zhxFXjok02Yc2DucERK6bh9Wm
	aPE/vRp7XRbyy1l+Rlrxp6WS23xRKP4FAEgVyc1KMqzYyCyZHV2Vg4Wop2QxrBg3MtNnmRAJ3JM
	Gc4OBDwEKiPIaUmFDMmKfG+gKHjey06XfghgyAxlNqoa9jZxy7VDxvKNYt09JK9jqesW7ZXrM2o
	wXWxaL3oDWNsT4xC3JSSsYUGW2ocn+rrwFwf5257nc16SvUbc7SJo39pxzZUZOM66MLJEZb6VFN
	vEn9plAEOfkXssR4SmnB9cnIX6sw1+6r6Os/HZBYLi/UxCwO6LVku3+U+r22a8ZgZZr6s4bd1DX
	tO/DrKa1c7LEOLwL/VHZiw+nv3VeXusNIVn9Eo/2o438RynfBf+LBvMAtKRXfwQde8SzG49NiMZ
	4NFZTwpPcc8UbVf7TR5KXJk1eUYsVVoK6fSPvEGfZyRO9MlC+pg0UGntiqgyrDDQcgJ4AgPaJQR
	+3Qe6ceV3gkij3AlU+VqPqKKavIKWor7KXodWu7d5Men6lbLhNbjPjBbEctuVpYbaL0Dy4bY2OI
	iPlcYD0ZWsbcgZfYbJPNDAtzMtW2HvuO0ybw/OUQskvbfncXBoU1ju
X-Received: by 2002:a05:6808:3a19:b0:4f1:a3ac:a637 with SMTP id 5614622812f47-57a0b6533e2mr3933225b6e.27.1795223467204;
        Fri, 20 Nov 2026 17:11:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:31 -0700
Subject: [PATCH v11 08/26] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-8-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171110_336408_4E03D1A2 
X-CRM114-Status: GOOD (  24.11  )
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

Back-to-back NAND transfers can time out or appear to complete early if
the previous IRQ handler changes the interrupt mask or signals the
controller's completion after the next transfer starts.

On success, acknowledge the events and update the mask before calling
complete(). On timeout, masking the device alone is not enough: on
PREEMPT_RT the IRQ thread can be preempted after reading the old status
and mask, then resume after the next wait is armed. Initialize the
completion once at probe and use reinit_completion() for each wait.
On timeout, drain the handler with disable_irq() before clearing state.

Recheck status against the events still enabled after the handler has
drained. Command and DMA completion can arrive separately; the handler
has already acknowledged and masked any events it handled. An empty
remaining mask therefore means the transfer completed. Flush the mask
and acknowledgment before re-enabling the IRQ.

Normal NAND I/O waits in process context. The IRQ is not shared, and
the handler needs no lock held by the waiter. Only timeout cleanup
needs to drain the handler. Its latency is not bounded on PREEMPT_RT:
there is no priority inheritance if the IRQ thread is starved.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260909085434.C8F201F00A3A@smtp.kernel.org
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c5e429318de2..6d7384aac917 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -378,6 +378,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -397,6 +398,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -418,18 +420,20 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 	if (!(ien & st))
 		return IRQ_NONE;
 
-	if ((ien & st) == ien)
-		complete(&nfc->complete);
-
+	/* Finish updating the interrupt state before waking the next operation. */
 	writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 	writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
 
+	if ((ien & st) == ien)
+		complete(&nfc->complete);
+
 	return IRQ_HANDLED;
 }
 
 static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 				 bool use_polling, unsigned int timeout_ms)
 {
+	bool irq_disabled = false;
 	int ret;
 
 	if (events & ~NFC_INT_MASK)
@@ -439,16 +443,28 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
-			ret = -ETIMEDOUT;
-		else
+		if (!ret) {
+			u32 pending, status;
+
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
+			irq_disabled = true;
+			/*
+			 * The handler removes acknowledged events from the mask.
+			 * An empty mask means all requested events were acknowledged.
+			 */
+			pending = readl(nfc->regs + NFC_REG_INT) & events;
+			status = readl(nfc->regs + NFC_REG_ST);
+			ret = (status & pending) == pending ? 0 : -ETIMEDOUT;
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -461,6 +477,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (irq_disabled) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2559,6 +2581,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2567,6 +2590,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0


