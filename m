Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E1C606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bLGRpQj5;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZHecvaiQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wKJtGPqUh8xd1e5gRSCSrRuD1kv5RiOZcl5rDs0i/H0=; b=bLGRpQj5uzV6n7
	qDHTIbw3Am+OZBPAHhi2oYBqzOL8b8pGKApV8I0QvrMvr45ua35l20xW7N68m/TbP+P3zNgFhddKO
	kG7Wkuo2gJoHrCGQ77Ot2HrXy1yLl7Mozw1IHE443cOzAwg8UgT5natlYw/tr8wchwTom+L9F6ErL
	PYMWsgNsCocoMNEQf+XhHdvvl04rjtKsl+uBcOumH3IM1ocjSDkmIH2jdim+Uz4fbFz9iBdGsf+28
	0DOQm6kHMhnA+C4+9pCL3IOk7YJHwQ/GFyqi48ZI9kqfzqESpPvMEK/wW/TbfWKWS7jvx+yLMtaow
	c5TI0FOdCtv/ENe1Aa2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDPP-00000004l51-0uFJ;
	Tue, 17 Nov 2026 07:15:15 +0000
Received: from out-110.mta1.migadu.com ([95.215.58.110] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDPF-00000004kwJ-3GHC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:15:07 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=egOOHYWo88XqIsFmRrJ9jNqDbHUnSeRXeEa+bS/h07s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899704; v=1; x=1795504504;
 b=ZHecvaiQA5gt/14YhiLhtDW/Br2QboeyBwUzeh38lXl3TSXoLDwP5SdhgIOU3L4yToezvy4p
 grE4/YG+TqFO/Cx5/qKk+KcwkSOdGnU6nH/l/bODrWHQqB9WdHA2UB+gQ/66zR6YGq7h6/dnUqI
 mUzVHiKPq+zdug9XSdwzsPaQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d5b6e237ac341039;
	Tue, 17 Nov 2026 07:15:04 +0000
X-Mizu-Trace-ID: d5b6e237ac341039
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:11 +0800
Subject: [PATCH 7/8] irqchip/imx-intmux: Use
 devm_irq_domain_create_linear()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-imx-intmux-v1-7-189e7e0ad98d@nxp.com>
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
X-CRM114-CacheID: sfid-20261116_231505_975906_1F95EB56 
X-CRM114-Status: GOOD (  10.39  )
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

Manage the per-channel IRQ domains with devres so that they are removed
automatically when probe fails or the driver is unbound, instead of
calling irq_domain_remove() explicitly in the probe error path and in
imx_intmux_remove().

The child mappings are still disposed explicitly before the domains go
away. devres runs after imx_intmux_remove(), so each domain is removed
with an empty reverse map, and the domains are torn down before the IPG
clock devres action disables the clock.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 755c07007390..1f6e5d9c797a 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -248,8 +248,9 @@ static int imx_intmux_probe(struct platform_device *pdev)
 			goto out;
 		}
 
-		domain = irq_domain_create_linear(of_fwnode_handle(np), 32, &imx_intmux_domain_ops,
-					       &data->irqchip_data[i]);
+		domain = devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&pdev->dev), 32,
+						       &imx_intmux_domain_ops,
+						       &data->irqchip_data[i]);
 		if (!domain) {
 			ret = -ENOMEM;
 			dev_err(&pdev->dev, "failed to create IRQ domain\n");
@@ -283,7 +284,6 @@ static int imx_intmux_probe(struct platform_device *pdev)
 		for (unsigned int hwirq = 0; hwirq < 32; hwirq++)
 			irq_dispose_mapping(irq_find_mapping(data->irqchip_data[i].domain,
 							     hwirq));
-		irq_domain_remove(data->irqchip_data[i].domain);
 		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
 	pm_runtime_disable(&pdev->dev);
@@ -309,7 +309,6 @@ static void imx_intmux_remove(struct platform_device *pdev)
 		for (unsigned int hwirq = 0; hwirq < 32; hwirq++)
 			irq_dispose_mapping(irq_find_mapping(data->irqchip_data[i].domain,
 							     hwirq));
-		irq_domain_remove(data->irqchip_data[i].domain);
 		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
 

-- 
2.56.0


