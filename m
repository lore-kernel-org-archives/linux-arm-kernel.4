Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0671F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=coB/cYPS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ess252+m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wed7YN090XJI15BSLSspXyr4CEJasWUhNpVfyB1hb9Q=; b=coB/cYPSkZFft1
	UbifKV+kAcsYATfIcPJ0L75BcoRPkgA2DGeq4daKCugMSnrceyGyyiCqcdOYbFhxju2x/5MVkZDiw
	vIZG3Rl1IQ2KXOmvBrxwtf8do/hUSLAEdN1woCsQyV+lwQqpcgQppYIPuZxjdF1fvT6SYTljtBbyS
	nA4G3uGT2e/w8QcdagKGye0DoG9jqT97Q2GEOhdbpRifzY9puOO+bW6eKqY2rDp4rp59+OS3HOZve
	yMK85eRBMaoARc8vx5Cevt8nn2evDDa+3vxRNQh8246o3EUURRsC+Y/uxgOpxw1PkcEhxsOxvntqg
	CQlsMrCOMi+/wkUcGX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8DR-000000092Hy-3Z3h;
	Wed, 25 Nov 2026 08:18:57 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8DB-000000092Cw-03ZN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:18:45 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-4ad89c49e0dso1689539fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 00:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594719; x=1796199519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wed7YN090XJI15BSLSspXyr4CEJasWUhNpVfyB1hb9Q=;
        b=ess252+mUizpzxuyr6USbEU0z/QLat/5H1TvYJQSZ+uRwzOj/x9urbDGgk2JSxwk4a
         Pix8Dj1oS85FyjrrU3EDc6y3lnQlFe0CBbGxjsA7Zewh9Y57YVIM6Z7gGqtxGDsJBtU2
         /YCk/+tzgO/8A7c/CXT5adhO4hwrzowdHCTlItY8fB21zF//8mKsfaZV3tOpg2T2iKMA
         EFsO6zHBdS0+bAz36FeuL7jz7j41Sbju2O+GHBGlBsf41uRwekCOX0DKm2L7B5dPQSdO
         glXKva0MZCLCqIPrGVtIlYRPhCTKhCoCYijmW/d/NWIjyP75tVrWJjNUpfIOxTxJiLK4
         CCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594719; x=1796199519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wed7YN090XJI15BSLSspXyr4CEJasWUhNpVfyB1hb9Q=;
        b=KTKLFIC1Fro//H086xbMlM8BAUT0yu+sG/UnOAXsBaTUT1fLNQFFPg57LKZGPQ29R9
         mnaydyPfdt9KbH3ABAmiWODFgrrzT8YSozsQzB/lyF+AxBNnaNG7vlVM9pPCNNiRcUlq
         xTd6e6kvi8jz93P5aFDvEuXFPmJ5s1lhn+fugIGmfCU/KuaT3jIuV1Cz2dSzQXcm/AyE
         julmmJZPIwumf1KoVPD5eTXsVV8RfgXC4vqgp5CenJM4IqhxgDk/FU4lU3md5W3hazeu
         2pzBIzHR6FFpkvCpil9Ta6MY3xRf1W8lKGHf1tKDTwgpIBWgpSZIPwHfRk0LXHLCoXsu
         2qQA==
X-Forwarded-Encrypted: i=1; AL+hErEYZlobzae2/rw8rBsQCy7UluQ15laLtN8X1EJ+U1m9r4sQXvzwEFkkkdGoY7Nc7rkETjvY8paWH6x7XddTOn+F@lists.infradead.org
X-Gm-Message-State: APuU4Z+iRDg9Lc3X6sxkHmcwzjwyzQStlqw56TsBM7jryzbm2Img24Dz
	96ceLWMwbeuSNIPutSsCyLVfd2JaPSv3z3XsBBpX7gGu5gk0yYf8gISB
X-Gm-Gg: AZFdTZc2jln/xtl2kqK7pP5U7H+siZjmBq5pxtU0roJI3t2I1YcJ3YtRVdWbfO2kTAa
	rRttAXgBmN5aMlTYmXBZBcge+vz1NXkstJ7bRIQ+kdmdlu6ClM/81bF0O///Lte0JRXy1djPaKN
	bH/28/U9nqtyiaLs+KqBfWurNA/aNJ6nf93HpVxHunYKyeQ7pptoFI5ux0Voo00wJjs586v9/GN
	YJCubjZGSuifuulyWjhvJ1irHTtVzztYc0D5SMEBh7t7fQsVS7ObGhOPT4CZrnmRYGv1mh5HKhd
	DqUWKhL6LpLOEzS7obS9F7UoW2bkkWFYio313j/ce+GWDpnKJlO7G4wyyB1VnT+3tftmvQgb/kl
	yOtzGLbp3aWyh8zCgUc8hsr9EPK/tIKZX2C7s4roXen4fARst/ZfhH581xIBbLD3s4B5AE8+PJq
	i7eW8maXd/T5KOqkZi/2fqPfPXw5K+i4qYGRv0CNiNfZEdopd6Wr2hUDYqiZEpq36jbAzWBVALi
	nl2Do+T90mHcSI9dXFCn0kHjZLX8gRvktDZDmOZ6Ngip/+xquR7IglYqhNi8GwjaN0Vs5zxxjdG
	j9+2ChKw+BTeXh4VjrkWdp1Wrkk6sG7uFaeO9LXOgZ5LKNAD6lWzAU/3llWXgpG5byipwpfMLmu
	/mDZP5hU/PILwXBpY9iycgpgJ1WnfDT2FxZVZM27xDNjF5HRsUNGsK2e4uCQFOvrcKDaLX5GB5u
	xf14O/Nl/uT+JTH5KZVv7SEbl7hZmZ1DpDSOAkvUK/yB4a6JF2+AE5
X-Received: by 2002:a05:6809:3cd:10b0:57e:3c4f:4b60 with SMTP id 5614622812f47-57e3c4f5310mr4622821b6e.58.1795594719588;
        Wed, 25 Nov 2026 00:18:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm14884815fac.0.2026.11.25.00.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:18:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 Nov 2026 01:18:31 -0700
Subject: [PATCH net-next v2 2/3] net: stmmac: add common RXALL handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-submit-sun8i-rxall-v1-v2-2-4de03fbde087@gmail.com>
References: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
In-Reply-To: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_001842_497945_115D5331 
X-CRM114-Status: GOOD (  16.22  )
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

Allow a MAC to distinguish complete frames with wire errors from
descriptors that must always be discarded. When rx-all is enabled,
deliver the former without trusting their checksum or counting them
as good packets. Keep counting the errors in either mode.

Apply the same policy to page-pool and zero-copy RX. Advertise rx-all
only when the MAC supplies the receive-mode callback; leave it off by
default.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 ++++++++++++++++-------
 3 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 706feb7bcbed..ab959ee3a5dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -360,6 +360,8 @@ enum rx_frame_status {
 	llc_snap = 0x4,
 	dma_own = 0x8,
 	rx_not_ls = 0x10,
+	/* Complete frame with a wire error, deliverable only with RXALL. */
+	rx_error_frame = 0x20,
 };
 
 /* Tx status */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 9ea76de030e4..81c8ac3756a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -354,6 +354,8 @@ struct stmmac_ops {
 				   struct mac_device_info *hw, u32 chan);
 	/* Multicast filter setting */
 	void (*set_filter)(struct mac_device_info *hw, struct net_device *dev);
+	/* Program the MAC receive mode for NETIF_F_RXALL. */
+	void (*set_rx_all)(struct stmmac_priv *priv, bool enable);
 	/* Flow control setting */
 	void (*flow_ctrl)(struct mac_device_info *hw, unsigned int duplex,
 			  unsigned int fc, unsigned int pause_time, u8 tx_cnt);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 70157efc2255..8102a72c52c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5646,10 +5646,12 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 	skb_record_rx_queue(skb, queue);
 	napi_gro_receive(&ch->rxtx_napi, skb);
 
-	u64_stats_update_begin(&rxq_stats->napi_syncp);
-	u64_stats_inc(&rxq_stats->napi.rx_packets);
-	u64_stats_add(&rxq_stats->napi.rx_bytes, len);
-	u64_stats_update_end(&rxq_stats->napi_syncp);
+	if (likely(!(status & rx_error_frame))) {
+		u64_stats_update_begin(&rxq_stats->napi_syncp);
+		u64_stats_inc(&rxq_stats->napi.rx_packets);
+		u64_stats_add(&rxq_stats->napi.rx_bytes, len);
+		u64_stats_update_end(&rxq_stats->napi_syncp);
+	}
 }
 
 static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
@@ -5707,6 +5709,21 @@ static struct stmmac_xdp_buff *xsk_buff_to_stmmac_ctx(struct xdp_buff *xdp)
 	return (struct stmmac_xdp_buff *)xdp;
 }
 
+static bool stmmac_rx_discard(struct stmmac_priv *priv, int status, u32 *rx_errors)
+{
+	if (likely(!(status & (discard_frame | rx_error_frame))))
+		return false;
+
+	if (status & discard_frame) {
+		if (!priv->hwts_rx_en)
+			(*rx_errors)++;
+		return true;
+	}
+
+	(*rx_errors)++;
+	return !(READ_ONCE(priv->dev->features) & NETIF_F_RXALL);
+}
+
 static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 {
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
@@ -5797,11 +5814,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 							   status);
 		}
 
-		if (unlikely(!error && (status & discard_frame))) {
-			error = 1;
-			if (!priv->hwts_rx_en)
-				rx_errors++;
-		}
+		if (!error)
+			error = stmmac_rx_discard(priv, status, &rx_errors);
 
 		if (unlikely(error)) {
 			xsk_buff_free(buf->xdp);
@@ -5995,11 +6009,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 							   status);
 		}
 
-		if (unlikely(!error && (status & discard_frame))) {
-			error = 1;
-			if (!priv->hwts_rx_en)
-				rx_errors++;
-		}
+		if (!error)
+			error = stmmac_rx_discard(priv, status, &rx_errors);
 
 		/* We do not support SG in XDP mode */
 		if (unlikely(!error && (status & rx_not_ls) &&
@@ -6161,8 +6172,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		skb_record_rx_queue(skb, queue);
 		napi_gro_receive(&ch->rx_napi, skb);
-		rx_packets++;
-		rx_bytes += len;
+		if (likely(!(status & rx_error_frame))) {
+			rx_packets++;
+			rx_bytes += len;
+		}
 next:
 		in_progress = false;
 		skb = NULL;
@@ -6462,6 +6475,11 @@ static int stmmac_set_features(struct net_device *netdev,
 			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
 
+	if (((netdev->features ^ features) & NETIF_F_RXALL) &&
+	    netif_running(netdev) && netif_device_present(netdev) &&
+	    priv->hw->mac->set_rx_all)
+		priv->hw->mac->set_rx_all(priv, features & NETIF_F_RXALL);
+
 	if (features & NETIF_F_HW_VLAN_CTAG_RX)
 		priv->hw->hw_vlan_en = true;
 	else
@@ -8276,6 +8294,8 @@ static int __stmmac_dvr_probe(struct device *device,
 	}
 
 	ndev->features |= ndev->hw_features | NETIF_F_HIGHDMA;
+	if (priv->hw->mac->set_rx_all)
+		ndev->hw_features |= NETIF_F_RXALL;
 	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */

-- 
2.53.0


