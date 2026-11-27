Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67243606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UUff4+BT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OMiTggrn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xCcRvFquyTG9RXsfC5tqZRvHUidWbv62REGdH1dnJO8=; b=UUff4+BTo2+QLY
	Fva52IpN8ZtV0UMqd+B0F+R7ZdJggBoePQIXSCqEwIwHI9aD24D5+UpYcMun6EsrKz+cWpas0sG/J
	t6sHz3hN7yDeE0S/Cm0GUQMRbEyv4uPOxuebouwggkfUiUMMr0RIJpVnNv/taeKrI2kY+WGYY+Ic6
	G8zGAkjWPhL0ffY69qptXyhW9mfZUI+Ead1XXW+9BVJ40WdKC6+m9C3z+OoJpM9pAqTM3ZAq9yAhh
	aop/Z3O78VrsaleI3tKJyi3Qz45imBOpJ7l8srVlo8fTXtcGbNAIgQNxM/My7NaBXTFsCjoxS82Dp
	Rlt37qpiir8FEmJiMNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxKr-0000000Ge7b-1t9W;
	Fri, 27 Nov 2026 14:54:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxKM-0000000GdrE-0099
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:53:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B16AA418D8;
	Fri, 27 Nov 2026 14:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8998E1F00932;
	Fri, 27 Nov 2026 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791209;
	bh=xCcRvFquyTG9RXsfC5tqZRvHUidWbv62REGdH1dnJO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OMiTggrnc7dWomJPMIWyapyU1x1+aqE6RXH9NVpokB+2amiyv9Sk0es+Za7pSiU+Y
	 7Q1BndI8mQPi2sd01HyeYjfJqHMHcBE9wmLjC8NWMPFQ9x0jeGhLziVvSEMP9jMpPk
	 mDq/SYjv8AJG+MA3XFWMqwTqAqG5XjFI+lsz2ucDLJguRDQcgSc74rBNWHtGkQdVpm
	 E51zseeaf3lz3bsOHtipoyg3NkgatS4RacyP7KBfNvmIrdmMfouSpQJhnsFtI+9daF
	 +V1YTKB5bnnxiqKvdqYbj7tbgfZ+IKXl89J4pYcwtXeAmlQ8U8cNJ/8V+i8/4BChK8
	 aH3CrPc+NfEOg==
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
Subject: [RFT PATCH v2 13/14] gpio: i8255: create the regmap-irq chip from the gpio-regmap callback
Date: Fri, 27 Nov 2026 15:52:30 +0100
Message-ID: <20261127145232.814492-14-mwalle@kernel.org>
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

Use the new gpio_regmap_add_irq_chip_nolock() helper to create the
regmap-irq domain. Use the _nolock() variant because the hwirq don't
match the GPIO offsets.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-104-dio-48e.c | 31 +++++++++++++++++++++++--------
 drivers/gpio/gpio-i8255.c       |  3 ++-
 drivers/gpio/gpio-i8255.h       |  8 ++++++--
 3 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 7ddf578ba530..27a3f94c6e79 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -9,6 +9,7 @@
 #include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/gpio/regmap.h>
 #include <linux/i8254.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
@@ -113,6 +114,8 @@ static const struct regmap_irq dio48e_regmap_irqs[] = {
  * @regs:	virtual mapping for device registers
  * @flags:	IRQ flags saved during locking
  * @irq_mask:	Current IRQ mask state on the device
+ * @chip:	regmap_irq_chip for the device
+ * @irq:	Parent IRQ
  */
 struct dio48e_gpio {
 	raw_spinlock_t lock;
@@ -120,6 +123,8 @@ struct dio48e_gpio {
 	void __iomem *regs;
 	unsigned long flags;
 	unsigned int irq_mask;
+	struct regmap_irq_chip *chip;
+	unsigned int irq;
 };
 
 static void dio48e_regmap_lock(void *lock_arg) __acquires(&dio48egpio->lock)
@@ -163,7 +168,7 @@ static int dio48e_handle_mask_sync(const int index,
 				   const unsigned int mask_buf,
 				   void *const irq_drv_data)
 {
-	struct dio48e_gpio *const dio48egpio = irq_drv_data;
+	struct dio48e_gpio *const dio48egpio = gpio_regmap_get_drvdata(irq_drv_data);
 	const unsigned int prev_mask = dio48egpio->irq_mask;
 	int err;
 	unsigned int val;
@@ -218,6 +223,19 @@ static int dio48e_irq_init_hw(struct regmap *const map)
 	return regmap_read(map, DIO48E_DISABLE_INTERRUPT, &val);
 }
 
+static struct irq_domain *dio48e_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct dio48e_gpio *const dio48egpio = gpio_regmap_get_drvdata(gpio);
+	struct irq_domain *domain;
+
+	domain = gpio_regmap_add_irq_chip_nolock(gpio, dio48egpio->irq, 0, dio48egpio->chip);
+	if (IS_ERR(domain))
+		return dev_err_cast_probe(regmap_get_device(dio48egpio->map), domain,
+					  "IRQ registration failed\n");
+
+	return domain;
+}
+
 static int dio48e_probe(struct device *dev, unsigned int id)
 {
 	const char *const name = dev_name(dev);
@@ -230,7 +248,6 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	int err;
 	struct regmap_irq_chip *chip;
 	struct dio48e_gpio *dio48egpio;
-	struct regmap_irq_chip_data *chip_data;
 
 	if (!devm_request_region(dev, base[id], DIO48E_EXTENT, name)) {
 		dev_err(dev, "Unable to lock port addresses (0x%X-0x%X)\n",
@@ -302,17 +319,14 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	chip->irqs = dio48e_regmap_irqs;
 	chip->num_irqs = ARRAY_SIZE(dio48e_regmap_irqs);
 	chip->handle_mask_sync = dio48e_handle_mask_sync;
-	chip->irq_drv_data = dio48egpio;
+	dio48egpio->chip = chip;
+	dio48egpio->irq = irq[id];
 
 	/* Initialize to prevent spurious interrupts before we're ready */
 	err = dio48e_irq_init_hw(map);
 	if (err)
 		return err;
 
-	err = devm_regmap_add_irq_chip(dev, map, irq[id], 0, 0, chip, &chip_data);
-	if (err)
-		return dev_err_probe(dev, err, "IRQ registration failed\n");
-
 	pit_config.parent = dev;
 
 	err = devm_i8254_regmap_register(dev, &pit_config);
@@ -323,7 +337,8 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	config.map = map;
 	config.num_ppi = DIO48E_NUM_PPI;
 	config.names = dio48e_names;
-	config.domain = regmap_irq_get_domain(chip_data);
+	config.drvdata = dio48egpio;
+	config.create_irq_domain = dio48e_create_irq_domain;
 
 	return devm_i8255_regmap_register(dev, &config);
 }
diff --git a/drivers/gpio/gpio-i8255.c b/drivers/gpio/gpio-i8255.c
index 541a348447cd..8ac46bb2c235 100644
--- a/drivers/gpio/gpio-i8255.c
+++ b/drivers/gpio/gpio-i8255.c
@@ -129,7 +129,8 @@ int devm_i8255_regmap_register(struct device *const dev,
 	gpio_config.reg_set_base = GPIO_REGMAP_ADDR(I8255_REG_DAT_BASE);
 	gpio_config.reg_dir_in_base = GPIO_REGMAP_ADDR(I8255_REG_DIR_IN_BASE);
 	gpio_config.ngpio_per_reg = I8255_NGPIO_PER_REG;
-	gpio_config.irq_domain = config->domain;
+	gpio_config.drvdata = config->drvdata;
+	gpio_config.create_irq_domain = config->create_irq_domain;
 	gpio_config.reg_mask_xlate = i8255_reg_mask_xlate;
 
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
diff --git a/drivers/gpio/gpio-i8255.h b/drivers/gpio/gpio-i8255.h
index 9dcf639b94df..fa90044c9cd5 100644
--- a/drivers/gpio/gpio-i8255.h
+++ b/drivers/gpio/gpio-i8255.h
@@ -4,6 +4,7 @@
 #define _I8255_H_
 
 struct device;
+struct gpio_regmap;
 struct irq_domain;
 struct regmap;
 
@@ -15,7 +16,9 @@ struct regmap;
  * @map:	regmap for the i8255
  * @num_ppi:	number of i8255 Programmable Peripheral Interface
  * @names:	(optional) array of names for gpios
- * @domain:	(optional) IRQ domain if the controller is interrupt-capable
+ * @drvdata:	(optional) driver data, see gpio_regmap_get_drvdata()
+ * @create_irq_domain:	(optional) create the IRQ domain if the controller is
+ *			interrupt-capable, see struct gpio_regmap_config
  *
  * Note: The regmap is expected to have cache enabled and i8255 control
  * registers not marked as volatile.
@@ -25,7 +28,8 @@ struct i8255_regmap_config {
 	struct regmap *map;
 	int num_ppi;
 	const char *const *names;
-	struct irq_domain *domain;
+	void *drvdata;
+	struct irq_domain *(*create_irq_domain)(struct gpio_regmap *gpio);
 };
 
 int devm_i8255_regmap_register(struct device *dev,
-- 
2.47.3


