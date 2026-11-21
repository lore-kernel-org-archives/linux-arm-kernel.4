Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE845606A684
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 04:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SRQmeWZu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mLVVxOgO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qY1ub7c2Cr86Gjk2134FfcaG8nBCJXS7pPNCP9Kqc4I=; b=SRQmeWZuWBiv8myhQoI+KpJI/V
	X1bRMc5rknDXqKwxwg0QU1OQzTHP+u3zQvMkLImQJFl/LeTEOXtkFrb911wt7dsSVpHFeZg3jPty1
	h4QpqMN+0a4GVImZwyA+1h9bSN9HBlQtbb9GDRFqKQsvIY4fztJ5AiKgmwP/Tu7Z9FmiLVUMbVz1a
	IJFUmyPKG7wLefGnS8AFWaqFsHFUIwI7eD3wwP6nzNo/pXbChBZ5Jgqbb4CmsJpB7ZvQWbG3/6AkF
	gSsz3xFPnqQNu3HLWSlI33Gd0g0flRsyK5UmBbkO5yBoEDHT2XN91IQ+7egKh+XZebhg2hMrN243p
	ka3QdhTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUcwy-0000000GlHG-02G0;
	Sat, 21 Nov 2026 04:43:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUcwx-0000000GlH3-0MDM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 04:43:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28CB660235;
	Sat, 21 Nov 2026 04:43:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795236221;
	b=DcnpDD8O83wYnQO1NrjM3K3l/Nb8THCUEln8TR/zRxEFNC1KttO6xTR+jlC3oSDZZ5oN
	 XdaMqBRppD83gG2AVUGu+fiN+i6OnKWUNU8m8vHPNy+OQd/sDwiPY5iFU4pk43JL508D8
	 2JPXNyoWR9e3FHcK+TOyXs2f7CNdAJMAIYC4YyuSGb0wXZlZwh4gWib5wY2grARl2jOHe
	 ywi/FzrHqsOiPZWZQbEcpV7mCKxHfrR/eThtKEBkq18zOcyKC8yCxQ/GYYawYHZ8VZEY3
	 iwiKBLVB4v/Uslph7q6XXY4ZtFBA3fhdgIa9+PPY2/nsYQYfSV7B5RPLAuGE9v1RJhw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795236221;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qY1ub7c2Cr86Gjk2134FfcaG8nBCJXS7pPNCP9Kqc4I=;
	b=I73CmzviqKGLobaBM47Z+OIuBcaYpGvoXExiSwgKTQCUsNxaLNZIm8rRtmBnzxk/tdzs
	 TWANhRzg04eKt6Je5mheekju/fNJl914mDxx9yePz36fYBc6rKW0V/rqbpvkfXsaR5dgO
	 EHZFCMkV0jva6veoMZUZGiu6yJ1HKaAXO660jdhFRxUuZdbDq0hAeMMF1qw32EcxjA4nf
	 hWsWqxtOSqLUNr1kJRexZNo0jSMS9zdDi8gGXoRS9hIWvEO0cBh88U+e4lFCnKBHjZmZY
	 bDymyR4bmNVn4m6qUw+Ci2fB47Lw3qC9ikTXO/D+XGCbSk+m/529VTI1xLGxLJEvBTg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 566EE1F000C6;
	Sat, 21 Nov 2026 04:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795236221;
	bh=qY1ub7c2Cr86Gjk2134FfcaG8nBCJXS7pPNCP9Kqc4I=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=mLVVxOgOYeEKxCC+VkEc6H8AVCkDs9FazYBCCJSneEI9T5Zjjjc2/2N9VJ0DnRdon
	 r2PfqhPgKwYSFL9QsngdIpR6CbjYbyzFzHTH2xtKm9z0Kdn4jpaoFnf/3nZbNF9vEP
	 7anPkktAsh3fdqCIBzaiG1tWhWbjODeB6FATwMAJ41hA9eKtTZBWZ/2PE6s/6vlzXf
	 GJ3zNURvoBmuEReCB9VvqwaJSBvAL37KOb6J8NMDZF56/Ekel2+S40Pf5hfNL8H4U8
	 7bAReJbpAnUuL+fM6jYh4CVj9toRQ3fUomc8htHElD3hN/WOWBBOelOiI+GGeKaNdy
	 i1Hp33z7CtK0A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A8DF74BAF8;
	Sat, 21 Nov 2026 04:43:40 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 04:43:41 +0000
Subject: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCMBAAv1L27EITdbF+RXpI47ZdMVGyiRRK/
 260xxmYWUE5CStcmxUSf0TlFSuYQwN+dnFilHtlsK0lY6xBLfEiyMF5DLngU4JkJHLdkVo6dXS
 Gmr4Tj7L8tzeInKHfpZbhwT7/hrBtX+W/R0x9AAAA
X-Change-ID: 20261121-sun8i-emac-mtu-limit-66a936064965
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Russell King <rmk+kernel@armlinux.org.uk>, 
 Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795236220; l=2306;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=nONg0VC5sVpR9PeT7YPsWCSGoSka8xMNeopCkcw71rY=;
 b=DUJUge213peq89DZSTZEFm8M6OTH3hROkg8KyslR/EHROF2fN+9kaQ/gVJtPjSlgug0E9VIqK
 Q+Lvc+ZVqaUC1r3MJHA11IMqj8aJbOiLbvfs2DWW8RNLceQht0q7TVb
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

Russell King pointed out in [1] that max_mtu ignores the 11-bit buffer
size of normal descriptors. dwmac-sun8i always uses them in chain mode,
so a frame must fit one buffer, but max_mtu is SKB_MAX_HEAD() (3712 on
arm64). Sashiko asked in [2] for this to go in as a fix.

On an H616 the RX DMA fills 2044 bytes of a buffer and
ndesc_get_rx_status() drops a frame that spans two. On TX the MAC cuts
a frame after 2048 bytes (TX_FRM_LEN_CTL is clear). At MTU 2033 no UDP
datagram gets through in either direction.

Limit the MTU so that a frame with two VLAN tags and the FCS fits 2044
bytes (MTU 2018). MTU 2019-2026, which worked without VLAN tags, is now
refused.

Link: https://lore.kernel.org/r/E1vLJcL-0000000ExBL-0GFe@rmk-PC.armlinux.org.uk [1]
Link: https://lore.kernel.org/r/20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com [2]
Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Cc: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Nicolai Buchwitz <nb@tipi-net.de>
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Tested on an Orange Pi Zero2 (H616) on net/main with and without this
patch (RX fill measured on v7.3.5). Claude (AI) helped write this patch;
I reviewed and tested it.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..1f4fa722529f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/if_vlan.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/mdio-mux.h>
@@ -1208,6 +1209,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	plat_dat->mac_setup = sun8i_dwmac_setup;
 	plat_dat->tx_fifo_size = 4096;
 	plat_dat->rx_fifo_size = 16384;
+	plat_dat->maxmtu = 2044 - ETH_HLEN - 2 * VLAN_HLEN - ETH_FCS_LEN;
 
 	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
 	if (ret)

---
base-commit: d5b89d55a322b632e2b465b392a4c1d9d338db9c
change-id: 20261121-sun8i-emac-mtu-limit-66a936064965

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



