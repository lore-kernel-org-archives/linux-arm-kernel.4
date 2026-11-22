Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A46C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BCJsUyB4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jr7GG1GM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kQry4Cjw3RPbx5td1ZWs5hKjkfOnlF6f++DPnxPHX6o=; b=BCJsUyB4/w2h3igFpR3NgkoyHc
	MM7tHd+LoFN8CLzlwzO4mE3eKsf5qXhO5YZQOovb+A1lAs2s5XtUn/ot5tpW7W/egeJoNiyl40wJ6
	91W9IL8TZP2SyRbYJJq12LtaLMwSVLgYyqT6QJzAYT8iaeCUsbVWleAv+Tz1owWVhmoM4xvgLEmX2
	s7aw5kBc+XaYN7I8huMDpuvZ2K9NCyI1R595L+wQl57uDmYLuKL3ZQXDlBRAgUkPej55y4QxhtjWe
	BVkYtHfWbohhcAT8TP+JdD3KVjiy8Wqodkx+DtVeqt82olkFYU8ug2uCO3Od1V/O98hUhd+k1l4Yd
	XTHfxaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3dv-00000000tZE-0qdb;
	Sun, 22 Nov 2026 09:13:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3dt-00000000tYp-1CIZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:13:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8C4460F60;
	Sun, 22 Nov 2026 09:13:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795338828;
	b=CkESDhiyd9wn0L/Zq2tE0Boh/3/D82+U9r4euSCCbDNGCJ0k+ImcbfgcnIWh893AljcU
	 JVmcZexQsZOBa6J/JjCBiYZRg6H0IhS6PXaxs8Sx70vGnA45+1HzpAvi2WZPt0F8VF/br
	 lY7oJri6w14c8kK5bwhlWK73onYiudrZoOL13xWcUB7Farj2+2/f9ipUEVHs5t121aOJB
	 9DoXWXrbPFbZl21p0nTrtRv9/RQy6N4xjgwjW/6A/+Po6R7GwZWZKqDSdBFASJPZi0GUV
	 S0+3d4O6fk5FzdtiRyh6X324Wrq9q2ezaj1vTfbaLWRmx1znEOlFcIGct96cGPaIMJQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795338828;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kQry4Cjw3RPbx5td1ZWs5hKjkfOnlF6f++DPnxPHX6o=;
	b=jlljnLjYolqF9TCoaEevqYNU5bKiNg6XgbOSk08nP+UBYTGOVuS5RNaYNoY9cLZCq8Wj
	 t4msnwnEu/i5r6sSA+tYZ0+dM8iYBD0yLzzXqh3Yac1bDEZUcSLT87qg4Hz3TUiVTcsOZ
	 N3rhEtAznLLcCKOvU+2I7bv06w/7vYQcf8NXHCstuRqc4Km75WQeOnmc9eanWBXXNEdsN
	 jpc4VkI+vKRm51/XVTgLfUifoeBCsxLz3zH/ihN2IPnbwvEb9oY78b/ApgdZ5q19MJaSq
	 BE/e3MG34tH6xu9mmGBubLTcIgeZhOkxQUY+4kBPTACK6Kx6Uwyjblcdal45zSuDnmQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5C621F000CA;
	Sun, 22 Nov 2026 09:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795338828;
	bh=kQry4Cjw3RPbx5td1ZWs5hKjkfOnlF6f++DPnxPHX6o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Jr7GG1GM3wN8lGV/5Ne/P+ipH2xCagiq4gW/RFVvvgriQGQjvtcJCJuobyiqWmO7m
	 GsX+6Gf2hKIds+h6SHSrDOkEga44QT5ZuHf7LMWJO1egwE3RB6JLG5PML+huhsZRR1
	 rb6n2YC1JFTI3U24bqBu5AVWqz7ofuGmZSvIaNS6uLbTzpFbKPjcblcB7wMlF2D0gz
	 tQ7FGi/+lorNgo6XwJ3xAL1DjHXz5P0tod5MxyzNBqgHVVONsn9lr5XPVtawvM4CsQ
	 bZtAHSNoVlK+k7cKW7F3BfFvO4OFvaG8KqE/nZU7yL7yDz0R7VNW2FU+05wqZZ/B30
	 /o9Ms/uptGnRw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 344354BFCA;
	Sun, 22 Nov 2026 09:13:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 09:13:47 +0000
Subject: [PATCH net v2 1/2] net: stmmac: Limit the MTU of normal
 descriptors to one buffer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-sun8i-emac-mtu-limit-v2-1-c4081e5b83cf@gmail.com>
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
In-Reply-To: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Russell King <rmk+kernel@armlinux.org.uk>, 
 Nicolai Buchwitz <nb@tipi-net.de>, Arun Iyengar <aiyengar1990@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795338826; l=1453;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ydeE7IevavZwGHNIu116JiJ5XTZiQzYRPI/kkGQMzGs=;
 b=OLm0NCIxVOoxm3a4kij2GdUDVN9qdNUwsdi1iIXrDZaiZGALtLXXIx9TtK0tjAzcFaWaxY1k8
 mGSIgLgx6xqC513OzVh3vXdfOC+UQQ/ED6uVIfpTgaEe/CLkDlGWvW+
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

Russell King noted in [1] that max_mtu for normal descriptors,
SKB_MAX_HEAD() (3712 on arm64), does not match the hardware. Their
buffer sizes are 11 bits, and stmmac neither splits TX frames nor joins
RX descriptors for them, so a frame must fit one 2047-byte buffer.

Limit max_mtu so that a frame with two VLAN tags and the FCS fits.

Link: https://lore.kernel.org/r/E1vLJcL-0000000ExBL-0GFe@rmk-PC.armlinux.org.uk [1]
Fixes: 48febf7e6476 ("stmmac: allow mtu bigger than 1500 in case of normal desc (V4)")
Cc: Russell King <rmk+kernel@armlinux.org.uk>
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a685ce4638f6..2a27e1e7f9b9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8247,6 +8247,9 @@ static int __stmmac_dvr_probe(struct device *device,
 		ndev->max_mtu = XGMAC_JUMBO_LEN;
 	else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
 		ndev->max_mtu = JUMBO_LEN;
+	else if (priv->hw->desc == &ndesc_ops)
+		ndev->max_mtu = BUF_SIZE_2KiB - 1 - ETH_HLEN - 2 * VLAN_HLEN -
+				ETH_FCS_LEN;
 	else
 		ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);
 

-- 
2.55.0



