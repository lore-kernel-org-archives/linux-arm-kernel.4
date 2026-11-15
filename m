Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C982D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o33hGm9q;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RGDraQCl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TfR1MQe16bqqOEP5/Aiu81npw9CFsZbejn/lzaModFc=; b=o33hGm9qvDs8ZJ
	vZGR/JXSFfQpRv45uDE6dU1LrwdkSAAOFmsUJbcESgP///3fjri3aLEZLCGWRqPFvhQXUHxVxVDcG
	q+eQPwKJAAk1R+DkzQPMNPEQni3V0TLSRrBLluEphZaCcdviUU7uEnFPbxanjVmQ2ocZLGLwd4vfq
	2Af9vD7dlpzqgHKrnpzHv/ZS8a3Udh9jlV+EyxQvee8hvUYeVCoAyt1H8HtuO2Pb6mhUAKhSNru5O
	VXUm9rdOzImLq+WecIEN1cQBHeHT7bWX17LhK4x82Df9vnLcdoL3Hup82ZiOi+3MuwCsfjcFA5U7T
	SqEJLNORaGZd1AbxC26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaxX-000000001SR-32DP;
	Sun, 15 Nov 2026 14:11:55 +0000
Received: from out-93.mta0.migadu.com ([2001:41d0:1004:224b::5d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaxU-000000001Qu-4Aq8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:11:54 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VpRiYUFHP1GYsEvyF7mXGqQ3VU4ihCdki3Xz2CHYzYY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794751911; v=1; x=1795356711;
 b=RGDraQCljZZeNJvqhFsnsQMhzKotbz/xhRwnndDTNxjRELwq7hyJHh5PuxxjquykTfcWaGhX
 +qolEbnCmBBan+O02Rd/WTIebYJ3aeETsyt19Al3kqAZq79/xBxLRHs1aMGdEH2uenCclLhqQER
 9xEUtouHpNKSxcXrZbyZE2uw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1f05fa239dcfefbe;
	Sun, 15 Nov 2026 14:11:50 +0000
X-Mizu-Trace-ID: 1f05fa239dcfefbe
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sun, 15 Nov 2026 22:11:26 +0800
Subject: [PATCH 2/2] irqchip/imx-mu-msi: Fix PM domain teardown on probe
 errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-imx-mu-msi-v1-2-8beb58854ca4@nxp.com>
References: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
In-Reply-To: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_061153_187464_0400F96F 
X-CRM114-Status: GOOD (  16.83  )
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

From: Peng Fan <peng.fan@nxp.com>

dev_pm_domain_attach_by_name() creates a virtual device for each
attached PM domain, which must be released with dev_pm_domain_detach().
The probe error paths only remove the device links, leaking both
virtual devices. They also return -EINVAL instead of the actual error
from imx_mu_msi_domains_init() and log the wrong domain name when the
link for the second domain cannot be created.

Detach the PM domains on every failure path and propagate the real
error code. Since the power-domains property is optional in the
fsl,mu-msi binding, treat a NULL domain as "not present" and skip the
corresponding device link rather than failing the probe.

Fixes: 70afdab904d2 ("irqchip: Add IMX MU MSI controller driver")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-mu-msi.c | 69 ++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index c42ea0797624..42e930caed8d 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -300,8 +300,8 @@ static const struct imx_mu_dcfg imx_mu_cfg_imx8ulp = {
 static int imx_mu_probe(struct platform_device *pdev, struct device_node *parent,
 			const struct imx_mu_dcfg *cfg)
 {
-	struct device_link *pd_link_a;
-	struct device_link *pd_link_b;
+	struct device_link *pd_link_a = NULL;
+	struct device_link *pd_link_b = NULL;
 	struct imx_mu_msi *msi_data;
 	struct resource *res;
 	struct device *pd_a;
@@ -345,33 +345,38 @@ static int imx_mu_probe(struct platform_device *pdev, struct device_node *parent
 		return PTR_ERR(pd_a);
 
 	pd_b = dev_pm_domain_attach_by_name(dev, "processor-b-side");
-	if (IS_ERR(pd_b))
-		return PTR_ERR(pd_b);
-
-	pd_link_a = device_link_add(dev, pd_a,
-			DL_FLAG_STATELESS |
-			DL_FLAG_PM_RUNTIME |
-			DL_FLAG_RPM_ACTIVE);
-
-	if (!pd_link_a) {
-		dev_err(dev, "Failed to add device_link to mu a.\n");
-		goto err_pd_a;
+	if (IS_ERR(pd_b)) {
+		ret = PTR_ERR(pd_b);
+		goto err_detach_a;
 	}
 
-	pd_link_b = device_link_add(dev, pd_b,
-			DL_FLAG_STATELESS |
-			DL_FLAG_PM_RUNTIME |
-			DL_FLAG_RPM_ACTIVE);
-
+	if (pd_a) {
+		pd_link_a = device_link_add(dev, pd_a,
+					    DL_FLAG_STATELESS |
+					    DL_FLAG_PM_RUNTIME |
+					    DL_FLAG_RPM_ACTIVE);
+		if (!pd_link_a) {
+			dev_err(dev, "Failed to add device_link to mu a.\n");
+			ret = -ENODEV;
+			goto err_detach;
+		}
+	}
 
-	if (!pd_link_b) {
-		dev_err(dev, "Failed to add device_link to mu a.\n");
-		goto err_pd_b;
+	if (pd_b) {
+		pd_link_b = device_link_add(dev, pd_b,
+					    DL_FLAG_STATELESS |
+					    DL_FLAG_PM_RUNTIME |
+					    DL_FLAG_RPM_ACTIVE);
+		if (!pd_link_b) {
+			dev_err(dev, "Failed to add device_link to mu b.\n");
+			ret = -ENODEV;
+			goto err_remove_link_a;
+		}
 	}
 
 	ret = imx_mu_msi_domains_init(msi_data, dev);
 	if (ret)
-		goto err_dm_init;
+		goto err_remove_links;
 
 	pm_runtime_enable(dev);
 
@@ -381,12 +386,20 @@ static int imx_mu_probe(struct platform_device *pdev, struct device_node *parent
 
 	return 0;
 
-err_dm_init:
-	device_link_remove(dev,	pd_b);
-err_pd_b:
-	device_link_remove(dev, pd_a);
-err_pd_a:
-	return -EINVAL;
+err_remove_links:
+	if (pd_link_b)
+		device_link_remove(dev, pd_b);
+err_remove_link_a:
+	if (pd_link_a)
+		device_link_remove(dev, pd_a);
+err_detach:
+	if (pd_b)
+		dev_pm_domain_detach(pd_b, true);
+err_detach_a:
+	if (pd_a)
+		dev_pm_domain_detach(pd_a, true);
+
+	return ret;
 }
 
 static int __maybe_unused imx_mu_runtime_suspend(struct device *dev)

-- 
2.56.0


