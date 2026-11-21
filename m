Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2373D606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TI5WTQXd;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=cfNIGr+5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1h753CULixRQZV3ySqCP3XiaZBqrtw8lU8DJVEzgARQ=; b=TI5WTQXdBXhvAL
	bIKEKpOooV1tLVrLZA0x0mo9qlRG6HyinldAq+4Xs1YDY5wgkPrfbZGdD2h1DoMoBepX93ooUxhtR
	N1IeA57evkB0pOyUioAW2KcVvGngHVyv0BZNdwLC2DfS5cBo9uv712gtoAptDfaMPP3r+YgIJWXCq
	jNANFlG8uP5SrLCY53ZWpV61UuwiERQoADvCMeNJBE/tgDlPIFsIad3PVCCvMyUHnnUbjFrfF0Gm/
	39gxxMnKhVCeRvE4W71sFGU6oPFShsAi2YhMxo4Sk2OMtrp/eDhM7pxdarM0QDRf2tji3Ai/C3RTQ
	HPEkJVUWmDilfWkHBeIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUknX-0000000HErH-42Zc;
	Sat, 21 Nov 2026 13:06:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUknR-0000000HEoQ-2clg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 13:06:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so21857965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 05:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795266384; x=1795871184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1h753CULixRQZV3ySqCP3XiaZBqrtw8lU8DJVEzgARQ=;
        b=cfNIGr+5177O4UAT6V/TIHnsFKUzFNrYVQL9lmicPuwhalK1/TMrSyIHP0Bpn+XPSF
         xEGl/TSmT0EffLsvQVEpuK1PdpNSgK2F0L7kw1h0X0wBb7QTlpRUqDwbY9AEnZu4EIN5
         QZFNN6/Pqby38anX9/WgJJyun+L4KcNuV86zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266384; x=1795871184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1h753CULixRQZV3ySqCP3XiaZBqrtw8lU8DJVEzgARQ=;
        b=PcuS2jbeMvfNlsWR6KWnS7MDUEuiv4iiJsw/BEfaYzYqmv7bcWnu2Ypyk5Ie6Nlh/b
         EtvrRVRk7yy6cMRWBJaif2HE2136dc6tN1ggJLNvdOqfOlKhujKtOMclz/hPigGl5oV4
         MJ1seWFE+uWOC7ELW9g/WRwrd+N9XPLZUALP2Tlb/wfXVg6NxP6C7vE0+BzVpmlvYgml
         NV/uDPVQrA/0lz967jSyx/hBKZyOAd1r1BVankHH8BNZO/Tg2ZHj9wuxP0VCUgGRCXai
         6lpNOS4bFQqvHpRAc/qjTYTAGm+yMScJoGGnQWEyoDhleAn7HkpP9QPrFumMUi0egaZ7
         DRnw==
X-Forwarded-Encrypted: i=1; AL+hErFjkqAFMdXWr7Vs4pAvKKFKL/Cr3LJ7pSDGRJu4IxG/05os/B+3lgx0fGqmGcKthgOmO58X7caOBpdjhd9M1r+x@lists.infradead.org
X-Gm-Message-State: APuU4Z/HjMiTEvQDYxfu8f87i1/lqNVRasO2Uq8hQWo3ysW2GyYuEc4i
	gNWbmHlxZqpRWSURhoihVLjulIGbCTrTip7plugYrISNcmbxVIqtznHx8ZGGe6f+6sw=
X-Gm-Gg: AZFdTZf8UeCUjLt6Emv9EgHkAHslmzhUC5rHiafK6ynS0ycGvtehERbth22Mjbq41f8
	2qRog/gtG0C7652rL+c0bekubpyTmWT5gs0X/ag0lR+urTyPIM4RCSHipwWXTCc1vd0k5/fCIY1
	ADUbsdZLjel3t4EkTjXcmRXn9R077St+efpwzpMsZZfaPzh/y88R0jKXkCP0qEQ1iItmGJ4OQLW
	pKL00BqSImI05lHxz4Pj5jrVpFQGM1ZMEx/RK7m0JtPqT0CRL8lm/06tWlEA8jHs+fL8C3ss67W
	6bX5gcGGbhZI3wj4Qc1aA5vbsdJdvmEr7fFUqqcKDa5UtOSVCXpv/y1RbpHIzzttkt3ZbTUc6bl
	xm7s9DeyUZ/FgynGm6gAiWkTCQgyrdUMVs5n68l81PVn8I/vMzpauHRjDWnsKeglZNtu1MovFwi
	Snx3vLeyHivwgCPlUr+nRGuGPfxSSnznW+bZ6UxN+fd/xC1Rr5VfGCwrI89iUUIkNIx5X6OoOo5
	q+ppkF2dsT2lcl26QyudTsnK2noHyqN8mmWUGazLIi6xWFWw5pDbc3w/ieXqitfjDSeqe28CfQ+
	EmhPwt2EgIT2O3omRRYbCQWI5MFgB3FSZQtCzCNF5ghsTa7UMvAhQ8np2GwmfY3vGousRVDFZeR
	Wt+JWquKMvvpnBAfd7+uujXZV3ydp3pYu7imsk0qH5WrPHfHEkGSg+h4I5IvRl4krfuXuAIZfFH
	N2OPmDNT47RT9/D53VYfRd+joWJg==
X-Received: by 2002:a05:600c:5308:b0:4bb:76d6:1f5d with SMTP id 5b1f17b1804b1-4bb887ca192mr144536875e9.2.1795266383641;
        Sat, 21 Nov 2026 05:06:23 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm47196545e9.3.2026.11.21.05.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:06:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 2/3] pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
Date: Sat, 21 Nov 2026 14:06:09 +0100
Message-ID: <20261121130614.2482656-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
References: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_050625_699239_C6AD005F 
X-CRM114-Status: GOOD (  22.58  )
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

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 83 ++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 9df933a7a238..35087da43dd7 100644
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
@@ -192,6 +195,71 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
 
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
+	pm_runtime_put(domain->power_dev);
+	pm_runtime_put(domain->bc->bus_power_dev);
+	domain->boot_on = false;
+}
+
 static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 {
 	const struct imx8m_blk_ctrl_data *bc_data;
@@ -199,6 +267,7 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	struct imx8m_blk_ctrl *bc;
 	void __iomem *base;
 	int i, ret;
+	bool init_off;
 
 	struct regmap_config regmap_config = {
 		.reg_bits	= 32,
@@ -303,7 +372,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx8m_blk_ctrl_power_off;
 		domain->bc = bc;
 
-		ret = pm_genpd_init(&domain->genpd, NULL, true);
+		init_off = imx8m_blk_ctrl_is_off(bc, bc_data, data);
+		ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 		if (ret) {
 			dev_err_probe(dev, ret,
 				      "failed to init power domain \"%s\"\n",
@@ -312,6 +382,15 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!init_off) {
+			ret = imx8m_blk_ctrl_get_boot_on(domain);
+			if (ret) {
+				pm_genpd_remove(&domain->genpd);
+				dev_pm_domain_detach(domain->power_dev, true);
+				goto cleanup_pds;
+			}
+		}
+
 		/*
 		 * We use runtime PM to trigger power on/off of the upstream GPC
 		 * domain, as a strict hierarchical parent/child power domain
@@ -353,6 +432,7 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
 	for (i--; i >= 0; i--) {
+		imx8m_blk_ctrl_put_boot_on(&bc->domains[i]);
 		pm_genpd_remove(&bc->domains[i].genpd);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
@@ -707,6 +787,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mn_disp_blk_ctl_domain_data[]
 
 static const struct imx8m_blk_ctrl_data imx8mn_disp_blk_ctl_dev_data = {
 	.max_reg = 0x84,
+	.boot_state_readable = true,
 	.power_notifier_fn = imx8mn_disp_power_notifier,
 	.domains = imx8mn_disp_blk_ctl_domain_data,
 	.num_domains = ARRAY_SIZE(imx8mn_disp_blk_ctl_domain_data),
-- 
2.43.0


