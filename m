Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93576606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AVaWdgbT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hin6SMcx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=erP+LMBLUcN9gH9fte8an0RIfEUgmPlH/y/OR6138y0=; b=AVaWdgbTNoslZn
	iqnLUjA3gCf6HtZ2Ersfcqw72O/TYih8VdpawT6z4XBRYKLRSxAb0/nOOlDa4L8YzjoS+y2T5pCxd
	zp7sokAJKIZmjuiiGwjQjBwmkOnMErV1AINH1UqZ0eNXr4UoVdGzhG3Az4rpEDObOBw/rDWUT7pC0
	j6/RY2MJZnUTyg+QFUi7O3zdenCTEc2nVwhDhP2cCnrp7XTp4NGXAkvU7ky5nry0SKf4YbxuyWB/r
	pzjiQ87MPtJ3iHSH4lYTFbmnSde9cj9Z5aC4VN53RcmVXCzeC8IYTq3CcHbJEDdx+vN8neUmI88Fe
	B/dx1mbtV68hy/Bl1WgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxKq-0000000Ge6a-2IjG;
	Fri, 27 Nov 2026 14:54:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxK7-0000000Gdgc-0T8y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:53:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D73E60D7C;
	Fri, 27 Nov 2026 14:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1B31F00935;
	Fri, 27 Nov 2026 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791193;
	bh=erP+LMBLUcN9gH9fte8an0RIfEUgmPlH/y/OR6138y0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hin6SMcxf3mYEz9Gj8lnck+ecRGjr9lIDgdq5KsGrwNa6faCG4Q9Xv4llBZEtJL3e
	 JAigyxc6Q8KAWCdIuguCMagLRiTyQKTY4U7hrI2AM94nTzt+ZfyOO2OqWxlWtdzyXg
	 65UQhkCOI4Ghf/DRh9gOsgGfOhii/1IL7oulx8pnBlH/2tkoz1kuiV5mV22Fh55fz2
	 /TzdcIgwjTw5zxVqLenlGbfXpaxmP/IHzPCd2mqwAt/LfIjz3aU32E1X8AEAvxkJEw
	 oHe+CRiH8/lESkatVjTUQTu4xJceHKaBw81bpGtbtaXZbHf5Fi0/eXrptX0NrcUubd
	 Iag2338Qo/kiA==
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
Subject: [RFT PATCH v2 09/14] gpio: idio-16: create the regmap-irq chip from the gpio-regmap callback
Date: Fri, 27 Nov 2026 15:52:26 +0100
Message-ID: <20261127145232.814492-10-mwalle@kernel.org>
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
 drivers/gpio/gpio-idio-16.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-idio-16.c b/drivers/gpio/gpio-idio-16.c
index b9aa8bb9347a..16744ecb5fad 100644
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
+	domain = gpio_regmap_add_irq_chip_nolock(gpio, data->irq, 0, data->chip);
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


