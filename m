Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F56D606A754
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gd4JGdPA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U60tk58n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uFQlGxNintgZ+1lpruDk3ejevpKfhQnwYo9OwNbOBsE=; b=Gd4JGdPA10oITm
	WdRQDjmnpcma/n3m3bPn7lBFOspeblPWgdne11T9EPwjM4D/e3rm1YQy/wO0+yB5jVHL4fE2fRuJP
	sGTXkI01M7m33UhoY5XTF+XYlaN195inoRKqX2qWLAY+Qw2dMPbTIjrvEKI0swQs4Efm6h1wufanl
	ZsbrMxABPeTO9cZLkyAZusr4Yiexm8NBa/Xs0+a+4q3b37OEqeAv/ZJVxFNipp2UADsynIpW8Qcah
	3WcothS1AG7EReP3R8iJBoyz3TJdgRsDDsW82sIssIoc/WFk1jps5ndiNdozXLHKlevXT3y0B/q7K
	5TKYjjkWnbDvTDCGyj6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQliT-000000040dA-459K;
	Tue, 10 Nov 2026 13:16:50 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQliR-000000040c4-1Ksg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:16:48 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso902791a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316606; x=1794921406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uFQlGxNintgZ+1lpruDk3ejevpKfhQnwYo9OwNbOBsE=;
        b=U60tk58ndYTwoENduAV6xQzJYhkMoINt4cHCN4X9/HGh9ZAtPVS08/E+3yrT9whRFO
         YulKRy7Fx/fPr8BpSMv4ibUKwOY3fvg15Tp7gQMAvctmPzyWXd76bCrEflfD8A9ZHPXB
         ii0EUG643JttCvs+1okigxhiHNc6jLPyue22HjodNNjTB4awutmyuRLAqrF2hwKZATmP
         DnMSEPfLsJYCkF2WEWRQwiWHsjKn6LuxnxK9aiK1yGZjqJuZHVPwedJ+lPlc5Tpunw3W
         bNEa7fKi+bFw9LtK4z2q9ercPRmslEAIZMB7SqD/TE8gb5e7FGrP7znZMk2fPaZXjQd9
         bk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316606; x=1794921406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uFQlGxNintgZ+1lpruDk3ejevpKfhQnwYo9OwNbOBsE=;
        b=tE4h5u3CN+fpNnfEnDZ2D6D9WmsFern8KMeHXCVq8y0WkS9Sf7wdxmbcoAWBOLOQbJ
         n4yYcKT/Dj3NLFa93+a0vdW69RIUp62TtS9hWNHJmkG4tsTaJYfJiRS4vdg6YwsNL1J0
         4u8MbdRnzq0iWiRUNKoibLXOLgm/3nICj6/5XDPTC3vz0rPwOitWG8LMZACQtXD63OH+
         6ER89GxHiI42jorCvKr7SE3Ljr4MxoPi2IKGtEi5zfrlDBZYM6X+PPEQThIMgOaM7oWc
         637wblOzK71Jf3iekiDW2G5bF/hoSYiUByCSulIQv0bU1Am28bs9JoHwGv6I2iP0+SRD
         7R1w==
X-Forwarded-Encrypted: i=1; AL+hErGnKjLpYv8+6M3sAlWV6SHuuih9jRyT/AKzI/VM239LLSJhtH2EsRldkkYsNShmpIrkRPeF0TbBhXXoVFDlBGce@lists.infradead.org
X-Gm-Message-State: APuU4Z+9BcSMojVfARobjNlQMyTCSHzx86sk1vzuNF7BgJQSl9PLCi3a
	Ua+5IC1xac4wgGU5zeYceAnPYqk+odq16djSsfmLodu4WzPaWiLNS6BFncG70Q==
X-Gm-Gg: AYBFou2Xc5eI92ROTRoUXvQGc7csaSlDbktrmdVD5joUoqFiRQYLz1cI9lqnRp/Y1os
	1gu+Gpf4KW1nVwM80mYdqdU5dnv3A6MUk7LxM8Y9dG3Xv0+TmKBxlOlJ/k9mTmxiDUx6OCKtJSp
	7567IUC/p8d5vjjXyJXT4OOoSvmOcp5WIrcufu1UxHLSFzWJ+vCkK9KwY0Jg3YO+9rdoZ/ZnTVg
	wpVcbg7zTHuPx1LvZIAJdPF3b29b7inCPIfow5x8/FkgaaU1z9OuPiz1uxIobBJs9tT6w6DWidg
	qRn0fxZHtz8gRlXHb8ZGizLOTtu+l5mWWivLi9JDLIdt3/MHe+6/TS9GwrtEScE6o1UjDexF6Bk
	Guh+js07OPuOGXVmQJujJ+Q/VoKqwNPZntWj01fywb8S4Md2BMtQTsBgXFmsDHuEyufyxz9zt6C
	WLfksFw3mCWLmEiiV4HaItvPva7fuZXwvMjfhtFXhaD1B34ClVPxQfFWR4Vhi0Fyol07gxHVqBC
	6qGiQH0r0Nd8ct3G7VvkNfmNc2dB6kDPfwcAfsuR9AA6d2Lv6mQ+WjTKutypOT6kzazl9HMXuhx
	hs4gkwuoV4wqGShCypqo9Y2j10QF2WU=
X-Received: by 2002:a17:90b:3c46:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3b166c93350mr2341880a91.11.1794316606188;
        Tue, 10 Nov 2026 05:16:46 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:45 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 17/33] dmaengine: ste_dma40: convert per-channel tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:17 -0800
Message-ID: <33ed46c14f6be61dd5c839b3b307512749e0d067.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051647_365110_723D59A0 
X-CRM114-Status: GOOD (  15.07  )
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
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/ste_dma40.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 8b89d44f9b0d..a06008d8dd27 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -461,13 +461,11 @@ struct d40_base;
  * @lock: A spinlock to protect this struct.
  * @log_num: The logical number, if any of this channel.
  * @pending_tx: The number of pending transfers. Used between interrupt handler
- * and tasklet.
+ * and bottom half.
  * @busy: Set to true when transfer is ongoing on this channel.
  * @phy_chan: Pointer to physical channel which this instance runs on. If this
  * point is NULL, then the channel is not allocated.
  * @chan: DMA engine handle.
- * @tasklet: Tasklet that gets scheduled from interrupt context to complete a
- * transfer and call client callback.
  * @client: Cliented owned descriptor list.
  * @pending_queue: Submitted jobs, to be issued by issue_pending()
  * @active: Active descriptor.
@@ -494,7 +492,6 @@ struct d40_chan {
 	bool				 busy;
 	struct d40_phy_res		*phy_chan;
 	struct dma_chan			 chan;
-	struct tasklet_struct		 tasklet;
 	struct list_head		 client;
 	struct list_head		 pending_queue;
 	struct list_head		 active;
@@ -1646,7 +1643,7 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 					d40c->pending_tx++;
 					d40d = d40_first_queued(d40c);
 				} while (d40d);
-				tasklet_schedule(&d40c->tasklet);
+				dmaengine_schedule_bh(&d40c->chan);
 				return ERR_PTR(err);
 			}
 			d40c->busy = true;
@@ -1670,7 +1667,7 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 			d40c->pending_tx++;
 			d40c->busy = false;
 			pm_runtime_put_autosuspend(d40c->base->dev);
-			tasklet_schedule(&d40c->tasklet);
+			dmaengine_schedule_bh(&d40c->chan);
 			return ERR_PTR(err);
 		}
 	}
@@ -1730,13 +1727,13 @@ static void dma_tc_handle(struct d40_chan *d40c)
 	}
 
 	d40c->pending_tx += callbacks;
-	tasklet_schedule(&d40c->tasklet);
+	dmaengine_schedule_bh(&d40c->chan);
 
 }
 
-static void dma_tasklet(struct tasklet_struct *t)
+static void dma_tasklet(struct dma_chan *chan)
 {
-	struct d40_chan *d40c = from_tasklet(d40c, t, tasklet);
+	struct d40_chan *d40c = container_of(chan, struct d40_chan, chan);
 	struct d40_desc *d40d;
 	unsigned long flags;
 	bool callback_active;
@@ -1786,7 +1783,7 @@ static void dma_tasklet(struct tasklet_struct *t)
 	d40c->pending_tx--;
 
 	if (d40c->pending_tx)
-		tasklet_schedule(&d40c->tasklet);
+		dmaengine_schedule_bh(&d40c->chan);
 
 	spin_unlock_irqrestore(&d40c->lock, flags);
 
@@ -3076,14 +3073,14 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
 		INIT_LIST_HEAD(&d40c->client);
 		INIT_LIST_HEAD(&d40c->prepare_queue);
 
-		tasklet_setup(&d40c->tasklet, dma_tasklet);
+		dmaengine_init_bh(&d40c->chan, dma_tasklet);
 
 		list_add_tail(&d40c->chan.device_node,
 			      &dma->channels);
 	}
 }
 
-static void d40_kill_tasklets(void *data)
+static void d40_kill_bh(void *data)
 {
 	struct dma_device *dma = data;
 	struct d40_chan *d40c;
@@ -3091,7 +3088,7 @@ static void d40_kill_tasklets(void *data)
 
 	list_for_each_entry(chan, &dma->channels, device_node) {
 		d40c = container_of(chan, struct d40_chan, chan);
-		tasklet_kill(&d40c->tasklet);
+		dmaengine_kill_bh(&d40c->chan);
 	}
 }
 
@@ -3141,7 +3138,7 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_slave);
 
-	err = devm_add_action(base->dev, d40_kill_tasklets,
+	err = devm_add_action(base->dev, d40_kill_bh,
 			      &base->dma_slave);
 	if (err)
 		goto exit;
@@ -3161,7 +3158,7 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_memcpy);
 
-	err = devm_add_action(base->dev, d40_kill_tasklets,
+	err = devm_add_action(base->dev, d40_kill_bh,
 			      &base->dma_memcpy);
 	if (err)
 		goto exit;
@@ -3184,7 +3181,7 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_both);
 
-	err = devm_add_action(base->dev, d40_kill_tasklets,
+	err = devm_add_action(base->dev, d40_kill_bh,
 			      &base->dma_both);
 	if (err)
 		goto exit;
-- 
2.43.0


