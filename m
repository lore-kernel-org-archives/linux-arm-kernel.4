Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FC9606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k0jg0whY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ksN/hkSr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bcoYPNQ1e9JiGf7bcR7Apnx0REpWA8L8Z0wsD4xAwOM=; b=k0jg0whYCC9dpO
	vq3UsPhS+HU7f0dyxgh+WV6nxgEVbtfMREielo/6bYaHSCwtuzBv5FvgubhENZnppv7SG3Ao5+isH
	iZBulg2oKwAN97h0/kfcPtNgSED3TF/Z+YNUcKbRQFOQhWMlkfqMWOL6Q6sAH5vpabShg5qunDB0f
	W+UC1vjSGpEodep6dJbGIgT9cbHNZHQdXFoaqkcOaREmMXhDZIct0pW4dsFddXpheRGGmyHDxSc2J
	7AWmsFO6RVImibLIGvlAN8l6M5/I/IgSL6lczX2Xg5VIK5SwIQvD/hOUf8fxCK+CbK0lKo2hYSoXr
	/DKaEd3PM/G75HCb0r1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyI0-0000000BN85-0CHH;
	Thu, 19 Nov 2026 09:18:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyHp-0000000BN6Q-3Z1D;
	Thu, 19 Nov 2026 09:18:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D9F540532;
	Thu, 19 Nov 2026 09:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30331F000C4;
	Thu, 19 Nov 2026 09:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079913;
	bh=bcoYPNQ1e9JiGf7bcR7Apnx0REpWA8L8Z0wsD4xAwOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ksN/hkSr+gJP5LsCZT870PhevDKD0dgh6KPfF7Yu3TCs91hOP+TjiMrUWdJ5TMam+
	 dorqqx+axs5BBnLhJtUHA+Wh+mnj5clmKVDmfAOqvPi3IujBmPCTJmuh0MN0D6+ZRq
	 Tzkb94RPnG1kjxxyaXa5jHlZS6IR/kDwAcsoSUPSMkfbjyqXAihVEtXJCrpBRQ2FZF
	 5lo5UI78eJta06nxNEWEazfuadfT4uo2gq8M48AMiBaXWoVQij0iib2nvf1pdYoSEm
	 RgpOa+pzerxevgJI6ivArDbPdrq1dAAw5ypfOvpNFUbRD6lemb71N389D7cWbgNTtR
	 IpaducJBN3D4g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Gabor Juhos <juhosg@openwrt.org>,
	Chris Boot <bootc@bootc.net>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-spi@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 02/10] spi: bcm2835: Store native chip-select GPIO descriptor per device
Date: Thu, 19 Nov 2026 09:17:14 +0000
Message-ID: <20261119091810.3440619-3-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261119091810.3440619-1-lee@kernel.org>
References: <20261119091810.3440619-1-lee@kernel.org>
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
2.56.1.708.g77570a6a1d-goog


