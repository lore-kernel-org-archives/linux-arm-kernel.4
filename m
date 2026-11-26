Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A09606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A3f7moI/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odsnZZ7W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7pfVJR/ORfrWn6dyVrVVUDAmhIsxgWK2t2vjt2P4vmU=; b=A3f7moI/W6eZOB
	rWeJ4Ogz+j0KrmXY3sYvrxvBcXrWL4/j1t/y1BX3b0F+QvmdM/nguX/vCULMBXaDGCu6Mko7YlsZv
	VWzNwOSHVGooufdmlsdPaRlG8JcGTfECUr+12E2HhL6NGNth1ngCSxQfxkEtjspl4u6iC32EKq7m4
	wWBCVu6GpfPup504AkXQmCavlK5U3VtN2eqxlpT4xcpH9hVNOh5YP1pDM98rgy+bttxZpuzTYbQaB
	5gH1cazzJa/QfepxUHCZ9OJP46Xydj5BVZxiVIZPRidvOEdJOl0xIFRQfp8B94KSuKOBY1ijWs55I
	x7CST9CKQRkvB7Y625Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbXC-0000000Dkem-0kiq;
	Thu, 26 Nov 2026 15:37:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbX9-0000000Dke1-0R8B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:37:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 34FA56121C;
	Thu, 26 Nov 2026 15:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809101F000D3;
	Thu, 26 Nov 2026 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707433;
	bh=7pfVJR/ORfrWn6dyVrVVUDAmhIsxgWK2t2vjt2P4vmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=odsnZZ7WLS2/JATgA6fFV4Ii2CHwZ8i6ifmc4eA41XTtkSxMgpCJyvUiClR6cGr4C
	 zTef7zhxbPI60nshxZy5TfsMP/hoH+FVBcaR7aoKKWth46B7gZxCqlVVbYtzfaFi/W
	 sKcQbCuXydUUOhm296wPpcLxn8zLQjZ2FDwTHwBZuNQSdPH5KwL+zxzimDoNn0ovvq
	 gJ8byL8bRqxAjBInGbK5xZiYzidURSwm8U+q21kqWLJkTZVQvJ4Ioo9APa3Kq6CmNG
	 YmbfOVPhonWVon5oTwQ+d5TMILpA71fyhG4RIswp0MRWXFSqQQPrRs742NB36eFwQ/
	 O3YMN12U8Ocsw==
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
Subject: [RFT PATCH 02/13] gpio: regmap: add a callback to create the IRQ domain
Date: Thu, 26 Nov 2026 16:35:13 +0100
Message-ID: <20261126153600.299724-3-mwalle@kernel.org>
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

At the moment, the an IRQ domain is attached via config->irg_domain.
This means, that it has to be created before the gpio_regmap_register()
call. The callbacks of the IRQ domain might use the gpio_regmap_*_irq()
functions. Consumers can already use the domain as soon as it is
created and this creates a small window where the callbacks dereference
a NULL pointer.

To fix this, create a new create_irq_domain() callback, that is called
after the gpio_chip is added.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-regmap.c  | 21 +++++++++++++++++++--
 include/linux/gpio/regmap.h | 10 +++++++++-
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 10cf946dbfc4..e8c13434ea5b 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -454,6 +454,14 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
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
@@ -545,6 +553,16 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
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
+	}
+
 #ifdef CONFIG_REGMAP_IRQ
 	if (config->regmap_irq_chip) {
 		gpio->regmap_irq_line = config->regmap_irq_line;
@@ -558,9 +576,8 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 			goto err_remove_gpiochip;
 
 		irq_domain = regmap_irq_get_domain(gpio->irq_chip_data);
-	} else
+	}
 #endif
-	irq_domain = config->irq_domain;
 
 	if (irq_domain) {
 		ret = gpiochip_irqchip_add_domain(chip, irq_domain);
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 6fe0877717cb..eba0620c63d6 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -62,7 +62,14 @@ enum gpio_regmap_operation {
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
+ *			pointer.
+ *			Mutually exclusive with @irq_domain and @regmap_irq_chip.
  * @fixed_direction_mask:
  *			(Optional) Bitmap representing the GPIO lines that
  *			make use of the @fixed_direction_output list to
@@ -133,6 +140,7 @@ struct gpio_regmap_config {
 	int reg_stride;
 	int ngpio_per_reg;
 	struct irq_domain *irq_domain;
+	struct irq_domain *(*create_irq_domain)(struct gpio_regmap *gpio);
 	unsigned long *fixed_direction_mask;
 	unsigned long *fixed_direction_output;
 
-- 
2.47.3


