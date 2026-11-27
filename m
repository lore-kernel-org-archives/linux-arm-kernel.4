Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB72606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LKvQ8ZP1;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=J/Tpee7o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jZEqRTavH+CANYJ0mUrthw8G2lgjmIaW27KnktRfffI=; b=LKvQ8ZP1QOLWDD
	WbFUBL0mBk/l1CvMFqoFrb9ybNAIJBQ7MqXYKrnfSA+qaHGbLxMOnMyqv5ZCw7qll1RhnFfA4Cg7C
	F7Nnp/ytO0SH7d8nplWb2RhiaKeOgBdHekAI2dQNRKbO4u7tAc3GTYmBJl2sol/+tKZejbcRczLDe
	5YtRbyZhpAF5VNVYuUC4icKn7JvDJfkGi+GRm4rOubcOWWdyxf/K2/rlnM5gYK95RUZoAwJ+CWFI3
	Rc0/ydHUfTev8XYhf88zobESCh25bkwSwpp3vLWA9W+1xQ8ENFdpdmZnQbZ8yiohV2H7Pc3KT6hEP
	uM4I5EXReTV+6b3sIlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuD7-0000000Fpb8-2cmI;
	Fri, 27 Nov 2026 11:33:49 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCx-0000000FpP6-1wNV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:33:40 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299838;
	Fri, 27 Nov 2026 19:33:36 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: amelie.delaunay@foss.st.com,
	vkoul@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	cedric.madianga@gmail.com,
	pierre-yves.mordret@st.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] dmaengine: stm32-mdma: Use managed OF DMA controller registration
Date: Fri, 27 Nov 2026 19:33:32 +0800
Message-Id: <20261127113332.390552-4-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
References: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc8434003a2kunm85c9bc3d395e01
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZThpLVh9CSEJDHhpPQh9MTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=J/Tpee7oWLcl1bGmBAlS/7Q4qwfz4ze/BlWkr9/kzn9FLt5Gmla4OtK+DZiegfiDqdafu9XE882AExWmoBS+SNh7Yn19QBWbIEXeDhiQsKQethDZihg/iGFcJb0z34rOQaByl9kvq7QN58IlRIHeCEBWJJ1laei7tcWzU3KQPnc=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=jZEqRTavH+CANYJ0mUrthw8G2lgjmIaW27KnktRfffI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033339_765742_012DBC04 
X-CRM114-Status: UNSURE (   8.92  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_LOCAL_DIGITS,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The OF controller outlives the managed DMA engine and its channel
data on removal. Use the managed registration helper to withdraw the
OF controller first.

This issue was found by our static analysis tool under development.

Fixes: a4ffb13c8946 ("dmaengine: Add STM32 MDMA driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/stm32/stm32-mdma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/stm32/stm32-mdma.c b/drivers/dma/stm32/stm32-mdma.c
index 4851c1c7ce0c..c95a9bb1171b 100644
--- a/drivers/dma/stm32/stm32-mdma.c
+++ b/drivers/dma/stm32/stm32-mdma.c
@@ -1714,7 +1714,8 @@ static int stm32_mdma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk;
 
-	ret = of_dma_controller_register(of_node, stm32_mdma_of_xlate, dmadev);
+	ret = devm_of_dma_controller_register(&pdev->dev, of_node,
+					      stm32_mdma_of_xlate, dmadev);
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"STM32 MDMA DMA OF registration failed %d\n", ret);

-- 
2.43.0


