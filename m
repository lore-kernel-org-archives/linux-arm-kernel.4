Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A883606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h4LJDYc/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NmWz8jP+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YenrZl3hmSAY7ejSkR12CtlW5G70ME9GdBpP9A17E5o=; b=h4LJDYc/7c0OhJcF1A6Zd4oP9H
	0sZ/ZbHX+bvlTCYcwPHWchu3dPplkV2XKdJ7zBwrfd4vQuHp5JvVcwrqzJczIMnCRZiCsgy1xt/rm
	K/0IxZKoiFXeOjbjlSSnEWski3pStQ7M7EovgXPM3XlgzsPJXk1zhfx1ZuEJ1KAUxdOGtPXzt/vRV
	DnKlrjuVU0dEBlfI+iHGRYFIoPybVBLLSZZKEElu/QGgYmeT+ZfZl5iWKxLBY+4yjYNjiJUS7lnb2
	A5/Gn3sw8WW/nqvUTmh/2pGGXASYEL9t/JdZ6GCtUFcRpboyQaKNBYASfepscpNTsTBoK/Bis+MeI
	SB7yy/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPQU-0000000FEOy-12v3;
	Fri, 20 Nov 2026 14:17:18 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPQI-0000000FENF-0gLr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:17:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so8592825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 06:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184224; x=1795789024; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YenrZl3hmSAY7ejSkR12CtlW5G70ME9GdBpP9A17E5o=;
        b=NmWz8jP+qeoS6xMaZBHqOBlmOBQiK45QCFdi3Uj/y6VhJWqkcKB1+cmFD8Q+R8eEiB
         eq+x3tjzDOVYaSoskMLTPNjnya7odssvv5LETyLsws7gNG9zAzAj+wyIuzb+QD4oNJxS
         WhhZhT1ju5WDB/AMTgwjYQQsNnM2fw4RoHlG7BjyDBBenUrh5ooDCh6x7tx5X7MqWXua
         8uWL7Pl7KKFzm9uq2jTTU2ys9MJxvh+O3w78B5xQE9i5AaWMbglTUxCa3AQoWD2kmc7h
         H4wsTZvJO8L1IyLL1e1yPlSed0lr2EPkK9N91/1JRHpSt7wrXWutGn8sP2gSQ7KeUGXQ
         kNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184224; x=1795789024;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YenrZl3hmSAY7ejSkR12CtlW5G70ME9GdBpP9A17E5o=;
        b=QwcNpVTajxwfWKo4anKbuiWyPvd3Wt1Um2H2PJCX3DXr3gXKLfi653QQ/QVPTphqbL
         z+1ztQZKn3OXnRdfeFd30IaVcUY1Fl2trIMWVXnfFZ4UY9XDF7NSVDGMZHHlToR8lr4S
         ufhX6pQY5QegpAXmSkrxZrTFAOjvA4/YyzWM+KP/ZYoZTC9WNBeitaQ5F93ZCrhsdwLC
         l4WJI6DVM8bEC147ldCNOf4djqwDpZNvJ9oaPvKu8g3BMLl4V5ESJcNKZgFWKmX3DU70
         UD0u/IY0qT+BsZB/z4HCta7RgjVLC7gk23x2jy0Rgyro4219wvjXTuNtwdUfQ6nY2JP8
         W9bw==
X-Forwarded-Encrypted: i=1; AL+hErHtyk4Gw47nlFAurKUVsoiTVcxG1LW/rVrnq6pEhK3cnFWbJAgVbgztB7oIiLbkLHr5HIo0i93LGudKIHIitAAY@lists.infradead.org
X-Gm-Message-State: APuU4Z+7POgwfwMGJ+O04ZczUNDQxonOwWxsUf9lFI2aDU0Jw+JWCpMG
	Zik0B8uYqPGZ2sDr/m6IJpxzNpBVlqc821RADRuUj3fwv3A/J059Y3BD
X-Gm-Gg: AYBFou0M8m7SHucdtGvD8lOl4BGFDg46+dIPFF20dTXDATNnrq92iQnzLZrvp3A4+VC
	mtrY91gdjyZbYgais1PJX1udluA5nd7weasBRRcLmz5oLwlmAGBLA0ce32LSm/I9ZqtAjE0LiLN
	MV4GNIJXrsSFeRgpy4UaFDRpkKDyoUM9ySjeIUz0WGbqQl7J94a0fwJkABGUFFTw6+mQx2Wh+UR
	UqgTQSXZWaO0iuh6HSxwznRo6OSDLIKhMS9oEKxI5NYCXz0xMN3mxHown6p5cpmFFFcyLlzc3g/
	sZ6Ji3ZuJGDmIXFuZ2gaa4ZhHADb4gVQMLcsNMqEUQOBQon+0BiscYHjA44FfMsOEGoJFnzklxe
	PVv+HH8e1U6qrmXjrQPE7Y0Xy9JBPIKLrHROFoIafunkQcbuXyFXy1vYP1qwDSHRgc+i5ZL4TZ7
	bV2Z07cMb4NHp54VxmLDldRFMSKfWa8QJVXeJOV3nBfsOfVEdQOF5R6XkHTe9J8rIHdbZ2koiZO
	ZCGJQjo86ECYNh4NJZFPxTOmTTmZ9T4jOGNuqrS3tIp9e0DFiJ+R8hhxUubCE5UNju/P11H32FZ
	bqAVLG0VhiUECjBvtDooEhT0g1kT+osqUBHS9KWkypwQVnhkKlR8rE82jlhmEw3x9+7/H3O2HDt
	N+uiMZaeISw==
X-Received: by 2002:a05:600c:1548:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4bb88800013mr79322935e9.6.1795184223724;
        Fri, 20 Nov 2026 06:17:03 -0800 (PST)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm6303181f8f.11.2026.11.20.06.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:17:03 -0800 (PST)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Fri, 20 Nov 2026 15:16:47 +0100
Subject: [PATCH] net: stmmac: reset the DMA on a fatal bus error
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-stmmac_dma_fatal_error-v1-1-acd57921af57@cherry.de>
X-B4-Tracking: v=1; b=H4sIAE5WAGsC/yXMQQrCMBBA0auUWRtIIrTFq4iEMZm2I6aVmSiF0
 rs36vIt/t9ASZgULs0GQh9WXuYKd2ogTjiPZDhVg7e+dc5boyVnjCFlDAMWfAYSWcQk36bOoT3
 bHqHGL6GB19/4evtb3/cHxfK9wb4fbqA76HoAAAA=
X-Change-ID: 20261120-stmmac_dma_fatal_error-d26d71a0308a
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 jakob.unterwurzacher@cherry.de
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795184222; l=6954;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=3uMSgXMdRbOFX8wu5fHoR/8jADm3lm8qiqodLAVFHcA=;
 b=fYNBYLOp6/xaagslBSZ3O+L9wekUNbY2QeMUTj7tFArTwMYhU0aO++SgEIuCdWyAjdfu5ylVo
 EBHmKPcxMNtAHYYf3pNlFP1wJNvxDh2UItPsufLBGeAr5tVLqOdY0Ga
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_061706_353110_935C31AF 
X-CRM114-Status: GOOD (  18.45  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

A fatal bus error (FBE) stops both the TX and the RX DMA engine of the
channel. The DMA interrupt handlers report it as tx_hard_error, so
stmmac_tx_err() reinitializes and restarts the TX side only. The RX DMA
stays stopped: the RX descriptors remain owned by the DMA, the MAC
drops every received frame (mmc_rx_fifo_overflow grows) and nothing is
logged. The only trace is the fatal_bus_error_irq counter in
ethtool -S. The interface needs a manual down/up to recover.

This happens on RK3588 (dwmac4) after resume from suspend-to-RAM,
roughly once in 300-500 resumes: DMA_DEBUG_STATUS0 shows the RX process
of channel 0 stopped (RPS0 = 0), DMA_CH0_RX_CONTROL has SR cleared,
while TX keeps running.

Report a fatal bus error as a separate dma_fatal_error status and
handle it like other fatal errors with stmmac_global_err(), which
resets the adapter from the service task. Do so in the shared and in
the per-channel MSI interrupt paths, and for all DMA cores that report
the error (dwmac100/1000, dwmac4, dwxgmac2, loongson).

Tested on RK3588-Tiger where it catches and recovers the observed
hangs after resume.

Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
 drivers/net/ethernet/stmicro/stmmac/common.h       |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 29 +++++++++++++++++++++-
 6 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index c74bc7c9750e9..1f74cb451215f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -376,6 +376,7 @@ enum dma_irq_status {
 	tx_hard_error_bump_tc = 0x2,
 	handle_rx = 0x4,
 	handle_tx = 0x8,
+	dma_fatal_error = 0x10,
 };
 
 enum dma_irq_dir {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index a42d80ead9d40..0a15f5565106c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -268,7 +268,7 @@ static int loongson_dwmac_dma_interrupt(struct stmmac_priv *priv,
 		}
 		if (unlikely(fb_intr_status)) {
 			x->fatal_bus_error_irq++;
-			ret = tx_hard_error;
+			ret |= dma_fatal_error;
 		}
 	}
 	/* TX/RX NORMAL interrupts */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index a0249715fafaf..2147403629892 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -165,7 +165,7 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 		}
 		if (unlikely(intr_status & DMA_CHAN_STATUS_FBE)) {
 			x->fatal_bus_error_irq++;
-			ret = tx_hard_error;
+			ret |= dma_fatal_error;
 		}
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index a0383f9486c2d..3f3f2f623bd3e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -204,7 +204,7 @@ int dwmac_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 		}
 		if (unlikely(intr_status & DMA_STATUS_FBI)) {
 			x->fatal_bus_error_irq++;
-			ret = tx_hard_error;
+			ret |= dma_fatal_error;
 		}
 	}
 	/* TX/RX NORMAL interrupts */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 0a6e82a155c0e..bc06076410dc7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -335,7 +335,7 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
 		}
 		if (unlikely(intr_status & XGMAC_FBE)) {
 			x->fatal_bus_error_irq++;
-			ret |= tx_hard_error;
+			ret |= dma_fatal_error;
 		}
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 25894771e9e9f..16ba83db34546 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -349,6 +349,24 @@ static void stmmac_global_err(struct stmmac_priv *priv)
 	stmmac_service_event_schedule(priv);
 }
 
+/* A fatal bus error stops both the TX and the RX DMA of the channel. Only a
+ * reset of the DMA brings them back, so restarting the TX side alone is not
+ * enough: RX would stay stopped without any further error.
+ */
+static bool stmmac_dma_fatal_error(struct stmmac_priv *priv, int status,
+				   u32 chan)
+{
+	if (likely(!(status & dma_fatal_error)))
+		return false;
+
+	if (net_ratelimit())
+		netdev_err(priv->dev, "DMA fatal bus error on channel %u\n",
+			   chan);
+	stmmac_global_err(priv);
+
+	return true;
+}
+
 static void print_pkt(unsigned char *buf, int len)
 {
 	pr_debug("len = %d byte, buf addr: 0x%p\n", len, buf);
@@ -3169,6 +3187,10 @@ static void stmmac_dma_interrupt(struct stmmac_priv *priv)
 		status[chan] = stmmac_napi_check(priv, chan,
 						 DMA_DIR_RXTX);
 
+	for (chan = 0; chan < channels_to_check; chan++)
+		if (stmmac_dma_fatal_error(priv, status[chan], chan))
+			return;
+
 	for (chan = 0; chan < tx_channel_count; chan++) {
 		if (unlikely(status[chan] & tx_hard_error_bump_tc)) {
 			/* Try to bump up the dma threshold on this failure */
@@ -6533,6 +6555,9 @@ static irqreturn_t stmmac_msi_intr_tx(int irq, void *data)
 
 	status = stmmac_napi_check(priv, chan, DMA_DIR_TX);
 
+	if (stmmac_dma_fatal_error(priv, status, chan))
+		return IRQ_HANDLED;
+
 	if (unlikely(status & tx_hard_error_bump_tc)) {
 		/* Try to bump up the dma threshold on this failure */
 		stmmac_bump_dma_threshold(priv, chan);
@@ -6549,6 +6574,7 @@ static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
 	struct stmmac_dma_conf *dma_conf;
 	int chan = rx_q->queue_index;
 	struct stmmac_priv *priv;
+	int status;
 
 	dma_conf = container_of(rx_q, struct stmmac_dma_conf, rx_queue[chan]);
 	priv = container_of(dma_conf, struct stmmac_priv, dma_conf);
@@ -6557,7 +6583,8 @@ static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
 	if (test_bit(STMMAC_DOWN, &priv->state))
 		return IRQ_HANDLED;
 
-	stmmac_napi_check(priv, chan, DMA_DIR_RX);
+	status = stmmac_napi_check(priv, chan, DMA_DIR_RX);
+	stmmac_dma_fatal_error(priv, status, chan);
 
 	return IRQ_HANDLED;
 }

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261120-stmmac_dma_fatal_error-d26d71a0308a

Best regards,
--  
Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>


