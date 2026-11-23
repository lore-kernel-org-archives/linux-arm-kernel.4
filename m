Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A62606C1BF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=StSsTujo;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KEJ2rkZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N0XUkbBZQjwMXywlAqudB9OULMaRdVS1E8mdwW3kIvQ=; b=StSsTujoTNfwfb
	rbXEYrIlidhxBDR5cu/9Cg0S/vG4znvPG9wtUz68g9dbdErU/Idz6tQ+LBlmx9PyMPkSPG6nZF9fa
	c9+fjXqmsBCtlQIrICe1jVoOfg1Knh9WSS43kVfaMN9OIbTimPso07KIikA2g2BafByAh7SSdlprX
	rCyrkEAgsFOL7qpZoTd7Rnqw0UbOBGNpRztTIAPjQ3Xj0uhhjYsKCOaD13coqeNQcEHjO/1rQnebe
	VuJrnnv4KItwrvNIRMoMkRXaIK8NRO7cJ9U8dWnB3/4FwRzlCyf2qRYH0iV2q1dQgoyL5zukTljGC
	6PwhJz8Hdu8wqj1IS7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQs-00000003opU-1EJz;
	Mon, 23 Nov 2026 14:54:14 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQJ-00000003oM4-3oMx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-491971ac844so3133625f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445618; x=1796050418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0XUkbBZQjwMXywlAqudB9OULMaRdVS1E8mdwW3kIvQ=;
        b=KEJ2rkZXXc4rMmjl29ZyzuRhI/FV0khqQCMr+n65f0hMM1wLFXF7O2KmBUTO+Wl4QE
         5MnRmsJyXqMhLs0CL1yyTDvZ1Y2nbBgQU22TMjsPlv4aK+S7nQ4KCF/YbDX+Gq7oBldc
         CAKMgTtaF5W/J9/cWy7eKrFIjo64cXJWF7Qcsu/6KuS4K1+8oV71xagUmXTeEJrGPxQx
         vgjDtLvW+rKFL0RVg3Bh4lYDYB5OUjpNgtj9Fzoz08VqsAISJwLQPg4l30OdL0lXo3Dh
         HhdR5zS3lpPmZyJrpliYGYzVgHej4onPUnUCk+AJzgybB77jDakBdPGCq+Ua+OnHVwL7
         qUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445618; x=1796050418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0XUkbBZQjwMXywlAqudB9OULMaRdVS1E8mdwW3kIvQ=;
        b=KvV0dP6493S607MWnjjM1/2JZpKqXp+Dua3NY6T365xTEiAnI9Rj2SIVkOcbT45OcT
         sqO6CCdbGLFcrv6xCLeB2A2fLU1//jb3maBLpXzGfIVqp20p8R7tkA7wTmL0aBcD5FOD
         eZcUkNfCeJBZCXaOZRq+hdszG+9mjvJZx8t1V27bzRGMt33kkbUU6Lto/t8JYaXdAFYN
         bN7J+46hpx8HYpmt0lzlHjTZohkWgiQbigSqqax5Q444NrMDvsT3UlmuJUkHhxwmRlmQ
         o2lZ1U0KmIG1hIBmdSp8oV3BSzQj+0YlGAjT34jI4k54NEF71G3aMv0txPRt0AT2r2Lh
         fTQQ==
X-Forwarded-Encrypted: i=1; AL+hErHc/LF5hhS4GS+9Yy6pmphcc2p0VG4BJk5bIN1o0s+qxT8dvu5dZs5mgwKnDmDgRIWnyNz74ifTOYBzDhW0I550@lists.infradead.org
X-Gm-Message-State: APuU4Z8YOOh9MoS2LHfKH9i4uLSel2iLI+SxPzRTF5TFzEfl8qOtv+sk
	ASHYIv2fcq+GMhL4be39ye9gcmudm5dtSt6FynXFyZ4y+VDyAmjKRJUOXdwI6EEbu1o=
X-Gm-Gg: AZFdTZdNIi2/m5WZe9Omkwwf5n51eWyfIeyMyAKqbcUwFXeFqz9q8zRLKfGfR4x10BN
	5LuCSYEDkRKeBipoLfSSsnzhuFhNOxynuMrcprPRF5+vbQiToA8eF9dAHVzApSYicmlcQtRT1og
	YRaNJow6/hfDrYreu9ABJIYSZnlwzxq+rpDanxqRKyzuJYR/b+VuqqVUd3HIC6qA1Wr+2ZVIAsC
	x4cyhyN1LAKkidbhbsORYmNIRz3/rYwJBYjtbAKnSn0P/HV1jjEWcfZVpoGL6swBSuxnqe1sT5Z
	Ris8j49GoKBPrYaqLO5VODYkgeBmgoPpkjgAVk9rzWkVMy/cwH/FsDuHoDgLJBlo3fBiZDFqEIW
	pMXm1qB1O3bX3Ib3BIGoRz0P8CjiWore3virhtwoEHr89jm8KQk8i7Y3FgFyrILi6a7uRcV66n0
	RbYAa3QCDPnxtSLWSK1D+7fzkICgsuzFxZQLi8mVDycoUynyCIIw/9lX4Wxj6feJpByQOg0iOD5
	bQ0XFF9sacp/u1E9ySCeI5okftVYv6mmKcfrelejdTyoqkiNE2bqJclH0Z/KW62y0/lbTvdcnmf
	wn4BYtnwfHEHt5jdNJ4jWnArlrY=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb887fe725mr228663945e9.11.1795445618234;
        Mon, 23 Nov 2026 06:53:38 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm142776925e9.3.2026.11.23.06.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:37 -0800 (PST)
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
Subject: [PATCH v3 04/28] dmaengine: bcm2835: Support dma flags for multi-beat burst
Date: Mon, 23 Nov 2026 15:56:42 +0100
Message-ID: <20261123145728.29082-5-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065339_968725_18F54CFB 
X-CRM114-Status: GOOD (  14.27  )
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

From: Dom Cobley <popcornmix@gmail.com>

Add a control bit to enable a multi-beat burst on a DMA.
This improves DMA performance and is required for HDMI audio.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 118ba2f71dc8..063e1b2aabe3 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -137,6 +137,7 @@ struct bcm2835_desc {
 #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
 #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
 #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
+#define BCM2835_DMA_GET_BURST_LENGTH(x) (((x) >> 12) & 15)
 #define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
 				      BCM2835_DMA_PANIC_PRIORITY(15) | \
 				      BCM2835_DMA_WAIT_FOR_WRITES | \
@@ -160,6 +161,11 @@ struct bcm2835_desc {
 #define WIDE_DEST(x) (((x) & BCM2835_DMA_WIDE_DEST) ? \
 		      BCM2835_DMA_D_WIDTH : 0)
 
+/* A fake bit to request that the driver requires multi-beat burst */
+#define BCM2835_DMA_BURST BIT(30)
+#define BURST_LENGTH(x) (((x) & BCM2835_DMA_BURST) ? \
+			 BCM2835_DMA_BURST_LENGTH(3) : 0)
+
 /* debug register bits */
 #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
 #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
@@ -621,7 +627,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
-		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -652,8 +659,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = WAIT_RESP(c->dreq) |
-		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -705,7 +712,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = 0;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
-- 
2.51.0


