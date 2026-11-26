Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D333F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uu6t3066;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khvoxlcM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f2oCDnClPI+VAzaxTKPMZjopiLHRIZp2Ku3oIqx9Ey8=; b=uu6t3066dSX60m
	jAalzlUO/rjhmNOsBFEEICIKpVeN25N1Mfy45TfrOeHSyPkhfoEFyV7lSJI2RZd2FsVrtYr2odmQS
	1vCpSX+BhclfcmbfZCEyixsd8oSGaT6JZ1yj7sEboA7ZCmmY6lW+LpuvD9xQnExv4yZSJIwTI+CxC
	FspbiOFfW7Gw6KZhr5p3Sws9QC+RN0X4Z8WPmVQj8Ctc0C8lo9SEtctkATW82+n7kPkdPO/K4CNIZ
	gzPSMog+11u9Al0H2e7SS/gWvyxXMK58S0BvLIpXrNLxww7EwpgMClzZkcx9yQtnlQZP2RQ5jjBnw
	RjctKNv5kUENBlWEFe0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbXa-0000000DkpC-1fRF;
	Thu, 26 Nov 2026 15:37:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbXR-0000000DklD-1o7I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:37:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DBFF36121C;
	Thu, 26 Nov 2026 15:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5461F000C0;
	Thu, 26 Nov 2026 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707452;
	bh=f2oCDnClPI+VAzaxTKPMZjopiLHRIZp2Ku3oIqx9Ey8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=khvoxlcM/vjs99XvVMnci0T8JgWfHATy5Zp4Mx3KQ2qCP1LIp10AT6P8kyw39R6dh
	 kOQ2UfQa9lmFXijU7fLwPDw8uoJ40NHNOHvcZb+Qi8sS0ZI8MBBz/seQzherlWdOWB
	 jr99ZRNan1AFeEZ5KvIndNFz/KCh7UJ3HU7cQ4huptax09oTPlZhortJ+5Pz/F/aTX
	 Q0d69+ijsBK3DAASAsup7jdcZW1khFgXa5XAfQRn8718RiaUvHXdL3sKGKMNWz8JU3
	 amP/KoK0id0VvXkpHK7v5D3ij7ZS79UGWss0L/6L4ip3TEDAP9N4NUp49bihyT5I70
	 petcbcLOvJFwA==
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
Subject: [RFT PATCH 07/13] gpio: sl28cpld: create the regmap-irq chip from the gpio-regmap callback
Date: Thu, 26 Nov 2026 16:35:18 +0100
Message-ID: <20261126153600.299724-8-mwalle@kernel.org>
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


