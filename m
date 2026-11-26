Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0EC606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uVt7cTRg;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=EaINhOIs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZsLSyj095odhNFSzmJK1s2C6OYwLrN2sRDKqCzKWD7I=; b=uVt7cTRghbdD/F
	y3Ey6ATW98MFLZbagkVtFwaRdnCZc//mSvAijEryYodN4Wk0gcp5tNPZFshZCH6WxSKuUNWthP/KB
	FJWSoB0oCvRsVuKvVu5DAlBZZxG1vAZ+dcxlI9dQfgx5cHv1oi9nK1Ylr+mdleh5B7vvI3ncZzXqy
	IrlMfjaUPePGrju/tZOaAia9mv2W+wpOp/ZqHgLsfJWU5mE7JKWYgZu2WlgxzIfU3B8htBU0rvMPG
	D7sQmA33pzukhWIG+RVQYQIF8J708yUC099ey6CZ4QhE0qN1ANzxsp7+i404JAEgniaE7VDtHoj0f
	n++8QlRqhLMmY9XqvPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWr-0000000DLpT-0vsF;
	Thu, 26 Nov 2026 13:28:49 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWF-0000000DLXa-0SUo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:28:12 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcb8;
	Thu, 26 Nov 2026 21:28:08 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 1/2] dmaengine: lpc18xx-dmamux: Unregister the DMA router on removal
Date: Thu, 26 Nov 2026 21:28:05 +0800
Message-Id: <20261126132806.4091183-2-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126132806.4091183-1-202300460064@mail.sdu.edu.cn>
References: <20261126132806.4091183-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2180ac31d03a2kunme5d0c11035d95f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGU0ZVkJKSR5IGkgZQ0kfGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=EaINhOIsKHufBDDUOY5PAE8cJyLjAbBJgiP9dgMdxGk5V7j/N5qJ+rF63pWekZAeQqSgmh8rmmmRthdRVJnuDJoGZmFH/FIGKgIDeCTJyI9Y4zVPJMzKJnjZ8ojQfGpdrTvjwfP4wmMArzRM2jj7bzhO/IlCZEYsnysjtqKmHZU=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=ZsLSyj095odhNFSzmJK1s2C6OYwLrN2sRDKqCzKWD7I=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_052811_406875_2CA91501 
X-CRM114-Status: GOOD (  10.96  )
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

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The DMA router remains in the OF registry after its device-managed
data is released. Remove the routing entry when the device is
unbound.

This issue was found by our static analysis tool under development.

Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/lpc18xx-dmamux.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
index 40a338f0d44b..412d425dc1ab 100644
--- a/drivers/dma/lpc18xx-dmamux.c
+++ b/drivers/dma/lpc18xx-dmamux.c
@@ -169,6 +169,11 @@ static int lpc18xx_dmamux_probe(struct platform_device *pdev)
 				      &dmamux->dmarouter);
 }
 
+static void lpc18xx_dmamux_remove(struct platform_device *pdev)
+{
+	of_dma_router_free(pdev->dev.of_node);
+}
+
 static const struct of_device_id lpc18xx_dmamux_match[] = {
 	{ .compatible = "nxp,lpc1850-dmamux" },
 	{},
@@ -176,6 +181,7 @@ static const struct of_device_id lpc18xx_dmamux_match[] = {
 
 static struct platform_driver lpc18xx_dmamux_driver = {
 	.probe	= lpc18xx_dmamux_probe,
+	.remove	= lpc18xx_dmamux_remove,
 	.driver = {
 		.name = "lpc18xx-dmamux",
 		.of_match_table = lpc18xx_dmamux_match,

-- 
2.43.0


