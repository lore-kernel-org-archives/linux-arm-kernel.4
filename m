Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C68606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TEpOhF3e;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOG4icat
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q+GtbyKG6IlUifjaNkVYhqRiK3cIEWpsM/x3VFQZRLc=; b=TEpOhF3e5pjjxt
	+veA75C/haivTpEI0+FnEtDdg6bZvrTcWzbPH0gAEN6xofjHn3lcOCqjHB7oVj7PODUAiljIfYxOK
	V7KKLXF2P5LurcxgAlfCapodyVbvEpl9zG9CO60Lw+aGTTkl6/prtXMnlpSohbI8VYBf9PsL/pbk1
	TV19vchp6EDS1v7NhyVkeQ/qpu51jTZkmiNOE8nNzbhnB/ojyKJ9RcyCYrLePdpwXhXUxJd1R8vZx
	/JNCQRbOoAQKBcCXNC/6/ElGNXMsZIy3iAsSU3xzTWMA4jUMROmq1NwmvLQR9wl7YjN7/oUFpFcAD
	74Y8krbMQVulGsbdpD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcX9-0000000DwgW-40k2;
	Thu, 26 Nov 2026 16:41:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcX5-0000000DweN-0oNo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:41:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-491971ac844so6427224f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711273; x=1796316073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+GtbyKG6IlUifjaNkVYhqRiK3cIEWpsM/x3VFQZRLc=;
        b=gOG4icatxALJB1c2/xdK53UrovIOpvo6HrGV4AuKjUNw1Bda3I+VRn5hn3+xt9j9+7
         go3qBeZB2Bf1d2wjcmUTDFkYvInGC2sjUyVxL6rASjIvH5i8anlG3FTp39Oe3sHSsYU5
         552spL3cvBGKSIGRxUZvOaXeAUJNrWdy1bELj3QXyKz0kuaElh/d/969YM38swq0vHpz
         7AeMjMQnNbumNuBJT84f6dszc20nAU6+iT14SmAggILsHfEvRgs4bk0efhltbTVf6wH3
         K5ucyJ8MgErPeezjfW8E9oAUTc76f/Fft0H1JlDGN5bFyPXsodPGJwdH/ncso9ImK/mG
         RCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711273; x=1796316073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+GtbyKG6IlUifjaNkVYhqRiK3cIEWpsM/x3VFQZRLc=;
        b=ztDjLgSkDCt0BddxIdTOibMUCYxeN9bgCTyYFybYdvGMLLAeo7XKte3kQuM8rXDdSQ
         RmYOrrxhJjvoCjBjyVrRFILOqDeHNOn4wiQThgg6KqsvKiMbcSldklE/qTFjxmwdjyvI
         nZzhT7TVZSR2m8cYqdIjY7h7iycT/24e9D3b/C718i1rIG0kiEwoIqKgmFGbKetTevRQ
         CeRI3FYlZEFDVvtdYx3GEFq5MwIIadEK+W/HT/Q3bhHlGh7/VUQL/9jTsKXCmCsTHKZN
         SIpH2ftM9Sv74Q/67uY6yWRWDE1EOMFiPCsGWy55wGBVUTEK+kzMuu+o3lZIxo8LYUoG
         u5nw==
X-Forwarded-Encrypted: i=1; AL+hErGZVXMFL/HpuzJE76c8Mw8KOdMEQrpTCjyncoKQHVyqFIR5BLnbTWbD2O+6TbCfrc6fyYUchMNnJW7w3Q0xmolU@lists.infradead.org
X-Gm-Message-State: APuU4Z9BC9OWm5hW3N8bmlOSUhxDJa+ZJfOo7Hgq3I/0lOpb0z6+kELj
	sl26JBiYnWhZgC0Lk87Z1qKo5+MzQBfSDvNtX7RN93xmlPxfjSMFZnQh
X-Gm-Gg: AZFdTZf0Fs4aesEZx2GgfEGvFvUo1pZec4lL1/SyoCrSB+RuEMp8/MRvCO32QHVeYOT
	8MZF9iSVxL7N6cCHGtGmCawjjrhu1gJNrTGeIz115pDQHQBNZiOPUc/uQSJ2SIT1xwXncnaTExn
	pP4Zz06xI5jaNUw0p6/w17rKodppAabuV+NK6ZmuGZIG0H5DdHYYaiq8R5rahSLf96vhGBnNAm/
	zGQ0MJlAIGNWY/hreko3I1I390qnAJdyxGtsw/ZBS+Hiewq43tPVabTV83BG3nTGK4xinVnhSyY
	CssqjgRVq6dxBsYKb9hXO/1gV5uav3hIqFq44mefHeg4d5AczPKcXonXHQAmT8ytxk6+jzjP9s7
	NNRX4tM8iXVDfXaL157uax/mAwKGYf4NQrGpJ08T+kn6ybFXEx38OUFqPcCIfIF00W0Gqwu1lI3
	XgYtTXqoVDnjbgl9N6hiB6+H1xcYZJLsrVSKk7OB0ognZ9tr83fDkR5ZkZuDWfx/5trXtHtHEeg
	saPudblDQ9zMLtQ/R56KxsYGdLNbsLVfu1M1wB5U+voKUQE2DBfiBAOR8eCYyRq7lb1ePsyR8GY
	7nAigzpJtV4eTosTRi9XrlzFXqq9MC8LQA==
X-Received: by 2002:a05:6000:4616:b0:491:8286:5f0e with SMTP id ffacd0b85a97d-4abb514609amr37651209f8f.55.1795711273012;
        Thu, 26 Nov 2026 08:41:13 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:6ce3:c28c:2097:7d09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39333942f8f.34.2026.11.26.08.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:41:12 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@nabladev.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Stach <l.stach@pengutronix.de>,
	Advait Dhamorikar <advaitd@mechasystems.com>,
	Peng Fan <peng.fan@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 1/2] pmdomain: imx8m-blk-ctrl: fix suspend/resume order
Date: Thu, 26 Nov 2026 16:40:58 +0000
Message-ID: <20261126164058.2373605-5-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126164058.2373605-4-ivitro@gmail.com>
References: <20261126164058.2373605-4-ivitro@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_084115_326791_5C0BBC8B 
X-CRM114-Status: GOOD (  24.87  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vitor Soares <vitor.soares@toradex.com>

The GPC domains behind a blk-ctrl are driven with runtime PM on the
virtual devices from dev_pm_domain_attach_by_name(). Runtime PM is
disabled in the noirq phase, this is why the ->suspend callback exists:
it keeps the virtual devices runtime active, so the runtime PM calls in
imx8m_blk_ctrl_power_on() and imx8m_blk_ctrl_power_off() do not fail in
the noirq phase, while the genpd core powers the GPC domains off and on
through the virtual devices. This requires the virtual devices to resume
before the consumers of the blk-ctrl domains: genpd_resume_noirq() of a
consumer calls imx8m_blk_ctrl_power_on(), which accesses the blk-ctrl
registers expecting the bus domain to be on.

Nothing orders the virtual devices in dpm_list: they have no parent and
no device link to the blk-ctrl or its consumers. On i.MX8MM the VPU
codecs resume before the virtual devices and the CPU hangs in
genpd_resume_noirq() of 38310000.video-codec. The system never resumes
from suspend to mem; with a watchdog running, the board is eventually
reset. The same happens on i.MX8MP with the media blk-ctrl, where the
CPU hangs in genpd_resume_noirq() of the MIPI CSI-2 receiver, and with
the VPU blk-ctrl when the hantro-vpu module is loaded after the blk-ctrl
has probed.

Add a stateless device link from the blk-ctrl to each virtual device,
bus domain included, so they are suspended after and resumed before the
blk-ctrl and its consumers.

Fixes: 2684ac05a8c4 ("soc: imx: add i.MX8M blk-ctrl driver")
Cc: stable@vger.kernel.org
Reported-by: Advait Dhamorikar <advaitd@mechasystems.com>
Closes: https://lore.kernel.org/all/CAAPs2HTo=4+AEw1+vcU6c9vt_O2BfF+gv3FFvx9G3KLLzCOsHw@mail.gmail.com/
Closes: https://lore.kernel.org/all/fccbb040330a706a4f7b34875db1d896a0bf81c8.camel@gmail.com/
Suggested-by: Lucas Stach <l.stach@pengutronix.de>
Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Link the bus domain virtual device too (Francesco)
- Add the per-domain links right after attaching, before pm_genpd_init(),
  so the error paths stay symmetric (Francesco)
- Rewrite the commit message: v1 described the ordering as a
  parent/child effect, but the virtual devices have no parent; their
  dpm_list position relative to the consumers depends on probe order
- Explain why the ->suspend callback is needed, as asked by Ulf on v1
- Add the i.MX8MP media blk-ctrl report from Advait
- Drop Lucas' Reviewed-by, the diff changed
- Update the ->suspend comment, the order now comes from the device
  links
- Rebase on ulfh/linux-pm fixes

v1: https://lore.kernel.org/all/20240418155151.355133-1-ivitro@gmail.com/
---
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 29 +++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 9df933a7a238..ba44cad02351 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -250,6 +250,17 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 					     "failed to attach power domain \"bus\"\n");
 	}
 
+	/*
+	 * Make the genpd virtual devices suppliers of the blk-ctrl so that
+	 * they are suspended after and resumed before the blk-ctrl and all
+	 * its consumers.
+	 */
+	if (!device_link_add(dev, bc->bus_power_dev, DL_FLAG_STATELESS)) {
+		ret = dev_err_probe(dev, -EINVAL, "failed to link to \"bus\"\n");
+		dev_pm_domain_detach(bc->bus_power_dev, true);
+		return ret;
+	}
+
 	for (i = 0; i < bc_data->num_domains; i++) {
 		const struct imx8m_blk_ctrl_domain_data *data = &bc_data->domains[i];
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
@@ -298,6 +309,15 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!device_link_add(dev, domain->power_dev, DL_FLAG_STATELESS)) {
+			ret = -EINVAL;
+			dev_err_probe(dev, ret,
+				      "failed to link to \"%s\"\n",
+				      data->gpc_name);
+			dev_pm_domain_detach(domain->power_dev, true);
+			goto cleanup_pds;
+		}
+
 		domain->genpd.name = data->name;
 		domain->genpd.power_on = imx8m_blk_ctrl_power_on;
 		domain->genpd.power_off = imx8m_blk_ctrl_power_off;
@@ -308,6 +328,7 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			dev_err_probe(dev, ret,
 				      "failed to init power domain \"%s\"\n",
 				      data->gpc_name);
+			device_link_remove(dev, domain->power_dev);
 			dev_pm_domain_detach(domain->power_dev, true);
 			goto cleanup_pds;
 		}
@@ -354,9 +375,11 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 cleanup_pds:
 	for (i--; i >= 0; i--) {
 		pm_genpd_remove(&bc->domains[i].genpd);
+		device_link_remove(dev, bc->domains[i].power_dev);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
 
+	device_link_remove(dev, bc->bus_power_dev);
 	dev_pm_domain_detach(bc->bus_power_dev, true);
 
 	return ret;
@@ -373,11 +396,13 @@ static void imx8m_blk_ctrl_remove(struct platform_device *pdev)
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
 
 		pm_genpd_remove(&domain->genpd);
+		device_link_remove(&pdev->dev, domain->power_dev);
 		dev_pm_domain_detach(domain->power_dev, true);
 	}
 
 	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
 
+	device_link_remove(&pdev->dev, bc->bus_power_dev);
 	dev_pm_domain_detach(bc->bus_power_dev, true);
 }
 
@@ -392,8 +417,8 @@ static int imx8m_blk_ctrl_suspend(struct device *dev)
 	 * can power down our domains and more importantly power them up again
 	 * after resume, without tripping over our usage of runtime PM to
 	 * control the upstream GPC domains. Things happen in the right order
-	 * in the system suspend/resume paths due to the device parent/child
-	 * hierarchy.
+	 * in the system suspend/resume paths due to the device links to the
+	 * genpd virtual devices added in probe.
 	 */
 	ret = pm_runtime_resume_and_get(bc->bus_power_dev);
 	if (ret < 0)
-- 
2.53.0


