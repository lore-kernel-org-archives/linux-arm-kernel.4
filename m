Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D642606BD5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CL4Z8Nqc;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=gANfaS/U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nqrKlaQeTl4WKKKVqA7nnyA6CfFqXKex3ZpEO+A2IBE=; b=CL4Z8NqcfGm/f9
	W938hrRe7Fc4kawztc57yiTwlqE/iP/MFNniS0siEqhKARvprfWSq4S7B+yG6dxhhIuG3zer+dpOS
	sxxebcsCagQfAtl3LnyTHHMggVF+X2eIIF3DMB1XnlsvtQronlPHHFtoZ/0wLAV9Q9Y76oJ/qvUle
	ANjLLdiNuAqxMqklNWd9lQt7NUtzh809HnDncVwxRsI+2QAgcA3Zs+6eQ3s2yfdNy+iNUwSZUzZgg
	IzL0BrI22ng1RLED0aD3u3Z4KTheevfr8fTGj+J2OZcjG0S0tL/Zx4seiFc0f4E1GPuh+4WGKsu3y
	Sp6L06NGqDTfi0zNgo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfb9-00000002hVd-0NaS;
	Tue, 10 Nov 2026 06:44:51 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfb2-00000002hSx-3gOs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=gANfaS/UWWdXR08x+aDCE54qPEJ4CfFC6jv2c/+eRudejEQ1i6KPOJ91D1bUIizMIXj+GSMA/jA4d
	 AI8KTa3FqGHaJHAsMb+Vi8AegNapLbLhy8bVrG4nEAWveSGIhN4Wq+w/XzePr8IAlY6LjkIiy9U2sY
	 IHDORU3LkeUfpD2M=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af2bc91d19-d0ff3;
	Tue, 10 Nov 2026 14:41:22 +0800 (CST)
X-RM-TRANSID: 2ee96af2bc91d19-d0ff3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af2bc8e8a1-aa5d7;
	Tue, 10 Nov 2026 14:41:22 +0800 (CST)
X-RM-TRANSID: 2ee66af2bc8e8a1-aa5d7
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
Subject: [PATCH v2 net 2/4] net: ti: icssg-prueth-sr1: Fix device_node refcount leak in prueth_probe()
Date: Tue, 10 Nov 2026 14:41:15 +0800
Message-ID: <20261110064118.1138-3-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
References: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224445_473990_3B7D9CB9 
X-CRM114-Status: GOOD (  10.92  )
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

prueth_probe() takes references on the eth0_node/eth1_node device nodes
with of_node_get() and stores them in prueth->eth_node[]. If either of
the "ti,mii-g-rt" or "ti,mii-rt" syscon regmap lookups fails, probe()
returns -ENODEV without dropping those references, leaking the device
nodes.

Jump to the existing put_cores label so the error path releases the
eth0_node/eth1_node references like all the other failure paths in the
function do.

Fixes: e654b85a693e ("net: ti: icssg-prueth: Add ICSSG Ethernet driver for AM65x SR1.0 platforms")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
Changes in v2:

- Collect the two independent fixes into one series (suggested by
  Simon Horman).

- No code change since v1.

Link: https://lore.kernel.org/netdev/20261030085851.2019-1-laixiangwu@cmss.chinamobile.com/

 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index b8115ca47..ef1dc32ff 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -963,13 +963,15 @@ static int prueth_probe(struct platform_device *pdev)
 	prueth->miig_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-g-rt");
 	if (IS_ERR(prueth->miig_rt)) {
 		dev_err(dev, "couldn't get ti,mii-g-rt syscon regmap\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto put_cores;
 	}
 
 	prueth->mii_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-rt");
 	if (IS_ERR(prueth->mii_rt)) {
 		dev_err(dev, "couldn't get ti,mii-rt syscon regmap\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto put_cores;
 	}
 
 	if (eth0_node) {
-- 
2.50.1.windows.1




