Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2761606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wx+OkPCz;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=UL4N2UUj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3CAosbaI5LjZjgDzCWrtpfTjHB3ppxaqxWfqT3R7ekg=; b=wx+OkPCzsJn0w4
	z1V5wnqOZkbzpEoD5oZSE+j3+ZAY60PPyphv4OU3W/HrhaBXG7Gw5bt6aEMZJYNKW1QTJLW23wNaJ
	06JBu2Ob2K7iqQV/NvMZ9AO2O4mOgt15sXC8ZSbIFZW/paifKwRXml4hORwcMK8v0laPxiZoJiOg+
	tsNJ6KEOnxQJRa5ALYxehxQ6KkGaMdVqL2iOLmiGNpp3z3RvTtZdUEeCIDiQJQ+gZUQzT76WeND/H
	b5UgkYO4j3AxxiT+w4bc/un6ea3keEyVGOPI2zS/5V9SWS1mjf/8RTb3/Zt7oZFUOykxbbS7MS0AE
	TRAepQHPQCNnLrxGsevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF04-00000000bzz-1Y6z;
	Sat, 28 Nov 2026 09:45:44 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF01-00000000byv-2JNW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:45:43 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0883;
	Sat, 28 Nov 2026 17:45:37 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	m202171776@hust.edu.cn,
	peng.fan@nxp.com,
	dzm91@hust.edu.cn,
	lyx2022@hust.edu.cn,
	zero12113@hust.edu.cn,
	mr.bossman075@gmail.com
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] clk: imx: Manage the OF clock providers for i.MX8M and i.MX93
Date: Sat, 28 Nov 2026 17:45:36 +0800
Message-ID: <20261128-f81b700d6c-u08-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u08-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u08-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218bc4a003a1kunm51837f624520c0
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0lNVhgYS0odTkpPQ04fSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=UL4N2UUjMvTKQaP3HkglMmjabxAWzwTwyt0mcNU0IORrI3cnAnQRST4GiBHAg4Duu/cTC/W87URiFLaRXJcqLKXMoKV7vxswPS96DIbAHPa3uICN1j0j5JeAhW9y0hwXaRuD/2uGiz5fPd5xDnqJUxTQwWp4kkFh+5wyTCL51vY=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=3CAosbaI5LjZjgDzCWrtpfTjHB3ppxaqxWfqT3R7ekg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014542_036690_218D0660 
X-CRM114-Status: GOOD (  10.32  )
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

The i.MX8MN, i.MX8MP, i.MX8MQ and i.MX93 clock drivers register an OF
provider backed by a device-managed lookup table. When a modular
controller can be unloaded, the provider survives the table it points
to.

Manage the provider on the same device so OF stops exposing the clock
table before devres frees it.

This issue was found by our static analysis tool under development.

Fixes: 188d070de913 ("clk: imx: clk-imx8mn: fix memory leak in imx8mn_clocks_probe")
Fixes: 878b02d5f3b5 ("clk: imx: clk-imx8mp: improve error handling in imx8mp_clocks_probe()")
Fixes: 577ad169966e ("clk: imx: imx8mq: correct error handling path")
Fixes: e02ba11b4576 ("clk: imx93: fix memory leak and missing unwind goto in imx93_clocks_probe")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/imx/clk-imx8mn.c | 2 +-
 drivers/clk/imx/clk-imx8mp.c | 2 +-
 drivers/clk/imx/clk-imx8mq.c | 2 +-
 drivers/clk/imx/clk-imx93.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 9d4c3064dd2c..3d9f54c00d34 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -596,7 +596,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 
 	imx_check_clk_hws(hws, IMX8MN_CLK_END);
 
-	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
 	if (ret < 0) {
 		dev_err(dev, "failed to register hws for i.MX8MN\n");
 		goto unregister_hws;
diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index c621beb1fa0a..a41616776dc7 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -866,7 +866,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 			imx8mp_clocks_apply_constraints(imx8mp_clock_overdrive_constraints);
 	}
 
-	err = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	err = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
 	if (err < 0) {
 		dev_err(dev, "failed to register hws for i.MX8MP\n");
 		imx_unregister_hw_clocks(hws, IMX8MP_CLK_END);
diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index a1f34e05ef77..ddb2d4a43ce4 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -598,7 +598,7 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 
 	imx_check_clk_hws(hws, IMX8MQ_CLK_END);
 
-	err = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	err = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
 	if (err < 0) {
 		dev_err(dev, "failed to register hws for i.MX8MQ\n");
 		goto unregister_hws;
diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index 1f10833659df..8c7373ca4441 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -354,7 +354,7 @@ static int imx93_clocks_probe(struct platform_device *pdev)
 
 	imx_check_clk_hws(clks, IMX93_CLK_END);
 
-	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
 	if (ret < 0) {
 		dev_err(dev, "failed to register clks for i.MX93\n");
 		goto unregister_hws;

-- 
2.43.0


