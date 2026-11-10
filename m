Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C931F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SiNkHkzF;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=thdjrUIF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fgSrZKADbXl/YSiOGT5BVNgsU86IzRBSHrswgiXFdHs=; b=SiNkHkzFRZzYdV
	Z2SxHBVj2sN8SWjNGmDsiJpEGsPct90T5Xlk18O7ffDtyjZPLBKsJVbPKbznNaQXmNFDltpsPTm6I
	XldyQTXHJ5YoPmzs3kksRc8qYXDSvq3avJ7Nt/kO08K0KUHjHtgAaBD9Ix/9vElhFtxqRD6wDf7Js
	pINdqvF2Wtwg2/jPXgBgLGpfaouLhGLUwYGimPA8QQu6xG3AOlQEQWMSd7WNo2Tl/wXpHRqz8tEmA
	ZFlWOi9J15AjGa6gKFDHFCEqLi+hppkLWJ4DUmcxmmdUNYEvUeyFySKVrjXor9C2zOloG5c/VAbEV
	Wd1KfpjgqM2XiW47YvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfxu-00000002kEs-2p4j;
	Tue, 10 Nov 2026 07:08:22 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfxl-00000002kAX-3QQN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=thdjrUIFu2AVCoAPuIQCJMYAi/LMAuHfm5VUuyznkWfeFlxhZF8alkWGGt67gL83kBxYLUk23N+7e
	 WdbTp8JlymGB0YFuRohaYpEHQGRCav3MOgZG5nZlnExQwOW0fInLKJr37aaKZVt4dU/hOnFHk8YnRV
	 c2GQRNdNMR1EQS6o=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af2c2d7253-ccae6;
	Tue, 10 Nov 2026 15:08:07 +0800 (CST)
X-RM-TRANSID: 2ee76af2c2d7253-ccae6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af2c2d35b4-ab42a;
	Tue, 10 Nov 2026 15:08:07 +0800 (CST)
X-RM-TRANSID: 2ee16af2c2d35b4-ab42a
From: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 1/2] net: ethernet: ixp4xx: fix OF node leaks in ixp4xx_of_get_platdata()
Date: Tue, 10 Nov 2026 15:08:01 +0800
Message-ID: <20261110070803.1099-2-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261110070803.1099-1-zhaofeng2@cmss.chinamobile.com>
References: <20261110070803.1099-1-zhaofeng2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230814_412748_ED24B77B 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

ixp4xx_of_get_platdata() resolves the NPE and the RX/TX-ready queue
phandles with of_parse_phandle_with_fixed_args(), which takes a
reference on the resolved device node, but the references are never
dropped, so the NPE and queue manager device nodes are leaked on every
probe.  Since the DT parsing happens before the -EPROBE_DEFER check
for the MDIO bus instance, the leak also repeats on every probe
deferral.

Drop the references with of_node_put() once the phandle argument has
been consumed.

Fixes: 95aafe911db6 ("net: ethernet: ixp4xx: Support device tree probing")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
 drivers/net/ethernet/xscale/ixp4xx_eth.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/xscale/ixp4xx_eth.c b/drivers/net/ethernet/xscale/ixp4xx_eth.c
--- a/drivers/net/ethernet/xscale/ixp4xx_eth.c
+++ b/drivers/net/ethernet/xscale/ixp4xx_eth.c
@@ -1397,6 +1397,7 @@
 	}
 	/* NPE ID 0x00, 0x10, 0x20... */
 	plat->npe = (npe_spec.args[0] << 4);
+	of_node_put(npe_spec.np);
 
 	/* Check if this device has an MDIO bus */
 	mdio_np = of_get_child_by_name(np, "mdio");
@@ -1414,6 +1415,7 @@
 		return NULL;
 	}
 	plat->rxq = queue_spec.args[0];
+	of_node_put(queue_spec.np);
 
 	/* Get the txready queue as resource from queue manager */
 	ret = of_parse_phandle_with_fixed_args(np, "queue-txready", 1, 0,
@@ -1423,6 +1425,7 @@
 		return NULL;
 	}
 	plat->txreadyq = queue_spec.args[0];
+	of_node_put(queue_spec.np);
 
 	ret = of_get_mac_address(np, mac);
 	if (!ret) {



