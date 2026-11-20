Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D97606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nuodmEIZ;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=aFTrvwPz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=umK9BxZ9uNfGeg/503cnqAcy+jmP/Vgln6/Lj88MWiY=; b=nuodmEIZ+tnjFo
	wqEofr5E9BYSbhTjrs0FKolYSRPAeNZAEGkkX86rejxnWNYCrpr2MMB3UlKJyXbuZSiO446+1FH9M
	ICBUjGdyM7kwlWDLbN46mI9Kwj7zzO4vHMZkDnPpmay2TVa6P9koZNvKMWWl/us4FmpdggD3iomPJ
	MLb7CPW0l/4z/y5VRNL7+tCsW/nK0wIZwjdZt7tRSVE6n2IRVkwzYiL7Hw/E6mephBObzL2An2thp
	gBC83DPVLxE5QBwtHayVQaS035Ih5PK0Artf4tnFBGxglqw8SPeTIi7995fnf8OHUSKx1zZHRWj2O
	0wqzBiCiDNelz6XTgszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNF9-0000000Esnn-25SJ;
	Fri, 20 Nov 2026 11:57:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNF2-0000000Eskv-1srG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795175840; x=1826711840;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=sfh6BX8UdBk8t6SWtgg4gMnHcEmd5MxePz+bstQ4eAU=;
  b=aFTrvwPz6DkLm+jAVl50VAzzLqy1ntrtzjyPNnal+qCINeeMpPKO7Lt0
   mByNHURdAoCkrPqxlSzD1J7QeBGa6Bwgb3IbuUHYH0qzz/Yk7s3erVJ/a
   K2nkadIvbEJChat6o4pPonQnX9i8rzt4qL2gk9L4UlgxEt8Bhgc4K6sLu
   Y0tDW09ZrZ1njN/D3pJ0jHZVgoQnWW3t/2iu2SadMvZESkeEXHwkFsN0k
   sQkrL388a3V7gE+Tf7JC2N+SOWcQ5zDJaXvTmO1/QCbtdDAZlE4T3PUbg
   DtWL0SPn5UUQU7PPGzwHjZjjsx6Kqy9GZwRcf9tbciKYQ0MrubqIw8CwT
   g==;
X-CSE-ConnectionGUID: mx/Q7YNERNu502IyQ9Kd2w==
X-CSE-MsgGUID: lmqK7cS5T1i2kl9fGSFBtw==
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="67053186"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 04:57:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 20 Nov 2026 04:57:19 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 20 Nov 2026 04:57:16 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 20 Nov 2026 12:56:59 +0100
Subject: [PATCH net-next v3 2/9] net: sparx5/lan969x: free the FDMA buffers
 on init errors and deinit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261120-sparx5-mtu-change-v3-2-55c272fe1acc@microchip.com>
References: <20261120-sparx5-mtu-change-v3-0-55c272fe1acc@microchip.com>
In-Reply-To: <20261120-sparx5-mtu-change-v3-0-55c272fe1acc@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_035720_543608_43DE5B31 
X-CRM114-Status: GOOD (  24.65  )
X-Spam-Score: -4.4 (----)
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

The FDMA RX buffers are skbs on Sparx5, and pages from a page_pool on
lan969x, which are handed to the FDMA through the RX DCBs. On lan969x,
the TX DCBs also have an array holding the state of the TX buffers.

These are not all freed. On Sparx5, the RX skbs are never freed, and if
the TX buffers cannot be allocated, the RX DCBs are not freed. On
lan969x, if the RX DCBs cannot be allocated, the page_pool is not
destroyed, if the TX buffers cannot be allocated, only the RX DCBs are
freed, and lan969x_fdma_deinit() never frees the TX buffer state, nor
the TX buffers that are still in flight. On both, the return value of
fdma_dcbs_init() is also ignored for RX, so if a buffer cannot be
allocated while filling the RX ring, the FDMA is started with a partly
filled ring, and on lan969x, lan969x_fdma_free_pages() later puts the
pages that were never allocated.

Add sparx5_fdma_rx_free(), which frees the RX skbs and DCBs,
lan969x_fdma_rx_free(), which returns the pages to the page_pool and
frees the page_pool and the RX DCBs, and lan969x_fdma_tx_free(), which
releases the TX buffers still in flight and frees the TX buffer state
and the TX DCBs, and use them on the error paths and on deinit. Check
the return value of fdma_dcbs_init() for RX. To know which RX buffers
are still owned by the driver, clear the RX buffer slot once the buffer
has left the ring on Sparx5, either to the stack or dropped, and make
lan969x_fdma_free_pages() skip and clear the empty slots of the ring.
The two-step PTP skbs are owned by the PTP code, which may already have
freed them when a TX buffer is released, so store the length of the
mapped TX buffer, and use it instead of the skb length.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../microchip/sparx5/lan969x/lan969x_fdma.c        | 85 +++++++++++++++++-----
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    | 30 +++++++-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  1 +
 3 files changed, 95 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
index fd532c89f9110..5f96910df5383 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
@@ -67,13 +67,13 @@ static void lan969x_fdma_tx_clear_buf(struct sparx5 *sparx5, int weight)
 		if (!fdma_db_is_done(fdma_db_get(fdma, i, 0)))
 			continue;
 
-		db->dev->stats.tx_bytes += db->skb->len;
+		db->dev->stats.tx_bytes += db->len;
 		db->dev->stats.tx_packets++;
 		sparx5->tx.packets++;
 
 		dma_unmap_single(sparx5->dev,
 				 db->dma_addr,
-				 db->skb->len,
+				 db->len,
 				 DMA_TO_DEVICE);
 
 		if (!db->ptp)
@@ -90,12 +90,26 @@ static void lan969x_fdma_free_pages(struct sparx5_rx *rx)
 	struct fdma *fdma = &rx->fdma;
 
 	for (int i = 0; i < fdma->n_dcbs; ++i) {
-		for (int j = 0; j < fdma->n_dbs; ++j)
+		for (int j = 0; j < fdma->n_dbs; ++j) {
+			if (!rx->page[i][j])
+				continue;
+
 			page_pool_put_full_page(rx->page_pool,
 						rx->page[i][j], false);
+			rx->page[i][j] = NULL;
+		}
 	}
 }
 
+static void lan969x_fdma_rx_free(struct sparx5 *sparx5)
+{
+	struct sparx5_rx *rx = &sparx5->rx;
+
+	lan969x_fdma_free_pages(rx);
+	fdma_free_coherent(sparx5->dev, &rx->fdma);
+	page_pool_destroy(rx->page_pool);
+}
+
 static struct sk_buff *lan969x_fdma_rx_get_frame(struct sparx5 *sparx5,
 						 struct sparx5_rx *rx)
 {
@@ -172,14 +186,18 @@ static int lan969x_fdma_rx_alloc(struct sparx5 *sparx5)
 		return PTR_ERR(rx->page_pool);
 
 	err = fdma_alloc_coherent(sparx5->dev, fdma);
-	if (err)
+	if (err) {
+		page_pool_destroy(rx->page_pool);
 		return err;
+	}
 
-	fdma_dcbs_init(fdma,
-		       FDMA_DCB_INFO_DATAL(fdma->db_size),
-		       FDMA_DCB_STATUS_INTR);
+	err = fdma_dcbs_init(fdma,
+			     FDMA_DCB_INFO_DATAL(fdma->db_size),
+			     FDMA_DCB_STATUS_INTR);
+	if (err)
+		lan969x_fdma_rx_free(sparx5);
 
-	return 0;
+	return err;
 }
 
 static int lan969x_fdma_tx_alloc(struct sparx5 *sparx5)
@@ -205,6 +223,44 @@ static int lan969x_fdma_tx_alloc(struct sparx5 *sparx5)
 	return 0;
 }
 
+/* Release the TX buffers that are still in flight. The two-step PTP skbs are
+ * owned by the port tx_skbs list, so they are only unmapped.
+ */
+static void lan969x_fdma_tx_release(struct sparx5 *sparx5)
+{
+	struct sparx5_tx *tx = &sparx5->tx;
+	struct sparx5_tx_buf *db;
+
+	for (int i = 0; i < tx->fdma.n_dcbs; ++i) {
+		db = &tx->dbs[i];
+
+		if (!db->used)
+			continue;
+
+		db->dev->stats.tx_dropped++;
+		tx->dropped++;
+
+		dma_unmap_single(sparx5->dev,
+				 db->dma_addr,
+				 db->len,
+				 DMA_TO_DEVICE);
+
+		if (!db->ptp)
+			dev_kfree_skb_any(db->skb);
+
+		db->used = false;
+	}
+}
+
+static void lan969x_fdma_tx_free(struct sparx5 *sparx5)
+{
+	struct sparx5_tx *tx = &sparx5->tx;
+
+	lan969x_fdma_tx_release(sparx5);
+	fdma_free_coherent(sparx5->dev, &tx->fdma);
+	kfree(tx->dbs);
+}
+
 static void lan969x_fdma_rx_init(struct sparx5 *sparx5)
 {
 	struct fdma *fdma = &sparx5->rx.fdma;
@@ -331,6 +387,7 @@ int lan969x_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
 
 	db_buf->dev = dev;
 	db_buf->skb = skb;
+	db_buf->len = skb->len;
 	db_buf->ptp = false;
 	db_buf->used = true;
 
@@ -354,7 +411,6 @@ int lan969x_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
 
 int lan969x_fdma_init(struct sparx5 *sparx5)
 {
-	struct sparx5_rx *rx = &sparx5->rx;
 	int err;
 
 	lan969x_fdma_rx_init(sparx5);
@@ -376,7 +432,7 @@ int lan969x_fdma_init(struct sparx5 *sparx5)
 
 	err = lan969x_fdma_tx_alloc(sparx5);
 	if (err) {
-		fdma_free_coherent(sparx5->dev, &rx->fdma);
+		lan969x_fdma_rx_free(sparx5);
 		dev_err(sparx5->dev, "Failed to allocate TX buffers: %d\n",
 			err);
 		return err;
@@ -391,14 +447,9 @@ int lan969x_fdma_init(struct sparx5 *sparx5)
 
 int lan969x_fdma_deinit(struct sparx5 *sparx5)
 {
-	struct sparx5_rx *rx = &sparx5->rx;
-	struct sparx5_tx *tx = &sparx5->tx;
-
 	sparx5_fdma_stop(sparx5);
-	fdma_free_coherent(sparx5->dev, &tx->fdma);
-	fdma_free_coherent(sparx5->dev, &rx->fdma);
-	lan969x_fdma_free_pages(rx);
-	page_pool_destroy(rx->page_pool);
+	lan969x_fdma_tx_free(sparx5);
+	lan969x_fdma_rx_free(sparx5);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index 8a847ec067de6..f1d44e5e080b6 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -147,6 +147,10 @@ static bool sparx5_fdma_rx_get_frame(struct sparx5 *sparx5, struct sparx5_rx *rx
 	if (unlikely(!fdma_db_is_done(db_hw)))
 		return false;
 	skb = rx->skb[fdma->dcb_index][fdma->db_index];
+
+	/* The skb leaves the ring here, so clear its slot */
+	rx->skb[fdma->dcb_index][fdma->db_index] = NULL;
+
 	skb_put(skb, fdma_db_len_get(db_hw));
 	/* Now do the normal processing of the skb */
 	sparx5_ifh_parse(sparx5, (u32 *)skb->data, &fi);
@@ -245,6 +249,21 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
 	return NETDEV_TX_OK;
 }
 
+/* Free the RX skbs owned by the driver, and the RX DCBs */
+static void sparx5_fdma_rx_free(struct sparx5_rx *rx)
+{
+	struct fdma *fdma = &rx->fdma;
+
+	for (int i = 0; i < fdma->n_dcbs; i++) {
+		for (int j = 0; j < fdma->n_dbs; j++) {
+			consume_skb(rx->skb[i][j]);
+			rx->skb[i][j] = NULL;
+		}
+	}
+
+	fdma_free_phys(fdma);
+}
+
 static int sparx5_fdma_rx_alloc(struct sparx5 *sparx5)
 {
 	struct sparx5_rx *rx = &sparx5->rx;
@@ -255,10 +274,12 @@ static int sparx5_fdma_rx_alloc(struct sparx5 *sparx5)
 	if (err)
 		return err;
 
-	fdma_dcbs_init(fdma, FDMA_DCB_INFO_DATAL(fdma->db_size),
-		       FDMA_DCB_STATUS_INTR);
+	err = fdma_dcbs_init(fdma, FDMA_DCB_INFO_DATAL(fdma->db_size),
+			     FDMA_DCB_STATUS_INTR);
+	if (err)
+		sparx5_fdma_rx_free(rx);
 
-	return 0;
+	return err;
 }
 
 static int sparx5_fdma_tx_alloc(struct sparx5 *sparx5)
@@ -431,6 +452,7 @@ int sparx5_fdma_init(struct sparx5 *sparx5)
 	}
 	err = sparx5_fdma_tx_alloc(sparx5);
 	if (err) {
+		sparx5_fdma_rx_free(&sparx5->rx);
 		dev_err(sparx5->dev, "Could not allocate TX buffers: %d\n", err);
 		return err;
 	}
@@ -440,7 +462,7 @@ int sparx5_fdma_init(struct sparx5 *sparx5)
 int sparx5_fdma_deinit(struct sparx5 *sparx5)
 {
 	sparx5_fdma_stop(sparx5);
-	fdma_free_phys(&sparx5->rx.fdma);
+	sparx5_fdma_rx_free(&sparx5->rx);
 	fdma_free_phys(&sparx5->tx.fdma);
 
 	return 0;
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index f6316086e6ecb..19b38922823ec 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -180,6 +180,7 @@ struct sparx5_tx_buf {
 	dma_addr_t dma_addr;
 	bool used;
 	bool ptp;
+	u32 len;
 };
 
 /* Frame DMA transmit state:

-- 
2.34.1


