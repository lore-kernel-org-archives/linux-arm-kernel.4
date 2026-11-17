Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85F6606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p3SWiBpD;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CfRKj918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M/WdrMEavsqH0hS/EUDB3nkK/xjCmst2SoRbgl+9Ebc=; b=p3SWiBpDMOBuE8
	9aBAc5hYR7l2AQ4fTfUCi6NfYO9JN4e5aFFRy5SF+nPhZFoQRaiIG8Yw4+jWzyzGXScfy3+5J1bG9
	4FHB9zOpj3HO0Xkh3jsYGyQurOM7zfzT/1KtIw9A2KpWMLcPW8WFpK2L1dN6vboStUvzaL/VMwJlW
	BWIOZSEAbeXwwi8xRoXZhXkFfjlBj6levTvduWGbeORC9Oq8dtabsDfYPn/SGX5xCuYyP013vX2SK
	XcUUIDdcti4aM6kR/Y0ipiJvy9oOWEUS9vaTKj80oRzJLbD44f2zDOdZ2cfIkVNGiVhU3p26uSQIm
	EXH9WmR4SGpPHFzvhegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDOl-00000004kgC-449A;
	Tue, 17 Nov 2026 07:14:35 +0000
Received: from out-62.mta0.migadu.com ([2001:41d0:1004:224b::3e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDOh-00000004ken-0wrl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:14:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zwbhnDtt3vpTEzSOmj+MMGszUoWlFbw/XBu9eV7HxV0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899669; v=1; x=1795504469;
 b=CfRKj918Dz9PvQ0E8PYSnikHSmKszbQ3SAZ1UnYFSk3DczxTn14ZalGZ8QTp/VXhz5xrkszm
 PKZEzXd59g5WEILHVb8rXCP1oa4/hD4XDQFuDjSVd9iDjttJUl/oxktjBYEVrNuqLkzp1907Bmc
 Dy7anJSVtIQjCm1hwBCFtmGs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4256e9d7da406d0d;
	Tue, 17 Nov 2026 07:14:29 +0000
X-Mizu-Trace-ID: 4256e9d7da406d0d
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:06 +0800
Subject: [PATCH 2/8] irqchip/imx-intmux: Dispose IRQ mappings on remove
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-imx-intmux-v1-2-189e7e0ad98d@nxp.com>
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
X-CRM114-CacheID: sfid-20261116_231431_417316_AF57568D 
X-CRM114-Status: GOOD (  10.99  )
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

The driver removes its IRQ domains without disposing the mappings
created for their 32 input lines, and it never releases the parent
IRQ mappings obtained with irq_of_parse_and_map(). Removing a domain
while mappings are still present leaves those descriptors pointing at
a freed domain, and the parent mappings leak on every unbind.

Unchain each output interrupt, dispose the child mappings and the
parent mapping, and only then remove the domain.

Fixes: 2fbb13961e74 ("irqchip: Add NXP INTMUX interrupt multiplexer support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index a9eda7646e2f..644282228f1a 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -312,8 +312,11 @@ static void imx_intmux_remove(struct platform_device *pdev)
 			writel_relaxed(0, data->regs + CHANIER(i));
 		irq_set_chained_handler_and_data(data->irqchip_data[i].irq,
 						 NULL, NULL);
-
+		for (unsigned int hwirq = 0; hwirq < 32; hwirq++)
+			irq_dispose_mapping(irq_find_mapping(data->irqchip_data[i].domain,
+							     hwirq));
 		irq_domain_remove(data->irqchip_data[i].domain);
+		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
 
 	pm_runtime_disable(&pdev->dev);

-- 
2.56.0


