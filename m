Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA293606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 15:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s+J7IvWC;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=jUANGkg+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kSUROwpO/ILBpmR/pHPLqsMr9h48VwvRxeErIiRA99U=; b=s+J7IvWChBCBD2
	JB1sISEQvx5rGPF2mMRWA0kbRvRf9YMdyRLjXncZLHh7xZapplxq5Fs9N5U4E/ccYs8dVa2xguKIc
	xWTfY78ICXVvKExJfdAgOgA4jv5UACjD3Ves4OwAUZY8E3x1Ona2g7jbkcupIsP04dIfgsv4CPcxX
	TUa87LRHmnnbQNtXLTK2NdOOvFXPojdNoSxDPlYvJrgL5uKQEtW7GmhhWxhZiDQ5ZzH619LNj7xbk
	PpdaV9RBrgZpqQ8TDM/AIHetlf0IA1W1sbbUFytAkAIlKGGm3s9tSZ2WvFVWVza1DnezDZPCeGmCh
	uWvw4iv8PbEcDQopiF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9MX-00000006xHX-1uY9;
	Wed, 11 Nov 2026 14:31:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9MT-00000006xES-1JtP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794407507; x=1825943507;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=3bqY4tgvqC+BAAd6eacYnbTfETfgiouFbG1wGZeMXGE=;
  b=jUANGkg+g4sqABbqV67eC9xUFQ0znRQGQY0Mfd8DjvrBmMOWU9pgX1kU
   Oxd4ovr1mQe62qn2YAUEmTS7yf2c7d0DCVFGlBVLV650qWa7Y8Os9acnh
   NX5KGSRRzns81rE5gMuxVSGJLJoebZgJbdBiYb9VCWE61usWlIkV+QQCV
   nXM9r75wAzjSnATeoXur5/Rh1ahk1DPW7MRkQehxCHFRg92dw5afIZ8dG
   JAWSeZDG+NBvcfIWqMIrgbtR8Rc6m6XXxDgz29snk2F/7RYrQVRFs3GEh
   mE0Lv7M3P2Oy/d6+quFO4qQNFlqeB7Tkmv7MPFLqhd1y7RBN4UilPN1HP
   Q==;
X-CSE-ConnectionGUID: JNrjTuQyR2+1N3l4d4fITQ==
X-CSE-MsgGUID: q4dmzBIyRq2qO5h3tS6lcw==
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="233412663"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Nov 2026 07:31:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 11 Nov 2026 07:31:40 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Nov 2026 07:31:37 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 11 Nov 2026 15:31:15 +0100
Subject: [PATCH net-next v2 5/9] net: sparx5/lan969x: size the FDMA buffers
 from the port MTUs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-sparx5-mtu-change-v2-5-59c91357e8f6@microchip.com>
References: <20261111-sparx5-mtu-change-v2-0-59c91357e8f6@microchip.com>
In-Reply-To: <20261111-sparx5-mtu-change-v2-0-59c91357e8f6@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_063141_393608_F403BE44 
X-CRM114-Status: GOOD (  25.38  )
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

The FDMA buffers must hold the largest frame that can be received by the
CPU, including the IFH, and on Sparx5 also the largest frame that is
transmitted, as Sparx5 copies the frames into its TX buffers. On Sparx5,
the RX buffers are skbs, and the TX buffers are a contiguous area. On
lan969x, the RX buffers are page_pool pages, which are turned into skbs
with build_skb(), and TX frames are mapped directly from the skbs. The
buffers are currently fixed to a single page, which is not large enough
to hold jumbo frames.

Instead, size the buffers from the largest MTU of the ports, plus the
Ethernet header, FCS, IFH and two VLAN tags. On Sparx5, use this length,
rounded up to the 128 byte granularity required by the FDMA, as the RX
and TX buffer size. As the TX buffers can now be smaller than a page,
make sparx5_fdma_xmit() drop frames that do not fit. On lan969x, use the
page order needed to hold the frame and the skb_shared_info, as lan966x
does, and limit the RX buffer size so that the FDMA never writes into
the skb_shared_info at the end of the page.

With the default MTU of 1500, the Sparx5 buffers become smaller, and the
lan969x pages are unchanged.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../microchip/sparx5/lan969x/lan969x_fdma.c        | 22 ++++++++++----
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    | 35 ++++++++++++++++++++--
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  2 ++
 3 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
index d435c4df5effa..40cdb0323eb49 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
@@ -131,7 +131,7 @@ static struct sk_buff *lan969x_fdma_rx_get_frame(struct sparx5 *sparx5,
 	if (WARN_ON(!port))
 		goto free_page;
 
-	skb = build_skb(page_address(page), fdma->db_size);
+	skb = build_skb(page_address(page), PAGE_SIZE << rx->page_order);
 	if (unlikely(!skb))
 		goto free_page;
 
@@ -161,21 +161,27 @@ static struct sk_buff *lan969x_fdma_rx_get_frame(struct sparx5 *sparx5,
 	return NULL;
 }
 
+/* Get the page order needed for a page to hold the largest frame */
+static u8 lan969x_fdma_get_page_order(struct sparx5 *sparx5)
+{
+	return get_order(ALIGN(sparx5_fdma_get_max_frame(sparx5), 128) +
+			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)));
+}
+
 static int lan969x_fdma_rx_alloc(struct sparx5 *sparx5, struct sparx5_rx *rx)
 {
 	struct fdma *fdma = &rx->fdma;
 	int err;
 
 	struct page_pool_params pp_params = {
-		.order = 0,
+		.order = rx->page_order,
 		.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
 		.pool_size = fdma->n_dcbs * fdma->n_dbs,
 		.nid = NUMA_NO_NODE,
 		.dev = sparx5->dev,
 		.dma_dir = DMA_FROM_DEVICE,
 		.offset = 0,
-		.max_len = fdma->db_size -
-			   SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
+		.max_len = fdma->db_size,
 	};
 
 	rx->page_pool = page_pool_create(&pp_params);
@@ -268,7 +274,12 @@ static void lan969x_fdma_rx_init(struct sparx5 *sparx5, struct sparx5_rx *rx)
 	fdma->n_dbs = 1;
 	fdma->priv = sparx5;
 	fdma->size = fdma_get_size(fdma);
-	fdma->db_size = PAGE_SIZE;
+	/* Keep the FDMA from writing into the skb_shared_info at the end of
+	 * the page. The DB size must be a multiple of 128 bytes.
+	 */
+	fdma->db_size = ALIGN_DOWN((PAGE_SIZE << rx->page_order) -
+				   SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
+				   128);
 	fdma->ops.dataptr_cb = &lan969x_fdma_rx_dataptr_cb;
 	fdma->ops.nextptr_cb = &fdma_nextptr_cb;
 
@@ -414,6 +425,7 @@ int lan969x_fdma_init(struct sparx5 *sparx5)
 	struct sparx5_rx *rx = &sparx5->rx;
 	int err;
 
+	rx->page_order = lan969x_fdma_get_page_order(sparx5);
 	lan969x_fdma_rx_init(sparx5, rx);
 	lan969x_fdma_tx_init(sparx5);
 	sparx5_fdma_injection_mode(sparx5);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index 7ac5887abe6ee..3a74a305d55d4 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -18,7 +18,6 @@
 #include "sparx5_main.h"
 #include "sparx5_port.h"
 
-#define FDMA_XTR_BUFFER_SIZE		2048
 #define FDMA_WEIGHT			4
 #define SPX5_FDMA_STOP_SLEEP_US		500
 #define SPX5_FDMA_STOP_TIMEOUT_US	10000
@@ -218,6 +217,10 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
 	struct fdma *fdma = &tx->fdma;
 	void *virt_addr;
 
+	/* Drop frames that do not fit in the TX buffers */
+	if (unlikely(IFH_LEN * 4 + skb->len + ETH_FCS_LEN > fdma->db_size))
+		return -EMSGSIZE;
+
 	if (!fdma_db_is_done(fdma_db_get(fdma, fdma->dcb_index, 0)))
 		return -EINVAL;
 
@@ -289,6 +292,33 @@ static int sparx5_fdma_tx_alloc(struct sparx5_tx *tx)
 	return 0;
 }
 
+/* Get the size of the largest frame, including IFH and VLAN tags, that can be
+ * received on any of the ports.
+ */
+u32 sparx5_fdma_get_max_frame(struct sparx5 *sparx5)
+{
+	u32 max_mtu = 0;
+
+	for (int i = 0; i < sparx5->data->consts->n_ports; i++) {
+		struct sparx5_port *port = sparx5->ports[i];
+
+		if (!port)
+			continue;
+
+		max_mtu = max(max_mtu, READ_ONCE(port->ndev->mtu));
+	}
+
+	return SPX5_HW_MTU(max_mtu) + IFH_LEN * sizeof(u32) + VLAN_HLEN * 2;
+}
+
+/* Get the DB size needed to hold the largest frame. The DB size must be a
+ * multiple of 128 bytes.
+ */
+static u32 sparx5_fdma_get_db_size(struct sparx5 *sparx5)
+{
+	return ALIGN(sparx5_fdma_get_max_frame(sparx5), 128);
+}
+
 static void sparx5_fdma_rx_init(struct sparx5 *sparx5,
 				struct sparx5_rx *rx, int channel, u32 db_size)
 {
@@ -418,7 +448,7 @@ void sparx5_fdma_injection_mode(struct sparx5 *sparx5)
 
 int sparx5_fdma_init(struct sparx5 *sparx5)
 {
-	u32 db_size = ALIGN(FDMA_XTR_BUFFER_SIZE, PAGE_SIZE);
+	u32 db_size;
 	int err;
 
 	/* Reset FDMA state */
@@ -435,6 +465,7 @@ int sparx5_fdma_init(struct sparx5 *sparx5)
 		 sparx5, CPU_PROC_CTRL);
 
 	sparx5_fdma_injection_mode(sparx5);
+	db_size = sparx5_fdma_get_db_size(sparx5);
 	sparx5_fdma_rx_init(sparx5, &sparx5->rx, FDMA_XTR_CHANNEL, db_size);
 	sparx5_fdma_tx_init(sparx5, &sparx5->tx, FDMA_INJ_CHANNEL, db_size);
 	err = sparx5_fdma_rx_alloc(&sparx5->rx);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index e08b1635cfcd9..1ff096b65f1b4 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -109,6 +109,7 @@ enum sparx5_feature {
 #define SPX5_BUFFER_CELL_SZ    184   /* Cell size  */
 #define SPX5_BUFFER_MEMORY     4194280 /* 22795 words * 184 bytes */
 #define SPX5_TAS_ENTRIES_PER_PORT 2 /* TAS lists per port */
+#define SPX5_HW_MTU(mtu)       ((mtu) + ETH_HLEN + ETH_FCS_LEN)
 
 #define XTR_QUEUE     0
 #define INJ_QUEUE     0
@@ -480,6 +481,7 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
 irqreturn_t sparx5_fdma_handler(int irq, void *args);
 void sparx5_fdma_reload(struct sparx5 *sparx5, struct fdma *fdma);
 void sparx5_fdma_injection_mode(struct sparx5 *sparx5);
+u32 sparx5_fdma_get_max_frame(struct sparx5 *sparx5);
 
 /* sparx5_mactable.c */
 int sparx5_mact_learn(struct sparx5 *sparx5, int port,

-- 
2.34.1


