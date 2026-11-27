Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12AD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SnhFGXx1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yt1fJxXz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3y4OlDbeqvWxg7N6a3LQ41j1rKPM+y4nwJqVxl2OCp8=; b=SnhFGXx1Z2A/8z
	O6srYnI0ww6dcpdBGZHq2cgpDH+7c6+Yw4rOPKn7nWWmnHLr7RaNWVos70FpnuenmCSghiL9LfF5Q
	TKfHliKKUCt7vujpFkqJVuOXvPIs4ABvy0LXV5OAZI7Acm8XhdgJ3Yx7z+ZgJHp17GMiYuFPmTI6D
	7pIPIceRfZ9qwCvWTNeJLjF/mYvH1DV1f+e2OKIy6StUVhaON/sacV9Or4jnfE4eQa2Q9Pjq5mT2D
	5Eda/TWE+2odBANPclYLSYjTlu+oiWGrEmrG4yBNXmQIX11+a/kZGuGUHKmYSfq8lnQmSfR9nRdLg
	yz3w+2k86E3QQnJNUzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxKr-0000000Ge7L-0YTv;
	Fri, 27 Nov 2026 14:54:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxKI-0000000Gdps-1xdu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:53:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ABC243951;
	Fri, 27 Nov 2026 14:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47131F0089F;
	Fri, 27 Nov 2026 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791205;
	bh=3y4OlDbeqvWxg7N6a3LQ41j1rKPM+y4nwJqVxl2OCp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yt1fJxXzj0f5kipMqq1XUD9Kw/nNYfA08XMGciV2e3Tmff3HdESzkNQ4KVXkBpNjz
	 LmDhuDT5H4CEVdACJsz5CMkZe7BJDMsGZJB50aO+yNGfu+Ge8fbdmn0y0TrIA4qKxm
	 h4kUgdmjG8AxWYcQP+0/B8KLmxlXEfaXK841/2nm21xA3Bh6/zpiVJccw+7TY9JS9H
	 NQJoNSwIGfjiztA97A7vVa9X/IP2F/Bvtuw8c4ghUfcLwXtPwJpRPF1BbpzzhmzCkb
	 9BzCUF7xJC0nHaxQ82tW6uQ0IRJR7Ff6GEaArYNJu0FBwTanGhk4ZOmXKV8z5iCzIV
	 qWaWYfJ0Q71vA==
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
Subject: [RFT PATCH v2 12/14] gpio: 104-idi-48: create the regmap-irq chip from the gpio-regmap callback
Date: Fri, 27 Nov 2026 15:52:29 +0100
Message-ID: <20261127145232.814492-13-mwalle@kernel.org>
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
 drivers/gpio/gpio-104-idi-48.c | 38 +++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index 93d7ccaded83..434704c06d7e 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -123,15 +123,33 @@ static const char *idi48_names[IDI48_NGPIO] = {
 	"Bit 18 B", "Bit 19 B", "Bit 20 B", "Bit 21 B", "Bit 22 B", "Bit 23 B"
 };
 
+struct idi_48_gpio {
+	struct regmap_irq_chip chip;
+	struct device *dev;
+	unsigned int irq;
+};
+
+static struct irq_domain *idi_48_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct idi_48_gpio *const idi48gpio = gpio_regmap_get_drvdata(gpio);
+	struct irq_domain *domain;
+
+	domain = gpio_regmap_add_irq_chip(gpio, idi48gpio->irq, IRQF_SHARED, &idi48gpio->chip);
+	if (IS_ERR(domain))
+		return dev_err_cast_probe(idi48gpio->dev, domain,
+					  "IRQ registration failed\n");
+
+	return domain;
+}
+
 static int idi_48_probe(struct device *dev, unsigned int id)
 {
 	const char *const name = dev_name(dev);
 	struct gpio_regmap_config config = {};
+	struct idi_48_gpio *idi48gpio;
 	void __iomem *regs;
 	struct regmap *map;
 	struct regmap_irq_chip *chip;
-	struct regmap_irq_chip_data *chip_data;
-	int err;
 
 	if (!devm_request_region(dev, base[id], IDI_48_EXTENT, name)) {
 		dev_err(dev, "Unable to lock port addresses (0x%X-0x%X)\n",
@@ -148,10 +166,14 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 		return dev_err_probe(dev, PTR_ERR(map),
 				     "Unable to initialize register map\n");
 
-	chip = devm_kzalloc_obj(dev, *chip);
-	if (!chip)
+	idi48gpio = devm_kzalloc_obj(dev, *idi48gpio);
+	if (!idi48gpio)
 		return -ENOMEM;
 
+	idi48gpio->dev = dev;
+	idi48gpio->irq = irq[id];
+	chip = &idi48gpio->chip;
+
 	chip->name = name;
 	chip->status_base = IDI48_IRQ_STATUS;
 	chip->unmask_base = IDI48_IRQ_ENABLE;
@@ -160,11 +182,6 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 	chip->irqs = idi48_regmap_irqs;
 	chip->num_irqs = ARRAY_SIZE(idi48_regmap_irqs);
 
-	err = devm_regmap_add_irq_chip(dev, map, irq[id], IRQF_SHARED, 0, chip,
-				       &chip_data);
-	if (err)
-		return dev_err_probe(dev, err, "IRQ registration failed\n");
-
 	config.parent = dev;
 	config.regmap = map;
 	config.ngpio = IDI48_NGPIO;
@@ -172,7 +189,8 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 	config.reg_dat_base = GPIO_REGMAP_ADDR(0x0);
 	config.ngpio_per_reg = 8;
 	config.reg_mask_xlate = idi_48_reg_mask_xlate;
-	config.irq_domain = regmap_irq_get_domain(chip_data);
+	config.drvdata = idi48gpio;
+	config.create_irq_domain = idi_48_create_irq_domain;
 
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &config));
 }
-- 
2.47.3


