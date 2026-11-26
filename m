Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECE0606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YFyp6Yno;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i4+ZSzic
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oeKlwJIRyKhwYBLWO4hNkFuUvVyK9PxO+nhoY8VAMJc=; b=YFyp6YnoKwkQml
	jYn+GyZUeXTAbRIO7tZ3LWIH6hwtkqyKtzGfhbGYHsHS/XFZEYBSKTkztkOMq4+D6i4KzOCh1X1Nm
	BH9zTFK9dgEPf7as1hh5h84NJ/CURDLoHUGOG1z6b98PPRtmETXf847t6cHCD4URSwuVTtD0RH5Xg
	46SqBgmGa1/+RY5KDgZmw0fynHO8llLpB7zP4iXgSLDY+aGAjT8E4XUCN0PDMUr2cWTWRzcirXo0a
	my0uXka7W5CIo0i0oQDxiD8M1tTnDpYmM0AkcH/gorhopDlPG5xAuRwTdjmI1LX0Bw7BKwBgMiJCI
	q7zxFu/Bs3FAsFJo467A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbXC-0000000Dkeb-0JWc;
	Thu, 26 Nov 2026 15:37:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbX5-0000000Dkd1-2HIX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:37:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D67F625C3;
	Thu, 26 Nov 2026 15:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FA01F000C0;
	Thu, 26 Nov 2026 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707429;
	bh=oeKlwJIRyKhwYBLWO4hNkFuUvVyK9PxO+nhoY8VAMJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i4+ZSzic9metO9ODpII8FslgNXztbYhBr+Y8tAskYrCIyeMrr858KPcBkbVeF7a/1
	 Lsev9hxwETKk0mr6iEMjadtG979GKJ6mPWfiYs3TVEJk8NShyLHTlMHfA19pk3zkg4
	 Jh1JnAn6ni+/yQZBYG6hT+FFuXqPDlZBKp+nM70BqYM5EgRHp7oIQAOw8bJF/ob65G
	 VY1++4M/WykfdifiIEq2GoYSa1/U32OcZ5xkeuKJ9s0VElAmAoKf4WUfa6Ds7QLkWJ
	 jQxl4efCcJKw+kkPx1+BQh7tuvE/d+nB8mOqxP4He72OlVDjqt1ZsEXV/+l290ZZnB
	 SKGcXjA7kbsAA==
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
Subject: [RFT PATCH 01/13] gpio: regmap: remove gpiochip before tearing down irqchip
Date: Thu, 26 Nov 2026 16:35:12 +0100
Message-ID: <20261126153600.299724-2-mwalle@kernel.org>
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

From: Long Zhao <longzhao@ambarella.com>

gpiochip_remove() calls acpi_gpiochip_free_interrupts() and
gpiod_free_irqs(). Both still need the irq domain.
regmap_del_irq_chip() removes that domain, so remove the
gpiochip first.

Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
Signed-off-by: Long Zhao <longzhao@ambarella.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-regmap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index ac6ad56f4479..10cf946dbfc4 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -593,12 +593,19 @@ EXPORT_SYMBOL_GPL(gpio_regmap_register);
  */
 void gpio_regmap_unregister(struct gpio_regmap *gpio)
 {
+	/*
+	 * gpiochip_remove() runs acpi_gpiochip_free_interrupts() and
+	 * gpiod_free_irqs(). Both still need the irq domain.
+	 * regmap_del_irq_chip() removes that domain, so remove the
+	 * gpiochip first.
+	 */
+	gpiochip_remove(&gpio->gpio_chip);
+
 #ifdef CONFIG_REGMAP_IRQ
 	if (gpio->irq_chip_data)
 		regmap_del_irq_chip(gpio->regmap_irq_line, gpio->irq_chip_data);
 #endif
 
-	gpiochip_remove(&gpio->gpio_chip);
 	bitmap_free(gpio->fixed_direction_output);
 	bitmap_free(gpio->fixed_direction_mask);
 	kfree(gpio);
-- 
2.47.3


