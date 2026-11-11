Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86C60A261C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PSjPK6zR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U3gauwGp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gejLLrTfBndrVFvNROg/ZPGbu4H2KGtgDv4CLTI4h3g=; b=PSjPK6zRwAu65N
	K8pWkZFQl2IA/TfIdsIosJjrKe84/7dXbkIzqqZL6sO609tjHckUIdfTHtxSYIe10yB8vIOJUJgbS
	vIBmKgdWBlae9eEZv+f3Hoigu2KnPVVGy3FqjdwkVoFlGHlMk21k1hGRHToq/PjJW+kn1fah3czLd
	GSHiTpmSQgWlZuQ3UMmDJD7mZdfpjn0bUSj4X51YIlh2rHpYrJ3I63w2W2scfyJFSqgT1GO6jEm/T
	rH9sie7PRamhXbHdcakiPmYZuHOowS0iDdkntTebjM8VO38sv74Z3VLUNbe/DoYCEFYFeXmxCd+XC
	dkAs5xHZ8UIQ3+/koHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGHJ-00000007s3E-3LIy;
	Wed, 11 Nov 2026 21:54:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGHI-00000007s1b-1V2G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 21:54:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA412635AC;
	Wed, 11 Nov 2026 21:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF7D1F00A0A;
	Wed, 11 Nov 2026 21:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434087;
	bh=gejLLrTfBndrVFvNROg/ZPGbu4H2KGtgDv4CLTI4h3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U3gauwGpCDHN/FCaNr+1QgBxM5co3WslhN1ig6ATw2uvz56EtHPVHeTnnAxLkR9kW
	 eI4i353HHzxlS46hmpfg9ODEUI2K1k4G/nq2MP5JSvJ/fRX3Vrmci1lmQ36cNNCgUD
	 xcEhdS3uF49bKykYM0SEuL/sSoyoq+7yjhPGVX3DTDksqxVEFu6HTyFUYrMJJ3i+Gl
	 OLAkgAIrqJ1yVrHCMfV612gjgVgd5fKJxjJBPDtzvZAAdbN8XZZJNvdZdpkz53gFSQ
	 ay//jJDA8K9bpV9tOD52UkzFmy7P5zclqiUGBnF6l87aER6iYpMSSrbs2FoXFuyCZI
	 AE0t9buUmU2Dg==
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
Subject: [PATCH 06/10] dmaengine: arm-dma350: Query dma_cookie_status() under vc.lock in d350_tx_status()
Date: Wed, 11 Nov 2026 21:52:44 +0000
Message-ID: <20261111215349.1983909-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261111215349.1983909-1-lee@kernel.org>
References: <20261111215349.1983909-1-lee@kernel.org>
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
2.56.0.567.gdb80ae8cd5-goog


