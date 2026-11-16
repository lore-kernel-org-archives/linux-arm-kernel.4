Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7305606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YUhhFdBs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+2eEMgt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=U+kI0NsJYRH+LSM4mZJ4JtJDKQmYSW0KTBOTKB6ReYg=; b=YUhhFdBsaKcRW4kpwEClw9Liva
	FOPoY3/+0DGc2psosTsqdhyiFK/zNSaGq0gTX5iaeLW84htrc9ha0URieNTIfLJg+N3hG7luZ37b0
	FuT/Z6DpseE3KJo1Yvzn0N1D3NJIHeUj1Pj4S43TMzOQw2XdrTJE08soxzUJZxh4zOer62fJvd8mq
	YDREk91Tei6j8EoQYpccgtm1FtW+ouMmH9XphWKBk02PQg4ZdY7+h5CMatmUYT+NI28/YoG8xvzBP
	8n1QC3x56YFBmxiIiwYQjZWHFSzTfy2Xkuj+w+uy4uiBtNswJJYYJ5yYJV19rCZ6ox9rWudMbbZ6/
	I9UP/7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxOL-00000002lQ2-2Cb2;
	Mon, 16 Nov 2026 14:09:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxOK-00000002lPn-3W0n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:09:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46586403D6;
	Mon, 16 Nov 2026 14:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9743A1F000C4;
	Mon, 16 Nov 2026 14:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838144;
	bh=U+kI0NsJYRH+LSM4mZJ4JtJDKQmYSW0KTBOTKB6ReYg=;
	h=From:To:Cc:Subject:Date;
	b=U+2eEMgtWKb54c5VXqgbLIgwKOkPC4jO4S9FUx/Hii8fAg3t47EyGTYYf1W2+a1xg
	 KqtMQ7QSvu8wQIukENGzncqUf/hk0TcTHUgnUxaRz61eT/cAviBkiA1UHM8kUiKadR
	 U9ZaivT9RdlZmPZaepVrebP67w1gQZESwE0Yf/KuTrC9jlzD15hrAd5g6XKQb4QpV6
	 LksuYhAD40xeIK/jN2EzRCb6SjejSh0EOzR5mDVY2xjXMq1Ni89IUcwfGAJIKXJp4O
	 9QvTsVsgHGxIrE1vh2ce++Bypt7Zfg8vixJpOjgDTinpCIsTAvyx+iSuys2ka37D5k
	 lOhrEJvANOcSw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v2] net: stmmac: Disable checksum insertion for XDP frame TX
Date: Mon, 16 Nov 2026 21:48:48 +0800
Message-ID: <20261116134848.4793-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

stmmac enables TX checksum insertion for XDP frames whenever the queue
supports it. XDP frames carry no TX checksum offload request, so this
can overwrite a checksum already present in the packet.

dwmac can only do HW checksum for normal particular packets
layouts, such as TCP, UDP etc. The stmmac_has_ip_ethertype() has
well demostrated this limitation. Different with normal tx where the
common stack supplies the skb->ip_summed metadata, XDP path doesn't
have the necessary metadata. So to make the XDP always work properly
when transmiting arbitrary Eth frames, dwmac HW csum needs to be
disabled by default.

Pass false to stmmac_prepare_tx_desc() when transmitting an XDP frame
so that the packet is sent with its checksum fields unchanged.

Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
Fixes: 8b278a5b69a2 ("net: stmmac: Add support for XDP_REDIRECT action")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---

since v1:
 - rebase against latest rcN
 - update the commit msg

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3014f9c7c3e6..0545f086212e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5284,7 +5284,6 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 {
 	struct skb_shared_info *sinfo = xdp_get_shared_info_from_frame(xdpf);
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
-	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;
 	unsigned int txq_thr = STMMAC_TX_THRESH(priv);
 	unsigned int first_entry = tx_q->cur_tx;
 	unsigned int entry = tx_q->cur_tx;
@@ -5306,14 +5305,6 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 		return STMMAC_XDP_CONSUMED;
 	}
 
-	/* Disable TX checksum offload for jumbo frames on cores where
-	 * checksum insertion is broken for oversized frames, matching the
-	 * stmmac_fix_features() workaround used by the skb path.
-	 */
-	if (priv->plat->bugged_jumbo &&
-	    xdp_get_frame_len(xdpf) > ETH_FRAME_LEN)
-		csum = false;
-
 	while (true) {
 		skb_frag_t *frag = i ? &sinfo->frags[i - 1] : NULL;
 		int len = frag ? skb_frag_size(frag) : xdpf->len;
@@ -5353,7 +5344,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 		stmmac_set_tx_dma_entry(tx_q, entry, buf_type, dma_addr, len,
 					dma_map && frag);
 		stmmac_set_desc_addr(priv, desc, dma_addr);
-		stmmac_prepare_tx_desc(priv, desc, !i, len, csum,
+		stmmac_prepare_tx_desc(priv, desc, !i, len, false,
 				       priv->descriptor_mode, !!i, last_frame,
 				       xdp_get_frame_len(xdpf));
 		tx_q->xdpf[entry] = last_frame ? xdpf : NULL;
-- 
2.55.0


