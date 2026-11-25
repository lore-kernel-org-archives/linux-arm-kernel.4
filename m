Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF19606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UhZxf8Xp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0AVEf7r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kP5KvBLLujm3tot/u72/GiMQgb/Q4eLbGpnw4Ysyfns=; b=UhZxf8Xpmr1Tae
	v5w1Vfxh5iMA6ubicogjJHMUbKztjcAQEHpLrT2xCX73miQmZ5u3O4p7O7vM2L2+6mkkTgGKHrzWW
	tj6Geu/dP3hokly5+31V9jswm/WNnS5mZ5uonxT5L1PS8ddcaf1esdc3e7PAd+jDdjE/hcq71D+VO
	42sbSkbGDFTN3+tGBHvaWXfG+NGJSNrRH5Q3AyUdSG7gxJp4zcXpAyK3kF+HTzGsWXpcHmZyM/NuE
	cvvwtHfVH4dJjftgR2GC0qI+wryLi6AFR/VRXx3GvKktGB0kfmFB/22X1muYqHnZw57vOhDRei25k
	vQ3CZIF83wbH48d84BqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8DR-000000092I8-45Fb;
	Wed, 25 Nov 2026 08:18:57 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8DC-000000092D2-1w75
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:18:46 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-53ec2cc397aso2836429b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 00:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594721; x=1796199521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kP5KvBLLujm3tot/u72/GiMQgb/Q4eLbGpnw4Ysyfns=;
        b=g0AVEf7rxKLX5aPkc9Q7k2hxjCwIjyCo+VyqhvIG05Q+YQG9wojheHvyqPwpJc486U
         7i5vNhD4gKAxEfpMprUjNfNtuehsoYNEnitfJERaUX69XNw58I60WnCc36CdYGBCtb+Q
         tWFLLUBmohjPKFyU/5AkoHzP06YdhecIIuqe9gr720qdaLgcenoQvYWUv5cfEeIiRJoy
         /CjwyX6Mfn0rlefh1GT6immJaf4F/chmmB5uiRUxiSiVuXQIDN6vCKWXMQHkVEHrkAhH
         DATUcY9zRPTWzrxHWna9trCxk+StwImzNflqMb4zwIfEhK64MON6IJgCFgk4HLJ83sZT
         ejnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594721; x=1796199521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kP5KvBLLujm3tot/u72/GiMQgb/Q4eLbGpnw4Ysyfns=;
        b=wpzYaNRfbhIqsfx7DM27bTBK+85w5PkkOCesI887tbdMbKj9okhcUVfCglXtECR+ov
         NmEZ+6iYi40rZgVo18GSdK7DVneSqffyMo2eSLAkGIAmGA9DVBpOucV8lRRmEcW0XRYT
         97jSvFMCRACUHm8blSYosYU4xymzWZPP+buff8N/Vc22NADaha2CqLBBZsJHg/GhKKiD
         T0KXVOfgA7kvLrOoRYGCFmOYDnLfp5N5dmHNC1zjg7I8SzJ2/Xq96UVJibFQapY9NdM3
         yRzLLU2jJFj+3IvWo6wVPufSU9jcvGleQ4UH2kUAusKDlXBq75CeASme1vqgyvHdyo+v
         JZ+A==
X-Forwarded-Encrypted: i=1; AL+hErEa/Vy6bJKB4g7dt1EcPgRjWwgtSXQVp2Lm8QvLITo1lOQ04I048T/Kzg3PGFAWwnTjH8iQOISM0+/SfLDQBVnt@lists.infradead.org
X-Gm-Message-State: APuU4Z9U2brwH0wUlW2CNP/qhwnIPEzpNhX7cLmKt9JC1jquwoAot3Vl
	jySEsi9KolZfYyuvDCIevi2QpizDvRwBLy92KPy5dd3TvW0GGV5XmNuAUEbXV1Lr
X-Gm-Gg: AZFdTZchcupK2SmphmpPRl4WpFG5ir3pO72J9eC4MwgWRnle79CBnrx+1sxmuY0lrU1
	gDpJcCZpSHQ69nTRHJwHAgOncmVAJ3Fa5gcYQCWppy1fscYIlrP/LsiVhWjErxh/hAsCouQl9Gm
	FiJlv6x7pdp63uoP3jYxY6Z2SVjcMSzbaK8kOVLpQ77+Y0gMGslxCKZeKSBdik+EQIvJaWzHQNL
	zdcOHTS+clTreArIHgZpNzMQCjuot/800bMTq0gKWFqP28vhCf1RhY4M+uouobvQe2CtHnnT/Ie
	Ei9GZRC0+xLfRViInv1603H2UP2m++kj/1iX3gJUR35ihkGdLBWJzXMNRB3IJ/ih/zrSDi69hJg
	cdHrt3yorVKmw/Je1BwOLQtpFz55cy81yEa8i55/60DEoY/2kcfZUWcCNCeks3IEQUhek0wvK59
	ZyB19Kz8FCYK//GIn5w/DD9EvdqOFM87uTLGp4Fjhk8KJsLY5aYEA4D5RJ91upFvAh3Rvjw4ZCz
	qHgeVzTmEZjYLs+bWpDYHaKjmkdrM0xm8gwSB2huW2rIpZmUiALQcRq/27DTfQZblgg2wYloEV0
	3G9ON5spIGrL+ng/5+O6b0TN7jCd9QH1FN6YeG692PuCLOmFuEIsSrcjUvPzhdDYZwYcEVL0gNZ
	S7aTlAN7AhaHQwx18P6XyFDqx6VHI14khls8ajmaTi5DybKdKtxrgAvnxNRZvk2pRowIOyK1/Dj
	aBbkr03RRoi6CNhjJSsUnJV8O8FmAQJJVm9jcEowYPp4bSE7dxfTs=
X-Received: by 2002:a05:6808:14c5:b0:4d6:90d3:e189 with SMTP id 5614622812f47-57a0b750822mr17691751b6e.50.1795594720871;
        Wed, 25 Nov 2026 00:18:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm14884815fac.0.2026.11.25.00.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:18:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 Nov 2026 01:18:32 -0700
Subject: [PATCH net-next v2 3/3] net: stmmac: dwmac-sun8i: support ethtool
 rx-all
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-submit-sun8i-rxall-v1-v2-3-4de03fbde087@gmail.com>
References: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
In-Reply-To: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
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
X-CRM114-CacheID: sfid-20261125_001842_884984_CEEDBA34 
X-CRM114-Status: GOOD (  16.45  )
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

Allow packet captures to see complete frames that the sun8i MAC
forwards with wire errors. Mark these frames, including runts, as
errored with an unverified checksum so stmmac can deliver them when
rx-all is enabled. Incomplete frames and DMA errors still require a
drop.

Set runt forwarding from the rx-all setting at initialization and
update that bit when the setting changes on a running interface.
RX_CTL1 also controls DMA, but RTNL serializes the ethtool update with
open, close and reset. System suspend freezes userspace before stopping
DMA, and the sun8i interrupt handler does not change the RX threshold.
The setter can therefore update the register directly. Keep error
forwarding enabled in both modes for RX checksum handling.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 379108e3da32..a008ce1f7882 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -198,6 +198,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in RX_CTL1*/
 #define EMAC_RX_MD		BIT(1)
+#define EMAC_RX_RUNT_FRM	BIT(2)
 #define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0
@@ -648,7 +649,21 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
 	writel(v, ioaddr + EMAC_BASIC_CTL1);
 
 	/* Forward checksum failures to software before starting RX. */
-	writel(EMAC_RX_ERR_FRM, ioaddr + EMAC_RX_CTL1);
+	v = EMAC_RX_ERR_FRM;
+	if (dev->features & NETIF_F_RXALL)
+		v |= EMAC_RX_RUNT_FRM;
+	writel(v, ioaddr + EMAC_RX_CTL1);
+}
+
+static void sun8i_dwmac_set_rx_all(struct stmmac_priv *priv, bool enable)
+{
+	u32 v = readl(priv->ioaddr + EMAC_RX_CTL1);
+
+	if (enable)
+		v |= EMAC_RX_RUNT_FRM;
+	else
+		v &= ~EMAC_RX_RUNT_FRM;
+	writel(v, priv->ioaddr + EMAC_RX_CTL1);
 }
 
 static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
@@ -1053,6 +1068,7 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.dump_regs = sun8i_dwmac_dump_mac_regs,
 	.rx_ipc = sun8i_dwmac_rx_ipc,
 	.set_filter = sun8i_dwmac_set_filter,
+	.set_rx_all = sun8i_dwmac_set_rx_all,
 	.flow_ctrl = sun8i_dwmac_flow_ctrl,
 	.set_umac_addr = sun8i_dwmac_set_umac_addr,
 	.get_umac_addr = sun8i_dwmac_get_umac_addr,
@@ -1126,7 +1142,7 @@ static int sun8i_dwmac_rx_status(struct stmmac_extra_stats *x, struct dma_desc *
 	if (unlikely(runt || (status & wire_errors))) {
 		if (runt && !(status & RDES0_LENGTH_ERROR))
 			x->rx_length++;
-		return discard_frame;
+		return rx_error_frame | csum_none;
 	}
 
 	/* Only a checked IP frame is eligible for CHECKSUM_UNNECESSARY. */

-- 
2.53.0


