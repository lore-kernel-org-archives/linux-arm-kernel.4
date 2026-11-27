Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF2E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q5Gi2y4S;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fhJANjTS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lEUdpCgYKRIjX6P3P4jjDUzJHQiGUBHPh97SAeo4M7M=; b=Q5Gi2y4S7LE6wq
	rNrvma2m09ajhV4oNEc6QKWSO6oyDPaE91keLgVC4iRlEV91lQo7jMCCsZ79OfdJgTDTF9trIjFB+
	8LheTvyWa/0AiN+AQ7sdghj2GdhVIqzqDpOjG4aMuChDB4GG4/pollmtO3qHuruBCNauY07z7OgiH
	zJjIZXJjucQSqvBH/wJFFqbmIy6T+o2oEHwNeaqAIfpILBg62TJIu7vyfFFPMSbzngkWalHd3P/eI
	Mbr1G6LzKv68uO/wCTKvhwLmfBxaxm0cPJWoh6Q38VBA6wSct49FQfuymELvNFAnx3HD85yqvh76R
	ayHVUgLMTMF9ga2MNrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwbG-0000000GKn6-0KQr;
	Fri, 27 Nov 2026 14:06:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwb4-0000000GKjH-0YCe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:06:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE43343A14;
	Fri, 27 Nov 2026 14:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A5B1F00899;
	Fri, 27 Nov 2026 14:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788401;
	bh=lEUdpCgYKRIjX6P3P4jjDUzJHQiGUBHPh97SAeo4M7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fhJANjTSb+fu3Z73pMqr1nzD7u3HmmWTI40B3AJC4pgJzDBVgAG1jp6z3gtMEQOAg
	 cIoFn9weke4AuFiY8RxTnf+lJS3+Z7c4rvOGVU/S/6uQ6wgV0AlsbJRYeKMjckw01i
	 5ureQdnfD+HzaXfUiYIBDanGpKtH/H9E4WBqkmNKiHI94ruQboNS25WRLbEffH3GAB
	 RBBu1lqEBLsd/1MQqtn70gxMxsTx8VJkaS02/A7ahbz4LIpig+E9HBeM76dE0zQAXa
	 0CteMqdug0w5/VhNt+dlJQ+V6ZCiAe4WloYsD8HFFh96W6sNTgywWYbRR57e3UGHaf
	 Z/MtuFUfnLOug==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3 05/12] pinctrl: nuvoton: ma35: Avoid leaking map when parent node is missing
Date: Fri, 27 Nov 2026 14:04:53 +0000
Message-ID: <20261127140602.2790001-6-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127140602.2790001-1-lee@kernel.org>
References: <20261127140602.2790001-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Commit 3fd976afe974 ("pinctrl: nuvoton: fix a double free in
ma35_pinctrl_dt_node_to_map_func()") switched new_map from
devm_kcalloc() to unmanaged kcalloc() without freeing new_map on the
!parent error path.  Because pinctrl_dt_to_map() does not invoke
dt_free_map() when dt_node_to_map() returns an error, new_map is leaked
if of_get_parent() returns NULL.

Look up the parent node before allocating new_map, and release the
parent node reference if the allocation fails.

Fixes: 3fd976afe974 ("pinctrl: nuvoton: fix a double free in ma35_pinctrl_dt_node_to_map_func()")
Closes: https://sashiko.dev/#/bug/linux-ae0c2737-0408-4808-9bae-f7389beb51d0
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
v2 => v3:
 - Rebase onto pinctrl/for-next; no functional changes.

 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index b6411fc4d98b..c20350bc1cdb 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -202,17 +202,19 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
+	parent = of_get_parent(np);
+	if (!parent)
+		return -EINVAL;
+
 	map_num += grp->grp.npins;
 	new_map = kzalloc_objs(*new_map, map_num);
-	if (!new_map)
+	if (!new_map) {
+		of_node_put(parent);
 		return -ENOMEM;
+	}
 
 	*map = new_map;
 	*num_maps = map_num;
-	/* create mux map */
-	parent = of_get_parent(np);
-	if (!parent)
-		return -EINVAL;
 
 	setting = grp->data;
 
-- 
2.56.1.839.g22a8290db9-goog


