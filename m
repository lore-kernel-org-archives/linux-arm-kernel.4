Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5CB606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xrPXXgOw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ums+Dip9;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=gVGqBLC1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UQrPmqa5vGFJYVLC6y8HymZQPxgzYznuIdXlfYLtwdY=; b=xrPXXgOwwKIdqN
	hgpyTBZ9Kr2J4lLnntu62HatAfaHgfCrv9mch3lVCoeNhPHL3UQ85rIz5t8AriOLwSdKiRqFnsubK
	dawgK5lPCnbHZ0fzUGIFHKATp/wzsIqbuStVTI9QTEVSa8rb2zier1Na6z9uKtsE8L3PUbnQJjPHl
	euQGEX7+45En3y/+nXLXkLkEwg95mX5zp/ZrSQkzxk7xNX9/MNeI1Ca4SpAudGu7efqbwEEaKRvq6
	tARCfN/Q2h95A5wfDdDlNeeori7L92ejR2XXltbDRX75doTjai54THIU3b3b+ePK3PKE68kD4Iazk
	JNb16/rjDRzaoY1WQ6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfYG-00000002gp5-0Hyn;
	Tue, 10 Nov 2026 06:41:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfYE-00000002gnn-3SPC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Nov 2026 06:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UQrPmqa5vGFJYVLC6y8HymZQPxgzYznuIdXlfYLtwdY=; b=ums+Dip9BH/JJbpg3a8R1KDAtI
	KQqKvBlGBHxKQZEl7cLDYfVt3wxO1EufdvmowFb7PSVyMu+pN2zoRBtxFhaFgfCTD+zE+fDDQqyKd
	qcB+GPZ1yD6cXP35r5GeXuX17sM5hE+mVAS+j0tpEFnmx9vxB0SvoM7Vq4ZVEG+m1ixD1t36trdvv
	vGnQ3GEfB6Us4EUTCmwwXWu7brz4gXKwyWczFWQRuQiJ2dewrTf4zcF6CfST65DhUrbCiQXlpWIUd
	Wat8LceKsLtANrLcS4vXEISDclsLQgE0+LaGCSLYD+Z7fEn3mmjiEEqbSs27rL3pxyI2AaM0o2Zg7
	WGZdvMqQ==;
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by casper.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfY5-00000008JNJ-2Wkw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=gVGqBLC1A/okOTXnaQtxFXNmrSr3ZEmYyIQxfVjrSKVHs8by5p6+WpYKHzEAnWqILfg7z1DbC4oY5
	 paDIEF9NCLuNc5P2DTH9si64bcCWVhpzwClqIeLwprPxXcgp8Xznh0mKySpFIDKbgGq8o4BSRJ1gWE
	 y6YVPd5FG56iMSWM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af2bc93432-97bde;
	Tue, 10 Nov 2026 14:41:23 +0800 (CST)
X-RM-TRANSID: 2ee36af2bc93432-97bde
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af2bc8e8a1-aa5dc;
	Tue, 10 Nov 2026 14:41:23 +0800 (CST)
X-RM-TRANSID: 2ee66af2bc8e8a1-aa5dc
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	danishanwar@ti.com,
	rogerq@kernel.org,
	jan.kiszka@siemens.com,
	diogo.ivo@siemens.com,
	haokexin@gmail.com,
	horms@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v2 net 4/4] net: ti: icssg-prueth-sr1: Fix port scan issues in prueth_probe()
Date: Tue, 10 Nov 2026 14:41:17 +0800
Message-ID: <20261110064118.1138-5-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
References: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_064142_356816_DF32ED61 
X-CRM114-Status: GOOD (  15.22  )
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

The port scan loop in prueth_probe() has several issues:

- When reading the reg property of a port fails, the error is only
  logged and the uninitialized value of reg is then used to decide
  which slot the port node is stored in.

- of_node_get() is called on every port child before the reg value is
  validated. If reg is neither 0 nor 1, the reference is never
  released. If two ports use the same reg value, the second
  assignment overwrites the first pointer and its reference is lost.

- The "port0 and port1 can't have same reg" check after the loop is
  dead code: both variables are initialized to NULL, each iteration
  assigns at most one of them, for_each_child_of_node() visits each
  child exactly once, and the both-NULL case is handled by the
  preceding check.

Fix the first issue by skipping a port when its reg property cannot
be read, and the second by taking the reference only when a port is
actually accepted. Reject duplicate reg values, which is what the
existing check intended but never caught, and remove the unreachable
check.

Fixes: e654b85a693e ("net: ti: icssg-prueth: Add ICSSG Ethernet driver for AM65x SR1.0 platforms")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  | 26 +++++++++++--------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index ef1dc32ff..1a9dd70b2 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -922,24 +922,34 @@ static int prueth_probe(struct platform_device *pdev)
 		if (ret < 0) {
 			dev_err(dev, "%pOF error reading port_id %d\n",
 				eth_node, ret);
+			continue;
 		}
 
-		of_node_get(eth_node);
+		if (reg != 0 && reg != 1) {
+			dev_err(dev, "port reg should be 0 or 1\n");
+			continue;
+		}
+
+		if ((reg == 0 && eth0_node) || (reg == 1 && eth1_node)) {
+			dev_err(dev, "port reg %d already in use\n", reg);
+			ret = -ENODEV;
+			of_node_put(eth_node);
+			of_node_put(eth_ports_node);
+			goto put_cores;
+		}
 
 		if (reg == 0) {
-			eth0_node = eth_node;
+			eth0_node = of_node_get(eth_node);
 			if (!of_device_is_available(eth0_node)) {
 				of_node_put(eth0_node);
 				eth0_node = NULL;
 			}
 		} else if (reg == 1) {
-			eth1_node = eth_node;
+			eth1_node = of_node_get(eth_node);
 			if (!of_device_is_available(eth1_node)) {
 				of_node_put(eth1_node);
 				eth1_node = NULL;
 			}
-		} else {
-			dev_err(dev, "port reg should be 0 or 1\n");
 		}
 	}
 
@@ -951,12 +961,6 @@ static int prueth_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (eth0_node == eth1_node) {
-		dev_err(dev, "port0 and port1 can't have same reg\n");
-		of_node_put(eth0_node);
-		return -ENODEV;
-	}
-
 	prueth->eth_node[PRUETH_MAC0] = eth0_node;
 	prueth->eth_node[PRUETH_MAC1] = eth1_node;
 
-- 
2.50.1.windows.1




