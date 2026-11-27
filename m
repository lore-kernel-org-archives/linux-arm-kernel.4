Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54109606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=owDyZNnh;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=QE+CFpHs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AWhWVFXi1qiZ+jsR2+3reWioz9FOSzC0rU2/Z8jPD8g=; b=owDyZNnhude9UG
	o8rQ1VbaGyS7Ja84tPLkMCCSXJdDlZEk9jHT0K6fqBQglj8ye7LY6n2PhiQvvaTGZwhqttf6HUgXA
	w7BvvNKXZX6t/DXXjUbHAS/FhKhKROuPU7/GEw19s6Kr9XoKwg4lya+7CombMxAP84RZOc0VoNaUM
	j8+qv1V2lE25trt9uCraUXHNXVbhIlPvnecSQhGrSiLCGoo5mTwSB3pvcFKyxQWulKvYEQblVvWxU
	eCjrLPRkswzRjiMVWfADFNcsv67OjVZZWoSEFoU2lFKIiq+WA6mQ+yh3UAFssh5viZGDi0UQSMamg
	kB+ZMeScCd04vjpCOzrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuD1-0000000FpRm-0XHn;
	Fri, 27 Nov 2026 11:33:43 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCo-0000000FpJ9-10RN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:33:33 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 56429982a;
	Fri, 27 Nov 2026 19:33:24 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	t.figa@samsung.com,
	kgene.kim@samsung.com
Cc: alim.akhtar@samsung.com,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] cpufreq: s5pv210: Add teardown and unwind probe failures
Date: Fri, 27 Nov 2026 19:33:21 +0800
Message-Id: <20261127113322.390337-2-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127113322.390337-1-202300460064@mail.sdu.edu.cn>
References: <20261127113322.390337-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc815d403a2kunm5097e7d4395dc9
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTklNVkNOHUoeHk4eQkNJQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=QE+CFpHsKbVZGVlK2Lvve1qzkSilmyq5N1fTq+xxStaOloaXstFF5A7D5ljyPk4DBw1HMyNxWhwTAh0E16xhiK6exhXcri8RUD+RI83uNddC3RB17573K1M+lssPCL80X35BrUR+tiHZgLtDnzToU1/y/kE4niquby9g88TvhBo=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=AWhWVFXi1qiZ+jsR2+3reWioz9FOSzC0rU2/Z8jPD8g=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033330_575957_D9F9CEFE 
X-CRM114-Status: GOOD (  15.35  )
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

Platform unbind leaves the cpufreq driver and reboot notifier registered
and retains the clocks, regulators and register mappings. A failed
registration also bypasses probe cleanup.

Register the reboot notifier after the cpufreq driver and unwind both in
reverse order. Drop the policy clocks on policy exit and release the
register mappings and regulators on failure and removal.

This issue was found by our static analysis tool under development.

Fixes: 6d4ed0f46af6 ("cpufreq: s5pv210: Make the driver multiplatform aware")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/cpufreq/s5pv210-cpufreq.c | 52 ++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index e64e84e1ee79..b01b77564ff8 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -553,6 +553,13 @@ static int s5pv210_cpu_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
+static void s5pv210_cpu_exit(struct cpufreq_policy *policy)
+{
+	clk_put(dmc1_clk);
+	clk_put(dmc0_clk);
+	clk_put(policy->clk);
+}
+
 static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
 						 unsigned long event, void *ptr)
 {
@@ -579,6 +586,7 @@ static struct cpufreq_driver s5pv210_driver = {
 	.target_index	= s5pv210_target,
 	.get		= cpufreq_generic_get,
 	.init		= s5pv210_cpu_init,
+	.exit		= s5pv210_cpu_exit,
 	.name		= "s5pv210",
 	.suspend	= cpufreq_generic_suspend,
 	.resume		= cpufreq_generic_suspend, /* We need to set SLEEP FREQ again */
@@ -588,6 +596,17 @@ static struct notifier_block s5pv210_cpufreq_reboot_notifier = {
 	.notifier_call = s5pv210_cpufreq_reboot_notifier_event,
 };
 
+static void s5pv210_unmap_registers(void)
+{
+	unsigned int id;
+
+	for (id = 0; id < ARRAY_SIZE(dmc_base); ++id) {
+		iounmap(dmc_base[id]);
+		dmc_base[id] = NULL;
+	}
+	iounmap(clk_base);
+}
+
 static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -633,8 +652,8 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 		id = of_alias_get_id(dmc, "dmc");
 		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
 			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
-			result = id;
-			goto err_clk_base;
+			result = id < 0 ? id : -EINVAL;
+			goto err_dmc;
 		}
 
 		dmc_base[id] = of_iomap(dmc, 0);
@@ -653,19 +672,18 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 		}
 	}
 
-	register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
+	result = cpufreq_register_driver(&s5pv210_driver);
+	if (result)
+		goto err_dmc;
 
-	return cpufreq_register_driver(&s5pv210_driver);
+	result = register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
+	if (!result)
+		return 0;
 
-err_dmc:
-	for (id = 0; id < ARRAY_SIZE(dmc_base); ++id)
-		if (dmc_base[id]) {
-			iounmap(dmc_base[id]);
-			dmc_base[id] = NULL;
-		}
+	cpufreq_unregister_driver(&s5pv210_driver);
 
-err_clk_base:
-	iounmap(clk_base);
+err_dmc:
+	s5pv210_unmap_registers();
 
 err_clock:
 	regulator_put(int_regulator);
@@ -676,10 +694,20 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 	return result;
 }
 
+static void s5pv210_cpufreq_remove(struct platform_device *pdev)
+{
+	unregister_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
+	cpufreq_unregister_driver(&s5pv210_driver);
+	s5pv210_unmap_registers();
+	regulator_put(int_regulator);
+	regulator_put(arm_regulator);
+}
+
 static struct platform_driver s5pv210_cpufreq_platdrv = {
 	.driver = {
 		.name	= "s5pv210-cpufreq",
 	},
 	.probe = s5pv210_cpufreq_probe,
+	.remove = s5pv210_cpufreq_remove,
 };
 builtin_platform_driver(s5pv210_cpufreq_platdrv);

-- 
2.43.0


