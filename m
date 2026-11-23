Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592AE606C1BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JvsCM6pJ;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FVUOYxr5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AI8HWgrEJm2ajFDDgXXsC9dIqWcTrg87ImDVMUpFPTg=; b=JvsCM6pJCTcqcu
	WaebyATZKOqghWIItsF8kJ7uvWud+UOLMcrQohgK+YxLU6t07FSv6PHGu53sCTzS7I2Dixuru4RkY
	57O33GG1OQ8WGclTpepPcN/6I6WeLjfDUlYBxBFWRxt90OGrai4jVQuMrbPSRmXDJnRONEvbzYGWO
	RcicstCge7JlFTtHgmFSswTgIdJpNIw10CBA8RRkWKXJy9U/wjEJObo7tJHd3Twh2gfERUb6VvSfg
	Jb2taAFGW52/sh7eb6tdtc+RdPOD0/QKMaldXsbUVhk9690p8nA52Yo8mqAFn3+0dAZ24zaZoEfKR
	znXHIROAUd0Oz6QDoMSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVRP-00000003pDE-1Tlb;
	Mon, 23 Nov 2026 14:54:47 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQR-00000003oRl-12H3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso2797339f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445626; x=1796050426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AI8HWgrEJm2ajFDDgXXsC9dIqWcTrg87ImDVMUpFPTg=;
        b=FVUOYxr5zfwWv+6qXvooR7lq0XiUvP1m7NGC48Rps5nTrnSJfN0esJq/9TiGh8xvbW
         zSOuKD83eiVEi2akP12yYLXnJGrV0ZeASYxZOXUG8GZL11Hoy5lvfSLFHT7GrGeySoxh
         AxBxC4J59hzhGrvcx/BhJoiFRJi1QnluMOq9RXyhOmGmjmVETsOfTZU37jHPi7M1ReKH
         0tiWCm0KH28tD3/IAR3uKbpgRhZV+doXGAkRzhWblcTaHxo79L8T8/K2AfKwXK9qAXTS
         Hmu0s/uA2yqz2ccDPcOr10uKtaF8JsUvpaSPaL1Ay2khQfK2Cz0xKVHU3C5uurzhrB+o
         IQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445626; x=1796050426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AI8HWgrEJm2ajFDDgXXsC9dIqWcTrg87ImDVMUpFPTg=;
        b=XUwkRLp2kZh/gDW/zykfKDVPTpo5e2DT0JuWWgnx2fFErzdQ8ZJp588m0fJHcKAfL7
         mCImiPkNmUrsX0FnZ/ggjVQxV9p6c5Ciuo0CwP74UQhTrOVz+knwwn4O4vMOWIlToFSv
         eCUZmdtmj5NECv1mgIRqTyRZ+XliUL9o3417dRhYkE4RoDIADU2OK86TvKqjnzUy61w4
         5fFW7ZgkyDkJecloIXWHskPiS4Vs/HGCVAYlAbVaTMuqvfFFkwDMr6RGAkL+5sCYXcqa
         NkYW9rsPUTfc36gWtg4eVLTvfckbrNHi8N8YVyZFyBN/C/jjwfn2ZLAOoNXrotUOxtsO
         QJmQ==
X-Forwarded-Encrypted: i=1; AL+hErHcWYuB286sS/M1n1zgPw2Hq+ETa/dTwRtAsQ/n2gPGmOLYp+KMCsNoGJ550gwM/grCe5IwEqd063tLE8VkBa2H@lists.infradead.org
X-Gm-Message-State: APuU4Z9bMkVuIW93FS6j4xI2aIpzwL96rZ2X5viBo12/wvvfsTUGpkBM
	/LtnaIBsTzXT15j3W4MVQh1ma83aAzVDxiWaDhlPzRFs1y6y23UNhCWquTduoYQPvvY=
X-Gm-Gg: AZFdTZc0Z7FmZtA7O090l3+BmWfmCszhp72jBOzpMg56hz21xtLIjpxIbSrHHYUbdb/
	D7WGYMmu8/jUxw8Egey4u8WQlyiajbwTZHpOshbYO7o3xEM5XQGfnwM3A6bRgmKg9DzarMBSTJV
	qlSM7XZT1sQe+VueyIkP1ADTcx32YHn2VooK1K7tIgYfmrZdNm4G435RGyaDlPOvFjWnzDhrI6z
	W3zsZUjJQuIckSXSVTkvj9ob7XHjA67MdJjGgPBaEQnkrIuy9HYT0TqS32zCOqFLOnP7VyJvQne
	BzcmVJwoVDx9iIjv6BlerSZkVUKimSiRKD+7a3H1xNoN91UVzftmWCyu34QQaH2D8Y9q/FuYfXX
	2oIYerQikz4TuEUZmyXKSs9apOk26N4jyGyqQufaApJshpLZxIo56PclO71kljPyvyIl6CYBYay
	0bw8/svhKbb4HZEP3nteJf/2DxAXnr5aKh1SLEpKSK/CupG6b+PSmdTX9O9Zgq2BuYn6rc8m6bw
	8+DDrkDzaf6FxYL+Ea7P7Gqd7SdsBv3gj+DoQk0lVm7U+1DtrFJWq+nNdWXMtazb1me9QGTPpow
	pP0VdPyYbLhzVdHR84j/cOonbFs9Hcm7YXbEqAMyvlOOtcTV
X-Received: by 2002:a05:6000:2210:b0:48d:facb:5937 with SMTP id ffacd0b85a97d-4abab5ea340mr24200572f8f.7.1795445625624;
        Mon, 23 Nov 2026 06:53:45 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21988037f8f.56.2026.11.23.06.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:44 -0800 (PST)
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
Subject: [PATCH v3 09/28] dmaengine: bcm2835: move CB final extra info generation into function
Date: Mon, 23 Nov 2026 15:56:47 +0100
Message-ID: <20261123145728.29082-10-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065347_297554_505D65A5 
X-CRM114-Status: GOOD (  14.97  )
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

Similar to the info generation, generate the final extra info with a
separate function. This is necessary to introduce other platforms
with different info bits.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index adf3508246ec..77b3e2f58ac5 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -253,6 +253,26 @@ static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
 	return result;
 }
 
+static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
+					enum dma_transfer_direction direction,
+					bool cyclic, bool final,
+					unsigned long flags)
+{
+	u32 result = 0;
+
+	if (cyclic) {
+		if (flags & DMA_PREP_INTERRUPT)
+			result |= BCM2835_DMA_INT_EN;
+	} else {
+		if (!final)
+			return 0;
+
+		result |= BCM2835_DMA_INT_EN;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -668,7 +688,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
+						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -699,7 +720,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -747,7 +768,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	dma_addr_t src, dst;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
 					       buf_addr == od->zero_page);
-	u32 extra = 0;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -763,9 +784,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	if (flags & DMA_PREP_INTERRUPT)
-		extra |= BCM2835_DMA_INT_EN;
-	else
+	if (!(flags & DMA_PREP_INTERRUPT))
 		period_len = buf_len;
 
 	/*
-- 
2.51.0


