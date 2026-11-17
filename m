Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0684606A890
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jwxMpp08;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=eWWleW+P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AhzMQ2E3g/vRFX15pwJIjwTP95X1ccIWcj1om489vX4=; b=jwxMpp08tpJ1Ja
	UsVvtoLakBC3gzd635Q5T5AU8njzIquv0xhsRSnIE9L1ah/IoM4tB8hz1LhAJuy6VfmL5nvTd9zZJ
	8pzYGg6CGZn4WkkMCrXUcDTed2G0hvQr0DFc/YMtWFuZC4R37hxy/wXJuBWb2kuz0l3tEcm6SlnTG
	58ooCBS5/6C8jZaF9T5oVJ/i6MOKjNeYViBaTEh42IAxfuDYtSt58v9aL2VlLFBX4SBkMReNPOF7a
	X37yz5iAWDB2BgdJSLg/H/V7TLuKPRxbLbJNonETBC2dFjBWekspNrn3+H0ElyGHY5wvSojvIOVU4
	Sjo6ahZJmjxIUF+XIysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKR7-00000006CGU-1FJk;
	Tue, 17 Nov 2026 14:45:29 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKR3-00000006CFl-3H4M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:45:27 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55020e792;
	Tue, 17 Nov 2026 22:45:20 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Boon Khai Ng <boon.khai.ng@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH net 2/2] net: emaclite: Fix potential use-after-free during removal
Date: Tue, 17 Nov 2026 22:45:18 +0800
Message-ID: <20261117-571e631490-net-2@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117-571e631490-net-0@mail.sdu.edu.cn>
References: <20261117-571e631490-net-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e9f8329d03a1kunm6b1ed508156203
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZT05MVkoZT0tKSkIfHkweS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=eWWleW+Prxyyl6CPBnxsU9TR71Ot0NZcypj/qxve1DKhKKW2H/JHeYZLe7vD/CyQkXjFnOn7YAoYMQIpTpQbD7k2QrQPX5lkhA4luIo5z1ogKSC+1sDVt+fJ3cCvlsHs6n/0W7c3eEKbO0vFLJYwItp+K0Jaf4JyCxPnF4nVwTw=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=AhzMQ2E3g/vRFX15pwJIjwTP95X1ccIWcj1om489vX4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_064526_087057_C2C8F01B 
X-CRM114-Status: GOOD (  11.38  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xemaclite_of_remove() frees the MDIO bus before unregistering the
network device. If the interface is up, unregister_netdev() calls
xemaclite_close(), whose phy_disconnect() still accesses that bus.
This can cause a use-after-free during PHY detachment.

Unregister the network device first so that PHY detachment finishes
before the MDIO bus is unregistered and freed.

This issue was found by our static analysis tool under development.

Fixes: 27cad0084066 ("net: emaclite: Fix MDIO bus unregister bug")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/net/ethernet/xilinx/xilinx_emaclite.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_emaclite.c b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
index 4719d40a63ba..008e3d1e2981 100644
--- a/drivers/net/ethernet/xilinx/xilinx_emaclite.c
+++ b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
@@ -1189,6 +1189,8 @@ static void xemaclite_of_remove(struct platform_device *of_dev)
 
 	struct net_local *lp = netdev_priv(ndev);
 
+	unregister_netdev(ndev);
+
 	/* Un-register the mii_bus, if configured */
 	if (lp->mii_bus) {
 		mdiobus_unregister(lp->mii_bus);
@@ -1196,8 +1198,6 @@ static void xemaclite_of_remove(struct platform_device *of_dev)
 		lp->mii_bus = NULL;
 	}
 
-	unregister_netdev(ndev);
-
 	of_node_put(lp->phy_node);
 	lp->phy_node = NULL;
 }
-- 
2.43.0


