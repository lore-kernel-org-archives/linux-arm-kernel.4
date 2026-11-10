Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E04E60A2623
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uDSmbJa9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kK3RzWuz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tmWyDYjfuijNjJiMSishS4j7xOVi0f/pb9IeEqewhlw=; b=uDSmbJa90q8ncf
	DeHLZlSjLurUZd6dfqIr9dAJ1tFvaEeEf3/mF1osNHojsLQS7bR9rdYlDJ9wGifjh6gS7jQBR6+77
	RmW/VDzgu7IrjSLnjCadrUlQmrrZ6CeLNTc/yfaZpuLabsjzs+NbX9YVM2A5O2LWe6odeKMQhBwH/
	Hw83eLZtkoTAgxaM4/8MILCz5wY31AGE7pW33f4IyErB7ZlKiBpJGMwWNZ+gZZtV2Qsr+OSi9WdNI
	KkxcTHx8B2et5dT9snG524jsuN2aAH6ddMi7YGEPP5QDVH8n21nMltof0wEX5yH2Vb7LJBInT6iKG
	zWuvxkO6IzCiLzl8UaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlhX-000000040E8-43jR;
	Tue, 10 Nov 2026 13:15:51 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlhV-000000040BL-1o5A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:15:50 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1244315a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316548; x=1794921348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmWyDYjfuijNjJiMSishS4j7xOVi0f/pb9IeEqewhlw=;
        b=kK3RzWuzRwomis9sex3zG9KSuZnSiIuHWl17Ila8csEvYwHHSfx/Uv80vZrne2pVE2
         EGJemiyKsXAu1KO3eJLgi+YizdTEJhFyaOY8pK0oaiwyXP2A+RBUHsi9A3/NChd36TlN
         cwgN/zPCgq5Bq9QaTK53Za7Qex3NLpI9bcBwJr/lWhPdT2JZLcKOl+KoZqlA54lniFZ2
         RIosNthALKVSjL7ofEhrnuxB2tO++IjYwDiaEe3WewVXa7apwUceKVdvOVRMHZCvbhzI
         PHAjZ1ljwdxnf6AgL8nRVnYC0ALN38LyeLv0I+5tLBaCnJdN8leDKQJNsmG9ql3xOHI9
         M+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316548; x=1794921348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmWyDYjfuijNjJiMSishS4j7xOVi0f/pb9IeEqewhlw=;
        b=iV+y7cTmHpZDsBVF7QQ1RavqtxJC5pxXO6xysoj0re/h+rE0r2Sy/Li6YVNqo0gUPy
         6Y8TuvAMMcHS/OdBvkzJStQEfHSE1y+ynSmQbFA1vHPJnnnvUfdytRJ+2Hm6mI41d4gf
         qXlIc/RNshbauIyUEJRA6CrjmFyxY8n+QlFgH6gWAH9A4ZMpWW+R+BD++x8QcmNhUwrR
         7Em5Flnl0O1gvsbLDcZn5afcKtZHdC8itLTLxdqy2DZ0bMn/j3LhLNLCsSxB62UkrduH
         HaQv8zodtwh1fqhytORDG5GJOs0AWvT8FaJNcE4/y8gA6AoYR+3Vb7TIK4CuKRkx7ZFB
         WGSQ==
X-Forwarded-Encrypted: i=1; AL+hErHLfgv+rgoV0USXfKuzqUhFUcK4cnz/R4LGuK2MmsLEWzswlPGnP9YerkRI6i4t/jC/CUUt/uSv7+3Xg5T7tepG@lists.infradead.org
X-Gm-Message-State: APuU4Z/W6Nman1+mZlHdurBqvj90QwrbVGTPK24Ka01RjDkwkhetLaWf
	GBe+fGQOWKm8LybDOvgtIekcOsNdSpNPMmIwfc0Xx5P98ozsJ05IGEsuon1bfg==
X-Gm-Gg: AYBFou2iCMKYoQ/TIpZERn4pvrjNibCza2Qe65132YGCJFOhB/f1WhvGaiDcFJAuNMG
	nDEKx4rfrL4FeJEuvRl2a8R+2P38RQrMMxeB2uW4QjU1MEahctBOG+8ugIFLsKZ+y1CIoWyIBrP
	JZLfLqpv7uw75bq0W109VxXdQj8C/s2dmtdNeiN68VxkWHlhKhv3Ol0coGMhIK+AHhpbFQV/EzZ
	Lz03tPGhDRloqyfUXVqAMZ2l36uDxGXrfWaN4Uc+zOFPr1nWXww4QKh/03yBMHetA9dBdSazz5p
	BDfL6+cULJo3ZnRTq439IMtJVjFsLJ6XHjlqBZpeB9woSvfvX4Bm6wAZgRd8AdIMDttNLqcJ+iS
	Il9a99qNMXUie3RzKQKf6RW/l9Fshol2Po8voZ9Rr1pM54MD3uDuuB6XIOItu6CJPkalyoOpziX
	rMN7fkFWxLdnYlOQgq1EFFyW86gp19JKynrnz195902T8flLKcdFopH6mB13e+Q8zwfFMGYqPcU
	7n7/0HGYVCgPWxjNyEsWAXcwG0n9zE3waWVhZCoxcYL7maeqlv+kNwPb66xx7c6Jzdb4gyLaA8B
	ThF0dWJ0X+YYSMszsPcnyzW+qwIVnh1q
X-Received: by 2002:a17:90a:d450:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b166cdd823mr2893205a91.30.1794316548329;
        Tue, 10 Nov 2026 05:15:48 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:48 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Frank Li <Frank.Li@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 03/33] dmaengine: apple-admac: use dmaengine BH callback
Date: Tue, 10 Nov 2026 05:13:03 -0800
Message-ID: <c1c55434e01772a1ecd12044feffe220f06cd72e.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051549_591061_A008868F 
X-CRM114-Status: GOOD (  14.44  )
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
 drivers/dma/apple-admac.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 4531a301c018..2eb863d1bb58 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -97,7 +97,6 @@ struct admac_chan {
 	unsigned int no;
 	struct admac_data *host;
 	struct dma_chan chan;
-	struct tasklet_struct tasklet;
 
 	u32 carveout;
 
@@ -530,10 +529,7 @@ static int admac_terminate_all(struct dma_chan *chan)
 		list_add_tail(&adchan->current_tx->node, &adchan->to_free);
 		adchan->current_tx = NULL;
 	}
-	/*
-	 * Descriptors can only be freed after the tasklet
-	 * has been killed (in admac_synchronize).
-	 */
+	/* Descriptors are released once the BH is flushed in admac_synchronize */
 	list_splice_tail_init(&adchan->submitted, &adchan->to_free);
 	list_splice_tail_init(&adchan->issued, &adchan->to_free);
 	spin_unlock_irqrestore(&adchan->lock, flags);
@@ -552,7 +548,7 @@ static void admac_synchronize(struct dma_chan *chan)
 	list_splice_tail_init(&adchan->to_free, &head);
 	spin_unlock_irqrestore(&adchan->lock, flags);
 
-	tasklet_kill(&adchan->tasklet);
+	dmaengine_kill_bh(&adchan->chan);
 
 	list_for_each_entry_safe(adtx, _adtx, &head, node) {
 		list_del(&adtx->node);
@@ -671,7 +667,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
 		tx->reclaimed_pos %= 2 * tx->buf_len;
 
 		admac_cyclic_write_desc(ad, channo, tx);
-		tasklet_schedule(&adchan->tasklet);
+		dmaengine_schedule_bh(&adchan->chan);
 	}
 	spin_unlock_irqrestore(&adchan->lock, flags);
 }
@@ -721,9 +717,9 @@ static irqreturn_t admac_interrupt(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static void admac_chan_tasklet(struct tasklet_struct *t)
+static void admac_chan_bh(struct dma_chan *chan)
 {
-	struct admac_chan *adchan = from_tasklet(adchan, t, tasklet);
+	struct admac_chan *adchan = to_admac_chan(chan);
 	struct admac_tx *adtx;
 	struct dmaengine_desc_callback cb;
 	struct dmaengine_result tx_result;
@@ -909,7 +905,7 @@ static int admac_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&adchan->issued);
 		INIT_LIST_HEAD(&adchan->to_free);
 		list_add_tail(&adchan->chan.device_node, &dma->channels);
-		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
+		dmaengine_init_bh(&adchan->chan, admac_chan_bh);
 	}
 
 	err = reset_control_reset(ad->rstc);
-- 
2.43.0


