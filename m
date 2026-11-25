Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73EA606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=paCrGMFK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u8Vx9Oap
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dV4BF6J45U2pVPcVBsCXGeaOfYJGsf58GzHV9B+rH6Y=; b=paCrGMFK9zOFdA6YsAqOiRv11E
	SJX6caWNuGGa+n2DWm49UpGdOheC2bb5y88BUXbYJRv+66RX4X6F4RxAQpQG5RnhQCNO/8qe0AE8B
	vhqHAlt6SInLscxx6kuRK7sj3EuzuiJp5njMvpuW/+7F8XjLbXzFdcXJVCdMJE949P0ef1s9VSSEO
	+OceW62JkE/A6K0+raf+O5MUBNQUGwDyAfPjw1bw8ZU9PohUWwukPpeqw+OhcaWf4lm/+AaFMWVXm
	LpzvcMGsx4VcgogD7/ZyGmwQJEvZmKRLdakwZJEZYY0+cIiPqLM5b1lWQlU/LM1mA67PQK9I13+aN
	j+iWSYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7gx-00000008vU5-3Hmv;
	Wed, 25 Nov 2026 07:45:23 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7gs-00000008vTl-3zDP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:45:21 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-71ad2c6491fso3367488eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795592716; x=1796197516; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dV4BF6J45U2pVPcVBsCXGeaOfYJGsf58GzHV9B+rH6Y=;
        b=u8Vx9OapJ1ub1ds0yKbj0uPSQyLdJpUyoX0M2EW8dt2HY/DuLue947++JmxkRKaNgp
         1sBT+xXe7Om5W5HxSjTksdRwCNPi0yOFSSN717zHA7TeP/6vWD6Us/DDP/0TbqJs8E98
         VXS24TcTzklvTY1d9xFIJFs/RVNhtHJ9ps21dKopOBQhT16yRqBwFIh+i9FDK06QNdtP
         WS28tie6Q3aIBmWdQCxpWVSBxJV9CVuDbf6/ThZ44dHjxWO8IQOYzZvTetTw74p8E6Ko
         jxtJw8K3Z2jb6H24sOydSepVtpx8F7TI0ncpzez4hH2CGogdogUNfVGt6JRi+XEk3/RG
         3KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592716; x=1796197516;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dV4BF6J45U2pVPcVBsCXGeaOfYJGsf58GzHV9B+rH6Y=;
        b=NrBDKawYVk9f7FOCOfgFcyw0+Msg+qy6DjuD88FKaVihevqcRr5AWcb/dj1woiXlqh
         y9LMFsjjKOw8BEVi8a3NCEbLJa2leXQeV0dlPl9RO8ePqzei5GUtk7JP5/j0e+ONJmVW
         iLe7GjfeJPt9lEKzJGZfZ4mFlQ+pxhmbxSJH4KnD94TUJY9bppBvDxqAnTaKIzGzm2TY
         c6c2L/d3eyOKc0jJYfm8HLrvvEhMs6bTHeJJ2f3m4l1QHlLuVG/FpQ1vboPTAzr0LVUx
         L+B4ZKUac1gHqB5M1SngdoG/JG5wGDyfKmyDUQJYIcagDQhxDt9u6Ub5i7jBgOKjzILE
         AM6w==
X-Forwarded-Encrypted: i=1; AL+hErGo5RvvJbHnlsht+TM43E9vXceFgQyOyyYQ1I2T9GHq/uPbBJaKahgZhyoXgAGbD6R+6oQhSiS7lS9OFsLO5RNG@lists.infradead.org
X-Gm-Message-State: APuU4Z/HmjLtG6TTm31hLAlRU7b12ViTO/4ZJpAZJ4HA8ylEbw//m0QU
	9707YeKU5vRrI6vhfWArvvK2hHMmVdsMgpJIHHX1GIndsc22glmMP1ii/0oC/fQw
X-Gm-Gg: AZFdTZfYx8YxT1eBDU3OXxvbGpG5Q8e7MPn+SUKVc1jW3U2TYhVoyIFfEjcnoKOxauM
	qtGsi/PG9LXUIwD65VxQE8N9Kq2HFjw2OQUrHsaTfgiY5aSHZzpFrv8frlypG/1f8shVE2w3nWC
	IjJHE3adqszQmdefSwi2kSaCePg5bW6Q2XLgGjuaKzkGyhmpJQEPgqJbeWXLfVa6spniKXA/rss
	aSSK875Yn5+X7coV253B4vt2TfYBfZMmHmvwOV6/Iz3iD4scSOs6WAZ1Z1KeAXHPXQ/Xi15+p6d
	w50E/BU2QQXd9eL1woCmZyL0Bvaqhz2LUBiZLrfzDw/imwdq1bozu4rZiy/Z+LbT/IMCR1Et+EE
	m++R+CABSqcjHBLD5Prdw9hs4Zz1P1r4N0XQLIiwn4H/qpekTThG7cPluwQxJTAZ1gLfYBqEnGh
	w6JWZ6N08jUcc/FCYyd8b/rXCBBj6KMY2VdgbrG3q0075F4n8bVoSPPa0MTFgmWscPY129MDKcN
	7FybeqMLT5uuFKIYTa2B6AZTcllEcSfXVozXH6x+PFVk4oFDjDViqV6mbpMiQu37q+GM9/vonhw
	g62Sh/oPuzwWsOhiexL4wd60FHOM/5AUEvr4onGsOkEhi0yYXTIDzK3vVJqM18L7sK7KFQS9dLY
	t8bfiS/AFxEcUgUyDxbU7fNwSLiYFkeRxQ/xMVdtCgVps77X7YO6ki0Al82Znfz6UDIaoeHYIwt
	CHdjEDkwr1oomJW7CEpsjqwtAKyY6ECD0VSzR7+bSWctjRCVJy7l8=
X-Received: by 2002:a4a:ec49:0:b0:703:ad5d:e673 with SMTP id 006d021491bc7-71b326d0891mr12600232eaf.30.1795592716413;
        Tue, 24 Nov 2026 23:45:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fc97bb2sm15715251fac.9.2026.11.24.23.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:45:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 Nov 2026 00:45:02 -0700
Subject: [PATCH net v3] net: stmmac: dwmac-sun8i: deliver RX checksum
 errors to the stack
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-submit-sun8i-rx-features-v1-v3-1-79273f18a028@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OwQ6CMAyGX8XsbM1WYA5PvofxMKDTGgGzTYIhv
 LsDL5xMmjR/8+f7OolAnimI024SngYO3HcpZPudqO+2uxFwk7JAiVopVUJ4Vy3HtDrD4EdwZOP
 bU4BBQamORzIZmqI0IhFenhyPK/0iOori+jsmxoPquHCX2p1D7P1n/WFQa/mnQ/lXl0ZCIQvjq
 K6srrLzrbX8PNR9u5oG3LLwPwtBAeYWC507TY3bsuZ5/gI6s22YKQEAAA==
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
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_234519_195423_68DB0357 
X-CRM114-Status: GOOD (  26.88  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The sun8i MAC drops packets with a bad IP or transport checksum before
packet sockets or the protocol stack can see them, even with RX checksum
offload disabled. This was observed with a bad UDP checksum on an
Allwinner H616 with an AC200 PHY. The same hardware bit controls
forwarding of link-layer errors and checksum failures.

Enable error forwarding and decode the sun8i RX status in software.
Give checksum failures and unchecked packets to the stack with
CHECKSUM_NONE. Continue to discard Ethernet errors, incomplete frames
and lengths that cannot fit in the receive buffer. Address filter and
VLAN indications are not checksum errors.

Have both stmmac_rx() and stmmac_rx_zc() call a per-MAC RX status
decoder. Only sun8i overrides it. For other MACs, install the descriptor
format's existing decoder after hwif_quirks runs: the DWMAC100 and
DWMAC1000 quirks select the normal or enhanced descriptor ops there.

Set EMAC_RX_DO_CRC when enabling the receiver instead of setting it in
the rx_ipc callback. As before, the checker stays on when RXCSUM is
disabled, so turning reporting back on can use the result already
recorded in queued descriptors.

Backports need commit ee0aace5f844 ("net: stmmac: Correctly handle Rx
checksum offload errors") or its equivalent in stmmac_rx(). Trees with
AF_XDP zero-copy RX also need commit fcfc52fcf89a ("net: stmmac: honour
Rx checksum errors in the AF_XDP zero-copy path") or its equivalent for
XDP_PASS. Otherwise a forwarded packet with a bad checksum can be
marked CHECKSUM_UNNECESSARY when RXCSUM is enabled.

Backports also need commit 834ec9530832 ("net: stmmac: drop split frames
on AF_XDP zero-copy RX") or equivalent handling. The sun8i decoder
returns discard_frame | rx_not_ls for a non-last descriptor. Both RX
paths must test the discard bit and drop the remaining descriptors
through the end of the frame.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Cc: stable@vger.kernel.org # see backport prerequisites above
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Explain how both RX paths select their decoder and why the default
  is installed after descriptor selection.
- Clarify that moving the checker enable preserves its behavior.
- Document the checksum-status requirements for stable backports.
- Link to v2: https://patch.msgid.link/20261122-submit-sun8i-rx-features-v1-v2-1-24a2564f6edf@gmail.com

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
base-commit: cc7fe6e741730fef549e484379281736d32746f0
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


