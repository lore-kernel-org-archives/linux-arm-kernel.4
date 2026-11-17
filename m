Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D340A606A887
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bp0umEOT;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qxwcWPSF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CEtV9Of40PlIkgls/ESF0YVCrLHY2cnVFegrd0OWX3U=; b=Bp0umEOTbiOXHJ
	YxDBZonQFPCnkItRY6hhMJQ+U4QgVe8OhyQcZuhR/K6R36YuMqOsX/0GmAe6QKBQsQ18hh643f6eU
	t7g152+j55y76GpJzgGFupY5CoFKQU2xMtU2JSBjSolshBrpLNRXnvTAHfGkSCpzR4njQA40YOKJB
	ngLsXcM+tgqKvj3JP7B/YP3pbOyqyY2TGe+eqtRhbkhh+GlC8zJaMgYbkmHTfY+c7M0AG2gq8ZHQM
	fnMxqi1+GJscRcLs29Bg4lKrKtetS1hBC+pWyY6UI2THm/yvWcJ/WTKVQ9sPp+55FnGPxK+OPXOCK
	ekgT90fHCNOyKZdGtuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDPE-00000004kwb-2PMj;
	Tue, 17 Nov 2026 07:15:04 +0000
Received: from out-99.mta1.migadu.com ([95.215.58.99] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDPA-00000004ksC-1Fg3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:15:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Wwhk/gDwsoNFkoxCGTnT6H0lIHt7+Q74XS0tvVACqJA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899698; v=1; x=1795504498;
 b=qxwcWPSFkfxxzVOiPYsFJIcNsIzUaZgf8sUkwjLouMsdm3KKhmgv0aDc/3HgMOeMrK+ZVCQw
 rzhNeFGdWmWeGbi3I8RMR0455+yoDtQ0uTK6EOxVXU4QKETKUMOlsMAggiuksGwgEECpuBqJ0oH
 CG1c3OkY3hKGdSb2nnKdQ7J4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e02f4fff576faa84;
	Tue, 17 Nov 2026 07:14:58 +0000
X-Mizu-Trace-ID: e02f4fff576faa84
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:10 +0800
Subject: [PATCH 6/8] irqchip/imx-intmux: Use devm_clk_get_enabled()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-imx-intmux-v1-6-189e7e0ad98d@nxp.com>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
In-Reply-To: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_231500_494257_0E3EEAB5 
X-CRM114-Status: GOOD (  10.98  )
X-Spam-Score: -2.8 (--)
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

Enable the IPG clock with devm_clk_get_enabled() so that it is enabled
during probe and automatically disabled when the device is detached.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index ebfff621e5a9..755c07007390 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -226,7 +226,7 @@ static int imx_intmux_probe(struct platform_device *pdev)
 		return PTR_ERR(data->regs);
 	}
 
-	data->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
+	data->ipg_clk = devm_clk_get_enabled(&pdev->dev, "ipg");
 	if (IS_ERR(data->ipg_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
 				     "failed to get ipg clk\n");
@@ -234,12 +234,6 @@ static int imx_intmux_probe(struct platform_device *pdev)
 	data->channum = channum;
 	raw_spin_lock_init(&data->lock);
 
-	ret = clk_prepare_enable(data->ipg_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
-		return ret;
-	}
-
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -294,7 +288,6 @@ static int imx_intmux_probe(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-	clk_disable_unprepare(data->ipg_clk);
 	return ret;
 }
 
@@ -323,7 +316,6 @@ static void imx_intmux_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	if (ret >= 0) {
 		pm_runtime_put_noidle(&pdev->dev);
-		clk_disable_unprepare(data->ipg_clk);
 		pm_runtime_set_suspended(&pdev->dev);
 	}
 }

-- 
2.56.0


