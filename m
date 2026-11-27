Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA23606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aBH14WFV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W+qBd5N3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pr5OX8obDxEOfrBPhVO7Dkf6ZP5Arlis8rplOxMa5NM=; b=aBH14WFVIu61Lk
	f4qx6bNSojXbz6znHd7x4LrKecLPNIp88JsCwH9KgudagIz8Ihy+u63eVktI1whgEWJ0mTPyMqKNZ
	qYsBK/OJogQaDriYh4g9GhuFHIhL9D8FpkP5haRhsGaQk0aSi1pNqPPkbgAVJ0hupmxgAHXsVy5TJ
	VNpDa6ELIKwDnj2l5+5PGuKUAAAiLR5cIe8CuwQO0IkIF2EQOIOgPXBT7F0SDdmDP5rS/l1AHnSQJ
	IQNs8QV1zkn92rnT1tB52LBOTyhFPvJ2ivNO7NjqVx03WLbIQhB+h6+0sk76Raci+uXD9AdbHgv3+
	y4LDclxkxRWLxOBxM1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxK0-0000000GdZV-2ly5;
	Fri, 27 Nov 2026 14:53:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxJj-0000000GdTa-3flN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:52:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B5064434B;
	Fri, 27 Nov 2026 14:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381181F008A0;
	Fri, 27 Nov 2026 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791171;
	bh=pr5OX8obDxEOfrBPhVO7Dkf6ZP5Arlis8rplOxMa5NM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W+qBd5N3HtAD0qeF3qoCnbV1677Qs004d4+IosuWrIe1FsOWpiFE4cWSzxDjOYxzt
	 y99smYx7A1aT32YpzMRZrodw8Wcy9OPHbyp+01MCrBntTpjc1QCG96qMOAGhIjo4NN
	 yI58v3pqI1mEN/HYqrSIsnwz/7eVcxv8MsBdJST8LlsWIJOrHaKl87Ebw1GxP0J0vG
	 3bNHil9VSslxjOU088FLdU7kyPFuEJNZbq5tNKK9dCv+4u6KM1FlLEQAD2gRWX9hss
	 d8pGU4dGQq4VL2LQUxZWcxq3r+ykYbbPefe4ko6pHOTf3igKHiTF/L+dY2q/HKy4GS
	 wXH2je8IQk62w==
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
Subject: [RFT PATCH v2 03/14] gpio: regmap: add callbacks to handle IRQ domains
Date: Fri, 27 Nov 2026 15:52:20 +0100
Message-ID: <20261127145232.814492-4-mwalle@kernel.org>
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

At the moment, an IRQ domain is attached via config->irq_domain.
This means, that it has to be created before the gpio_regmap_register()
call. The callbacks of the IRQ domain might use the gpio_regmap_*_irq()
functions. Consumers can already use the domain as soon as it is
created and this creates a small window where the callbacks dereference
a NULL pointer.

To fix this, create a new create_irq_domain() callback, that is called
after the gpio_chip is added.

Also add a remove_irq_domain() callback, which is called after the
gpio_chip is removed and before the gpio_regmap is freed. It is supposed
to dispose the IRQ mappings and remove the domain.

Also ordering of the resources matter, so we forbid any device managed
resource handling. Any resources allocated in the create_irq_domain()
callback has to be freed manually in the remove_irq_domain() callback.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Tested-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/gpio/gpio-regmap.c  | 30 ++++++++++++++++++++++++++++--
 include/linux/gpio/regmap.h | 15 ++++++++++++++-
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index c04b79da5cdb..061d2800d0a0 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -39,6 +39,8 @@ struct gpio_regmap {
 	unsigned long *fixed_direction_mask;
 	unsigned long *fixed_direction_output;
 
+	void (*remove_irq_domain)(struct gpio_regmap *gpio);
+
 #ifdef CONFIG_REGMAP_IRQ
 	int regmap_irq_line;
 	struct regmap_irq_chip_data *irq_chip_data;
@@ -454,6 +456,14 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	if (config->reg_dir_out_base && config->reg_dir_in_base)
 		return ERR_PTR(-EINVAL);
 
+	/* there is only one way to provide an IRQ domain */
+	if (config->create_irq_domain && config->irq_domain)
+		return ERR_PTR(-EINVAL);
+#ifdef CONFIG_REGMAP_IRQ
+	if (config->create_irq_domain && config->regmap_irq_chip)
+		return ERR_PTR(-EINVAL);
+#endif
+
 	gpio = kzalloc_obj(*gpio);
 	if (!gpio)
 		return ERR_PTR(-ENOMEM);
@@ -545,6 +555,17 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	if (ret < 0)
 		goto err_free_bitmap_output;
 
+	irq_domain = config->irq_domain;
+
+	if (config->create_irq_domain) {
+		irq_domain = config->create_irq_domain(gpio);
+		if (IS_ERR(irq_domain)) {
+			ret = PTR_ERR(irq_domain);
+			goto err_remove_gpiochip;
+		}
+		gpio->remove_irq_domain = config->remove_irq_domain;
+	}
+
 #ifdef CONFIG_REGMAP_IRQ
 	if (config->regmap_irq_chip) {
 		gpio->regmap_irq_line = config->regmap_irq_line;
@@ -558,9 +579,8 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 			goto err_remove_gpiochip;
 
 		irq_domain = regmap_irq_get_domain(gpio->irq_chip_data);
-	} else
+	}
 #endif
-	irq_domain = config->irq_domain;
 
 	if (irq_domain) {
 		ret = gpiochip_irqchip_add_domain(chip, irq_domain);
@@ -573,6 +593,9 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 err_remove_gpiochip:
 	gpiochip_remove(chip);
 
+	if (gpio->remove_irq_domain)
+		gpio->remove_irq_domain(gpio);
+
 #ifdef CONFIG_REGMAP_IRQ
 	if (gpio->irq_chip_data)
 		regmap_del_irq_chip(gpio->regmap_irq_line, gpio->irq_chip_data);
@@ -601,6 +624,9 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
 	 */
 	gpiochip_remove(&gpio->gpio_chip);
 
+	if (gpio->remove_irq_domain)
+		gpio->remove_irq_domain(gpio);
+
 #ifdef CONFIG_REGMAP_IRQ
 	if (gpio->irq_chip_data)
 		regmap_del_irq_chip(gpio->regmap_irq_line, gpio->irq_chip_data);
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 6fe0877717cb..dee5f8d2c48c 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -62,7 +62,18 @@ enum gpio_regmap_operation {
  *			same type, dat, set, etc) are not consecutive.
  * @ngpio_per_reg:	(Optional) Number of GPIOs per register
  * @irq_domain:		(Optional) IRQ domain if the controller is
- *			interrupt-capable
+ *			interrupt-capable. Cannot be used together with the
+ *			gpio_regmap_*_irq() callbacks. Use @create_irq_domain
+ *			instead.
+ * @create_irq_domain:	(Optional) Callback to create the IRQ domain in the
+ *			controller driver. Called after the gpio_chip is added
+ *			so the gpio_regmap_*_irq() have a valid gpio_regmap
+ *			pointer. Do NOT use any resource managed allocations in
+ *			this callback.
+ *			Mutually exclusive with @irq_domain and @regmap_irq_chip.
+ * @remove_irq_domain:	(Optional) Callback to remove the IRQ domain created in
+ *			the .create_irq_domain() callback. Dispose any IRQ
+ *			mappings, remove the IRQ domain and free any resources.
  * @fixed_direction_mask:
  *			(Optional) Bitmap representing the GPIO lines that
  *			make use of the @fixed_direction_output list to
@@ -133,6 +144,8 @@ struct gpio_regmap_config {
 	int reg_stride;
 	int ngpio_per_reg;
 	struct irq_domain *irq_domain;
+	struct irq_domain *(*create_irq_domain)(struct gpio_regmap *gpio);
+	void (*remove_irq_domain)(struct gpio_regmap *gpio);
 	unsigned long *fixed_direction_mask;
 	unsigned long *fixed_direction_output;
 
-- 
2.47.3


