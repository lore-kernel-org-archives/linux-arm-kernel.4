Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BB1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HzvmRSM5;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=dobRqtj3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G6zpXeiIeKAE9FMxVV9jmnKUdIaXqsaJlP1REKuSc/w=; b=HzvmRSM5EL4waC
	bPlamOq/jkd9lRPEiUt5MKFV7DVOP9En2pnsaTeAh81Jwia/wW1IMlm5D/YfDtgA8OMJ7peA5GF1X
	LIXJTKnnLEvMAlLl8yWVdRCc5GaJCIGEExSK30LpipdNZhcQyn7aE9cfrjGlMLCCw/qBctHpfJbQl
	yBTHna6XWIkiPjAKiRNkFi1L94LRbVBYalq6VNRV3ylwuygTK/hUTSjVKCa55yP5LudffT58pLdKE
	/Tsgltes4Nb2I/PjBuWJHwfiryuQ3Nd8lh4F/KXNiZCFubklyfmgq0ihcydQG8QwZapEzmQhgF7gZ
	U3O1Ki98RGblI4QWdvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEwK-00000000bAz-3Nkn;
	Sat, 28 Nov 2026 09:41:52 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEvt-00000000b19-0tam
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:41:26 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b080b;
	Sat, 28 Nov 2026 17:41:22 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: tglx@kernel.org,
	nm@ti.com,
	kristo@kernel.org,
	ssantosh@kernel.org,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	ioana.ciornei@nxp.com,
	alexander.stein@ew.tq-group.com,
	maz@kernel.org,
	lokeshvutla@ti.com,
	yamada.masahiro@socionext.com,
	robh@kernel.org
Cc: radu@rendec.net,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] irqchip/uniphier-aidet: Remove the interrupt domain on unbind
Date: Sat, 28 Nov 2026 17:41:21 +0800
Message-ID: <20261128-f81b700d6c-u38-3@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u38-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u38-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa22187ddc703a1kunmb49228b5451d55
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHktMVktOQ0pLHUxDTUJDHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=dobRqtj3yI8TF/PgsDd/2A2Y3Tp2p270kRrVBmvtPErAQCuyadbBDzlpjOjgYAZpNf32R43wR88fTBNBLePKZqan6UirIpLV5vcRmkFjEfl27NAw/YmDhowH6zVhw1Lp1ywyNamjsvn+5dvRRoe8poL60wyhztxuhB1BnFSHBFE=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=G6zpXeiIeKAE9FMxVV9jmnKUdIaXqsaJlP1REKuSc/w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014125_729953_C486A44C 
X-CRM114-Status: GOOD (  10.57  )
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

The interrupt domain remains registered after device removal frees
its controller data. Remove it before devres releases the register
mapping and private structure.

This issue was found by our static analysis tool under development.

Fixes: 5ed34d3a4387 ("irqchip: Add UniPhier AIDET irqchip driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/irqchip/irq-uniphier-aidet.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-uniphier-aidet.c b/drivers/irqchip/irq-uniphier-aidet.c
index dca3c6003539..a6cfe75c1989 100644
--- a/drivers/irqchip/irq-uniphier-aidet.c
+++ b/drivers/irqchip/irq-uniphier-aidet.c
@@ -198,6 +198,13 @@ static int uniphier_aidet_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void uniphier_aidet_remove(struct platform_device *pdev)
+{
+	struct uniphier_aidet_priv *priv = platform_get_drvdata(pdev);
+
+	irq_domain_remove(priv->domain);
+}
+
 static int __maybe_unused uniphier_aidet_suspend(struct device *dev)
 {
 	struct uniphier_aidet_priv *priv = dev_get_drvdata(dev);
@@ -242,6 +249,7 @@ static const struct of_device_id uniphier_aidet_match[] = {
 
 static struct platform_driver uniphier_aidet_driver = {
 	.probe = uniphier_aidet_probe,
+	.remove = uniphier_aidet_remove,
 	.driver = {
 		.name = "uniphier-aidet",
 		.of_match_table = uniphier_aidet_match,

-- 
2.43.0


