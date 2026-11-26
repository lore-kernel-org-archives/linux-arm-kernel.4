Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017F4606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fnRqoQY0;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=dQ+0v2ik
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gu4aUQoQJYGL5Solf3pB4Gz6kyovk61cFjsbj8bFV78=; b=fnRqoQY0pD47Jn
	HEAap/hcpF3zwqpF8wpEnVp93kvM7xswCZUKdivU4r+WEbySWq9IA4IXtf0C7hUkCdaiIOA5XrvIX
	d2/MXA7vH1sJo4XBckmbOFCQ7gz9O6w77DWgYM+tcN9a9RzsyouOqD3baO44MFi/Zlx0Ip8uGWWKz
	uwRxRq/iRet/i6r1qVonRPjfhsDbbSrLAtJDyo+ODfbwvX/MY5kfTqrP6w6os0AO4okhy/7Cuz5VX
	ewMi0yZ5CartmFzJLYV9BG/My5PPJzEEB+0PUga4V5lO0rQcmqNaKJfNZllYAJ+iVMuwSNsDAaBvv
	dtMpeym2t0CFFm2WFBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWn-0000000DLlz-3Jm8;
	Thu, 26 Nov 2026 13:28:45 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZW5-0000000DLST-3hqr;
	Thu, 26 Nov 2026 13:28:06 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcad;
	Thu, 26 Nov 2026 21:27:58 +0800 (GMT+08:00)
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
Subject: [PATCH 2/3] pmdomain: bcm: Unregister BCM63xx power domains on unbind
Date: Thu, 26 Nov 2026 21:27:54 +0800
Message-Id: <20261126132755.4091008-3-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126132755.4091008-1-202300460064@mail.sdu.edu.cn>
References: <20261126132755.4091008-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2180a9bc103a2kunm345e734035d93d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHx4eVkMYSxhNGE1OGBlMSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=dQ+0v2ikUXqbhbBhQwawQoIfMG4iv5qzCkaTssJ+4NxFfKRj5p+SV7uKqEmBZrNX+QYdkyWhSLKFVl21ra1+OPluxiam0O6c7X+UqtWXTbjVmjzypoJemElWhdZUviMFundAfdHn2vQr3tFnktf9M4JfV64JXPEt1cAJY4asp3c=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=Gu4aUQoQJYGL5Solf3pB4Gz6kyovk61cFjsbj8bFV78=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_052804_941393_8E91D376 
X-CRM114-Status: GOOD (  12.17  )
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

The BCM63xx provider and its domains remain registered after their
managed storage is freed. Delete the provider and remove initialized
domains on unbind, and unwind initialization when probe fails.

This issue was found by our static analysis tool under development.

Fixes: 6c41106f177e ("soc: bcm: add BCM63xx power domain driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pmdomain/bcm/bcm63xx-power.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/bcm/bcm63xx-power.c b/drivers/pmdomain/bcm/bcm63xx-power.c
index 9454f9066709..51ab8c5abca1 100644
--- a/drivers/pmdomain/bcm/bcm63xx-power.c
+++ b/drivers/pmdomain/bcm/bcm63xx-power.c
@@ -86,6 +86,21 @@ static int bcm63xx_power_off(struct generic_pm_domain *genpd)
 	return bcm63xx_power_set_state(pmd, false);
 }
 
+static void bcm63xx_power_remove_domains(struct bcm63xx_power *power)
+{
+	int i;
+
+	for (i = power->genpd_data.num_domains - 1; i >= 0; i--)
+		if (power->genpd[i])
+			pm_genpd_remove(power->genpd[i]);
+}
+
+static void bcm63xx_power_remove(struct platform_device *pdev)
+{
+	of_genpd_del_provider(pdev->dev.of_node);
+	bcm63xx_power_remove_domains(platform_get_drvdata(pdev));
+}
+
 static int bcm63xx_power_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -150,7 +165,9 @@ static int bcm63xx_power_probe(struct platform_device *pdev)
 		pmd->genpd.power_on = bcm63xx_power_on;
 		pmd->genpd.power_off = bcm63xx_power_off;
 
-		pm_genpd_init(&pmd->genpd, NULL, !is_on);
+		ret = pm_genpd_init(&pmd->genpd, NULL, !is_on);
+		if (ret)
+			goto err_remove_domains;
 		power->genpd[entry->bit] = &pmd->genpd;
 
 		ndom++;
@@ -161,12 +178,17 @@ static int bcm63xx_power_probe(struct platform_device *pdev)
 	ret = of_genpd_add_provider_onecell(np, &power->genpd_data);
 	if (ret) {
 		dev_err(dev, "failed to register genpd driver: %d\n", ret);
-		return ret;
+		goto err_remove_domains;
 	}
 
+	platform_set_drvdata(pdev, power);
 	dev_info(dev, "registered %u power domains\n", ndom);
 
 	return 0;
+
+err_remove_domains:
+	bcm63xx_power_remove_domains(power);
+	return ret;
 }
 
 static const struct bcm63xx_power_data bcm6318_power_domains[] = {
@@ -369,5 +391,6 @@ static struct platform_driver bcm63xx_power_driver = {
 		.of_match_table = bcm63xx_power_of_match,
 	},
 	.probe  = bcm63xx_power_probe,
+	.remove = bcm63xx_power_remove,
 };
 builtin_platform_driver(bcm63xx_power_driver);
-- 
2.43.0


