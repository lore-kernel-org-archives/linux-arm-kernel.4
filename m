Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59644606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bl3kFH+5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=msYLhiSH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aq2r0Ffmwu3p+JgLMYzEbEU7vmESDcoZR//lkCTLuLU=; b=Bl3kFH+5qo6+6+
	2gW2Dwxe5nNqDghz9J02qAPoaex8E5RH51VX5BaMfLE8eOsVppnODYoWSQsKzkbL/lz/t204v5Tcx
	e+okNNpvAC21uOpLz6Y3ez6tjVYhh5S2sy/KFvV5EbtXzr60t7+eETqnFgFQN5HCr4szXtZ4egmbU
	XzFeB8wi8lleUlAxGx5Nx3+HdZ+pXnYgr+eL3oM7akM9oN9j0xsp8J3B5GWuXyFyvbkDwj1GKWpoq
	JDiOkql2OLT/+O3hrSPXv+VCmCmdAglM0Udv2+fNYAy4PRejIXow7/V10Z2LqG7hCr9Q8VBCLByNi
	UaskmLK3sBqCSM1h3FQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxxW-0000000Gq4Z-2hoW;
	Fri, 27 Nov 2026 15:33:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxvy-0000000GpN9-0vAU;
	Fri, 27 Nov 2026 15:32:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A13B061935;
	Fri, 27 Nov 2026 15:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D101F00898;
	Fri, 27 Nov 2026 15:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793541;
	bh=aq2r0Ffmwu3p+JgLMYzEbEU7vmESDcoZR//lkCTLuLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=msYLhiSHOoNma/GjslvAP/iqKTk2Ttm7HCdRdUdWhz3VnnwhYZhSKDP7Nmj4lAV5e
	 KSBIDnFac7+eUfV6GXiJpn495oTZW6yuOWy3PB9vvhbGJ7lY+ofTAZFIwYui8DK1N4
	 F8QtXtcHjFNYqwIZ/8ciZXz4xfmPH+L3vLmS6WJc+jKE0WrnSD6nhbDr/BLDYwxrGv
	 gqSsOc8/wdhupYESwe4SAUMxXRtg0oLoVywCMlozSjLeGwOLkp4Ck7hjLNAzeJzdXF
	 0xo2y8k9Ed5OmS0BVp+fahReaVpf6cCnfzlseanREJjMDv0k9GkS9leRl2LKZmSo97
	 pPnE13fi6uupg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Gabor Juhos <juhosg@openwrt.org>,
	Chris Boot <bootc@bootc.net>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-spi@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 02/10] spi: bcm2835: Store native chip-select GPIO descriptor per device
Date: Fri, 27 Nov 2026 15:31:05 +0000
Message-ID: <20261127153158.2969573-3-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127153158.2969573-1-lee@kernel.org>
References: <20261127153158.2969573-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

When a device uses a native chip-select, bcm2835_spi_setup() requests a
GPIO descriptor for it and stores the result in the controller-wide
bs->cs_gpio.  A second device using a native chip-select overwrites the
first device's descriptor, which is then leaked.

bcm2835_spi_cleanup() subsequently calls gpiod_put(bs->cs_gpio) for
every device, including devices whose chip-select was requested by the
SPI core from the cs-gpios property.  The same descriptor can therefore
be released several times, and the descriptor released is not
necessarily the one which belongs to the device being cleaned up.

Move the descriptor into the per-device struct bcm2835_spidev, which is
zero-initialised, so that each device releases only the descriptor it
requested itself.

Fixes: 21f252cd29f0 ("spi: bcm2835: reduce the abuse of the GPIO API")
Closes: https://sashiko.dev/#/bug/linux-677b4cdb-2c6c-4cad-8a5a-45a24dc5cbab
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
v1 => v2:
 - Rebase onto spi/for-next; no functional changes.

 drivers/spi/spi-bcm2835.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index 9d589df90933..af118cccee1b 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -85,7 +85,6 @@ MODULE_PARM_DESC(polling_limit_us,
  * struct bcm2835_spi - BCM2835 SPI controller
  * @regs: base address of register map
  * @clk: core clock, divided to calculate serial clock
- * @cs_gpio: chip-select GPIO descriptor
  * @clk_hz: core clock cached speed
  * @irq: interrupt, signals TX FIFO empty or RX FIFO ¾ full
  * @tfr: SPI transfer currently processed
@@ -120,7 +119,6 @@ MODULE_PARM_DESC(polling_limit_us,
 struct bcm2835_spi {
 	void __iomem *regs;
 	struct clk *clk;
-	struct gpio_desc *cs_gpio;
 	unsigned long clk_hz;
 	int irq;
 	struct spi_transfer *tfr;
@@ -153,6 +151,7 @@ struct bcm2835_spi {
  * @clear_rx_desc: preallocated RX DMA descriptor used for TX-only transfers
  *	(cyclically clears RX FIFO by writing @clear_rx_cs to CS register)
  * @clear_rx_addr: bus address of @clear_rx_cs
+ * @cs_gpio: native chip-select GPIO descriptor requested by the driver
  * @clear_rx_cs: precalculated CS register value to clear RX FIFO
  *	(uses target-specific clock polarity and phase settings)
  */
@@ -160,6 +159,7 @@ struct bcm2835_spidev {
 	u32 prepare_cs;
 	struct dma_async_tx_descriptor *clear_rx_desc;
 	dma_addr_t clear_rx_addr;
+	struct gpio_desc *cs_gpio;
 	u32 clear_rx_cs ____cacheline_aligned;
 };
 
@@ -1157,7 +1157,6 @@ static void bcm2835_spi_cleanup(struct spi_device *spi)
 {
 	struct bcm2835_spidev *target = spi_get_ctldata(spi);
 	struct spi_controller *ctlr = spi->controller;
-	struct bcm2835_spi *bs = spi_controller_get_devdata(ctlr);
 
 	if (target->clear_rx_desc)
 		dmaengine_desc_free(target->clear_rx_desc);
@@ -1168,8 +1167,7 @@ static void bcm2835_spi_cleanup(struct spi_device *spi)
 				 sizeof(u32),
 				 DMA_TO_DEVICE);
 
-	if (!IS_ERR(bs->cs_gpio))
-		gpiod_put(bs->cs_gpio);
+	gpiod_put(target->cs_gpio);
 	spi_set_csgpiod(spi, 0, NULL);
 
 	kfree(target);
@@ -1232,6 +1230,7 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 	struct bcm2835_spi *bs = spi_controller_get_devdata(ctlr);
 	struct bcm2835_spidev *target = spi_get_ctldata(spi);
 	struct gpiod_lookup_table *lookup __free(kfree) = NULL;
+	struct gpio_desc *cs_gpio;
 	static const char * const pinctrl_compats[] = {
 		"brcm,bcm2835-gpio",
 		"brcm,bcm2711-gpio",
@@ -1334,14 +1333,15 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 
 	gpiod_add_lookup_table(lookup);
 
-	bs->cs_gpio = gpiod_get(&spi->dev, "cs", GPIOD_OUT_LOW);
+	cs_gpio = gpiod_get(&spi->dev, "cs", GPIOD_OUT_LOW);
 	gpiod_remove_lookup_table(lookup);
-	if (IS_ERR(bs->cs_gpio)) {
-		ret = PTR_ERR(bs->cs_gpio);
+	if (IS_ERR(cs_gpio)) {
+		ret = PTR_ERR(cs_gpio);
 		goto err_cleanup;
 	}
 
-	spi_set_csgpiod(spi, 0, bs->cs_gpio);
+	target->cs_gpio = cs_gpio;
+	spi_set_csgpiod(spi, 0, cs_gpio);
 
 	/* and set up the "mode" and level */
 	dev_info(&spi->dev, "setting up native-CS%i to use GPIO\n",
-- 
2.56.1.839.g22a8290db9-goog


