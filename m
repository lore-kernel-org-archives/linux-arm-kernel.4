Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E73960A5BE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=403MtWIc;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LkZG1Aaw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WfIAYqdF6wZYpZzaWY38Xxjrq+wOS8yWfdzFcKWXmbc=; b=403MtWIcI0UoEG
	NKKclPHCvu9RsAUDSiY+5by7DdAxdZbZ2rIEdpJU3+PcsehT4rJertWfnQyR4r/fX5/5JnsRojUbI
	viN7BBTjO76LlLCS2WTxurki/dKXK+MzEvPzRncKCqcQRYHFMyI/MDz7EBdqGFo4VEjIfkBrSHa1n
	cj1iXY49nqjdctSj+NqDriWIEv1werSDmzutwOr5I8XozngWPy/xZ1sgmLoja9ezT2s75R/NIy/af
	VWkIg6DKNulMCucYlrJ+NieHfkxc2mFtBBzF9JljmWWa4hRF1wqUx8fZiTf7jwdIf4d18RYjOb3qJ
	Mg39zS7XDz0sxkj35BmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfYF-00000002goy-3yVf;
	Tue, 10 Nov 2026 06:41:51 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfY1-00000002gbo-1Y2z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=LkZG1AawQASF5XJO37toqyMRyC6pBLcNVPI5P9kppwgBnI9iFh6P/aNgaDEqsV3uAtmw6qxocLngn
	 xgZTbuw3n4D8ZYLtOM7gSNikmWPuRvD8jU10nYTYrClp0ZtTck+2inl7ic7LObxlz/YZkJB901Qiwu
	 leyRyftDdEMioqA4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af2bc92841-983e0;
	Tue, 10 Nov 2026 14:41:23 +0800 (CST)
X-RM-TRANSID: 2ee66af2bc92841-983e0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af2bc8e8a1-aa5d9;
	Tue, 10 Nov 2026 14:41:22 +0800 (CST)
X-RM-TRANSID: 2ee66af2bc8e8a1-aa5d9
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
Subject: [PATCH v2 net 3/4] net: ti: icssg-prueth: Fix port scan issues in prueth_probe()
Date: Tue, 10 Nov 2026 14:41:16 +0800
Message-ID: <20261110064118.1138-4-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
References: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224138_401223_1C0332BA 
X-CRM114-Status: GOOD (  17.98  )
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

Fixes: 128d5874c082 ("net: ti: icssg-prueth: Add ICSSG ethernet driver")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 26 +++++++++++---------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 9b971d1df..c19a51174 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -2217,24 +2217,34 @@ static int prueth_probe(struct platform_device *pdev)
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
 
@@ -2246,12 +2256,6 @@ static int prueth_probe(struct platform_device *pdev)
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




