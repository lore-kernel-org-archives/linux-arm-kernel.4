Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6F9606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=shZ1ljBd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+quoZGj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z3RMPIOTCKavPC+NG+Y6yivskdZ9UZyuuvcCiUIS/fY=; b=shZ1ljBdCTkxCT
	BGOVi1qiVJOG9GUVr37l+Ie9Hd+t4fjURtuTALJD3iHUY9TpiEsKRRzAi2/Y655EGU9wV8oHaKKgZ
	Fb4y7W4L4HWV5mP4yMsLZqurdUr1om29pa5ouK4MjT41xMOhI6KncnckMLgSITpuWI4vL0CzC4xhI
	GTErNfA2MPTmYFWzZpTLW8XwKhEmdpbXJWRohuYnuekvU4UBjOVQLpNzehGQvBz8sweZLZ/ynpDB+
	Fft7YW+JHX9iJ/3A94lJY3bYNxmQRybLq/+v1UJ/eUTQ6xwA0+xGfNjLIQTJc33Q9SD9x+ETwfRSi
	ub0+TDF3X7Oa0GjPOJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxJj-0000000GdT6-0qpq;
	Fri, 27 Nov 2026 14:52:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxJc-0000000GdRd-12V5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:52:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0786E41521;
	Fri, 27 Nov 2026 14:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A30B1F0093A;
	Fri, 27 Nov 2026 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791163;
	bh=Z3RMPIOTCKavPC+NG+Y6yivskdZ9UZyuuvcCiUIS/fY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E+quoZGjlUyU+0Jzp/qpok9YFfkzhLA8TvyGhDvAl1JvjRw6zw1ZMVvu97Ltq0yic
	 vlps6kg3cqHJ1gRr7ucyFeiXBwDNpxwY12H/U3e8Y9jOTRwUuC7blc84OUTBa6TOkF
	 Sf6iaATIu2Mo23mEZAs5l2XiIie3HuKhSeda7D2PTJplaBSJXHvwXZF8xHPgofa5s/
	 DQbGhSIGJn8MEePUyGQpdJs9zxwf5eJH4TYljsW+YOfIVagNauv2Lh97zEYB9p6CYU
	 53IKc2yNbt1330hNVbzrYsRGe7CpYuIfPwa5GEyUklYV0tScWYVFDVelFzuvQG1bvo
	 egOCAhSzu56SQ==
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
	linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [RFT PATCH v2 01/14] gpio: regmap: use the correct number for .ngpio_per_reg
Date: Fri, 27 Nov 2026 15:52:18 +0100
Message-ID: <20261127145232.814492-2-mwalle@kernel.org>
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

Setting .ngpio_per_reg to 0 means that gpio-regmap assumes there is only
one register. If the number of GPIOs comes from gpiochip_get_ngpios()
config->ngpio is still 0 and it's taking over the wrong number.

Fix it by using chip->ngpio, which uses either config->ngpio or
gpiochip_get_ngpios().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-85577bd9-c441-47ec-b415-cd40acf50e01
Fixes: db305161880a ("gpio: regmap: Allow ngpio to be read from the property")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index ac6ad56f4479..65e87177baf0 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -523,7 +523,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	/* if not set, assume there is only one register */
 	gpio->ngpio_per_reg = config->ngpio_per_reg;
 	if (!gpio->ngpio_per_reg)
-		gpio->ngpio_per_reg = config->ngpio;
+		gpio->ngpio_per_reg = chip->ngpio;
 
 	/* if not set, assume they are consecutive */
 	gpio->reg_stride = config->reg_stride;
-- 
2.47.3


