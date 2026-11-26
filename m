Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A93606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ehc9pFUQ;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=W1G/xKMS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K0fTtBZCCQIk+Resl0yJT5nGklgp5fQhOBmhfcJ+hxc=; b=Ehc9pFUQBSecV1
	lTmRwgpMn+hSYx9hSr7vV7sdpZwmyvYTlzYj/Eym/9n8bH+MtF0QiCXEGAfmtdM74rBGc5UqcOojW
	RDe6t3zjOBDqv2kYsnMFIB9K6YC2d/qImaQeaOPEk7VqEGF89BtiX+pwdVpFq8UU7tKsgfujqPgzs
	NuYD9oS446lK3q1TVHOpi0RTQPU80Z+ZxHydulY7/hqF0YEpbZkFx6f+wzLDlvvCKbrj9BUoyibu2
	aQouJT7ALCspqZQEZYDXObE8vJc7WzsD6sfNifUxceoRL8d92jY8jDCpHGJ3x5XLI9NnycKtdyVBe
	PUVomUvAFsaUfdkOufLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWr-0000000DLq2-1lys;
	Thu, 26 Nov 2026 13:28:49 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWG-0000000DLXd-2UKJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:28:15 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcbb;
	Thu, 26 Nov 2026 21:28:09 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 2/2] dmaengine: lpc32xx-dmamux: Unregister the DMA router on removal
Date: Thu, 26 Nov 2026 21:28:06 +0800
Message-Id: <20261126132806.4091183-3-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126132806.4091183-1-202300460064@mail.sdu.edu.cn>
References: <20261126132806.4091183-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2180ac63c03a2kunme5d0c11035d963
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTUlJVhhNH0xCSUMYH0wYTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=W1G/xKMSx7UEkSRjs+GjF2uNYd+P8ulHDcsULEH92rnnx/IGmbsuL0+hQ+KimXD+l6TYBo1v+LTxHWGltogynqiqnYiZhPHMRGqIDC78VKT52lVF0A+cVnVmMaaohgLmHMfljZ/tEBIy7waf+/L10Ox9oXV3CCJo2VIFqb+/OIE=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=K0fTtBZCCQIk+Resl0yJT5nGklgp5fQhOBmhfcJ+hxc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_052814_591939_6FAFFF1B 
X-CRM114-Status: GOOD (  10.78  )
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

Fixes: 5d318b595982 ("dmaengine: Add dma router for pl08x in LPC32XX SoC")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/lpc32xx-dmamux.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/lpc32xx-dmamux.c b/drivers/dma/lpc32xx-dmamux.c
index 4fbeb3496acf..397640aacd8e 100644
--- a/drivers/dma/lpc32xx-dmamux.c
+++ b/drivers/dma/lpc32xx-dmamux.c
@@ -184,6 +184,11 @@ static int lpc32xx_dmamux_probe(struct platform_device *pdev)
 				      &dmamux->dmarouter);
 }
 
+static void lpc32xx_dmamux_remove(struct platform_device *pdev)
+{
+	of_dma_router_free(pdev->dev.of_node);
+}
+
 static const struct of_device_id lpc32xx_dmamux_match[] = {
 	{ .compatible = "nxp,lpc3220-dmamux" },
 	{},
@@ -191,6 +196,7 @@ static const struct of_device_id lpc32xx_dmamux_match[] = {
 
 static struct platform_driver lpc32xx_dmamux_driver = {
 	.probe	= lpc32xx_dmamux_probe,
+	.remove	= lpc32xx_dmamux_remove,
 	.driver = {
 		.name = "lpc32xx-dmamux",
 		.of_match_table = lpc32xx_dmamux_match,

-- 
2.43.0


