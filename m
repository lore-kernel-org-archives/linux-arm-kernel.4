Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6555F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iTHtiPAj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FwfgTH7O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kAXdgSpgkGfH7yPtpq6S4KTu5yFHQULL5qOZsvA/AAI=; b=iTHtiPAjYuUTRx
	GW/N2IG4rd2eDwQN4lytifW7pT4LJKi8/6MtceC78Mvi5DFDsm16tnDfxWIFq2aE5gOfXgIrt0Inc
	w5JJR8G6UPa4QcSFWYy/7PYTCaBiut0okqtfg3d9VO4jKY1ygC5wxCdiWA8ZYkvm2WBTDODTHiPEi
	MIDs2kjqLpPilJArX3o++Lbg5FJNaoiGlCwpwqn36DHFg0o7sZo+xidmez0OIBi70+QfZ8qz8t1Hn
	Ol11ler1YvaOC+fTPNQI9Rrkvf+TJEwF0QMQ7j8+r9t5prDTtGDFnKSzZmOX76A9C4fsN+DdkbjMq
	oX/CuRdDeI0YrMl/7xgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxK0-0000000GdZl-399R;
	Fri, 27 Nov 2026 14:53:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxJo-0000000GdVk-1Zys
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:52:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A5E5360D7C;
	Fri, 27 Nov 2026 14:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8D31F000C1;
	Fri, 27 Nov 2026 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791175;
	bh=kAXdgSpgkGfH7yPtpq6S4KTu5yFHQULL5qOZsvA/AAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FwfgTH7ODj2H/0DZb0mVRkGHNxzr76mhsP3BgdBO1J6fimZVM/4PYjwaboQmnIx6G
	 gVKa+iuBqZpb2c+RwkmL8XYdBpoWpibd9AaLZgvBLV6gCNZaIh0fkS/KrI/ECwWZqN
	 iviDKOYwhmiZDGWyKeWTYBXbHv4E8RslHCf/oR30O1FUQFVFMb61k2n+yn4LT1vjvM
	 BO+lrhFo0bH+wzUnDkegSMyZLBhs6Aov36yaVsS6wTz94O/8tyTGwTRm2KkJTFTHul
	 i/ebA7fzxnCPI/u//wkfWIEs28kPKn41pZQOnjIePwOlpOk4FzBPmcyacIKEfsepfd
	 diSC8WDwzuTrQ==
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
Subject: [RFT PATCH v2 04/14] gpio: rtd1625: create the IRQ domain from the gpio-regmap callback
Date: Fri, 27 Nov 2026 15:52:21 +0100
Message-ID: <20261127145232.814492-5-mwalle@kernel.org>
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

Use the new .create_irq_domain() to actually create the domain. This
way, there is no window where a NULL pointer could be dereferenced.

Switch the irq host_data to the gpio_regmap pointer because it will
already be needed in the irq domain callbacks. Otherwise the
.create_irq_domain() callback would have to set the data->gpio_reg
pointer which looks odd.

Split the interrupt handling into two steps: first fill in the
interrupts and in the callback attach the handler.

Don't use device managed resources anymore. Instead use the new
.remove_irq_domain() callback. The driver didn't dispose any of the IRQ
mappings before, although irq_domain_remove() mandates that. Thus add
that to this callback, too.

Fixes: 6435d21cbd42 ("gpio: realtek: Add driver for Realtek DHC RTD1625 SoC")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-rtd1625.c | 91 ++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
index cf4f61603dfb..20ec4182725d 100644
--- a/drivers/gpio/gpio-rtd1625.c
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -79,7 +79,6 @@ struct rtd1625_gpio_info {
 };
 
 struct rtd1625_gpio {
-	struct gpio_regmap *gpio_reg;
 	const struct rtd1625_gpio_info *info;
 	struct regmap *regmap;
 	unsigned int irqs[RTD1625_MAX_IRQS];
@@ -290,7 +289,7 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 
 static void rtd1625_gpio_ack_irq(struct irq_data *d)
 {
-	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(irq_data_get_irq_chip_data(d));
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	u32 irq_type = irqd_get_trigger_type(d);
 	u32 bit_mask = BIT(hwirq % 32);
@@ -352,11 +351,12 @@ static void rtd1625_gpio_disable_level_irq(struct rtd1625_gpio *data, irq_hw_num
 
 static void rtd1625_gpio_enable_irq(struct irq_data *d)
 {
-	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	struct gpio_regmap *gpio_reg = irq_data_get_irq_chip_data(d);
+	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio_reg);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	u32 irq_type = irqd_get_trigger_type(d);
 
-	gpio_regmap_enable_irq(data->gpio_reg, hwirq);
+	gpio_regmap_enable_irq(gpio_reg, hwirq);
 
 	if (irq_type & IRQ_TYPE_EDGE_BOTH)
 		rtd1625_gpio_enable_edge_irq(data, hwirq);
@@ -366,7 +366,8 @@ static void rtd1625_gpio_enable_irq(struct irq_data *d)
 
 static void rtd1625_gpio_disable_irq(struct irq_data *d)
 {
-	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	struct gpio_regmap *gpio_reg = irq_data_get_irq_chip_data(d);
+	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio_reg);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	u32 irq_type = irqd_get_trigger_type(d);
 
@@ -375,7 +376,7 @@ static void rtd1625_gpio_disable_irq(struct irq_data *d)
 	else if (irq_type & IRQ_TYPE_LEVEL_MASK)
 		rtd1625_gpio_disable_level_irq(data, hwirq);
 
-	gpio_regmap_disable_irq(data->gpio_reg, hwirq);
+	gpio_regmap_disable_irq(gpio_reg, hwirq);
 }
 
 static int rtd1625_gpio_irq_set_level_type(struct irq_data *d, bool level)
@@ -385,7 +386,7 @@ static int rtd1625_gpio_irq_set_level_type(struct irq_data *d, bool level)
 	struct rtd1625_gpio *data;
 	int ret;
 
-	data = irq_data_get_irq_chip_data(d);
+	data = gpio_regmap_get_drvdata(irq_data_get_irq_chip_data(d));
 	if (!(data->info->irq_type_support & IRQ_TYPE_LEVEL_MASK))
 		return -EINVAL;
 
@@ -406,7 +407,7 @@ static int rtd1625_gpio_irq_set_level_type(struct irq_data *d, bool level)
 
 static int rtd1625_gpio_irq_set_edge_type(struct irq_data *d, bool polarity)
 {
-	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(irq_data_get_irq_chip_data(d));
 	u32 val = RTD1625_GPIO_WREN(RTD1625_GPIO_EDGE_INT_DP);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	int ret;
@@ -454,16 +455,16 @@ static int rtd1625_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 static int rtd1625_gpio_irq_request_resources(struct irq_data *d)
 {
-	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	struct gpio_regmap *gpio_reg = irq_data_get_irq_chip_data(d);
 
-	return gpio_regmap_reqres_irq(data->gpio_reg, d->hwirq);
+	return gpio_regmap_reqres_irq(gpio_reg, d->hwirq);
 }
 
 static void rtd1625_gpio_irq_release_resources(struct irq_data *d)
 {
-	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	struct gpio_regmap *gpio_reg = irq_data_get_irq_chip_data(d);
 
-	gpio_regmap_relres_irq(data->gpio_reg, d->hwirq);
+	gpio_regmap_relres_irq(gpio_reg, d->hwirq);
 }
 
 static struct irq_chip rtd1625_iso_gpio_irq_chip = {
@@ -477,7 +478,7 @@ static struct irq_chip rtd1625_iso_gpio_irq_chip = {
 	.irq_release_resources = rtd1625_gpio_irq_release_resources,
 };
 
-static int rtd1625_gpio_setup_irq(struct platform_device *pdev, struct rtd1625_gpio *data)
+static int rtd1625_gpio_get_irqs(struct platform_device *pdev, struct rtd1625_gpio *data)
 {
 	unsigned int num_irqs;
 	int irq;
@@ -496,7 +497,6 @@ static int rtd1625_gpio_setup_irq(struct platform_device *pdev, struct rtd1625_g
 			return irq;
 
 		data->irqs[i] = irq;
-		irq_set_chained_handler_and_data(data->irqs[i], rtd1625_gpio_irq_handle, data);
 	}
 
 	return 0;
@@ -505,9 +505,9 @@ static int rtd1625_gpio_setup_irq(struct platform_device *pdev, struct rtd1625_g
 static int rtd1625_gpio_irq_map(struct irq_domain *domain, unsigned int irq,
 				irq_hw_number_t hwirq)
 {
-	struct rtd1625_gpio *data = domain->host_data;
+	struct gpio_regmap *gpio_reg = domain->host_data;
 
-	irq_set_chip_data(irq, data);
+	irq_set_chip_data(irq, gpio_reg);
 
 	irq_set_chip_and_handler(irq, &rtd1625_iso_gpio_irq_chip, handle_bad_irq);
 
@@ -524,6 +524,47 @@ static const struct irq_domain_ops rtd1625_gpio_irq_domain_ops = {
 	.xlate = irq_domain_xlate_twocell,
 };
 
+static struct irq_domain *rtd1625_gpio_create_irq_domain(struct gpio_regmap *gpio_reg)
+{
+	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio_reg);
+	struct device *dev = regmap_get_device(data->regmap);
+	struct irq_domain_info d_info = {};
+
+	d_info.fwnode = dev_fwnode(dev);
+	d_info.size = data->info->num_gpios;
+	d_info.hwirq_max = data->info->num_gpios;
+	d_info.ops = &rtd1625_gpio_irq_domain_ops;
+	d_info.host_data = gpio_reg;
+
+	data->domain = irq_domain_instantiate(&d_info);
+	if (IS_ERR(data->domain))
+		return data->domain;
+
+	for (unsigned int i = 0; i < RTD1625_MAX_IRQS; i++) {
+		if (data->irqs[i])
+			irq_set_chained_handler_and_data(data->irqs[i],
+							 rtd1625_gpio_irq_handle,
+							 data);
+	}
+
+	return data->domain;
+}
+
+static void rtd1625_gpio_remove_irq_domain(struct gpio_regmap *gpio_reg)
+{
+	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio_reg);
+
+	for (unsigned int i = 0; i < RTD1625_MAX_IRQS; i++) {
+		if (data->irqs[i])
+			irq_set_chained_handler_and_data(data->irqs[i], NULL, NULL);
+	}
+
+	for (irq_hw_number_t hwirq = 0; hwirq < data->info->num_gpios; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(data->domain, hwirq));
+
+	irq_domain_remove(data->domain);
+}
+
 static const struct regmap_config rtd1625_gpio_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -536,7 +577,6 @@ static const struct regmap_config rtd1625_gpio_regmap_config = {
 static int rtd1625_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_regmap_config config = {};
-	struct irq_domain_info d_info = {};
 	struct device *dev = &pdev->dev;
 	struct gpio_regmap *gpio_reg;
 	struct rtd1625_gpio *data;
@@ -578,29 +618,18 @@ static int rtd1625_gpio_probe(struct platform_device *pdev)
 	config.set_config = rtd1625_gpio_set_config;
 	config.value_xlate = rtd1625_value_xlate;
 
-	d_info.fwnode = dev_fwnode(&pdev->dev);
-	d_info.size = data->info->num_gpios;
-	d_info.hwirq_max = data->info->num_gpios;
-	d_info.ops = &rtd1625_gpio_irq_domain_ops;
-	d_info.host_data = data;
-
-	data->domain = devm_irq_domain_instantiate(dev, &d_info);
-	if (IS_ERR(data->domain))
-		return PTR_ERR(data->domain);
-
-	ret = rtd1625_gpio_setup_irq(pdev, data);
+	ret = rtd1625_gpio_get_irqs(pdev, data);
 	if (ret)
 		return ret;
 
-	config.irq_domain = data->domain;
 	config.drvdata = data;
+	config.create_irq_domain = rtd1625_gpio_create_irq_domain;
+	config.remove_irq_domain = rtd1625_gpio_remove_irq_domain;
 
 	gpio_reg = devm_gpio_regmap_register(dev, &config);
 	if (IS_ERR(gpio_reg))
 		return PTR_ERR(gpio_reg);
 
-	data->gpio_reg = gpio_reg;
-
 	return 0;
 }
 
-- 
2.47.3


