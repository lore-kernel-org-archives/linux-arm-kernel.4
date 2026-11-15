Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC3A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JgOG6WVK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kin8zRgl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nj+huGoNy2lIUQaGcQ7MZRaU7F68XeRQvFxjv76wcSM=; b=JgOG6WVK9XcUkg
	rA1HSqt+A12QQjWT6z81tZwM0EFhCmTYKaq63h5V9/kKqioTgxw04uS/7Q9GMGytKOvTo+A/WfiHz
	pKqRLWScYL6Rc1QNfMHFuur3lJhFlSEn6pHxDb9mLNz3MjrPwMGLYq4pNrgx6aPWTkHnz/ewI8WJJ
	nn3835nveQvrmN0Q+0DPvJk3AjzU14F3sBv6z0hwJ+EBvD+/zCLVnt/ZmWE5HFE+M8whK0RjQdYeo
	O0b4oVIDhrrxehN9kbNAW65jK4RgDtykmSgZmCwsFD5SEgWnS1kTLbjW9oYNPV6ArnWdIEfR0AS0A
	s+sXa2SCS6FE5ENkBsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWck-0000000HKVu-1Eg4;
	Sun, 15 Nov 2026 09:34:10 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWbz-0000000HK1a-19XU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:33:24 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7f84a55e31aso2197232a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735202; x=1795340002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nj+huGoNy2lIUQaGcQ7MZRaU7F68XeRQvFxjv76wcSM=;
        b=Kin8zRgllH0JZiwPEihNipmYI5aYy4eyOZwhbYnhRPnIBFlX1N3ZMLNTJfcPPj7c5v
         1MuHabssisALE3zzW0LEuhWftzIuKu5FFYMpljvGP73AAmhDy1KsSwEsO6iPEfDI52kX
         kSZGAfT4VNzyFfNszRVybfYtHrCccJkywrRMxyeGI5BYgBbf3oBS9fLSq2pjH/eRcYjI
         d5Nn96DVfyJCcTtSiK31QkKrVsaPI+srI1KUvLHFoP4XiNf69zMgIJYsrywK6RJez7xN
         e7Z6Uyh7gF2ln+WK67INIj8JZLz7sCB119ENQwt8a1L/ggLKhEVRfWSWrpKPwZMcMOls
         6wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735202; x=1795340002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nj+huGoNy2lIUQaGcQ7MZRaU7F68XeRQvFxjv76wcSM=;
        b=u0UPyGToSM2HbleW0M3WzAsh8hNIVRjdDGhxXN2lNKnG9lm+shHaYtlsP6mI3RsETH
         ipg0JqWujAQvQe99HJad+jFCjy1YyZpyGTXCMZCwMemThdhUSxDWem+HrD7G8mn0K2jq
         /A8CGISZoKlSTtTK2fIy8ItUGArVPO91r1eOAYBWbD9Q+ljz6pD2R2T7nR3IVzSKdeuP
         cqMIDXvGLT+EmkCXghNThxuvi5jxPqOqSNJRpb0VfyMlioYLZ6SJX1MDRXZ7tnFARkVV
         Qjg/nbtHRQZ8XPoGhq0jVj6BmFh97DtO0Y9F1S4hXfcNzb8DR8y9NZjUTdGKYftKCUTE
         1beQ==
X-Forwarded-Encrypted: i=1; AL+hErErsKVpyVDl3dRijLm7iJbL8nQlRGIhpIK/YULiPv0NBYlugX0JrgsIxJkfmlzuwJhR8nrkRMSbphgJBMR6NLA0@lists.infradead.org
X-Gm-Message-State: APuU4Z86/01JhUDJzPAdCTbPHe+U7N6CCsa/wIMEL20OX+C6H0pZX4eU
	M2B/Qr2UMLxf6Xr+I8Rlywf8igD81q0sn0pyDOwMhL13+Actnou+S2El
X-Gm-Gg: AYBFou0758vMjrnebf03dmFs6gUxQdxYxNzlyfNIncBupuWKCmyFMsHxZfZM1qCD728
	V/h5suGzrVAxCGetI5YnZ1UV2QA1v2tPdg69HkgY6uk1FmUOa1o2OFnM3ftjvCzfw4u4W0X6cDl
	ltAMZqGAZKlxz2JWcpdk9exAWDEH2gxP8sAA2nbIKkSl6XEKdo+oo0K/6+bgMGwecY8U49VnOuT
	rTExgLuXuoRu9927VfVmkf7I1Mi/GYjffBd/l+ThYOUa/jAbidBXezukcSV7F7CYFSnJVNSx37q
	JTjw8PAhuCyY/8EbcwDoozXYcVP0H8TJoQaRdBtSEERB6M4NuNkaJvTL4UTh4fxSvmZleu90WIg
	I99tQ1ljD77pvd3SDWd6O844cHyx7WQktK0NCe8RL+r3GHSs9/H05bl050McRkVjCadU0CsokZC
	9IXXNtyiikVqGk4kM3erBjaWMjYHoMiYkNv5D5jj4FZRzLxb+0bhv3DEj1kO3O87fwJCqxX+6np
	t2Ml2wuDpbFxc+k7UVxLhBsLCw8AJdHq9xWifvU7Ex7fb5wCKOy5ICb58quWfrOVXV5D8q9i0wA
	jPjjaO1p54l1OezQcrng2sXGD1DhNaij4Ax3whyycvXOVBmYEK8vXzI+A0RO482ZFaHX8+AAkK+
	1T1KKtIu04Q7ulYCp19BwN5gvzrNSTqyp9Ny21XwWp+Fp791cvQchQFvysaPgaW8JydWBghJGRF
	KciZ8k62LL0Kbhn1lMWJC+9UPPuoWXXL6+vclDVu/vbCt8m1puauM=
X-Received: by 2002:a05:6820:1396:b0:71a:e696:71bb with SMTP id 006d021491bc7-71ae69675ecmr1052335eaf.35.1794735202064;
        Sun, 15 Nov 2026 01:33:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:55 -0700
Subject: [PATCH v4 7/9] dmaengine: sun6i: track paused virtual channels
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-7-043cd476a45f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_013323_332147_964E2FEB 
X-CRM114-Status: GOOD (  17.04  )
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

sun6i_dma_tx_status() only returns the cookie state, so a paused but
incomplete transfer is reported as DMA_IN_PROGRESS. The 8250 RX flush
path pauses the channel and calls its completion helper before terminating
it. That helper ignores an in-progress transfer to avoid consuming a new
RX operation. With sun6i it consequently drops the partial buffer and
leaves rx_running set, preventing another receive from being submitted.

Track pause state under the channel-assignment lock and report DMA_PAUSED
for incomplete cookies, including status queries without a residue output.
Read back the pause register before returning so a posted MMIO write
has reached the controller when the client inspects the transfer. The
readback flushes the request; it is not a separate hardware suspension
acknowledgment. Completed cookies remain DMA_COMPLETE.

Keep paused channels out of the pending queue and do not start a queued
descriptor when a paused channel's previous descriptor completes. Release
the completed physical channel so other virtual channels can use it, and
clear its hardware pause request before reassignment. The paused virtual
channel retains its queued descriptors until resume.

Resume requeues an unassigned channel only once and schedules the
allocator, so an idle controller does not require an unrelated completion
to resume it. Clear the pause state when terminating the channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index ab4474f0a8aa..14f1f463005e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -208,6 +208,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -539,13 +540,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 		pchan = vchan->phy;
 
 		if (pchan && !pchan->desc) {
-			if (sun6i_dma_start_desc(vchan)) {
+			if (vchan->paused || sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
 				 */
 				dev_dbg(sdev->slave.dev, "pchan %u: free\n",
 					pchan->idx);
 
+				/* The next owner must not inherit the pause request. */
+				writel(DMA_CHAN_PAUSE_RESUME,
+				       pchan->base + DMA_CHAN_PAUSE);
+
 				/* Mark this channel free */
 				vchan->phy = NULL;
 				pchan->vchan = NULL;
@@ -937,10 +942,13 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	vchan->paused = true;
 	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
+		/* Flush the request before clients inspect the transfer. */
+		readl(pchan->base + DMA_CHAN_PAUSE);
 	} else {
 		list_del_init(&vchan->node);
 	}
@@ -962,12 +970,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 	pchan = vchan->phy;
 
+	vchan->paused = false;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
-	} else if (!list_empty(&vchan->vc.desc_issued)) {
+	} else if (!list_empty(&vchan->vc.desc_issued) && list_empty(&vchan->node)) {
 		list_add_tail(&vchan->node, &sdev->pending);
 	}
+	tasklet_schedule(&sdev->task);
 
 	spin_unlock(&vchan->vc.lock);
 	spin_unlock_irqrestore(&sdev->lock, flags);
@@ -996,6 +1006,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1041,6 +1052,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1075,7 +1088,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0


