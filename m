Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA1760A2610
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K26Svc0+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WDbv4siK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4cMBRj+b901aGtJUyANY3Td7kRUuNaUX44ZRB5XZFG0=; b=K26Svc0+TrgYmrUt3gvhJoIqbV
	rP84c6nbtwuZbaxYwCiY5s3kEGO4oJyXtvvkXJDYo5bjyb0XYb7g+8dxMhgmJlwu9bdzKbbrZZ6Vm
	gqkcrdd445XntHdsNoTNR+lVS/6RZHcKrO+lsIdGTkzLBcqZcA+rkOxH/Je5r7QGjNGoZRI4CE/1a
	lqdD9Dye+3fx4B+N501HvgLvpN2o8D3HB7Nm2R4VOSx2BYTh/XZgVB/a7WeS8MoCKNS8c7usQ6XXD
	F44oa/xFdNLnVMtt1+GsLDYrchFfiKQlwJBLK621h3DlR+BxH/0ejqafJrmZv0FmbtxdE54Gt06hn
	RoBo8e9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM84-0000000EdaD-3zuT;
	Fri, 20 Nov 2026 10:46:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM7u-0000000EdYH-32Q3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:45:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3095D60D56;
	Fri, 20 Nov 2026 10:45:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795171553;
	b=tfpiM/k0fu05qSAftCunN6pzkoYzJdNZioeRdhUlZwmcfOg1UVjbwoCJNwJY9T9gdGUh
	 W5b+NDHbeyBe9QHbcsYaETCC7a6fK028wbRiljRJwI2lIEkum6gEgeS5/jcdXXlJonQjg
	 GanzGOx1OPYtqEVj5Y9kzeGheBiChH34A6eUZqm/7KpG6ra72sKBoYSfY11+JPMjarFMq
	 iUCpbdQZHO6CdysgA7S6XTUp4tf4TuA4P7ywQp1Yno9u3B3ZK1sb2rvRvq9sfaAR5mdwu
	 efBvJjoGkRWIGSDySAi5bvrLL73JE7ov+8mTwPfWgj3KXQl53CEAuh9x3VzgyejyC1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795171553;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4cMBRj+b901aGtJUyANY3Td7kRUuNaUX44ZRB5XZFG0=;
	b=Sp43DaJxgh3qiBmYWNAkjmrSUCifQ6Cv4S/KZXPfoUr7twjOE7oHNBhfPQwRdoKD+gb/
	 pMNT1Psw/i8Gmm2hYZdaSWQJfwe6AatGvAheLfvLp/CMhxFYATJuZxLQJHXxP9y323EJS
	 gLBPkIP+9rF58UNVsIU9J5Is3qyqFzkGMX7LAMde1AKSJi3dWw6jAHNeHyJHHeGgIkuzI
	 pmPhyeo+tjkX4rbmJbKjMIPvvc05kP0J5ybbuqiGlnGa9E5q7F3NGWm70Wy0UyP/4STPr
	 GLUung5SxaNGKSP4omij1Y4UXWpZYJH07XffELL57npzar3yFyp+STxzZybvy1Mw/Xg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D1E21F000EF;
	Fri, 20 Nov 2026 10:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795171553;
	bh=4cMBRj+b901aGtJUyANY3Td7kRUuNaUX44ZRB5XZFG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WDbv4siK9lct6BeRQftTXZ43dIPMqgdqFV2tKcPIceG+/T5DkFlTQKF843RhUizsQ
	 4E4NE8Xjg1ERMz7ZxP9U1uSqV7g+RdAHBKrxc97uGd3tbGld9a//KFesiYNMv0wSv7
	 typ/o6jTfsENf5R2c6mStlXAZg1yDDDxOP7pZPkH6uS9pTDqw91Wiotc2fLVIIFWY3
	 TWreJy9BgadNjbDnhu8h1ip1bPkuVxwDRhP9PmiD+9CA/mGJHdt9v8B8IZMbVNTWPg
	 AAgykz987e0FCKSGrq8SaQbaaH+85qmw9XRtMssp0I1s/OdOVjaGz2IYU03IXBCyhk
	 w2ANIZ8j6pBeA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 12CE649818;
	Fri, 20 Nov 2026 10:45:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 10:45:36 +0000
Subject: [PATCH net-next v4 5/5] net: stmmac: dwmac-sun8i: Register the
 MDIO mux in the MDIO setup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-sun8i-emac-mux-uaf-v4-5-57eba8915f25@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795171532; l=3350;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=JfM+9MPeN1RmnCdgarPUkycnEJJWmRjCl52LkmzQh0s=;
 b=aTjlE4zwV3WTHytPRv86NIs+k/GjHC4xnrCKN6relL0LScb4VxAra3i8RkcT/XDCZkwYWaorK
 amiU4eEBE3FAcssbf+FD4c8tvmq1iKPfqAo3+xouKrDK4C5aTKdfw0u
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

Both PHYs sit behind the mux, but the mux is registered only after
stmmac_pltfr_probe() has registered the netdev, so an early open does
not find the PHY. On remove, the mux goes away before
unregister_netdev(), and unbinding with the link up oopses in
phy_stop().

Register and unregister the mux through the new mdio_init() and
mdio_exit() hooks.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 41 ++++++-----------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 4acfda235394..0ec25ae0b77e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -17,7 +17,6 @@
 #include <linux/of_platform.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <linux/stmmac.h>
@@ -941,6 +940,13 @@ static int sun8i_dwmac_register_mdio_mux(struct stmmac_priv *priv)
 	return ret;
 }
 
+static void sun8i_dwmac_unregister_mdio_mux(struct stmmac_priv *priv)
+{
+	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
+
+	mdio_mux_uninit(gmac->mux_handle);
+}
+
 static int sun8i_dwmac_set_syscon(struct device *dev,
 				  struct plat_stmmacenet_data *plat)
 {
@@ -1133,8 +1139,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	struct stmmac_resources stmmac_res;
 	struct sunxi_priv_data *gmac;
 	struct device *dev = &pdev->dev;
-	struct stmmac_priv *priv;
-	struct net_device *ndev;
 	struct regmap *regmap;
 	int ret;
 
@@ -1217,6 +1221,9 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 		ret = get_ephy_nodes(dev, gmac);
 		if (ret)
 			return ret;
+
+		plat_dat->mdio_init = sun8i_dwmac_register_mdio_mux;
+		plat_dat->mdio_exit = sun8i_dwmac_unregister_mdio_mux;
 	}
 
 	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
@@ -1227,33 +1234,8 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		goto dwmac_syscon;
 
-	ndev = dev_get_drvdata(&pdev->dev);
-	priv = netdev_priv(ndev);
-
-	/* the MAC is runtime suspended after stmmac_dvr_probe(), so we
-	 * need to ensure the MAC resume back before other operations such
-	 * as reset.
-	 */
-	pm_runtime_get_sync(&pdev->dev);
-
-	/* The mux must be registered after parent MDIO
-	 * so after stmmac_dvr_probe()
-	 */
-	if (gmac->variant->soc_has_internal_phy) {
-		ret = sun8i_dwmac_register_mdio_mux(priv);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to register mux\n");
-			goto dwmac_remove;
-		}
-	}
-
-	pm_runtime_put(&pdev->dev);
-
 	return 0;
 
-dwmac_remove:
-	pm_runtime_put_noidle(&pdev->dev);
-	stmmac_pltfr_remove(pdev);
 dwmac_syscon:
 	sun8i_dwmac_unset_syscon(gmac);
 dwmac_ephy:
@@ -1269,9 +1251,6 @@ static void sun8i_dwmac_remove(struct platform_device *pdev)
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
 
-	if (gmac->variant->soc_has_internal_phy)
-		mdio_mux_uninit(gmac->mux_handle);
-
 	stmmac_pltfr_remove(pdev);
 	reset_control_put(gmac->rst_ephy);
 	clk_put(gmac->ephy_clk);

-- 
2.55.0



