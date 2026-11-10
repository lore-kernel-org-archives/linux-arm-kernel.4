Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5FD606BFE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RAuFTw3M;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXaKsWMV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x5xprZt5NhCzwKafxuBKE8lrYdP4CbowwmixO5skWSc=; b=RAuFTw3MU7/BSS
	EtUNOffRH48824Q/f/8f8eYPCuavE9kcd9KNR6zRkJ5u69QJxJaTBRXxPN4JeLg7mS+rmjbaV3KM5
	+rUCuKcb9mjkcOB9z+3IEUjY9LmKfJGOqYwbT2H2smV+XnFTNYhcDdV+CPp5CuubhDcugB5ko+bQ/
	w2BE9zw2ZknYE9A9SNsZ+r3FOzNOHMLhg+vxtoKFjzfycubL7isnfKkYzLk8UR1BpbB2R9gFh3N7L
	VXzbJ9AvPCpV3ZQQ2lvltQbySm1xCe0vH/tKjuTSU6ArE/++hBc2MuntgFojPR2hE2jHG/x2J1FuN
	QmXIXawhFKqZVSak3vcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlhl-000000040JO-1sqK;
	Tue, 10 Nov 2026 13:16:05 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlhj-000000040IN-2mSZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:16:04 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1360097a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316563; x=1794921363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5xprZt5NhCzwKafxuBKE8lrYdP4CbowwmixO5skWSc=;
        b=YXaKsWMVNHvJ7deRe6P+CaLLKeUVYd0BaabCVMy1IY7vC7MW7+4mQ8to0incGFrfnJ
         BUyAfrpdKHv4f/sMFUcLKVYx+GX+p/8OLu7Fmm8OVaVH8D2TgyzyiGgDHSuUw7dmkznz
         Qsa7DAJcOFb6z2IR+PeLVkxE6YvHYBkfeim3omeRnGTSk+SIrVDW0k047bI7p4uDO9LQ
         DZajwnTHaWnquSa5jhafDwmzEzqPFD6sjJzGgUWyTX8mSv0L2NdYu/AKwigLojXSPJJs
         VQi4L6pt7E7CbxlalA2yAQkIxtXZv68a03vDtSDXEn7+DtawUWJtWJDWo65AlAAe0rv6
         x/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316563; x=1794921363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5xprZt5NhCzwKafxuBKE8lrYdP4CbowwmixO5skWSc=;
        b=PyDec8yLsXKIc9OkY4EmYqgndJ/N1+7inlYDaMZVIKN/1wV6QYfzX/pJk1ZK9zE+nu
         Qx/QQ2y91CyM9+BxMwN7tjCa249y3r6OrlRFBDhuikeWNClKbtjOGztpEkcuFENqSEeM
         KVl4n/tRzg4UgUTrj6clKd5RU3hFmCFA5W8MqoE3Ot2j8usBSiqOtU+vtxalFiIrD52a
         mguUR7XETTSuIe4nyRXrMGEkgdSqJB7E5/igLPiULCr4TGPBb2WXO6xbQyhHEaxTypQZ
         0bL2GdIMX4MosPm1HFM8vrKThn1LJAm4ZqKLmu9RIO7B2dArd38re8ovNPqJlczAAivn
         L9Xw==
X-Forwarded-Encrypted: i=1; AL+hErE0ycUxEzYSLP3eJlcUWLgQtgn3FhKx2SlTkZIM9qibg3n3CtzV1Sez67L6zSm4/0O5BCBZuzHRriH7fVcunTaS@lists.infradead.org
X-Gm-Message-State: APuU4Z9h3AWU+Sp+ZlgG9v+fZ3j02/oeSK6NVNuTK6ytdBJc7X1DGyf4
	iL1hGZgbSgZN0t/sVlrLv3Sp/bOG8nKggnmLSCgFoLPWJbcfO10nFmDY
X-Gm-Gg: AYBFou1ZOLN/dNSxmlq6IFDtnW+bvdxY3sz70klJ0GMilTy/dLZAuePN8sBjqx/0v2V
	UD31ZkKG4Xm7P+Rn/pSnLyjbvj/UXyLSGxSq8xDhRLJlj4o6XlB/01No4fvpQEpQzm2IrJpECVo
	Ita9DqZIkG1wfQ735ucB+Q/pZ9+KxO3pI3AE4/v8W8SUsaK0hzL3Ib8kLHaG62h2XdwQ2KIwHJe
	WnddbGylNgjsOiCz4V17GcKrVut8FmKD86PgPVwVdFy7wTrUGmofOhU2FIVUhQdKLeqWB03pecI
	nnnFh0W8TDToUuGfe7zd/lQJzwUJI5dFlG+odrxWltNFbKWUB0rHisR+J65Od0qL0rHHoTnoHic
	5MWRnBbqvadq/ZcV3njHltsGpDSvX2f0Q33MqAnddxXNzrDEptvjFUPDCVjj+W5KjrnI2Xp24Ne
	IO+MRavOdyHAU6X1V05458QoPdQPVVXrPFbX9rkuH1rpZtIyqZz9uHgbFL82wEeyJznk1RKds5c
	1L3J5KV9/0xFbsvRlMeclCLzru39b5KhpzYUUZNf0FFm5HYxfSUUuNZpSCgg1nC2xS0msYeAMHR
	QU8lgG1BcZoWY+HFvhTSf5ABElojE5mO
X-Received: by 2002:a17:90b:4a87:b0:3a8:c0cd:57fb with SMTP id 98e67ed59e1d1-3b166cbd030mr2853475a91.42.1794316562378;
        Tue, 10 Nov 2026 05:16:02 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:01 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 08/33] dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:08 -0800
Message-ID: <bb9ba66250d97a83048c5bcce45b20a1ea6ca6af.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051603_715258_CCEA8B5D 
X-CRM114-Status: GOOD (  14.84  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/imx-dma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index ca1d08e90a06..a9d05b2e2205 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -145,7 +145,6 @@ struct imxdma_channel {
 	struct imxdma_engine		*imxdma;
 	unsigned int			channel;
 
-	struct tasklet_struct		dma_tasklet;
 	struct list_head		ld_free;
 	struct list_head		ld_queue;
 	struct list_head		ld_active;
@@ -344,8 +343,8 @@ static void imxdma_watchdog(struct timer_list *t)
 
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(channel));
 
-	/* Tasklet watchdog error handler */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* BH watchdog error handler */
+	dmaengine_schedule_bh(&imxdmac->chan);
 	dev_dbg(imxdma->dev, "channel %d: watchdog timeout!\n",
 		imxdmac->channel);
 }
@@ -390,8 +389,8 @@ static irqreturn_t imxdma_err_handler(int irq, void *dev_id)
 			imx_dmav1_writel(imxdma, 1 << i, DMA_DBOSR);
 			errcode |= IMX_DMA_ERR_BUFFER;
 		}
-		/* Tasklet error handler */
-		tasklet_schedule(&imxdma->channel[i].dma_tasklet);
+		/* BH error handler */
+		dmaengine_schedule_bh(&imxdma->channel[i].chan);
 
 		dev_warn(imxdma->dev,
 			 "DMA timeout on channel %d -%s%s%s%s\n", i,
@@ -448,8 +447,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 			imx_dmav1_writel(imxdma, tmp, DMA_CCR(chno));
 
 			if (imxdma_chan_is_doing_cyclic(imxdmac))
-				/* Tasklet progression */
-				tasklet_schedule(&imxdmac->dma_tasklet);
+				/* BH progression */
+				dmaengine_schedule_bh(&imxdmac->chan);
 
 			return;
 		}
@@ -462,8 +461,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 
 out:
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(chno));
-	/* Tasklet irq */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* Schedule the IRQ BH */
+	dmaengine_schedule_bh(&imxdmac->chan);
 }
 
 static irqreturn_t dma_irq_handler(int irq, void *dev_id)
@@ -592,9 +591,10 @@ static int imxdma_xfer_desc(struct imxdma_desc *d)
 	return 0;
 }
 
-static void imxdma_tasklet(struct tasklet_struct *t)
+static void imxdma_tasklet(struct dma_chan *chan)
 {
-	struct imxdma_channel *imxdmac = from_tasklet(imxdmac, t, dma_tasklet);
+	struct imxdma_channel *imxdmac = container_of(chan, struct imxdma_channel,
+						      chan);
 	struct imxdma_engine *imxdma = imxdmac->imxdma;
 	struct imxdma_desc *desc, *next_desc;
 	unsigned long flags;
@@ -1142,7 +1142,7 @@ static int __init imxdma_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&imxdmac->ld_free);
 		INIT_LIST_HEAD(&imxdmac->ld_active);
 
-		tasklet_setup(&imxdmac->dma_tasklet, imxdma_tasklet);
+		dmaengine_init_bh(&imxdmac->chan, imxdma_tasklet);
 		imxdmac->chan.device = &imxdma->dma_device;
 		dma_cookie_init(&imxdmac->chan);
 		imxdmac->channel = i;
@@ -1211,7 +1211,7 @@ static void imxdma_free_irq(struct platform_device *pdev, struct imxdma_engine *
 		if (!is_imx1_dma(imxdma))
 			disable_irq(imxdmac->irq);
 
-		tasklet_kill(&imxdmac->dma_tasklet);
+		dmaengine_kill_bh(&imxdmac->chan);
 	}
 }
 
-- 
2.43.0


