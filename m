Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892FA60A2615
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y44vV1x2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IKUYBBqk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O0xQaZTBn5x9UU+rls3WdA5nUV1n54cLSo+TPMIvcKk=; b=y44vV1x2xCfb+lCnpIab81IITJ
	mKXZ/8Dr9m8exBI88roLg0vsMZYUqNDtXkW98+bvakWT3lQtLTu9ly8jdZPyRnG9uAuig/jAbU8E1
	nOSh+AfUiJ8hY48Gu7ZmrJkZvc0d/DOl320DMWKLLbuvroXb1S3PTgj18xQ7Dhg0q3XJ6Q6D5bxCU
	GTB50GJ8b4nNnSqffixwDbLqOvX7SobGa5C85h7SB2CK5W8RjWLiR3rdhi7ROHXAsqQszf984wOgN
	rioEJfSD6ug2O2a+h9GjZd7Td2DwDqzrNUCESbR86+oIGAl9pv8+iIvMn6hYXqpr03Tt4wFTbFI6Y
	CjsIWJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM84-0000000Eda3-3WLF;
	Fri, 20 Nov 2026 10:46:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM7m-0000000EdUu-3a4u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:45:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E02D861165;
	Fri, 20 Nov 2026 10:45:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795171545;
	b=rPMtcY18mSyXe0HpIsitZdoYEcgoh8eXV41ZB5XJFc2HPiVGZYmcc1/NBt3APgHLNTT+
	 pam1S/O6gXqJb6ljZDcYmg5y+pRjM1DdakGN9m4ZP4VNd2PHMiAg7OU9ACgBPSbBwtdVE
	 C2GPRf8XhQgCd9/U/MRy++wxQw4+oSc07ret75dXZVqi0t7ouzBKmkttCyBFk2AV//9bs
	 P3ktIGDB1CAk1COAtbwqY5F8S0yYGXVtaoS9km0EKtDDoV5iESbdxsAiG9XWKreYI6mMy
	 1xbmKnhgc09UJG9ksicEo1KN7z7BtE2ACKjD0jwO17MVaRkFemzY14u2JJvcI1a+Xww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795171545;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O0xQaZTBn5x9UU+rls3WdA5nUV1n54cLSo+TPMIvcKk=;
	b=tKVVu6ZCRihYIaHpZjTQoCg/6G27muz6GrHDyeL6g9kjP1gbqQuHuWjU4uzsUbBgi0/v
	 clQuY0UtxXSlICdGmYUxn6xF+yF5W3AW21H7h+wfiJZ9D+3r2EtNcihCJlQqECriK8nGg
	 afjxfxQ5QM3fl9GLaTkqqFCTSPyPEcdm/jmSCti2HdIo8PH1005EuszhjYxKzrZWQoQ3o
	 FNCrbhLjxyM5mx7YLpHWDIQnQGGhFFFl4DZ++ZlSVm40rJpk5QdT8zEBbqiA2qOkQBBra
	 6znPzte6xCjNiHm0QC+ZZ1kGkEede1NOqz+7FMht0JQzU3vSLhDNLy/BJj9ywBp9bHw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C3871F000EE;
	Fri, 20 Nov 2026 10:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795171545;
	bh=O0xQaZTBn5x9UU+rls3WdA5nUV1n54cLSo+TPMIvcKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IKUYBBqkWM4I2Lf88NFBF+eLoS9fWtvSD27t3gyvKtTtAIAKXeq+eYgECep8rHlMl
	 7dVPuxEVlLCXIIeqBMzlFxZo1m+X8LZGCDSm7T8LTOuhj308lz9RlNYFol1eb9HMo6
	 40nfSBaMhgJbJ+laXkCc9Pgfmbx/Bm9d7Bob8jgJArpML8U25msqfxYkVshCIRbdYK
	 HNrCOdedGdpUpB+CbeDPnELnW2iNQ1uLX8w5KbBsPBNOCUH+YAq9YMgGT8KBCZaxYW
	 yP8ARp9jokfSYDtjUGOV/31/nmnQINTIuWm6zB3TjqbFrxpJfCAjw0ZEbJud2pItGT
	 nq6AMOBL0pWEA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ED04449814;
	Fri, 20 Nov 2026 10:45:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 10:45:35 +0000
Subject: [PATCH net-next v4 4/5] net: stmmac: Add MDIO init and exit
 platform hooks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-sun8i-emac-mux-uaf-v4-4-57eba8915f25@gmail.com>
References: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795171532; l=2066;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=3XSU4X4aemzp7oTaCLwDDP9zhzsIxn55nP09waG9ngE=;
 b=LAtqp2wEi3+1K9NUmpn6EgBjdbn9DkZFOCCTWv250cgGR3fC6cRaOLC/yMKVP6uIAW+4BPgFo
 8qkvxVjpZ4lCBbp8exE+nbsmnWOLKQdmVq7q1qFk+fn2eJ0Rz9DoxEC
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

A glue driver that adds devices on top of the stmmac MDIO bus, such as
an MDIO mux, can only do so after stmmac_dvr_probe() has registered the
netdev.

Add mdio_init(), called once the bus is registered, and mdio_exit(),
called before it is unregistered.

Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 11 +++++++++++
 include/linux/stmmac.h                            |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 7396b68899c6..fb1f7b1a5323 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -682,8 +682,16 @@ int stmmac_mdio_register(struct net_device *ndev)
 bus_register_done:
 	priv->mii = new_bus;
 
+	if (priv->plat->mdio_init) {
+		err = priv->plat->mdio_init(priv);
+		if (err)
+			goto mdio_init_fail;
+	}
+
 	return 0;
 
+mdio_init_fail:
+	priv->mii = NULL;
 no_phy_found:
 	mdiobus_unregister(new_bus);
 bus_register_fail:
@@ -703,6 +711,9 @@ int stmmac_mdio_unregister(struct net_device *ndev)
 	if (!priv->mii)
 		return 0;
 
+	if (priv->plat->mdio_exit)
+		priv->plat->mdio_exit(priv);
+
 	mdiobus_unregister(priv->mii);
 	priv->mii->priv = NULL;
 	mdiobus_free(priv->mii);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 00be2df63d22..e94f9cab973d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -296,6 +296,8 @@ struct plat_stmmacenet_data {
 	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
 			   void *ctx);
 	void (*dump_debug_regs)(void *priv);
+	int (*mdio_init)(struct stmmac_priv *priv);
+	void (*mdio_exit)(struct stmmac_priv *priv);
 	int (*pcs_init)(struct stmmac_priv *priv);
 	void (*pcs_exit)(struct stmmac_priv *priv);
 	struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,

-- 
2.55.0



