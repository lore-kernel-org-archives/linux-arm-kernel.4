Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBFB606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OFoO5Wql;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KLq4w4F2;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aGKXIivN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=; b=OFoO5WqlGVfe3K
	eNP/lBcZf9SOXRUarOk5t8q/x/wccD4JG2Cg6Xt2U6q3siaA7mxa2Zbp9Qwojx06SPSPaaUKEQRia
	1ikUmQ0UC5fAqUiqG2fB8ihCQ1n5FGlefIKul72gfiVKPuZvXTZpOn1ck5/yNHV7JbbKfFZBlgrLr
	g4qLUOD/f5VJ7F5a7CLFFoqZqzdFuYMlkXzsWxnUqNT56g8oN0hcvjdgWIijXQEUQVAVTVzPCFV4b
	1xA5nB/zqW5czcd78qiK1k96R+pgdYAJhpvZLcefaQ6Q5qHn+sWzXoEugOS0MGIaRGNKzPO2LEsu1
	rKA9N2Dn2O1mvlJnjTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvq-0000000G3vX-3euG;
	Fri, 27 Nov 2026 12:20:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuun-0000000G340-0Fxy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=; b=KLq4w4F2orNsK3M/YdYGBNjOHC
	NACvxdQgKWwu1e0Li8JFVQ9Yw1OnLV338LitDI0n2HM9LGna50hubglXvt9H/wBD3kahsABpdttRQ
	B8GkDlLPM2BkepgyRda+nyer/PzAX7cZrohYoVvxOkcLTckp+VPWYxwZgbO4+EWXRVjWvySrd0O/f
	qydUDUgu0aR+CUGjLW+iox7Am01AHR//JdbHju6H6qtKMgesyeD+HtcDaOQalnsVYzR2Hz24XOkGt
	6fqAoImNa6C3+H0rHzK/erun+R61Np3fNNLV3kp+leupSRU92RYSqFPyUynRSYFb0szH5CxWuk11n
	1Eysw05A==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuuk-00000007gsV-19RR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:18:56 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4aa5833c263so7728572f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781932; x=1796386732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=;
        b=aGKXIivNYcmSZ6oSrZWfv4ghSO87LQJQmtyjkKbVwhHnTj+Bx2Kngu8+9yCkAZ42qK
         Cvp+0ihrewTicIy1uhSFEtr+4Smg0ijymwIGddmwZCHn4G9080scROuXvdfYk6gY0UM6
         EyBdrDe0CNUYrglu/tKqQCV8kQ6ijWIQ8bQIZaYJmxFC8m15J6IGs0eca8oMzkGSwYcl
         GB9J31SZKYAozvSNOWjwD8AExwIGfpCyMMnjgfg9DNTPYW3jZImB7RFgXgOE0H06C7tw
         ZHiIimi+DUswKHCdadvFIneo4n2RlXLl/JrAnjn26jeEmXd1sjAiE1m7xWk7kLa8ZCWp
         yUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781932; x=1796386732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=;
        b=lj0Qm2RbATJh55MSHRJMgykuakjjjz6qNO5BCQvEvDOfgpuTLD5stqk5AIWvzMaiZi
         85EQiZXnjfKMElTbdf4WXFOi9B9q5iep72+bHhRtDIWF+InPjtIaH3OqYRpCSP9Upz3m
         wntA0lZ0IPB57UvBk0tcBAKGpEogmNIUITeijFN9rKsWA/rizRxpV1+hqxVKOFt9ZKhI
         5/VKFYnHH7M3bsJ53/JO+BKdBUm+1KHfd+iWMHUrPQ5dWW4TwqWuczu8aLzUVZ01yun9
         QMweHdrhViopaITH19HLCrgG48qcMH/WEfcJ3CeFjCvBAuCzxiKK046eyciklFexiPf1
         1S1A==
X-Forwarded-Encrypted: i=1; AL+hErHlPQc4AqPu6CgKrWS06bFELgW8meQ6XMo+3f5YomnzMfFVNiRE9LmbDDLkVMmH+4T8ySPgix5jkWSmA3DjpLS7@lists.infradead.org
X-Gm-Message-State: APuU4Z8cWNS7ytat0L+UYZVsQVt/zKK4VW0a2vXEgKg/8eKsXVOmtkcm
	SRnu8MGSJkcaZ0DXNa3OCTWP8pHyhsLpejEIBXdpYisnCtZ2XuMRD0GA5Eg6vw0dY3s=
X-Gm-Gg: AZFdTZcKQV/Pr+pRiLwXa/dkKYIUBNn3XPluREpccB1fGYQN4vqtHS7AIXxubZLYEBn
	ZR/YbtlnJxQ9sqKYtS1mudxUfUFnIZcNxYZzPSuzg9eE6iNiZ42RX/nXu8tnFXYljSKhBuWB4hP
	4wyGgs1kSS0/6+QIe+lbQw5jRVmdZ/AqGZahOsf/3jqogObmjV+hKy9pDKLMnJi4svGBd6Fnm8o
	3U8vERqhXFd05X0V0dYHeSajPmOv1K3ephDFbEVNAOV0HqE00aFBs9TNeQZo7pfSjQDYnWl4fgU
	2BYiCtw9tSXNZLGDeJfouiVlT7kL1DLOxRWJEiTujj5EAuSyX2xy2EAwMMT7YMPhQy9weSnFesU
	5XbQuZ/QlsFCesyBFuZKxwyqzTf4Q/aiFhAWcBy4dyYo+GfR7mCsbDSWktrPNNPSQX9AzJDNj7r
	U0ORYQ9rmn2gKAwdDkPItX2f9EYV0+IYHjGXePxST9j52rKukR5bKstcC3lrDquh7YGv78vcb5Y
	D8oI6ewYPtcqWO3an1DzraIteBy5S24ZybKWNEJJgbYYRmSqVGqHD1o0jqh4ckDPfjK6UIZ35tS
	n0x7KP9q+gOBTPw5O0/XO2gWjpQJ
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr35030668f8f.47.1795781932170;
        Fri, 27 Nov 2026 04:18:52 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm44903360f8f.36.2026.11.27.04.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:51 -0800 (PST)
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
Subject: [PATCH v4 08/28] dmaengine: bcm2835: move CB info generation into separate function
Date: Fri, 27 Nov 2026 13:21:58 +0100
Message-ID: <20261127122236.4976-9-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_121854_262204_B6FCABF2 
X-CRM114-Status: GOOD (  17.39  )
X-Spam-Score: -0.2 (/)
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
index d2e000e94347..eb306397b0fa 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -228,6 +228,33 @@ static inline struct bcm2835_desc *to_bcm2835_dma_desc(
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
@@ -631,9 +658,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
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
@@ -664,8 +689,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -675,19 +699,14 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
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
@@ -717,8 +736,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
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
@@ -749,26 +768,16 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
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


