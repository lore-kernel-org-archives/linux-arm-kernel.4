Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0386F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uItah1Hx;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=JtfDGeuc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UH0bWnACNzDflP3qTpTK60pPAUWOTD6CtY3JFDChnAI=; b=uItah1HxOroejK
	fEI6PubFdlsJKrH49BStm8q4Us36cVBnwjdkymny9eecL2F9F0P11KCxJ0oWo8o19ZzQHydPU/vtS
	Z8/Ek0+6boymSfLk5edEZN7GjZnhKfe9RpD5rZyG0hJ0rNkX5XSlfR0ynsmGKLk1p03lpfLv1i4Ga
	G20wlEyNTXAgcdfbRa6H8uT+e3R9Z9+Gbx/iX8pOqOgGeJZ79iKvCM6kmMVMvYWxn9vWE9tgsbCFa
	dm7CqTkNS4P0lJ1iF5d4tN1T6ynGOXpZGz9BqMOP9+ImuUaFRKY6efiTl/eoO1g097RtqggZiHkJ2
	heGcYZ1EPFNPI1doqTTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStRn-00000001rGe-3nu6;
	Mon, 16 Nov 2026 09:56:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStRi-00000001rES-1zUo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794822986; x=1826358986;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=e5zGi3wEIQJPvBLV+DurPYuglqNx2l0a2BJwxi89I1c=;
  b=JtfDGeucClq7Wi0OhG686QVYO9vVA4lrgsfrbasHp9MnaMW/xpwIoCmG
   CxUCZTaG2foM5/z6n5YSd5VE0fkdZ+OYQyyIX1dW1Zi47HjqYubSM2Jdt
   dTs/2W69ezcf0yRKEocwJL5GQUdQ+OgnqdsidSiEddz9uBT+NtItOi81P
   UqzWTYp5HPS++0+6YZBwq55DalBBfrHyYbCBSj+jCK2m9ucjjD6K1zQ2w
   bKLO9wfJ6coF1qZs7Y9gqkbb+uHzMzMfcS2ohj7tugbYlSoREPc8QkY/R
   oMcpfwqT+wPSbe20K0TrFEV3rid93bwcTqU2X2VCkgn2Gt07R6WOZo2Qk
   w==;
X-CSE-ConnectionGUID: hITfFtwUT4GP9a0u1ydGHA==
X-CSE-MsgGUID: M39AjVtWSfeJYe9QfLiirg==
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="297975481"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:56:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 02:56:17 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 16 Nov 2026 02:56:15 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 16 Nov 2026 10:56:05 +0100
Subject: [PATCH net 2/2] net: lan969x: fix RX ring stall on frames from
 inactive ports
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-sparx5-rx-inactive-port-v1-2-343d8bab58bb@microchip.com>
References: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
In-Reply-To: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: Zhang Hewei <memoriaru@foxmail.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_015619_206974_8F5DE57D 
X-CRM114-Status: GOOD (  12.94  )
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

If the source port of a received frame does not map to an active port,
or build_skb() fails, lan969x_fdma_rx_get_frame() returns the page to
the page_pool and returns NULL, and the NAPI poll loop breaks without
advancing past the DB. The DB keeps its DONE bit, so every following
poll returns the same page to the page_pool again, and RX stops on all
ports.

Drop the frame and advance past the DB like for any other frame, and
replace the WARN_ON() with a ratelimited error, as the source port comes
from the hardware.

Confirmed on lan969x (EV23X71A) with a kernel modified to give received
frames an out-of-range source port, which stopped RX on all ports. The
fix was tested the same way: only the bad frames are dropped.

Fixes: d84ad2c0d80c ("net: lan969x: add FDMA implementation")
Reported-by: Zhang Hewei <memoriaru@foxmail.com>
Closes: https://lore.kernel.org/netdev/tencent_ACC296C1F221C304053BD0F1F4B0D2C2BA06@qq.com/
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
index 053d125eda658..fd532c89f9110 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
@@ -113,8 +113,11 @@ static struct sk_buff *lan969x_fdma_rx_get_frame(struct sparx5 *sparx5,
 	sparx5_ifh_parse(sparx5, page_address(page), &fi);
 	port = fi.src_port < consts->n_ports ? sparx5->ports[fi.src_port] :
 					       NULL;
-	if (WARN_ON(!port))
+	if (!port) {
+		dev_err_ratelimited(sparx5->dev, "Data on inactive port %d\n",
+				    fi.src_port);
 		goto free_page;
+	}
 
 	skb = build_skb(page_address(page), fdma->db_size);
 	if (unlikely(!skb))
@@ -258,10 +261,8 @@ int lan969x_fdma_napi_poll(struct napi_struct *napi, int weight)
 			break;
 
 		skb = lan969x_fdma_rx_get_frame(sparx5, rx);
-		if (!skb)
-			break;
-
-		napi_gro_receive(&rx->napi, skb);
+		if (skb)
+			napi_gro_receive(&rx->napi, skb);
 
 		fdma_db_advance(fdma);
 		counter++;

-- 
2.34.1


