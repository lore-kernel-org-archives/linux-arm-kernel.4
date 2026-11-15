Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073FF606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hcCUzdjL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K5HYWb8D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bPluMEVsq1fcd/2/kENoSJW0juxe38/N67JwApwlVx8=; b=hcCUzdjLAaZxZi
	KrgYY9MsG78sfed6ojQ977fWDwChl/cd1t4Yy14AjUofnMpSxVlZvNI4JlBfeSME0azaCFmY7zahw
	ERnI/yx0YnV1JAFitAKPBc7F7PoR502IYlsFqovfr5NuccD+zW4QdF0jwKX5bC6QrMP667qNT3et7
	wlN+HJp12/+qB+GUlZGXoYpeDSXRZvT915IQNnWFswrTGee2HudiQB5Pr3PX/+IPieVR/vUBI6rMa
	jAmaqOU2k+qVe+YlGPlX2NkQAhULB0nk+pmuPpZlGPAnj+zTpdDPxiKsSYaNSbozMm7JF5OoPF5ZY
	NO6eSspHZF9ZhNt7sECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWc0-0000000HK3K-2o3z;
	Sun, 15 Nov 2026 09:33:24 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWbw-0000000HK04-2EmN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:33:21 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-71ad5f20016so525101eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735199; x=1795339999; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPluMEVsq1fcd/2/kENoSJW0juxe38/N67JwApwlVx8=;
        b=K5HYWb8DIJp1bsOH2vZdJx3sLPIzeckwlRuZg6fNdjDRMXW9zb2xGRZPIMRD+Zw77L
         UxwTt1J7kyJHwsdUz9kwF+jocfC3Ivz13gpL8xjqpN5E5WpY9oc3LSVqVHPKYFVz0rK4
         qgLvQYjCG0cXNqBVKN+W27cdsHUd71xqNJbrUe6/oana8n8frCIR8mRdH79eWxFjluiP
         8cR6LOyq9D4GyKz1OSkIEgdWe2UYUXgiC8VBS04G0J10UVlUVxTaTcg6UKp3uyMDn4pi
         e28Ph2QdQvBa6yxGDq8V/EW5iVSK+Fs8R8F6hbGd9JTmoax5IZMRIwuMsQ7Ke4fSR+4i
         7q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735199; x=1795339999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPluMEVsq1fcd/2/kENoSJW0juxe38/N67JwApwlVx8=;
        b=T9dH/iZ4/E8ot1qOYfrTKe6kxDeHPKlDyYOvOz/oR0h8BJ11awB3/0W39phuXL2mIi
         DRAqfMAtwl/y9Buzz47Rvd0YJaOKTW8RMsfdyhB24YYULKRJJSNWTNSh6cSQLX9NUHFp
         205VwL8KlE9KI0t/AvS1nEi3Oxid2ndg6tffmT5AJN67F0CT5bVi9RH2Bi3PlW3yY9oF
         06UD+i2CxXXhzEe5wW6CeWUCNkWDyC1wowMQucOWY2Goiz+ophXerOf8xI4eoyk52cRa
         kOFAEyS+15fvjOYPomF3lo7pOc01esKLy2w0yBrmMJbHs3B1pIZ9IqEZDzFPzg9A5iq8
         99ew==
X-Forwarded-Encrypted: i=1; AL+hErHXq88Qbp/P8K0MHei2SzqG5tcVOf/hawxGsoUJtKJ1wbLKQwZZ6tv4YZFiov2UfkqD34A1PDi/boVYLj3N69wa@lists.infradead.org
X-Gm-Message-State: APuU4Z8HPPGmMHQnG9d/DkdhOGC/+hKAmnKk42OuMNbrgKufQSLcc5yV
	dKbLErK5VaItrum6kPULn7Mkk0HvlYk+xCAOynSrz60r1soFQ4fmNsMb
X-Gm-Gg: AYBFou1g0GO6bBU8lN1eRG9dzjsSRRUrFBGkrQoNgii5MuTz7prF4lu1XEmC1kgtYTC
	ro2T7kpLidjtgWhFirs3PDG1sLk0TVyZJGRw8M05muwcyDBUpbFnmz9CvJZPTmRPS3fCYiTuPBA
	mIuKJKWb99eYXAJ9f6oN/ngMRaYgce8VC9T23JiAo0n4uZddCBwWLYL6vFcSmknddUVLDJZ8Dp+
	lB0OE0OwCAQTFFQyOjmb+Nt349M6qEyO+8oARZVLQVkjHWtRR05MGqhuEKwJvIPujyr7T+tCFpF
	ouUUbFFy/HwSIIug5u7TezdnVYAcsoVrYi9B/TpAFK7tv6bau9o7G86HReo+KbDnPHgghGxE+iT
	pR54KQP19d9uY1976G9K+eaLIHRVMLf3ywpdZe17/tYVitqDy2j9K7JNmOuOWPnP/ssMoagazWj
	EUMIUqCCSiTk8x4u81P+9ypLuFvc9hKVXlduX4d5wcJ8h1e8tgFJQd16wEE2LkZsZ5dT44FYyd3
	9VTg4AShavZqEdOUPy10TSiXIPXclsuyOtAgOm5KUzlEdPdzP9d0/ehDRCjH3PM3yh+21IBS8vK
	aCrkEUQCwO7NrK9C/rR9GF+qHi/EtgSNL7INVPxkCij3vFj9E7T0klABLac6yhgpDeWzLXX+I6g
	wsdPI6tGuzcwC3yo5Iu3MBsWg+55w3KcdDfxBR8RXtsPmWjPRC6HedW/j1km6kfyafxUZ0zmRaS
	hmDmsbXvMphp4shFLLr7foiw313eCYHQbW5oMW+V/c4RGqA49Akd4=
X-Received: by 2002:a05:6820:1627:b0:71a:ee76:d7c3 with SMTP id 006d021491bc7-71aee76dd86mr223150eaf.7.1794735199376;
        Sun, 15 Nov 2026 01:33:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:53 -0700
Subject: [PATCH v4 5/9] dmaengine: sun6i: detach completed descriptors
 before invoking callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-5-043cd476a45f@gmail.com>
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
X-CRM114-CacheID: sfid-20261115_013320_600164_CA65809C 
X-CRM114-Status: GOOD (  16.21  )
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

Finite completion publishes a descriptor to virt-dma but leaves pchan->desc
pointing to it until the allocator runs. The virtual-channel tasklet may
free that descriptor first. A residue query for another incomplete cookie
can still pass the retired descriptor to sun6i_get_chan_size().

Clear the active descriptor pointer before publishing completion. An
assigned physical channel without a descriptor is ready for the allocator
to start its next transfer or release it. Use that state in place of the
completed-descriptor pointer, so residue queries and termination only
consult descriptors still owned by the physical channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 5d39a2c0c2e1..c30e244e50ea 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -198,7 +198,6 @@ struct sun6i_pchan {
 	void __iomem		*base;
 	struct sun6i_vchan	*vchan;
 	struct sun6i_desc	*desc;
-	struct sun6i_desc	*done;
 };
 
 struct sun6i_vchan {
@@ -492,16 +491,12 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	if (!pchan)
 		return -EAGAIN;
 
-	if (!desc) {
-		pchan->desc = NULL;
-		pchan->done = NULL;
+	if (!desc)
 		return -EAGAIN;
-	}
 
 	list_del(&desc->node);
 
 	pchan->desc = to_sun6i_desc(&desc->tx);
-	pchan->done = NULL;
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
@@ -538,7 +533,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && !pchan->desc) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -584,6 +579,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	struct sun6i_desc *desc;
 	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
@@ -603,13 +599,15 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		     i * channels_per_reg + j < sdev->num_pchans; j++) {
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
-			if (vchan && (status & vchan->irq_type)) {
+			desc = pchan->desc;
+			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
-					vchan_cyclic_callback(&pchan->desc->vd);
+					vchan_cyclic_callback(&desc->vd);
 				} else {
-					vchan_cookie_complete(&pchan->desc->vd);
-					pchan->done = pchan->desc;
+					/* Completion transfers ownership to virt-dma. */
+					pchan->desc = NULL;
+					vchan_cookie_complete(&desc->vd);
 				}
 				spin_unlock(&vchan->vc.lock);
 			}
@@ -985,7 +983,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	pchan = vchan->phy;
 	list_del_init(&vchan->node);
 
-	if (pchan && pchan->desc && pchan->desc != pchan->done) {
+	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		vchan_terminate_vdesc(vd);
@@ -1001,7 +999,6 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
-		pchan->done = NULL;
 	}
 
 	spin_unlock(&vchan->vc.lock);

-- 
2.53.0


