Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829E1606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GUnjoDp6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbxKnJgH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wt5LWMmbRJFmiS12kIE0gT6JGLRxJ/2kkyK9TiUM9LI=; b=GUnjoDp6VUJS5Q
	muFUHQGGb6H9mkzvo1pVCmG9Mj40b9HJZfeXi0YYqnM1oh46JV2jCUgOdGteKuXRgg64qQQrM/pau
	Qv8XSXg/G8zpJRwfYTLoHVTFJacdF5EOrXW2ppiGICbpH9xW0OLHVyd9UtRd9RaKQ/1SlMix2yhQH
	GPe1dv1Q5CqjjfYsaPFt4S3RpGZi5f3Jn5bLpxRL4W+idDQBQwUZZdGj5l5kGXdPKS8imdk1Jh6RL
	rj+NhOxlCq6y2MpbNaSz6h7Ov0fZ4CKF7BUKpHYI7MtUMm9Hztcx1fXIxCYuQrvwAVFwHKA+l14rn
	31tRUjBFFYymSC8lgl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQbH-0000000FRCD-3zX7;
	Fri, 20 Nov 2026 15:32:32 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQb9-0000000FRAG-1nZa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:32:25 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6d68de53053so746321eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 07:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188742; x=1795793542; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wt5LWMmbRJFmiS12kIE0gT6JGLRxJ/2kkyK9TiUM9LI=;
        b=HbxKnJgHtLFeT/qTEjM0Y6P6WYqc4oS7ZkN7aRK7YdnHHGNToZ6IYrbDq6jPRZMKmD
         UeBe9waHknSB6Td0ZAhKgMLb2BmHclMGuG+Fl8KIdQbfn5LxLCXqmdj2I9rPi00iewTJ
         gmXE8s0w5tJmvS/izDARZkTHSQrUHCIv5RIRVV1kk7il8mY6to61FV8Ijq4buHJxY52F
         45k5Z9ayCptVNwXFgVhuGgqSecKovr4vjc43gH0C1BGgyeW3FchCSAxFEX+BqQHPQX55
         iv0EubaAE7udyFW7+0xMyBmp65AYMf37AlPl/QieclGyC6xnZbUneB1B9SEmrE/8vzts
         VU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188742; x=1795793542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wt5LWMmbRJFmiS12kIE0gT6JGLRxJ/2kkyK9TiUM9LI=;
        b=cg1LgylfmENQWtqtXkth85WHmjdGJwS61HoKF8J4+gI22EOOpmelAx48dOXnWhEHdD
         wE0rcAPvFGN03F5qK/xbA0Olq4KZl2CvMw+ZCilNRD9Wy7kDmH7+3506WWJ0lQ6/BXp+
         g1iwhTdeIHlDBzzd+HEBpqvRmMjTqXAKxqs3puK/3D51SuZAYowIozMABGgYoRzjA0YX
         yWeGIM62hvQ8GFGZsGMHSMdoziV8cfERZFAxx44AF/9MMbayXEGWmn0UZV38mY2aBsXE
         BefoyBSSMPGTrJQQJC7gDkP7b2yoowJiD0lBF8UqR86XyNZWDRDZWnQp8oSsCXDbnLVj
         xeog==
X-Forwarded-Encrypted: i=1; AL+hErHXhuPs9e2H/LORAB6Jj1yu6DUmx0v2bcfL+aetWmnrAGbYU6t3XQmwb6d9gWQv+sryL3TIKNE58Koc5Zn1hESk@lists.infradead.org
X-Gm-Message-State: APuU4Z+g0l3b6qzIQaG9jTjj1ysImj2FpEQYz2l9hHBGqueg4AFkgVzY
	uOqgoxd84eziykm6RQlWnRZJmtkCmgx4B/UchcuSDe3iWIHluzhEk0z2
X-Gm-Gg: AYBFou3LJbo1bctEu3B2rADDi3ji2FMMVqU8HKWItX6U9ajilpDxFcQDuBItk2FWUBz
	S4Fn0dco75s8THxsvoNV5fievVhPiGv97tjVUmHRCgiB34uL7RWM7teWIvH8hpXbgKD8tSMeb0r
	HM10RELCFOYk2OlA9PjwG6ol1VX9wXUtAfkEknVxtbB1dEPDuCpVqiLlEmr8IDMc7M74JBaD0ZW
	Rgt6Dj1mhJuNxfA6TMmJzDVDtpp8lkpmePlElMlJoI3KcJt4NnuICv1sY4uySyHZmPrK1OZBrM4
	HwnYHW4/dcNw3q1dpuKsU7E4dxR0gBC41bgndYl6Qfs9yechxwCvaJbGMlPS55kUfAot0fdW+eM
	JL0ZHPZ1Gd7+gB0SrGhnG2S8tL4F1aXgTq7d5UvSWp7qfLtyd0wlbjFmabmbhmUHWgoN/9I5oAq
	z810D9o0Ut0mG07JpTthTk1MCvYD8zJZAXfk4/PbgV9tAaK3HX34t1P8KAXKDCbYld9r6B9b7lc
	LizgnGaM+4v7JJkyFIBCajhOyjNU0B0z+/zlu/esoFhfMeAvXvU1VtvfZAkxnXUcTaXXlIRgT+T
	ONOi4YFqBmd1V3B0gLl0NBGU8bKQomu0aq7/2RVZoUItmsgHoAm9Pukn3aKA4+yYFscg/PTDuYe
	IgeGOlD8WYIe7c7P5XZ7AY2H7f7Ac+6HVLQzkauzEQq3jR3IwVSu7XtGo8f3vaFhIwSDn4WlfwQ
	fzDBAwrOTgEAK/1X12h2WkEm8JP89HCFPup2fSRgxgAkrN1kzfSpsAOuSm5za1nUSRIen0Ke9l
X-Received: by 2002:a05:6820:8582:20b0:71a:de33:9236 with SMTP id 006d021491bc7-71b395ad565mr1859091eaf.87.1795188742194;
        Fri, 20 Nov 2026 07:32:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380bdff9sm2159605eaf.11.2026.11.20.07.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:32:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 08:32:05 -0700
Subject: [PATCH net-next 1/2] net: stmmac: dwmac-sun8i: deliver RX checksum
 errors to the stack
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sun8i-rx-features-v1-v1-1-5058fecba6b3@gmail.com>
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
In-Reply-To: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_073223_635726_EC615C56 
X-CRM114-Status: GOOD (  23.38  )
X-Spam-Score: -1.9 (-)
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

The sun8i MAC drops packets with a bad IP or transport checksum before
packet sockets or the protocol stack can see them, even with RX checksum
offload disabled. Its error-forwarding bit controls Ethernet and IP
errors together.

Enable error forwarding and decode the sun8i RX status in both receive
paths. Give checksum failures and unchecked packets to the stack with
CHECKSUM_NONE. Continue to discard Ethernet errors, incomplete frames
and lengths that cannot fit in the receive buffer. Address filter and
VLAN indications are not checksum errors.

Keep the hardware checker running whenever the receiver is enabled.
Turning RX checksum reporting back on can then use the result already
recorded in queued descriptors without flushing the ring.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 98 ++++++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  7 +-
 4 files changed, 94 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index a972bee66504..706feb7bcbed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -615,6 +615,8 @@ struct mii_regs {
 struct mac_device_info {
 	const struct stmmac_ops *mac;
 	const struct stmmac_desc_ops *desc;
+	/* Defaults to the descriptor format's decoder unless the MAC overrides it. */
+	int (*rx_status)(struct stmmac_extra_stats *x, struct dma_desc *p);
 	const struct stmmac_dma_ops *dma;
 	const struct stmmac_mode_ops *mode;
 	const struct stmmac_hwtimestamp *ptp;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..0ad2203f76c3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 Corentin Labbe <clabbe.montjoie@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -197,6 +198,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in RX_CTL1*/
 #define EMAC_RX_MD              BIT(1)
+#define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0
 #define EMAC_RX_TH_64		(0x1 << 4)
@@ -644,6 +646,9 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
 
 	v = (8 << EMAC_BURSTLEN_SHIFT); /* burst len */
 	writel(v, ioaddr + EMAC_BASIC_CTL1);
+
+	/* Forward checksum failures to software before starting RX. */
+	writel(EMAC_RX_ERR_FRM, ioaddr + EMAC_RX_CTL1);
 }
 
 static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
@@ -654,7 +659,7 @@ static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
 	r = readl(ioaddr + EMAC_RX_CTL0);
 	if (enable) {
 		t |= EMAC_TX_TRANSMITTER_EN;
-		r |= EMAC_RX_RECEIVER_EN;
+		r |= EMAC_RX_RECEIVER_EN | EMAC_RX_DO_CRC;
 	} else {
 		t &= ~EMAC_TX_TRANSMITTER_EN;
 		r &= ~EMAC_RX_RECEIVER_EN;
@@ -698,16 +703,9 @@ static void sun8i_dwmac_get_umac_addr(struct mac_device_info *hw,
 			    EMAC_MACADDR_LO(reg_n));
 }
 
-/* caution this function must return non 0 to work */
-static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
+static int sun8i_dwmac_rx_ipc(struct mac_device_info *hw)
 {
-	void __iomem *ioaddr = hw->pcsr;
-	u32 v;
-
-	v = readl(ioaddr + EMAC_RX_CTL0);
-	v |= EMAC_RX_DO_CRC;
-	writel(v, ioaddr + EMAC_RX_CTL0);
-
+	/* The receiver always records the checksum result, even with RXCSUM off. */
 	return 1;
 }
 
@@ -1053,7 +1051,7 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.core_init = sun8i_dwmac_core_init,
 	.set_mac = sun8i_dwmac_set_mac,
 	.dump_regs = sun8i_dwmac_dump_mac_regs,
-	.rx_ipc = sun8i_dwmac_rx_ipc_enable,
+	.rx_ipc = sun8i_dwmac_rx_ipc,
 	.set_filter = sun8i_dwmac_set_filter,
 	.flow_ctrl = sun8i_dwmac_flow_ctrl,
 	.set_umac_addr = sun8i_dwmac_set_umac_addr,
@@ -1061,6 +1059,83 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.set_mac_loopback = sun8i_dwmac_set_mac_loopback,
 };
 
+static void sun8i_dwmac_rx_error_stats(struct stmmac_extra_stats *x, u32 status)
+{
+	if (status & RDES0_DESCRIPTOR_ERROR)
+		x->rx_desc++;
+	if (status & RDES0_OVERFLOW_ERROR)
+		x->overflow_error++;
+	if (status & RDES0_RECEIVE_WATCHDOG)
+		x->rx_watchdog++;
+	if (status & RDES0_SA_FILTER_FAIL)
+		x->sa_filter_fail++;
+	if ((status & RDES0_FRAME_TYPE) && (status & RDES0_IPC_CSUM_ERROR))
+		x->ipc_csum_error++;
+	if (status & RDES0_COLLISION)
+		x->rx_collision++;
+	if (status & RDES0_CRC_ERROR)
+		x->rx_crc_errors++;
+	if (status & RDES0_MII_ERROR)
+		x->rx_mii++;
+	if (status & RDES0_LENGTH_ERROR)
+		x->rx_length++;
+}
+
+static int sun8i_dwmac_rx_status(struct stmmac_extra_stats *x, struct dma_desc *p)
+{
+	const u32 csum_mask = RDES0_IPC_CSUM_ERROR | RDES0_PAYLOAD_CSUM_ERR;
+	const u32 dma_errors = RDES0_DESCRIPTOR_ERROR | RDES0_OVERFLOW_ERROR;
+	const u32 wire_errors = RDES0_CRC_ERROR | RDES0_MII_ERROR |
+				RDES0_RECEIVE_WATCHDOG | RDES0_COLLISION |
+				RDES0_LENGTH_ERROR;
+	u32 status = le32_to_cpu(READ_ONCE(p->des0));
+	u32 len = FIELD_GET(RDES0_FRAME_LEN_MASK, status);
+	bool runt = len < ETH_ZLEN + ETH_FCS_LEN;
+
+	if (unlikely(status & RDES0_OWN))
+		return dma_own;
+	if (unlikely(!(status & RDES0_LAST_DESCRIPTOR)))
+		return discard_frame | rx_not_ls;
+	if (unlikely(!(status & RDES0_FIRST_DESCRIPTOR))) {
+		x->rx_length++;
+		return discard_frame;
+	}
+
+#ifdef STMMAC_VLAN_TAG_USED
+	if (status & RDES0_VLAN_TAG)
+		x->vlan_tag++;
+#endif
+	if (unlikely(status & RDES0_DRIBBLING))
+		x->dribbling_bit++;
+	if (unlikely(status & (RDES0_ERROR_SUMMARY | wire_errors | dma_errors))) {
+		sun8i_dwmac_rx_error_stats(x, status);
+		if (status & dma_errors)
+			return discard_frame;
+		/* An unexplained error summary is not a checksum verdict. */
+		if (!(status & wire_errors) &&
+		    (!(status & RDES0_FRAME_TYPE) || !(status & csum_mask)))
+			return discard_frame;
+	}
+
+	/* One buffer per chain descriptor; the reported length includes FCS. */
+	if (unlikely(len < ETH_HLEN + ETH_FCS_LEN ||
+		     len > FIELD_GET(RDES1_BUFFER1_SIZE_MASK, le32_to_cpu(p->des1)))) {
+		x->rx_desc++;
+		return discard_frame;
+	}
+	if (unlikely(runt || (status & wire_errors))) {
+		if (runt && !(status & RDES0_LENGTH_ERROR))
+			x->rx_length++;
+		return discard_frame;
+	}
+
+	/* Only a checked IP frame is eligible for CHECKSUM_UNNECESSARY. */
+	if (!(status & RDES0_FRAME_TYPE) || (status & (csum_mask | RDES0_DRIBBLING)))
+		return csum_none;
+
+	return good_frame;
+}
+
 static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 {
 	struct stmmac_priv *priv = ppriv;
@@ -1068,6 +1143,7 @@ static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 	mac->pcsr = priv->ioaddr;
 	mac->mac = &sun8i_dwmac_ops;
 	mac->dma = &sun8i_dwmac_dma_ops;
+	mac->rx_status = sun8i_dwmac_rx_status;
 
 	priv->dev->priv_flags |= IFF_UNICAST_FLT;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8ae95e91a36a..047d809b8b88 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -125,8 +125,6 @@ struct stmmac_desc_ops {
 	stmmac_do_void_callback(__priv, desc, set_rx_owner, __args)
 #define stmmac_get_rx_frame_len(__priv, __args...) \
 	stmmac_do_callback(__priv, desc, get_rx_frame_len, __args)
-#define stmmac_rx_status(__priv, __args...) \
-	stmmac_do_callback(__priv, desc, rx_status, __args)
 #define stmmac_rx_extended_status(__priv, __args...) \
 	stmmac_do_callback(__priv, desc, rx_extended_status, __args)
 #define stmmac_enable_tx_timestamp(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f256244ce0d1..2f33fc0126b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5775,7 +5775,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		/* read the status of the incoming frame */
-		status = stmmac_rx_status(priv, &priv->xstats, p);
+		status = priv->hw->rx_status(&priv->xstats, p);
 		/* check if managed by the DMA otherwise go ahead */
 		if (unlikely(status & dma_own))
 			break;
@@ -5978,7 +5978,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		/* read the status of the incoming frame */
-		status = stmmac_rx_status(priv, &priv->xstats, p);
+		status = priv->hw->rx_status(&priv->xstats, p);
 		/* check if managed by the DMA otherwise go ahead */
 		if (unlikely(status & dma_own))
 			break;
@@ -7809,6 +7809,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 			return ret;
 	}
 
+	if (!priv->hw->rx_status)
+		priv->hw->rx_status = priv->hw->desc->rx_status;
+
 	/* Set alternate descriptor size (which tells the hardware that
 	 * descriptors are 8 32-bit words) when using extended descriptors
 	 * with ring mode. Only applicable for pre-v4.0 cores. Platform glue

-- 
2.53.0


