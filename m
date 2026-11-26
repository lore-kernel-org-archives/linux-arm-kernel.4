Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89349606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bt5z/Drx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUUt8kvn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vLEm9TwV/FURg8liKbY0NmARpWLBuAq4ZKYof5+TIQg=; b=Bt5z/DrxkstM7I
	k6ufar3bFj1ZGJqxDp1xRl/2qQ0HwSoy/RSec/6dbux6D41Skb5ri9F4Pbi+dp+a5aeBGT41A28aj
	BXNXMoG+Kbt75ovxOQNztI6B3kC/1UoZ0cd4yQ4Yr0kEIX7aaYhGKA4WIG+9+/M5goqfliFmYBF00
	0uP/LA2o9/o48k2c3Ijx1ObeQV8yFRsIdirbLRPkwQsnsxl0SHmkoWVQk+g1hVjdPfSGZgOkG1IOg
	xb8jWqYGS/WDgJrd4MTrmLCGVdSRoFjFDEgvaVCzh1ewRKuD+1n2lUbFib5MTzhf5/wbs3TeCtD7B
	HmY9G/O3RGgJTDnwRDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbXT-0000000Dkm7-1yVV;
	Thu, 26 Nov 2026 15:37:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbXG-0000000Dkgy-1wUy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:37:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1E086121C;
	Thu, 26 Nov 2026 15:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DBF1F000C4;
	Thu, 26 Nov 2026 15:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707441;
	bh=vLEm9TwV/FURg8liKbY0NmARpWLBuAq4ZKYof5+TIQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bUUt8kvnRuKvdnzxNZRjzvha0D0gntwYwecu3ATdvfwdJ3egowNexbhTzITuGU8w/
	 QJZauG+hsYDMz1QYfNBCkGfWqBTwOdRscQ3tBXp6MM7nPyJFxxdzpzc/ElNcYjrfpk
	 xWb/izYXlR2zmiwIR7+xAB3oRG7Na/P6qgyMhKm1RsT6y2Ey2A5R4b0xm9QdMQ+pMq
	 bHl05lulB0s8iPfu+KnATEftoC8V3JtZ290bdax7NE2wSqUzn21fC5X/jdmKfVqahn
	 VIepGDvpc2eeOP6EMBMlUUkhdO9nJ5TZlsHPoLh5DtrIDG3P1WYtT+8juFX2x9/jVd
	 JchLzQHz7QYaA==
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
Subject: [RFT PATCH 04/13] gpio: axiado-sgpio: create the IRQ domain from the gpio-regmap callback
Date: Thu, 26 Nov 2026 16:35:15 +0100
Message-ID: <20261126153600.299724-5-mwalle@kernel.org>
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

Use the new .create_irq_domain() to actually create the domain. This
way, there is no window where a NULL pointer could be dereferenced in
the irq callbacks.

Switch the irq host_data to the gpio_regmap pointer because it will
already be needed in the irq domain callbacks. Otherwise, the
.create_irq_domain() callback would have to set the sgpio->gpio pointer
which looks odd.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-axiado-sgpio.c | 64 ++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpio-axiado-sgpio.c b/drivers/gpio/gpio-axiado-sgpio.c
index 3af222b718e6..2785d0cfb403 100644
--- a/drivers/gpio/gpio-axiado-sgpio.c
+++ b/drivers/gpio/gpio-axiado-sgpio.c
@@ -155,7 +155,6 @@ struct axiado_sgpio {
 	u32 nsignals;
 	u32 din_bank_shift;
 	unsigned long *dir_out;
-	struct gpio_regmap *gpio;
 	struct irq_domain *domain;
 	struct regmap *regmap;
 	const struct axiado_sgpio_reg_offsets *regs;
@@ -376,7 +375,7 @@ static void axiado_sgpio_disable(void *data)
 
 static int axiado_sgpio_set_irq_type(struct irq_data *d, unsigned int type)
 {
-	struct axiado_sgpio *sgpio = irq_data_get_irq_chip_data(d);
+	struct axiado_sgpio *sgpio = gpio_regmap_get_drvdata(irq_data_get_irq_chip_data(d));
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	unsigned int position;
 
@@ -407,34 +406,36 @@ static int axiado_sgpio_set_irq_type(struct irq_data *d, unsigned int type)
 
 static void axiado_sgpio_mask_irq(struct irq_data *d)
 {
-	struct axiado_sgpio *sgpio = irq_data_get_irq_chip_data(d);
+	struct gpio_regmap *gpio = irq_data_get_irq_chip_data(d);
+	struct axiado_sgpio *sgpio = gpio_regmap_get_drvdata(gpio);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	clear_bit(hwirq / 2, sgpio->irq_unmasked);
-	gpio_regmap_disable_irq(sgpio->gpio, hwirq);
+	gpio_regmap_disable_irq(gpio, hwirq);
 }
 
 static void axiado_sgpio_unmask_irq(struct irq_data *d)
 {
-	struct axiado_sgpio *sgpio = irq_data_get_irq_chip_data(d);
+	struct gpio_regmap *gpio = irq_data_get_irq_chip_data(d);
+	struct axiado_sgpio *sgpio = gpio_regmap_get_drvdata(gpio);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	gpio_regmap_enable_irq(sgpio->gpio, hwirq);
+	gpio_regmap_enable_irq(gpio, hwirq);
 	set_bit(hwirq / 2, sgpio->irq_unmasked);
 }
 
 static int axiado_sgpio_irq_request_resources(struct irq_data *d)
 {
-	struct axiado_sgpio *sgpio = irq_data_get_irq_chip_data(d);
+	struct gpio_regmap *gpio = irq_data_get_irq_chip_data(d);
 
-	return gpio_regmap_reqres_irq(sgpio->gpio, d->hwirq);
+	return gpio_regmap_reqres_irq(gpio, d->hwirq);
 }
 
 static void axiado_sgpio_irq_release_resources(struct irq_data *d)
 {
-	struct axiado_sgpio *sgpio = irq_data_get_irq_chip_data(d);
+	struct gpio_regmap *gpio = irq_data_get_irq_chip_data(d);
 
-	gpio_regmap_relres_irq(sgpio->gpio, d->hwirq);
+	gpio_regmap_relres_irq(gpio, d->hwirq);
 }
 
 static const struct irq_chip axiado_sgpio_irqchip = {
@@ -450,13 +451,13 @@ static const struct irq_chip axiado_sgpio_irqchip = {
 static int axiado_sgpio_irq_map(struct irq_domain *domain, unsigned int virq,
 				irq_hw_number_t hwirq)
 {
-	struct axiado_sgpio *sgpio = domain->host_data;
+	struct gpio_regmap *gpio = domain->host_data;
 
 	/* Only even offsets represent input GPIOs. */
 	if (hwirq % 2)
 		return -EINVAL;
 
-	irq_set_chip_data(virq, sgpio);
+	irq_set_chip_data(virq, gpio);
 	irq_set_lockdep_class(virq, &axiado_sgpio_irq_lock_class,
 			      &axiado_sgpio_irq_request_class);
 	irq_set_chip_and_handler(virq, &axiado_sgpio_irqchip, handle_simple_irq);
@@ -471,6 +472,25 @@ static const struct irq_domain_ops axiado_sgpio_domain_ops = {
 	.xlate = irq_domain_xlate_twocell,
 };
 
+static struct irq_domain *axiado_sgpio_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct axiado_sgpio *sgpio = gpio_regmap_get_drvdata(gpio);
+	struct device *dev = regmap_get_device(sgpio->regmap);
+	struct platform_device *pdev = to_platform_device(dev);
+	unsigned int ngpio = sgpio->nsignals * 2;
+	struct irq_domain_info d_info = { };
+
+	d_info.fwnode = dev_fwnode(&pdev->dev);
+	d_info.size = ngpio;
+	d_info.hwirq_max = ngpio;
+	d_info.ops = &axiado_sgpio_domain_ops;
+	d_info.host_data = gpio;
+
+	sgpio->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
+
+	return sgpio->domain;
+}
+
 static int axiado_sgpio_init_input_cache(struct axiado_sgpio *sgpio)
 {
 	unsigned int num_banks = DIV_ROUND_UP(sgpio->nsignals,
@@ -548,8 +568,8 @@ static const struct regmap_config axiado_sgpio_regmap_config = {
 static int axiado_sgpio_probe(struct platform_device *pdev)
 {
 	struct gpio_regmap_config config = { };
-	struct irq_domain_info d_info = { };
 	struct axiado_sgpio *sgpio;
+	struct gpio_regmap *gpio;
 	unsigned int ngpio, i;
 	unsigned long apb_freq;
 	struct clk *apb_clk;
@@ -658,16 +678,6 @@ static int axiado_sgpio_probe(struct platform_device *pdev)
 	for (i = 1; i < ngpio; i += 2)
 		__set_bit(i, sgpio->dir_out);
 
-	d_info.fwnode = dev_fwnode(&pdev->dev);
-	d_info.size = ngpio;
-	d_info.hwirq_max = ngpio;
-	d_info.ops = &axiado_sgpio_domain_ops;
-	d_info.host_data = sgpio;
-
-	sgpio->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
-	if (IS_ERR(sgpio->domain))
-		return PTR_ERR(sgpio->domain);
-
 	config.parent = &pdev->dev;
 	config.regmap = sgpio->regmap;
 	config.ngpio = ngpio;
@@ -675,12 +685,12 @@ static int axiado_sgpio_probe(struct platform_device *pdev)
 	config.reg_set_base = GPIO_REGMAP_ADDR(sgpio->regs->dout_ss);
 	config.reg_mask_xlate = axiado_sgpio_reg_mask_xlate;
 	config.fixed_direction_output = sgpio->dir_out;
-	config.irq_domain = sgpio->domain;
 	config.drvdata = sgpio;
+	config.create_irq_domain = axiado_sgpio_create_irq_domain;
 
-	sgpio->gpio = devm_gpio_regmap_register(&pdev->dev, &config);
-	if (IS_ERR(sgpio->gpio))
-		return dev_err_probe(&pdev->dev, PTR_ERR(sgpio->gpio),
+	gpio = devm_gpio_regmap_register(&pdev->dev, &config);
+	if (IS_ERR(gpio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
 				     "Could not register gpiochip\n");
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.47.3


