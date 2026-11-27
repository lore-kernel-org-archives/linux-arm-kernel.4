Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E6606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iNSxofU0;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fi1ZwDzn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vskOlk6iNdjLrDbrz+V+LdGLIEjB8hQEQkTipBa/9eo=; b=iNSxofU0KAhyg/
	QIEKZ3MNrfsNKpISS+nih8bXqeG9aHQGsuWjfVzfi/s5mPnRWClSM/Bjm/tHfGCmq5S5bxk7svBef
	JEqh62Q9/M34tAiXX3e7lWQBekGbUrpR3W5pqefKMZnF3DBdb3dNxj0MSdkZqk0p44Y61LaraSyuq
	9tANxwHt5YkJ6H+5ahWSn3Xr9qpT2r0V9IAicA4K1ICPzLESBkn/iTrlhYDHTam3suS+SQXZldBj/
	gjA2JF5O6B8R6Ahh4Vw9H6UnhTEGigKsNY5et8As0djrcuTKAbz8yhoQcfnirmqd9682kgAKVYR7O
	cg7zp4QkY13S7/QhsG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvG-0000000G3WM-2n8J;
	Fri, 27 Nov 2026 12:19:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuuf-0000000G2yX-44Vr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:18:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e3b22e971so4238425f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781928; x=1796386728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vskOlk6iNdjLrDbrz+V+LdGLIEjB8hQEQkTipBa/9eo=;
        b=fi1ZwDznmuVfjObBfjyoSKc+03OdVPi76iBAW3QIbNGvtnulo36pyJrF28ucViY2d5
         HCnIBM+M21i2ZdMKGTX7e1Gqf9n+I5WMInK6snK/AbRHVWDISIxAtzo9tTC6DU9pPRY6
         Jhl9EDzaLMdG+WGSEi62qWbu9eHuIeIX5CbT0qV+VUvwPV7Z1w0qk4UpDr+9ufYVsoHl
         XxrngtOf1vulz2PGiFs9WEvFt+cVW4a31TnEzsFxAREPA6kHJwBYe4b6H1Nh/2VfGrDw
         HlEzCJK6fBe26hIN7QVRpEOyrJyCdUEOI1ovfHpPt2WlcPdP2vH1lBU8XLceVaquLFWO
         +Vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781928; x=1796386728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vskOlk6iNdjLrDbrz+V+LdGLIEjB8hQEQkTipBa/9eo=;
        b=ueKijbsZnwA5Q3wPpkBxIscA31lS26Dwh3QI5FTvlQutMUXBJQoDSYoSVfwnqkLZQi
         oe5OMvR7x0vIL2Kd8kQGfWmGPXkZMk7BecSQZu4an25qq23QwcVMLP06xmJo8mFh+tvP
         PDyivAh/lFGplMkAiTINbBLQSfaiH3hpiEMTizLeexs2xhxjT4aCHtROO/PD4A1eHf4l
         s+nIqanYQMVJQWAdhwB0eI7WgN8FzZ9aFtc9Zrq0uAuoNi9O2ngnnLGOQwNyh0fS9Mxo
         hInNuHHhlL4qN0jhbMpBM91TGWlnSvLE4UgrIqOkiN7a96DNFO/XosuiTTkNBm+TgrS3
         65EQ==
X-Forwarded-Encrypted: i=1; AL+hErFmOr2OoeZSUSV9MOLG3pYtFznpFxP+UcY4snqbWKT2OpXP66l3vAcmcjzdmuQL5uck2pvkb8pKZTl72ovkCLt0@lists.infradead.org
X-Gm-Message-State: APuU4Z+skPom6X2JsVG1oLYQIxoU8/7XYwGf3Tu6EIuTTyiHT6maof8P
	zHR7husC0FRpjyt2jRHNKRWctamg3Eddkw5Tdw/JVa4OlDkK6gLszFj53NSXrY663/I=
X-Gm-Gg: AZFdTZeFEulndNfjraLjqbdodGdVwmID44R0qaQP6q4lmebR3Iy5bDZoV/aoaYT5p8d
	n/UgbbxhjiU3GDAEomo1Gv7rWvuhgVd/JRYm07o52rfdBPk9Ix4Dhg3mOr/a7h2UR0BfkBbP2zb
	Z/gNxkIL3nLv1wngWJOVRVaMe3wcG96GSYS5wuWulo/7kLBG/NNVZ5mkX0efV/pHvPviIZSs9y+
	8WdBvaiijbulr6OkGmPtp8PP3KNUZRQ/HBEwNWzK7vvLPxbtfN5j4MOcFNmxbRGHJpcNciB1Ofn
	0zxra9vSaPHi8X1ha8WuZ5Wwo/1crAoOdQbmgIQEX14Hqm3BkYqvAs+hToCJG6awNqN1jewdG4A
	aU4GXE1Kq1/Z27NS4O3FCL6AKY0A0ni3t3h1kspG7SIFiNdHy5m57oSlEeughsZyh5qLMu84QiE
	gmq2oXlzs0TGm7BOAkWN1IZ3zwoCaNHR4C4FhzyYy7esaP2QlPvCL7fQJBqtCLcF2GhIvXcjF7S
	YkdqvPVggCjDT2wQBDkprTcyhEGNBWzq0yD7nNWRC2UeOh8HWTLEtm9DlKEq3U1BiIlNn6VDhNV
	iPd57uEKhwFhZgXNStJw56Yvz+J0
X-Received: by 2002:a05:6000:310a:b0:491:286f:8e63 with SMTP id ffacd0b85a97d-4abaf7401fdmr52410705f8f.14.1795781928055;
        Fri, 27 Nov 2026 04:18:48 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm44157829f8f.34.2026.11.27.04.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:47 -0800 (PST)
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
Subject: [PATCH v4 05/28] dmaengine: bcm2835: Support dma flags for multi-beat burst
Date: Fri, 27 Nov 2026 13:21:55 +0100
Message-ID: <20261127122236.4976-6-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041850_042820_A830B3D7 
X-CRM114-Status: GOOD (  13.02  )
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

Use bit 30 of the dreq value to enable multi-beat bursts on a channel.
This improves DMA performance and is required for HDMI audio.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 7bd1fbb2c36d..d65a93be5fa1 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -165,6 +165,8 @@ struct bcm2835_desc {
 			BCM2835_DMA_S_WIDTH : 0)
 #define WIDE_DEST(x) (((x) & BCM2835_DMA_FLAG_WIDE_DEST) ? \
 		      BCM2835_DMA_D_WIDTH : 0)
+#define BURST_LENGTH(x) (((x) & BCM2835_DMA_FLAG_BURST) ? \
+			 BCM2835_DMA_BURST_LENGTH(3) : 0)
 
 /* debug register bits */
 #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
@@ -630,7 +632,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
-		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -661,8 +664,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = WAIT_RESP(c->dreq) |
-		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -714,7 +717,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
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


