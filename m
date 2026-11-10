Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEF860707B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e8XkHqIO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CC+I2fCt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bcm4s+IXhIHN8NFhDrr675ONGZF6+mquo3EIHxy/j7E=; b=e8XkHqIOn/6B6J
	4i25C+kGSvEGOURgO/+fKthXVy5I/CRPulCfC9w0RkGlOf/FkGKC1dG6Vyx3Vt3MiZ6cEYR13YIIe
	LcDefWOBOtAfzBq/ePK+lH888XKzzneT2lHOnF7E9kcxkzkRRnC4a2Av8N4o0gJ0z9wI28WYKcZn2
	2sj/Pp9vUuY9Zr8745qnu+iQLFbc98ea/kXkKtnFbGfjgX+PyWtaxMoIYrXPiRulWgoDKOA61JHmJ
	S4JLFFZxe9aMdHOaHeZoX8OrGYpMPXWtkvxcGLee3WYTH7+p8O5oirefm3WWf+OrIHdiZfqTr8NrS
	MINIFHPef2CwAXkbEnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlij-000000040nl-0AxX;
	Tue, 10 Nov 2026 13:17:05 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlib-000000040gN-0RjA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:16:58 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso916078a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316616; x=1794921416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcm4s+IXhIHN8NFhDrr675ONGZF6+mquo3EIHxy/j7E=;
        b=CC+I2fCt4S91vmxX7CzT3pbcnlAyz27xkzRYkrxvxCzmGL3K4syiQGQxi0FXYx9oni
         /FE2IlMhGlUAPNYHjGK4QS7JhQSPDQt8daGjXAX7AnjhObJQlBC9RztAjU9Bdra/iwdN
         ht/rKhvUY292HVMo+wLlBrUyHFai8kZn75Md8gMgHYvgauD099/gmdITtKUn7PZt2Gtq
         0nymuqgcuPxHCSJ4mjSJPuBAX9eymEMUHkv5Yr0CKCJHAkG8+SHQbR1ugycQLAcdW9Vw
         pDFkrruSaAPf2krV25UgXja6QMCrngzrcRkpsn+ATJER9er53ndgLFkYojppBoH7Upxc
         VTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316616; x=1794921416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcm4s+IXhIHN8NFhDrr675ONGZF6+mquo3EIHxy/j7E=;
        b=qia3i1js5Snt3A1HS62uDMUu9jZe2KCpyBtVO0vJGH991KLndVgb/xI8RRBKd+BFxx
         hbDE2Tsr7rwZx+6YiUojGNmIYFyObPaZYFaLfnsywkCphrnBfuL3ivzELuVb8yPPESvs
         fQt1wPc1/mPOpcnrlSC2PDe3j+iHwAISxunraOGQSl85uLbQkK+c6saUZxXIF7TPhxtE
         QYAdFqVNB/r6VCe9QCFvhOwrFSoNtusPeyrsBFUYq/6SlFo+m4/eJxAG0x+X7z7ZjnOt
         FU3oyy+wzoso61PTySLMUo3FQY01kagNLiohaeHgDLQ2XlIsmcnqz6tvzOn/+xHfVaob
         tXow==
X-Forwarded-Encrypted: i=1; AL+hErGXwfu//BD8/tVhnK0U0QVOwghrGwoNxqeElxN98aHcQidLQHHB5IFsD2Vy/QDfwu2jV0hFgi9fwb2tGAkvY69a@lists.infradead.org
X-Gm-Message-State: APuU4Z/REExYSUmPKYdVko8iusdyAFxc2ev7O+Bb7LLdqjPezxCeadzd
	lPKrcXMzkhiZe7BLQ/+kJqFaUWXH1Mvpul2U/TO/0S9/UhCetX3dTCDv
X-Gm-Gg: AYBFou0M/56vU1NY2KBPSe3ZyeSyRnucOKBvC1WqVcvM7vdOFrH4Q9dID16PiVjw/Q7
	MuR7QwI1fgD3IiPoNPk9XS1jzqKZafAshkbO4hVdlhoKfhWxVRrm3DK+x2CZUKuKoTV2wDAKm33
	JyUNc8M2BVz9B7rqsrhaebS+9NGLrUSzWjnqBubr25YZeQPQLBglWOoXWnBQ66P22NTjVR6il0y
	64WGRdkMQNd1fDwCsd5hJW7mCeLaga/Kh8jVWC8hvBsHq5Ee/RL0cmKdS2oxi3HsEZFNJVkcBJB
	CGz7Og6MqMkfobnbnrVu6aahRrNzFq0Z8fqjiV9fyTyd++G2Fhj5MxTqvyKyAdzFqeKiY8meuO4
	fBw6sqHsTOCe3LQP/MBxRQ2z7jqlvQOon78LydvudowDtTHjPpURTmUv05UKxEkXoLfIv3sQzF2
	kiUaRtCxO/duOhNZETVJzzyHU+dKS22n2vzOfh94BQALckjLh0YwlApcyJnBwuC8HMy0WEnkVZO
	6Z7yRi2a/LzDq7LoeJRnLQ+/NNqx+PiXvKINqrPQhGgkV2O9tMDzWpYa8VZexLbiFNtU+6/0WCv
	Do3L9tqYPSgNoPosUxqalrXsX4Ir+A4=
X-Received: by 2002:a17:90b:4a48:b0:3b0:d365:f8ed with SMTP id 98e67ed59e1d1-3b166cd7209mr2729464a91.21.1794316615778;
        Tue, 10 Nov 2026 05:16:55 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:55 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Alex Bereza <alex@bereza.email>,
	Marek Vasut <marex@nabladev.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 19/33] dmaengine: xilinx-dma: use dmaengine BH instead of tasklets
Date: Tue, 10 Nov 2026 05:13:19 -0800
Message-ID: <b17d718ce2500611e33331d29d10e3ab5de07a39.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051657_159935_8D3B1ECD 
X-CRM114-Status: GOOD (  14.60  )
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
 drivers/dma/xilinx/xilinx_dma.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index b89f2c3c1579..d23658c927c7 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -414,7 +414,6 @@ struct xilinx_dma_tx_descriptor {
  * @err: Channel has errors
  * @idle: Check for channel idle
  * @terminating: Check for channel being synchronized by user
- * @tasklet: Cleanup work after irq
  * @config: Device configuration info
  * @flush_on_fsync: Flush on Frame sync
  * @desc_pendingcount: Descriptor pending count
@@ -453,7 +452,6 @@ struct xilinx_dma_chan {
 	bool err;
 	bool idle;
 	bool terminating;
-	struct tasklet_struct tasklet;
 	struct xilinx_vdma_config config;
 	bool flush_on_fsync;
 	u32 desc_pendingcount;
@@ -1173,11 +1171,12 @@ static void xilinx_dma_chan_desc_cleanup(struct xilinx_dma_chan *chan)
 
 /**
  * xilinx_dma_do_tasklet - Schedule completion tasklet
- * @t: Pointer to the Xilinx DMA channel structure
+ * @c: Pointer to the Xilinx DMA channel structure
  */
-static void xilinx_dma_do_tasklet(struct tasklet_struct *t)
+static void xilinx_dma_do_tasklet(struct dma_chan *c)
 {
-	struct xilinx_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct xilinx_dma_chan *chan = container_of(c,
+			struct xilinx_dma_chan, common);
 
 	xilinx_dma_chan_desc_cleanup(chan);
 }
@@ -1979,7 +1978,7 @@ static irqreturn_t xilinx_mcdma_irq_handler(int irq, void *data)
 		spin_unlock(&chan->lock);
 	}
 
-	tasklet_hi_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	return IRQ_HANDLED;
 }
 
@@ -2038,7 +2037,7 @@ static irqreturn_t xilinx_dma_irq_handler(int irq, void *data)
 		spin_unlock(&chan->lock);
 	}
 
-	tasklet_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	return IRQ_HANDLED;
 }
 
@@ -2740,7 +2739,7 @@ static void xilinx_dma_synchronize(struct dma_chan *dchan)
 {
 	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
 
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 }
 
 /**
@@ -2831,7 +2830,7 @@ static void xilinx_dma_chan_remove(struct xilinx_dma_chan *chan)
 	if (chan->irq > 0)
 		free_irq(chan->irq, chan);
 
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 
 	list_del(&chan->common.device_node);
 }
@@ -3161,8 +3160,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 			str_enabled_disabled(chan->has_sg));
 	}
 
-	/* Initialize the tasklet */
-	tasklet_setup(&chan->tasklet, xilinx_dma_do_tasklet);
+	dmaengine_init_bh(&chan->common, xilinx_dma_do_tasklet);
 
 	/*
 	 * Initialize the DMA channel and add it to the DMA engine channels
-- 
2.43.0


