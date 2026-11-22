Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B41C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 07:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p1bg7UQV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDHPeTWJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y8XgGvlVCCjPCeMynCuGBvpdTmWq070BiRu3GuXh4v0=; b=p1bg7UQVlo0vMi
	PVXMVnsqmSvctp1o1AQ41zSF2JwWeIxagzsTDRvCS566OG3yJCETY6V49daKOs2CvykRUETPJ4rgT
	UXsBMFgn4vbkmMi+vn3eEzr/Sy2gkXZUEaAZTvhiUqHQrBoXEQbAUWbjnMokzGPgprOTm0+83wv5h
	ZrUyeEjvektH4qQJdBAmFGcXp+SY9z2FxzHP+jvu2qZ/Zm+jt2QM269VbLiRZH2nhFe0gOzgPwXY1
	aonod6fnRftzc/AN4TmKVB97ybnSVSGyGntnC1eGZ9zzbY2Bd67gFbJgp1NFuEmWk81pn0jzb6RUT
	cVd5YdeHi9E+N0w1CIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2HV-00000000ptG-13JG;
	Sun, 22 Nov 2026 07:46:37 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2HN-00000000prO-0PM7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 07:46:30 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4a451915d8aso1740955b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 23:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333588; x=1795938388; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8XgGvlVCCjPCeMynCuGBvpdTmWq070BiRu3GuXh4v0=;
        b=RDHPeTWJAycuj/waETtLNdSIoD6pH3qGG20VoCUk03T8Ze8jgwg4l2NiO+Iab5NbfV
         hT9Vtdvsk0C4SECo9yNfMQNW0hogDMT007qyc6qmRXhDjHZZ4mlXaOGTiHM8ojQUUa51
         290/peL2v+fpBzP/ekOPN5Nm4XjF9sq/dN0lj+iZJvOU7yb6D+NsW6atmlwAjyW5CHvW
         6veG32HvSIFhLovfWTLc+EwY84S/KGCmsfgf4G/gKZLwdCdahS0h1aXRjNERdZu9TDQU
         gmq2lzUtoSAWUqYIvXoTI4WQALJf9gNvdHr+oKpRfBrRMKczfz8sqVWwAJE+ecwCvjSP
         K5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333588; x=1795938388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8XgGvlVCCjPCeMynCuGBvpdTmWq070BiRu3GuXh4v0=;
        b=AfRx4dhGyjVaKTSmMCiBSD6lJF1u5qkVf9MYNs97eWB3ax8G9H0/tDCQybIs5NTnFc
         6Ik4c0g6BKtjRF6ej/5JSCqKqiBJtbk5cShrVmKAoy7O+UnlbOsrcS4/i+tLwvO2IKH1
         P6rqNeYClhWcURIzXE7xKBKSBupd5IEuwwmzjzqAjF2haEEQc8p7yzg4r1N27U40bRdS
         AOGjQJTqNaa6ZmDGGkvV0tjAHpyncuyNjQXucfreYvbb/TAoqX73kXihUc1lka8Asq5p
         qrHpEEmrmGuXd7QjeN5OlI+/EufC5U1HIWIn8PbU6eLwVbZsMrByCNtJnDOGA9sgVTXO
         +YrQ==
X-Forwarded-Encrypted: i=1; AL+hErG5vLBlANFxF50KgcO7Qh/mrKdvXgEab9giet3QQE+SgLNOg5/NLWHvcuTNFbLG71HgcmNsYcsCTHei2O9Dg6p0@lists.infradead.org
X-Gm-Message-State: APuU4Z9+PCEKbb7GDXgkbiDYpZ4hB5lKm1NELGcEaVbttwWL7VMeyRPs
	UjQ/daFMsRvf0SCxWgkpQ7UmBzSyiAQq0jhJrZFy0fn8lZvHTJ/3WDTY
X-Gm-Gg: AZFdTZfHCl0+rUD78XRnazuq8SRFY2QW6MDyTbtSGtx/BTQ8ZumgKuEVVuITSHVs2X4
	oMS1z0/nEo05PuFa6+SY5z5+YfkDSq+dat1FUzhheB3gKDY/UVDVipgYSvzEINSRFaebIzMox5v
	eGm+9v7IsnejxIQfav45l/EUe2fbZfKQb8X6np7+adtJDmS7GC1TluprRbU3704OOok9h7I9YbI
	OSQTo6Efjy/y21UeQPwPj1eUsRvaEBJBDR/U8o3fIpEwOYiEl6lxTun3B33t5rs0/NK1/yA8rkZ
	/TJ9Yk4ODTcdXv9Y7C69naR9k7Hv8hkBIZgjdRD5xMM1e7eIZn+vN+6G9oecrZlGqE6F5pjQS2i
	LotH0tpepujuN+rKK+DTQTixPAJbKyE6K9eOTP7asMhtl4UWytHfVsaPsyTS0srUd006Gm56Wg3
	6DJA3EaynL7Q1t/MX+l8yoRySwGzBXb/3kUYoWnGuVETCzI6OGLW/BqnO8lIEPfTbDir4USGJJl
	a6GHKN8OxGdFH8ntGPemFVkvoCLh2WmlyzjVv1cRr8Bl351WWFMo3WpkL3s3kub0tk83Ws5ZcUP
	Ysxef0J1LC+/PR5XWOhZz5TKoZej6JJMq/EUcBV4xaO/7IZvII7rgKoQLWx1aZEdm5c79ddqYoZ
	7jq9kRaH4sa5lt9VHPkxRGClbqZMNOwcQUDr7NEcR8JB14WvGSlEdt6/sSqBc077W/aZUgjStF6
	6uCm4h38u9QEjSE04AGBcb4lFA4hZfDlxVlT5/OwimI1D5j4EUkb4f
X-Received: by 2002:a05:6808:309f:b0:573:3cbc:9775 with SMTP id 5614622812f47-57a0900b93amr8494959b6e.27.1795333587934;
        Sat, 21 Nov 2026 23:46:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252987sm6121800b6e.4.2026.11.21.23.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:46:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 00:45:46 -0700
Subject: [PATCH net-next 1/2] net: stmmac: add common RXALL handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-submit-sun8i-rxall-v1-v1-1-607789772c56@gmail.com>
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
In-Reply-To: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
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
X-CRM114-CacheID: sfid-20261121_234629_162625_B69AB591 
X-CRM114-Status: GOOD (  16.88  )
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
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 ++++++++++++++++-------
 3 files changed, 39 insertions(+), 16 deletions(-)

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
index 9ea76de030e4..c20babf8cb45 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -321,6 +321,7 @@ struct stmmac_ops {
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
 	/* Enable and verify that the IPC module is supported */
 	int (*rx_ipc)(struct mac_device_info *hw);
+	void (*set_rx_all)(struct stmmac_priv *priv, bool enable);
 	/* Enable RX Queues */
 	void (*rx_queue_enable)(struct mac_device_info *hw, u8 mode, u32 queue);
 	/* RX Queues Priority */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 70157efc2255..32e7906522a0 100644
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
@@ -6444,6 +6457,11 @@ static int stmmac_set_features(struct net_device *netdev,
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
 
+	if (((netdev->features ^ features) & NETIF_F_RXALL) &&
+	    netif_running(netdev) && netif_device_present(netdev) &&
+	    priv->hw->mac->set_rx_all)
+		priv->hw->mac->set_rx_all(priv, features & NETIF_F_RXALL);
+
 	/* Keep the COE Type in case of csum is supporting */
 	if (features & NETIF_F_RXCSUM)
 		priv->hw->rx_csum = priv->plat->rx_coe;
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


