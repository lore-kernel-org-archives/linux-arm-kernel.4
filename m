Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E316606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 07:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FIw1xWFV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BP+oU47m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AaSZyM5wetB09LUbusDUB+0HrVaGOCOOtEk3uKZfB+I=; b=FIw1xWFViX8RhH
	MtF5dGazJqwnc7AxeJ7D1Mn3n38DTmXG68mTThHkF6pBaTj/lM1H4kR5UAbo7z2ohjK57A/qlYko/
	hXmowIaYeeZsg+CAhxv7RRbHVBOY56HVKlGhM/J2slVoYSOdEMFS6voRx1rVB4M6AW4ERhQvO3b2N
	T6xOd6RHd/OzQjOn0p3McE+p3y4RaKBlwwO+ffWrO7o+XltLPRN587QWA3q8ZIMsyXa6diRTHIQd0
	1li2rXUPe8QGZL+/1Bzeo5JEcSZEp34fdAOb3Jd3fwuttD+BrS64W3RKpCuT8O9PxA6b4aeeO9t1x
	Zwfp/XzE0u6Zg0K3xzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2HV-00000000ptS-1T0H;
	Sun, 22 Nov 2026 07:46:37 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2HO-00000000pri-1jsO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 07:46:31 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-8631e07b756so1109859a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 23:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333589; x=1795938389; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaSZyM5wetB09LUbusDUB+0HrVaGOCOOtEk3uKZfB+I=;
        b=BP+oU47mqZfNKQeyxhTh4GWG/k35LuuY5vxNziqlsvHFFjaYpNSCW7iDN+zNRisszF
         DprzanF4QnxPbl4n47SoEAzuRrlTHWS7pPYqxdquMnDDrX6JW4OauhVM5ByslING1qgu
         5ZISBPjwLJ4OdvQlUW7ar/M9GYsjvulbklpFj8tpj0jWY2LUEfhWlLM4VomBmrYUjVHF
         JaQ3NuuZ6Y63Jl/hEXw2f0GUucPLUFjo8o39Ll/TB66VkUDGHEX1ajaF+Dx5uj1lFNdo
         TkezVpTXVFyQby+LZiQMbkSYlxIT2xCKw0npnUQWYbK2DVrv+XQgcx4ItTBlRxS1XkxZ
         Bxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333589; x=1795938389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaSZyM5wetB09LUbusDUB+0HrVaGOCOOtEk3uKZfB+I=;
        b=uErAJhHeuAzT+fOzGGGEWBbizEleGCBkolN1e3Juc2GA0Lw3HbPvsku3m3Z5vK1vv3
         jPrOUW3HAu4XcmG01QRW2VGDcLbWAUy2hPRcsaP36QSF/ChJ67wu3vx06rMchQW3sOSb
         Lm7r7f4nRCK8+9yEhlOSkx71GhUhtDvIBzkrZD6sSe7PGbsW+ML+t1/A61sxa3SmjkzD
         iUII+mvHmaqjinOrGDyXUToE6E4Oi/XfWUjeWUtxTrogNJl2X9wcLnR9232//nRI5yv9
         hR4mb/W65EQ3csdWlTSMT1MCeq61wWU/dgWKhvhLJA2wT/2J3Yx/1uvzphjjmb4mJ1kS
         rAyA==
X-Forwarded-Encrypted: i=1; AL+hErG4qIwYnxVuq/RVrn8FKoy5KaRs9J7GkHUaMnkn3hOM7i9CivKkRIExCuBio5AoGQxhEoxAhLPK2incj2gcqDYb@lists.infradead.org
X-Gm-Message-State: APuU4Z+YInchQa1M7SyG0DS+y2CLgPNRVYwMDsM/GU/cMgAcydVrJMXC
	IG5RPbyH8/6I4CdaemWBk8ClfNWjlk8Eb56QfnKUphT/Eyzeafxp7ttp
X-Gm-Gg: AZFdTZfxsbvlTxYA3oOBEeLoUhzqzuYQL/2l6Ha/QWZYHl0H5syPLjFLaZvZWZC3bRL
	6splfKEYDC58OWWd+AhDhjkT4oCC0kUvAlnRTX6PAAb41mUHzDEF+RhqB1AOKiL/y8wnnfQpRHA
	xV+cexDQqzI+huCtqB+X7eU6/7nGyb6vU5wTzWI1RosZG1Z24w2U8ZRHpad6Mectrmuj00/rpFi
	LgPm9Y5b/E+3DOrkExdgM+sqKlDTOWKU2LXqFZ+mhzMJol1UVMY4svDxYLCCKVmXt4evecviz4L
	mhSMC8fM6UfgzmdN9dhuIqcqEYv6FV1tIqGgwbuxyMgKskkv1aAL1H9XUuJ1GqVHCkvMXsb9uZd
	kKpuHc/H0cIEj+0xvRJYWRa6CmEdDe9SHMiB88MKWQNRMw80YfiQgr/MwLaF9xX2cs9N1Sg35hs
	jdJRNJyOytFVzu9cimJJKG4YwGEM1T9iEQQAtwO7FvOFszpciup3uf8CqLZMrY/uqtF7IDr9Wxb
	jcYNfr/qfAbN9SA8QxWoGE3341IMyeFR3GW+2Gn9DaXjfCamUnv5Z0vWsCdclUPL1MdclDX/zpW
	wYx4SzXOOkvyFQO1fivfdO3srx9/B+MUjnhROYhrP+gmAQn5PmObLWUdXCZo58QfyKFzuSBq+dy
	1GWeqH76S8jmbDUxEcg9rQEIwU5syHcrYKTA4UnDms/khism3XGF8WqDKjdtf9n3xFLQFWIiqx1
	9MBsX3s8byUzs7xVCMvKNFhURLqMXS8HARuUxQIlz3WuGrDMcHOlbA
X-Received: by 2002:a05:6808:1387:b0:4f4:b62c:a3d8 with SMTP id 5614622812f47-57a0a937f43mr9425803b6e.33.1795333589314;
        Sat, 21 Nov 2026 23:46:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252987sm6121800b6e.4.2026.11.21.23.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:46:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 00:45:47 -0700
Subject: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool
 rx-all
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
In-Reply-To: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_234630_498495_6B85C0C0 
X-CRM114-Status: GOOD (  19.87  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable packet captures of complete frames with wire errors on sun8i.
Report these frames to the core with an unverified checksum so it
can deliver them when rx-all is enabled. DMA and incomplete-frame
errors still require dropping the frame.

Program runt forwarding at initialization and when rx-all changes.
Serialize live updates of RX_CTL1 so changing the receive mode cannot
overwrite a concurrent DMA start, stop or threshold update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 73 +++++++++++++----------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 0ad2203f76c3..8398788d334e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -21,16 +21,12 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
+#include <linux/spinlock.h>
 #include <linux/stmmac.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
 
-/* General notes on dwmac-sun8i:
- * Locking: no locking is necessary in this file because all necessary locking
- *		is done in the "stmmac files"
- */
-
 /* struct emac_variant - Describe dwmac-sun8i hardware variant
  * @syscon_field		reg_field for the syscon's gmac register
  * @soc_has_internal_phy:	Does the MAC embed an internal PHY
@@ -73,6 +69,7 @@ struct sunxi_priv_data {
 	bool internal_phy_powered;
 	bool use_internal_phy;
 	void *mux_handle;
+	spinlock_t rx_ctl1_lock; /* Protects live RX_CTL1 updates */
 };
 
 /* EMAC clock register @ 0x30 in the "system control" address range */
@@ -198,6 +195,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in RX_CTL1*/
 #define EMAC_RX_MD              BIT(1)
+#define EMAC_RX_RUNT_FRM	BIT(2)
 #define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0
@@ -442,25 +440,32 @@ static void sun8i_dwmac_dma_stop_tx(struct stmmac_priv *priv,
 	writel(v, ioaddr + EMAC_TX_CTL1);
 }
 
-static void sun8i_dwmac_dma_start_rx(struct stmmac_priv *priv,
-				     void __iomem *ioaddr, u32 chan)
+static void sun8i_dwmac_update_rx_ctl1(struct stmmac_priv *priv, u32 clear, u32 set)
 {
+	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
 	u32 v;
 
-	v = readl(ioaddr + EMAC_RX_CTL1);
-	v |= EMAC_RX_DMA_START;
-	v |= EMAC_RX_DMA_EN;
-	writel(v, ioaddr + EMAC_RX_CTL1);
+	guard(spinlock_irqsave)(&gmac->rx_ctl1_lock);
+	v = readl(priv->ioaddr + EMAC_RX_CTL1);
+	writel((v & ~clear) | set, priv->ioaddr + EMAC_RX_CTL1);
+}
+
+static void sun8i_dwmac_dma_start_rx(struct stmmac_priv *priv,
+				     void __iomem *ioaddr, u32 chan)
+{
+	sun8i_dwmac_update_rx_ctl1(priv, 0, EMAC_RX_DMA_START | EMAC_RX_DMA_EN);
 }
 
 static void sun8i_dwmac_dma_stop_rx(struct stmmac_priv *priv,
 				    void __iomem *ioaddr, u32 chan)
 {
-	u32 v;
+	sun8i_dwmac_update_rx_ctl1(priv, EMAC_RX_DMA_EN, 0);
+}
 
-	v = readl(ioaddr + EMAC_RX_CTL1);
-	v &= ~EMAC_RX_DMA_EN;
-	writel(v, ioaddr + EMAC_RX_CTL1);
+static void sun8i_dwmac_set_rx_all(struct stmmac_priv *priv, bool enable)
+{
+	sun8i_dwmac_update_rx_ctl1(priv, EMAC_RX_RUNT_FRM,
+				   enable ? EMAC_RX_RUNT_FRM : 0);
 }
 
 static int sun8i_dwmac_dma_interrupt(struct stmmac_priv *priv,
@@ -539,24 +544,23 @@ static void sun8i_dwmac_dma_operation_mode_rx(struct stmmac_priv *priv,
 					      void __iomem *ioaddr, int mode,
 					      u32 channel, int fifosz, u8 qmode)
 {
-	u32 v;
+	u32 threshold = 0;
 
-	v = readl(ioaddr + EMAC_RX_CTL1);
 	if (mode == SF_DMA_MODE) {
-		v |= EMAC_RX_MD;
-	} else {
-		v &= ~EMAC_RX_MD;
-		v &= ~EMAC_RX_TH_MASK;
-		if (mode < 32)
-			v |= EMAC_RX_TH_32;
-		else if (mode < 64)
-			v |= EMAC_RX_TH_64;
-		else if (mode < 96)
-			v |= EMAC_RX_TH_96;
-		else if (mode < 128)
-			v |= EMAC_RX_TH_128;
+		sun8i_dwmac_update_rx_ctl1(priv, 0, EMAC_RX_MD);
+		return;
 	}
-	writel(v, ioaddr + EMAC_RX_CTL1);
+
+	if (mode < 32)
+		threshold = EMAC_RX_TH_32;
+	else if (mode < 64)
+		threshold = EMAC_RX_TH_64;
+	else if (mode < 96)
+		threshold = EMAC_RX_TH_96;
+	else if (mode < 128)
+		threshold = EMAC_RX_TH_128;
+
+	sun8i_dwmac_update_rx_ctl1(priv, EMAC_RX_MD | EMAC_RX_TH_MASK, threshold);
 }
 
 static void sun8i_dwmac_dma_operation_mode_tx(struct stmmac_priv *priv,
@@ -648,7 +652,10 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
 	writel(v, ioaddr + EMAC_BASIC_CTL1);
 
 	/* Forward checksum failures to software before starting RX. */
-	writel(EMAC_RX_ERR_FRM, ioaddr + EMAC_RX_CTL1);
+	v = EMAC_RX_ERR_FRM;
+	if (dev->features & NETIF_F_RXALL)
+		v |= EMAC_RX_RUNT_FRM;
+	writel(v, ioaddr + EMAC_RX_CTL1);
 }
 
 static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
@@ -1052,6 +1059,7 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.set_mac = sun8i_dwmac_set_mac,
 	.dump_regs = sun8i_dwmac_dump_mac_regs,
 	.rx_ipc = sun8i_dwmac_rx_ipc,
+	.set_rx_all = sun8i_dwmac_set_rx_all,
 	.set_filter = sun8i_dwmac_set_filter,
 	.flow_ctrl = sun8i_dwmac_flow_ctrl,
 	.set_umac_addr = sun8i_dwmac_set_umac_addr,
@@ -1126,7 +1134,7 @@ static int sun8i_dwmac_rx_status(struct stmmac_extra_stats *x, struct dma_desc *
 	if (unlikely(runt || (status & wire_errors))) {
 		if (runt && !(status & RDES0_LENGTH_ERROR))
 			x->rx_length++;
-		return discard_frame;
+		return rx_error_frame | csum_none;
 	}
 
 	/* Only a checked IP frame is eligible for CHECKSUM_UNNECESSARY. */
@@ -1218,6 +1226,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (!gmac)
 		return -ENOMEM;
 
+	spin_lock_init(&gmac->rx_ctl1_lock);
 	gmac->variant = of_device_get_match_data(&pdev->dev);
 	if (!gmac->variant) {
 		dev_err(&pdev->dev, "Missing dwmac-sun8i variant\n");

-- 
2.53.0


