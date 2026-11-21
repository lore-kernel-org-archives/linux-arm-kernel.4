Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBBF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o+UfgJWp;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=dVQssTpo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bJhkKyRHV3mrHq/zTrWh/sC0/NiutVH/ddsVPD75YJQ=; b=o+UfgJWpzal5m5
	SyIuD8NDX5qrvZOWSw2WWXiRqXw7serLXolAIikuTxab50wtouWMkCThboEEIx2SWVKbltJoFVZGR
	thbt3tEsipK53H28WQ0spFGyP5o1Yc/+ZH6EeyDuOFyhxYnzgtQXhTYafQrxlwKqfBcyCdCkm5mmK
	G5nK5yQXfeTBbDe/0zHuMhHN5SDo6MpPYu2tUL+kZmcEUdZnOujg/km49DbtdFLTkp3HFf3/RijvZ
	IiqG9QR89BrBraMZacx4OnTBZ5WParB5nny1yhsho8llqbpZFXdtBuMqAhVT5KZ02XXQJeRqFiaSj
	YHV+bPTsatadQgTGlNdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUknX-0000000HEr7-3hOf;
	Sat, 21 Nov 2026 13:06:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUknP-0000000HEnT-1wqS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 13:06:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so15653845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 05:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795266381; x=1795871181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJhkKyRHV3mrHq/zTrWh/sC0/NiutVH/ddsVPD75YJQ=;
        b=dVQssTpoUTwnoZPow5xv2uofmeX2nhUUkl8YLOtwcWtjw8WTU3wnrmfOvvzCEJ4fbh
         rot4KZwnkbSb8SrdSRePRqMwf1JZ1IVyvjthdQ4dINRw+skeMyc7TBOH+SiHowqevjkx
         IIe6KV00yhsJBGu5Mvvh1XPM+JmqOt+Kl7CZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266381; x=1795871181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJhkKyRHV3mrHq/zTrWh/sC0/NiutVH/ddsVPD75YJQ=;
        b=cCBxMtj8yjBNGRceRMSXt45o78ekpIYHrnteRzHjvCSjwHObY6XeEfGtnuXapjSO7l
         D2MDEAZ5fO1FhfHsLh5C3+6Lmnr45L9MNZS3jyqzkXSUqGHTG6ctZ0RAExeTOEScQ76Y
         I6/k7DhLkK2gZW4Ru67D5xue6CRDLzTJ0GMCYaaUCPW2qDaIrf7XX4/XYWMiI5s9FiKe
         kE1KRqcNNSRtF9wdDrrQuiH/yq/JpAMrT9/kHUzdJ347iDog3VLto30PZl+C45i8NAth
         FPBN0G+qAgrFJVUAz31VQGsmO1DOhfiDGI07z9qqXbMsbAJZwMaQ0do6Qa5aGczO8og9
         UKKg==
X-Forwarded-Encrypted: i=1; AL+hErFGbjH7xvAvkxYopavrzEweD0v1oqRA2AdBdqwt2zw7X3OGcADfFX3rVq7dXIzm5+QbfY1pDzSkf/h3U4+3xx/X@lists.infradead.org
X-Gm-Message-State: APuU4Z+VSY4Lec8QEflC/mCLQsxskZ996J5bT8/pIyveZWyCrMME8h+0
	DEpFDbT6TIGeSrgPtIVLvno79TqklQaBvJptHtXBZ9OWeCZcy6cjgD5nPeqClRYomcs=
X-Gm-Gg: AZFdTZePISKsvIabQBTztklhb8/e+u289FqeXitfbM/A6lrgwjQ2P+W+c2i/da2irUn
	Er33N0c40CZYBSGjNqZKWYx8E01qGd+0ZtUe4RMMMg7lNgSeD16rO5L18iUHSn6nYQMMDlrdDG4
	2gvAcv/Z/gbsJ6GWjj1pUEt2yyNIGl6/BgfVIhj4NzpQA9+hkIzHuOQPo8wTjOZi1F3xmgBywz9
	p9Zcb7f84mHZmZM1KoN6k3Nb0u/kTJv5dAJifAIP5fSW4i/iFeSgq/yKL5rUBSs4P8U0nPqe1fO
	49DRGnb8jLvAvoOnooTn+T2c5Jr4M0p4kSD8Bg4lwkgXNOb7DBRBzFWVsotmSd6t9TqXNmI2LvX
	Eg/JBG4vdsxTb69JODOZolP8ihu26n63voHyz3psSjXTlxJjnyF8omcV+wJbO+HLY09X+IWNfLz
	Cdiha1q5zqJIL+9M1JZSfPcCkgYR3KyXvDeMt+vfv7mo7uKsnsiV5vmGMOAZADGBDeZ6izF1nh1
	QDi4/Ni4NlxWDEmT2qSvHb6TEyv68ijdpX0K9/XNOIw/2b4ARbNPD9mPnd2zomVKduizxB8ewjZ
	HkkX6iW6ciu6BesSb1wV15IjyJDRVWNwFVV9q/3fRgHEkV6SGck5+SwJ3hfwkuPgg0RVksFk4ia
	apogPir3zMnyC6DvnSHS7h6I8ac9TufOu6+4tsQrgyXiMt5scbGXhhZTt7XhT0PZxjGw1nn1rlX
	udhKi3Ynw+qIUMtMaxnG6JSFJ3zA==
X-Received: by 2002:a05:600c:64c6:b0:4bb:6a75:d04f with SMTP id 5b1f17b1804b1-4bb88807d96mr135151995e9.8.1795266381367;
        Sat, 21 Nov 2026 05:06:21 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm47196545e9.3.2026.11.21.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:06:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	michael@amarulasolutions.com,
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
Subject: [PATCH 1/3] pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
Date: Sat, 21 Nov 2026 14:06:08 +0100
Message-ID: <20261121130614.2482656-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
References: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_050623_531681_56F17414 
X-CRM114-Status: GOOD (  18.98  )
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

 drivers/pmdomain/imx/gpcv2.c | 61 ++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 6a54ee734514..23159b0489d4 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1315,9 +1315,27 @@ static const struct imx_pgc_domain_data imx8mn_pgc_domain_data = {
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
@@ -1348,12 +1366,42 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
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
+	}
+
 	if (IS_ENABLED(CONFIG_LOCKDEP) &&
 	    of_property_present(domain->dev->of_node, "power-domains"))
 		lockdep_set_subclass(&domain->genpd.mlock, 1);
@@ -1362,11 +1410,20 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
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
-- 
2.43.0


