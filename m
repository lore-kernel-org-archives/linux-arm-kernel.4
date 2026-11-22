Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED47606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xTtKEXjm;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PCHiDQid
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EZ2863pKGWwBwjrMKzumFwAyyrjNnDcDdwgqcYg/Bpc=; b=xTtKEXjmmUVfXK
	ubVGF8gzeetyK39LLTJeShmnmMzQGDMDgA38QO0oIMX9rurak2Ppa+mdXziIHB3l8uwytkEeF81/q
	8EkiOGRbR7zv+gXXrcrgiP0xG1IGrEe24IPJzqv0EOPxLvOV4be85hetLN2qx5V4wjIF7k4RKU35J
	FOwiVJb4RWhXSa0tkd/gih+ztkZqBzVlVX/Sn/dUk7vdVRkGSHXiqJm7JBNkxH0FsxV3+RHGMSGHu
	z4CC1BmQPsxF/YBRMKDxh36LFRyh2EpeKFmVtNI1ci5qmWAtBgY/vovBOu4Gykna5cGUBoEn7A5om
	hftRvB4ilqLGWCRz/oow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEXP-00000001jrV-1Bay;
	Sun, 22 Nov 2026 20:51:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEXK-00000001jpK-2wPH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 20:51:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so19279655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 12:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795380705; x=1795985505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZ2863pKGWwBwjrMKzumFwAyyrjNnDcDdwgqcYg/Bpc=;
        b=PCHiDQid5EVbO+6OkKQ+RH37Za+ZcFEdSwTeP+M0tdDub+al9FVPoNYICKQgvIu/et
         L+QAlo8p0eKwAkehcNI+B6lqOIoKSpVvH3BVhGmhl/ov12tNA/aMe9IoNRChHJRJJB+k
         FTMAB7ClEnRtkmY0gjtExTrbMxP9rW9oxVDns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380705; x=1795985505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZ2863pKGWwBwjrMKzumFwAyyrjNnDcDdwgqcYg/Bpc=;
        b=KTKrQa/AJVi3QA+zXhUIZmnA18FGBKSJbaEJeucLtkgJBbOFTaHpiRC6kmjhwDGgLK
         NrtiDxQCjq+hX1dmxBUjr0MGPbc7kdE437AGA6tXkw9QHexJ4TwM/NE+tX003jV0M1L5
         CVykqsEyfZ6jVypAH0nK1npTqhmCJ4EMZE/llYnTr7dQltssJa3bURcK5ICprlUTG3Un
         s4z0ZL+frrxzoW0ZMmMv01ESKK3npd5ZQgGaDICh76vX/GKuXt/7vmGvkniALA8qbvcq
         cixHFgSXmgkLhlfpXiv6cI7E6B34fhgRKeUcT61Awsd91oKn3zZzrL/JXLzMkMdzcV+g
         dthQ==
X-Forwarded-Encrypted: i=1; AL+hErE67j7nHzSWiOxaePLL2fsmC5Qz0NubJubRteN34n0eB8hrfrglCqEB27/GR1VJawmisieL91yCrie5lUUtf7rQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+G8hTs3VFFcJRUUDa2HcNSMzv/NZKc0Un2FDfefxPF9z3u/3pO
	r5iqpr5BU1HI0g563vxXRJQhGeWbVCDz0mxJtuuAYSfWaDHbizoLR0jzZ6idBaKZxYE=
X-Gm-Gg: AZFdTZcomD4iD8sx2/t9aNPhRKKgoT3k2liEfOQl2XMQHKea6GbXOrXE36wilarlA7l
	uhh8prxioZTWeAeRwQKNEIfuDCnWyg1ppqFeNPi/3Qvh8YMt48Vf9wPnIF8MJXG1l7oL7AVEJyL
	5nZUI3mSQw5reQuupYJpErP6q0AdMqquPRktLJ7GX6w6T+UoFZwIN2Dp5htD418Bnjf6R2QezNn
	R7BIV1UQiJAQhKwDr2upM+UJI2618xbIvYSbxEP9+zyj9ix3NoF/cMrNGt2lgLA9hw4fF6nQ3Lw
	WgumXn3lHOJP0tBQdvWaEvzFsSQRndtvQHqPSDDf1CzklYEybde1Y3kcBY/UN23UeP713DrU656
	TA2WEh2C0isich2BHCeplhwJfo/PJJkM5sJfpqePyL3EZ5bLZAAX1u8OmaHvlep8ZYmhccTLVeI
	TUoRfjEOF+KO1Nv/C+F6Oxs6/dpzrSTHZ1UlKTrnH4JKOe6f/A3wlyZw2GA+n1DSXrXeFmwL50s
	Icj9iWw2YvaJKKiu6CzLdvKR892eveTIUCfAWRSGAeocYXW6qa6PI/Y6rHQm97H2tMfF00Y5yl9
	d18hHal5Sdduf7lxjjQDeUNunSDOSLcwlxSmTHarG4BbhdCkwCVYrfXrY3XOfyD3tAkZqBRPZ+L
	5/QK+is8dz2Rs8PJ5gI1OM346B02mEBTqlDIbYyiwkhhS4JRIAbYVtI2dTOaOwtwsFuhoEMqLyA
	IAnysoERMynU28nzTqxbqt8ZiBxg==
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr201262775e9.19.1795380704844;
        Sun, 22 Nov 2026 12:51:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm397355305e9.13.2026.11.22.12.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:51:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v4 2/4] pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 21:51:11 +0100
Message-ID: <20261122205136.138173-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
References: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_125146_766873_9035BADB 
X-CRM114-Status: GOOD (  21.55  )
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

(no changes since v3)

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


