Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC0E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uwqmeOYQ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=S+EnR4c8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1b6l3YGau032EVeygYOJg5BVqWTm176W8bz28Sny1EU=; b=uwqmeOYQaDraza
	nSr3PNm/hxgC/8FipzTo5kCt+H2NxXej4C7eevE9z3wJMtqwqxvd+iLTjheV2yyZClaY6Xg7Mm1Iq
	eL1k82dYcqJw2orCHzLQESphKliUNQgsVGuIB4fGiyK7uNHOzhsLecDB0w1NPNP9CXVP4sOVMw8kn
	atUziMiYhXnJGaFXDxR9Hh9JzYVr+KL1wahoX0SSH/rBPgBL2D6GBgJDoEA9APEMThADCdi+zXcof
	bCIG8QIoL+zl1d8U1KSHvlorfMaz/Bak1OQt0N7qHu6hQGbxg4ZCqhhjL5nJLHDkdg9BzG6LxIYJ/
	aGOHR18MNNncB2+HqNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDOd-00000004kdr-3eMX;
	Tue, 17 Nov 2026 07:14:27 +0000
Received: from out-56.mta0.migadu.com ([2001:41d0:1004:224b::38] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDOb-00000004kcx-34IK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:14:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=coC0tS1tygocqhlfhKcWZR4OuG6pBS7PG4xBtlX2tl4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899664; v=1; x=1795504464;
 b=S+EnR4c808pVdkEfhQammIz+1lKHhvK1LquPtUyRC+DfFLLIEBK22rCYcMP/yw6ArcIjsZTn
 TitX6Ee1Wbexv9tiaw9f+g7lGC1nzQcHVlOiJjLjLCzbG+QZUzTZLx0CJYXx9/2T9bHaNAh3pyY
 DcGwX2x383+AJE12cSc2gWL4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2885ca772be6b0d2;
	Tue, 17 Nov 2026 07:14:24 +0000
X-Mizu-Trace-ID: 2885ca772be6b0d2
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:05 +0800
Subject: [PATCH 1/8] irqchip/imx-intmux: Fix probe error path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-imx-intmux-v1-1-189e7e0ad98d@nxp.com>
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
X-CRM114-CacheID: sfid-20261116_231425_921424_6B684928 
X-CRM114-Status: GOOD (  12.93  )
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

When setting up a channel fails after previous channels have been
initialized, the error path only disables the clock. The chained
handlers of those channels stay registered with handler data pointing
into the devres-managed intmux_data, which is released when probe
fails, leaving dangling pointers behind. The created IRQ domains and
parent IRQ mappings are leaked as well.

Unwind the initialized channels, tear down runtime PM and only then
disable the clock. Also enable the clock before touching runtime PM so
that a clock failure cannot leave runtime PM enabled with an
unbalanced usage counter.

Fixes: 2fbb13961e74 ("irqchip: Add NXP INTMUX interrupt multiplexer support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index c7914fea3d1f..a9eda7646e2f 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -233,16 +233,16 @@ static int imx_intmux_probe(struct platform_device *pdev)
 	data->channum = channum;
 	raw_spin_lock_init(&data->lock);
 
-	pm_runtime_get_noresume(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-
 	ret = clk_prepare_enable(data->ipg_clk);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
 		return ret;
 	}
 
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
 	for (i = 0; i < channum; i++) {
 		data->irqchip_data[i].chanidx = i;
 
@@ -258,6 +258,7 @@ static int imx_intmux_probe(struct platform_device *pdev)
 		if (!domain) {
 			ret = -ENOMEM;
 			dev_err(&pdev->dev, "failed to create IRQ domain\n");
+			irq_dispose_mapping(data->irqchip_data[i].irq);
 			goto out;
 		}
 		data->irqchip_data[i].domain = domain;
@@ -281,6 +282,17 @@ static int imx_intmux_probe(struct platform_device *pdev)
 
 	return 0;
 out:
+	while (i--) {
+		irq_set_chained_handler_and_data(data->irqchip_data[i].irq,
+						 NULL, NULL);
+		for (unsigned int hwirq = 0; hwirq < 32; hwirq++)
+			irq_dispose_mapping(irq_find_mapping(data->irqchip_data[i].domain,
+							     hwirq));
+		irq_domain_remove(data->irqchip_data[i].domain);
+		irq_dispose_mapping(data->irqchip_data[i].irq);
+	}
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	clk_disable_unprepare(data->ipg_clk);
 	return ret;
 }

-- 
2.56.0


