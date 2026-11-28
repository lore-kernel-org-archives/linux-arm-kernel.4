Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0242606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F06ysxND;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=e/YDwsZ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=d4dDXttwlGHeRb7uEb4nDp+OKjr4bIrP/DgYATn9WDE=; b=F06ysxND8vz+qbSCTl0uGfIuir
	GtXh4a7/Q3X2zkAGWNMyO4cuqV615MzbXW34w2DNtNzZ+oYKINwAl0Eon97hzCptpNhPOPaoPqPva
	DhME+ONE/I3a/ALn0cKmcd5cWdJsF0TsriAED8IW5+g0/384OqB7jnUs85y7qMi+fuOPy8RdFC0m1
	0rz9IezW+HxEkIVXi/MzNXOcIcPfx05EdnF7U5EO+8+xXmuEvEcRkcMhlSJau9MZbLcFoWpGgXgxf
	8KZ6rofbxhseQU3kN8n03lSYbdasH5qhMdo8cZGesMFEJiE24KdxB3hEb3Fu3CKJZnj6c6w/3GquP
	9fNbYZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGCQ-00000000hNJ-1CyV;
	Sat, 28 Nov 2026 11:02:34 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGCM-00000000hMF-3yUR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 11:02:33 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652a8;
	Sat, 28 Nov 2026 19:02:23 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: ulfh@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH] pmdomain: sunxi: Unregister D1 PPU domains on driver removal
Date: Sat, 28 Nov 2026 19:02:22 +0800
Message-Id: <20261128110222.875356-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa221d20bc903a2kunme53ad92e3cbc59
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0xOVkwaSU1PTElOHkxOGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=e/YDwsZ7WDymsmTSH2Qcs6s1zuicC05BI3FDN8QvlURXCtUACudjai744dRShqDhOu+FBBkkMfzVo0zpDL+qxih9QaIOtGwBOrSpDkojYdu0n+YnKYliTdgpxRtQSmM206N6moYsFwK5SgVua3C8OL3NJ14btuOLwhwazxmbCYo=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=d4dDXttwlGHeRb7uEb4nDp+OKjr4bIrP/DgYATn9WDE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_030231_860520_292BD06E 
X-CRM114-Status: GOOD (  12.12  )
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

The D1 PPU driver leaves its provider and power domains registered on
module unload. Delete the provider and remove each domain that was
initialized. Also unwind these domains if provider registration fails.

This issue was found by our static analysis tool under development.

Fixes: 0e30ca5ab0a8 ("soc: sunxi: Add Allwinner D1 PPU driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pmdomain/sunxi/sun20i-ppu.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/sunxi/sun20i-ppu.c b/drivers/pmdomain/sunxi/sun20i-ppu.c
index 6af1dcad4a76..7a539e09f614 100644
--- a/drivers/pmdomain/sunxi/sun20i-ppu.c
+++ b/drivers/pmdomain/sunxi/sun20i-ppu.c
@@ -99,6 +99,19 @@ static int sun20i_ppu_pd_power_off(struct generic_pm_domain *genpd)
 	return sun20i_ppu_pd_set_power(pd, false);
 }
 
+static void sun20i_ppu_remove_domains(struct genpd_onecell_data *ppu)
+{
+	for (unsigned int i = 0; i < ppu->num_domains; i++)
+		if (ppu->domains[i])
+			pm_genpd_remove(ppu->domains[i]);
+}
+
+static void sun20i_ppu_remove(struct platform_device *pdev)
+{
+	of_genpd_del_provider(pdev->dev.of_node);
+	sun20i_ppu_remove_domains(platform_get_drvdata(pdev));
+}
+
 static int sun20i_ppu_probe(struct platform_device *pdev)
 {
 	const struct sun20i_ppu_desc *desc;
@@ -164,10 +177,12 @@ static int sun20i_ppu_probe(struct platform_device *pdev)
 	}
 
 	ret = of_genpd_add_provider_onecell(dev->of_node, ppu);
-	if (ret)
+	if (ret) {
 		dev_warn(dev, "Failed to add provider: %d\n", ret);
+		sun20i_ppu_remove_domains(ppu);
+	}
 
-	return 0;
+	return ret;
 }
 
 static const char *const sun20i_d1_ppu_pd_names[] = {
@@ -224,6 +239,7 @@ MODULE_DEVICE_TABLE(of, sun20i_ppu_of_match);
 
 static struct platform_driver sun20i_ppu_driver = {
 	.probe	= sun20i_ppu_probe,
+	.remove	= sun20i_ppu_remove,
 	.driver	= {
 		.name			= "sun20i-ppu",
 		.of_match_table		= sun20i_ppu_of_match,

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0


