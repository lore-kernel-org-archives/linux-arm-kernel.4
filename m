Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B3B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vk9ywNtW;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=CnWlfi6d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YmRsZyfOBwEebm57e1uhgiWT8YV2brPEanQzojdKxVY=; b=vk9ywNtWMjEG1M
	Ejr5j1ltZxhpFd2kYMcCJoQS7ivnB3m0lw8idXmZdrXbAKo/+ZPpKUZe1oU3S9+oliNC0SiqXQYdX
	Ssg/3+M/wmBBQeR2qfJi2EiuEbQ9mDa7orKt8AL7p6y9g+zOxwG/EtHZk2Vb8TDWdsMGuMLQnmv0h
	Kw5szumejy1oxTD63SqGceKedqNjVjPDi6dMLadGkYtHfMXi6lYHIYD50ENTZo5dXp00YQy0PMlSq
	sdUT5e/pB6cYOh2bg3U3stcRdnR51Or5LdSgi5+GUNiI7tkewzohPT/Qpt1hAbTzr7ZsCMMHBp1F+
	DaZ3XcTINJ6734MhRhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuD7-0000000Fpaa-0hMu;
	Fri, 27 Nov 2026 11:33:49 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCw-0000000FpNi-0QiH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:33:39 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299836;
	Fri, 27 Nov 2026 19:33:34 +0800 (GMT+08:00)
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
Subject: [PATCH 1/3] dmaengine: stm32-dmamux: Unregister the DMA router on removal
Date: Fri, 27 Nov 2026 19:33:30 +0800
Message-Id: <20261127113332.390552-2-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
References: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc83c5603a2kunm85c9bc3d395dfc
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSUsYVk0YSRlJTExLHkMdGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=CnWlfi6djbcQj5gl6XVsFkrplbFqXE7T10I3VCokGbE6ys+mLE2tIR9rA3szdbYqZFOZI6/ZwVDtgxPUY1aIOScCNQv0WMcx4hdp396MQnMSDwGN+NPqkmkh+pS71Cpl+MFTXkWYU5eehd1B7HrFsW2MiCN1h+36uJWNPUKG3zA=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=YmRsZyfOBwEebm57e1uhgiWT8YV2brPEanQzojdKxVY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033338_397037_A9671546 
X-CRM114-Status: UNSURE (   9.45  )
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

The DMA router remains in the OF registry after its device-managed
data is released. Remove the routing entry when the device is
unbound.

This issue was found by our static analysis tool under development.

Fixes: df7e762db5f6 ("dmaengine: Add STM32 DMAMUX driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/stm32/stm32-dmamux.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/stm32/stm32-dmamux.c b/drivers/dma/stm32/stm32-dmamux.c
index 57318715d9f3..6f49d78bfe3d 100644
--- a/drivers/dma/stm32/stm32-dmamux.c
+++ b/drivers/dma/stm32/stm32-dmamux.c
@@ -389,8 +389,14 @@ static const struct of_device_id stm32_dmamux_match[] = {
 	{},
 };
 
+static void stm32_dmamux_remove(struct platform_device *pdev)
+{
+	of_dma_router_free(pdev->dev.of_node);
+}
+
 static struct platform_driver stm32_dmamux_driver = {
 	.probe	= stm32_dmamux_probe,
+	.remove	= stm32_dmamux_remove,
 	.driver = {
 		.name = "stm32-dmamux",
 		.of_match_table = stm32_dmamux_match,

-- 
2.43.0


