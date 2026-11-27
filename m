Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA97606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TxWZlItD;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bRdMEaXs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=alSIZIsekIUQhonhUr/B6iYQ/WUEy+yWuBJPxD0PpPw=; b=TxWZlItDsZxrJW
	ghf0zAt0gvIQfmq+M8Q8VhXj4cTnqoYkEKLZSMC8GgVtcQHCHc9D4YJZ1YsViV30f7RBzEz/uDKaj
	zqrAuUFPDP6ynbsmltR8y4tGvUZQ0dbWG9R6cogpaTGtnMGIpMHQQ8OTNUmdbH254vQLrcHmquXW8
	E+fDbd5os43a7/HNIi8Wxkx6pIMZCxALp4+LC02tdQhC/7/85TpA54z/QUQOT/nqm0Z2DeAO/qvUY
	Lv63ts4pg7jNdWYumLXhDJJys2qDyIdUfXQRqqFSpNTc7I46j9Rs/RwEuzEo4NxFk8d4mYm0ipLvL
	ccL7e+eDBk7qKHZ2nZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtkj-0000000FjJR-0539;
	Fri, 27 Nov 2026 11:04:29 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtkO-0000000FjC4-2FSS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:04:12 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5641a2c3c;
	Fri, 27 Nov 2026 19:04:03 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	Frank.li@oss.nxp.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com,
	robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] dmaengine: lpc18xx-dmamux: Use managed DMA router registration
Date: Fri, 27 Nov 2026 19:03:59 +0800
Message-Id: <20261127110400.379397-3-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cad381503a2kunm13da2c70394a87
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0pKVkweQ01OThkeHktJGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=bRdMEaXsL+mWkP4+3jgLXai+tVVsoSQO8Hz6+Y2qU+hsj5J8KmwkkDqUZLXMsIcBITN+c3dc4jKMZluX5yj5qv0S3SpPz3HcrC5UGHZO39fTdiI9ITXcsVY09whkcLXVe0vI6txWTNVkVgfX7R8tK5kRfNGDj02nxaFLOErLGY4=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=alSIZIsekIUQhonhUr/B6iYQ/WUEy+yWuBJPxD0PpPw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_030409_445076_B7920CCE 
X-CRM114-Status: GOOD (  10.08  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_LOCAL_DIGITS,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DMA router remains in the OF registry after its device-managed
data is released. Use managed registration to remove the routing
entry before the router data is freed.

This issue was found by our static analysis tool under development.

Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")

Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
Changes in v2:
  - Use devm_of_dma_router_register() instead of a remove callback.

 drivers/dma/lpc18xx-dmamux.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
index d3ff521951b8..0c6758c53a72 100644
--- a/drivers/dma/lpc18xx-dmamux.c
+++ b/drivers/dma/lpc18xx-dmamux.c
@@ -166,8 +166,9 @@ static int lpc18xx_dmamux_probe(struct platform_device *pdev)
 	dmamux->dmarouter.dev = &pdev->dev;
 	dmamux->dmarouter.route_free = lpc18xx_dmamux_free;
 
-	return of_dma_router_register(np, lpc18xx_dmamux_reserve,
-				      &dmamux->dmarouter);
+	return devm_of_dma_router_register(&pdev->dev, np,
+					   lpc18xx_dmamux_reserve,
+					   &dmamux->dmarouter);
 }
 
 static const struct of_device_id lpc18xx_dmamux_match[] = {
-- 
2.43.0


