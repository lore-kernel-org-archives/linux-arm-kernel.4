Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4A0606A8B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ahRdvMxY;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MX186qlK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=njjyBXz9L58T+lg+LdB1WaYpD3pBpeVCDltq1wefIsE=; b=ahRdvMxYTZ9ABTdT8FdpGJEOLY
	XYzWx/FDfq7r/xol3JiiKF5Yf7L8XIzp0LiYlpb6FDB6DCEpa7GQDWfGw0IdJkmPdxxYQGPE04Hjf
	Hud+/CeqHaBbKnknzUyNsgnA2/SoDQmXwAQw5AScMaCiwC45b9xVodggmWBiKHSWvfVtof+aE/pGw
	qqjB2tJzpyZZsD1EcUddhA8Zw7EXge8J2K0l1AIer57BER9sGQ+SJ+yA/vQbrJi5ZrDm+/4drC3oM
	MjCjgMJAHkRjQnc23AfSfqIgjcC1yOz4fR5DKBqF4ieHBTRbDrPdDvs1Mf7Dxgf7F/aSCA1B9SNte
	xYpP7sVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO85-00000008nJG-3RiD;
	Thu, 12 Nov 2026 06:17:49 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO81-00000008nI9-0Ugl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:17:47 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cd652c0385bso2685569a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 22:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794464263; x=1795069063; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=njjyBXz9L58T+lg+LdB1WaYpD3pBpeVCDltq1wefIsE=;
        b=MX186qlK3lboQOYY5xsxJHtVGMbIZLZ3zhkgPoOYT2rtoBJo5T9hq2L+dEqcP2eHye
         RLtJREoIoe3FqqNM3tuXBJqDnzweS5stl5C/4mUDFei48KyXLBLsAHzlOEb7/lu/qe3r
         qIuxvX1WmLZ7iGgbCtEzLVU6MRvWxKwG7N+Wuo65e+pYoTcXmkcmxy1vSdi5oECPCMW8
         9JmIM3BkjRNuvLMUTVoWdeqVYQKwLOBgC6sJ/ml8GMGp/W7jbN3285r3jl88FosUXY1e
         +Ep7bawKg86wjcty3RcyBJBaUxHUMpVZg8B1+pYqHBYEqRvOWtb9GaghB/0RTfvbFgnV
         MX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464263; x=1795069063;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njjyBXz9L58T+lg+LdB1WaYpD3pBpeVCDltq1wefIsE=;
        b=zXLyNW7PvDog/T5r+pe3j0OZ9w1oht3/FoOyWa/kSq4WdMnJi/U9E5I+6bAUlNxIlv
         abkfgDgUibb2VXEYvFuGzE68UExJxgjiVhcdOqr0yaRm1cRxJv5lXIsQTWhJQtW4XPbt
         A6B8Ye4al3dssoD8IKwpCUvZzdEeGnJAooNfq9g2ygRBsWp7KLVlG7FKI9tb/noT91Cp
         wcHXcVutlgz3vBTO7cj537G4ESW+Fyo0foNIRHKVXCi6qVIci1LrTkreSEhBMmpKmY6S
         PcmDCcHFju8PSapomcX8PDsSyin9EQ8yUrz0Po1eg4jv1e6NEOzN1lVjhzzpkxHTRRlL
         74LA==
X-Forwarded-Encrypted: i=1; AL+hErGJUQt2O6U3L73fAry4cJSKlC1qar83DzauOa4BBC3pWSDIkkEN72C27RaW7qeOjPe67ZXT0vKn5HV+GIvbICzb@lists.infradead.org
X-Gm-Message-State: APuU4Z9npsMbLSdj7bi7Ckz5x1gTCz35DK80MBccWlWmyrK0tnTaTaHs
	6Nw5hivxPtlqyl5A1esUnCghtYigG+lFCmFrTe4ZUNsNmsw1NM0sD+mFpAKpFC2mT28mt/YNrjs
	m0XhGnVJy3Q==
X-Received: from pjbga7.prod.google.com ([2002:a17:90b:387:b0:3ab:3979:1be4])
 (user=yidilin job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2584:b0:3ac:7556:8eed
 with SMTP id 98e67ed59e1d1-3b182f8532dmr4081954a91.44.1794464263018; Wed, 11
 Nov 2026 22:17:43 -0800 (PST)
Date: Thu, 12 Nov 2026 14:17:36 +0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261112061736.4014993-1-yidilin@google.com>
Subject: [PATCH] drm/mediatek: dp: Wait for the complete AUX reply before
 reading it
From: Yidi Lin <yidilin@google.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fei Shao <fshao@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Yidi Lin <yidilin@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_221745_160977_E59BABE1 
X-CRM114-Status: GOOD (  17.12  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_dp_aux_wait_for_completion() returns for a read as soon as the RX
FIFO write pointer is non-zero, i.e. when the first byte of the reply
has arrived. The rest of the reply is still on the AUX line, so
mtk_dp_aux_read_rx_fifo() sleeps 500-1000 us before reading each byte
of an I2C-over-AUX reply and 100-200 us before each byte of a native
reply. The FIFO is drained this way even for DEFER replies, which carry
no data.

A 16-byte EDID read therefore takes about 16 ms, although the reply is
complete within about 300 us of the request.

Wait for the AUX receive-complete (or 400 us timeout) interrupt status
instead, which the write path already relies on, and drain the RX FIFO
without delays. Poll every 20 us instead of every 100-500 us.

Reading the 256-byte EDID through the DP AUX DDC adapter drops from 266
to 6.5 ms on an MT8189 Chromebook, and from 547 to 23 ms on an MT8196
Chromebook whose panel defers every 16-byte read once. A 16-byte DPCD
read drops from about 4.7 to 0.5 ms.

Signed-off-by: Yidi Lin <yidilin@google.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 64 ++++++++++++-------------------
 1 file changed, 25 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index f656b85b84212..b2f7f42cbe715 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -45,7 +45,8 @@
 #define MTK_DP_4P1T 4
 #define MTK_DP_HDE 2
 #define MTK_DP_PIX_PER_ADDR 2
-#define MTK_DP_AUX_WAIT_REPLY_COUNT 20
+#define MTK_DP_AUX_POLL_US 20
+#define MTK_DP_AUX_TIMEOUT_US 10000
 #define MTK_DP_TBC_BUF_READ_START_ADDR 0x8
 #define MTK_DP_TRAIN_VOLTAGE_LEVEL_RETRY 5
 #define MTK_DP_TRAIN_DOWNSCALE_RETRY 10
@@ -825,20 +826,18 @@ static void mtk_dp_aux_fill_write_fifo(struct mtk_dp *mtk_dp, u8 *buf,
 }
 
 static void mtk_dp_aux_read_rx_fifo(struct mtk_dp *mtk_dp, u8 *buf,
-				    size_t length, int read_delay)
+				    size_t length)
 {
 	int read_pos;
 
 	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3620,
 			   0, AUX_RD_MODE_AUX_TX_P0_MASK);
 
+	/* The complete reply is in the RX FIFO, so read it without delays. */
 	for (read_pos = 0; read_pos < length; read_pos++) {
 		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3620,
 				   AUX_RX_FIFO_READ_PULSE_TX_P0,
 				   AUX_RX_FIFO_READ_PULSE_TX_P0);
-
-		/* Hardware needs time to update the data */
-		usleep_range(read_delay, read_delay * 2);
 		buf[read_pos] = (u8)(mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3620) &
 				     AUX_RX_FIFO_READ_DATA_AUX_TX_P0_MASK);
 	}
@@ -864,33 +863,28 @@ static void mtk_dp_aux_set_length(struct mtk_dp *mtk_dp, size_t length)
 	}
 }
 
-static int mtk_dp_aux_wait_for_completion(struct mtk_dp *mtk_dp, bool is_read)
+static int mtk_dp_aux_wait_for_completion(struct mtk_dp *mtk_dp)
 {
-	int wait_reply = MTK_DP_AUX_WAIT_REPLY_COUNT;
-
-	while (--wait_reply) {
-		u32 aux_irq_status;
-
-		if (is_read) {
-			u32 fifo_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3618);
-
-			if (fifo_status &
-			    (AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK |
-			     AUX_RX_FIFO_FULL_AUX_TX_P0_MASK)) {
-				return 0;
-			}
-		}
-
-		aux_irq_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3640);
-		if (aux_irq_status & AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0)
-			return 0;
+	u32 aux_irq_status;
+	int ret;
 
-		if (aux_irq_status & AUX_400US_TIMEOUT_IRQ_AUX_TX_P0)
-			return -ETIMEDOUT;
+	/*
+	 * Wait until the whole reply has been received. The RX FIFO write
+	 * pointer becomes non-zero as soon as the first byte of the reply
+	 * arrives, while the rest of the reply is still on the AUX line, so
+	 * it cannot be used to tell that the reply is complete.
+	 */
+	ret = regmap_read_poll_timeout(mtk_dp->regs, MTK_DP_AUX_P0_3640,
+				       aux_irq_status,
+				       aux_irq_status &
+				       (AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0 |
+					AUX_400US_TIMEOUT_IRQ_AUX_TX_P0),
+				       MTK_DP_AUX_POLL_US, MTK_DP_AUX_TIMEOUT_US);
+	if (ret)
+		return ret;
 
-		/* Give the hardware a chance to reach completion before retrying */
-		usleep_range(100, 500);
-	}
+	if (aux_irq_status & AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0)
+		return 0;
 
 	return -ETIMEDOUT;
 }
@@ -928,7 +922,7 @@ static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u8 cmd,
 	mtk_dp_aux_request_ready(mtk_dp);
 
 	/* Wait for feedback from sink device. */
-	ret = mtk_dp_aux_wait_for_completion(mtk_dp, is_read);
+	ret = mtk_dp_aux_wait_for_completion(mtk_dp);
 
 	*reply_cmd = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
 		     AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
@@ -952,15 +946,7 @@ static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u8 cmd,
 				   AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
 				   AUX_RESERVED_RW_0_AUX_TX_P0_MASK);
 	} else if (is_read) {
-		int read_delay;
-
-		if (cmd == (DP_AUX_I2C_READ | DP_AUX_I2C_MOT) ||
-		    cmd == DP_AUX_I2C_READ)
-			read_delay = 500;
-		else
-			read_delay = 100;
-
-		mtk_dp_aux_read_rx_fifo(mtk_dp, buf, length, read_delay);
+		mtk_dp_aux_read_rx_fifo(mtk_dp, buf, length);
 	}
 
 	return 0;
-- 
2.56.0.611.g1030f0b940-goog


