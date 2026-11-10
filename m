Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E300606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zQaiOo1Z;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXckI2Sy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XM3iyYGns51wHTuIfoJe4NYI7OiUdPja2Tnl8gWGEoQ=; b=zQaiOo1Z2o8CdEZ3Qyxqa2CxVS
	FZOEpfW2TK25atvNEAsuxYYbjU/EJCY/kJVlkE1QO6xFN/YnMtAZ2GwlTzKMh9Dv8VBqvQRcD9UCu
	jEl0NRMU2sExGKfoL9X3Wz46UTbpBmn2nZFvfVY4NJTcL8jK2Nm9JY8m7jk41Bpyu4Fkg+Y/b/J0M
	NkbYyKyZvc+grKnqhXPtMd1SOJjThc1X9lpq+4MSjIiPEPTupZJSF61J6w7rFypdhIGgU6+BBFqia
	DqmzNhhBW1EvA2rYIhD/ao1Njq3xkm7C2WYbun+sW/4wkIUqNRLJKpZHhwXl0ThFetfyySHCABYRh
	XospJhUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg3J-00000002no6-1zqU;
	Tue, 10 Nov 2026 07:13:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg3I-00000002nnN-2cKz;
	Tue, 10 Nov 2026 07:13:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6167741658;
	Tue, 10 Nov 2026 07:13:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794294836;
	b=wDl+jtID3YoGa9o0sIOGcttFHx7Rhdwu3pZVw/RgPNuf8NyqkqeOUi+FevFm2xwFGjrw
	 cMYtIIbGDO+AczECyJ4LLnOOcCycRC4MyMGeu+WpcSWU+ePaZNL45dasqc3NfPBnuAI6Q
	 tAMccOFJ0OJxaMcNLd85sPAj4x275o1oAWY2QPUSS38D69Eup25vxbwNiOz1A+P+xfoKi
	 JiTt35s9JtW6aMwcIzSF18UlFy66tYX8jXMZ+pjdTYb1z/jPqBAodEAgM+U1U96L3iuzj
	 m/lsy/Fuz9nQgj9Qvcnu0FsfrEDMO1wKzrygjxtGGWh6YP7U6y4dm0Vg2ZvLgoshVOw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794294836;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XM3iyYGns51wHTuIfoJe4NYI7OiUdPja2Tnl8gWGEoQ=;
	b=jrDnAmlVz8W5UzpFBMfgtk4GiQtbUei9d4rU9Mo5kfpFBNgb8x8aYHLFzgdZAEIyzSbQ
	 oJoKxU7JJFiLY4/XdeQHZJtCXISajbgYqD3UGYICrT8CDxH0fUDnIUSYhkmyicsw40ide
	 4s4+631XxhysTyrUmWNsa/dYwdAWLtXMqZg+TuPPKAo+GchHCN0Qw+jT2+IsJBzzfJXFK
	 9QBcTHY0qmA2y1w2jEKlmzyL6Xm8iJrG+0uA0NMVn6DOhmI/RXms2DfTRHUvnRIib/Qj7
	 2c33L9KtgioWohpfxjK93ZcSzqHcBdzXdbPZb+lBegMPdwVIbw13CLqSMzxaMka82PA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A737F1F0089F;
	Tue, 10 Nov 2026 07:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294836;
	bh=XM3iyYGns51wHTuIfoJe4NYI7OiUdPja2Tnl8gWGEoQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=BXckI2SyNPopOUTmH8eoNMzb5dE3gxSZCg2zel/DQT1akoxVddVcElmstirAh6u3y
	 f0NGmJ7MT2Ig4UhkGLJGwYOGEoXL7hy2YIPPgHhprZAoHqB276FrddLxQP7VNCVzWd
	 jwvvBZF3oq/AaujuuOxolpO/8e7uTL3qTbrUEHQ62INpI1ki3xBM31cXldQxK57E/G
	 984UWc/8MTKhosh//M1EY2b+X8AkZqy1AkQnekSl8wFOL8QAEdU9/7x6zKSJkCMYNv
	 fqI44YZH9F7avO1RNkOi7EBUhmG8owTBnjK8qWuQMaeRWzFf0sH9DVJrEkZJSx4TYY
	 WnCaOk69waXoQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3AE1A4891E;
	Tue, 10 Nov 2026 07:13:55 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:13:55 +0000
Subject: [PATCH net-next] net: stmmac: dwmac-rk: only read the delays the
 MAC applies
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-stmmac-dwmac-rk-delays-v1-1-87abb6592921@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSw7CMAwFr1J5jaU4VOVzFcQiJC4YaEBxoK2q3
 r0pbJ40epqZQDkJKxyrCRJ/ReUVC9CmAn9z8coooTBYYxsiMqi565zH0K+bHhj46UbFmpzZ7ne
 Nrf0BivxO3MrwC58gcsbIQ4bz/9HP5c4+r12Y5wWXMDVLhAAAAA==
X-Change-ID: 20261110-stmmac-dwmac-rk-delays-41a0387624c9
To: Heiko Stuebner <heiko@sntech.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794294835; l=4046;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=QQNrpXBNV3rRDNQu9MSMqZkKJ0F2a8WJAor/zaH4Dzs=;
 b=/C7vRZ019UGX9xEoKZox6IV8k6tffQB9VzApV8qqosMVT1iLXR/1PDjegWS5Hdu7X7RjjaWaU
 YUuaeZtNgpXD+xcNDzz7bUfPLAHBcBOQ1lGwJhWyMw7CR3dHdeNQqcn
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

The tx_delay and rx_delay properties are only used for the directions in
which the MAC inserts the RGMII clock delay itself: both for "rgmii",
TX for "rgmii-rxid" and RX for "rgmii-txid". For "rgmii-id" (the PHY
adds both delays, the recommended setup) and for RMII they are ignored
by rk_gmac_powerup().

The driver nevertheless parses both properties unconditionally and logs
an error, plus the default it picks, for each one that is missing. A
correct device tree using "rgmii-rxid" therefore gets

  Can not read property: rx_delay.
  set rx_delay to 0x10

and one using "rgmii-id" gets the same pair for tx_delay as well, for a
value that is never programmed.

Only parse the delay values that will actually be used, so the error is
reserved for device trees that really lack a required delay. Behaviour
for "rgmii", "rgmii-rxid" and "rgmii-txid" is unchanged.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Tested on an Orange Pi 5 (RK3588S, Motorcomm YT8531C on gmac1) with its
device tree using "rgmii-id": the probe log has "init for RGMII_ID" and
no "Can not read property" lines any more, the link comes up at
1000/Full and transfers run at line rate (940 Mbit/s receive, 0 errors).
The "rgmii", "rgmii-rxid" and "rgmii-txid" paths are unchanged and were
not re-tested.

This patch was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit message, and I reviewed and tested it
as described above.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 47 ++++++++++++++++----------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index c4db919ec164..f06428ce3cfc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1331,26 +1331,37 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 			bsp_priv->clock_input = false;
 	}
 
-	ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
-	if (ret) {
-		bsp_priv->tx_delay = 0x30;
-		dev_err(dev, "Can not read property: tx_delay.");
-		dev_err(dev, "set tx_delay to 0x%x\n",
-			bsp_priv->tx_delay);
-	} else {
-		dev_info(dev, "TX delay(0x%x).\n", value);
-		bsp_priv->tx_delay = value;
+	/*
+	 * The MAC only inserts the delays which neither the PCB nor the PHY
+	 * provide (see rk_gmac_powerup()), so only the delay values for
+	 * those directions are needed.
+	 */
+	if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII ||
+	    bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII_RXID) {
+		ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
+		if (ret) {
+			bsp_priv->tx_delay = 0x30;
+			dev_err(dev, "Can not read property: tx_delay.");
+			dev_err(dev, "set tx_delay to 0x%x\n",
+				bsp_priv->tx_delay);
+		} else {
+			dev_info(dev, "TX delay(0x%x).\n", value);
+			bsp_priv->tx_delay = value;
+		}
 	}
 
-	ret = of_property_read_u32(dev->of_node, "rx_delay", &value);
-	if (ret) {
-		bsp_priv->rx_delay = 0x10;
-		dev_err(dev, "Can not read property: rx_delay.");
-		dev_err(dev, "set rx_delay to 0x%x\n",
-			bsp_priv->rx_delay);
-	} else {
-		dev_info(dev, "RX delay(0x%x).\n", value);
-		bsp_priv->rx_delay = value;
+	if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII ||
+	    bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII_TXID) {
+		ret = of_property_read_u32(dev->of_node, "rx_delay", &value);
+		if (ret) {
+			bsp_priv->rx_delay = 0x10;
+			dev_err(dev, "Can not read property: rx_delay.");
+			dev_err(dev, "set rx_delay to 0x%x\n",
+				bsp_priv->rx_delay);
+		} else {
+			dev_info(dev, "RX delay(0x%x).\n", value);
+			bsp_priv->rx_delay = value;
+		}
 	}
 
 	bsp_priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,

---
base-commit: d26955e57475434b59d43ba372b2a50d33d5e0ed
change-id: 20261110-stmmac-dwmac-rk-delays-41a0387624c9

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



