Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47C7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fWltF0ec;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SolPIi5m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/v25Y4md6CrARYqODOT8YGhzOYoXCdr08ccIlMLdyg4=; b=fWltF0ec61Ced5
	+y3q/5ZwO3yowXwMuYTP9vP9NQ7uxO8tZi0wv6e4mLpqB40wNJon4RxJuWMyu5LOmtaF1jxrYByTB
	n2xHcLstjvLNQbkI8IsCTLh2KkF9eunYMMpLOoADato42ygcgRLoNKYezmIIArUoIz4mYLinKJmJl
	TkiPAdMj9T9QluPJvgZip7dZI0mAluK9aYMo15fSxtfAIg7QE4fFP3hkoQTXwWh5L8sLxZeHrfZdp
	tsAwTclckzC7uBbRIPbkRrN/uQ4r/SPvBme0jLYVNvfnUoWHAEANnTRr8/zsPmRsslfu9Fdq/BpNU
	/tuc87zO4WR+FE/gWQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxKr-0000000Ge7p-32UZ;
	Fri, 27 Nov 2026 14:54:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxKQ-0000000Gdvn-2r76
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:53:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2524C60D7C;
	Fri, 27 Nov 2026 14:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E9B1F0089B;
	Fri, 27 Nov 2026 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791213;
	bh=/v25Y4md6CrARYqODOT8YGhzOYoXCdr08ccIlMLdyg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SolPIi5mATzOvu+UbF1DIgdMzBStSyRddUtIQdVgFNrKyvgNBKIZqgZyRzIC1DoNm
	 eCT7OdJ5Q4sMwGAN2OAOPifoSbQ7RUji1+TRrTRXzojFxb7d1ZWJcqwFObGe5qAcZS
	 r5FjiEtON6VL2k+MCt1sIlKzQSzyu3bzNtnZ/j0k+DCwSiRyh5xJQh0ZV6zM1G0cgO
	 NV1NC8V/BNVrLynBs8mD26DnViOGaAg9rerJ4I5zk9QgdRjMocCUB4XK0tOQM0jJxu
	 DEp10SAkTSsEBKraTfD8qAWYRt/3e0RGO/xyu8x+S8mRdJlLAS2YCz928RQQodalfH
	 TZfgWGB51wOuA==
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
Subject: [RFT PATCH v2 14/14] gpio: regmap: remove irq_domain and the regmap-irq configuration
Date: Fri, 27 Nov 2026 15:52:31 +0100
Message-ID: <20261127145232.814492-15-mwalle@kernel.org>
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

Now that all users have been converted to the new .create_irq_domain()
callback, remove the old methods.

Also remove the __maybe_unused annotations because the helpers are now
guarded with CONFIG_REGMAP_IRQ.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Tested-by: Joseph Telaak <joseph@telaak.dev>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-regmap.c  | 34 ++++------------------------------
 include/linux/gpio/regmap.h | 17 -----------------
 2 files changed, 4 insertions(+), 47 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index a0d99710dc4f..5d9520143f99 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -399,17 +399,17 @@ void gpio_regmap_relres_irq(struct gpio_regmap *gpio, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(gpio_regmap_relres_irq);
 
-static int __maybe_unused gpio_regmap_irq_reqres(void *irq_drv_data, irq_hw_number_t hwirq)
+#ifdef CONFIG_REGMAP_IRQ
+static int gpio_regmap_irq_reqres(void *irq_drv_data, irq_hw_number_t hwirq)
 {
 	return gpio_regmap_reqres_irq(irq_drv_data, hwirq);
 }
 
-static void __maybe_unused gpio_regmap_irq_relres(void *irq_drv_data, irq_hw_number_t hwirq)
+static void gpio_regmap_irq_relres(void *irq_drv_data, irq_hw_number_t hwirq)
 {
 	gpio_regmap_relres_irq(irq_drv_data, hwirq);
 }
 
-#ifdef CONFIG_REGMAP_IRQ
 /**
  * gpio_regmap_add_irq_chip_nolock() - Add a regmap-irq chip without line locking
  * @gpio: gpio_regmap device
@@ -509,7 +509,7 @@ EXPORT_SYMBOL_GPL(gpio_regmap_disable_irq);
  */
 struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config)
 {
-	struct irq_domain *irq_domain;
+	struct irq_domain *irq_domain = NULL;
 	struct gpio_regmap *gpio;
 	struct gpio_chip *chip;
 	int ret;
@@ -530,14 +530,6 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	if (config->reg_dir_out_base && config->reg_dir_in_base)
 		return ERR_PTR(-EINVAL);
 
-	/* there is only one way to provide an IRQ domain */
-	if (config->create_irq_domain && config->irq_domain)
-		return ERR_PTR(-EINVAL);
-#ifdef CONFIG_REGMAP_IRQ
-	if (config->create_irq_domain && config->regmap_irq_chip)
-		return ERR_PTR(-EINVAL);
-#endif
-
 	gpio = kzalloc_obj(*gpio);
 	if (!gpio)
 		return ERR_PTR(-ENOMEM);
@@ -629,8 +621,6 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	if (ret < 0)
 		goto err_free_bitmap_output;
 
-	irq_domain = config->irq_domain;
-
 	if (config->create_irq_domain) {
 		irq_domain = config->create_irq_domain(gpio);
 		if (IS_ERR(irq_domain)) {
@@ -640,22 +630,6 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 		gpio->remove_irq_domain = config->remove_irq_domain;
 	}
 
-#ifdef CONFIG_REGMAP_IRQ
-	if (config->regmap_irq_chip) {
-		gpio->regmap_irq_line = config->regmap_irq_line;
-		config->regmap_irq_chip->irq_reqres = gpio_regmap_irq_reqres;
-		config->regmap_irq_chip->irq_relres = gpio_regmap_irq_relres;
-		config->regmap_irq_chip->irq_drv_data = gpio;
-		ret = regmap_add_irq_chip_fwnode(dev_fwnode(config->parent), config->regmap,
-						 config->regmap_irq_line, config->regmap_irq_flags,
-						 0, config->regmap_irq_chip, &gpio->irq_chip_data);
-		if (ret)
-			goto err_remove_gpiochip;
-
-		irq_domain = regmap_irq_get_domain(gpio->irq_chip_data);
-	}
-#endif
-
 	if (irq_domain) {
 		ret = gpiochip_irqchip_add_domain(chip, irq_domain);
 		if (ret)
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index ff2732f909d9..eff3a6f11479 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -63,16 +63,11 @@ enum gpio_regmap_operation {
  * @reg_stride:		(Optional) May be set if the registers (of the
  *			same type, dat, set, etc) are not consecutive.
  * @ngpio_per_reg:	(Optional) Number of GPIOs per register
- * @irq_domain:		(Optional) IRQ domain if the controller is
- *			interrupt-capable. Cannot be used together with the
- *			gpio_regmap_*_irq() callbacks. Use @create_irq_domain
- *			instead.
  * @create_irq_domain:	(Optional) Callback to create the IRQ domain in the
  *			controller driver. Called after the gpio_chip is added
  *			so the gpio_regmap_*_irq() have a valid gpio_regmap
  *			pointer. Do NOT use any resource managed allocations in
  *			this callback.
- *			Mutually exclusive with @irq_domain and @regmap_irq_chip.
  * @remove_irq_domain:	(Optional) Callback to remove the IRQ domain created in
  *			the .create_irq_domain() callback. Dispose any IRQ
  *			mappings, remove the IRQ domain and free any resources.
@@ -86,11 +81,6 @@ enum gpio_regmap_operation {
  *			(Optional) Bitmap representing the fixed direction of
  *			the GPIO lines. Useful when there are GPIO lines with a
  *			fixed direction mixed together in the same register.
- * @regmap_irq_chip:	(Optional) Pointer on an regmap_irq_chip structure. If
- *			set, a regmap-irq device will be created and the IRQ
- *			domain will be set accordingly.
- * @regmap_irq_line:	(Optional) The IRQ the device uses to signal interrupts.
- * @regmap_irq_flags:	(Optional) The IRQF_ flags to use for the interrupt.
  * @reg_mask_xlate:	(Optional) Translates base address and GPIO
  *			offset to a register/bitmask pair. If not
  *			given the default gpio_regmap_simple_xlate()
@@ -145,18 +135,11 @@ struct gpio_regmap_config {
 	unsigned int reg_dir_out_base;
 	int reg_stride;
 	int ngpio_per_reg;
-	struct irq_domain *irq_domain;
 	struct irq_domain *(*create_irq_domain)(struct gpio_regmap *gpio);
 	void (*remove_irq_domain)(struct gpio_regmap *gpio);
 	unsigned long *fixed_direction_mask;
 	unsigned long *fixed_direction_output;
 
-#ifdef CONFIG_REGMAP_IRQ
-	struct regmap_irq_chip *regmap_irq_chip;
-	int regmap_irq_line;
-	unsigned long regmap_irq_flags;
-#endif
-
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, enum gpio_regmap_operation,
 			      unsigned int base, unsigned int offset,
 			      unsigned int *reg, unsigned int *mask);
-- 
2.47.3


