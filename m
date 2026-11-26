Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FE8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yBmI8Ul0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d1rcHgpV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GaLTj93pvkB8arZtY8AllAvOkP3MCAuGLwNjxmh+tMM=; b=yBmI8Ul06x6HT2
	8Qe92rWOpPTWE0AYAajlOEUC11YMQ/8AWdYQg4bZkAKNU9pRa3zwbdj1YoVazhJmq7aBZbkhS8BaW
	rGKr6FjUUlfzbP4UG68gw/Ms2JBCmmRZ6CZOLwqDTPYqjpStu/EsWRreJ0WZYW8rZS+0DhU7JrOTM
	h7h9bbk1K93Aiq8qwtb8ZRSI//549AlX55QAOHjQfR+8Lp/RdVjvJ87JpgU+KpbBa/vX2WQ2le8VU
	ZDL02byGzMVk7oNmHYYmWOUUcVFwoztIOkowJmdxBozvv9A3LfYXnlO0PkjiRTX6Z4E6ai7C12Azg
	p8LziiN2pk4EHqzJXY5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbYL-0000000Dl92-1AdW;
	Thu, 26 Nov 2026 15:38:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbXV-0000000Dkmf-20c5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:37:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1CFD450B5;
	Thu, 26 Nov 2026 15:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAB91F000C4;
	Thu, 26 Nov 2026 15:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707456;
	bh=GaLTj93pvkB8arZtY8AllAvOkP3MCAuGLwNjxmh+tMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d1rcHgpVw9bq9qSkvqt6BFaqVmpzKwEl0tTD3n06weQdwkX4bedTI/vbMqMywWH6j
	 m1mtWbkcTTK6TAxBrnBhmQrc2sGQUySEUueO90OBwEJZWe57u3ZoWMs6g8eQiJM5hr
	 f7cxZ1zFwt2A2M4fvMuDLESwmDN1f8hj4BeVq/B6xLM8UsbJUwr4gOqhdItDGVlib/
	 appq97K8q57JPrGkeOvit7T2J98xgaurDr8JfGtfk/m8KkCnU44A3qfLqaNlg2oCeG
	 xAyT/sJ5Eyjed3bubEtP5B5Pnrg55GlwUzQh3LAAeddmkGPTnOSOqqzVaEd8maQ5sv
	 odkLW68tvrAWQ==
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
Subject: [RFT PATCH 08/13] gpio: idio-16: create the regmap-irq chip from the gpio-regmap callback
Date: Thu, 26 Nov 2026 16:35:19 +0100
Message-ID: <20261126153600.299724-9-mwalle@kernel.org>
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
 drivers/gpio/gpio-idio-16.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-idio-16.c b/drivers/gpio/gpio-idio-16.c
index b9aa8bb9347a..b8ea1c0aa2a5 100644
--- a/drivers/gpio/gpio-idio-16.c
+++ b/drivers/gpio/gpio-idio-16.c
@@ -34,12 +34,14 @@
 struct idio_16_data {
 	struct regmap *map;
 	unsigned int irq_mask;
+	struct regmap_irq_chip *chip;
+	unsigned int irq;
 };
 
 static int idio_16_handle_mask_sync(const int index, const unsigned int mask_buf_def,
 				    const unsigned int mask_buf, void *const irq_drv_data)
 {
-	struct idio_16_data *const data = irq_drv_data;
+	struct idio_16_data *const data = gpio_regmap_get_drvdata(irq_drv_data);
 	const unsigned int prev_mask = data->irq_mask;
 	int err;
 	unsigned int val;
@@ -66,6 +68,19 @@ static int idio_16_handle_mask_sync(const int index, const unsigned int mask_buf
 	return 0;
 }
 
+static struct irq_domain *idio_16_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct idio_16_data *data = gpio_regmap_get_drvdata(gpio);
+	struct irq_domain *domain;
+
+	domain = gpio_regmap_add_irq_chip(gpio, data->irq, 0, data->chip);
+	if (IS_ERR(domain))
+		return dev_err_cast_probe(regmap_get_device(data->map), domain,
+					  "IRQ registration failed\n");
+
+	return domain;
+}
+
 static int idio_16_reg_mask_xlate(struct gpio_regmap *const gpio, enum gpio_regmap_operation op,
 				  const unsigned int base, const unsigned int offset,
 				  unsigned int *const reg, unsigned int *const mask)
@@ -107,7 +122,6 @@ int devm_idio_16_regmap_register(struct device *const dev,
 	int err;
 	struct idio_16_data *data;
 	struct regmap_irq_chip *chip;
-	struct regmap_irq_chip_data *chip_data;
 	DECLARE_BITMAP(fixed_direction_output, IDIO_16_NGPIO);
 
 	if (!config->parent)
@@ -137,17 +151,14 @@ int devm_idio_16_regmap_register(struct device *const dev,
 	chip->irqs = config->regmap_irqs;
 	chip->num_irqs = config->num_regmap_irqs;
 	chip->handle_mask_sync = idio_16_handle_mask_sync;
-	chip->irq_drv_data = data;
+	data->chip = chip;
+	data->irq = config->irq;
 
 	/* Disable IRQ to prevent spurious interrupts before we're ready */
 	err = regmap_write(data->map, IDIO_16_DISABLE_IRQ, 0x00);
 	if (err)
 		return err;
 
-	err = devm_regmap_add_irq_chip(dev, data->map, config->irq, 0, 0, chip, &chip_data);
-	if (err)
-		return dev_err_probe(dev, err, "IRQ registration failed\n");
-
 	if (config->filters) {
 		/* Deactivate input filters */
 		err = regmap_write(data->map, IDIO_16_DEACTIVATE_INPUT_FILTERS, 0x00);
@@ -163,7 +174,8 @@ int devm_idio_16_regmap_register(struct device *const dev,
 	gpio_config.reg_set_base = GPIO_REGMAP_ADDR(IDIO_16_DAT_BASE);
 	gpio_config.ngpio_per_reg = IDIO_16_NGPIO_PER_REG;
 	gpio_config.reg_stride = IDIO_16_REG_STRIDE;
-	gpio_config.irq_domain = regmap_irq_get_domain(chip_data);
+	gpio_config.drvdata = data;
+	gpio_config.create_irq_domain = idio_16_create_irq_domain;
 	gpio_config.reg_mask_xlate = idio_16_reg_mask_xlate;
 
 	bitmap_from_u64(fixed_direction_output, GENMASK_U64(15, 0));
-- 
2.47.3


