Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819CC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1hjmwt4p;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwnmAWhM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lTtaukxftZVKFDau/7qTiVwTrbXKJ+iWU8/3orek9JQ=; b=1hjmwt4pKY2mGMxG7gCkbmBrpA
	daRxFCXFQdRfmZglQTuS6+5ShA7CZEcJWHiCTslWb5aK6eotyWLvujSWeZJUta6GhPM13zeDVn3PB
	X7XdM+YUyKfeS49WRKpp9qYn2xn6j2UBVYl/ocY61HXYOw0Wf6fA7jed2lj0qtDTwue6jnL9L8UZb
	otQ/J+i3w94wkFXCTgLl+j2ur1fHFSxjS5dAq+BxkM3ypFyTxFWcAMisAMRVQ7Tj8cA8OcQ+C3JOx
	VF/nOzY9PDnhAEICC4XFswroYRDDVnqiqfGylGXD32cR3lfIasXURHrrUgs4ItgihPjp/YcIceUQJ
	vAB4Fhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Ug-00000006L0Z-0YYg;
	Wed, 11 Nov 2026 10:23:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Ud-00000006L04-0FXE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:23:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso28833955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392629; x=1794997429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTtaukxftZVKFDau/7qTiVwTrbXKJ+iWU8/3orek9JQ=;
        b=OwnmAWhMjFZNAdToOydDE02J/k9qLn6ns6K6mF+heb+4qHeiIiHAdC440C4JNx09rT
         sGMQ3japXNpDruLYPxN9cepsoM3GA72CuB2zPKNpD0mIljbSzG02/TECVbppFEQgkFQ/
         GdAys3+Btk88+yEsX6r0sBXi0LfNmX93qe3cspFm/XEBaVZ5Z4wP6t/7Fh9CKZKWlaAh
         N93E6LtvEtex/Qs6EmFIFd+GIzB358KXfiWroTzWb47mUBYYG52jqVfCC/tFbJJVA3DM
         nIN1s9oNu/3FisMn2cj0k+OP5A+Ghyn7Mg9guA08uWozZ8RKQvmrMDXOsmW39D5MGMyP
         R4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392629; x=1794997429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTtaukxftZVKFDau/7qTiVwTrbXKJ+iWU8/3orek9JQ=;
        b=IqggyIIO/5Ukb8V0TxRwwNTqFE9yyBGn/GYI3++xJRAWFu8jNWNJV/BHgOHSrLJN0B
         1GefrXsjPF5C/IGNPCOxM1UmzknKHRSlaJwKt2BijhdHZ3RoEdoRqoi90kCQNNWJRFEF
         C9LDJsZ7zUwF1sovJUodp5DSduZL19cpsEmoFIZ+GObOGu/ECUH/XHVhGGiNXVOpO6pX
         uKv7oC1moJFRu9THDbdshFdf21a1c1YhA/+Bpg50yXTU8WQAm+WZFRTL+uQ3Xide4KJS
         mDGAQ/6H6+lBs2ztwlUaM++z0r1bC92Y7uNoq3y6jXmxhKTdgqp3mFmg3bxPOu3x+F9d
         9dGA==
X-Forwarded-Encrypted: i=1; AL+hErFsH0hPH6EbUD1PwFd8iqWVv7wbq3+O3rcZZ7ioSujDbczZs67sCOmor7D3pBuvbHRlzDNfWWzX26QuFmiHceBY@lists.infradead.org
X-Gm-Message-State: APuU4Z9QS9KjIdW7SYqmQwnTV7TCHr0Xe27vQMG70/uPF1jtUJgyyZL8
	sI9cu4bqrbT2HkDYfsSHgPnv+VxW9pC3RC17cv1edYSrYEu5JKGHaOCs
X-Gm-Gg: AYBFou1J3ZV9qT3qt9ZxFKOCgRVqcu+4UXT3NQUxZars8RA3whpmrtFPzQgazVS0u1w
	+KkKdSBHY+m35MS/b04VZlbtr+R8iXm3Jyn40Lo/l4k3PSp2LLp3KQ7tEP/JzE1kFpILgYucEHb
	y/MHP2Ty0OtUvvAcswkY4yi7ilkuRUGocmSiSsjeJmWWGkQxr9oSfnSTeS08SurxwZhhiv5q6fN
	JsXMFg5S3zb5OwKNisONHEo5JynnP/YRZi1h/sEjDyVuTqVMRoHiR38Y+M/AlKbAafEtOzaTD4+
	De10BBrjouRb9W2flSDSGOrgoB+LAezxqfcafY0ghjFWJ0g7/1yDaG1+iq647DHtWNUfq3WlqZE
	wqKQZWWqFMnk6goc2d2Cln00pY16Wu5y1t5gJYjsIR5HVJTvXgSuquLI6DQR2m54YvolZz0yUIv
	bdO7HnQI+UU/H2dlHTQ3/iu0zNvNVUTwWwPk47HwGy4VSOw2hVC+mToaGA0aKU0Av/R4QYGKHKS
	MChrLtdfCRMW71oQzijq8cqeW0ktO/nNhZdGHbVzzobT957Cqfx2xtgfn1i9KxhwAg4k1zQXRXK
	lkagQCFfyEw0udffZS+ZdL+P6PkRQRwQFdb8/hg4nROaE0cjxwDrWKxY9w==
X-Received: by 2002:a05:600c:190a:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ba0936c0d2mr36442075e9.6.1794392628711;
        Wed, 11 Nov 2026 02:23:48 -0800 (PST)
Received: from fedora ([154.182.80.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204e22csm121569065e9.12.2026.11.11.02.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:23:48 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v3] iio: adc: at91_adc: move to devm_* to fix NULL pointer deref
Date: Wed, 11 Nov 2026 12:13:45 +0200
Message-ID: <20261111101345.185122-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_022351_182775_288C1123 
X-CRM114-Status: GOOD (  26.95  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If 'atmel,adc-use-external-triggers' is not set in the device tree,
at91_adc_trigger_init() leaves the external trigger slots in st->trig
as NULL. The error paths and remove function unconditionally called
iio_trigger_unregister() and iio_trigger_free() on them, causing a
NULL pointer dereference.

Instead of just checking for NULL, refactor the driver to use the
device-managed (devm_*) API for registration and allocation. This
modernizes the code, eliminates the need for manual cleanup functions
(at91_adc_trigger_remove, at91_adc_buffer_remove, at91_ts_unregister,
and at91_adc_remove), and inherently fixes the NULL pointer dereference
since the core handles the cleanup of properly allocated triggers.

As part of this simplification, the remaining trigger initialization
logic has been inlined into at91_adc_probe().

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Fixes: 0e589d5fb317 ("ARM: AT91: IIO: Add AT91 ADC driver.")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
v3:
 - Addressed review comments from Andy Shevchenko:
   - Removed the redundant dev_err() after devm_input_allocate_device().
   - Declared a local 'struct device *dev = &pdev->dev' and used it in
     at91_adc_probe().
   - Declared the loop iterator inside the for-loop.

v2:
 - Dropped the simple NULL check approach.
 - Refactored the driver to use devm_* API as suggested by Jonathan Cameron.
 - Removed manual cleanup functions and error paths entirely.
 - Inlined remaining trigger initialization into probe().

 drivers/iio/adc/at91_adc.c | 185 +++++++++++--------------------------
 1 file changed, 52 insertions(+), 133 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 0ac74ad92fca..5293229f3dfa 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -608,85 +608,32 @@ static const struct iio_trigger_ops at91_adc_trigger_ops = {
 static struct iio_trigger *at91_adc_allocate_trigger(struct iio_dev *idev,
 						     const struct at91_adc_trigger *trigger)
 {
+	struct device *dev = idev->dev.parent;
 	struct iio_trigger *trig;
 	int ret;
 
-	trig = iio_trigger_alloc(idev->dev.parent, "%s-dev%d-%s", idev->name,
-				 iio_device_id(idev), trigger->name);
-	if (trig == NULL)
+	trig = devm_iio_trigger_alloc(dev, "%s-dev%d-%s", idev->name,
+				      iio_device_id(idev), trigger->name);
+	if (!trig)
 		return NULL;
 
 	iio_trigger_set_drvdata(trig, idev);
 	trig->ops = &at91_adc_trigger_ops;
 
-	ret = iio_trigger_register(trig);
-	if (ret) {
-		iio_trigger_free(trig);
+	ret = devm_iio_trigger_register(dev, trig);
+	if (ret)
 		return NULL;
-	}
 
 	return trig;
 }
 
-static int at91_adc_trigger_init(struct iio_dev *idev)
-{
-	struct at91_adc_state *st = iio_priv(idev);
-	int i, ret;
-
-	st->trig = devm_kcalloc(&idev->dev,
-				st->caps->trigger_number, sizeof(*st->trig),
-				GFP_KERNEL);
-
-	if (st->trig == NULL) {
-		ret = -ENOMEM;
-		goto error_ret;
-	}
-
-	for (i = 0; i < st->caps->trigger_number; i++) {
-		if (st->caps->triggers[i].is_external && !(st->use_external))
-			continue;
-
-		st->trig[i] = at91_adc_allocate_trigger(idev,
-							st->caps->triggers + i);
-		if (st->trig[i] == NULL) {
-			dev_err(&idev->dev,
-				"Could not allocate trigger %d\n", i);
-			ret = -ENOMEM;
-			goto error_trigger;
-		}
-	}
-
-	return 0;
-
-error_trigger:
-	for (i--; i >= 0; i--) {
-		iio_trigger_unregister(st->trig[i]);
-		iio_trigger_free(st->trig[i]);
-	}
-error_ret:
-	return ret;
-}
-
-static void at91_adc_trigger_remove(struct iio_dev *idev)
-{
-	struct at91_adc_state *st = iio_priv(idev);
-	int i;
-
-	for (i = 0; i < st->caps->trigger_number; i++) {
-		iio_trigger_unregister(st->trig[i]);
-		iio_trigger_free(st->trig[i]);
-	}
-}
-
 static int at91_adc_buffer_init(struct iio_dev *idev)
 {
-	return iio_triggered_buffer_setup(idev, &iio_pollfunc_store_time,
-		&at91_adc_trigger_handler, NULL);
-}
+	struct device *dev = idev->dev.parent;
 
-static void at91_adc_buffer_remove(struct iio_dev *idev)
-{
-	iio_triggered_buffer_cleanup(idev);
+	return devm_iio_triggered_buffer_setup(dev, idev,
+					       &iio_pollfunc_store_time,
+					       &at91_adc_trigger_handler, NULL);
 }
 
 static int at91_adc_read_raw(struct iio_dev *idev,
@@ -924,13 +871,10 @@ static int at91_ts_register(struct iio_dev *idev,
 {
 	struct at91_adc_state *st = iio_priv(idev);
 	struct input_dev *input;
-	int ret;
 
-	input = input_allocate_device();
-	if (!input) {
-		dev_err(&idev->dev, "Failed to allocate TS device!\n");
+	input = devm_input_allocate_device(&pdev->dev);
+	if (!input)
 		return -ENOMEM;
-	}
 
 	input->name = DRIVER_NAME;
 	input->id.bustype = BUS_HOST;
@@ -951,8 +895,7 @@ static int at91_ts_register(struct iio_dev *idev,
 		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE) {
 			dev_err(&pdev->dev,
 				"This touchscreen controller only support 4 wires\n");
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		input_set_abs_params(input, ABS_X, 0, (1 << MAX_RLPOS_BITS) - 1,
@@ -964,39 +907,27 @@ static int at91_ts_register(struct iio_dev *idev,
 	st->ts_input = input;
 	input_set_drvdata(input, st);
 
-	ret = input_register_device(input);
-	if (ret)
-		goto err;
-
-	return ret;
-
-err:
-	input_free_device(input);
-	return ret;
-}
-
-static void at91_ts_unregister(struct at91_adc_state *st)
-{
-	input_unregister_device(st->ts_input);
+	return input_register_device(input);
 }
 
 static int at91_adc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	unsigned int prsc, mstrclk, ticks, adc_clk, adc_clk_khz, shtim;
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node = dev->of_node;
 	int ret;
 	struct iio_dev *idev;
 	struct at91_adc_state *st;
 	u32 reg, prop;
 	const char *s;
 
-	idev = devm_iio_device_alloc(&pdev->dev, sizeof(struct at91_adc_state));
+	idev = devm_iio_device_alloc(dev, sizeof(struct at91_adc_state));
 	if (!idev)
 		return -ENOMEM;
 
 	st = iio_priv(idev);
 
-	st->caps = of_device_get_match_data(&pdev->dev);
+	st->caps = of_device_get_match_data(dev);
 
 	st->use_external = of_property_read_bool(node, "atmel,adc-use-external-triggers");
 
@@ -1041,7 +972,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, idev);
 
-	idev->name = dev_name(&pdev->dev);
+	idev->name = dev_name(dev);
 	idev->modes = INDIO_DIRECT_MODE;
 	idev->info = &at91_adc_info;
 
@@ -1060,25 +991,25 @@ static int at91_adc_probe(struct platform_device *pdev)
 	at91_adc_writel(st, AT91_ADC_IDR, 0xFFFFFFFF);
 
 	if (st->caps->has_tsmr)
-		ret = devm_request_irq(&pdev->dev, st->irq,
+		ret = devm_request_irq(dev, st->irq,
 				       at91_adc_9x5_interrupt, 0,
-				       pdev->dev.driver->name, idev);
+				       dev->driver->name, idev);
 	else
-		ret = devm_request_irq(&pdev->dev, st->irq,
+		ret = devm_request_irq(dev, st->irq,
 				       at91_adc_rl_interrupt, 0,
-				       pdev->dev.driver->name, idev);
+				       dev->driver->name, idev);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
+		return dev_err_probe(dev, ret,
 				     "Failed to allocate IRQ.\n");
 
-	st->clk = devm_clk_get_enabled(&pdev->dev, "adc_clk");
+	st->clk = devm_clk_get_enabled(dev, "adc_clk");
 	if (IS_ERR(st->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(st->clk),
+		return dev_err_probe(dev, PTR_ERR(st->clk),
 				     "Could not prepare or enable the clock.\n");
 
-	st->adc_clk = devm_clk_get_enabled(&pdev->dev, "adc_op_clk");
+	st->adc_clk = devm_clk_get_enabled(dev, "adc_op_clk");
 	if (IS_ERR(st->adc_clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(st->adc_clk),
+		return dev_err_probe(dev, PTR_ERR(st->adc_clk),
 				     "Could not prepare or enable the ADC clock.\n");
 
 	/*
@@ -1090,13 +1021,13 @@ static int at91_adc_probe(struct platform_device *pdev)
 	adc_clk = clk_get_rate(st->adc_clk);
 	adc_clk_khz = adc_clk / 1000;
 
-	dev_dbg(&pdev->dev, "Master clock is set as: %d Hz, adc_clk should set as: %d Hz\n",
+	dev_dbg(dev, "Master clock is set as: %d Hz, adc_clk should set as: %d Hz\n",
 		mstrclk, adc_clk);
 
 	prsc = (mstrclk / (2 * adc_clk)) - 1;
 
 	if (!st->startup_time)
-		return dev_err_probe(&pdev->dev, -EINVAL,
+		return dev_err_probe(dev, -EINVAL,
 				     "No startup time available.\n");
 	ticks = (*st->caps->calc_startup_ticks)(st->startup_time, adc_clk_khz);
 
@@ -1123,7 +1054,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 	/* Setup the ADC channels available on the board */
 	ret = at91_adc_channel_init(idev);
 	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret,
+		return dev_err_probe(dev, ret,
 				     "Couldn't initialize the channels.\n");
 
 	init_waitqueue_head(&st->wq_data_avail);
@@ -1137,14 +1068,26 @@ static int at91_adc_probe(struct platform_device *pdev)
 	if (!st->touchscreen_type) {
 		ret = at91_adc_buffer_init(idev);
 		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret,
+			return dev_err_probe(dev, ret,
 					     "Couldn't initialize the buffer.\n");
 
-		ret = at91_adc_trigger_init(idev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "Couldn't setup the triggers.\n");
-			at91_adc_buffer_remove(idev);
-			return ret;
+		st->trig = devm_kcalloc(dev,
+					st->caps->trigger_number, sizeof(*st->trig),
+					GFP_KERNEL);
+		if (!st->trig)
+			return -ENOMEM;
+
+		for (int i = 0; i < st->caps->trigger_number; i++) {
+			if (st->caps->triggers[i].is_external && !(st->use_external))
+				continue;
+
+			st->trig[i] = at91_adc_allocate_trigger(idev,
+								st->caps->triggers + i);
+			if (!st->trig[i]) {
+				dev_err(&idev->dev,
+					"Could not allocate trigger %d\n", i);
+				return -ENOMEM;
+			}
 		}
 	} else {
 		ret = at91_ts_register(idev, pdev);
@@ -1154,36 +1097,13 @@ static int at91_adc_probe(struct platform_device *pdev)
 		at91_ts_hw_init(idev, adc_clk_khz);
 	}
 
-	ret = iio_device_register(idev);
+	ret = devm_iio_device_register(dev, idev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "Couldn't register the device.\n");
-		goto error_iio_device_register;
+		dev_err(dev, "Couldn't register the device.\n");
+		return ret;
 	}
 
 	return 0;
-
-error_iio_device_register:
-	if (!st->touchscreen_type) {
-		at91_adc_trigger_remove(idev);
-		at91_adc_buffer_remove(idev);
-	} else {
-		at91_ts_unregister(st);
-	}
-	return ret;
-}
-
-static void at91_adc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *idev = platform_get_drvdata(pdev);
-	struct at91_adc_state *st = iio_priv(idev);
-
-	iio_device_unregister(idev);
-	if (!st->touchscreen_type) {
-		at91_adc_trigger_remove(idev);
-		at91_adc_buffer_remove(idev);
-	} else {
-		at91_ts_unregister(st);
-	}
 }
 
 static int at91_adc_suspend(struct device *dev)
@@ -1333,7 +1253,6 @@ MODULE_DEVICE_TABLE(of, at91_adc_dt_ids);
 
 static struct platform_driver at91_adc_driver = {
 	.probe = at91_adc_probe,
-	.remove = at91_adc_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = at91_adc_dt_ids,
-- 
2.56.0


