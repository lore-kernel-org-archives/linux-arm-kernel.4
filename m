Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A9606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vJC+AEbn;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aUbeWc9z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UWP/pp1IkbQnXI16iTnJsuqUrrWyENmPbInF4rvzvak=; b=vJC+AEbnIjKiU7
	mNKsQnA164anoIjV9KDJ6WsHymmVQWu35T6VjmTVvJ+I7T5BfT3WZAnITNsKPQqk5SjOPX3FX/El7
	oJc+TZFCoIllNui5EdD0WvzI7L/6jXJUFIzGF3j3B5ZnKO37y6IrnhiP63Lept9A1+Sao6PzhgYeB
	EWEQ8dSDN+Sxvb9+pt6RpYDTZDciJ/xsbW/nFrshe5qTpu4YjVWq5BoCqcy/+/pH1lwqq6qCCZwyS
	FQ5ODNScqpALfr04ta3yzy71DTGUA3/E+r646vyBXqsHYn03Pfy3REped4EruPFOSLVd4/KPL1/3g
	Rc8/Mj9a9pSbFVpnTUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVRF-00000003p5x-2pJR;
	Mon, 23 Nov 2026 14:54:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQP-00000003oQ6-3vDK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:47 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4aa5833c263so3229036f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445624; x=1796050424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWP/pp1IkbQnXI16iTnJsuqUrrWyENmPbInF4rvzvak=;
        b=aUbeWc9zPXz7hrwRZSoiKm8/sy7HgSZVxHC7M2oXf12beCrwBS4xJ8v0p6sRUL37b4
         EguizTv7h//4mlqpi4mZH+P3gDYfMTpp53bJJ7t4qItxhPcHJQ8/4y6yy6WAufxg3kz0
         kDHAZCwAskCMFjX0cq/IhBaNZdd6i1e8yIDMCJFc6FgHSTuxlKx+V32rUdhC0aau1Ddo
         nCqzRDl189xDQBcgbCxxx46J0bjH4YqaePJMq435HVY4usEwP0fVn4syV6SyhbP2T0rF
         QNUwl2FbiDQs3JiT8ZxyjpOa/or44ioX8uRZNMLR6eodqfiBd6cp8J7T13mjiVTzirmZ
         9KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445624; x=1796050424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWP/pp1IkbQnXI16iTnJsuqUrrWyENmPbInF4rvzvak=;
        b=N75SNk1Q6ihHS8oJpneZkDGmBJeSifbTXFuWNbAple+51ukHDxWmthUCZC8dkLPqqK
         kcElIuoyWh3dg3QThNOgGm+/8M4Si9FgPp0WmuhCQSgp391Yc6ck0qM7Fhfk3SUgnqIZ
         JwoIGtgDcx77dK5plPl11Z3nE+i8hbtKga7y3PfLc96IR7nPlexG1Nlifc/3m5A4L3Zj
         q8wL322xZPGtkeryQu9z3bIzQCw/OBf6CnrNOhnOIv5D2QJUiYxR9OyYrunbcYf6885D
         c2GUsbf427Miuq48aar1yCA7z193FEP59J68MFlkxij4WyXBeCdR5rllXaxObDAQwg3F
         fePw==
X-Forwarded-Encrypted: i=1; AL+hErGU93igizMBZ/Po7IK2nFlPZe1PxJ+r0puPIHLqnSuFtjVi5O0NituK6VwHY4J+CwIUWmfQDikRkFtU2VhLloRf@lists.infradead.org
X-Gm-Message-State: APuU4Z9szFrmPLgc/nEWlNssb1qTJkoHxm/5geC7VFq5JKz58dTDe+YU
	bmE9FIr5pV3G7XK5T64WR5e36QnO7nM1wtpJtJDVdkn+xR0pP0LUlNCl0qAeUdkCFHU=
X-Gm-Gg: AZFdTZfQJmavIDKjw2IuBYyoGkqydU0SudRZh2rmLPTpki/zol9hqXFaefUEMRSAoL/
	EvOokNDGcBcb9Bnha5pLcRb0ibE0axv2fzt4cnHSAfikYQPMsyqn4r3AaIUS/VBT19KWtuVCLiZ
	p8ThIJQucAKBN8uc6VikiEgV7U+9kjIHoJBB9lZNfWgJtHYi56g0Ndnnz2NiUSdTy5URD4T7swG
	syJO9zUUuvuw687ljkF5J3egBuoXcEHOzMczjs7lQcsGO5N77vYurhKnwjKLzgVqqf8uQ6w+Btx
	maVAgGyWn8AbslnwaD18UH8CezL78FTICBfLqC/9VBfp1nfz+5MNAIcSCBmaVqY+FA8hZj1xpbT
	eoGbQBRygj4OCsQ31pPI6BEAar90P/tFaDkC0d9M8TtGI03lcwzLL/X+8oBLRJXAzi5ruRnpsEI
	biPqSWnAn/iJbZvhPk1i+UGlI54KUuXNS1pgNAn684fSnwhn1rG6O62OVkEjX0Q7fOdbfiJE5YV
	xocux9/c2KtNBoh4S3ei9RYrbYPzW926eE2vho8SNFYwNm13Cu1nVgt2NZp3/ARp0969PVbw9La
	PxB3YcxiLBACf2eUhTrVjaqHNRM=
X-Received: by 2002:a05:600c:1c21:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb88804d41mr307783175e9.6.1795445624072;
        Mon, 23 Nov 2026 06:53:44 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm172540125e9.2.2026.11.23.06.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:43 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 08/28] dmaengine: bcm2835: move CB info generation into separate function
Date: Mon, 23 Nov 2026 15:56:46 +0100
Message-ID: <20261123145728.29082-9-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065346_001919_89C25DA1 
X-CRM114-Status: GOOD (  16.51  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Actually the generation of the Control Block info follows some simple
rules. So handle this with a separate function to avoid open coding
for every DMA operation. Another advantage is that we can easier
introduce other platforms with different info bits.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 53 +++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 1087157fb242..adf3508246ec 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -226,6 +226,33 @@ static inline struct bcm2835_desc *to_bcm2835_dma_desc(
 	return container_of(t, struct bcm2835_desc, vd.tx);
 }
 
+static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
+				       enum dma_transfer_direction direction,
+				       bool zero_page)
+{
+	u32 result = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		     WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+
+	if (direction == DMA_MEM_TO_MEM)
+		return result | BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
+
+	/* Setup DREQ channel */
+	if (c->dreq != 0)
+		result |= BCM2835_DMA_PER_MAP(c->dreq);
+
+	if (direction == DMA_DEV_TO_MEM) {
+		result |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
+	} else {
+		result |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
+
+		/* non-lite channels can write zeroes w/o accessing memory */
+		if (zero_page && !c->is_lite_channel)
+			result |= BCM2835_DMA_S_IGNORE;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -640,9 +667,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
-		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -673,8 +698,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -684,19 +708,14 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 		return NULL;
 	}
 
-	if (c->dreq != 0)
-		info |= BCM2835_DMA_PER_MAP(c->dreq);
-
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		src = c->cfg.src_addr;
-		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		dst = c->cfg.dst_addr;
-		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
 	}
 
 	/* count frames in sg list */
@@ -726,8 +745,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
+					       buf_addr == od->zero_page);
 	u32 extra = 0;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -758,26 +777,16 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 			      "%s: buffer_length (%zd) is not a multiple of period_len (%zd)\n",
 			      __func__, buf_len, period_len);
 
-	/* Setup DREQ channel */
-	if (c->dreq != 0)
-		info |= BCM2835_DMA_PER_MAP(c->dreq);
-
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		src = c->cfg.src_addr;
 		dst = buf_addr;
-		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		dst = c->cfg.dst_addr;
 		src = buf_addr;
-		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
-
-		/* non-lite channels can write zeroes w/o accessing memory */
-		if (buf_addr == od->zero_page && !c->is_lite_channel)
-			info |= BCM2835_DMA_S_IGNORE;
 	}
 
 	/* calculate number of frames */
-- 
2.51.0


