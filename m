Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D71606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=khuEUmz3;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CDJWCz8I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HHc1h34Szr9MIeTslR2JBSbsVjgERamOhUYUByTP2dQ=; b=khuEUmz3vDLZAm
	Err/hx+hbFJPBY3p+kPzIt3KfGpNJKMvaQ4KR9s85mHrqTbCll2iAkrfeq8hRkW9NK9Mlb1tnjjA6
	WoGeLuDf3Mz4sR/JBTtbuvex1DxmDL7vL8tpMDjAxwR8OT4Bof9T5MS7YivbvSPXRg53Mtf//RpEg
	esgKqD0n0e9ZvXl13kE3b46K2cpr4Og9j25zJWU8/EOT2Y8Lp+v+PR4lcn0MmNrd6Ug9GEEgpZ2kw
	aJc0ANEXHHWL9+mJZjqq9wtIbOHCeAtyLbWv2DBm5Up3pjwDu5NJGU0BO5s3RppZU/u3mRVX3kNF+
	zOZ7+2QScEpnpOhOwN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuy3-0000000G5DX-1Pv7;
	Fri, 27 Nov 2026 12:22:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuue-0000000G2xX-2Wtp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:18:50 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so75634105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781927; x=1796386727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHc1h34Szr9MIeTslR2JBSbsVjgERamOhUYUByTP2dQ=;
        b=CDJWCz8I7JXwhbUmnFJXgIwAtVEHHdR9isQi+IFZjVBeEd+D5zbJf/hh9wjUCrNNgs
         BTxOoKWYiaoyNyEmujVkXRtebExSaNgqd5Ys+Pr0NF0C+b7zZJQX1mFPUkbIbquieRRB
         WwPESrIzZIoNA4k3/3PWUNh/l8hYDaUvKAdpX5usG3I64CGk0Xnc3mi/HtrGvtWlAs8Z
         iJ2x+/BKm8g/0tiwlye3qRXST8X0nh5PYo+VhKhNXiGwoDwCqYMTqSwZS5N8uOt1T+2C
         SPYrtrpDMal9fmsAkV/Gf+E7TgZpqp/SzShPAA6mgITsPjVqgw3j0BO+vn9rNIUP69tV
         Jpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781927; x=1796386727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHc1h34Szr9MIeTslR2JBSbsVjgERamOhUYUByTP2dQ=;
        b=NuzKh5/oX77fy+M1tRwjxwsKFSK/om8gw6nKJ0tvK8/d8p+KlQSaGoggkZNt+nPbPf
         2B5ceJWYAzv5zQD1cxDqXYYIDpvGVYqz6X+LqhMOrxs2QRvmnkdWh4ARF7bZKzUkl1Jg
         RJC2gDQwJB7afY9LR9c+INECnocfe8nbD2k/5TJ29Xlc5nHN/7pFJ9sakNLUtF3X0xV2
         7AtvaWpibkyioS4Qwyhu6HuPrh+0DQTludcEvb83R0iCuc7wsdQTe+7OAlrQNvf9J6Lk
         FHtlNCm+yFxdG57sEE1wLZREggeTLiFsGzZLN4B6v/BYw07JA+g1VS2U4/PURepwbZor
         EJtw==
X-Forwarded-Encrypted: i=1; AL+hErFAiKlpHmmm0AwPN5hzYTo7tHX9m1JFE1fnJhiqM1mvuKHrttF1E/RBRftd/LjZuWB9CSGRCnTOwivvAt86AeaN@lists.infradead.org
X-Gm-Message-State: APuU4Z+Beo62zhVzNuWPdkt7iSG3CFT0hvtL0NW1TBt7va0nIQBTkAnz
	e8hWsDIIzvsPNYPqUr1RmDPCnKEjBjY1yYSEthzr8ImFF4KnrVfrOgW7hd+sp+/srMw=
X-Gm-Gg: AZFdTZfxWIT8aATWQxOLGWclj3Z0xwVCvrcgNEpTOVqA6Q+Vs5S3pxfvcMbcUfdQIso
	hjHtKh4e5Ut+MrddqZsxD3ZevnQLgd4A9U8pe3OIHS4+jfzcnquGBEK3SYk6AsoQhfXzcaYsgnN
	B4u/l8b+V/oX5jzWhpG4XNAcx2eCjm8YXiW1MRSohu/6qBqJQfxzgFXMTdgwL7Z9aUIiVb2bssi
	lc8yEsjWPMGpzfqVjVOGM7eDnD3a8J2Wo1Z4uASSBOvZXe3V1AMboBlzG0OTncPt9ZUYNZodQ0y
	Ji7q5Z1LIALDn48mprP8PGHIiHQ6MiXaCOB6wxHfwacOU2yjYClU/8aihEmrM0d4V/EXkOtOlS/
	SDfn7h+8Xi6/9PjaxwnLd3K1BHvH31rVasmHPKiOHr1rAR92/L/pTtOJ4u+0y/4kfD2uiB7S7jW
	s0QtKGRaEz37BxFKz9mBo1Ebfal+Wh7yJx64iLHjfeSYCt3tb17A7IP/IwSc4Gbt5Z0Co+f5Jmr
	uE1BbKqDme2Epkw6yWk6k/UqXMHmZAnHa3hIvKhT4WLeMMluZMmsxLrbis+2VifIFGJ75ASckbV
	xP0FLUTtNZ8hV8cRT1v5gQliZUn2CnTM4NXEh8qNbJlU8pI3Cg==
X-Received: by 2002:a05:600d:1c:b0:4bb:9dbd:feb7 with SMTP id 5b1f17b1804b1-4bb9dbdff35mr234651065e9.9.1795781926690;
        Fri, 27 Nov 2026 04:18:46 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm412781955e9.1.2026.11.27.04.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:46 -0800 (PST)
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
Subject: [PATCH v4 04/28] dmaengine: bcm2835: Add NO_WAIT_RESP, DMA_WIDE_SOURCE and DMA_WIDE_DEST flag
Date: Fri, 27 Nov 2026 13:21:54 +0100
Message-ID: <20261127122236.4976-5-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041848_724391_03362F12 
X-CRM114-Status: GOOD (  17.24  )
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

From: Phil Elwell <phil@raspberrypi.com>

Use bit 27 of the dreq value (the DREQ cell of the DT DMA specifier) to
request that the WAIT_RESP bit is not set.

Use bits 24 and 25 of the dreq value to request that wide source reads
or wide dest writes are required.

These bits are only interpreted by the driver, which translates them
into the corresponding bits of the TI register (or of the info field of
the control blocks): they are never written to the hardware as they
are.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 5a9854a3c08e..7bd1fbb2c36d 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -154,6 +154,18 @@ struct bcm2835_desc {
 				      BCM2835_DMA_FLAG_WAIT_FOR_WRITES | \
 				      BCM2835_DMA_FLAG_DIS_DEBUG))
 
+/*
+ * Flags of the DMA specifier to be translated into TI register bits. They
+ * are never written to the TI register as they are, as they occupy bits
+ * which are either reserved or have a different meaning there.
+ */
+#define WAIT_RESP(x) (((x) & BCM2835_DMA_FLAG_NO_WAIT_RESP) ? \
+		      0 : BCM2835_DMA_WAIT_RESP)
+#define WIDE_SOURCE(x) (((x) & BCM2835_DMA_FLAG_WIDE_SOURCE) ? \
+			BCM2835_DMA_S_WIDTH : 0)
+#define WIDE_DEST(x) (((x) & BCM2835_DMA_FLAG_WIDE_DEST) ? \
+		      BCM2835_DMA_D_WIDTH : 0)
+
 /* debug register bits */
 #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
 #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
@@ -617,8 +629,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
-	u32 extra = BCM2835_DMA_INT_EN | BCM2835_DMA_WAIT_RESP;
+	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
+		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+	u32 extra = BCM2835_DMA_INT_EN;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -648,7 +661,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = BCM2835_DMA_WAIT_RESP;
+	u32 info = WAIT_RESP(c->dreq) |
+		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -700,7 +714,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = BCM2835_DMA_WAIT_RESP;
+	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
 	u32 extra = 0;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
-- 
2.51.0


