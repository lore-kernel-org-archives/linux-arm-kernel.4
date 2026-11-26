Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B42606A680
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y/IBpN5G;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ffG5EsP8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OfJl/3qvWQ96HZ0/MhaHRr6gto4HfhpK3vhDKRrOjmY=; b=y/IBpN5GPlQfYu
	t9Wt8quEm0xx6p7d7AeTaOoQrnuUVJ/4qYPqJa4QMrk13/c34NpxJtae2nJ4bQY0jXW0VqN+fwwdx
	u2y7RJhW5TD3RXOFUNrw3jILhl5SvJ3XDJ4xt1YpoydKlIZH48XmX8UC/xsApWL+zgCf4MhKJ7uC2
	F1YkEwvVd0BKHCu+8TjiDYs5S3bDYb4sbc1jw8ZbiOJduOOQ7NNWx1qUaGFNmVpcat7vXJbq/wono
	sttg2Tr+iOUnsQriz7VgZgqJ4DFVpU5v5Xh+w7CA7MKuD3U8iaBy2XoxmQ+ypQ3hReQFiatMMUBLq
	vPA9vKaDZnk1Gn7yWJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWT-0000000DLaz-1nsy;
	Thu, 26 Nov 2026 13:28:25 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZW4-0000000DLRD-481j;
	Thu, 26 Nov 2026 13:28:02 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcac;
	Thu, 26 Nov 2026 21:27:57 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: rafal@milecki.pl,
	florian.fainelli@broadcom.com,
	ulfh@kernel.org,
	noltari@gmail.com,
	alex.aring@gmail.com,
	eric@anholt.net,
	khilman@linaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 1/3] pmdomain: bcm: Unregister PMB power domains on unbind
Date: Thu, 26 Nov 2026 21:27:53 +0800
Message-Id: <20261126132755.4091008-2-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126132755.4091008-1-202300460064@mail.sdu.edu.cn>
References: <20261126132755.4091008-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2180a976f03a2kunm345e734035d93c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTU4fVkNMTBhKTxhOSUxDQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=ffG5EsP8xNGNW1lDF5CVdPi7slxD9y01MEMCNwA9jW7uRy8HEFn7eo/Grtqpa7egbAqrQvU7D8HfmiAIwOKYCz8ruvRESNcYfDq+e5TDMkNQhLhzL2ithrbfFAxTwLlsPrlgQr+d7uyVEOdJCOgA1gacRwt89twqFxr4aXxpdjU=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=OfJl/3qvWQ96HZ0/MhaHRr6gto4HfhpK3vhDKRrOjmY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_052801_455506_A04B75FA 
X-CRM114-Status: GOOD (  14.41  )
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

The PMB provider and its domains remain registered after the driver
releases their storage. Delete the provider before the domains on unbind
and remove initialized domains if a later registration or allocation
fails.

This issue was found by our static analysis tool under development.

Fixes: 8bcac4011ebe ("soc: bcm: add PM driver for Broadcom's PMB")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pmdomain/bcm/bcm-pmb.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/bcm/bcm-pmb.c b/drivers/pmdomain/bcm/bcm-pmb.c
index d074c8cf2038..22b84c4d85a6 100644
--- a/drivers/pmdomain/bcm/bcm-pmb.c
+++ b/drivers/pmdomain/bcm/bcm-pmb.c
@@ -270,6 +270,21 @@ static int bcm_pmb_power_off(struct generic_pm_domain *genpd)
 	}
 }
 
+static void bcm_pmb_remove_domains(struct bcm_pmb *pmb)
+{
+	int i;
+
+	for (i = pmb->genpd_onecell_data.num_domains - 1; i >= 0; i--)
+		if (pmb->genpd_onecell_data.domains[i])
+			pm_genpd_remove(pmb->genpd_onecell_data.domains[i]);
+}
+
+static void bcm_pmb_remove(struct platform_device *pdev)
+{
+	of_genpd_del_provider(pdev->dev.of_node);
+	bcm_pmb_remove_domains(platform_get_drvdata(pdev));
+}
+
 static int bcm_pmb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -311,8 +326,10 @@ static int bcm_pmb_probe(struct platform_device *pdev)
 	for (e = table; e->name; e++) {
 		struct bcm_pmb_pm_domain *pd = devm_kzalloc_obj(dev, *pd);
 
-		if (!pd)
-			return -ENOMEM;
+		if (!pd) {
+			err = -ENOMEM;
+			goto err_remove_domains;
+		}
 
 		pd->pmb = pmb;
 		pd->data = e;
@@ -320,17 +337,24 @@ static int bcm_pmb_probe(struct platform_device *pdev)
 		pd->genpd.power_on = bcm_pmb_power_on;
 		pd->genpd.power_off = bcm_pmb_power_off;
 
-		pm_genpd_init(&pd->genpd, NULL, true);
+		err = pm_genpd_init(&pd->genpd, NULL, true);
+		if (err)
+			goto err_remove_domains;
 		pmb->genpd_onecell_data.domains[e->id] = &pd->genpd;
 	}
 
 	err = of_genpd_add_provider_onecell(dev->of_node, &pmb->genpd_onecell_data);
 	if (err) {
 		dev_err(dev, "failed to add genpd provider: %d\n", err);
-		return err;
+		goto err_remove_domains;
 	}
 
+	platform_set_drvdata(pdev, pmb);
 	return 0;
+
+err_remove_domains:
+	bcm_pmb_remove_domains(pmb);
+	return err;
 }
 
 static const struct bcm_pmb_pd_data bcm_pmb_bcm4908_data[] = {
@@ -358,6 +382,7 @@ static struct platform_driver bcm_pmb_driver = {
 		.of_match_table = bcm_pmb_of_match,
 	},
 	.probe  = bcm_pmb_probe,
+	.remove = bcm_pmb_remove,
 };
 
 builtin_platform_driver(bcm_pmb_driver);
-- 
2.43.0


