Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919A6606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K68r5zOT;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pf3fP81J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=utK4M7GE/JevjSpCvIwudXzUWEsfoW3c/fssQAD0hxo=; b=K68r5zOTx/ruoB
	tqdTZJh0OWH3HAYeV7LD6Ae2aCGWk+ldRknsVPuRwmImaPeDIhrenTTDYI5vsJUjgb8SSL50lH2O0
	V7T9xQWlJecQHfsczlNGoUXMSGDAOxq9fL6rC79GO9ixyQzziuMl2cNeKidlbLwRC6W9RUCSOsVxy
	Rp6z6CYVwaQj2Pn8Wkc3EjqtePpdigbHIHw/I7Unz4VD4kBJF2YNK9FbSI3OP63nFZyt8+7V5YSel
	QLMM+hNNDwOptLRNdozmCGzOe1dHFSp+fK18H9xEGztjDxbHVA4uMrV/G1zWuPelME9MWAAEM1G56
	zoyWIU+FBwAHlaeE1lcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8t8-00000001Dp9-3lG6;
	Sun, 22 Nov 2026 14:49:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8t0-00000001DmK-3SlL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 14:49:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 68700C6223F;
	Sun, 22 Nov 2026 14:49:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC9A460512;
	Sun, 22 Nov 2026 14:49:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58F5711E623B4;
	Sun, 22 Nov 2026 15:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795358982; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=utK4M7GE/JevjSpCvIwudXzUWEsfoW3c/fssQAD0hxo=;
	b=Pf3fP81JIlkMcHt1EYgMaHvhSnQSV9lrWuFWvJMp7dZTp0VfwGfllF4N9Hj79xMB6L2zN1
	SMNsmjRvsaWV503SF2L2pGr+0HHSMdm9nFztbXy0R+glKThJ3cpRr9LeNxaF07M/Rxiagm
	xABKvek67OsW7AwDZZyrvbQ4HhvTSvd8DtshhFpaPk6KZafsikDiZSyk5MPPtY5akAL3dx
	w7lBD278dFg11+ppOGQKTWF4hTk/Xwh2yH6jQJsAG8gTJvW5PmBdrt9y8s3YyxrHLMEYPf
	fISLAOhRSL8tUxkUfMeVEPPxtVr6jI+zIWv8uzlBmHFmaRjSWNBTlSLsx/l1/A==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH net-next 1/3] net: stmmac: dwmac-sun8i: allow controlling TX and RX flow control separately
Date: Sun, 22 Nov 2026 15:49:23 +0100
Message-ID: <20261122144926.284857-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_064947_005478_46D88560 
X-CRM114-Status: GOOD (  10.37  )
X-Spam-Score: -2.1 (--)
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

Currently, the sun8i flow control setup only looks at FLOW_AUTO (which
is FLOW_RX | FLOW_TX), and enables RX/TX based on that.

Allow enabling RX/TX flow control directions separately.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..c63f4d87de50 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -760,14 +760,14 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 	u32 v;
 
 	v = readl(ioaddr + EMAC_RX_CTL0);
-	if (fc == FLOW_AUTO)
+	if (fc & FLOW_RX)
 		v |= EMAC_RX_FLOW_CTL_EN;
 	else
 		v &= ~EMAC_RX_FLOW_CTL_EN;
 	writel(v, ioaddr + EMAC_RX_CTL0);
 
 	v = readl(ioaddr + EMAC_TX_FLOW_CTL);
-	if (fc == FLOW_AUTO)
+	if (fc & FLOW_TX)
 		v |= EMAC_TX_FLOW_CTL_EN;
 	else
 		v &= ~EMAC_TX_FLOW_CTL_EN;
-- 
2.56.1


