Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDC8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 20:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WGYE801Q;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=TYixlevL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6PicXai3zi/Jeul0tDyGLavGDqHdliZb/sSdP134yZc=; b=WGYE801QJ1Xd7V
	D5kjXYMBF08F9btjHWRdmavDQjb/RUWyHYsZO03ZQTNmu1S9iDdOPcC1TpqX2OQGwYR3zlrpUhJen
	EaRe4a6iznuWSMySl5tQ+fsHSja9h4SDz4Sw0D1bFUy8n8AuqFxdMWgtc3zYdPYJiRYnBHSNnLlJ9
	Xm0RXNHE2IngC+Z/9YrMQLbm5naCZ2zXA+GHXitRLNlv7PDuRudOrosut1YlqtLgF3vHYCT2BhQmc
	AFlUd7kmzMkglk+HEE771PaLEoxUZEYtpfWiogZ3yeqgB4HrrYXgdFMID6HuJZkPAM0TjxKMKO6ov
	qLppxEjjVW/p3+hm9AyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEXm-00000001k0Z-1xqK;
	Sun, 22 Nov 2026 20:52:14 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEXM-00000001jpj-2Jdx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 20:51:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so21323445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 12:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795380707; x=1795985507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PicXai3zi/Jeul0tDyGLavGDqHdliZb/sSdP134yZc=;
        b=TYixlevLfVeUQeKgB/j7M9CLhfci5AnplLtt8OYdsBlxIa59FBv5quV0pb5RH09DEb
         xkgcf1LL7HuuFfDHJJhpMa0jtqKaR7UE9veGFPIS/KM8mTq7A7jZsxmZ4fi4QJp0J3JL
         EDBAX+tpP3AaRUBv+RbQLsLmtC/U5R9SquHKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380707; x=1795985507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6PicXai3zi/Jeul0tDyGLavGDqHdliZb/sSdP134yZc=;
        b=pXIKSuA+ajQEry0utNac/tF0fA8f+DufUC+NN46I5h6XmNpwCeOjZtjU6B+7Pa1Oh7
         3YhnskH/g++qhiTSOTyyu5oDLyHkl3CIxnrHgSd/Y2vYvo9EH8fsy23aRMAcSC67H/29
         yyVxMsK5dtasIk96o7OU+VVzwXZrNJ6JcKaiXsCWCGWbZV6npa0t+NHFFkeT6TFZ4vis
         r/j5cpKiwPPXP1/alhpXj4mYu1a4Hbb1PpJlCijOQ8oupOzwhcaviNqMnXqsJ99X3hFE
         wJSJjN4l4M0ba4EawWqI5DsTF5wGWbTdjI03QPpHFkHWwdPVRj65Y4r82PXURFjGdPbM
         KTww==
X-Forwarded-Encrypted: i=1; AL+hErHYZ9dy3wKZozHFRONLeMs+wYqEQGxWgGR4/KENhjI2TJdE7N5S9A8LD9kPxPuvRYZTJ0YQWtsqwJiIRDozy9K+@lists.infradead.org
X-Gm-Message-State: APuU4Z+LOoVcMEqHuwWsHlLSm1oHWAJeBV18DtPphz+4l4p8n/NkMODS
	+RDQAXUVhRZz0GxFYJB7dM3/0mKAZ1y+PSJ10SuKRLLLkV3qomgUja1hUrvgEUSSZMY=
X-Gm-Gg: AZFdTZetI64qFjDAo+OfMdJ7fNVZuM2RnDAqgtT+ueFe1y4i/DXVMyyZtaOoPVcLMR7
	3PBnysT0LSEhj3XCZaTiTtbooQwkpE9haW3LtAKIcMsW8YmLt7SPTitdzDXrb6DIyXlxr8vXq6T
	22E+uSi3uvxQ+448zgE4z6ag6oyUwGX9bSmc6DtJAqVUD9YvsxvcAFYsl4j1B7I3WDwgSXDTr1g
	8dvMKlTakD569eiNV2q19HsQBGcWP5Fn5FICLEzTtDKgwB4XCZ5V8tCFTE3vlPUN9tIERLF0isd
	61gBoHjEKB3d6HiFSbOh3uTsGezMtdFjdDKVDspmqEhOX6X5KudN+yYYHmdq1M0B1RqUgrZBh76
	pOKmr9Drg4xnNxWudXvAQOBXFxN7zpTIHM9HcAvGebBCTDVNhe95ylw9zxUsfFNCbzQz3zvdTdx
	3sALNmh1LLIcqnedhqfm/l9dk5vIlO5sDM96/tDuVJF12d6xzDQEkTdwW/F7C/7YP/coYs/OAfd
	pLU2q619uE+2Hj5sB6uTHReVCFzrej0RHJySQVBq418AmU/P3rmme3nh9kDJFNutEbGlxh+FdKk
	c88sVtZ+ve56ZdByQ9fzBDrmuiDxQwslxIFYqDHe1WReuj03WUa8IVjQ6hOJUyzRlEMZ8AKs8bE
	0TQvDFS0ylgvM2wB/heLT5YKF6bRsvgtG7vah6W62PDaMD88jsxLnfhj6METoOY2dvQB8PA/ONZ
	uVKwxEIFKMAjNEhKiaFOOITTIb8A==
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr212608835e9.27.1795380706996;
        Sun, 22 Nov 2026 12:51:46 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm397355305e9.13.2026.11.22.12.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:51:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 3/4] pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 21:51:12 +0100
Message-ID: <20261122205136.138173-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
References: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_125148_642284_B5D1AA7B 
X-CRM114-Status: GOOD (  28.85  )
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

The blk-ctrl domains are all registered as off, so a domain left on by
the bootloader is powered up again by its first consumer. On the
i.MX8MN this resets the display pipeline set up by U-Boot to show a
splash screen.

Read the state of the domains from the blk-ctrl registers and register
as on the ones left on by the bootloader.

Enable this only for the i.MX8MN DISP blk-ctrl, as on other blk-ctrls
(e.g. the i.MX8MP VPUMIX) the registers do not reset to 0.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Register the power notifier before powering up the bus domain

Changes in v3:
- Keep the bus domain on while the state of the domains is read
- Remove the domains before releasing their boot-on references

Changes in v2:
- Take the references once the probe can no longer be deferred
- Clear the boot-on state when the domain is powered off
- Release the references when the driver is removed

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 128 +++++++++++++++++++++++---
 1 file changed, 117 insertions(+), 11 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 7d6735728d8c..04383d7e40cb 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -83,10 +83,13 @@ struct imx8m_blk_ctrl_domain {
 	struct device *power_dev;
 	struct imx8m_blk_ctrl *bc;
 	int num_paths;
+	bool boot_on;	/* Left on by the bootloader */
 };
 
 struct imx8m_blk_ctrl_data {
 	int max_reg;
+	/* SFT_RSTN and CLK_EN reset to 0, so a domain left on can be detected */
+	bool boot_state_readable;
 	notifier_fn_t power_notifier_fn;
 	const struct imx8m_blk_ctrl_domain_data *domains;
 	int num_domains;
@@ -187,18 +190,87 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
 	/* allow bus domain to suspend */
 	pm_runtime_put(bc->bus_power_dev);
 
+	domain->boot_on = false;
+
 	return 0;
 }
 
 static struct lock_class_key blk_ctrl_genpd_lock_class;
 
+/*
+ * A domain left on by the bootloader has its resets deasserted and its
+ * clocks enabled. The registers can only be read if the bus domain is
+ * on, so a domain is considered off whenever the bus domain is off.
+ */
+static bool imx8m_blk_ctrl_is_off(struct imx8m_blk_ctrl *bc,
+				  const struct imx8m_blk_ctrl_data *bc_data,
+				  const struct imx8m_blk_ctrl_domain_data *data)
+{
+	u32 rst, clk, mipi = 0;
+
+	if (!bc_data->boot_state_readable)
+		return true;
+
+	if (regmap_read(bc->regmap, BLK_SFT_RSTN, &rst) ||
+	    regmap_read(bc->regmap, BLK_CLK_EN, &clk))
+		return true;
+
+	if (data->mipi_phy_rst_mask &&
+	    regmap_read(bc->regmap, BLK_MIPI_RESET_DIV, &mipi))
+		return true;
+
+	return (rst & data->rst_mask) != data->rst_mask ||
+	       (clk & data->clk_mask) != data->clk_mask ||
+	       (mipi & data->mipi_phy_rst_mask) != data->mipi_phy_rst_mask;
+}
+
+/* Take the references of imx8m_blk_ctrl_power_on() for a domain left on */
+static int imx8m_blk_ctrl_get_boot_on(struct imx8m_blk_ctrl_domain *domain)
+{
+	struct imx8m_blk_ctrl *bc = domain->bc;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(bc->bus_power_dev);
+	if (ret < 0) {
+		dev_err(bc->dev, "failed to power up bus domain\n");
+		return ret;
+	}
+
+	ret = pm_runtime_resume_and_get(domain->power_dev);
+	if (ret < 0) {
+		dev_err(bc->dev, "failed to power up peripheral domain\n");
+		pm_runtime_put(bc->bus_power_dev);
+		return ret;
+	}
+
+	if (icc_bulk_set_bw(domain->num_paths, domain->paths))
+		dev_err(bc->dev, "failed to set icc bw\n");
+
+	domain->boot_on = true;
+
+	return 0;
+}
+
+static void imx8m_blk_ctrl_put_boot_on(struct imx8m_blk_ctrl_domain *domain)
+{
+	if (!domain->boot_on)
+		return;
+
+	/* Sync, to power down the bus domain before its notifier is removed */
+	pm_runtime_put_sync(domain->power_dev);
+	pm_runtime_put_sync(domain->bc->bus_power_dev);
+	domain->boot_on = false;
+}
+
 static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 {
 	const struct imx8m_blk_ctrl_data *bc_data;
 	struct device *dev = &pdev->dev;
 	struct imx8m_blk_ctrl *bc;
 	void __iomem *base;
+	unsigned long boot_on = 0, bit;
 	int i, ret;
+	bool init_off;
 
 	struct regmap_config regmap_config = {
 		.reg_bits	= 32,
@@ -250,6 +322,23 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 					     "failed to attach power domain \"bus\"\n");
 	}
 
+	bc->power_nb.notifier_call = bc_data->power_notifier_fn;
+	ret = dev_pm_genpd_add_notifier(bc->bus_power_dev, &bc->power_nb);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to add power notifier\n");
+		goto cleanup_bus;
+	}
+
+	if (bc_data->boot_state_readable) {
+		/* Keep the bus domain on while the state is read */
+		ret = pm_runtime_resume_and_get(bc->bus_power_dev);
+		if (ret < 0) {
+			dev_err_probe(dev, ret,
+				      "failed to power up bus domain\n");
+			goto cleanup_notifier;
+		}
+	}
+
 	for (i = 0; i < bc_data->num_domains; i++) {
 		const struct imx8m_blk_ctrl_domain_data *data = &bc_data->domains[i];
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
@@ -303,7 +392,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx8m_blk_ctrl_power_off;
 		domain->bc = bc;
 
-		ret = pm_genpd_init(&domain->genpd, NULL, true);
+		init_off = imx8m_blk_ctrl_is_off(bc, bc_data, data);
+		ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 		if (ret) {
 			dev_err_probe(dev, ret,
 				      "failed to init power domain \"%s\"\n",
@@ -312,6 +402,9 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!init_off)
+			boot_on |= BIT(i);
+
 		/*
 		 * We use runtime PM to trigger power on/off of the upstream GPC
 		 * domain, as a strict hierarchical parent/child power domain
@@ -328,37 +421,48 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		bc->onecell_data.domains[i] = &domain->genpd;
 	}
 
+	/*
+	 * The probe can no longer be deferred. Releasing these references
+	 * would power down the domains left on by the bootloader.
+	 */
+	for_each_set_bit(bit, &boot_on, bc_data->num_domains) {
+		ret = imx8m_blk_ctrl_get_boot_on(&bc->domains[bit]);
+		if (ret)
+			goto cleanup_pds;
+	}
+
 	ret = of_genpd_add_provider_onecell(dev->of_node, &bc->onecell_data);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to add power domain provider\n");
 		goto cleanup_pds;
 	}
 
-	bc->power_nb.notifier_call = bc_data->power_notifier_fn;
-	ret = dev_pm_genpd_add_notifier(bc->bus_power_dev, &bc->power_nb);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to add power notifier\n");
-		goto cleanup_provider;
-	}
-
 	dev_set_drvdata(dev, bc);
 
 	ret = devm_of_platform_populate(dev);
 	if (ret)
-		goto cleanup_notifier;
+		goto cleanup_provider;
+
+	if (bc_data->boot_state_readable)
+		pm_runtime_put(bc->bus_power_dev);
 
 	return 0;
 
-cleanup_notifier:
-	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
 cleanup_provider:
 	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
 	for (i--; i >= 0; i--) {
 		pm_genpd_remove(&bc->domains[i].genpd);
+		imx8m_blk_ctrl_put_boot_on(&bc->domains[i]);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
 
+	if (bc_data->boot_state_readable)
+		pm_runtime_put_sync(bc->bus_power_dev);
+
+cleanup_notifier:
+	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
+cleanup_bus:
 	dev_pm_domain_detach(bc->bus_power_dev, true);
 
 	return ret;
@@ -375,6 +479,7 @@ static void imx8m_blk_ctrl_remove(struct platform_device *pdev)
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
 
 		pm_genpd_remove(&domain->genpd);
+		imx8m_blk_ctrl_put_boot_on(domain);
 		dev_pm_domain_detach(domain->power_dev, true);
 	}
 
@@ -709,6 +814,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mn_disp_blk_ctl_domain_data[]
 
 static const struct imx8m_blk_ctrl_data imx8mn_disp_blk_ctl_dev_data = {
 	.max_reg = 0x84,
+	.boot_state_readable = true,
 	.power_notifier_fn = imx8mn_disp_power_notifier,
 	.domains = imx8mn_disp_blk_ctl_domain_data,
 	.num_domains = ARRAY_SIZE(imx8mn_disp_blk_ctl_domain_data),
-- 
2.43.0


