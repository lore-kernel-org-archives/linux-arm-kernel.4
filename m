Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E148606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kWUkgppn;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=di7sQHpA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1xpwcbGxuPT3tXpkx6Mf8RyX6Dzo36GFZ6Dp9E4sqss=; b=kWUkgppnMxvWTcyYLfR9b6JdTi
	+OqvAsKrPiFHzDXj7bKVTn9KJP4ndP4YnOeZ8DTYUDRx1a8xZNSPHj0oeVPNKYyF1VB31e3xq+hvB
	hsWfO0ho4SLhE8kPHD1qnQpHZomTlOP+4qeNPrDILgfnxsyGdNfgPTO3YYuwz3VskQzsbs9p3KJ2l
	eW8nFYXKeh23JZmg8Za8SRii4+Nc5ZerDr5eVJyEF4jeQpPOTXNRlIVggK9vujXR7oG//kIt/55GJ
	LmvpGgAXB/jqT9+dQl3+jGeosjfPZmo0s7LseKIJBDrWg7z7VgdKIuLELcISrd8wdNsAzvbypWyFi
	3ugt30gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSWo-0000000FjEB-2Hue;
	Fri, 20 Nov 2026 17:36:06 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSW8-0000000Fj6z-3UON
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:35:36 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5573c0ab8;
	Sat, 21 Nov 2026 01:35:09 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: imx-sdma: Fix potential memory leak on channel zero failure
Date: Sat, 21 Nov 2026 01:35:05 +0800
Message-ID: <20261120173507.3923720-1-liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1fa06c2dc03a1kunm78995cb0238b67
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEJDVkNNGR9MTUNLGhlOSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=di7sQHpAD8ER8mZMsdEsxG3xOKw3SToAXE/uzh+u0doycz1U3OG8GiwwJwRtNTGQseu8jgdZ6olOP2coJtXNZkfCoDmKRW2YYPs8seXd27n/X/+DGFagHzti4HydpHEnFlpL7BrqJfgiHKxpnqWvmm8DCutL0pNSEw57HBHjOIg=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=1xpwcbGxuPT3tXpkx6Mf8RyX6Dzo36GFZ6Dp9E4sqss=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_093522_727986_0FE27E2F 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

If allocating the channel zero descriptor fails, sdma_init() disables
the clocks without releasing the already allocated channel control and
context storage. Free that storage with the matching allocator before
returning the error.

This issue was found by our static analysis tool under development.

Fixes: 1ec1e82f2510 ("dmaengine: Add Freescale i.MX SDMA support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/dma/imx-sdma.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 36368835a845..9c0087b3b805 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2161,7 +2161,7 @@ static int sdma_init(struct sdma_engine *sdma)
 
 	ret = sdma_request_channel0(sdma);
 	if (ret)
-		goto err_dma_alloc;
+		goto free_channel_control;
 
 	sdma_config_ownership(&sdma->channel[0], false, true, false);
 
@@ -2184,6 +2184,13 @@ static int sdma_init(struct sdma_engine *sdma)
 
 	return 0;
 
+free_channel_control:
+	if (sdma->iram_pool)
+		gen_pool_free(sdma->iram_pool,
+			      (unsigned long)sdma->channel_control, ccbsize);
+	else
+		dma_free_coherent(sdma->dev, ccbsize, sdma->channel_control,
+				  ccb_phys);
 err_dma_alloc:
 	clk_disable(sdma->clk_ahb);
 disable_clk_ipg:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


