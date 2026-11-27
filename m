Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC4D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WuEkVxtg;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=JaiQ8phF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NSB4dlN4H7brFcdBFYN3Nn6XgkkUny+TRmIyH8xk05Q=; b=WuEkVxtguZAwX7
	s+xJaAlo9wbhmBeYDzSBL8UZQWtbTtEFCZnYENA2CQGnG/0SQESngsy4FOA5w+bQvkwc9xYHd7Ljg
	wgnG9GXZUJipKJGkWEIzKquvmT9QShsPHpOJbAUXPXtZtyu6CKb3fMhpUZL/RdRo0tWflH9UxRxuh
	MoIStmIORct7+O8HBcgKRr5ioWe2+duPYxFfple0VngwhT3Nd4Jc3x4/uxC60/Z8UO0Je1k20AUcj
	a4iquJgz1cLkMNb7z+/CmG0Lj6XxhzYslstejRtSxCaFVZaXUoyYxQx7OtuY5W3lY38h48eqtZvU3
	5qe+KsyU6cNRvOyMgFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuD7-0000000Fpca-3yoa;
	Fri, 27 Nov 2026 11:33:49 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCx-0000000FpOV-23wb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:33:40 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299837;
	Fri, 27 Nov 2026 19:33:35 +0800 (GMT+08:00)
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
Subject: [PATCH 2/3] dmaengine: stm32-dma: Unregister the OF controller and DMA device
Date: Fri, 27 Nov 2026 19:33:31 +0800
Message-Id: <20261127113332.390552-3-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
References: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc83f7503a2kunm85c9bc3d395dff
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHRpMVkpIHR5LGU8fHkNCQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=JaiQ8phF1xrfeCJQZWnuo9G8CKgJ5p9irviguhM0MVogUFVgnYa6auLfrDOzieF75ruNsIit7jhE5qf4iruJGnm/u6Id7uBu1nyk3l1fnp32yJhSV8GYRNGcJHqOYVG44Fbxs4HanHAZ91T/P0ncXnDoqT2oeFw8sC7oTrf1Nxw=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=NSB4dlN4H7brFcdBFYN3Nn6XgkkUny+TRmIyH8xk05Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033339_798293_67DDB497 
X-CRM114-Status: GOOD (  10.85  )
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

The OF controller and DMA engine remain registered after the driver
releases its channel data. Unregister both in reverse order when the
device is removed.

This issue was found by our static analysis tool under development.

Fixes: d8b468394fb7 ("dmaengine: Add STM32 DMA driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/stm32/stm32-dma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
index ba8121d37f51..6392c15b4317 100644
--- a/drivers/dma/stm32/stm32-dma.c
+++ b/drivers/dma/stm32/stm32-dma.c
@@ -1761,6 +1761,14 @@ static const struct dev_pm_ops stm32_dma_pm_ops = {
 			   stm32_dma_runtime_resume, NULL)
 };
 
+static void stm32_dma_remove(struct platform_device *pdev)
+{
+	struct stm32_dma_device *dmadev = platform_get_drvdata(pdev);
+
+	of_dma_controller_free(pdev->dev.of_node);
+	dma_async_device_unregister(&dmadev->ddev);
+}
+
 static struct platform_driver stm32_dma_driver = {
 	.driver = {
 		.name = "stm32-dma",
@@ -1768,6 +1776,7 @@ static struct platform_driver stm32_dma_driver = {
 		.pm = &stm32_dma_pm_ops,
 	},
 	.probe = stm32_dma_probe,
+	.remove = stm32_dma_remove,
 };
 
 static int __init stm32_dma_init(void)

-- 
2.43.0


