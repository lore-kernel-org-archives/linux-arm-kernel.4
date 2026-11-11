Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE0D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m9YsVCVn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GNkE1uXG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TsO3/ouKFNQJFt1jkTliORU8eiYJf9DPn3a3WF9UUy4=; b=m9YsVCVnoo2Emd
	rg71YBLI0UHbSPRESpANABtYMF5R8adjIn8Skf0ZrC/DX6C+0F8dmqGPcr15hFAc1Iz3pj2JT0dZY
	IJXOmHxJaUN0Jhth2zqDuZ4J1giZr0UvHY8jJfZCymux7cJFHgbTJjtSYWnXeWCgD2V9eZM/kzAjR
	sHMwDXkAJ5Yalv1ZbFrg97LiNWrR9HRz2TS7ZZ/0UR5lqBbnepq6TCqG7T8b9iVN7dBiiK8V1eiYa
	M/Z2IEeSlIxkZiXsfFfkQmsaZgMGOVkxOJ80Ev+BbQpmh3HvvEmfOnuYPe97rvGA0YXDI4UcFMFyI
	o1SzT1qIxKP4ZANqHx5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGG5-00000007rCy-2efk;
	Wed, 11 Nov 2026 21:53:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGG4-00000007rC8-3P96
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 21:53:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56014416B1;
	Wed, 11 Nov 2026 21:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0B71F00A08;
	Wed, 11 Nov 2026 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434012;
	bh=TsO3/ouKFNQJFt1jkTliORU8eiYJf9DPn3a3WF9UUy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GNkE1uXGD1HJ873enZW7pbPuPNZEFCNfy2WOW+5g3XcnawxsiuzyOJYNHsy566iQq
	 FUZo6HQdMLCpbns2qglPLjAl1IVQA+lxyzR2aK/wV/qOc8Ro8K67Knzml87uqVYebU
	 bhkcHtk/wPMuHC3zAomF32sFitE0NKBkLGRHzTkqs8jaTtBbTQKAtTcAKV4iU2xzjn
	 l0SXljYjs5GJExQ0HvJTmmMIVskNNd+V82wjRfWCFLlt97YkT+s4Lh/Sb8F9P+wOaI
	 eHhINVTUmgPzl8gwna5VT6z7dxa6tPrYDk5ailVvg3kG9UWr3SBUx9AhYc3ZnhTJDY
	 G/CHtHPBjS5wA==
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
Subject: [PATCH 04/10] pinctrl: nuvoton: ma35: Avoid leaking map when parent node is missing
Date: Wed, 11 Nov 2026 21:51:49 +0000
Message-ID: <20261111215256.1982044-5-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261111215256.1982044-1-lee@kernel.org>
References: <20261111215256.1982044-1-lee@kernel.org>
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
ma35_pinctrl_dt_node_to_map_func()") removed the kfree(new_map) call on
the !parent error path to avoid a double free, but left *map = new_map
assigned before of_get_parent(np).  Because pinctrl_dt_to_map() does not
invoke dt_free_map() when dt_node_to_map() returns an error, new_map is
leaked if of_get_parent(np) returns NULL.

Look up the parent node before allocating new_map, and release the
parent node reference if the allocation fails.

Fixes: 3fd976afe974 ("pinctrl: nuvoton: fix a double free in ma35_pinctrl_dt_node_to_map_func()")
Closes: https://sashiko.dev/#/bug/linux-ae0c2737-0408-4808-9bae-f7389beb51d0
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 25c66b9e8dd2..4ae1d7ac2b56 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -201,17 +201,19 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
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
2.56.0.567.gdb80ae8cd5-goog


