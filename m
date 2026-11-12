Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C337606B5BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UR3qTbca;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HNt4lR5O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7j4ZkRwyXw7fmRhYE9lsi9fnMe99t0IsGQ1HSh6+zso=; b=UR3qTbcatqDeZCRqQbkyb+Bn3s
	p7qwE/LDFzw0EeOoMsGKpyiJRA7U7MTz4RpVhgDOVR3pVGpIbfKjyQt0Oqk1L9rYVTNDcbm5K9pYj
	8XgzqsuWcAPlsvibxLLwRXUXyOVMAmsbEVbMv6acSZc5nOsHwfq1pdNDVZzXba7myGCwnVwxzur2W
	7BRfunrZ2sZQnFPJ98D/gkRAS5S6+6Aic+2YQxJq2Zu2OYbbmsVNeV82AaKmM9ICKWk9FDjm2NZGC
	SIUOE/LRmz43hME+Qe4zVkGhDrDXXXnsxzLbb3JgZabq6icdqv1B2TnTHl2SzZIrG0t3Eta9wLZYe
	CqAM5xDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQPb-00000009DDS-0UaY;
	Thu, 12 Nov 2026 08:44:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQNR-00000009CTD-1fFZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 08:41:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E47F147896;
	Thu, 12 Nov 2026 08:41:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472908;
	b=Kfh5sG2hjb3rydiXRatVMywSRDQocLG9KlbGYohSdZIMQIMW74GBGpjWN39KcXG8Xd0Q
	 u58LDdXOEVrB6ArL9e/JfS66imXMUVxrfTxVcNH9XdhA7vmH9EV1UCbToIUXEyEGU2y/W
	 9q+T+1a7kFSt1NllEigWW7ouOqN7Fmvjdl1ARzArTFPUysTPPEBoH/YODy3vfwOnWCxoN
	 pi9cK08sWjM288tPE0LnIc6+iTW3s3eq7HD/fxICdeTJhD1EBwZYR2fJPkXpMA2d4Z27Y
	 1QF/Gio6SnNJW+ugwlcz1SMpyQxzjBZk3zMeMz3BQb21PUvFeZXfDcK7qzo/+5vim3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472908;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7j4ZkRwyXw7fmRhYE9lsi9fnMe99t0IsGQ1HSh6+zso=;
	b=CveUSkcr2SeZx1160NxomlqsQWTCF+O/bFPNRcsDyMZK45SJ2NV2wWOSRHfeSBkkSt8d
	 bkwTIh0N4LbC5gb8ff9SFYFGur7QTu2ES060SwImG34qV1RE/yhZPyjYyaIy3lZc7tGcf
	 IzifoHHBvPtuhe8XX5XIkEPpk/yUfZbGJo3C0roeZZdMN7LEntlTDPpTLdsN4++gExRVN
	 DMwXEuSDhY7bheqraPfE3IzfxZzmYialdbJRf7hM7/i2YVFSSGygbwqe3W2jGILi8T7YV
	 WNLPFjriHyHaEBYKBnKfp8mf9ReMb8TB9jrkwE1JuEAmlveaSKn/0jAnfwzVbHhSfPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1AD51F00A0B;
	Thu, 12 Nov 2026 08:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472908;
	bh=7j4ZkRwyXw7fmRhYE9lsi9fnMe99t0IsGQ1HSh6+zso=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HNt4lR5OCdkNXd2V606MySq0Y6wAGv95tQGRUV80IVqb0slK+mJoDh0BsNjBCYdKt
	 5nI/f870NJK1QQgCt9TYKtaR1VjtTBWcUyYPGdySFrvhG/Jpbs9dd/Pll00W8HSXUF
	 pUixb33jzrB+hz3TWlnNbADABXPs7KnMIZcBqxCHW1mD+Jd1VB2+ebbYrN+QViqc2w
	 HkGFSExDi8usTB7SUWQXhYV8f9eAxuWaxT51tGfnZpkJriU8gUvOuHZD7Iil2WbMzR
	 CKZVp1cjbWcRVhfC5pcJlq92LKRrTZeFPqX98ToBNuEeaBIraG6lmwL+V4O9oJybjV
	 9gQWMCVsaOdzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3DBD9493D5;
	Thu, 12 Nov 2026 08:41:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:41:48 +0000
Subject: [PATCH net-next v2 2/2] net: stmmac: dwmac-sun8i: Enable jumbo
 frames up to MTU 2018
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472906; l=4734;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ZPiyfCZmfSnwUUZ2KWrlwC/8CYyWh0WpVDKIRZLdbyA=;
 b=0IUWEE0Wk0sl3sXsxfCbIwPqGk+0GPYaoUwZ0ZQ9e3Gu9EoHTdRH04zVOqGDJWJA31Sb3Mjw7
 2BID/ohoa4nCptmWbC2IZbGeDXOTyFq/y57Y/myP9y7JLcMJEQKQiFv
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

The sun8i EMAC advertises a maximum MTU of 3712, but no frame larger
than the standard 1518 bytes is actually received: on an H616 board
(Orange Pi Zero2, RTL8211F over RGMII) every ping above 1472 bytes with
DF set is lost, and the rx_length counter goes up for each one.

There are two independent limits:

1. EMAC_RX_CTL0 bit 29 (JUMBO_FRM_EN) is never set, so the receiver
   rejects frames longer than 1518 (1522 with a VLAN tag) bytes. The
   Allwinner BSP driver (sunxi-gmac) sets this bit unconditionally at
   init. Set it in core_init as well; core_init runs after every DMA
   soft reset, including the one done by an MTU change.

2. The EMAC has no Synopsys HW feature register, so stmmac uses normal
   descriptors in chain mode and, without enh_desc, sets max_mtu to
   SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN), which is 3712 with 4K
   pages. That value is not a hardware limit. The descriptor buffer
   size field is 11 bits wide (the same in the BSP and the QEMU model),
   so ndesc_init_rx_desc() caps each RX buffer at 2047 bytes, and
   ndesc_get_rx_status() discards any frame that needs a second
   descriptor. On TX, stmmac_xmit() only splits jumbo frames for
   enh_desc, and norm_set_tx_desc_len_on_chain() masks the length to
   11 bits, so a linear frame longer than 2047 bytes would be silently
   truncated.

Moreover, the RX DMA only fills a multiple of 4 bytes of a buffer: on
the H616, with 2047 programmed, a 2044 byte frame (FCS included) is
received in one descriptor and a 2045 byte frame already spills into a
second one. The usable size is therefore 2044 bytes, the same value as
DESC_BUF_MAX in the original sun8i-emac submission and in the U-Boot
driver.

Limit max_mtu so that a frame with two VLAN tags and the FCS fits in
2044 bytes (MTU 2018). A device tree max-frame-size can still lower it.
Longer frames from the wire span two descriptors and are dropped as a
whole by stmmac_rx(), which drains the descriptors of a split frame
since commit 834ec9530832 ("net: stmmac: drop split frames on AF_XDP
zero-copy RX").

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 0c82662fbe6e..a18d3daf6a3f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/if_vlan.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/mdio-mux.h>
@@ -219,12 +220,25 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in RX_CTL0 */
 #define EMAC_RX_RECEIVER_EN             BIT(31)
+#define EMAC_RX_JUMBO_FRM_EN		BIT(29)
 #define EMAC_RX_DO_CRC BIT(27)
 #define EMAC_RX_FLOW_CTL_EN             BIT(16)
 
 /* Used in TX_CTL0 */
 #define EMAC_TX_TRANSMITTER_EN  BIT(31)
 
+/* The buffer size field of the EMAC DMA descriptors is 11 bits wide, and
+ * the RX DMA only fills a multiple of 4 bytes of a buffer: with 2047
+ * programmed, frames longer than 2044 bytes spill into a second
+ * descriptor. The stmmac normal descriptor code used for this EMAC only
+ * handles frames that fit in a single RX descriptor and a single TX
+ * descriptor buffer. Bound the MTU so that a frame, including two VLAN
+ * tags and the FCS, always fits in 2044 bytes.
+ */
+#define EMAC_MAX_FRAME_LEN	2044
+#define EMAC_MAX_MTU		(EMAC_MAX_FRAME_LEN - ETH_HLEN - \
+				 2 * VLAN_HLEN - ETH_FCS_LEN)
+
 /* Used in EMAC_TX_FLOW_CTL */
 #define EMAC_TX_FLOW_CTL_EN             BIT(0)
 
@@ -645,6 +659,15 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
 
 	v = (8 << EMAC_BURSTLEN_SHIFT); /* burst len */
 	writel(v, ioaddr + EMAC_BASIC_CTL1);
+
+	/* Without JUMBO_FRM_EN the receiver flags every frame longer than
+	 * 1518 bytes (1522 with a VLAN tag) as a length error, so any MTU
+	 * above 1500 is unusable. Frames are still bounded by the RX
+	 * descriptor buffer size, see EMAC_MAX_MTU.
+	 */
+	v = readl(ioaddr + EMAC_RX_CTL0);
+	v |= EMAC_RX_JUMBO_FRM_EN;
+	writel(v, ioaddr + EMAC_RX_CTL0);
 }
 
 static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
@@ -1209,6 +1232,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	plat_dat->mac_setup = sun8i_dwmac_setup;
 	plat_dat->tx_fifo_size = 4096;
 	plat_dat->rx_fifo_size = 16384;
+	plat_dat->maxmtu = min(plat_dat->maxmtu, EMAC_MAX_MTU);
 
 	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
 	if (ret)

-- 
2.55.0



