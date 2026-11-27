Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23003606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MGQ3IQQk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJsp/8wh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=teInCXB1IQUkEfsUoC42cAGLIlvhiPKtcU6j6iJ2U/o=; b=MGQ3IQQkqHYqSV
	uZoPlTiAlC9WPnstNqvdh+4HjC3GGNLjFvv+aR1rx1gbMTEj+Eyyta45df8cTLT+mxnM1H838Ph46
	b076dUEYsa6K3WGf/GFpNLXIH7zvRCzs0t1aaaeqBahSVL7gaOYtQKIMTFvX8pbcP9OMmy/YJhj2R
	Dj5UDLG8KqrTdUyM/235aSFOZ2JfaG9U3VrQoc9QOlHbzJeOeAn4sKsgAr9ETQqjWDdWiArB/mxEr
	n2j8aniXM0QTtYxMFBanbSBhRsX+nApI+oV3Ghsd+bp7N85NUUH1CAbaXykoOohobgV9+YZLcMHr6
	q952IpStT7jcLF/GJkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxKq-0000000Ge6Q-1t5n;
	Fri, 27 Nov 2026 14:54:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxK3-0000000GdcU-1G6X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:53:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A9FF760D7C;
	Fri, 27 Nov 2026 14:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0417B1F000C1;
	Fri, 27 Nov 2026 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791190;
	bh=teInCXB1IQUkEfsUoC42cAGLIlvhiPKtcU6j6iJ2U/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iJsp/8whgkR5O04jEZ7YvW/4xajfzxERXW+Nkt8xRxkqOfAs72GyE+61kcVU84qCL
	 iQ99ckRJL4QQj2DWqYwmu4aqMH3/U6buUHbFpD5VQKHA1jhddXpDPjpEb78tHZ8KCS
	 ZmK98oDtMgZgGofjbRpbWiWceTwDJA7iKeRtqmmPUE84U2/QeVAFiQJXmnmx2XYP36
	 aCbLVerK9ssmf30M+g0MUHFwiWcDJfM8vkKA9avFOHyO1H5sk2Px1mVvK6FbVUcUMG
	 XHh8AQvZUXAiZReBZE3psc+y5maPYO6OqMTSknsfhEFyV6AQJ4zp/wOdtS4/jSn6TC
	 A+gSvDmYrnc3w==
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
Subject: [RFT PATCH v2 08/14] gpio: sl28cpld: create the regmap-irq chip from the gpio-regmap callback
Date: Fri, 27 Nov 2026 15:52:25 +0100
Message-ID: <20261127145232.814492-9-mwalle@kernel.org>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-sl28cpld.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-sl28cpld.c b/drivers/gpio/gpio-sl28cpld.c
index 57cadeb07fde..46141da2d2f7 100644
--- a/drivers/gpio/gpio-sl28cpld.c
+++ b/drivers/gpio/gpio-sl28cpld.c
@@ -44,14 +44,28 @@ static const struct regmap_irq sl28cpld_gpio_irqs[] = {
 	REGMAP_IRQ_REG_LINE(7, 8),
 };
 
+struct sl28cpld_gpio {
+	struct regmap_irq_chip irq_chip;
+	int irq;
+};
+
+static struct irq_domain *sl28cpld_gpio_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct sl28cpld_gpio *sl28cpld_gpio = gpio_regmap_get_drvdata(gpio);
+
+	return gpio_regmap_add_irq_chip(gpio, sl28cpld_gpio->irq,
+					IRQF_SHARED | IRQF_ONESHOT,
+					&sl28cpld_gpio->irq_chip);
+}
+
 static int sl28cpld_gpio_irq_init(struct platform_device *pdev,
 				  unsigned int base,
 				  struct gpio_regmap_config *config)
 {
-	struct regmap_irq_chip_data *irq_data;
+	struct sl28cpld_gpio *sl28cpld_gpio;
 	struct regmap_irq_chip *irq_chip;
 	struct device *dev = &pdev->dev;
-	int irq, ret;
+	int irq;
 
 	if (!device_property_read_bool(dev, "interrupt-controller"))
 		return 0;
@@ -60,10 +74,12 @@ static int sl28cpld_gpio_irq_init(struct platform_device *pdev,
 	if (irq < 0)
 		return irq;
 
-	irq_chip = devm_kzalloc_obj(dev, *irq_chip);
-	if (!irq_chip)
+	sl28cpld_gpio = devm_kzalloc_obj(dev, *sl28cpld_gpio);
+	if (!sl28cpld_gpio)
 		return -ENOMEM;
 
+	irq_chip = &sl28cpld_gpio->irq_chip;
+
 	irq_chip->name = "sl28cpld-gpio-irq";
 	irq_chip->irqs = sl28cpld_gpio_irqs;
 	irq_chip->num_irqs = ARRAY_SIZE(sl28cpld_gpio_irqs);
@@ -72,14 +88,10 @@ static int sl28cpld_gpio_irq_init(struct platform_device *pdev,
 	irq_chip->unmask_base = base + GPIO_REG_IE;
 	irq_chip->ack_base = base + GPIO_REG_IP;
 
-	ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
-					      config->regmap, irq,
-					      IRQF_SHARED | IRQF_ONESHOT,
-					      0, irq_chip, &irq_data);
-	if (ret)
-		return ret;
+	sl28cpld_gpio->irq = irq;
 
-	config->irq_domain = regmap_irq_get_domain(irq_data);
+	config->drvdata = sl28cpld_gpio;
+	config->create_irq_domain = sl28cpld_gpio_create_irq_domain;
 
 	return 0;
 }
-- 
2.47.3


