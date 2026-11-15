Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189A8606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E/HvbsFQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TnBGDlrq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NlQp3R8KuFLhV9wrXx8XG9nak7uXzaBTY2y9ltCW+Ec=; b=E/HvbsFQN6Adr8
	u8LSjJSjcANQMGAdCV3Ql6PWUwwEhwmk9cHiVrL6zKy94aUZyY0VaYUeE8GIrZei5/feMYTV3Z8sz
	Lc0D3KLBx8EUZyz/G2esRGXEg0arkFYCw9UdWxgjGeE3z9hTm0ZGsESAAGXrfOAUxrEPIMLeZhVpE
	0Vl3SM6m7MiJjM5Dgq1yJWFxPcuMFT+nJmElATAXJno7baQ32YJ8wOKSeOof6UfBABs1emaVLOpdw
	QNEmMqHPKFshIPynQJm9aOK43+pJLfZE1tj/fFYcBMe7EAzZ6iVgJew5ZFrGNON8pa9PQgnOk8hGA
	i4VbFg+ccOv75Gn6bMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWc0-0000000HK4F-3lTb;
	Sun, 15 Nov 2026 09:33:24 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWbx-0000000HK16-1au5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:33:22 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-71acdd32a53so428017eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735200; x=1795340000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlQp3R8KuFLhV9wrXx8XG9nak7uXzaBTY2y9ltCW+Ec=;
        b=TnBGDlrqz5kiIQtUocya+DpNa/Xrkk3oJIhkindXDSJwkkeY1Lvb0AGOYsK8qFYQrt
         j7VFZ2VMKl3JGhCUrG3Ym7jMqk3IfAEXVLH0tn6piFeXzecawDIQjdOoY9f033jGjYX1
         Zhao8eGe/jAgIT3p1rQiqceyQNA2IwHM3sDlxkeGyxsRibOW0BirHZouxVdrYNsdoHxN
         xAEbYez9Mb1xmWT0fHKmHebgKO9dEe0pR1bQfV3QFRf2Z7WH3FLY/dVOpZHsNWcK57RE
         gv5odv/jeWAkOiQIozWhV6afmGK6MyEnyi9xCiPOSaZ+VBofCz+rqA92W15UZ8AQjYn4
         coRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735200; x=1795340000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlQp3R8KuFLhV9wrXx8XG9nak7uXzaBTY2y9ltCW+Ec=;
        b=UVZp9gM1y99/OsiKzsDIpt5kkhpWETNOE/yfDQdXpGUvMHrHOZ1kICwv835BToIAVU
         g2uo01UIJ0BuiT/Mn+/3Evle0IgH8fqzqx2HAoFFO62A+CI41ZHZp/5Xn35bJoIonY/V
         KRu40TWTYprfKkjnNOTE03MYYZndzu1SQ3npG83eKSYJTbuIwsXK3tYSbg9Cvhjt0Fmj
         xQpKodh4RWuWsp2xyvmzOe+IeJT3fN/eEr2Wvb3WOXL9CuVu0wqfmFubH8ZAqnlR++LC
         xnfEdJY78BCbfJ7Kk+YVSBrzWgfvDQhagbn6XSezYvYeBzb/WlnTaaSfsrLsolo4Y4Hl
         lzcQ==
X-Forwarded-Encrypted: i=1; AL+hErFZP2So/VkG9h1K8bl6XPj379x4qx5KWIiasxJ04ZZcxtPEEWPLoj+Rb804h0/BWm1gOOwsn5TOe/O3p5uklIYt@lists.infradead.org
X-Gm-Message-State: APuU4Z+RMmhzMpiCbwswcAqkOp+b62VNPFNIAG8h34TiGBBSHYbTSbFS
	y2mfMWQG1wx7mJFCTu40qOgaisjOxpn9AEam0Egq5Er3Xu80+TuYMWeH
X-Gm-Gg: AYBFou20Kw2PFrv3UaLvL5qLbxsXr4D/xVXsCYO4XtaOuksLVaxwoqn++AH2M7MTHLb
	9rNhMuy58x2gFu5qfy6FM165wido7KWjVFWYZaele94cO2RCiEwQXxb5lEVWut37z9DxhZN6Oth
	P4QX0sY55ef3cj5OJmihz5yt1d9WpyJ10GQuD+I1N20GEUwIqy3hyvL01k1QID4pM9rwQ+cxRhA
	K6912hr2tsSVmvyHURGhqYBTu3pVTkTG2UTMAPH36S7KMSRuSvCxQFAzb1Ttl/4DP4oXGtWd0hH
	TXCCFZWk5xDORSSjQ9hpdLL1zvrwgO5HQtDpLl51J6qBOc48SzRsiYoN67Gj8YjgJ1JdleA3Yoa
	qNVAufSFjk+u/MVjD3By4phuE58rhlsgTGHQ/COTP+chHLmfJQDRcuR3/FFsoBxL4geQml35f++
	VVunqgF1XVMPK9xfgGlJEFD9EysHl+ECcaO4xjT28x+5WqZK2Sm3moXwFEab5XxvFh13cJE3uJS
	sOGA3j9nlGtlsmAxPLDR96Jnyc/kT1rrt9Yk8EKCnBLybYgw2tO4cAXRMbt/2G8wZE5LthSJOI5
	aBjkFazylcpXagOnjLP09cHdai2x4Uv7oH1c3GBtVH29WdZbZvyQdWhEI2xd0ZWfhTa8EL1H4Qt
	MlxHJUnjQ6TDSL7GMAR24JivievPj0C0vhsNnkkKbQUAUMkB1jP56yg/EkUadSrVfic11kn0mCJ
	un3zb8U8xL2etiDOhl89GdXeBzOfDoY3ZhN0wIHmVU5cPQjWwMgQk=
X-Received: by 2002:a05:6820:a711:10b0:70e:1dd8:6713 with SMTP id 006d021491bc7-71ab51550camr2956017eaf.71.1794735200601;
        Sun, 15 Nov 2026 01:33:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:54 -0700
Subject: [PATCH v4 6/9] dmaengine: sun6i: retire interrupt state before
 reusing physical channels
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-6-043cd476a45f@gmail.com>
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
X-CRM114-CacheID: sfid-20261115_013321_437158_9B95429A 
X-CRM114-Status: GOOD (  12.72  )
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

Termination stops a physical channel and drops its owner without masking
or clearing its interrupt state. A completion latched by the old transfer
can therefore be delivered to a descriptor installed after reassignment.

Mask and acknowledge the stopped channel's interrupts before releasing
its ownership, and clear pending status before starting a new descriptor.
Keep these register updates under the same device lock used to sample and
acknowledge interrupts in the handler.

Schedule the allocator after termination so pending virtual channels can
use the released physical channel even when no further interrupt occurs.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index c30e244e50ea..ab4474f0a8aa 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -503,6 +503,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
 	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
+	/* Do not deliver a previous transfer's interrupt to this descriptor. */
+	sun6i_write_irq_stat(sdev, irq_reg,
+			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
+			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
+
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
@@ -975,6 +980,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct sun6i_pchan *pchan;
+	u32 irq_reg, irq_shift, irq_mask;
 	unsigned long flags;
 	LIST_HEAD(head);
 
@@ -996,6 +1002,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
 		writel(DMA_CHAN_PAUSE_RESUME, pchan->base + DMA_CHAN_PAUSE);
 
+		irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+		irq_shift = (pchan->idx % sdev->cfg->num_channels_per_reg) *
+			    DMA_IRQ_CHAN_WIDTH;
+		irq_mask = (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) << irq_shift;
+		sun6i_write_irq_en(sdev, irq_reg,
+				   sun6i_read_irq_en(sdev, irq_reg) & ~irq_mask);
+		sun6i_write_irq_stat(sdev, irq_reg, irq_mask);
+
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
@@ -1005,6 +1019,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
+	if (!atomic_read(&sdev->tasklet_shutdown))
+		tasklet_schedule(&sdev->task);
 
 	return 0;
 }

-- 
2.53.0


