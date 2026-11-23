Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2C7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Msih3FCq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=U0hQBUbi;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YyiLvHlo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=; b=Msih3FCquXe/ed
	GS9ogWiuRau7tsnwX4kdve0G0yANMrf2guKyz2kGd59LO/9OMn3m88lqx8kPiJb3oM7rPTLkPCSag
	X1hKyVKc81mrOltPHaf6QFyU6v6lL1BeTVh0tQMZq9Ca97InID+vWF0yr66sPOVGt6v8ejiJUHY/E
	DoTjka30G7KKfn1XwKuC/wq7Nkn07hc4ubZcZq3bpUQJefHBep3auLkih4eVWT0FM5mCQ1D4ebXtw
	ov5oAd2Ok1ZRDNTDe+OHjotX6Yn1ygsE/xgfJkrxR+mvVREkGMcm97JJuniCkxL1PJmmrIlAR//td
	Za26M6IHlUWIZ13rz8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTd-00000003qJx-1qTV;
	Mon, 23 Nov 2026 14:57:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQe-00000003ocD-11jz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 14:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=; b=U0hQBUbi35dIJv8niFD21jvMIq
	yvkLjBUgajwF/ljC+7DH9ROHHQMsaaymVJBBzwI3CXV6t/rUha02Du0xEzcPBCjgtxRO/Ue7pSYkZ
	CurHOaea7P1rviFFce9caityg5ijjJJFyXRsdPTM4IysoEFwgSAzsScdFB3lnTK1rxPhLfYN0X9A9
	UaFKMJ4MS+avsuvKaXSindz8VFMM23XwARxB2PmAZ/R5k6AORo82xoOa2GnSVh+DzgerVa8sRAlDn
	9vqFoYVlnquhZRbQSsOEQjyvmuFuLHE+HPsTZM7qe0Y+rJqRtMIXuA7AiX1vHYb5Cdot38qndLpX/
	3Ma44f6w==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQb-00000003FyH-1Xb3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so26199025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445634; x=1796050434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=;
        b=YyiLvHloIR9aaVHF5hhuJEEmAAutJwe/31u9v1rAs4P+nmhw1FGyWcIa2RN0Fo8brR
         o3v/LfvDwixRx9EAEgHvuFS17lP5ZltY0uO39fg7KXNqIDQz1k+bHzNO/e4H4MWQigE5
         M/tM6e3CsGM8DC1VjJ8JTzzhzksjX0L+Ao+kUjwpFwFMV8vy26riO8lq6Shid8lnU+kE
         3U9Ai72FTwuNUX+cTvL0Jb2FHODjDcKOkjougsu4SEBcGwv9e75OO28S8PtQr0yEV7/k
         450nZkzH0Q81001SjA6/MvctU7pyBeeDGcG7Wiz9hYNL+Mkb3c59AUxfBVEC+nDSFee3
         Mj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445634; x=1796050434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=;
        b=ytRcTYwgwqyQvKmwmtgUJNxJIP2PbmkiIycVzsSsYSacHDKKk5O4POqy27gNvNWY+R
         Y2Z0gE31gAcEpZXLikWN2iqKHAaGssu8KhUAmambLE7cvFm8PI4732oJVcuht8EvevZO
         ryxG0R2tuPhrAUb9qcx8hQB8UjHV1tv53xV/hCUuN7SyZNNkLh8cztopSmnw6ludzEcd
         qNhbexgrDusF8+4SUh3aA3aoLIjPt4/gXrwoEPAIsuGvCnxuWX5KVX5Hmzlz/ntQdNeH
         KkorZxXu6EuC0dLYkzKVWcQLViftL/bCanbNMy4Ykc1aZ9xeouPKn4LzPYLDFXvEF4OK
         NT7A==
X-Forwarded-Encrypted: i=1; AL+hErHTPbcTcI+dw1e3SmgZ/NgySGY1bRpVY7ehFvJlIrSfuIh6vQbVLKpNj3ZlULCJDmA9PC6iSAXAADJblcbBwhNZ@lists.infradead.org
X-Gm-Message-State: APuU4Z++r0tHWp/lpKDfVXBP+7paCRjSymrLlJkBM552BiFSQvykpfmM
	xIsS2gR/H0ix8xWwcI00sqX7Y1RcivazHl3pIpkV0Q4KJRDUegeVL667TVo/6bbr3Ao=
X-Gm-Gg: AZFdTZeV0W2lCkluahBJWfmsBf7toglGK7oDopy+v6blFxw1VnWzkk+ylzpW7Sp+iM9
	YCwx8i5/2gLXTLDSQfjvjyKhlMyAYhBPBZ2RIyYk6srIg8uhCTAVLvrhusx6st5PcXTx91aBURW
	1fztQyh6C7pHrJlC5Our8FRqDhBory3EuJ1DZtDW3bJJubhWxaD31FuC7R8bMpfHx0L2FMR/SpS
	nBKkk9NQgiF7HWbm5BM8FOwiMHsk+r76L/V4JorRC3u0m6zSYaMK1hShOJDUVpCQ6uOvwjw06y7
	8TWg2nndyFEv8xkCf7N76ZQH9qf2Gq5SNvZTMSR9+S8fMsTagtM6JIdqe3jrEW5N3GaN4SZAfLD
	IPCdrZ5ZGM4CuyOzpY9yzRWZFPQAln4Nhmx2/eC5yzk8B4NQ6Q57YsUuFgQTEWMXWIAy98FrpLa
	xfjsDPdCvQXEx4UN8Qdt4J9Wy2lc6NAhxYhOUmWlfYHiyK+yAl1bCM96ojCEgorY8h67cer9lu+
	jpGoJ0bljDJP58Zo0UyHRZX3zsjHyZyGQ0aHHc7un1Wr8VHsUzoVCYy2ACCPanQ/LiayYisVsyy
	psI/ujv8+d8ZaYm0EFIcLreCTUc=
X-Received: by 2002:a05:600c:64c7:b0:4bb:872a:f500 with SMTP id 5b1f17b1804b1-4bb887c2697mr259597265e9.3.1795445634103;
        Mon, 23 Nov 2026 06:53:54 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm357418155e9.3.2026.11.23.06.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:53 -0800 (PST)
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
Subject: [PATCH v3 15/28] spi: bcm2835: Pass the CPU physical address of the FIFO to the DMA engine
Date: Mon, 23 Nov 2026 15:56:53 +0100
Message-ID: <20261123145728.29082-16-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_145357_429433_2C82F4AD 
X-CRM114-Status: GOOD (  20.89  )
X-Spam-Score: -0.2 (/)
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


