Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B93606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b1iwqHS9;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ZUp3FM+B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l7FZGp9xH2kLtiUEhQrOK84mZ04vEfjug+fKkzUMnLQ=; b=b1iwqHS9bTwaZh
	3tEWC3fwvW/5PlrlSOlg4eB1SuKSexMKeiDn0bM9UJzO0psQWmLDVC+nkchzWwlmxVpbE2AaXhj6X
	iGCNn5Ed0Ntt1MLjirjT5WKT1V9XDJ8PdafBOkE3eQJJXY9IEnz+EgIup/+CFxqilq3jLh0/sZdcP
	G4YBlyA7viuc7FJZ2ByB1qPC8B2QjS6JnhEPFsr/wVAXBbJPJUCyFiRdtWm/CDaaK4P09mR+GC0DZ
	x+ckuGZnnxf7f3jp2jaRCNTq0yczf8J5KPJP+2tOYc/4jxxlcJClK2ezeGNO+6U8DFmM12UWhgfRh
	t9enhk2Kordfzdp9XQQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEum-00000000ajT-0y5Y;
	Sat, 28 Nov 2026 09:40:16 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEuW-00000000afw-1KFV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:40:03 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b07c6;
	Sat, 28 Nov 2026 17:39:54 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: emilio@elopez.com.ar,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	hansg@kernel.org,
	bbrezillon@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/3] clk: sunxi: Unregister the A31 and A23 APB0 platform clocks
Date: Sat, 28 Nov 2026 17:39:53 +0800
Message-ID: <20261128-f81b700d6c-u17-2@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218686e103a1kunm88140372451bdf
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTkNPVktKT01KTx4ZGEtPGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZUp3FM+BdBtVh8Ru+GFdjUC6jQEY8WlzJOW7U+DXYZqi9ZaWNjrjsoF91ILn8M6DYYTObrgWmVUkKXn/1PEvJm7fD6Hk96iCLNIK9w0qwogKUZ3vRMYfxJrRXNV8TjIpKVfUE/Z8mwv6DIe/i4+NE3yFIPaLj1nFkYI5qLFeNsQ=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=l7FZGp9xH2kLtiUEhQrOK84mZ04vEfjug+fKkzUMnLQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014001_177478_003B9A6E 
X-CRM114-Status: GOOD (  12.54  )
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

The A31 and A23 APB0 platform drivers register a divider backed by a
device-managed mapping. The clock and its OF provider can remain live
after the mapping is released.

Manage both registrations on A31. On A23, pair the platform registration
with removal while keeping the early DT clock independent.

This issue was found by our static analysis tool under development.

Fixes: c8a76cac19ee ("clk: sunxi: add PRCM (Power/Reset/Clock Management) clks support")
Fixes: 57a1fbf28424 ("clk: sunxi: Add A23 APB0 divider clock support")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/sunxi/clk-sun6i-apb0.c | 13 ++++++-------
 drivers/clk/sunxi/clk-sun8i-apb0.c | 13 ++++++++++++-
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sun6i-apb0.c b/drivers/clk/sunxi/clk-sun6i-apb0.c
index f80c67bafe38..a15a2319eee9 100644
--- a/drivers/clk/sunxi/clk-sun6i-apb0.c
+++ b/drivers/clk/sunxi/clk-sun6i-apb0.c
@@ -33,7 +33,7 @@ static int sun6i_a31_apb0_clk_probe(struct platform_device *pdev)
 	const char *clk_name = np->name;
 	const char *clk_parent;
 	void __iomem *reg;
-	struct clk *clk;
+	struct clk_hw *hw;
 
 	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
@@ -45,13 +45,12 @@ static int sun6i_a31_apb0_clk_probe(struct platform_device *pdev)
 
 	of_property_read_string(np, "clock-output-names", &clk_name);
 
-	clk = clk_register_divider_table(&pdev->dev, clk_name, clk_parent,
-					 0, reg, 0, 2, 0, sun6i_a31_apb0_divs,
-					 NULL);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	hw = devm_clk_hw_register_divider_table(&pdev->dev, clk_name, clk_parent,
+						0, reg, 0, 2, 0, sun6i_a31_apb0_divs, NULL);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
 
-	return of_clk_add_provider(np, of_clk_src_simple_get, clk);
+	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get, hw);
 }
 
 static const struct of_device_id sun6i_a31_apb0_clk_dt_ids[] = {
diff --git a/drivers/clk/sunxi/clk-sun8i-apb0.c b/drivers/clk/sunxi/clk-sun8i-apb0.c
index f605ecca879f..61d9b8a844af 100644
--- a/drivers/clk/sunxi/clk-sun8i-apb0.c
+++ b/drivers/clk/sunxi/clk-sun8i-apb0.c
@@ -95,7 +95,17 @@ static int sun8i_a23_apb0_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(reg);
 
 	clk = sun8i_a23_apb0_register(np, reg);
-	return PTR_ERR_OR_ZERO(clk);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	platform_set_drvdata(pdev, clk);
+	return 0;
+}
+
+static void sun8i_a23_apb0_clk_remove(struct platform_device *pdev)
+{
+	of_clk_del_provider(pdev->dev.of_node);
+	clk_unregister_divider(platform_get_drvdata(pdev));
 }
 
 static const struct of_device_id sun8i_a23_apb0_clk_dt_ids[] = {
@@ -109,5 +119,6 @@ static struct platform_driver sun8i_a23_apb0_clk_driver = {
 		.of_match_table = sun8i_a23_apb0_clk_dt_ids,
 	},
 	.probe = sun8i_a23_apb0_clk_probe,
+	.remove = sun8i_a23_apb0_clk_remove,
 };
 builtin_platform_driver(sun8i_a23_apb0_clk_driver);

-- 
2.43.0


