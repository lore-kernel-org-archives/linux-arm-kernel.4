Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C11606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T1y1Zb9W;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ho/N4KnK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tsbt+DTLYEVcstYstnP1hdZwz4BCikq3eEBiW69wILE=; b=T1y1Zb9WKjd/Q/
	s/JxaM7qBm7Zr6kqGpm4XGScTnSgXBR9Sg/um7z6KYxnsDYRrLMoeGutCucgOp4DHF9rOgbVtLCJI
	ra2DVPyvpkBxhtA1yD2ucjd6IdaZL0Uf1HU7rpUsftAXQUOycrtVjUgp63mnD1UzG2lN+O319b5E1
	4150JaXYzOpCLVjXrINf8H7pSz35g2wdO8JmPLI+YKZ39ezTf0q3aIrsqKyT1CWEas7tI42AVp7Zu
	iEO5eIltDBxjvjasbzfqlFzsA9yJq4apTXMFiamvR0tYHZCqPvHZhgJXpn1da6dtdtbdSCRVvqiv2
	M2GK/EP7O4+Dw6GL3jfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbYL-0000000Dl8W-07pk;
	Thu, 26 Nov 2026 15:38:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbXZ-0000000DknL-02D8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:37:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B714A41722;
	Thu, 26 Nov 2026 15:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6FA1F000F0;
	Thu, 26 Nov 2026 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707460;
	bh=Tsbt+DTLYEVcstYstnP1hdZwz4BCikq3eEBiW69wILE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ho/N4KnKeky92McgdmtIb+ZVlBEY7gCodbzDfifwrbJ83Eoy4WHIpLy9SpQo/ivIN
	 tDDW5PCsHxxNRcA2wV0JT7FmTHZPWuvGfiN6fT9s0JhtCXhsY6PqS+ASn06kaDlcm8
	 VzPLxA36FtBz1be9A+mpCuj2xQ27NkXkoge8hR8wHyLnwXkR7ojx32ZaB0qdXzx7IB
	 7p1/bkCr1fB/jbV3ADatdrf7LbREeqgnZuMmP39EshL3WuCrE9svOUj/bv/DGyfoaE
	 b7xRnpGjF0JttT6djYp+uwoGS4TWtN2b+3P7+REcj0K0XfPm+EybiPBFk71GdFUGvG
	 jPZiqU+syBG0w==
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
Subject: [RFT PATCH 09/13] gpio: pcie-idio-24: create the regmap-irq chip from the gpio-regmap callback
Date: Thu, 26 Nov 2026 16:35:20 +0100
Message-ID: <20261126153600.299724-10-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126153600.299724-1-mwalle@kernel.org>
References: <20261126153600.299724-1-mwalle@kernel.org>
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
 drivers/gpio/gpio-pcie-idio-24.c | 36 ++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 8fb34398053d..3be7aad266e0 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -148,18 +148,22 @@ static const struct regmap_irq idio_24_regmap_irqs[] = {
  * @map:	regmap for the device
  * @lock:	synchronization lock to prevent I/O race conditions
  * @irq_type:	type configuration for IRQs
+ * @chip:	regmap_irq_chip for the device
+ * @irq:	parent IRQ
  */
 struct idio_24_gpio {
 	struct regmap *map;
 	raw_spinlock_t lock;
 	u8 irq_type;
+	struct regmap_irq_chip *chip;
+	int irq;
 };
 
 static int idio_24_handle_mask_sync(const int index, const unsigned int mask_buf_def,
 				    const unsigned int mask_buf, void *const irq_drv_data)
 {
 	const unsigned int type_mask = COS_ENABLE_BOTH << index;
-	struct idio_24_gpio *const idio24gpio = irq_drv_data;
+	struct idio_24_gpio *const idio24gpio = gpio_regmap_get_drvdata(irq_drv_data);
 	u8 type;
 	int ret;
 
@@ -183,7 +187,7 @@ static int idio_24_set_type_config(unsigned int **const buf, const unsigned int
 	const unsigned int rising = COS_ENABLE_RISING << offset;
 	const unsigned int falling = COS_ENABLE_FALLING << offset;
 	const unsigned int mask = COS_ENABLE_BOTH << offset;
-	struct idio_24_gpio *const idio24gpio = irq_drv_data;
+	struct idio_24_gpio *const idio24gpio = gpio_regmap_get_drvdata(irq_drv_data);
 	unsigned int new;
 	unsigned int cos_enable;
 	int ret;
@@ -225,13 +229,27 @@ static int idio_24_set_type_config(unsigned int **const buf, const unsigned int
 	return ret;
 }
 
+static struct irq_domain *idio_24_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct idio_24_gpio *const idio24gpio = gpio_regmap_get_drvdata(gpio);
+	struct irq_domain *domain;
+
+	domain = gpio_regmap_add_irq_chip(gpio, idio24gpio->irq, 0, idio24gpio->chip);
+	if (IS_ERR(domain))
+		return dev_err_cast_probe(regmap_get_device(idio24gpio->map), domain,
+					  "IRQ registration failed\n");
+
+	return domain;
+}
+
 static int idio_24_reg_mask_xlate(struct gpio_regmap *const gpio, enum gpio_regmap_operation op,
 				  const unsigned int base, const unsigned int offset,
 				  unsigned int *const reg, unsigned int *const mask)
 {
 	const unsigned int out_stride = offset / IDIO_24_NGPIO_PER_REG;
 	const unsigned int in_stride = (offset - 24) / IDIO_24_NGPIO_PER_REG;
-	struct regmap *const map = gpio_regmap_get_drvdata(gpio);
+	struct idio_24_gpio *const idio24gpio = gpio_regmap_get_drvdata(gpio);
+	struct regmap *const map = idio24gpio->map;
 	int err;
 	unsigned int ctrl_reg;
 
@@ -302,7 +320,6 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	void __iomem *idio_24_regs;
 	struct regmap *intcsr_map;
 	struct regmap_irq_chip *chip;
-	struct regmap_irq_chip_data *chip_data;
 
 	err = pcim_enable_device(pdev);
 	if (err)
@@ -348,7 +365,8 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	chip->num_irqs = ARRAY_SIZE(idio_24_regmap_irqs);
 	chip->handle_mask_sync = idio_24_handle_mask_sync;
 	chip->set_type_config = idio_24_set_type_config;
-	chip->irq_drv_data = idio24gpio;
+	idio24gpio->chip = chip;
+	idio24gpio->irq = pdev->irq;
 
 	/* Software board reset */
 	err = regmap_write(idio24gpio->map, IDIO_24_SOFT_RESET, 0);
@@ -362,10 +380,6 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (err)
 		return err;
 
-	err = devm_regmap_add_irq_chip(dev, idio24gpio->map, pdev->irq, 0, 0, chip, &chip_data);
-	if (err)
-		return dev_err_probe(dev, err, "IRQ registration failed\n");
-
 	gpio_config.parent = dev;
 	gpio_config.regmap = idio24gpio->map;
 	gpio_config.ngpio = IDIO_24_NGPIO;
@@ -374,9 +388,9 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	gpio_config.reg_set_base = GPIO_REGMAP_ADDR(IDIO_24_OUT_BASE);
 	gpio_config.reg_dir_out_base = GPIO_REGMAP_ADDR(IDIO_24_CONTROL_REG);
 	gpio_config.ngpio_per_reg = IDIO_24_NGPIO_PER_REG;
-	gpio_config.irq_domain = regmap_irq_get_domain(chip_data);
 	gpio_config.reg_mask_xlate = idio_24_reg_mask_xlate;
-	gpio_config.drvdata = idio24gpio->map;
+	gpio_config.drvdata = idio24gpio;
+	gpio_config.create_irq_domain = idio_24_create_irq_domain;
 
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
 }
-- 
2.47.3


