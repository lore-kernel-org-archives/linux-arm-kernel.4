Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0142606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wxGMmfOq;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ghwnPl3W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1iiyAT9AAkImriSAkCuGBq7hfmlUIBgJJjwrPdzvpWA=; b=wxGMmfOq9Yt5NBiIl0f8JWzxSX
	EhKo2Q9et/O2MD8M71vh5kpzuvPuVpadMApN4RlO8EmnEZtunh35SpIb0PNZyTDG7iSeek9G0skfs
	TZT2By8NUpgaCogaIh9MJxo7n+FX16aWIQauXaMU857uwQzzs3mVmRaado7kVCjnwJ5H1oblrUBSn
	IbEwYni/1UaoREUrKpTasU0dykCU+dG9ih0pWoEtJ+imzCcroy00660+rZT8gkZ8Eh/1ExbW8ZfB4
	0dXgRnNN3ooNHZYPGXBa1W73EUQLhVOR4O+/mGhXIpi3dnuAyqOiu6n/G5yKAfVtvu4q6ndcK9eCa
	4Xr3yWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGCQ-00000000hNO-1han;
	Sat, 28 Nov 2026 11:02:34 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGCM-00000000hME-482n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 11:02:33 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652a6;
	Sat, 28 Nov 2026 19:02:21 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: sudeep.holla@kernel.org,
	ulfh@kernel.org,
	khilman@baylibre.com,
	tixy@linaro.org
Cc: cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH] pmdomain: arm: Unregister SCPI domains on removal
Date: Sat, 28 Nov 2026 19:02:20 +0800
Message-Id: <20261128110220.875342-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa221d2053e03a2kunm50e636623cbc57
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHxhMVksYSx5PGU4dTEtKQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=ghwnPl3WXP8VS77kfF/XDfU3Wv8UjAX3ZoOQJQKxpCwDxM7J6G+ob2KIxJX39zASMO1KV9cySFOHfsHtmsgNSFh5WJqBZyMQ6TuA/dNX9ZPQGIPqsyzpb2ul9QD/1+D+T9kQrzCSGqrUOMh012/lBtOm+8qAcMjHAb1tOE/XY+E=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=1iiyAT9AAkImriSAkCuGBq7hfmlUIBgJJjwrPdzvpWA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_030231_857166_D1205A65 
X-CRM114-Status: GOOD (  13.67  )
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

The SCPI driver releases its domain storage on removal without
unregistering the provider or domains. Remove the provider before
freeing its domains and unwind previously initialized domains if probe
fails.

This issue was found by our static analysis tool under development.

Fixes: 8bec4337ad40 ("firmware: scpi: add device power domain support using genpd")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pmdomain/arm/scpi_pm_domain.c | 41 +++++++++++++++++++++------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/pmdomain/arm/scpi_pm_domain.c b/drivers/pmdomain/arm/scpi_pm_domain.c
index 1d55a9e548e0..d9fa5ef7c1ec 100644
--- a/drivers/pmdomain/arm/scpi_pm_domain.c
+++ b/drivers/pmdomain/arm/scpi_pm_domain.c
@@ -62,6 +62,21 @@ static int scpi_pd_power_off(struct generic_pm_domain *domain)
 	return scpi_pd_power(pd, false);
 }
 
+static void scpi_pm_remove_domains(struct genpd_onecell_data *data)
+{
+	int i;
+
+	for (i = data->num_domains - 1; i >= 0; i--)
+		if (data->domains[i])
+			pm_genpd_remove(data->domains[i]);
+}
+
+static void scpi_pm_domain_remove(struct platform_device *pdev)
+{
+	of_genpd_del_provider(pdev->dev.of_node);
+	scpi_pm_remove_domains(platform_get_drvdata(pdev));
+}
+
 static int scpi_pm_domain_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -105,9 +120,10 @@ static int scpi_pm_domain_probe(struct platform_device *pdev)
 	if (!domains)
 		return -ENOMEM;
 
-	for (i = 0; i < num_domains; i++, scpi_pd++) {
-		domains[i] = &scpi_pd->genpd;
+	scpi_pd_data->domains = domains;
+	scpi_pd_data->num_domains = num_domains;
 
+	for (i = 0; i < num_domains; i++, scpi_pd++) {
 		scpi_pd->domain = i;
 		scpi_pd->ops = scpi_ops;
 		scpi_pd->genpd.name = devm_kasprintf(dev, GFP_KERNEL,
@@ -115,7 +131,8 @@ static int scpi_pm_domain_probe(struct platform_device *pdev)
 		if (!scpi_pd->genpd.name) {
 			dev_err(dev, "Failed to allocate genpd name:%pOFn.%d\n",
 				np, i);
-			continue;
+			ret = -ENOMEM;
+			goto err_remove_domains;
 		}
 		scpi_pd->genpd.power_off = scpi_pd_power_off;
 		scpi_pd->genpd.power_on = scpi_pd_power_on;
@@ -126,15 +143,22 @@ static int scpi_pm_domain_probe(struct platform_device *pdev)
 		 * The SCP firmware itself may have switched on some domains,
 		 * but for reference counting purpose, keep it this way.
 		 */
-		pm_genpd_init(&scpi_pd->genpd, NULL, true);
+		ret = pm_genpd_init(&scpi_pd->genpd, NULL, true);
+		if (ret)
+			goto err_remove_domains;
+		domains[i] = &scpi_pd->genpd;
 	}
 
-	scpi_pd_data->domains = domains;
-	scpi_pd_data->num_domains = num_domains;
-
-	of_genpd_add_provider_onecell(np, scpi_pd_data);
+	ret = of_genpd_add_provider_onecell(np, scpi_pd_data);
+	if (ret)
+		goto err_remove_domains;
 
+	platform_set_drvdata(pdev, scpi_pd_data);
 	return 0;
+
+err_remove_domains:
+	scpi_pm_remove_domains(scpi_pd_data);
+	return ret;
 }
 
 static const struct of_device_id scpi_power_domain_ids[] = {
@@ -149,6 +173,7 @@ static struct platform_driver scpi_power_domain_driver = {
 		.of_match_table = scpi_power_domain_ids,
 	},
 	.probe = scpi_pm_domain_probe,
+	.remove = scpi_pm_domain_remove,
 };
 module_platform_driver(scpi_power_domain_driver);
 

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0


