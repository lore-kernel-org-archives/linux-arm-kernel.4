Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B96606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lyu6nB99;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=oR7BrOvm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8K0cfCfqUv0w+a1bum5L9vcom6pDs+Jx7qFAqrqGDxc=; b=Lyu6nB99++B1nO
	4IoUxGzAMBxyfujFn5EDV6/XjL/9R2X1dgJF56n5k9SvnFows+H6bFB6Gi7n4QDSeGsFogN/uEx2F
	IvY0yvzaf6VAmKZygMWbIxICocIghNiZQwvQcf4XKDWilA2D0HDLnuEJ7OhpnhrjrblpEP3VnfPCK
	oYUa1iUfKHuasLY1vjvdPy1s0ozafTUUSG+kZrPbTf4gl2ljFUTPmssnIZWbL8p0t7fXo5BQUM7qt
	E0meUjsEjN9Qq6t3/597AMQc1TGRSde+kN+oarWgK85aWOpnQEuCl0zCRk/MkugPF/jPJ5/2sHtNH
	p7q+yruXrWuplcAZ8WRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9uc-00000001ImX-2X12;
	Sun, 22 Nov 2026 15:55:30 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9ua-00000001Ikg-0ql2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:55:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1997638f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795362926; x=1795967726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8K0cfCfqUv0w+a1bum5L9vcom6pDs+Jx7qFAqrqGDxc=;
        b=oR7BrOvmHM4QbZqslDVEMfCxxcCf2Ri5LuxCZ88+3uVWvWvgg7wIiE8AV2XS3QveWI
         zXvYraG9jEldMMpt5BOHdalHMzPCy5FlVd/pYq5k3wPfNcDBWJgooFzWdYmsfVSC3/Qe
         YaBp1tGP1BKe/+5yrIy6IfiIfoLkJmKjYtOBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362926; x=1795967726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8K0cfCfqUv0w+a1bum5L9vcom6pDs+Jx7qFAqrqGDxc=;
        b=QpXTGDO/wWOdeIhHbKlD2G3u0hgtwxKwykbV8tAkSVqY/gHI7clnyaFSYYOCh9UkwC
         v4h/Vqad3uDLGPCUqiL0D8Iq1HtoLKpLwaYCuvduhM3pEcZxVYcqlu3ScymyhoSIEnHH
         Wf7DzsoGUxJgMdpUEeLdK6VmZkPuIcIxgmtq3U9lQhAMsfMZPbUEoa0JWOQJtfvZeiIo
         avydn/we+YSDAWPQ3lfysaGlu8vaGFF6U/WKgRAJq/92YO7kQEBbXqyO/7irYjO+C0Qw
         DLF94rKhBL6rIA/wHuPJxyzSt9w/ZpIC4gVq2nD9GpEfJ7f4n73/wF6oqwhRcjnqjLHX
         A5Sw==
X-Forwarded-Encrypted: i=1; AL+hErFdj9e1nHWqG1/fZbpbSKhM1s9nOCnK7ryEXwFabgyOP2yfrjMtPu+/dbjXa2eQhCGRYI7LxUfp1zRat5Uk2a2A@lists.infradead.org
X-Gm-Message-State: APuU4Z+ayMBaMJSHKljhRep16dMmrmxr4RXqsQYeeFMiHRNMFzBYNDJO
	GF5OhVxecMAvlGHyiQ9Hz1CX4ssK2H2KHS2pmsAvHl/U+GeMHMiWt+1XP+dOztrUK/4=
X-Gm-Gg: AZFdTZfS1xojkmqaWbqnseVLWu45g8CXJyOekhc5NCe8v0IKH2zKnUDJAOTc4xRsWeY
	ewW7tuF2bzWKcrPVU2D2aHU4x9vhTPcvbhI9xZgKrTH+g2GtZ4mHSTvSv1vn/OtbF0j9LTyB0rs
	tw+HSyNRY1nhf4TOmjaRmHhUYlHsvcBmLjqpXQMs95FvO3UquE0URg9jJQP6kgAWbgenMHiqXXY
	3SNBGf3+FGandQDNIQvzvIAdOEDkX5pdVC7JA4cUdmNO6bSLU8V7AkC7Og2+IGXsWJ2PcJuD2Is
	LSFBb+5Z/KtqSy6Wf3tCqc3fywqQ59jHZHSXLUQYPJ1Udr3fIsJndgFbDpsmUsnl5JjPE3gsftZ
	wasmym8S02NoeJSwM7KMye6zjp3wjvdpZYQLuYI1EAXWKM5tDXfK78wMr/K5k5oc+co5obs2RB8
	hDg0WDECFQgy+Y5/X40gQMwwM+/65RFn5FFuR8G908JBjaw2sM3C4SIVRXKs7BnhJlq8Nf42veT
	4bh6UKaJmUEep4lETEuD9E1TKCrX9yOQz2eMss+xLevvp9iGdfdP6dHoMQDTyfLQtVBBIrxhknV
	aztQ1KI2QpXLREEuEZo9bHRIfiO4UxpGMUUYQ9SMcl+TpeDG7O4yoHTmmZrFiNDn3JPYvJLm2mi
	1bmauqezWljBPju4LXQmWHVO4AfKrMgAA4lJd7+APx4tADyFpBkuh1dpybG5PbL/rFyFP5XVxmH
	XeeroFYTkUMIwWglJtRcMywU0tGEI=
X-Received: by 2002:a05:6000:2dc7:b0:4a5:bb9f:9c3c with SMTP id ffacd0b85a97d-4abb4c7ac0dmr21854740f8f.53.1795362926211;
        Sun, 22 Nov 2026 07:55:26 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm20046526f8f.55.2026.11.22.07.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:55:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 3/4] pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 16:55:10 +0100
Message-ID: <20261122155514.10289-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
References: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_075528_281357_4645B647 
X-CRM114-Status: GOOD (  28.57  )
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

Changes in v3:
- Keep the bus domain on while the state of the domains is read
- Remove the domains before releasing their boot-on references

Changes in v2:
- Take the references once the probe can no longer be deferred
- Clear the boot-on state when the domain is powered off
- Release the references when the driver is removed

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 108 +++++++++++++++++++++++++-
 1 file changed, 107 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 7d6735728d8c..99d75bfb69e9 100644
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
@@ -250,6 +322,17 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 					     "failed to attach power domain \"bus\"\n");
 	}
 
+	if (bc_data->boot_state_readable) {
+		/* Keep the bus domain on while the state is read */
+		ret = pm_runtime_resume_and_get(bc->bus_power_dev);
+		if (ret < 0) {
+			dev_err_probe(dev, ret,
+				      "failed to power up bus domain\n");
+			dev_pm_domain_detach(bc->bus_power_dev, true);
+			return ret;
+		}
+	}
+
 	for (i = 0; i < bc_data->num_domains; i++) {
 		const struct imx8m_blk_ctrl_domain_data *data = &bc_data->domains[i];
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
@@ -303,7 +386,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx8m_blk_ctrl_power_off;
 		domain->bc = bc;
 
-		ret = pm_genpd_init(&domain->genpd, NULL, true);
+		init_off = imx8m_blk_ctrl_is_off(bc, bc_data, data);
+		ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 		if (ret) {
 			dev_err_probe(dev, ret,
 				      "failed to init power domain \"%s\"\n",
@@ -312,6 +396,9 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!init_off)
+			boot_on |= BIT(i);
+
 		/*
 		 * We use runtime PM to trigger power on/off of the upstream GPC
 		 * domain, as a strict hierarchical parent/child power domain
@@ -328,6 +415,16 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
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
@@ -347,6 +444,9 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	if (ret)
 		goto cleanup_notifier;
 
+	if (bc_data->boot_state_readable)
+		pm_runtime_put(bc->bus_power_dev);
+
 	return 0;
 
 cleanup_notifier:
@@ -356,9 +456,13 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 cleanup_pds:
 	for (i--; i >= 0; i--) {
 		pm_genpd_remove(&bc->domains[i].genpd);
+		imx8m_blk_ctrl_put_boot_on(&bc->domains[i]);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
 
+	if (bc_data->boot_state_readable)
+		pm_runtime_put_sync(bc->bus_power_dev);
+
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


