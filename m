Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBBE606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yOgefz4a;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lEtjdaFs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cF6KDJqu5o+VLH6VEzsmCco4XJ4A1kM2QuOlapez290=; b=yOgefz4a2FRnvl
	NXKZR7toyEccXGAtWf9wUjFvuxKhlbOGHatRGJJ7iQBljXSKqg42WK2tBtwZOmfolsyzMM7iNeFmJ
	TlslGojoys26HF3Vre8Exa2bRb+bq8nXTe/aCuXi4FBSlySHG+8mMwtjosH/ihjiePNRGMFI0/OGl
	TrcCvTfqXrhzXFjO2oGtVgW/0U3hyoiq8bZnQVOkS9HMIrgop7DM7lpuIIEZ5C6f6QjqRgi7ikHQL
	k7K96bq0sgRFNGJ6KkS9yF/Acpg1QncEXIyrIdd27GT0uaX/eqMkk2MigISrgSv7Pr0YXXvtiCmLU
	WAvQDFHDJ27cOlNuegFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4MK-00000000wWM-3w2Y;
	Sun, 22 Nov 2026 09:59:44 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4ME-00000000wUX-2O7e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:59:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so25106055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795341576; x=1795946376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cF6KDJqu5o+VLH6VEzsmCco4XJ4A1kM2QuOlapez290=;
        b=lEtjdaFsWqliizfiSEmEjaSIoZL0HmvxDbSvzXtTdMyT3LiZRzjkZ7l3WSweGrv2YB
         kqoGaWPN3ac3M8JwkgYFbavc7Hkcivua4ZvU4reNW6bCHkRiIKP6Rr+fVoLQ6wsdYoAq
         PiXUEPravyuX6lMPaNUljCp04uJ+xRBBhkadw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341576; x=1795946376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cF6KDJqu5o+VLH6VEzsmCco4XJ4A1kM2QuOlapez290=;
        b=yNodETzD6hIdbknmG9OgJ0XYvN+iGc+rJfIwXhYsWRw4N3HMLdj36NJz9kyb1ug+PP
         yDd3QQYV4wuHW2OeF1oLbmfUyr275bPLVHORtky6KoGbzMJ19cCfJt776Ry0OqKeXOmR
         qwhIF2Eqz7WVW+hXQtRMMKWuCC0/dfIPgQW+wlnAdfWX1cEn9lECdEHDe5/SARQwauIg
         bVZMq1WOAvbXnV+dtYdyxQOoZPgNTjFtC+uWTma1AtAaVm3G7b860NZ/lQXw3epUa0JL
         9ks+P3H2p9zURUWql4jZBw+M4hkzJm+AQkLbDwy1LhL9BA8T1/H4vwsWepMI8KQpLoKl
         srig==
X-Forwarded-Encrypted: i=1; AL+hErHVgWmPfKr9SmFiGkhlr7hrTVms9q+1Rc8gA4UM9ZGZNKdILMevBMQ8DBZA2trl6vZNVSmghumG36rYt4sgPt/p@lists.infradead.org
X-Gm-Message-State: APuU4Z/D9R+XK56+8v33aaoaUDDYac25Ujkn3I4JZZ6WpYGtYNwuCk0L
	IpYJMF2gO8Lgn8c9iA6EwtO2iNuyXyzmNzmOZjIODVDgz3qHkZ35eO7SqPxcRMcZiVk=
X-Gm-Gg: AZFdTZeOAwf1C/i1gEdWWjcLXrspEld8ap8qX4JtJR3MllWEAdI6qbmBL24/lIdIq1b
	44lrWrlbS4IUyIBXB88ysJo35+a2jBDa31Ei43rBqNqtIBnJcJGBlDCfOm5Hze2I/6KnMQuBhvu
	OSp/a+VExdZQVoOxFXKKeHsmIzlm/VKHnn60TPJtRoWw4cjfxYzElC1l0d1FK2t0X72RwbjNvDG
	vS19KiRpcum+hTouxmKpZCBLj2lWHoK8KEfVTYRYFgeLeQqoN7yZAWmsZq4W11nq/FxgGL3haws
	JPcoIZX+pZ/JNZz7h2TYoUnuZ5qfE3k0/QY+m60u9KIwI9fPB5huPJ5sc+TXR8Gj7srVcH/bj0E
	luX26MO75C91MIySNTl6IuW4wO5oMDPkuGu6ecUEnGl6bthxKvMP/fXVPsGfEHvzcMf9DoJndeQ
	EcXFsKVFAfbt8YPjztHzeyh8DKCkLFXEYxW6aINyyArj+E6agT2pdZSk9YrmV1OH8wRXgpS2wXs
	H+J6bm/TTz1NalQp0CwjZ8qoAtWy6Vr1vFxBZqVHS9ufgC4s8+gPfUYJ1I7qFIVMa6yBxQUBale
	Sbb1PBCBTufZnP1LCBSSXmYhFrpru+VzDA/CDID/Ia+pCURsJ1nh+T9rjSmQRzQVEg3R/9t1LnR
	ftpga0KYBStqz6FPFCnIthaG95f3CvT6tjDpYQEEKhoqjVpHa6YgYFCF8jS9wYVOS+aeaZrHTzD
	k3kjge+ioPKkWVrSFaGIaIbqCFIw==
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr35158925e9.2.1795341576638;
        Sun, 22 Nov 2026 01:59:36 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm342455265e9.13.2026.11.22.01.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:59:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
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
Subject: [PATCH v2 2/4] pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 10:59:17 +0100
Message-ID: <20261122095927.2631909-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
References: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_015938_644361_FD9527E8 
X-CRM114-Status: GOOD (  21.63  )
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

Changes in v2:
- Release the resources of the domains left on when the driver is
  removed

 drivers/pmdomain/imx/gpcv2.c | 77 +++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 6a54ee734514..71e551f0471d 100644
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
+		pm_runtime_put(domain->dev);
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


