Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED5B606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eWo78BAr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H7qQBefS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SWwLvN5yU83ZBCHPhXtyXSkK0RHhvvZ/0hRhOydSxnQ=; b=eWo78BArOvtU6aHQ+GAxJpmGMZ
	D22AOEKBavRWRmEfP/ZuSpWsyosAOBkWqZ3H3CsTFK1zL/zYC8ail6tcWCzc2wM9Wa6hhL1oBqusV
	GLAlMELPscEK3ZAhDkQlKjDkzfa8lFQg6m7HX3ka4L692+Ru0njCTzE/hIXEKpAiJB7mkEh3TTPGZ
	w7ciSKNr3pOe55dI4JzW36G7+K0gfLR0+sLAz31y4U5Gx6KNibsofQX4mfYqeSSFKAOzaAonaoC7a
	VjxChgOQu1QOs29rqqqVvF7djqV/jcTQn+RFNv/Z2QXYQEaKehDuO7r2Q3eVEQl6HB3WzDmK3YXda
	SXGWJhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWAg-0000000HI4c-1j1F;
	Sun, 15 Nov 2026 09:05:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWAf-0000000HI4V-0ZcU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:05:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7701241886;
	Sun, 15 Nov 2026 09:05:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794733508;
	b=fmn9mMLINAdI3b31dx7fl4/htTvC8ovdMwnsGo2D2qv7wYh61GN0BTP9yyunEFLUV6JX
	 YfqQUM2YKCwntnmRmPad819+BtHyFFvymQYDZ58Pv5HhdHj722CPc+Ak0sAiybpGjQd8p
	 SKAH1Dp8QooPMCzs3MmPTTbXKps9T4Qd1vTmtfnOExnRcSMJOVa8nCBQ6LQEkeZvCaJlJ
	 A0hKb0WzkN/yIWA4i/ilN5ClvMVlol5P2T293rnFjw3CQPS+WJ8hZIFTBXFKXe+lhjOFe
	 DvYWDnjsrZbAufGBSYRU83Q7f0MPYzEXeaTG0nbiMY334qCQCaQEYVX123exbNiVIeA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794733508;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SWwLvN5yU83ZBCHPhXtyXSkK0RHhvvZ/0hRhOydSxnQ=;
	b=SRV+lHk/qJNEgLwUf6p0peY74acWbnMmLBsv0Jq1MDPfSC/AVgUdW7sWUoY53QCOFbxD
	 X5IKHOkA1meRX/1TupSynlWPJUr0PYAuabwUEvKdZUuopvTCYQsRFGAL8MQCjAEYMFtXB
	 y2Ae+b/1bsY7/KwY0LtEWbhtdbTaB60M1IaY41AdOzhZG9mx6bYDNY6gN4tLy9bw+M7va
	 EzogctxgiX9PCGXTJRbmGStXIT4p9S7BuMx+2DAYHyU5tlkwoN2SHFLsq4tO0wgSddGRX
	 qbN2ZvwO5ic4iVQMSB9rcfRr5aVsN5r8NHus12HbJJQuGh/iCdOONwqR0C7gnH9wHCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D830E1F000C4;
	Sun, 15 Nov 2026 09:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733508;
	bh=SWwLvN5yU83ZBCHPhXtyXSkK0RHhvvZ/0hRhOydSxnQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=H7qQBefSjjR2IwpJigL66Q2xaCI88wcALhDKH2LL147sCbE2I3/p89S9IU4R+Agro
	 jwKbSp9q0ZVxkdSbtK4bJLtIL4Qa1BfK/n6g34vMnD3k+I26eI6NqBf+WaDhGWjXsG
	 1v16zPzhy9EMx2e8V7KG+W2GAozwc7Ubr7+Ucg5Mh0ZkW0DzMIUaWPwuhu95WRYLZQ
	 ar/2dsn+waVeh/rLXQXGpjmr6iBqn/TRErPKVdIyMVeD3dqiBrgKkypTMVOE6AWuOY
	 JSttsKOP81SA8edIgnX/Td/1zzzexeXiSeQqw+fafqh2S/xTVVFLXZtKyA5de6bue0
	 aS5d9aTCc9fwQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 544294A021;
	Sun, 15 Nov 2026 09:05:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 09:05:07 +0000
Subject: [PATCH net-next v3] net: stmmac: dwmac-sun8i: Fix use-after-free
 in the MDIO mux error path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-sun8i-emac-mux-uaf-v3-1-c69d4189539d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBAF0KuYrh1Dp7FUV97DuCh1CjVSDKUNh
 nB3C25YGJc/M//9iQXqHQV23k2sp+SC63wOYr9jptG+JnD3nBkWKDnnCCF65YBabaCNI0RtgVd
 aqSPykyViufjqybpxRa/M0wCexoHdvpcQqweZYTGX38aFoevf637ia+PfVOLAQRRKU0nSGouXu
 tXueTBduw4k3BLiJ4GZkFgIKWWFUpVbYp7nD9R3qGETAQAA
X-Change-ID: 20261112-sun8i-emac-mux-uaf-1ba885219fee
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794733507; l=1719;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=+y0GcY4/PVmv5CEIOUChNpzRjsd6qAFwqN8yUicaQ8g=;
 b=WGxB9GPqMj1G3uOyPfh5GdwBrWsH+43WV1Oy91ghXj3UHSYqtPOjYOO9ZUbcawnPfHKKSQZIV
 wqJkLbTlGtqAaq9v9D/6boTgG+ufsgKqVVr5mtNEHt4mj2Rq7hd9I9S
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

If mdio_mux_init() fails after the internal PHY was powered, the error
path releases rst_ephy and ephy_clk before sun8i_dwmac_exit() uses them
to unpower it. Unpower the PHY first, as sun8i_dwmac_remove() does.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Found by Sashiko's review of another dwmac-sun8i series of mine.
Build-tested only (arm64 and arm, W=1): I have no board with the
internal PHY (H3, H5 or V3s), so the error path was not exercised.

Developed with Claude (Anthropic); I reviewed it.
---
Changes in v3:
- Drop the Fixes tag (Andrew Lunn)
- Shorter commit message
- Link to v2: https://patch.msgid.link/20261113-sun8i-emac-mux-uaf-v2-1-6203666b2687@gmail.com

Changes in v2:
- Target net-next instead of net, drop Cc: stable (Andrew Lunn)
- Shorter commit message
- Rebased onto net-next
- Link to v1: https://patch.msgid.link/20261112-sun8i-emac-mux-uaf-v1-1-308ae7e6fcf2@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..898560e8e95c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1245,6 +1245,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	return 0;
 
 dwmac_mux:
+	sun8i_dwmac_unpower_internal_phy(gmac);
 	reset_control_put(gmac->rst_ephy);
 	clk_put(gmac->ephy_clk);
 dwmac_remove:

---
base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
change-id: 20261112-sun8i-emac-mux-uaf-1ba885219fee

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



