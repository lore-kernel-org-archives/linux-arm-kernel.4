Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B300606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FfgjjUts;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=G0GI+Yei
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=; b=FfgjjUtseGR0J0
	w8ea7HIf1zNo+t27eK1NzIxBBS3eZH+CvGTOheYfq8KtMMaFAKNVJjvZ+m1r2MhUHmFqNpJg4O1qa
	esn3cpoxt029te9w/uototgQ46aTUm6fLSWQ5e7pYmpNscXDFXQBgGOKmkuU+RXX52roXnkxSHBLm
	oxwVbwQlXm4T/ItCM5ci35a65gfrbkDCnRNwhOEsEYmTn4PvfeVbDJOxI6WYDB8TnWHNp+v7jaxet
	1UfBhnDfhU7iOvY7qhzotUoo6hNA7cahII6vsNCtr0KfSvovFeiyAymSEJfufSpCGnFDHn8AbU9ML
	c4bsxGQv8KmXi1NAOmaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuy3-0000000G5E8-31Ie;
	Fri, 27 Nov 2026 12:22:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuut-0000000G3A0-1oYz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so62587185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781942; x=1796386742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=;
        b=G0GI+YeiQ4rKGZUCDTVBBy1soKw/s6v8Ub5Y5EtLvlnYPVcC5HZ2T1rUVt7T9q6X/z
         19zGaJBZ650mU1ktt8IFVQ6POtsEZJfkYnC0kQKfchSwIuDmBJQk5wUOA0U/MjcAG4dG
         R59y6abu2m8bcCSqWhDPjbrtlVUVvAD7feJQlr7XJcdyX1uWU4n6gj/mOaCkTromnd/P
         e8uhNPc28luGzMm734f+jhaXPqPiKaKNgoo3UEz/VV99tVoOGJwxZPRFPXu2MLEMFUlw
         wAAZo88LbBTGsSbNOE84LCOBZSJavUsQ7HRyrpuFDZSgwSG8S7tKLeMdtN5hqJznQ/u+
         C4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781942; x=1796386742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=;
        b=N9hH4Cn42OxU4saiupiQIfe8iFoNaJb2Ca/5+f5sMtGJx9oteFKUv1MeAefJ1C2mrk
         GGrTotcE0McJ/1BTKfAN3k2ebX//IkmLa9HREdXgX/Be9nD3C9MPWM0xOynGpKx26eQ7
         5/GwOJVdcjYwxNTK3/8/uQ0UGnheRa28YG+2BoI6QaJ4agYjlHV90+q4BuoKgtLmYOeB
         lhxgg79svz35cDtX9UA2PorlXedZuRPL4AFW7w7sKIm2/rg1BzfhZKJ78QxtR+xT/qoC
         xk133NS3iWtaH1kq97F+3DHoOpeiYBYDxc/+b1nc8UDmTufFqJwB/k3yW3VJlBPMilJI
         57LQ==
X-Forwarded-Encrypted: i=1; AL+hErEug81Zi4o+8GD2/v7Zxhzdlwl7ROp7NkMryQbVXK+Q7hE89MIINN8QAc7RDzryrh01WwUAhopdTioMPj7YTZw6@lists.infradead.org
X-Gm-Message-State: APuU4Z8DOQzMhRoTHxU5UkHrsUt8BnBsjMFD2J1Gx0g7UOxpOIU9CeK1
	GXT/bGQvbM2Ci/l6qoTi31DHBvJINq2luYnEUt3eRRHUx4+P7EdzIXYJfhz1K/SJ3WU=
X-Gm-Gg: AZFdTZeEJd9/6W2fooGWvH95o4nPkdjd8mq2pk/WzWvkREQaoA11us7qgD19nHtDGUu
	P/9soX9iTrq3BJiXO73q14uonOxWA87fHMXY+U0NHce5m2UTGfJIM7njbI+aJt3dQ1EjVkQTIex
	4j6C7T3kx4Vc4BwmuXjLQairePMwgJHKrbff1dIfZyoqL8tjUUDMbDLifdB+pA09N9inKPnBBBI
	n6HK2v6pAKTRKuvvbZGIrWeKCZZ2hgbXGuBVD7a8lH2mGDhxIx6VXHY5/MNsSjCQUbgRKoWCFwb
	QcCXlkhL88kBh1IPH7WyCuWgduFduvcZ+WzbHWuwJSMQXOakgV+b1m1bFQuQGp7jaR/IeX33Rig
	/ZsAOUR2hEa77MvxdAtFD2bgo1Ydi9rRJuYnGfV3Xr3GMGJzF6HlIRI/KhDSCSXzcscmR+VCuds
	gb315tcJatUgw2pEWjYanCr2U4R9Y9DGfK/xM/WBcnFKiH8+KaClcuYCAUro3cbw2PHpBYpVByK
	lgbOzieo8/co/wb7sDQ/aOyLeIPK9GbDz6VBvHATz5b/w3SnaDzaeyV83xctypdjt+e+d9NA9Ue
	OwSSAQtOMPXSS83GQ6fHRVUljCXL
X-Received: by 2002:a05:600c:4ecd:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4bb8881e81cmr508102915e9.29.1795781941754;
        Fri, 27 Nov 2026 04:19:01 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm623834055e9.1.2026.11.27.04.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:01 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>,
	Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: [PATCH v4 15/28] spi: bcm2835: Pass the CPU physical address of the FIFO to the DMA engine
Date: Fri, 27 Nov 2026 13:22:05 +0100
Message-ID: <20261127122236.4976-16-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041903_530615_0145C769 
X-CRM114-Status: GOOD (  19.84  )
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

The addresses in struct dma_slave_config are CPU physical addresses, and
the DMA controller driver is responsible for translating them into its
own view of the bus. The driver instead reads the untranslated address
out of its reg property, which only happens to be what the BCM2835 DMA
controller expects because the DMA engine driver used the address
verbatim.

Now that the DMA engine driver translates slave addresses itself, use the
CPU physical address of the register resource, which also gets rid of
the open coded parsing of the DT node.

Also zero-initialize the slave configuration: the TX channel only sets
the destination address, while the DMA engine driver now maps every
address that is provided.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/spi/spi-bcm2835.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index cc5748973281..c40157e4516a 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -24,7 +24,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h> /* FIXME: using GPIO lookup tables */
@@ -888,23 +887,12 @@ static void bcm2835_dma_release(struct spi_controller *ctlr,
 }
 
 static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
-			    struct bcm2835_spi *bs)
+			    struct bcm2835_spi *bs, phys_addr_t phys_base)
 {
-	struct dma_slave_config slave_config;
+	struct dma_slave_config slave_config = {};
 	struct device *tx_dma_dev;
-	const __be32 *addr;
-	dma_addr_t dma_reg_base;
 	int ret;
 
-	/* base address in dma-space */
-	addr = of_get_address(ctlr->dev.of_node, 0, NULL, NULL);
-	if (!addr) {
-		dev_err(dev, "could not get DMA-register address - not using dma mode\n");
-		/* Fall back to interrupt mode */
-		return 0;
-	}
-	dma_reg_base = be32_to_cpup(addr);
-
 	/* get tx/rx dma */
 	ctlr->dma_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(ctlr->dma_tx)) {
@@ -926,7 +914,7 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 	 * or, in case of an RX-only transfer, cyclically copies from the zero
 	 * page to the FIFO using a preallocated, reusable descriptor.
 	 */
-	slave_config.dst_addr = (u32)(dma_reg_base + BCM2835_SPI_FIFO);
+	slave_config.dst_addr = phys_base + BCM2835_SPI_FIFO;
 	slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	ret = dmaengine_slave_config(ctlr->dma_tx, &slave_config);
@@ -967,9 +955,9 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 	 * RX FIFO or, in case of a TX-only transfer, cyclically writes a
 	 * precalculated value to the CS register to clear the RX FIFO.
 	 */
-	slave_config.src_addr = (u32)(dma_reg_base + BCM2835_SPI_FIFO);
+	slave_config.src_addr = phys_base + BCM2835_SPI_FIFO;
 	slave_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	slave_config.dst_addr = (u32)(dma_reg_base + BCM2835_SPI_CS);
+	slave_config.dst_addr = phys_base + BCM2835_SPI_CS;
 	slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	ret = dmaengine_slave_config(ctlr->dma_rx, &slave_config);
@@ -1355,6 +1343,7 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr;
 	struct bcm2835_spi *bs;
+	struct resource *res;
 	int err;
 
 	ctlr = devm_spi_alloc_host(&pdev->dev, sizeof(*bs));
@@ -1377,7 +1366,7 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
 	bs = spi_controller_get_devdata(ctlr);
 	bs->ctlr = ctlr;
 
-	bs->regs = devm_platform_ioremap_resource(pdev, 0);
+	bs->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(bs->regs))
 		return PTR_ERR(bs->regs);
 
@@ -1394,7 +1383,7 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
 
 	bs->clk_hz = clk_get_rate(bs->clk);
 
-	err = bcm2835_dma_init(ctlr, &pdev->dev, bs);
+	err = bcm2835_dma_init(ctlr, &pdev->dev, bs, res->start);
 	if (err)
 		return err;
 
-- 
2.51.0


