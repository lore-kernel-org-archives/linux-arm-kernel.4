Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E546C606ACDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uicxyyxv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I6DkKbyG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UDGEeIGl4cmMHqxG8jYaVJEd+wCk+Kc7q5Dy4Q/P2n8=; b=uicxyyxv2wHWS8
	emHwiesqiPPhk31vmkp2jVdt+B5iMVh3F9AUvHA7OTJKHX+29B4LPcmjKPk5bXpL9BncASHdii31u
	7J0I5RNIvucuCBoVNEcRhcJtROckwuxKsAW+7dsYVwflWVv9/eOUo1ScBlAo1FOCibNo8S2YqXf6b
	GbX2IC5ZxXYIze7yY1bquW3zrOALmhZD5Ewelky/G/THMwN7ASbw7eej2oG3JC2CJzL9djlaJ+hM5
	BqFwkpsrnfF1nktYAL+xVMTxFxSFEieW/LAy4S84AuseRz6//xkcm0TU7gCt7aSq3UlbkSFtXntTV
	b9DaAZVu1EJu3suqKXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlir-000000040wY-2iqV;
	Tue, 10 Nov 2026 13:17:13 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlij-000000040pG-3Pwg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:17:07 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3b179528d56so54650a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316625; x=1794921425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDGEeIGl4cmMHqxG8jYaVJEd+wCk+Kc7q5Dy4Q/P2n8=;
        b=I6DkKbyGxAFpuLz9aErhHhSlx0lj5MRFq3Rky6RGAQqj4ArtdZeNVULUQP5jFDK8Qo
         ZGXowzCsouWCRqczj5VARxkM3LCT2Im5BJmZI3zoccSyi2CvcUA/OF2gJxt1N2ulvVJb
         PLhmu61AdsTXvkTeQLSUu6g+WbWT7Lk0rDS6YCwnmuQ/Zc+4zpQ/3+/M+gpM3e9UTdir
         1vy6H7uJnWwt4e3f6DQqBLOjwHWYDMhtyj7NSUo9+qU0/QNKxVHF1p+z0FyE7o8SYPrT
         PPPb21EReQz7XZ7tH0Ao2piYpa3xVkDUMGgoqdoQs0iurz9vA3dXI9UoUNiXhCzAtCrr
         WTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316625; x=1794921425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UDGEeIGl4cmMHqxG8jYaVJEd+wCk+Kc7q5Dy4Q/P2n8=;
        b=BEEoM6x9+MNpnEgByYfdFswKsCkhR4iXrcIbhPqieI4yt3vEBj3FMM0TRau761rAv0
         TX/m4d9znBU5G/0QvdLYwoL/mAnBkW+npNOUjMQU2udFSNGDKa7ptS7QSJlFnyzdV2uu
         X8nYKqnllvWJaZR3HJ+ub2aPLpnGktQNstcUejTL/6JwnYNBmfC3HmmcKkXSMeU6MabB
         9033c8RB07H9c9lNw5ujNm7wJMicW6pig5Avp0uKGMfpCPHrb4OhUj2cBpIw2OmkCJDO
         3kYP9DFRrzl/MN74gwCo5GgT5F6ni54I/OcoiZFNfUSbF6AW086LE0ZMk4hDbaQG8uwr
         4LeA==
X-Forwarded-Encrypted: i=1; AL+hErHWjLbs+gCrwZ5HmGGgx2DOK96I7mTedTgFrNnuXzwXoxLfgKkZOLjMIzts0jpxHxhg1zggXxyZHRNCt36mFgDS@lists.infradead.org
X-Gm-Message-State: APuU4Z80XNhxg3nU3AY0e2nbPLFcaQSFuz3wJb8bDYt+mxzY4Qj7VU33
	fjyetLFDXZz5GPWQHAgkQ6/kTBgxioJJwxIF+xK03r7Xz1hqHlr6jUU7
X-Gm-Gg: AYBFou2wf1CNWsFEwL1huQX5nh2L2E72Bxd7YmV//GlhSpv4hl7Jl/z9lrDFzLIAotB
	jHJi0go9SJ7feTnuoWe55pTK+qvGkkzua3E1XjV0bADbkwhgYN9gKJsDDSdPftOqvmutrK31wTq
	X6Dj0t1gIwUtWyBsDlqFoWrkWeEv57+Qqe8vE4+LYAgMJtnNSV/Tu6pG5wlIdVDKWFCgSCpUyYi
	wuUnYnSOLslOQ/jXr7n6oByNjCKFQPNDbNyC3RN2L2o4tIvUVwXF8oOdOZiA5Ky4dasxHRBazKc
	zJwIH6vxEeXQcKZ6DEo9eDmcB1SD4SQura3DwosJSSqzIbc8TVhnWnKda+49uJNdYTKrFEshdEJ
	BsT/0VrUZm/V72F9SZy+8K7JGWW2cff2xc0GmLeIGXDkDDobGP3H3ykTRG1J/zPAowWRCGIZAW0
	6WRqtTSUp/cNcCH59T1UOuZRqqOHKDqyRk1PQcVqGnunOLU5yQdogxniazvFR+LbMIzYAnih6G1
	34nql9DLQE5rbVJ2QxBChmykYugv/Uqd5wwH9JBvN1KOMPzyL/c+19X5U/8eOIdMVOY7HkG7iwV
	LQBc82bEtRwk3gSpvb2UnpSkJlhmnAc=
X-Received: by 2002:a17:90b:1812:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3b166d1e0eamr2281998a91.48.1794316625094;
        Tue, 10 Nov 2026 05:17:05 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:04 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Golla Nagendra <nagendra.golla@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Kees Cook <kees@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 21/33] dmaengine: zynqmp-dma: switch completion tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:21 -0800
Message-ID: <6b2f74549b23746ca0bdb99d7ae77181071c4f21.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051705_894789_B7E16297 
X-CRM114-Status: GOOD (  13.81  )
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
 drivers/dma/xilinx/zynqmp_dma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index bc85dca47412..aca32eb175bc 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -205,7 +205,6 @@ struct zynqmp_dma_desc_sw {
  * @dev: The dma device
  * @irq: Linux IRQ number, or -1 when not registered
  * @is_dmacoherent: Tells whether dma operations are coherent or not
- * @tasklet: Cleanup work after irq
  * @idle: Channel status
  * @desc_size: Size of the low level descriptor
  * @err: Channel has errors
@@ -230,7 +229,6 @@ struct zynqmp_dma_chan {
 	struct device *dev;
 	int irq;
 	bool is_dmacoherent;
-	struct tasklet_struct tasklet;
 	bool idle;
 	size_t desc_size;
 	bool err;
@@ -743,7 +741,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	writel(isr, chan->regs + ZYNQMP_DMA_ISR);
 	if (status & ZYNQMP_DMA_INT_DONE) {
-		tasklet_schedule(&chan->tasklet);
+		dmaengine_schedule_bh(&chan->common);
 		ret = IRQ_HANDLED;
 	}
 
@@ -752,7 +750,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	if (status & ZYNQMP_DMA_INT_ERR) {
 		chan->err = true;
-		tasklet_schedule(&chan->tasklet);
+		dmaengine_schedule_bh(&chan->common);
 		dev_err(chan->dev, "Channel %p has errors\n", chan);
 		ret = IRQ_HANDLED;
 	}
@@ -768,11 +766,12 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 /**
  * zynqmp_dma_do_tasklet - Schedule completion tasklet
- * @t: Pointer to the ZynqMP DMA channel structure
+ * @c: Pointer to the ZynqMP DMA channel structure
  */
-static void zynqmp_dma_do_tasklet(struct tasklet_struct *t)
+static void zynqmp_dma_do_tasklet(struct dma_chan *c)
 {
-	struct zynqmp_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct zynqmp_dma_chan *chan = container_of(c,
+			struct zynqmp_dma_chan, common);
 	u32 count;
 	unsigned long irqflags;
 
@@ -823,7 +822,7 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
 {
 	struct zynqmp_dma_chan *chan = to_chan(dchan);
 
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 }
 
 /**
@@ -899,7 +898,7 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
 
 	if (chan->irq >= 0)
 		devm_free_irq(chan->zdev->dev, chan->irq, chan);
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 	if (!list_empty(&chan->common.device_node))
 		list_del(&chan->common.device_node);
 }
@@ -951,7 +950,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 
 	chan->is_dmacoherent = of_dma_is_coherent(node);
 	zdev->chan = chan;
-	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
+	dmaengine_init_bh(&chan->common, zynqmp_dma_do_tasklet);
 	spin_lock_init(&chan->lock);
 	INIT_LIST_HEAD(&chan->active_list);
 	INIT_LIST_HEAD(&chan->pending_list);
-- 
2.43.0


