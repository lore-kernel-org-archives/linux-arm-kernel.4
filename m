Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9CD60A261C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HNBLa20k;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NV+ECQsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5YtuvWKDSb9pFGs1NpK0eERYNZuHxWBhMhLJZ+qgF6c=; b=HNBLa20kzEof/nSW5pOqvwuI7f
	oXuiZWWX5NmJP7r8dB2zHvEplQaUJBOb4pl7GURJBc795LhA77bhU40w/JsULzFUUhhcRJ8wEEOvy
	50Ar67Gv6TUhuNSwC2wyDdZZsWktgXxk+8gPnzJjHeKdN20wLKD5y/jUbhd5TKu1ip+XKSBWP6RWl
	AKqAqELxNUJlslNffU/S6vGf6l4oj/nR47M8A0EMLBDU9PKG5x5sutn5KUSLGYJ0uugpA/YEjg9qv
	UYjLjwZdWmIirhTH9Qk5Be+Y8/UND9uxyDo/dZUOy0bPP2O965ijhs/IR4SVDewvBYCqk3iNZYCBS
	SVAOnzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQexG-00000002anq-0Hoc;
	Tue, 10 Nov 2026 06:03:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQexE-00000002amk-3ih6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:03:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 575AB63401;
	Tue, 10 Nov 2026 06:03:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794290616;
	b=reS/2YyC1TDhT78PNwQgP4/vtNrW+7JLBo07gF/cVyOisl1daIGOs0RfoBOd8kcy+U48
	 Zrv8cBdO2WjDJL8mlHn1eugLcHWJ4yDYeEf1N5fYhEx4K/r+zxwiqEIsgOYDudHr46LGr
	 MZiiVToI9CDkkr4lCQibq8sr3geUJTJfqzoqre2Vl+32cQUu8hJub00qlgXKk+u4CngNl
	 NR9hPALfCc4JBlFSppzmnhR+jFtCCRDC2pj3gRT1mV24WBBQcDGZRFkZ5ZSMk2+cBWbK+
	 +3Tr/4wlpFCA04a8ViY9FR1ZVE/SjWm/8/F56pg2bgTut0RIjEo7MxSt5PDPCQyRF4g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794290616;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5YtuvWKDSb9pFGs1NpK0eERYNZuHxWBhMhLJZ+qgF6c=;
	b=tAPrmvs9+bsFaj/rT6dsZRLfJBQHsJs5+wSaxGZakTEnU1qcytW+q6DydwwWcQ5RYWFw
	 5UlyYX383rNVj5humFrK7LBUFIP6RcYhPGGDzMV6HGTJ5b7l3Fkw0OS391rU3GJtIfB7D
	 LhAPKXMOocU5sVS+RtU3io69V38JQFhjElwUlkchRRK7eiDwpe270bs0Mu6W4K36DPEgz
	 McuHh7wriuUD5pkKeNuwgDkscizTw/q7RvzOp1AWLFYlk4yPMR9M+EKdaxnRcFYIziqvw
	 hc9FX+jwV+HCqQcFE/0DDI6ujeQXXWIhutYc0js8BUtNdT69KRI0BCLpXXUwxM53utg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AB7F1F008A1;
	Tue, 10 Nov 2026 06:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794290616;
	bh=5YtuvWKDSb9pFGs1NpK0eERYNZuHxWBhMhLJZ+qgF6c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NV+ECQsy/IqPXpreuVGwouPsa9+YE581yGlo/oGumPA65jhFlV9jo0rBnb1IlHYj/
	 MErS2dSuR3JtMZa1HTH+/3joSaIiUiWqsYZyjrYo0BaIvXS+8JUzQHhxZcetNZrCZE
	 9FIKG9YplDerVOmmuNFnqfGfG50/QShaUpz7SC6EG9oYdYlw8S1xPSYgYvdruG1Uam
	 /VYDr7SykVnNZUbxmWyI1+Se0aZt4KAmIii/v410q9PR/CG3G6j/8zc4KXM9ZFvcTH
	 wkoXc+OJkwGLt3cy/QZUaDxRwSq6ZyBaCikBkt6xFUnbJ+KAQnn3tIj83T2PL8t8E5
	 gQ/244VkH93tw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1B4C9488D4;
	Tue, 10 Nov 2026 06:03:35 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 06:03:35 +0000
Subject: [PATCH net-next 1/2] net: stmmac: dwmac-sun8i: Fix the RX_TH
 threshold encoding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-sun8i-emac-jumbo-v1-1-84bf00e9ffa3@gmail.com>
References: <20261110-sun8i-emac-jumbo-v1-0-84bf00e9ffa3@gmail.com>
In-Reply-To: <20261110-sun8i-emac-jumbo-v1-0-84bf00e9ffa3@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794290614; l=1310;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=mcrcgOa3opg1b6qCwzfWbgeFogC4AhlPlSr0iRc035U=;
 b=6QCx5JzkZ326YxqrGgQVsLb08hT7kMMlWAxIs4HcUY6fXDSajV2tGzNT9PK2uh1mhv6d8mX2/
 fqtVlM1UG7vCTm7qx1DC+rjhXgqcQCxAAQrGSj+1CKjIC93ITni48uH
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

The EMAC RX_CTL1 RX_TH field (bits 5:4) encodes 00 = 64 bytes and
01 = 32 bytes (H616 user manual v1.0, 6.5.10; 10 = 96 and 11 = 128 bytes
as in the driver). The driver has the first two swapped.

The values are only used in RX threshold mode, which dwmac-sun8i never
selects while RX checksum offload is on, so no current configuration is
affected.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 47954537b29e..0c82662fbe6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -198,8 +198,9 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 /* Used in RX_CTL1*/
 #define EMAC_RX_MD              BIT(1)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
-#define EMAC_RX_TH_32		0
-#define EMAC_RX_TH_64		(0x1 << 4)
+/* RX_CTL1 RX_TH encoding (H616 UM 6.5.10): 00 = 64, 01 = 32 bytes */
+#define EMAC_RX_TH_32		(0x1 << 4)
+#define EMAC_RX_TH_64		0
 #define EMAC_RX_TH_96		(0x2 << 4)
 #define EMAC_RX_TH_128		(0x3 << 4)
 #define EMAC_RX_DMA_EN  BIT(30)

-- 
2.55.0



