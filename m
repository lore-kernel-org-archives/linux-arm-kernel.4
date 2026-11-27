Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C4F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FkGuCAhr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gwdp0ACL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QE0oVtI/py717JnDeulrVx+SoFxs8JDa1YElE+ziiL4=; b=FkGuCAhrc/Z/M6
	elbgMIbE7Lzf3OkE4sh7rKm9W47vG83H6enweWllwwsAM2Wb3vsu3XLTDeJVVG4qiCn1eYPGcsy9y
	rymguO2lDmf99b3GZAoAQDU8gzxZijmcAFeXSbVhqD/fWNItJvzWLCY7zZezu/psjuW+1ycVamqvo
	DoIYF+VzdRfpm6WsBClZq2PiUFTYVvdi+rVMXUeiHieLU3nYo7F5tC66cmRVFeOSnUbFMpfh/8d8h
	O4zmmUeACsQcHGqXT0sFqi806GlOLR79xYIhPGO05sF2MBVHw5CKdKeoWt7iVrAOihJZxPu1rPOxT
	BRTS3G6GyIguRvkMKv1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxK1-0000000GdaR-0RTB;
	Fri, 27 Nov 2026 14:53:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxJy-0000000GdYp-42pO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:53:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A82D543BA3;
	Fri, 27 Nov 2026 14:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB3B1F00899;
	Fri, 27 Nov 2026 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791186;
	bh=QE0oVtI/py717JnDeulrVx+SoFxs8JDa1YElE+ziiL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gwdp0ACLicil+yett1rWOD2nXWT0ysoBacGVga3uTmE1SHP6rDcq0LuKKUGoFY7Nb
	 h7B+9qnua2pFdN+PuCr0n3phIkLoRbaddeNQKVyjiyO3c2dQWTPVWKOECtWAswV+pb
	 tLi3OpEloavev8atfn1gm3eveIrHLwOTCh33byXNpwkP9jubSmQhuVmb/YP4O5xwoL
	 CeuSnAg3y6KL/kw9weF9zin2QvycZ+hyfUEiS3NWKOhpcFCyb5uPn4PBBZlgpSvikc
	 8NS5x5G1gOk02UYDKdgCMoC2CVwycISm9zt2upUCpUp9k9U1sZyVkg08UVnJVMfInr
	 Yu87VJBONAVlg==
From: Michael Walle <mwalle@kernel.org>
To: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFT PATCH v2 07/14] gpio: max7360: create the regmap-irq chip from the gpio-regmap callback
Date: Fri, 27 Nov 2026 15:52:24 +0100
Message-ID: <20261127145232.814492-8-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127145232.814492-1-mwalle@kernel.org>
References: <20261127145232.814492-1-mwalle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Use the new gpio_regmap_add_irq_chip() helper to create the regmap-irq
domain.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-max7360.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-max7360.c b/drivers/gpio/gpio-max7360.c
index b77a51092dcb..372659edc8fb 100644
--- a/drivers/gpio/gpio-max7360.c
+++ b/drivers/gpio/gpio-max7360.c
@@ -27,6 +27,12 @@ struct max7360_gpio_plat_data {
 	unsigned int function;
 };
 
+struct max7360_gpio {
+	struct regmap *regmap;
+	struct regmap_irq_chip *irq_chip;
+	int irq;
+};
+
 static struct max7360_gpio_plat_data max7360_gpio_port_plat = { .function = MAX7360_GPIO_PORT };
 static struct max7360_gpio_plat_data max7360_gpio_col_plat = { .function = MAX7360_GPIO_COL };
 
@@ -128,7 +134,8 @@ static int max7360_handle_mask_sync(const int index,
 				    const unsigned int mask_buf,
 				    void *const irq_drv_data)
 {
-	struct regmap *regmap = gpio_regmap_get_drvdata(irq_drv_data);
+	struct max7360_gpio *max7360_gpio = gpio_regmap_get_drvdata(irq_drv_data);
+	struct regmap *regmap = max7360_gpio->regmap;
 	int ret;
 
 	for (unsigned int i = 0; i < MAX7360_MAX_GPIO; i++) {
@@ -141,10 +148,19 @@ static int max7360_handle_mask_sync(const int index,
 	return 0;
 }
 
+static struct irq_domain *max7360_gpio_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct max7360_gpio *max7360_gpio = gpio_regmap_get_drvdata(gpio);
+
+	return gpio_regmap_add_irq_chip(gpio, max7360_gpio->irq, IRQF_ONESHOT | IRQF_SHARED,
+					max7360_gpio->irq_chip);
+}
+
 static int max7360_gpio_probe(struct platform_device *pdev)
 {
 	const struct max7360_gpio_plat_data *plat_data;
 	struct gpio_regmap_config gpio_config = { };
+	struct max7360_gpio *max7360_gpio;
 	struct regmap_irq_chip *irq_chip;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
@@ -162,11 +178,15 @@ static int max7360_gpio_probe(struct platform_device *pdev)
 			 * Port GPIOs with interrupt-controller property: add IRQ
 			 * controller.
 			 */
-			gpio_config.regmap_irq_flags = IRQF_ONESHOT | IRQF_SHARED;
-			gpio_config.regmap_irq_line =
+			max7360_gpio = devm_kzalloc_obj(dev, *max7360_gpio);
+			if (!max7360_gpio)
+				return -ENOMEM;
+
+			max7360_gpio->regmap = regmap;
+			max7360_gpio->irq =
 				fwnode_irq_get_byname(dev_fwnode(dev->parent), "inti");
-			if (gpio_config.regmap_irq_line < 0)
-				return dev_err_probe(dev, gpio_config.regmap_irq_line,
+			if (max7360_gpio->irq < 0)
+				return dev_err_probe(dev, max7360_gpio->irq,
 						     "Failed to get IRQ\n");
 
 			/* Create custom IRQ configuration. */
@@ -181,9 +201,10 @@ static int max7360_gpio_probe(struct platform_device *pdev)
 			irq_chip->num_irqs = MAX7360_MAX_GPIO;
 			irq_chip->irqs = max7360_regmap_irqs;
 			irq_chip->handle_mask_sync = max7360_handle_mask_sync;
+			max7360_gpio->irq_chip = irq_chip;
 
-			gpio_config.regmap_irq_chip = irq_chip;
-			gpio_config.drvdata = regmap;
+			gpio_config.drvdata = max7360_gpio;
+			gpio_config.create_irq_domain = max7360_gpio_create_irq_domain;
 
 			for (unsigned int i = 0; i < MAX7360_MAX_GPIO; i++) {
 				ret = regmap_write_bits(regmap, MAX7360_REG_PWMCFG(i),
-- 
2.47.3


