Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22674606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=af21Yt9q;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lhipXEeS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UecCKV7n25Ql/GlYyEWBnjpzmQQb5gUz48JCN9VfJSg=; b=af21Yt9qeFa21a
	WAWNXA3mmRaXagIdy3meKE6FbB/nFYXAmfJ3mBQ/iyS4CGUz2ri3/oCYqSF426LdD5bHIQF1zsfpe
	oQIZg2mAxwRYZUN7PaQh6N2zeKwMqC7GaHRThRGqXoYGAvuqWO21yMCL5SsIn39hDlHJmn+2RH9DW
	rVCfiOHVLhh5uOcRfNiZMB9TbVq+cCIajExRHChPQL9X41DUsUp5Q3PywzRrWpt3wUj2S2/ciuoKh
	yOO+98eK2JUnWXcowbp46N5FoeZe/Yo/8l5g+yotolnQLNp++54vS0mSouGAk7d1maDhk8RsqH2Z+
	dnl7tCepoGgKdqATVasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4ML-00000000wWY-074G;
	Sun, 22 Nov 2026 09:59:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4MG-00000000wVH-1XfA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:59:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso16826715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795341579; x=1795946379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UecCKV7n25Ql/GlYyEWBnjpzmQQb5gUz48JCN9VfJSg=;
        b=lhipXEeSCiiatkpaTHwwtnJ0wWSSkmnRQEaq+ipDILlZ8ZVyDVDBKU6jnSDfPUsRnt
         aoIBbsypCW7ixWIIM+lIlJsCPk/U9xiXUd1JYdcFnZm/DAc0jg/RH90xxJnorEPh6Q4Z
         P3HA6sGR3DGYvfkTIKU79OLrvbE4L9pv/u/bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341579; x=1795946379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UecCKV7n25Ql/GlYyEWBnjpzmQQb5gUz48JCN9VfJSg=;
        b=dEZSJPwAzGVNjLiUBbzNtrLm8LllccSzYcJ/i9X/YYMcOghd0WFKrWX8VfBbis24Wj
         KPMbJQzYa7DWeR6o1OYn/cri5/+1wv5Y50Pofvar/6+Yzymq5gc6dNPXiADSoh+K3Ue5
         OAJqgEYIB2lUt+BbDDJD6Rc74s6+7ehad/z/E229h9BCOFWck2xkd0YL9jGUFizH42fI
         sqouPCQoBW5lnGFKiV8C8ylY8iq2Sewpdv3UowIKNffGAbeO94pXmkF+J10fCgdMUoOA
         dy3jxaAwkkMfDlSweQZcSwn3H948nKPZnsDROLAK9fDdRkG+9bGDRI02x4K+LTriZ+Dl
         LvCA==
X-Forwarded-Encrypted: i=1; AL+hErEJSojeupiv/u8Rc8YSM+MY7dDG3+RsLiZntfC8a3xX0KNPdP/o+x2FqVb64v7hrPFWvBgLSt4nGBuauxMPcyjs@lists.infradead.org
X-Gm-Message-State: APuU4Z/iSCdc7m3TOrKXKIgz3NGKJHHf6EWHb0keQYV5exmCq+t54Gno
	60QUeppnutjYlDGqvsYHy+kI/seDeaFWbhBdMSAX/275OZ+b8WVKxVMHuzWIy4mdZJk=
X-Gm-Gg: AZFdTZdADhlVvtyTOEAxiFJ7FqjHYfp/Qi6iBuQW1zlt6RT7m9uw8F5UuTal9rg6Ft9
	nitqg6J9ATaDEPt3Ovw8FtvvBY5m7OInK+SdSAe9ovWTHJYftXbGY77YHJ5pEamrFtbUCh36wJ2
	PMCx/wlLPfja+SAJbwCLDsPZ9E8ZkGBR8BJu9z7FKLIR6Teeh6ruBbiVLg6BchMAeYWN3z0ffJD
	YrqA8DH7maV4HodugxK11qGaWXW9iNr1tBfQ/KgQdSHCNyfDfLDMJTosYxWNPzxSmpFHmRgdQv1
	cz9oGehMp7uEQseot51VQx1b696iuYoaP4RQB2DmqjUoD15jGesI0y+5SR90iUnGMhSAqpa3T4N
	CZNXDd4hP7wmZ88mj884CEbrYAy5OeiKOcPYcdiluLvTjKYy8Mer10kt0XvSiUL+wy4kqcSWOLw
	oPLubb+TqTfltxwfCIXPSCH6M/I3I2meIhALsvShbvKuKN86STEkFDeccMOhkR4EEsst0HzAez3
	WYE51+OT0pLJ6T9buW2Jn1/SDZ5TvYpXOA1hEIU4DJSJm1Lh6oobybZ9RsXOMW42I2mHwAIVLbz
	4U1mDlJJkUAVHKHr36KAE0kAtuWqo/ZYSdFnmoQgK1YcBuxsnofmm43ZQQN04uWvDk47EW7ULkY
	Y2jg6rqmpXjZek3jd/1MDade4+aUiI6KZAT/ljN18LGmUarzsR2eDrFjNmmgJySDfIPK4tXUShY
	bE8zhBdUdfw3ZjBBH6VhSl1WUDiPRR6aceQD8MdSLwr8J43AU=
X-Received: by 2002:a05:600c:4515:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb888267f4mr179692205e9.29.1795341578657;
        Sun, 22 Nov 2026 01:59:38 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm342455265e9.13.2026.11.22.01.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:59:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
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
Subject: [PATCH v2 3/4] pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 10:59:18 +0100
Message-ID: <20261122095927.2631909-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
References: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_015940_440692_DBFD7A89 
X-CRM114-Status: GOOD (  27.76  )
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

Changes in v2:
- Take the references once the probe can no longer be deferred
- Clear the boot-on state when the domain is powered off
- Release the references when the driver is removed

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 96 ++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 7d6735728d8c..5ab201eefeb3 100644
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
@@ -187,11 +190,80 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
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
+	if (!bc_data->boot_state_readable ||
+	    !dev_pm_genpd_is_on(bc->bus_power_dev))
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
+	if (!domain->boot_on)
+		return 0;
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
@@ -199,6 +271,7 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	struct imx8m_blk_ctrl *bc;
 	void __iomem *base;
 	int i, ret;
+	bool init_off;
 
 	struct regmap_config regmap_config = {
 		.reg_bits	= 32,
@@ -303,7 +376,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx8m_blk_ctrl_power_off;
 		domain->bc = bc;
 
-		ret = pm_genpd_init(&domain->genpd, NULL, true);
+		init_off = imx8m_blk_ctrl_is_off(bc, bc_data, data);
+		ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 		if (ret) {
 			dev_err_probe(dev, ret,
 				      "failed to init power domain \"%s\"\n",
@@ -312,6 +386,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		domain->boot_on = !init_off;
+
 		/*
 		 * We use runtime PM to trigger power on/off of the upstream GPC
 		 * domain, as a strict hierarchical parent/child power domain
@@ -328,10 +404,20 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		bc->onecell_data.domains[i] = &domain->genpd;
 	}
 
+	/*
+	 * The probe can no longer be deferred. Releasing these references
+	 * would power down the domains left on by the bootloader.
+	 */
+	for (i = 0; i < bc_data->num_domains; i++) {
+		ret = imx8m_blk_ctrl_get_boot_on(&bc->domains[i]);
+		if (ret)
+			goto cleanup_boot_on;
+	}
+
 	ret = of_genpd_add_provider_onecell(dev->of_node, &bc->onecell_data);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to add power domain provider\n");
-		goto cleanup_pds;
+		goto cleanup_boot_on;
 	}
 
 	bc->power_nb.notifier_call = bc_data->power_notifier_fn;
@@ -353,6 +439,10 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
 cleanup_provider:
 	of_genpd_del_provider(dev->of_node);
+cleanup_boot_on:
+	while (i--)
+		imx8m_blk_ctrl_put_boot_on(&bc->domains[i]);
+	i = bc_data->num_domains;
 cleanup_pds:
 	for (i--; i >= 0; i--) {
 		pm_genpd_remove(&bc->domains[i].genpd);
@@ -374,6 +464,7 @@ static void imx8m_blk_ctrl_remove(struct platform_device *pdev)
 	for (i = 0; i < bc->onecell_data.num_domains; i++) {
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
 
+		imx8m_blk_ctrl_put_boot_on(domain);
 		pm_genpd_remove(&domain->genpd);
 		dev_pm_domain_detach(domain->power_dev, true);
 	}
@@ -709,6 +800,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mn_disp_blk_ctl_domain_data[]
 
 static const struct imx8m_blk_ctrl_data imx8mn_disp_blk_ctl_dev_data = {
 	.max_reg = 0x84,
+	.boot_state_readable = true,
 	.power_notifier_fn = imx8mn_disp_power_notifier,
 	.domains = imx8mn_disp_blk_ctl_domain_data,
 	.num_domains = ARRAY_SIZE(imx8mn_disp_blk_ctl_domain_data),
-- 
2.43.0


