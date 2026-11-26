Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1FD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ym1AQoKq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjjQ7Ape
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6aWFArraryo4kDUbjuVi9QjJ1vszKtwqrwVm4DY0rO4=; b=Ym1AQoKqq9WZXq
	zYvcGeRqhZzbBa1CFsMgLSJa2JLZI65MuR6sje8wBgFBytQKkzSIi7S35RNBIKiyS3DW/ZDXrDiW/
	3PS+fy7LP5c4ZinMlCuNRSVFS1NYwcT56wPFIscLisE+W+w0w/z5G0jatUSi487nf8VCl8BCBeb5S
	UHEO8fo7cYfw0RYJ4rUjmETdbIpv1F14TXXd0RtO2MWWxi/HWCePF6SFwNwrTIqMZPnVDPbq7J2qE
	eit9E8XOm2Lj9hI0ThW8u8FOydnOLQQ01H2UVhff3RHq2lK0cLGaSZb5beMBybE1evji2HxyUcZiP
	TzuGKC2FUdHgeV2hX1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbXT-0000000DkmJ-2ZZX;
	Thu, 26 Nov 2026 15:37:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbXK-0000000DkiD-1zYw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:37:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E600E609EF;
	Thu, 26 Nov 2026 15:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108851F000D8;
	Thu, 26 Nov 2026 15:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707445;
	bh=6aWFArraryo4kDUbjuVi9QjJ1vszKtwqrwVm4DY0rO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SjjQ7ApeZlV1zYF/opz2ne8dfgDWRfBzOQabr+k48rZUsLf+ggDy3uugGyc/Rsz2o
	 RyhGK5wVeZeZNRfuhJe9NsXYLAhG3tUI7cgMYuUatjEK95Hgeyq3BYU3ytpbdzsUaL
	 YW20fz41Z5KUxAnRj3/ANdeIKZC5CL46qWM7U0niu3gTzEYgBAIytgVUQSdkLeVE7P
	 A55ZtrqNh9no93wTtq1UZauHgRxH4+IRHYnx41rYDlqqZ+BmU7DCPNShBWoHRj1lmB
	 kQ3MxsU7B5RSO+9wGs3cqIWWs0HxU91SIozIITAIZIwC/WR8VYQiAj9+EkvOkjMBAm
	 F+1f9UquBtW8Q==
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
Subject: [RFT PATCH 05/13] gpio: regmap: add a helper to add a regmap-irq chip
Date: Thu, 26 Nov 2026 16:35:16 +0100
Message-ID: <20261126153600.299724-6-mwalle@kernel.org>
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

The most common use-case is to use regmap-irq together with gpio-regmap.
To make life easier for that and to avoid code duplication, add a helper
to create and attach a regmap-irq domain. That helper is intended to be
called by the new .create_irq_domain() callback.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-regmap.c  | 43 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/regmap.h | 15 +++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index e8c13434ea5b..99a86efe8deb 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -407,6 +407,49 @@ static void __maybe_unused gpio_regmap_irq_relres(void *irq_drv_data, irq_hw_num
 	gpio_regmap_relres_irq(irq_drv_data, hwirq);
 }
 
+#ifdef CONFIG_REGMAP_IRQ
+/**
+ * gpio_regmap_add_irq_chip() - Add a regmap-irq chip for the GPIO lines
+ * @gpio: gpio_regmap device
+ * @irq: the parent interrupt
+ * @irq_flags: the IRQF_ flags to use for @irq
+ * @chip: the regmap-irq chip description
+ *
+ * Add a regmap-irq chip on the regmap of @gpio. Should be called from
+ * create_irq_domain() callback.
+ *
+ * The regmap-irq chip is automatically removed when the gpio_regmap is
+ * unregistered.
+ *
+ * Return: irq_domain or an ERR_PTR() error value.
+ */
+struct irq_domain *gpio_regmap_add_irq_chip(struct gpio_regmap *gpio, int irq,
+					    int irq_flags,
+					    struct regmap_irq_chip *chip)
+{
+	int ret;
+
+	/* shouldn't be called more than once */
+	if (WARN_ON(gpio->irq_chip_data))
+		return ERR_PTR(-EBUSY);
+
+	chip->irq_reqres = gpio_regmap_irq_reqres;
+	chip->irq_relres = gpio_regmap_irq_relres;
+	chip->irq_drv_data = gpio;
+
+	ret = regmap_add_irq_chip_fwnode(dev_fwnode(gpio->parent), gpio->regmap,
+					 irq, irq_flags, 0, chip,
+					 &gpio->irq_chip_data);
+	if (ret)
+		return ERR_PTR(ret);
+
+	gpio->regmap_irq_line = irq;
+
+	return regmap_irq_get_domain(gpio->irq_chip_data);
+}
+EXPORT_SYMBOL_GPL(gpio_regmap_add_irq_chip);
+#endif
+
 void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
 {
 	return gpio->driver_data;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index eba0620c63d6..7f578b9a82e6 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -3,6 +3,7 @@
 #ifndef _LINUX_GPIO_REGMAP_H
 #define _LINUX_GPIO_REGMAP_H
 
+#include <linux/err.h>
 #include <linux/types.h>
 
 struct device;
@@ -11,6 +12,7 @@ struct gpio_regmap;
 struct gpio_chip;
 struct irq_domain;
 struct regmap;
+struct regmap_irq_chip;
 
 #define GPIO_REGMAP_ADDR_ZERO ((unsigned int)(-1))
 #define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
@@ -180,4 +182,17 @@ void gpio_regmap_relres_irq(struct gpio_regmap *gpio, unsigned int offset);
 void gpio_regmap_enable_irq(struct gpio_regmap *gpio, irq_hw_number_t hwirq);
 void gpio_regmap_disable_irq(struct gpio_regmap *gpio, irq_hw_number_t hwirq);
 
+#ifdef CONFIG_REGMAP_IRQ
+struct irq_domain *gpio_regmap_add_irq_chip(struct gpio_regmap *gpio, int irq,
+					    int irq_flags,
+					    struct regmap_irq_chip *chip);
+#else
+static inline struct irq_domain *
+gpio_regmap_add_irq_chip(struct gpio_regmap *gpio, int irq, int irq_flags,
+			 struct regmap_irq_chip *chip)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+#endif
+
 #endif /* _LINUX_GPIO_REGMAP_H */
-- 
2.47.3


