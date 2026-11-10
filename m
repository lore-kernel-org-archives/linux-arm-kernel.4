Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734BB60A3809
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FjtZPHYD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJTvVAlz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0P8WydTp3FMq5jOmu5TOWCdQW00c3EBUBRA4Y9UXlr0=; b=FjtZPHYDNlNRaC
	WBGJf5ml9RivuPX/moqPJ84DHEDy5q61vAQNuoVdct+bMPT4Ywo+jQAmLc5InUrOkUEn3yLQLTwkx
	FPLyLeUZm87yljPxY9yY4+gk+w3crEWz3mRRL5PTB2d22nTa7cYa4+Eb+nWzXgmN3dlcp1qWKe4zx
	nN1l/MYi/h1wJqt/Tm474JZc3BlMVtPrrUk9TjE3ijNdlD53vLmajM3l0fC21+cAVcXK7469riGJW
	cVTs8o9haGp6MWhyDyR4SI7N3Lrnqvzrnpdt6F05C4d4ule4hxxG6ub+CSGCTtlivavpgJskU2wkG
	mLv9uvux4xB1+KI4uu2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlhd-000000040Fv-0ZUQ;
	Tue, 10 Nov 2026 13:15:57 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlhX-000000040De-229K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:15:52 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1290469a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316551; x=1794921351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0P8WydTp3FMq5jOmu5TOWCdQW00c3EBUBRA4Y9UXlr0=;
        b=MJTvVAlz7bI6ehmjDvFFJqStv15FMl2n7KldDHpK4lElSLk8UQ/oPmrsCKX3xVO9s2
         24JPA9cCck9cIxbwYqgAPrql2kHxSu4m8uMFjF/+NJXpGIAi/jwgv5Ml1rRg7g8olwnF
         6PNf44/MovR8h0If48Hqf4EHgJg+4+kPxctra3A6R81uD0WW/Kzo8w3Kx9pMF0ZH+Sx6
         3ZDyVafS+agBzuF3caogtYcstmYV9HOkj0Csonk/YOYpZE9gSqWXlqekaEHxrRZkxtE4
         URqCUoBN6JTPLUO7xmshsZkBaHR+IiINV9nNMa7v/oyMSwExuGQteUG7jZbQXLpoQq0L
         6PkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316551; x=1794921351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0P8WydTp3FMq5jOmu5TOWCdQW00c3EBUBRA4Y9UXlr0=;
        b=A2UEnEoZJ3qKDUn3A+vUoWbkmPmGaoYLMKBB1F2zwLRSS6yTojWnVGhCMpxjr8AsKX
         0D/RB1KMJUiYf/s5kR6FRaPTVtsZmRUG+/5T4BmWRhDpKrgVMEMPmy4juODAYOHcI9r5
         YZGC29PmQj/N2X2xFjJLBuC8FyvVIm+Zys6MB4FH3tU8WyfvSvka5hYJRFnQ1PAWUnap
         /ACOGF72CXhEiKdkklkcrDRpC8jX5VJRJy3+bGwWqxxNMYEnfB/P62mIZ1jp/ljJ5NP+
         JPhM43xpEawvhq9gBWtI6M1Qnoa2yAMTMGY0aodF5ox4/i9Q7MSQFDBvHn2PMFDy9wRk
         7vqQ==
X-Forwarded-Encrypted: i=1; AL+hErF0Lu1wtv+HvS5RJNjNXaUmbddTjvbBMAKrgOp25/qn1Be2A/TRJ6s69WtgRUKBeEzOETBAbqm0Thq7GbiiDraB@lists.infradead.org
X-Gm-Message-State: APuU4Z/cNyfc3FRR5U6L0fgtAoo6rgUkpfeXPHnMlHaPQo7IU36ZTBaG
	w15OT8efaEzVgoksEdcQlBkITZFlupPUQi4ksHWT4iPKFs3Y1p/lKhjM1dx8zg==
X-Gm-Gg: AYBFou2fLCpxu8cTLovizTJzY5Hy4k9VAk7b2zDuVx6gJn7bxdyJqwr+FfKmfsMwarL
	FNP/vuJ6hTem9gM7ko5aOFLi2GNNRtx4zeqVk82stQ87upAC5NzGHhT+zGob0IPRNDdFrtZuSVB
	/ejBlr9tdxalptgVZQffbBpFKzclGp1SucWRm33VxyLpGCBmAJKMl8wze34uxPrD6TAPk6JXsPH
	CwRcYJaQeQCVmHaae793Qydr3qRcdwERDhZ5EVTsuJuuv0k8JfSMz6qm8/7QPkfLqdZA7thRsHU
	S7uQ8G/5uL8c2UZpQsmjv1eUFFxz3qlJgk0h1Lh65WXGMF+3ygrBqJZZwZ40bxLOYBubX2xDrJq
	meKaFq+5l0fnxwYzWz7UI9ClwSBd7+E9FNcshjPIuNC98pDwrl3d8EnK/P67Y2Gcc+Cm2XDIfnm
	4TG4zwA5VkEaTMa0Fgpf8ei1Gwn5JnAG+VJy6QG9Uy4i1+OZpqsf9mN5weR+juS6cyPPostVFzp
	sKYDQXGXdwy1uzYVxNaxdmGkrptMJNNWukE/om6r3no9GyiLt+zF+LsASh7H8FJc8EuYQ+SoK8B
	iIqaY5WsWvrrpcUgA+2R9ixd4g8iC1M=
X-Received: by 2002:a17:90b:578f:b0:3b0:91ce:672e with SMTP id 98e67ed59e1d1-3b166c92430mr2883561a91.17.1794316550818;
        Tue, 10 Nov 2026 05:15:50 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:50 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 04/33] dmaengine: at_xdmac: move irq bottom half to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:04 -0800
Message-ID: <373d4fa23c4c5b9898a02ad7a0568ce1d828081d.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051551_530306_65EA0845 
X-CRM114-Status: GOOD (  15.89  )
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
 drivers/dma/at_xdmac.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index ef0dfe9d37ba..ae2ff7c0bd56 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -228,7 +228,6 @@ struct at_xdmac_chan {
 	u32				save_cndc;
 	u32				irq_status;
 	unsigned long			status;
-	struct tasklet_struct		tasklet;
 	struct dma_slave_config		sconfig;
 
 	spinlock_t			lock;
@@ -1754,9 +1753,9 @@ static void at_xdmac_handle_error(struct at_xdmac_chan *atchan)
 	/* Then continue with usual descriptor management */
 }
 
-static void at_xdmac_tasklet(struct tasklet_struct *t)
+static void at_xdmac_tasklet(struct dma_chan *chan)
 {
-	struct at_xdmac_chan	*atchan = from_tasklet(atchan, t, tasklet);
+	struct at_xdmac_chan	*atchan = to_at_xdmac_chan(chan);
 	struct at_xdmac		*atxdmac = to_at_xdmac(atchan->chan.device);
 	struct at_xdmac_desc	*desc;
 	struct dma_async_tx_descriptor *txd;
@@ -1860,7 +1859,7 @@ static irqreturn_t at_xdmac_interrupt(int irq, void *dev_id)
 			if (atchan->irq_status & (AT_XDMAC_CIS_RBEIS | AT_XDMAC_CIS_WBEIS))
 				at_xdmac_write(atxdmac, AT_XDMAC_GD, atchan->mask);
 
-			tasklet_schedule(&atchan->tasklet);
+			dmaengine_schedule_bh(&atchan->chan);
 			ret = IRQ_HANDLED;
 		}
 
@@ -2310,7 +2309,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		return PTR_ERR(atxdmac->clk);
 	}
 
-	/* Do not use dev res to prevent races with tasklet */
+	/* Do not use devm resources to prevent races with the BH worker */
 	ret = request_irq(atxdmac->irq, at_xdmac_interrupt, 0, "at_xdmac", atxdmac);
 	if (ret) {
 		dev_err(&pdev->dev, "can't request irq\n");
@@ -2390,7 +2389,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		spin_lock_init(&atchan->lock);
 		INIT_LIST_HEAD(&atchan->xfers_list);
 		INIT_LIST_HEAD(&atchan->free_descs_list);
-		tasklet_setup(&atchan->tasklet, at_xdmac_tasklet);
+		dmaengine_init_bh(&atchan->chan, at_xdmac_tasklet);
 
 		/* Clear pending interrupts. */
 		while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
@@ -2451,7 +2450,7 @@ static void at_xdmac_remove(struct platform_device *pdev)
 	for (i = 0; i < atxdmac->dma.chancnt; i++) {
 		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
 
-		tasklet_kill(&atchan->tasklet);
+		dmaengine_kill_bh(&atchan->chan);
 		at_xdmac_free_chan_resources(&atchan->chan);
 	}
 }
-- 
2.43.0


