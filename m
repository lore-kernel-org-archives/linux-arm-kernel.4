Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D06606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N61uWRmM;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aUwwWrhV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BlXwq6e5uLfBG6i7v3zQQBNsfUZ7M/ptQpeTZ0epfD8=; b=N61uWRmMokE4su
	uxgYKYzqQD9SGdBndK5fDhJOhv+mB0Mq2AFHboWptG/cwSsMQpBxfnO3w79Rgtw5es3gzAUIiYns6
	3EJnrCtFd6hbDMxp5iL4YRVue4cmrb4fA367CRVB+G+F+qu64BBgGglfgWQGuIe0GXx429b4nvaL/
	00rIsJLbK1iCbBM/E5q2IilvwiEGQpujpFO1n3PofaecRxdC06KqcAYEe7fJrF41IilYPvUPgbpdy
	UUG2ifim3i9YwVrgGhAzGfl8ZGRX5QvCEOr1YT2MsZz7Dyp7GCGaoxRBDeZYvKZiQl/p1HFquf9TX
	ylDmQTevmplRBviVu7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDPc-00000004lDA-1YbF;
	Tue, 17 Nov 2026 07:15:28 +0000
Received: from out-122.mta1.migadu.com ([95.215.58.122] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDPP-00000004l3z-2oKq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:15:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=c6YRxFHQ4d67zvszv7CQoix0mMpRpP6JHVOJd5jF0pU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899714; v=1; x=1795504514;
 b=aUwwWrhVHR701Z2vxpLf8388kYdHk/XjqVnPnG5dwVm4HQykcESMKghWklpWGGjCec/8yhNJ
 /DthzVkxWrG0JTGUbROquxAMwrLIELeihzPFk3FvodN+XlKhGGmvC53l9yJfj93kpoAtX5BtYKz
 PEJcUtdkxsDV5Q8pVQbfvwlM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a6958a8986243bd0;
	Tue, 17 Nov 2026 07:15:13 +0000
X-Mizu-Trace-ID: a6958a8986243bd0
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:12 +0800
Subject: [PATCH 8/8] irqchip/imx-intmux: Use
 devm_pm_runtime_set_active_enabled()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-imx-intmux-v1-8-189e7e0ad98d@nxp.com>
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
X-CRM114-CacheID: sfid-20261116_231517_747032_4D61EB5F 
X-CRM114-Status: GOOD (  13.09  )
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

Use devm_pm_runtime_set_active_enabled() to manage the runtime PM
enablement instead of calling pm_runtime_set_active() and
pm_runtime_enable() manually. The devres actions then disable runtime PM
and mark the device suspended when probe fails or the driver is unbound.

Keep the explicit pm_runtime_get_noresume()/pm_runtime_put() pair so the
device is still suspended immediately after a successful probe, and keep
pm_runtime_put_noidle() in remove() to drop the reference acquired by
pm_runtime_resume_and_get().

The devres teardown runs after imx_intmux_remove() and disables runtime
PM before marking the device suspended, which is the order required by
the PM core. The IPG clock devres action still disables the clock last.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 1f6e5d9c797a..770656ef10ec 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -234,9 +234,11 @@ static int imx_intmux_probe(struct platform_device *pdev)
 	data->channum = channum;
 	raw_spin_lock_init(&data->lock);
 
+	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
+	if (ret)
+		return ret;
+
 	pm_runtime_get_noresume(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
 
 	for (i = 0; i < channum; i++) {
 		data->irqchip_data[i].chanidx = i;
@@ -286,7 +288,6 @@ static int imx_intmux_probe(struct platform_device *pdev)
 							     hwirq));
 		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
-	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	return ret;
 }
@@ -312,11 +313,8 @@ static void imx_intmux_remove(struct platform_device *pdev)
 		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
 
-	pm_runtime_disable(&pdev->dev);
-	if (ret >= 0) {
+	if (ret >= 0)
 		pm_runtime_put_noidle(&pdev->dev);
-		pm_runtime_set_suspended(&pdev->dev);
-	}
 }
 
 #ifdef CONFIG_PM

-- 
2.56.0


