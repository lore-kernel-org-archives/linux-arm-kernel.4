Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F930606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tqtp7qOV;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=brXuDX7A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yrEpmd16eXyPHlsy7lDseSg22Hh4/cD9dxPjUlL+k0Y=; b=Tqtp7qOVQ1YTRH
	4cpU7eQ1kVW82dlBtD0HkQU1FGyFDT/Wd1+WbzUf9GkrmXDMIiryqihKiABFQwRoJ4fXLumjCpwoA
	2einMffgqA+xiPPC7nUOcEczlNh/ZPo3XB5QkvkQy/0rBXoyqnP83pUy+HfyQdiTlApXlWeVXBi4N
	uffdpou1Fm8ut7qCAIQncB2bpiRCkrXJ+W/py7tPhWWtgX3Ap3yCdqG9E4MAbrzptnfS/Wu1a79sC
	3+1YCCacRyffhAc9ncEK9VnyqNUcDfH/L9ucZUZ/l6gIH9b/2JItdudBVZBKmHTLr0nmiP9rcCTRy
	rTkC/N9OWHfn/UY/m03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWl-0000000DLkL-3sRf;
	Thu, 26 Nov 2026 13:28:44 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZW7-0000000DLSt-3jDi;
	Thu, 26 Nov 2026 13:28:06 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcaf;
	Thu, 26 Nov 2026 21:27:59 +0800 (GMT+08:00)
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
Subject: [PATCH 3/3] pmdomain: bcm: Unregister Raspberry Pi power domains on unbind
Date: Thu, 26 Nov 2026 21:27:55 +0800
Message-Id: <20261126132755.4091008-4-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126132755.4091008-1-202300460064@mail.sdu.edu.cn>
References: <20261126132755.4091008-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2180aa00503a2kunm345e734035d940
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSRpJVk8dS0geGUJDGUsfH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=brXuDX7AEF/rvQZtXlo5zq4CImvQlokRWNxqJa4iaQffb/C3rg7mLb8xbN1Qc17ljF7vzJjTo5W4Lc6XyIfWaP9LIIFZWBhY5OWPNhuEqALB2rUvWy57SdmCDwlVLHTy/T2UIhlFN2ETw+J74/5DjkIohnXmZZBjS/AEMnm1MD8=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=yrEpmd16eXyPHlsy7lDseSg22Hh4/cD9dxPjUlL+k0Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_052805_087046_7B13A488 
X-CRM114-Status: GOOD (  17.43  )
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

The Raspberry Pi firmware power driver leaves registered domains and an
OF provider referring to freed storage on unbind. Initialize the
available domains together so probe can unwind partial initialization.
Remove the provider before its domains on unbind.

This issue was found by our static analysis tool under development.

The unbind cleanup overlaps an earlier proposal to add a remove
callback. This patch also handles partial initialization on probe
failure.

Link: https://lore.kernel.org/r/20260715-rpi-pm-remove-v1-1-e4eed226e08a@linutronix.de
Fixes: a09cd356586d ("ARM: bcm2835: add rpi power domain driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pmdomain/bcm/raspberrypi-power.c | 59 +++++++++++++++++++-----
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/pmdomain/bcm/raspberrypi-power.c b/drivers/pmdomain/bcm/raspberrypi-power.c
index 1304c5545f36..816458637663 100644
--- a/drivers/pmdomain/bcm/raspberrypi-power.c
+++ b/drivers/pmdomain/bcm/raspberrypi-power.c
@@ -95,16 +95,6 @@ static void rpi_common_init_power_domain(struct rpi_power_domains *rpi_domains,
 	dom->base.power_on = rpi_domain_on;
 	dom->base.power_off = rpi_domain_off;
 
-	/*
-	 * Treat all power domains as off at boot.
-	 *
-	 * The firmware itself may be keeping some domains on, but
-	 * from Linux's perspective all we control is the refcounts
-	 * that we give to the firmware, and we can't ask the firmware
-	 * to turn off something that we haven't ourselves turned on.
-	 */
-	pm_genpd_init(&dom->base, NULL, true);
-
 	rpi_domains->xlate.domains[xlate_index] = &dom->base;
 }
 
@@ -158,11 +148,32 @@ rpi_has_new_domain_support(struct rpi_power_domains *rpi_domains)
 	return ret == 0 && packet.state != ~0;
 }
 
+static void rpi_power_remove_domains(struct rpi_power_domains *rpi_domains,
+				     unsigned int count)
+{
+	while (count--) {
+		struct generic_pm_domain *pd = rpi_domains->xlate.domains[count];
+
+		if (pd)
+			pm_genpd_remove(pd);
+	}
+}
+
+static void rpi_power_remove(struct platform_device *pdev)
+{
+	struct rpi_power_domains *rpi_domains = platform_get_drvdata(pdev);
+
+	of_genpd_del_provider(pdev->dev.of_node);
+	rpi_power_remove_domains(rpi_domains, rpi_domains->xlate.num_domains);
+}
+
 static int rpi_power_probe(struct platform_device *pdev)
 {
 	struct device_node *fw_np;
 	struct device *dev = &pdev->dev;
 	struct rpi_power_domains *rpi_domains;
+	unsigned int i;
+	int ret;
 
 	rpi_domains = devm_kzalloc_obj(dev, *rpi_domains);
 	if (!rpi_domains)
@@ -223,11 +234,34 @@ static int rpi_power_probe(struct platform_device *pdev)
 	rpi_init_power_domain(rpi_domains, RPI_POWER_DOMAIN_CDP, "CDP");
 	rpi_init_power_domain(rpi_domains, RPI_POWER_DOMAIN_ARM, "ARM");
 
-	of_genpd_add_provider_onecell(dev->of_node, &rpi_domains->xlate);
+	/*
+	 * Treat all power domains as off at boot.
+	 *
+	 * The firmware itself may be keeping some domains on, but
+	 * from Linux's perspective all we control is the refcounts
+	 * that we give to the firmware, and we can't ask the firmware
+	 * to turn off something that we haven't ourselves turned on.
+	 */
+	for (i = 0; i < rpi_domains->xlate.num_domains; i++) {
+		struct generic_pm_domain *pd = rpi_domains->xlate.domains[i];
+
+		if (!pd)
+			continue;
+		ret = pm_genpd_init(pd, NULL, true);
+		if (ret)
+			goto err_remove_domains;
+	}
+
+	ret = of_genpd_add_provider_onecell(dev->of_node, &rpi_domains->xlate);
+	if (ret)
+		goto err_remove_domains;
 
 	platform_set_drvdata(pdev, rpi_domains);
-
 	return 0;
+
+err_remove_domains:
+	rpi_power_remove_domains(rpi_domains, i);
+	return ret;
 }
 
 static const struct of_device_id rpi_power_of_match[] = {
@@ -242,6 +276,7 @@ static struct platform_driver rpi_power_driver = {
 		.of_match_table = rpi_power_of_match,
 	},
 	.probe		= rpi_power_probe,
+	.remove		= rpi_power_remove,
 };
 builtin_platform_driver(rpi_power_driver);
 
-- 
2.43.0


