Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B65606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Do3uKBCb;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=BLWEzal4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nELR0AG6ykj7IewQ+VEaOZ+4U+W09QWTbbBa1f2/xd4=; b=Do3uKBCbzUqpj4
	/cglX2DF/i2HzMBKy3akKcXBGfC6LoXTBIlrLLLUb6qXTXKdMpERv17/vVn8EymEQpcibmQ9Tx9Er
	1igY7PrLQtmMgM8j2iXb3F1MFIpC3JuJtzkTDO27G5l6ak06Wejyr9Qzrui2k/dJuJSO2/V6V/mI2
	5lsS8cYNgSKctQ4C7rMpWMuNaaXH4Avoid5iwspAOdY49MBobgm4+L5BWj2kfvRu7wdJLFVN0ooPd
	bjtvWp00PUsCQd4PjSSGdSxFV6JF2BAHTAKGntJCF52KEGhNKz03aQ/r7emXQJccJK0cyDGbCIMpd
	YPyGAZVStMwRp7QbAY5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUoQ-0000000CO9h-1Jgu;
	Thu, 26 Nov 2026 08:26:38 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUo5-0000000CNvJ-1jS6;
	Thu, 26 Nov 2026 08:26:18 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5617268ff;
	Thu, 26 Nov 2026 16:26:07 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: angelogioacchino.delregno@collabora.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	drinkcat@chromium.org,
	weiyi.lu@mediatek.com,
	msp@baylibre.com,
	fparent@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] clk: mediatek: mt8167: Unregister apmixedsys clocks on unbind
Date: Thu, 26 Nov 2026 16:26:06 +0800
Message-ID: <20261126-a35bb25eb5-u14-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
References: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa216f6415103a1kunm20e7a42e3c29de
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTx1IVk8fTEkYQk1NSU9CTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=BLWEzal4XvSB1FtMRPcR2zi66u/DFRv2/3iDFIo85SpEAU+jnFM55EMrlLMJduJLM1Sg9PN1gPlChu9BtPNDfhbOYzh2NDvL6jAEJQRmeXOUxbG+OjaDWecAnHJ7PJNx1xL72rD5HC+YtbCHaHLWLVLVIokAzu9mFZjTtkj12Lk=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=nELR0AG6ykj7IewQ+VEaOZ+4U+W09QWTbbBa1f2/xd4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002617_638377_23E16DF4 
X-CRM114-Status: GOOD (  12.35  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The apmixedsys driver leaves the OF provider and clocks registered
on unbind. The clock table is device-managed, so the provider can
retain a pointer to released storage.

Remove the provider and unregister the dividers and PLLs during removal.

This issue was found by our static analysis tool under development.

Fixes: b27284336aa4 ("clk: mediatek: mt8167: Move apmixedsys as platform_driver in new file")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index fb6c21bbeef8..70fc5e5215e5 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -118,6 +118,8 @@ static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_dividers;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_dividers:
@@ -128,6 +130,15 @@ static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void clk_mt8167_apmixed_remove(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+}
+
 static const struct of_device_id of_match_clk_mt8167_apmixed[] = {
 	{ .compatible = "mediatek,mt8167-apmixedsys" },
 	{ /* sentinel */ }
@@ -136,6 +147,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_apmixed);
 
 static struct platform_driver clk_mt8167_apmixed_drv = {
 	.probe = clk_mt8167_apmixed_probe,
+	.remove = clk_mt8167_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8167-apmixed",
 		.of_match_table = of_match_clk_mt8167_apmixed,
-- 
2.43.0


