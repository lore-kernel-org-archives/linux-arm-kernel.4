Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BB8606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zCi3QgDj;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=b3pc9oae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=90uW9vPXKmWFpzCjI8Up2KnoezPG5Nbi1kLisqyflSw=; b=zCi3QgDjur6+Pw
	/sJqq+lJEV845eaLwEUBXfN7wwthXjm4tw8eVCtwc+cQ3NmdSR/jcjgvzuWeesSS0VjPVf664f6tv
	GcVQKvZkLg99KgL12XxHFHsULt2FbV8jHvF+Tb8DwyGRrCsYCZ1LbeaN0ze4Oj1Vp8ICjfHCZm2qE
	Z+DaCA0beI6/j+RBlGjtg98juupw9SXk50FuVsebdgyv4yXVafB9YBOuiD3iWfLZ9dlGzBQrFYTp8
	6y9yo59KeMUZGofRr7/5vsMZzjbWqaONRI3a8Gn0ICTJBexAiju9Nz2GAEXTSL3IqwXX/dFhMHfiA
	mLZOlUGZsyglaZR3R8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8tO-00000001Dub-0tbr;
	Sun, 22 Nov 2026 14:50:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8t2-00000001Dmu-12pZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 14:49:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF9D34E416E1;
	Sun, 22 Nov 2026 14:49:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93B7D60512;
	Sun, 22 Nov 2026 14:49:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAD8111E62396;
	Sun, 22 Nov 2026 15:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795358985; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=90uW9vPXKmWFpzCjI8Up2KnoezPG5Nbi1kLisqyflSw=;
	b=b3pc9oaep+z/bJD4QxXY7ItQ9Mhm9vK4KSpxC1+FEcS76h22AnJdRuLoNc2vDv2VilJxFk
	XB10alWQcDGW5eq/DgZ3BjLf0EqkZ5GLTejX3nEtxaOezKR01W/uW5k+u9wXaFSs+dboIo
	pEo2LIdE1Zi4EZyGfElNeXUfsrrzZ9XSZRJqphfKOmNb5pUtqetPEu52IQfNs77C+A89Ew
	FFCVUTg+XhoumzBDVsrCjP19/Rcn4T0G+TIX63yPiJ927z1sqUD8F+t+g/tcWrsQE387al
	WBqva0f/+8krqadVlEp4T/1ZzzzHyE7mvP2VEoERJYKrrdLy4wWRKJTHbzp/1w==
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
Subject: [PATCH net-next 2/3] net: stmmac: dwmac-sun8i: emit pause frames when the RX FIFO fills
Date: Sun, 22 Nov 2026 15:49:24 +0100
Message-ID: <20261122144926.284857-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_064948_448986_5816854C 
X-CRM114-Status: GOOD (  11.47  )
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

The TX flow control mechanism needs multiple things setup to actually
work:

 - The TX_FLOW_CTL_EN bit needs to be set in the TC_FLOW_CTL register,
   this is already done

 - The RX fifo thresholds needs to be set, to indicate when the MAC needs
   to start sending pause frames based on the RX fifo occupancy, and
   when it should stop.

Let's configure the threshold the following way:

 - Send pause frames when there's less than 2K left in the RX fifo
 - Stop sending them when there's more than 4K left in the RX fifo.

This was tested in Allwinner H2+ using the ethtool -t "flow control"
selftest. On that SoC, the RX fifo is 16K.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index c63f4d87de50..75c743dfe348 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 Corentin Labbe <clabbe.montjoie@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -202,6 +203,11 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 #define EMAC_RX_TH_64		(0x1 << 4)
 #define EMAC_RX_TH_96		(0x2 << 4)
 #define EMAC_RX_TH_128		(0x3 << 4)
+#define EMAC_RX_FLOW_CTL_TH_ACT	GENMASK(21, 20)
+#define EMAC_RX_FLOW_CTL_TH_DEACT	GENMASK(23, 22)
+#define EMAC_RX_FLOW_CTL_TH_2K	0x1
+#define EMAC_RX_FLOW_CTL_TH_4K	0x3
+#define EMAC_RX_FIFO_FLOW_CTL	BIT(24)
 #define EMAC_RX_DMA_EN  BIT(30)
 #define EMAC_RX_DMA_START       BIT(31)
 
@@ -766,6 +772,17 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 		v &= ~EMAC_RX_FLOW_CTL_EN;
 	writel(v, ioaddr + EMAC_RX_CTL0);
 
+	v = readl(ioaddr + EMAC_RX_CTL1);
+	v &= ~(EMAC_RX_FIFO_FLOW_CTL | EMAC_RX_FLOW_CTL_TH_ACT |
+	       EMAC_RX_FLOW_CTL_TH_DEACT);
+	if (fc & FLOW_TX)
+		v |= EMAC_RX_FIFO_FLOW_CTL |
+		     FIELD_PREP(EMAC_RX_FLOW_CTL_TH_ACT,
+				EMAC_RX_FLOW_CTL_TH_2K) |
+		     FIELD_PREP(EMAC_RX_FLOW_CTL_TH_DEACT,
+				EMAC_RX_FLOW_CTL_TH_4K);
+	writel(v, ioaddr + EMAC_RX_CTL1);
+
 	v = readl(ioaddr + EMAC_TX_FLOW_CTL);
 	if (fc & FLOW_TX)
 		v |= EMAC_TX_FLOW_CTL_EN;
-- 
2.56.1


