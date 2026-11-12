Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32177606B5BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hSaRSCdZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHPwlUvl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wniR0PNwavTac3Vf1JqJ3ldcwoXmEwIh94D0StzA16s=; b=hSaRSCdZh6j42shwxRKs5eGV0z
	WmNc5d2pd6cCCCtn8YVPMBXvHnaLfXrvIQh85pUfz9IwfI67dUAlLtj0fJ0TqLgG4Ou6Nght/iCaS
	nK1fv45V0h4X+y+0eBLakdwO2AA5bSJrZaFoa88ml2BESExZq+4mwDLUmGQeboZnSvRTILNhWordp
	mtr2MDvTNoEOyswfbPmA2to+N4HXGvSN8EgBA4fWfHDf35/SeBeFdjtKD+pd6PxAybveZJrVhkKkR
	4wQSAGzmF+7MF/nuXaaSnai3HQh8Sbts/JgoftjA4Sz4DUp0wXQxxrYD7/Di57Z5YLHouWSHl958R
	EhhIE6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQPd-00000009DFt-0Lbk;
	Thu, 12 Nov 2026 08:44:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQNR-00000009CTF-2Knp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 08:41:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 04B9961439;
	Thu, 12 Nov 2026 08:41:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472908;
	b=3RUzXUoVC2tTVBo7pOENFTAmmFO0fkqAsnK+jXhSo1NaNWzmoVoSS2P/ehVdukOcOUHz
	 5caNVuuspGXYQSHtKfFbKZWcEbOqWoLKhhuJ6t1dh5WEtf4VhjwFamYKtOEnyOUqeVMqt
	 PNfp0808X2vQFZaQBCm96Z3OEt/iS9hdive7SP3QN66z0Z3EhQsBgDViNP/C9pKI224MT
	 qVk82IUbmu/XAStPwH2e9dk1/PTC5om6oSy5TK4HDa0+PmoUvtEt53nYQ9tpKjvzXMH4F
	 uKwcvS9KxSjVP7By4KhJxUExvLjowpEL9VO2N0hlWqbEL/qt3O2oNsjk7pc1pdjdQOA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472908;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wniR0PNwavTac3Vf1JqJ3ldcwoXmEwIh94D0StzA16s=;
	b=aIevw5BUBpFxTZV2AFlqLslnojaR5ppLY3+l6Tq/TbPZ2KWWERCLdDnjn5HzvsHgEiUO
	 5jvi11999/JBkQSq7Mt29VxNkN9YxPoziMf2uIT33xs8LENzRa6M4swaB7yD6p3lIgQNl
	 tGrGDh3ME0C5DR0RLp5Hoowr11FF9OiLEax/6ErAfpFL4J3KsY7mbsqHtHIKm0hJr2r4z
	 JMTygp84UFdquN1I6ehVCaul3SVaxuukV5Me6JoHLc5ej8cYsoY5+KJZwXjj8gZN4N8V7
	 jsaWA7rs6NYAQYkiwniFow35V8NBT00NJLtdQQVvIlkyqbGod5WDY3NWomgSKCKtVcQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1AAA1F00A09;
	Thu, 12 Nov 2026 08:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472908;
	bh=wniR0PNwavTac3Vf1JqJ3ldcwoXmEwIh94D0StzA16s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mHPwlUvlhKrYelGAvGkAghDW/0usmERGOrwNJ5wYOtpAlaK1B0o79DSnfd9z+bLmi
	 vV60YfkMbI+wzPzYL29VK9/ei3NueWU6qly1jQxNKwcSlGd4BS/bi8IAlHeE0pbmE7
	 BIBlp8D1hjyjkUlWsnK0rvNsX/0snCMZ6ZH+lNWkoZXzsvECEllQq04vknZwzX40qI
	 TWgVE4HVZNj2P6gCWZP2UP47zhVKoyDGRDTFukzX9CqDtVPJwOgQzTjueUxZL7ufZb
	 sbE9P3/grAuiXQJgV5yx8rJyOl135xXxCeY797wvL4eGRRHYG3ppNW2Ke3E0CUlEjY
	 0xUJetCV+1f/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 29C35493D1;
	Thu, 12 Nov 2026 08:41:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:41:47 +0000
Subject: [PATCH net-next v2 1/2] net: stmmac: dwmac-sun8i: Fix the RX_TH
 threshold encoding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-sun8i-emac-jumbo-v2-1-aca0cf23cf17@gmail.com>
References: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com>
In-Reply-To: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com>
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
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472906; l=1409;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=kKoyz2jSo9MVW4lEE52oWjQ6i8jVq1b7o2hmZSQuCoE=;
 b=g8/W7nlPeZfYmpu56asT03d91iiJSKK5MO6rRapGGZ4M0mZcYBIwI++ufmrkm7msjELJkc4ZP
 xOnoSwueTxHDS9gfJKD91a9yncVGseAqgU+tyhpEWbNQMSzzSsbFplb
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

The values are only used in RX threshold mode, which stmmac selects only
when the snps,force_thresh_dma_mode property is set. No Allwinner device
tree sets it, so no in-tree board is affected.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
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



