Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B7A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yl4IEDv7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ou4Irn54
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EZliaW+oDs1xtIUi0TsP7kFvnqKhuTebLNUxfpbU+eQ=; b=yl4IEDv7zLOYxSi5S+iCHGeaUT
	0lwh7P861mV3Gn2n+yx16ebV5VXq6Sa3F07fKJ60OLA6IEKDLcJP11GKXGmVrDuWe0iGlfVyOqvxx
	QpBnFyxhQ6SKl0vzUzk1DE1Du47FsyBAM3uRJvteaJv2K3CGivz6TreUmHg8rGN3CJU9qxZzaQoO+
	83UA2EnDUEIDlu115FMggWNysHKiPB1B9ODjN5By/76LCmpS4Axm1k1CEOgvyghRom5IEmt8Fzk+I
	03Jq/wxfzFnnOZszKrGswLkJXgUHBiCcjjK2us6Qn95LqZpVLsikn4KmkRt3rQoKa9l9YRgHaJbTE
	673Qp98g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWE7-0000000Cf6S-06wv;
	Thu, 26 Nov 2026 09:57:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWE4-0000000Cf5G-2twB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:57:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E21262409;
	Thu, 26 Nov 2026 09:57:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795687031;
	b=U3dZA1oL/u6o8khUUWP/ZxjUMpRxPuM+QlKFdxwDi/rCUF2h9YXYUWM0DcAUj3HQSKM3
	 7EgECv9KDmDh9Cw1XX+BH90Mz7tDbi3rA4qvFh8fVa69QNWxUNrqIxLFlcIxmp9FrJj0i
	 rgdJcbaa9mwYDSvEpi4qBYPPXRswBePUMRYOeUEMh44p0EaDku2XfRlCakKQBtZGtYWc1
	 pAav+XSqIXoHIww6ILqZGVR2eQPuoztUdY62LblvzZY0g1QVn2zj30qGV9FlNl392z/kY
	 z97yWYBqIlMv8iXJh+7WdHmdAFel7znRRyw84TS7jJeLYW9zgXXU8RvFzaWO7ccQNQg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795687031;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EZliaW+oDs1xtIUi0TsP7kFvnqKhuTebLNUxfpbU+eQ=;
	b=FWo/YF1UvgTdQzz952xxgdN4GSNFpFvtlus3/DfrC+un7eTgIO3g9g/HRx1vBby4C5QC
	 bvFcReF5NHunSvHm6ls0UIhILltI3k6rWiMKzh2rTZhgEe9u8kzVKiqTRz0XblQL4pQLM
	 ilzJ4/k6l/oadk+1XukEgvsX6eIXAi/7xb8/zvRMxb/tr4GEY/6+9/OoV4p2DM8B/0Iqm
	 QsO6ZAUDBelgvglRkgwtU3DWPGh1SB9LnUt4eLHeHywLwLLg3lkJxfxBIOaX0xw/k+mbn
	 958YO69cgsfMCBlex30OPZ9IRSZs1QwF/l9LWaZU5oOw39Q2J9UvOTQ+T63IXt7Zbfw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E68EA1F00A00;
	Thu, 26 Nov 2026 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687031;
	bh=EZliaW+oDs1xtIUi0TsP7kFvnqKhuTebLNUxfpbU+eQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ou4Irn54xoKfAb8muY1KTSWGTSUD4kSa4zOJEXYmIB2OU7JEPkR5Co9ek/5xW85C0
	 Jq1M1FE5+nUXU/C0F50wDFr5r5AQnrtgxdwKUlMRgGqMje4LdJ6yMPtPLf+Uhm/37P
	 sGEwObMcph/66tm9vG/hklhaBWucOWUpk9l7xtsOO9OpabXADMniTTTlOOto2QB0hU
	 0Jpqj8HgOc3MSag11GRsqSE45qZafWPOb1ONKkLCqxEyhDovkKDKQX6vioU2hj6UQA
	 OEdMyqiAWNokkpUeSkLpwhJn3fx81Wd/YNnoL8+ihTJNs+GKsDQxne5neFZPC8p3/9
	 PvurPcmx6o+zw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 51EC84D378;
	Thu, 26 Nov 2026 09:56:52 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:56:52 +0000
Subject: [PATCH net] net: stmmac: dwmac-sun8i: Drop received MAC control
 frames
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-sun8i-emac-ctl-frames-v1-1-e90ac94bc8c7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMzQrCMBAGX6Xs2YX8QGl9FfEQ16+6YqNkUxFK3
 92oxxmYWclQFEb7bqWCl5o+cgO/60iuKV/Aem5MwYXe+xDYljwoY07CUu88lTTD2A+9uAgX4zh
 Sa58Fk75/3wNlVDr+pS2nG6R+j7RtHx4Uktp+AAAA
X-Change-ID: 20261122-sun8i-emac-ctl-frames-186c03e03399
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
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795687012; l=1712;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Df1pc3deUNfFedjsrZXgOgDGpSA2ac6nDP3eQt7sHjQ=;
 b=q1CFqPkAPrZs2g4vYOtNI7W132Z93BqBt+PMmQcYJrCbvoGMx1oQRQ56FW2IJjE/AxxRTsLpF
 cGg2wV7DhB8CGRTgggaEvZwlps5LJbUI6CBLya36IvQZsO+UGB2dDE4
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

sun8i_dwmac_set_filter() sets CTL_FRM_FILTER to "receive all control
frames", so every PAUSE frame reaches the stack and is counted in
rx_dropped. Leave it at 0, "drop", as the Allwinner BSP does; the MAC
still obeys PAUSE.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Tested on an Orange Pi Zero2 (H616), net/main, MAC loopback: TX still
waits 32.6 ms per PAUSE; rx_dropped per 20 PAUSE frames 20 -> 0.
Claude (AI) helped find the cause and write the patch; I reviewed and
tested it.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..f669bf22b7dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -192,7 +192,6 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in EMAC_RX_FRM_FLT */
 #define EMAC_FRM_FLT_RXALL              BIT(0)
-#define EMAC_FRM_FLT_CTL                BIT(13)
 #define EMAC_FRM_FLT_MULTICAST          BIT(16)
 
 /* Used in RX_CTL1*/
@@ -720,7 +719,7 @@ static void sun8i_dwmac_set_filter(struct mac_device_info *hw,
 	struct netdev_hw_addr *ha;
 	int macaddrs = netdev_uc_count(dev) + netdev_mc_count(dev) + 1;
 
-	v = EMAC_FRM_FLT_CTL;
+	v = 0;
 
 	if (dev->flags & IFF_PROMISC) {
 		v = EMAC_FRM_FLT_RXALL;

---
base-commit: e509726660dd06ce107437aecf7c106c9d3fc1e7
change-id: 20261122-sun8i-emac-ctl-frames-186c03e03399

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



