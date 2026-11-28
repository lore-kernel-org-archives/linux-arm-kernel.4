Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E68606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K8h8joH+;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=hgfrwKOf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J7Fs05yPvDNnxfp5t8iZasYTqJjHjlzO5ppNysDHxVA=; b=K8h8joH+fSykfF
	tvJwNpsmYeoTwBKKo9Z6TiP0vzixgwpcW22v05l53zZPwlSTpd8WYQwBjzwEH+qqFR7h1qDUqkf5/
	pe5PrP611loIl4+S3TToRPCXcEoSddNVpj10fZ8vTQM58YP4fNPH1mQsxofGBcm+BGYVB2rvGj7Y5
	Kx4c+Dp5ef3YNH1xuWEPvrgU1/REKCsW3gc9vDkcF0f2qMXIo3vzpDCVLh1yyKnsA+E0jcBnHTUca
	Z3ju7FAelie9CH31uVd80Zbd4KtMQtMlVsYY9mett3oZFRanB0TejwQ8VZkKVHh1y5pApk/J/2a8k
	7VyODv6Ps073zvzYY9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEua-00000000ahW-2ta9;
	Sat, 28 Nov 2026 09:40:04 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEuX-00000000afs-020u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:40:03 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b07c2;
	Sat, 28 Nov 2026 17:39:51 +0800 (GMT+08:00)
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
Subject: [PATCH 1/3] clk: sunxi: Release the platform mod0 clock before unmapping it
Date: Sat, 28 Nov 2026 17:39:51 +0800
Message-ID: <20261128-f81b700d6c-u17-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa221867d9303a1kunmd7238825451bd9
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaShlNVhlNQ0hNTx4aTE5DGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	JKVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=hgfrwKOflp+uwRyH9vL2MQC/os7gbFacmpgeuD0Ga5uN6sgfTTJHupzO4XbwpK+yK0F/ZY2lQzJr8c6AjliJZHAecbF7Q/rUdpIfsE0AuqlosQ56RVg5kBHnJnXbkGuPg8d7GsrUSaQbt9v6tXcYjCQP8gl68hsfwirppVRo/Uo=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=J7Fs05yPvDNnxfp5t8iZasYTqJjHjlzO5ppNysDHxVA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014001_288575_5776899F 
X-CRM114-Status: GOOD (  12.77  )
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

The mod0 platform driver leaves the composite clock and its OF provider
registered when devres unmaps the clock registers. Save the clock
created by the platform probe and unregister it on remove.

The unregister helper receives the composite clk_hw. Use its rate
component to recover the factors, then release the composite and its
parts.

This issue was found by our static analysis tool under development.

Fixes: 6ea3953da4e6 ("clk: sunxi: Make the mod0 clk driver also a platform driver")
Fixes: 4cbeaebb8af1 ("clk: sunxi: factors: Add unregister function")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/sunxi/clk-factors.c |  5 ++---
 drivers/clk/sunxi/clk-mod0.c    | 12 ++++++++++--
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
index 149187f189d6..14a84534011e 100644
--- a/drivers/clk/sunxi/clk-factors.c
+++ b/drivers/clk/sunxi/clk-factors.c
@@ -293,11 +293,10 @@ void sunxi_factors_unregister(struct device_node *node, struct clk *clk)
 	if (!hw)
 		return;
 
-	factors = to_clk_factors(hw);
+	factors = to_clk_factors(to_clk_composite(hw)->rate_hw);
 
 	of_clk_del_provider(node);
-	/* TODO: The composite clock stuff will leak a bit here. */
-	clk_unregister(clk);
+	clk_unregister_composite(clk);
 	kfree(factors->mux);
 	kfree(factors->gate);
 	kfree(factors);
diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
index b409a8d70962..e9ecdbe02fe8 100644
--- a/drivers/clk/sunxi/clk-mod0.c
+++ b/drivers/clk/sunxi/clk-mod0.c
@@ -89,6 +89,7 @@ static int sun4i_a10_mod0_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	void __iomem *reg;
+	struct clk *clk;
 
 	if (!np)
 		return -ENODEV;
@@ -97,11 +98,17 @@ static int sun4i_a10_mod0_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
-	sunxi_factors_register(np, &sun4i_a10_mod0_data,
-			       &sun4i_a10_mod0_lock, reg);
+	clk = sunxi_factors_register(np, &sun4i_a10_mod0_data,
+				     &sun4i_a10_mod0_lock, reg);
+	platform_set_drvdata(pdev, clk);
 	return 0;
 }
 
+static void sun4i_a10_mod0_clk_remove(struct platform_device *pdev)
+{
+	sunxi_factors_unregister(pdev->dev.of_node, platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id sun4i_a10_mod0_clk_dt_ids[] = {
 	{ .compatible = "allwinner,sun4i-a10-mod0-clk" },
 	{ /* sentinel */ }
@@ -113,6 +120,7 @@ static struct platform_driver sun4i_a10_mod0_clk_driver = {
 		.of_match_table = sun4i_a10_mod0_clk_dt_ids,
 	},
 	.probe = sun4i_a10_mod0_clk_probe,
+	.remove = sun4i_a10_mod0_clk_remove,
 };
 builtin_platform_driver(sun4i_a10_mod0_clk_driver);
 

-- 
2.43.0


