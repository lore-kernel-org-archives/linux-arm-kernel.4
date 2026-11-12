Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37203606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 03:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0tmQc+VZ;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vlk87VrX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SCVn4ixoUhM5kBe1PutJBybtN9lGQ3HUNA/BXvLhSJw=; b=0tmQc+VZaxDqqqW+g5hq/JAGjx
	9gbq9ivsSbMRuIeVStve/JFlSEBp1md6j6Y7YgUJFNeVwU+qteUDh21V7dFc04s6FQwmUqzDwtP17
	rPEr9ehlKxGQffCVCdStxmSmk4M1tEdqcfVln4gY4/xdl918nb22ZiwGvIzCWbbAw30AQX70jkqIY
	fuba7HxnRqnMJNwYfaHbYXQ1wMMWdqFbLRYrXr9rzXTopI9qYAUgtCavquhBuxbpFRNXizD6iXVH6
	iQ8k2TWp0yfLQjvt/J65oXu3NpkxyqLMYfm69eaavX7w/Lp24VE1X+XSeMapcM68B7jsAAvLR+D9y
	zJnNCeqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLqi-00000008ebO-32XG;
	Thu, 12 Nov 2026 03:51:44 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLqd-00000008ea2-1oby;
	Thu, 12 Nov 2026 03:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vlk87VrXfClLyKz7/NC3Akq1maOI8c5Zh93vseazjnYYm/jZNUyraeRP0dcaEX3N+h/gMC69JmDqm
	 7ZeWRGhv13kNZ1qRRvIjNxKFnoGC2wbLI7c7b+uI/F4bdCA5VceRPnhr1g6pqGu90jlSAqK/19EMJS
	 WhtkFF5/Cl+GeyMk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af537c3b47-de5a5;
	Thu, 12 Nov 2026 11:51:31 +0800 (CST)
X-RM-TRANSID: 2ee76af537c3b47-de5a5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [198.18.0.64] (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36af537c24aa-f086d;
	Thu, 12 Nov 2026 11:51:31 +0800 (CST)
X-RM-TRANSID: 2ee36af537c24aa-f086d
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, David S. Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yanqing Wang <ot_yanqing.wang@mediatek.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yana06070@163.com
Subject: [PATCH net-next v2] net: ethernet: mtk-star-emac: fix device_node
 leak in mtk_star_probe()
Date: Thu, 12 Nov 2026 11:51:30 +0800
Message-ID: <1794455490000.585551.2561101329908158128@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_195141_582688_04C0826F 
X-CRM114-Status: GOOD (  11.16  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_star_probe() gets the PHY node from the "phy-handle" property
with of_parse_phandle(). The helper takes a reference on the node it
returns. The node is used by of_phy_connect() each time the netdevice
is opened.

That reference is never dropped. Every error return after the lookup
leaks it. Unbind leaks it as well: the driver is devm-only and has no
remove callback.

Release it with a devm action, registered right after the lookup.
The error paths and the unbind path then drop the node through the
devm cleanup.

Found during a code review of the OF node handling in ethernet drivers.

Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>
---
Changes in v2:
- Add the missing Fixes: tag.

v1: https://lore.kernel.org/netdev/1794061182000.57993.3986467551914992480@cmss.chinamobile.com/

 drivers/net/ethernet/mediatek/mtk_star_emac.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index b83886a41121..bac4a24c5979 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1501,6 +1501,11 @@
 	clk_bulk_disable_unprepare(MTK_STAR_NCLKS, priv->clks);
 }
 
+static void mtk_star_of_node_put(void *data)
+{
+	of_node_put(data);
+}
+
 static int mtk_star_set_timing(struct mtk_star_priv *priv)
 {
 	struct device *dev = mtk_star_get_dev(priv);
@@ -1603,6 +1608,11 @@
 		return -ENODEV;
 	}
 
+	ret = devm_add_action_or_reset(dev, mtk_star_of_node_put,
+				       priv->phy_node);
+	if (ret)
+		return ret;
+
 	priv->rmii_rxc = of_property_read_bool(of_node, "mediatek,rmii-rxc");
 	priv->rx_inv = of_property_read_bool(of_node, "mediatek,rxc-inverse");
 	priv->tx_inv = of_property_read_bool(of_node, "mediatek,txc-inverse");



