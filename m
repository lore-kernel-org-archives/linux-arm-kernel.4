Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91656606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aewHMUXd;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=gbttNdYS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Rc12+Qxfj+pRyznOM+oj0p8w87O3IAgt5AtZYMqUvXY=; b=aewHMUXd5x036T
	1vPYjGcvWz+9F6wmi1f6KX5ITPt4K/Jn/5cXUOfs4P6ge+D5mTC2Wq0OOh8Alg5gvlYXbrf9Jia0Q
	rixGopI90IQgshjgoFF+S9rzlwmNKcCr8UlFHFOGnSziyFbSWSPXy+vXjemtGB0IjuMPK27GTKvcx
	atHOxzzuhjxaZ6CLm5BEjpvJAf9wttNoXX+g9cLbLDALGGD2N1WOYUom74XsF0oTpCpqTD4ZbaUhD
	UK1o1+truh8x+STqU34GywwoEh2FWSrPRhG84NDZqTzWYfXhdwtTGyax9/PXU7jDcke+w7Hof6Xe6
	59RHfyZVoNFdyp4TDEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBLH-00000009f4k-0lq3;
	Wed, 25 Nov 2026 11:39:15 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBLF-00000009f40-27aV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=Rc12+Qxfj+pRyznOM+oj0p8w87O3IAgt5AtZYMqUvXY=; t=1795606753; x=1796816353; 
	b=gbttNdYSk3YfCBGObGxS1suO9AbIX9k/SY76tSU+idKvoUO5iwK8hvrpdMj91lPYNUh5CIy8fXB
	YrZxdxmCo0RxwEMzsZ2o1yOAVf1lGgCDbQWyJzukcCxeOoiJgtqp2Z3rSHAuarH5jNgfGK3IV+Xri
	GL2RtrJgzhMmUhWNxmDeInXnMpc/oCa+tdLTWkwxWsb+28r9vkWI/tZEUjjtDDDjJxWla9UTFuosU
	xCaHtRTGu2LP3Adg5QttyTi0QL4yEwg3ift9AMWwrAxQ0p6HkrYOYn7cmAVc9gI7qOGHo/kDWcU8p
	6lbPMD3Wy8wFJLDj/DqBf6mtv3HKWFBkFJfA==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Wed, 25 Nov 2026 12:37:20 +0100
Subject: [PATCH v2 1/2] gpio: tc358762: fix reset gpio handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-tc3-reset-v2-1-32eefcaf1460@kemnade.info>
References: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
In-Reply-To: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@nabladev.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=wU4wkOa8ZT1slECgh2Hx2RYzKMa5lDr0TLYh4KH4XO0=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBsiZ0Zp5Dsx1TRnVT3MvvFGzoAD5NqI4NJjAr
 uDB5IrkRFSJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawbImQAKCRCEYUX6QCjc
 8dmBD/wPG6HRPZAQmBRZiipwKPZmfCRiEfDq7OCv1qu3yD7Hjf8YmKcKMAhRv4J0eN7pssu6Pbn
 aNUN0slN/3ENo6RD3I7zfrFU7RzZGGuG7XCJGJ9r3SnybWG1MFsWrAuGix1bRTg01Xagi9+g6/Q
 +z1oP1KLYe10sIG8rlKaEqMUvuL1xZK9NMOgxHR3iiSDMIi/sW7iq813+T5s3ZbSwXkhVekDeI+
 jEgyc5GHY8TBe1jfvBcIfTW6qsCHHJMJVZAl1YtCGYTlEQ8red0nZaE6rzv/B7JGxBd0dJdSw51
 Sd9mVEgXrJzVmNqwhZKjPoRNoJC9K12D+4bUfowpn73ebtCoRaj8jcPLn6hNnFdbZmIG7iyK/mQ
 9VyGQZXgsDw649Nw5TIsI+NVI57j9NQ1mM4d25sZ6j099iEM0PtElpjze5zm3xcww8lqpiVxKPy
 4uuUPW/Rbcao3XrjoTDFyKnO4Ol4CPbFcD73vHGvAX2KSgFHn+ppfbwFLRSh+3E0XCHHdI+VbS8
 rDQ8mheYL8q8uDz450FlK3vnIEQxvGEaERWI/T4+S2hMzxA8Q7zUY30ej1cj2pX/4VZo23891Ji
 xepHODg/MXZy7EX6sk3Qsw/HDU4p3pJgMe8KGH60CKVHrKI5W2W5cJ7mo14a119vBR9mSvo1Nzq
 qjuOv+Tz3hq7uFw==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_033913_546285_FDCE8E28 
X-CRM114-Status: GOOD (  13.97  )
X-Spam-Score: -2.1 (--)
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

Reset gpio is asserted when the chip should be active, deasserted when
the chip is enabled. That is the wrong way. Apparently users are working
around this by using GPIO_ACTIVE_HIGH to compensate for that bug but that
is not correcly describing the hardware.
Since this chip is used in a RPi Touchscreen hat, apparently with
devicetree overlays floating around, add a gpio quirk.
Also prepare for using the reset-gpio driver.

Fixes: 3355f4ee561d ("drm/bridge: tc358762: Add reset GPIO support")
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/gpio/gpiolib-of.c         | 7 +++++++
 drivers/gpu/drm/bridge/tc358762.c | 6 +++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 8f8454d596046..6519be933db8d 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -241,6 +241,13 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		 */
 		{ "ti,tsc2005",		"reset-gpios",	false },
 #endif
+#if IS_ENABLED(CONFIG_DRM_TOSHIBA_TC358762)
+		/*
+		 * reset is active low, but RPi touchscreen overlays
+		 * specify this as active high
+		 */
+		{"toshiba,tc358762",	"reset-gpios",	false },
+#endif
 #if IS_ENABLED(CONFIG_SND_SOC_WSA881X)
 		/*
 		 * WSA881 powerdown is always active low, but some device trees
diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 76564d5e4f69f..63b02693c0b9b 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -164,7 +164,7 @@ static void tc358762_post_disable(struct drm_bridge *bridge,
 	ctx->pre_enabled = false;
 
 	if (ctx->reset_gpio)
-		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
 	ret = regulator_disable(ctx->regulator);
 	if (ret < 0)
@@ -182,7 +182,7 @@ static void tc358762_pre_enable(struct drm_bridge *bridge,
 		dev_err(ctx->dev, "error enabling regulators (%d)\n", ret);
 
 	if (ctx->reset_gpio) {
-		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 		usleep_range(5000, 10000);
 	}
 
@@ -242,7 +242,7 @@ static int tc358762_parse_dt(struct tc358762 *ctx)
 	ctx->panel_bridge = panel_bridge;
 
 	/* Reset GPIO is optional */
-	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ctx->reset_gpio))
 		return PTR_ERR(ctx->reset_gpio);
 

-- 
2.47.3


