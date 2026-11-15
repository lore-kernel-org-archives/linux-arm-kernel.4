Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8758B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zjYYixve;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DHkVn9PM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lLq7Tf1B3BpSLBANTG+leF3RFU5GTaZTVgWe2BOgm6s=; b=zjYYixveCNZHXz
	H67UrkxI3UXLsz/krC2Rdld1mbNpzxBHp0iS9qwfuGISbfbhk81GIkGSO2QaZY67t6lTwW1oTaeSi
	yNYYZdiyX0opSU1i8UZrzzwPXsdQHHEq/oqHYSr33Pwguu5/TYczTxQNZdTtwRxc8ALnjrtZdG2YU
	SBEzkDl9FPcfErMe73VgxgRnzKkNTkOAWny7PSu4clEtJ/zx2IKEabatP+A17i2bGPvZL4J3woeRR
	DC4Qj5nWsIRm+DIuouAC1OH5ytJszHzP5J92fgnG9TpmOJodMVMJXeAEcodgEDh64H79dqsLldHdF
	5LstUhfNwf4gZgKYZrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWck-0000000HKW6-1ewg;
	Sun, 15 Nov 2026 09:34:10 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWc0-0000000HK2A-2nCX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:33:26 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-703be215729so783900eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735203; x=1795340003; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLq7Tf1B3BpSLBANTG+leF3RFU5GTaZTVgWe2BOgm6s=;
        b=DHkVn9PMyefIYBPDqPdwABpc6FUmO6sGQQZqVgS1G5VjWgcFUXr9tgKZLZJHv5Q2vo
         YbNbgGo7I2vPFHxpm2l1jyyUDdBJaH+8tzAxrTTTN0uXxNcyPSZG67oalcOBdAuAs5jJ
         lREWUy7ziweEubF3Kbb0JnOfJsXk/ohL5nRCmDuT3VRdI3r3RQqAZYO4A8P8jdDHjSe1
         bOdMn7dH5Qcz04FhEPDkpm3BI5lU0ja4W+S5hNVEJtCdM4Jv9ZAvrHnMdrEmsupRa25z
         qlmIVzXqqQcedhwOtgZFdQePcpRcpExgsjSMbXGQY4WqAS1imU7iz3ull9sPNdbChk1D
         jJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735203; x=1795340003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLq7Tf1B3BpSLBANTG+leF3RFU5GTaZTVgWe2BOgm6s=;
        b=SKTkdkPdzCkW+E+yY1+vyle9VpbuBVap9ffy39a2WAMmNx+qGnNbxxvUMCBLEPRaqQ
         8LqznnyR+H//iYVdc9j2YKm1iEQ4O7qQdI7JLFq4ZeUElJ++O/ECvAoigqebZc5oInD6
         LjcYQz9LNRDmlr+9rfLtVGp3QuM+Dzcn1XSN7HAcJZY5Mqr7c1EVLkODpSwPM925Twx7
         Phf6xJYALt9phx+tCfnDBiQCik8mdcwNX9Bb7XTV2dqttFbd962iAHCcjELO9v1OxbLo
         dLv7j+/Cui/Q2bdek7qcylAxp0I8qT6ygSDm5x+3ooHI/Az8owUOaPb/BVRx+taoweh8
         KPtw==
X-Forwarded-Encrypted: i=1; AL+hErHqSLAUuDAFfR77bSJmUUsr218doYDX5fSZ1U6Jbw8LVPo5YRDS/UMjiwZhYK5ipTGsFpZqmgzOaIFXqMOep0zK@lists.infradead.org
X-Gm-Message-State: APuU4Z8HjcY0Pr4Tn4hkmxIeXoc2BRtv/zRorjE5C3vtC2aDFCr7n07L
	UY/lNWy769Ban/VIoi686myTDsqmB9TVKThNi0KA+JTCepj3jNHpfsI0
X-Gm-Gg: AYBFou3PfHFgYbb7cxk6S0oInpUNQgqtufG5i88gQ4QxztiVSc1nlKcBr4OIaWTj53i
	BAa24YBE9AhAHpfPTpYaTb2/gNgjFeDJ+rdPM4EIO4afeLvb2GyJCC2qGpBtGByCQvxWYZyuXUR
	RhgdJUvmuKcX54QvoggaIKdzUP5ZBOEd9PkGxrhcaQUv0UQklAoRMlXJ5sL+MoCIOtvHilkz5Vn
	lQ/oa6F+V/HJvrUGC0g28nc0D3FVGgOuuOhowd32SAeVwaJOAHXZzKa5ULYAhx565zpj9iVqIgJ
	5OUbuStitjzwBphtJuZrF9J4KWh604HLzA/XZsNbvbeZT8bPtBa5XDNtUSG1roaBntHEFymx+8C
	9N6/Rwr1+0J9EQd7vLXHdw8mulZ+WDsnpx4LlOffyMPsUjamZhJxghdPT7+P46MW7IE/I8Sta3G
	J+GhlPYw43V0sRgrfHpswXDXAAKaGJMMXTQVBsn3xPUfqfMY+HL2YwBV9pQ5T3yVDsszRekZurv
	AnPftpuxjP0HxOiYYMVskOabWr3CDp7XKSKGWrhVA6U2xZdlaL1ozgtgB4628w1ojXBVGFgbIH9
	LWg5LMJtMu7FXMtUarnQ6iwgyH7pzwAMkgtGBZxIRluFJ48nY+Y2VSoiBoAtWbFOLWej49KH7tg
	M1jyhfCUeroKitzJbtoM4ari4o/7XNDPbj4rt6AIzPTtAhBknOIxMGeFxdHEfjG2EKqQ6L16f6F
	2BxSeOjlC97SSWJCSSTVHozno0S8xqN5ZIkof7gwMx4yqlrauJBcY=
X-Received: by 2002:a05:6820:3416:10b0:6cd:3ffc:64d7 with SMTP id 006d021491bc7-71ab51acb62mr2760644eaf.82.1794735203521;
        Sun, 15 Nov 2026 01:33:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:56 -0700
Subject: [PATCH v4 8/9] dmaengine: sun6i: synchronize callbacks before
 releasing channel resources
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-8-043cd476a45f@gmail.com>
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
X-CRM114-CacheID: sfid-20261115_013324_739355_20752166 
X-CRM114-Status: GOOD (  15.63  )
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

The driver has no device_synchronize callback. dmaengine_terminate_sync()
therefore returns after stopping the channel without waiting for the
virtual-channel tasklet. That tasklet may already have removed completed
descriptors from the shared list and be executing their callbacks. For
example, serial8250_release_dma() frees the RX buffer and unmaps the TX
buffer immediately after terminate_sync(), while those callbacks can
still access them.

Use vchan_dma_synchronize() for device_synchronize. Channel termination
excludes the interrupt handler and allocator before detaching the channel,
so they cannot schedule another completion for that transfer. Also stop
the channel and synchronize when freeing its resources.

Keep terminated cyclic descriptors on desc_terminated until synchronization
finishes. vchan_complete() may retain that descriptor outside vc.lock.
Ordinary active descriptors have not published a callback and can still be
freed by terminate_all(). This avoids accumulating descriptors on each
8250 partial-RX flush, which uses the atomic termination API.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 14f1f463005e..8f8443e14719 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -1002,12 +1002,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
-		vchan_terminate_vdesc(vd);
+		/* A cyclic callback may still hold this descriptor outside vc.lock. */
+		if (vchan->cyclic)
+			vchan_terminate_vdesc(vd);
+		else
+			list_add_tail(&vd->node, &head);
 	}
 
 	vchan->cyclic = false;
 	vchan->paused = false;
-	vchan_get_all_descriptors(&vchan->vc, &head);
+	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
+	list_splice_tail_init(&vchan->vc.desc_allocated, &head);
+	list_splice_tail_init(&vchan->vc.desc_submitted, &head);
+	list_splice_tail_init(&vchan->vc.desc_issued, &head);
+	list_splice_tail_init(&vchan->vc.desc_completed, &head);
 
 	if (pchan) {
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
@@ -1105,14 +1113,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)
 {
-	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	unsigned long flags;
-
-	spin_lock_irqsave(&sdev->lock, flags);
-	list_del_init(&vchan->node);
-	spin_unlock_irqrestore(&sdev->lock, flags);
 
+	sun6i_dma_terminate_all(chan);
+	vchan_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -1485,6 +1489,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0


