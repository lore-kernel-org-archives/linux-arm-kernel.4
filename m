Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD71606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zg0nfoxe;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=LB3JOvak
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0VEXadRTs4mVJ4mB3xY7u+vAwlCzDe/yNMl9zPs8LH0=; b=Zg0nfoxenHX+BK
	nZd5kahg9p638u0UpipwYsNK5geRNYGK3z4Y9cP9IoW49NxbbwE80uD/0ziNUE2fYa06dhcxyzyqK
	lf0pvdAnXbv+I2AxHwkt3YJCwGvM+7+y8qJxpyeZcvS4UUh+Pq5SdUN6pdJohgRAN9zNWCowsmIKp
	fIU7skCemCvx+wEQFQAWM/kQ0B7XqbjINMRLSxFkK9hDFyyzfEvwLYPm75JP6EPSFxbQnEs2PAneL
	hWkVw2mgznRYNYub/woapG1y18ZWxRGf6eHOg6WQEd7bI9EBHC2ejzFge9Bg/kpVYxZiGo3aziciF
	ZbQr735imkkfcqKQuMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9uc-00000001ImH-1g4F;
	Sun, 22 Nov 2026 15:55:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9uX-00000001IjV-33FX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:55:27 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4aa5833c263so2323239f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795362924; x=1795967724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VEXadRTs4mVJ4mB3xY7u+vAwlCzDe/yNMl9zPs8LH0=;
        b=LB3JOvakKDUyXrwMKcbIeCSmDbLsYXetGKXj3wy2LCM9RyhwSEIU82JzTbCX2KkuxZ
         qpRVrRD8iYC8EYJAjKh2gLdP0ddrlzbtGaSFq9UpoOFza8HHF+C3tzKUOVXwRYOvbhPd
         WuUZh9zqGlIxZ/u05S7o6qwSSimTnMGyxvdQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362924; x=1795967724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0VEXadRTs4mVJ4mB3xY7u+vAwlCzDe/yNMl9zPs8LH0=;
        b=O/fGHT3c37pTHgnsb+qVZh9vJaB6z4H1aLXkBc9YaPJbHZqBOXr5/0plcRRMdIHcgn
         R7j6Odmps0wp85ru8+ClcsLJWhEfbihz34+EvOOb1A7VX9JcOmHzmrI/FDSvb6UB2glL
         Sxnxe/vqGJNbXy3cVnSR3phb2mNcGFJ3VrkX5rWHGcfgXdDSeAnpN1EWUI0IBnauHbBx
         +ZpyYLi27nNV+fF8AG5CwiVvr0qlTn09WI273T1eCMHaDU8glYuh30ccpQuRKLLK8aRB
         bovEYS/LrDJ8YL0Xobuy/Ourc8moF+/GGanfKjHxMB3CBN8IKh7ZRUj356DKwE96kRgp
         pCZg==
X-Forwarded-Encrypted: i=1; AL+hErFr2LeMhXdvO3Gec3PbZDldvlgaETuDshinZJAe0XvuMfA3NUt/0JaU51KkyRXkxNI7eSidoUIvAbGhndBpTfNE@lists.infradead.org
X-Gm-Message-State: APuU4Z/gifqvMLdgjAKNiwbgVtJCKSgzLaskhJ1cvUOpHECjZ9B7F664
	ECMKelUKbOd/y8U9+HTlBv13s0AHMmSh0/9SPakBOKUj1Fqxbg6dM0djvm1oYBl2UHg=
X-Gm-Gg: AZFdTZeQcJK8hnJ9p464kpdKFGMWDqCf9NAUjDGzfjde0pmpnOXHP6tUc9buo+VltIh
	HchqQxQEw/ByBVYN+Lz39fTcHg5osUkIbho9B3keQZk1IRvv5RnAEG8RXmB3ZThXtTJ2lw8MTPz
	EvZFLcJD7SDG+8kAtEJ/4c2C0MGru3EFETOPxvjMhqai4cW9717WU9ofdxRV3QvwVg7rwmR9588
	kE7Br1a2TQAfafYQlmjGJHTGeZ0mryYfjJPkIraowmUJypGIRW3iM0QSGOAmNwZ/fLka1zfOE/B
	zbjsyHrsE6l8eX67tH/8a3aKAGODSdKTwI1ujPUpzn1n3ogsvXff7muJnuUPyradkOIfHleBSgl
	eKWHUBqVXvLlXkfNIhFRMHErL9JBh7odwUcfZ/dfOgTOLgsQcdYcglQa+2FwU3oLmE1BBONK+By
	HRHYTIs6DT8ptQjJ3VYefxqSG+X0sD6pLnJu3hrDjG8XTi2U5wZG4im+xlGsCTe0ifqYBwhJJX+
	7ky+0ljGYXnM399tdLqER8TxdmSdZ/FFXksMIcdiDKneMLrQYtphOuir3fzhqnIV9FOl/dXoEmB
	Dagnjp9HoXszigaQ3YZl3lNZvsLWeopdDDem3DVUdvacV1f44OGiuN3hPLautC8ygPFulLLsdai
	9d2P2GYFm4fKzCGGTKmBnP6tWQ4VcW9pb4RgvTsq7DfqVSRJhAWR+QIqqAvnW6X9ggQQdeYaTaS
	2r19T7wq9//6N860E7GOQLwzdlpA==
X-Received: by 2002:a05:600c:4f07:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb88804d58mr224971215e9.9.1795362923616;
        Sun, 22 Nov 2026 07:55:23 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm20046526f8f.55.2026.11.22.07.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:55:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 2/4] pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 16:55:09 +0100
Message-ID: <20261122155514.10289-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
References: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_075526_209318_C5BD3517 
X-CRM114-Status: GOOD (  21.75  )
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

The PGC domains are all registered as off, so a domain left on by the
bootloader, e.g. DISPMIX to show a splash screen, is powered up again
by its first consumer. On the i.MX8MN this turns the display off and
hangs the system.

The GPC does not report the power state of a domain, but the ADB400
bridge acknowledges the power-up handshake only while the domain is
powered. Use it to register as on the domains left on by the
bootloader.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Drop the runtime PM reference synchronously in the probe error path

Changes in v2:
- Release the resources of the domains left on when the driver is
  removed

 drivers/pmdomain/imx/gpcv2.c | 77 +++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 6a54ee734514..f8f2d38c1b2a 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -292,6 +292,7 @@ struct imx_pgc_domain {
 
 	const int voltage;
 	const bool keep_clocks;
+	bool boot_on;	/* Left on by the bootloader */
 	struct device *dev;
 
 	unsigned int pgc_sw_pup_reg;
@@ -488,6 +489,8 @@ static int imx_pgc_power_down(struct generic_pm_domain *genpd)
 
 	pm_runtime_put_sync_suspend(domain->dev);
 
+	domain->boot_on = false;
+
 	return 0;
 
 out_clk_disable:
@@ -1315,9 +1318,27 @@ static const struct imx_pgc_domain_data imx8mn_pgc_domain_data = {
 	.pgc_regs = &imx7_pgc_regs,
 };
 
+/*
+ * The GPC does not report the power state of a domain, but the ADB400
+ * acknowledges the power-up handshake only while the domain is powered.
+ */
+static bool imx_pgc_domain_is_on(struct imx_pgc_domain *domain)
+{
+	u32 val;
+
+	if (!domain->bits.hskack)
+		return false;
+
+	if (regmap_read(domain->regmap, domain->regs->hsk, &val))
+		return false;
+
+	return (val & domain->bits.hskack) == domain->bits.hskack;
+}
+
 static int imx_pgc_domain_probe(struct platform_device *pdev)
 {
 	struct imx_pgc_domain *domain = pdev->dev.platform_data;
+	bool init_off;
 	int ret;
 
 	domain->dev = &pdev->dev;
@@ -1348,12 +1369,44 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 		regmap_update_bits(domain->regmap, domain->regs->map,
 				   domain->bits.map, domain->bits.map);
 
-	ret = pm_genpd_init(&domain->genpd, NULL, true);
+	init_off = !imx_pgc_domain_is_on(domain);
+	ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 	if (ret) {
 		dev_err_probe(domain->dev, ret, "Failed to init power domain\n");
 		goto out_domain_unmap;
 	}
 
+	/* Balance the first imx_pgc_power_down() */
+	if (!init_off) {
+		ret = pm_runtime_resume_and_get(domain->dev);
+		if (ret < 0) {
+			dev_err_probe(domain->dev, ret,
+				      "Failed to resume domain\n");
+			goto out_genpd_remove;
+		}
+
+		if (!IS_ERR(domain->regulator)) {
+			ret = regulator_enable(domain->regulator);
+			if (ret) {
+				dev_err_probe(domain->dev, ret,
+					      "Failed to enable domain's regulator\n");
+				goto out_put_pm;
+			}
+		}
+
+		if (domain->keep_clocks) {
+			ret = clk_bulk_prepare_enable(domain->num_clks,
+						      domain->clks);
+			if (ret) {
+				dev_err_probe(domain->dev, ret,
+					      "Failed to enable domain's clocks\n");
+				goto out_regulator_disable;
+			}
+		}
+
+		domain->boot_on = true;
+	}
+
 	if (IS_ENABLED(CONFIG_LOCKDEP) &&
 	    of_property_present(domain->dev->of_node, "power-domains"))
 		lockdep_set_subclass(&domain->genpd.mlock, 1);
@@ -1362,11 +1415,20 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 					   &domain->genpd);
 	if (ret) {
 		dev_err_probe(domain->dev, ret, "Failed to add genpd provider\n");
-		goto out_genpd_remove;
+		goto out_clk_disable;
 	}
 
 	return 0;
 
+out_clk_disable:
+	if (!init_off && domain->keep_clocks)
+		clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
+out_regulator_disable:
+	if (!init_off && !IS_ERR(domain->regulator))
+		regulator_disable(domain->regulator);
+out_put_pm:
+	if (!init_off)
+		pm_runtime_put_sync(domain->dev);
 out_genpd_remove:
 	pm_genpd_remove(&domain->genpd);
 out_domain_unmap:
@@ -1385,6 +1447,17 @@ static void imx_pgc_domain_remove(struct platform_device *pdev)
 	of_genpd_del_provider(domain->dev->of_node);
 	pm_genpd_remove(&domain->genpd);
 
+	if (domain->boot_on) {
+		if (domain->keep_clocks)
+			clk_bulk_disable_unprepare(domain->num_clks,
+						   domain->clks);
+
+		if (!IS_ERR(domain->regulator))
+			regulator_disable(domain->regulator);
+
+		pm_runtime_put_sync(domain->dev);
+	}
+
 	if (domain->bits.map)
 		regmap_update_bits(domain->regmap, domain->regs->map,
 				   domain->bits.map, 0);
-- 
2.43.0


