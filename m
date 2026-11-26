Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59204606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ud3OVfxz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TYIwQmwE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jU16bWHumwV20jpiMrBRT2UNHlED4a7CUl264/set1s=; b=Ud3OVfxz7LH9L+
	coWmN96m2Aeg4dAhF/T0gMfsDLbBB0oT7xRi8tlET5HRSpdmLDazXNT5n3Gf+WQAhE+2co+v/IKIZ
	1wZLBGWbp0poxnMi7J9uUGigJbICAOatT0wJfj2LYob4PNfkNFW6/ZVmaQz8NqK51bwA1rKYUAMUk
	V1RJKkgGFP/RFbhODjPsJn0DaxXjEXpdmgU8zlMNL27ARL3DOPdlohsfU2A2u1YFnOv7QwyTRMw6B
	9ovmIDxm5zBGnhAQR6CjqsoCivbPt94goMuhGAV5NBVrY9EkHoxlqa53biN1Nyox32hpJlRDDiRw0
	cvafj8Gu0ZCxDSrR68eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcXI-0000000Dwk3-0YOA;
	Thu, 26 Nov 2026 16:41:28 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcX6-0000000DwfK-3zYj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:41:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48e3b22e971so3832450f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711275; x=1796316075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jU16bWHumwV20jpiMrBRT2UNHlED4a7CUl264/set1s=;
        b=TYIwQmwErED5wf47Lzoet5w4CJBcQ/iVOWyf4/tQp7sAEYfFgCmnfRKl55hlu+TGva
         azucfSkdlVDK9JMw2gIi9GUXl1LkVBajMMBO22vJ5CMp4e6EvwqzZKMGVzK5sbUxWHsx
         hg6FzJ35vz6vEzjwpBc9ISB6H3Oc2hWr5/eElqTJTYeG0SHzhQ4d6M2KQJ/wqxyFLGSY
         NukcQYuxsVxQ3LPF8t5DtH/CFmHUkKbN27EhEAxrVWrpfXf2iyR6brHqohG5Rtwa+Cud
         jphxyx+AXHogS3YCPqHOy2tEu36zIyCbkmO2lI/cge2lIVquiwrQu3cHcpv1jJzw+1JJ
         DKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711275; x=1796316075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jU16bWHumwV20jpiMrBRT2UNHlED4a7CUl264/set1s=;
        b=XiWZpD97oTm4OYwmASEPGOIMTN90otO66jimFrEFY7bBXuj7rIKhOYhj7MlVhydqSU
         Kv+oCp6Iv28UvPB1DN8RJfxxktzUIZx00EHUYZiKIKKJi0l0tcedkvWlRig/Q7Ggy8do
         i7o410zqQHUfZwxjagpJq8wDHTPL4iKRr21Km/9iKTGe54biOjD+Pu3fFUjXGBodooqS
         h/8N0LuyeArgm6ODlOXevWj40P2BxTxDGzqzTvTng55sIdsNftqm6zsBK6OB0Xa9v8/K
         i8mibknMv6MM472G55kDl2H7sUvtElZPLxNHo5ZtdE18q/DHADtw2J1GbJrLIMoqkvuR
         BKVQ==
X-Forwarded-Encrypted: i=1; AL+hErHsDucS7nl5j4IjvcEk18MfL5K+ss6pcjS8JbDB0N4TF6FAbA7M8OifKMO4/4tp8tVk520tt2lTslfbkOqo6m74@lists.infradead.org
X-Gm-Message-State: APuU4Z8oumWZT8F3J/0LEbPqhNB12cReO1ykYsmLasYdY9lkEPn11KTd
	vzi68U8EfrjJm6FWoHSzl1DEZlcvzsDY0OmJYTPLrXQaGb558WOXT6cx
X-Gm-Gg: AZFdTZdY56Rv8xWQXrVLSVFvtv1awUVVADORHJ07WJXfKVLu8xk9G4pjjzmEFt5a7KO
	gzB8P6vMZRtASpsfcZU5l8hVM6QtuFs8xUsCMFD/0l6JHxftt6PI00mpDN0r7OY5gq6UYRtpAUc
	4aAluX4/umf+j087FU4ab1I0IZGBeKaIpOYBILJm1Nqt8n/MZCgzQ4JxCDL7OLgVlLZJPWvDMOg
	wC32rHortL1ivJT5B5JHTKP/rVu1JXg+NGQzgr8kAR9eGDH+QU8DhUmF0b9hWVi5K1f7E/DmLOq
	xBWhn8w583M565dbvba3Aq08HBh5cDrATEKsnnnE7lQ3pzRrcTemCf5GygwJcpKytNYFtri23p5
	hn43quhPK8J3itAIPyH2MVqIqApCqiiowtkNrW6NQeHqWcNo2dXOyC+vIU5HwFkOxSZTYt/Qrn4
	hqyrCRBrSnAQ2kfSXavqwmr07dKFMQrNi7c8XXx3agUvhpY5goXHIm/eFfpE9Y4C3lXpp9ujnGV
	vbJHav28/dK6jRwM2arsZeJ5uacEKOsd7v1TkFL0CgutwKQFWMwA6QSQpn3OF87EODVeypBtD51
	jRoRilRwx9HbIPdWdvOYA2fChzo8ro3cNOGXHNXQ288Uv3CR0Z2uYtA=
X-Received: by 2002:a05:6000:4b1e:b0:48c:7143:610c with SMTP id ffacd0b85a97d-4abb2910b8fmr41814928f8f.36.1795711274674;
        Thu, 26 Nov 2026 08:41:14 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:6ce3:c28c:2097:7d09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39333942f8f.34.2026.11.26.08.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:41:14 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Stach <l.stach@pengutronix.de>,
	Advait Dhamorikar <advaitd@mechasystems.com>,
	Marek Vasut <marex@nabladev.com>,
	Peng Fan <peng.fan@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 2/2] pmdomain: imx8mp-blk-ctrl: fix suspend/resume order
Date: Thu, 26 Nov 2026 16:40:59 +0000
Message-ID: <20261126164058.2373605-6-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126164058.2373605-4-ivitro@gmail.com>
References: <20261126164058.2373605-4-ivitro@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_084117_025726_F3642BDA 
X-CRM114-Status: GOOD (  17.77  )
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

As in imx8m-blk-ctrl, the GPC domains behind the HSIO and HDMI blk-ctrl
are driven through the virtual devices from
dev_pm_domain_attach_by_name(), which have no parent and no device link
to the blk-ctrl or its consumers, so nothing orders them in dpm_list.

On Verdin iMX8MP, with the phy-fsl-imx8m-pcie module loaded after the
HSIO blk-ctrl has probed, the virtual devices are suspended before the
PCIe PHY, and the CPU hangs in genpd_suspend_noirq() of
32f00000.pcie-phy with the HSIO bus domain already off. The system
never completes suspend to mem.

Add a stateless device link from the blk-ctrl to each virtual device,
bus domain included, so they are suspended after and resumed before the
blk-ctrl and its consumers.

Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
Cc: stable@vger.kernel.org
Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 29 ++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
index 212d491c75e4..e967ae7eda30 100644
--- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
@@ -657,6 +657,17 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(bc->bus_power_dev),
 				     "failed to attach bus power domain\n");
 
+	/*
+	 * Make the genpd virtual devices suppliers of the blk-ctrl so that
+	 * they are suspended after and resumed before the blk-ctrl and all
+	 * its consumers.
+	 */
+	if (!device_link_add(dev, bc->bus_power_dev, DL_FLAG_STATELESS)) {
+		ret = dev_err_probe(dev, -EINVAL, "failed to link to bus\n");
+		dev_pm_domain_detach(bc->bus_power_dev, true);
+		return ret;
+	}
+
 	bc->power_off = bc_data->power_off;
 	bc->power_on = bc_data->power_on;
 
@@ -716,6 +727,15 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!device_link_add(dev, domain->power_dev, DL_FLAG_STATELESS)) {
+			ret = -EINVAL;
+			dev_err_probe(dev, ret, "failed to link to %s\n",
+				      data->gpc_name);
+			dev_pm_genpd_remove_notifier(domain->power_dev);
+			dev_pm_domain_detach(domain->power_dev, true);
+			goto cleanup_pds;
+		}
+
 		domain->genpd.name = data->name;
 		domain->genpd.power_on = imx8mp_blk_ctrl_power_on;
 		domain->genpd.power_off = imx8mp_blk_ctrl_power_off;
@@ -726,6 +746,7 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 		ret = pm_genpd_init(&domain->genpd, NULL, true);
 		if (ret) {
 			dev_err_probe(dev, ret, "failed to init power domain\n");
+			device_link_remove(dev, domain->power_dev);
 			dev_pm_genpd_remove_notifier(domain->power_dev);
 			dev_pm_domain_detach(domain->power_dev, true);
 			goto cleanup_pds;
@@ -775,10 +796,12 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 cleanup_pds:
 	for (i--; i >= 0; i--) {
 		pm_genpd_remove(&bc->domains[i].genpd);
+		device_link_remove(dev, bc->domains[i].power_dev);
 		dev_pm_genpd_remove_notifier(bc->domains[i].power_dev);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
 
+	device_link_remove(dev, bc->bus_power_dev);
 	dev_pm_domain_detach(bc->bus_power_dev, true);
 
 	return ret;
@@ -795,12 +818,14 @@ static void imx8mp_blk_ctrl_remove(struct platform_device *pdev)
 		struct imx8mp_blk_ctrl_domain *domain = &bc->domains[i];
 
 		pm_genpd_remove(&domain->genpd);
+		device_link_remove(&pdev->dev, domain->power_dev);
 		dev_pm_genpd_remove_notifier(domain->power_dev);
 		dev_pm_domain_detach(domain->power_dev, true);
 	}
 
 	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
 
+	device_link_remove(&pdev->dev, bc->bus_power_dev);
 	dev_pm_domain_detach(bc->bus_power_dev, true);
 }
 
@@ -815,8 +840,8 @@ static int imx8mp_blk_ctrl_suspend(struct device *dev)
 	 * can power down our domains and more importantly power them up again
 	 * after resume, without tripping over our usage of runtime PM to
 	 * control the upstream GPC domains. Things happen in the right order
-	 * in the system suspend/resume paths due to the device parent/child
-	 * hierarchy.
+	 * in the system suspend/resume paths due to the device links to the
+	 * genpd virtual devices added in probe.
 	 */
 	ret = pm_runtime_get_sync(bc->bus_power_dev);
 	if (ret < 0) {
-- 
2.53.0


