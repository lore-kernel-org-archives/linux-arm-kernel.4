Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7081E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o852dyT+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACcT9X3E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a0pZ8MLgsjbTuyWCMnVODV3aDptP+sU/wZlDgyiqq+Y=; b=o852dyT+kfyktY
	9rGwJ1v3Ts9dqnSGg7xOyDRLUltTYw367K+uxo4KpbOQtyEOMkZt0lK8vrqZuaHbSnXQpOrZ7MQKO
	o4GI0zRrKaB2LeZb6LPJQ+Nr6biJTJAoVkGuuQtoe5rGOGAH9ItS239sivuA9d14LpBDSvDFcYakt
	ryu7lYtxOXX38wCpbPcjV5eTe3C2OK2+VPL8LOUFKiB+vGqzpCRw9YqsAl9PlQ/j3OzkFZqp7rNgt
	rZUflxy55oEcH2i3Ctgi6hW/PgPJLjxoz6+7Vttxx7pFl6EtmmHsdN6zEWr/MWcX5MjqJ8xBpM2Uz
	bdBTEMt3GACPBZFXIsWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbYL-0000000Dl9h-378V;
	Thu, 26 Nov 2026 15:38:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbXo-0000000DkwC-05sG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:37:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BAF5943578;
	Thu, 26 Nov 2026 15:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13A81F000D4;
	Thu, 26 Nov 2026 15:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707475;
	bh=a0pZ8MLgsjbTuyWCMnVODV3aDptP+sU/wZlDgyiqq+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ACcT9X3E0kUo9UuAxZQadmNjPyNNF80bJBTz2KcZ4mj8hEDPjbN2Ng3u7Lcclyuzh
	 4ElsndiziIyD7Jj5K9sDxIxv4Hlekf4P92p6aN8S1JY4DaR3gBTxkXD5NlQ2p84jBI
	 7EM8VHkcwseYPFGlCDkFafHQfgebSQD39hGI8DdIOT8K1JG8lN/qCg1VddBsGR655e
	 oqXCpfHuxuTYLiYrvXx0p50R/Nu4znUgEgNWrCjvHhz8w4irbWueOc1/BJqSKrM15i
	 1vrgkTWFLnZkDWsF8Ivmhw+Mqzm9Nfp4ShTLeYd4s4TrCKtcmIjPIjLKd6/+VGq0Ns
	 tFHOWRyDlmqEA==
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
Subject: [RFT PATCH 13/13] gpio: regmap: remove irq_domain and the regmap-irq configuration
Date: Thu, 26 Nov 2026 16:35:24 +0100
Message-ID: <20261126153600.299724-14-mwalle@kernel.org>
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

Now that all users have been converted to the new .create_irq_domain()
callback, remove the old methods.

Also remove the __maybe_unused annotations because the helpers are now
guarded with CONFIG_REGMAP_IRQ.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-regmap.c  | 34 ++++------------------------------
 include/linux/gpio/regmap.h | 17 -----------------
 2 files changed, 4 insertions(+), 47 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 99a86efe8deb..fadc4565bb9d 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -397,17 +397,17 @@ void gpio_regmap_relres_irq(struct gpio_regmap *gpio, unsigned int offset)
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
  * gpio_regmap_add_irq_chip() - Add a regmap-irq chip for the GPIO lines
  * @gpio: gpio_regmap device
@@ -476,7 +476,7 @@ EXPORT_SYMBOL_GPL(gpio_regmap_disable_irq);
  */
 struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config)
 {
-	struct irq_domain *irq_domain;
+	struct irq_domain *irq_domain = NULL;
 	struct gpio_regmap *gpio;
 	struct gpio_chip *chip;
 	int ret;
@@ -497,14 +497,6 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
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
@@ -596,8 +588,6 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	if (ret < 0)
 		goto err_free_bitmap_output;
 
-	irq_domain = config->irq_domain;
-
 	if (config->create_irq_domain) {
 		irq_domain = config->create_irq_domain(gpio);
 		if (IS_ERR(irq_domain)) {
@@ -606,22 +596,6 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 		}
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
index 7f578b9a82e6..fa67a29cecd8 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -63,15 +63,10 @@ enum gpio_regmap_operation {
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
  *			pointer.
- *			Mutually exclusive with @irq_domain and @regmap_irq_chip.
  * @fixed_direction_mask:
  *			(Optional) Bitmap representing the GPIO lines that
  *			make use of the @fixed_direction_output list to
@@ -82,11 +77,6 @@ enum gpio_regmap_operation {
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
@@ -141,17 +131,10 @@ struct gpio_regmap_config {
 	unsigned int reg_dir_out_base;
 	int reg_stride;
 	int ngpio_per_reg;
-	struct irq_domain *irq_domain;
 	struct irq_domain *(*create_irq_domain)(struct gpio_regmap *gpio);
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


