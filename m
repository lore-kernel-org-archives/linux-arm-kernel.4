Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09968606A893
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SiFsSjWk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IT8nOVgd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Jid4wZhSaEhGIgM1uFhcH9xtWnWfBCXJVXpzzKBsbxg=; b=SiFsSjWkHNDao6
	tGZo29aTRZo7OqZTEvaYLPBwAM7aZL4g78JdES1v3mcP2ZJ+8J0KZlcp5ENqeXFQSBD13FbekqZt3
	j5cc30MCpAHPs5B28v48frtcteb6qvwSz37vjV5w6tP7UZ9UHNb57Dh1eMen1bfbvC+KL8mYOfo47
	NnFu/+DcWUEN9XAmVi48qJW1/fMAIMLg35eoBTqE5sdk4/gdNOa06txN3fYf/9HQQd29vzXdHT/nK
	UtV7zLvdDWCYMcqohOq+mEJWLRTWsOpptn4+Oji6RMD1Rl0rtjWcTuOxWZkYxfPx8Xhxo1ysR/X0q
	qrpbFapwV71S5ssZGJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMDA-00000006Rtd-0MsJ;
	Tue, 17 Nov 2026 16:39:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMD8-00000006Rsk-1HTl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:39:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1558A43837;
	Tue, 17 Nov 2026 16:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1601F000D0;
	Tue, 17 Nov 2026 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794933550;
	bh=Jid4wZhSaEhGIgM1uFhcH9xtWnWfBCXJVXpzzKBsbxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IT8nOVgdXAtSdWbzG7cgl+pyboXrd0FKFO0LawBaxE4zHCnjZ4tHWpB8u0+6t+qCD
	 ocAmZEKkX8DStWPNyh9zploDu0Z3g3QGc+TGfgWfPejscoGyhzLr35XGvSsqf6xKEd
	 /LXKCjU4YGB8WPJOJSVkbYkzH8yKkILdZLYjtwSKzbOdEMcalTY9/qTfW6jcFceWPz
	 0wxexa8St69tRB77j3Un6v+6yn8ErcuJFgbDLJukQF0CDYtsskszlE2jHXoKNzjQbR
	 UPIx27+KJzy5HuxDOiBC+bdEiO2W5ua3O4rpU/kJO2/xPl8DXMgb4eDA2WFWW8fiNA
	 NjzM+E8fo1znA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 07/11] dmaengine: arm-dma350: Query dma_cookie_status() under vc.lock in d350_tx_status()
Date: Tue, 17 Nov 2026 16:37:08 +0000
Message-ID: <20261117163809.622249-8-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261117163809.622249-1-lee@kernel.org>
References: <20261117163809.622249-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Calling dma_cookie_status() before acquiring dch->vc.lock in
d350_tx_status() races with d350_irq() completing the active descriptor
and starting the next queued transfer, causing d350_tx_status() to
observe a stale DMA_IN_PROGRESS status and falsely return DMA_ERROR.

Move the dma_cookie_status() call inside the dch->vc.lock critical
section.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Closes: https://sashiko.dev/#/bug/linux-524816d7-ed1c-4f2b-b4c3-65a7e8bb45a3
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2: No changes

 drivers/dma/arm-dma350.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 52f5242ea332..8c1725588f1d 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -381,9 +381,8 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
 	unsigned long flags;
 	u32 residue = 0;
 
+	spin_lock_irqsave(&dch->vc.lock, flags);
 	status = dma_cookie_status(chan, cookie, state);
-
-	spin_lock_irqsave(&dch->vc.lock, flags);
 	if (cookie == dch->cookie) {
 		status = dch->status;
 		if (status == DMA_IN_PROGRESS || status == DMA_PAUSED)
-- 
2.56.0.679.gc527c65306-goog


