Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD8606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IeEvF2Zo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3+oPSaz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BhkuuSJ1mFlPM3aPIeXwkot+O32f94nPrMa9UyizXDk=; b=IeEvF2Zox69BecMX1+oJBBARQO
	+HRgCss47fAloK+rOxh+B9b9t0G3dvQivuUsm6AcJZWL7a/su3iq/U6qN/16iaANp1o8GOWFDAIqw
	7mIGkx5k7KSUDSaiYlOKnFhnj/5MqBrGYKPuxXCQEzNDIX5gaJtGHT0Nn4pqwJ70BD0odnVf2s+iu
	bStCSE+eio3WT8cP7ft+agKP4f0h2utPwRjLHRJ1Ek2cJrOSV2e1XvXvRrs4Vrm84CRi/4rQFrQPJ
	AdX1pdfTD8n98os8jbRJL5Sq7Q9R+3qqkhBcnJkyFNo1QEsF/V+Ms2lAIaoJj58Tne3pXRr3r/6Jn
	Rq6jg5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV23i-00000000pFP-1KO1;
	Sun, 22 Nov 2026 07:32:22 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV23e-00000000pF1-3ZqT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 07:32:20 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-4ad89c49e0dso699560fac.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 23:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795332737; x=1795937537; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BhkuuSJ1mFlPM3aPIeXwkot+O32f94nPrMa9UyizXDk=;
        b=I3+oPSaz9zFg2+liCUdyrh+XF66cpdq1VeBHtqZRi1Ow33VgkYfDZ/zqhsqJPs8vLD
         mch7x6asdPnUCmDlOhaH18kHKPq1MfCxurMmqfLe0hnOD/6+pSJ7SxaR+bpPLBlqowGo
         SHDfn530G7zlUE/A2WsB3pDARGxJQqenmKGoT14otOZFdLd1E9C18t/YxHnS9BQVo+ta
         3AfQNpCoWjtpSF12csdhlG/ne9W40qSaIIgJm68OlrF3CKfnfmpHclCGL3nmfskSr5S0
         BTct5mOaS4iP03Mbn46LYmRT8U02v+PuAFkRFjqFe6V/ME+euWP4MFmC8FQcWihjieBx
         Opzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795332737; x=1795937537;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BhkuuSJ1mFlPM3aPIeXwkot+O32f94nPrMa9UyizXDk=;
        b=qXOLEYc1G1DUZXoTnJ97IVjN6yOsus8yKbn5FaSj6eM8sW0x2aeOIiztDAmgyWK3x1
         Mx7a4OTbCmyLypdOjvT301A0pZ4n7ZDhChHlcVt1Md4tE/LpjBsXvU77lI6W3+HgqY/Z
         GdGzwia9/5kGZnpq2aoQuWojclhXgs9fTEfm24S1SfSVSumCWw5xhRjCF7pzi6Ikwmoh
         SNDw7xivJx8a0B7yfJ3EX+wbs8lvZaIyR68IN4/rK6truKGAO/ttwShoAK5KpXcidPJE
         /UxUM8JLwjO8CHGT1wb72rWvoIXoKcU1laDMu6t/deF/Js/18Y+cGSFY6suUotFMliuH
         ymhw==
X-Forwarded-Encrypted: i=1; AL+hErFpgx4XDidu6eGX+ArEbfiykkwQAan6P9uauS56CV0xyNz1QO8wwkew44TyH6AASpvbc6yXshg/nNz7erPPQtLw@lists.infradead.org
X-Gm-Message-State: APuU4Z8jPSXQR6wQpdkcl/n904B/nzrT6zTbB0FYdDk9vqeR+tCCPctx
	+GmJF9qKzXo/6lOXyEXtsraIFqXi0LCNhLWU2CeYCh6RJ0xZrJfFe1Wn
X-Gm-Gg: AZFdTZf3AbaL8M73Uc7ljIqbpicKX8OfMURLAF94FwXmy0irsQPeKILpKgZgUEEp1F6
	ho0oxQKi6x7T36GBEvQasTOkm6k7wstMp2y7gTNG6XRjmudgmFX4bLQVoIOOVFlFmZ3m6aXtpNT
	2M7uFSENs6dq5uazmuQ4XGG1QnxXeTtClaOoiFkvuG3NtFCco9QEQHvgOaeENrIVz0y7vLZs3TA
	ONTDQSgRhWbytGW0eGgiH7LJS/vHFEPvxJYFL03Uzuu6Zb67Zoy7EwgmhC5YRAYVcxigmV2Xql4
	kMgsQXMY63Fpud4dXZ44GoM5n1OsR/Bt2xjcszCp+YpOoEFTxJbqhHOVZVdyw/3avNrPRx8NuKg
	/mSFGriJxs0p07Wxq4Mb3akX7Jo7aiBVcFCJop85u/9Dp3bguWjLw++RvHhWdx3pnGtCuuTWhEW
	K3RmeB061yYVsUEqREABL9Lux5L3U6pO0VXcn4F6ZjgrK3isUBzLxZ2ITQHFv11CvF3+kGHXFtb
	nhAc7S9f4OH1PrA+mwYrPkNwNpBwoFqqCdBicG8nl5NWxCRBrjw+KBB+foqZEU1MpZsrYj75CcX
	m7gR8ndNRfeOAsNfCqb03rWWXTs0zuVDSQWZteaV7OPVqdw+xiWq7Encxsw7n/kAWUiPLwJbhjK
	KkhG16HoKTSB9kCr0ElF60KeW63k3LWSThIK3ENRhZ+4C84MszGV3gCeutmcLuN6u/ex9/QKX3S
	VimcWIAbftLiD0wfw1OgtVWmxtcGwmdYYCMzjP09eKWz4GfU/5VHE38Szdl5mmt0K9yc/filDM
X-Received: by 2002:a05:6870:7012:b0:4bb:17cd:b97f with SMTP id 586e51a60fabf-4bc82e85cf5mr7584367fac.25.1795332735917;
        Sat, 21 Nov 2026 23:32:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm7292724fac.16.2026.11.21.23.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:32:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 00:32:07 -0700
Subject: [PATCH net v2] net: stmmac: dwmac-sun8i: deliver RX checksum
 errors to the stack
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-submit-sun8i-rx-features-v1-v2-1-24a2564f6edf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OwQqDMBBEf0X23JQkosae+h/FQ0xX3VKTkkSxi
 P/eqPfCwDLL8GZWCOgJA9yyFTzOFMjZZOQlAzNo2yOjZ/IguSyFEDULUztSTMcqYn5hHeo4eQx
 sFqwWVYUql6qoFSTCx2NHy0F/gMUIzflMjBeauHP32EAhOv89NsziCJ91kv+tS+Ks4IXq0LS6b
 PN7P2p6X40bodm27Qc1ZnaA3QAAAA==
X-Change-ID: 20261119-submit-sun8i-rx-features-v1-9177e8328598
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_233218_923741_90252BBC 
X-CRM114-Status: GOOD (  23.48  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The sun8i MAC drops packets with a bad IP or transport checksum before
packet sockets or the protocol stack can see them, even with RX checksum
offload disabled. Its error-forwarding bit controls Ethernet and IP
errors together.

This was observed while testing an Allwinner H616 with an AC200 PHY:
the MAC dropped packets with a bad UDP checksum even with RX checksum
offload disabled.

Enable error forwarding and decode the sun8i RX status in both receive
paths. Give checksum failures and unchecked packets to the stack with
CHECKSUM_NONE. Continue to discard Ethernet errors, incomplete frames
and lengths that cannot fit in the receive buffer. Address filter and
VLAN indications are not checksum errors.

Keep the hardware checker running whenever the receiver is enabled.
Turning RX checksum reporting back on can then use the result already
recorded in queued descriptors without flushing the ring.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Submit the checksum-delivery fix alone for net, following Maxime's
  review. The RXALL feature will be submitted separately for net-next.
- Link to v1: https://patch.msgid.link/20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 98 ++++++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  7 +-
 4 files changed, 94 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index a972bee66504..706feb7bcbed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -615,6 +615,8 @@ struct mii_regs {
 struct mac_device_info {
 	const struct stmmac_ops *mac;
 	const struct stmmac_desc_ops *desc;
+	/* Defaults to the descriptor format's decoder unless the MAC overrides it. */
+	int (*rx_status)(struct stmmac_extra_stats *x, struct dma_desc *p);
 	const struct stmmac_dma_ops *dma;
 	const struct stmmac_mode_ops *mode;
 	const struct stmmac_hwtimestamp *ptp;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..0ad2203f76c3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 Corentin Labbe <clabbe.montjoie@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -197,6 +198,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in RX_CTL1*/
 #define EMAC_RX_MD              BIT(1)
+#define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0
 #define EMAC_RX_TH_64		(0x1 << 4)
@@ -644,6 +646,9 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
 
 	v = (8 << EMAC_BURSTLEN_SHIFT); /* burst len */
 	writel(v, ioaddr + EMAC_BASIC_CTL1);
+
+	/* Forward checksum failures to software before starting RX. */
+	writel(EMAC_RX_ERR_FRM, ioaddr + EMAC_RX_CTL1);
 }
 
 static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
@@ -654,7 +659,7 @@ static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
 	r = readl(ioaddr + EMAC_RX_CTL0);
 	if (enable) {
 		t |= EMAC_TX_TRANSMITTER_EN;
-		r |= EMAC_RX_RECEIVER_EN;
+		r |= EMAC_RX_RECEIVER_EN | EMAC_RX_DO_CRC;
 	} else {
 		t &= ~EMAC_TX_TRANSMITTER_EN;
 		r &= ~EMAC_RX_RECEIVER_EN;
@@ -698,16 +703,9 @@ static void sun8i_dwmac_get_umac_addr(struct mac_device_info *hw,
 			    EMAC_MACADDR_LO(reg_n));
 }
 
-/* caution this function must return non 0 to work */
-static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
+static int sun8i_dwmac_rx_ipc(struct mac_device_info *hw)
 {
-	void __iomem *ioaddr = hw->pcsr;
-	u32 v;
-
-	v = readl(ioaddr + EMAC_RX_CTL0);
-	v |= EMAC_RX_DO_CRC;
-	writel(v, ioaddr + EMAC_RX_CTL0);
-
+	/* The receiver always records the checksum result, even with RXCSUM off. */
 	return 1;
 }
 
@@ -1053,7 +1051,7 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.core_init = sun8i_dwmac_core_init,
 	.set_mac = sun8i_dwmac_set_mac,
 	.dump_regs = sun8i_dwmac_dump_mac_regs,
-	.rx_ipc = sun8i_dwmac_rx_ipc_enable,
+	.rx_ipc = sun8i_dwmac_rx_ipc,
 	.set_filter = sun8i_dwmac_set_filter,
 	.flow_ctrl = sun8i_dwmac_flow_ctrl,
 	.set_umac_addr = sun8i_dwmac_set_umac_addr,
@@ -1061,6 +1059,83 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.set_mac_loopback = sun8i_dwmac_set_mac_loopback,
 };
 
+static void sun8i_dwmac_rx_error_stats(struct stmmac_extra_stats *x, u32 status)
+{
+	if (status & RDES0_DESCRIPTOR_ERROR)
+		x->rx_desc++;
+	if (status & RDES0_OVERFLOW_ERROR)
+		x->overflow_error++;
+	if (status & RDES0_RECEIVE_WATCHDOG)
+		x->rx_watchdog++;
+	if (status & RDES0_SA_FILTER_FAIL)
+		x->sa_filter_fail++;
+	if ((status & RDES0_FRAME_TYPE) && (status & RDES0_IPC_CSUM_ERROR))
+		x->ipc_csum_error++;
+	if (status & RDES0_COLLISION)
+		x->rx_collision++;
+	if (status & RDES0_CRC_ERROR)
+		x->rx_crc_errors++;
+	if (status & RDES0_MII_ERROR)
+		x->rx_mii++;
+	if (status & RDES0_LENGTH_ERROR)
+		x->rx_length++;
+}
+
+static int sun8i_dwmac_rx_status(struct stmmac_extra_stats *x, struct dma_desc *p)
+{
+	const u32 csum_mask = RDES0_IPC_CSUM_ERROR | RDES0_PAYLOAD_CSUM_ERR;
+	const u32 dma_errors = RDES0_DESCRIPTOR_ERROR | RDES0_OVERFLOW_ERROR;
+	const u32 wire_errors = RDES0_CRC_ERROR | RDES0_MII_ERROR |
+				RDES0_RECEIVE_WATCHDOG | RDES0_COLLISION |
+				RDES0_LENGTH_ERROR;
+	u32 status = le32_to_cpu(READ_ONCE(p->des0));
+	u32 len = FIELD_GET(RDES0_FRAME_LEN_MASK, status);
+	bool runt = len < ETH_ZLEN + ETH_FCS_LEN;
+
+	if (unlikely(status & RDES0_OWN))
+		return dma_own;
+	if (unlikely(!(status & RDES0_LAST_DESCRIPTOR)))
+		return discard_frame | rx_not_ls;
+	if (unlikely(!(status & RDES0_FIRST_DESCRIPTOR))) {
+		x->rx_length++;
+		return discard_frame;
+	}
+
+#ifdef STMMAC_VLAN_TAG_USED
+	if (status & RDES0_VLAN_TAG)
+		x->vlan_tag++;
+#endif
+	if (unlikely(status & RDES0_DRIBBLING))
+		x->dribbling_bit++;
+	if (unlikely(status & (RDES0_ERROR_SUMMARY | wire_errors | dma_errors))) {
+		sun8i_dwmac_rx_error_stats(x, status);
+		if (status & dma_errors)
+			return discard_frame;
+		/* An unexplained error summary is not a checksum verdict. */
+		if (!(status & wire_errors) &&
+		    (!(status & RDES0_FRAME_TYPE) || !(status & csum_mask)))
+			return discard_frame;
+	}
+
+	/* One buffer per chain descriptor; the reported length includes FCS. */
+	if (unlikely(len < ETH_HLEN + ETH_FCS_LEN ||
+		     len > FIELD_GET(RDES1_BUFFER1_SIZE_MASK, le32_to_cpu(p->des1)))) {
+		x->rx_desc++;
+		return discard_frame;
+	}
+	if (unlikely(runt || (status & wire_errors))) {
+		if (runt && !(status & RDES0_LENGTH_ERROR))
+			x->rx_length++;
+		return discard_frame;
+	}
+
+	/* Only a checked IP frame is eligible for CHECKSUM_UNNECESSARY. */
+	if (!(status & RDES0_FRAME_TYPE) || (status & (csum_mask | RDES0_DRIBBLING)))
+		return csum_none;
+
+	return good_frame;
+}
+
 static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 {
 	struct stmmac_priv *priv = ppriv;
@@ -1068,6 +1143,7 @@ static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 	mac->pcsr = priv->ioaddr;
 	mac->mac = &sun8i_dwmac_ops;
 	mac->dma = &sun8i_dwmac_dma_ops;
+	mac->rx_status = sun8i_dwmac_rx_status;
 
 	priv->dev->priv_flags |= IFF_UNICAST_FLT;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8ae95e91a36a..047d809b8b88 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -125,8 +125,6 @@ struct stmmac_desc_ops {
 	stmmac_do_void_callback(__priv, desc, set_rx_owner, __args)
 #define stmmac_get_rx_frame_len(__priv, __args...) \
 	stmmac_do_callback(__priv, desc, get_rx_frame_len, __args)
-#define stmmac_rx_status(__priv, __args...) \
-	stmmac_do_callback(__priv, desc, rx_status, __args)
 #define stmmac_rx_extended_status(__priv, __args...) \
 	stmmac_do_callback(__priv, desc, rx_extended_status, __args)
 #define stmmac_enable_tx_timestamp(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a685ce4638f6..20e9aa7b14f5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5723,7 +5723,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		/* read the status of the incoming frame */
-		status = stmmac_rx_status(priv, &priv->xstats, p);
+		status = priv->hw->rx_status(&priv->xstats, p);
 		/* check if managed by the DMA otherwise go ahead */
 		if (unlikely(status & dma_own))
 			break;
@@ -5926,7 +5926,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		/* read the status of the incoming frame */
-		status = stmmac_rx_status(priv, &priv->xstats, p);
+		status = priv->hw->rx_status(&priv->xstats, p);
 		/* check if managed by the DMA otherwise go ahead */
 		if (unlikely(status & dma_own))
 			break;
@@ -7732,6 +7732,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 			return ret;
 	}
 
+	if (!priv->hw->rx_status)
+		priv->hw->rx_status = priv->hw->desc->rx_status;
+
 	/* Set alternate descriptor size (which tells the hardware that
 	 * descriptors are 8 32-bit words) when using extended descriptors
 	 * with ring mode. Only applicable for pre-v4.0 cores. Platform glue

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


