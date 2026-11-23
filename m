Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A011E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XkMKVsaM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BBcqegRx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSMVHsoJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g2CjduqTplR6Y/0NMaC1HGY20Z0WtrWxgraSoRihXcI=; b=XkMKVsaMqkxzpj
	riUy4NcsbxmaKumeUMRHa5tnQtrufB57xC8wn/gbflIhdzmp1FSnoa8+CA/KdFPR+OnEixUWRc0iM
	3WKiXqoWtiM2svfNyoExtv5mAps9t7GqZGa9MgTzCDiDxKNkDhnXvyFvzA3EVjUL6FaGd4rJzuqzE
	EXDUrkYC2t4FwkHgBMQSdznL1VBq9wCH33GT5L58BNFWsRkzfgao904zIlzFgxbCxBAMkLUbKGSSW
	JRaGe/5T3kQOLyvULBPp7srJXFep+FgBv9p2cG48vgqbaW9wu1WXAFyFHN8q6uRubpBp7bvsNtMbj
	IrndOZ9ZNMnH6XT4N4Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO48-00000002Pw7-17fK;
	Mon, 23 Nov 2026 07:02:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO3t-00000002Prr-1kZi
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 07:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=g2CjduqTplR6Y/0NMaC1HGY20Z0WtrWxgraSoRihXcI=; b=BBcqegRxPmu6AFX4Glce2hElop
	hr1BZ8XeR+20lWPrxPRRagvnzjTQwfaCL2U1KgBUOcko6Bu0hLS4YP0733dTu0Reh/+ZVwwkKhQ2j
	foNggr0v1aduUJRrnZvAkvSmtFW4g+vfcmu/Wm8HUd7KCCkhthtazyBpNuxSCsvL/J0qC5mgvFE5I
	20LQaDL4A8AfNQEMyEbBGzvuFIEF2avjtzVi3+bRdHgcE5rS9N+IALTmZdkafAFhKARtFQ4KlTBTA
	rSWxsTOtUzP1eglr8bSLJOwT8kE2+jPs93zYM3mzoy8DWuET3mjvG1rjNPo1ok6JiJNHxNnX/rArX
	s98Px9gg==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO3q-00000002nu4-3XfT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:02:00 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso3137956a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417316; x=1796022116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2CjduqTplR6Y/0NMaC1HGY20Z0WtrWxgraSoRihXcI=;
        b=iSMVHsoJe5mZtCUh8bKMpKn8dYutymX7rD7iZv9lMyhzRvYyHm9Xody78PQxPKSdN9
         twEh0wF0Wbc6IvynRqqk+5C+u9LnNZp/IrSt29sj6HCj4Aj0eAdNEEpPZ6WBpp725da2
         D4/9HuodHI2LNxSC6b5xO9emIT+VKlj2G093NgT+wCzlSjykO/r+3Qg60yiSn9ksXJST
         QvDMSpma/CzNtkyRMQvQ9wZUY6R/u6f9Pk+rqIeAO9z0waPH+zFmYFnG8mL85EaxsO/k
         WA6nDxcoEIZAyrX7Ad9HBdC0SioFJN2r01R0MkMEIRBdNqiJ3GTfq4TJ1lUFFTMbe0Rg
         W0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417316; x=1796022116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2CjduqTplR6Y/0NMaC1HGY20Z0WtrWxgraSoRihXcI=;
        b=zzFXnx1Baz5hgXj9iSMqX6l8aJP56THMFEQOzAm4TlZx9wVWECrOQHN/rOu3m3fZEz
         ZRrzxbve9CmfnUWJ/YWoIZVfSTMuNEAIhXyBnF2SXK/AUmxz2cnohemGgFxdX7sjZNVA
         Xq3k07TYAiPe7ie6zkA9Wv8VB2MkkYAjRl0cYClCFOtvtOfzylOMU94ulAsS6BsT/xBi
         Vuf4vhxi5yPMv4BMTrQ5n9PcwGgQWjMmPHY2umdWlTCFv8gScn4l371OVYrad8coMwhB
         gx6XXt1b+tIXlMExImAbTulGYnaI5Oebej1x8By1pI5fm3baoVCRxQlbWto6rkZ1d9E+
         ZhTw==
X-Forwarded-Encrypted: i=1; AL+hErER+lRkF1Qbej8jA5TKHs0fnNp3SiwzZLjAZsF9V5Q9Da8L/6ZBOHLr+2W0XSTFRncPyeE7Aeug86sGso2xg5uJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/atjC+CvTacPWCCtnFbLEfT1cQsVR6xwEg8I7+H+E9tjnegI9l
	WcSw4SZwGe8bBfpUNSGwzGUmRNJWWK7OzFuyRdAMfARQtRV+i9mNN37Q
X-Gm-Gg: AZFdTZcHZVdBotoFCjwSTn3nj1sUQq8YGamKM2lCtVwdFpS/YHU5KCM02Nq6DPLQZ7C
	NVvhjHpqqdssZuWEqCKSYEbx9laLxt7/6c7jdeHaI0I/yHwQb/teu58MGVZyKd5cLbvC1yP44+n
	kIe73QWZ3XcoU1csA+fR1yNBGrfOepod702GeRm5QJpehcwTj7PxtPQPXLiOyWLU/3f70oB7q3T
	aEAkA6MtrbxsWnmwVwJTyw0B3X7f9C4UOZtf5r/cCAMXjtIWvI6JXNRlre44KDg/3RL4zfWLG1x
	9tiEXtrJYyMHuJ4p29wFbpDg+3lV1vL/VbkqC0QAmnJTWLPIYWJJWYiDv606w1SAOiLa4JVe/On
	cdmoCY1CpdbdoF5K9LGtqhqWpsxxT8uW2ijHhGP7Dubzg5ika8uSaGptg9rqRlGQZ0WAIgM2Rdo
	UBy5Dedum8NE6aWVlx1YgTAPPbbDEpZKTrMrXTyWKccjAGiHq9riXqwcY2mJj5ptaYYpV0tcEh5
	bSDZIbRZBiefTjcEDwo8TfwkF9xvs97wOd6dbnxvbh0IdoPyYuTaID8cZs75AH7Ys6CvP+kbhmT
	XOGKZlFlrijSqQDmpC6/PEzTy/a7ftkwJj/b
X-Received: by 2002:a05:6402:2807:b0:6ba:b1fd:6e7c with SMTP id 4fb4d7f45d1cf-6bab1fd717dmr1440319a12.1.1795417316290;
        Sun, 22 Nov 2026 23:01:56 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:01:55 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 5/8] iio: adc: at91_adc: use local struct device pointer in probe
Date: Mon, 23 Nov 2026 09:00:58 +0200
Message-ID: <20261123070101.53868-6-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_070158_893934_4D0BFBEC 
X-CRM114-Status: GOOD (  18.80  )
X-Spam-Score: 0.1 (/)
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

Introduce a local struct device pointer in at91_adc_probe() and use it
in place of &pdev->dev and &idev->dev throughout the function.

Also switch devm_iio_device_alloc() to use sizeof(*st) instead of
spelling out the full private structure type.

This is a preparatory cleanup to reduce the diff noise of the upcoming
conversion to device-managed resources.

As a result, messages previously logged against the IIO device are now
printed using the platform device being probed.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 61 +++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index b6e6fa77c782..3d9ae99a2ce6 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -989,68 +989,67 @@ static void at91_ts_unregister(struct at91_adc_state *st)
 static int at91_adc_probe(struct platform_device *pdev)
 {
 	unsigned int prsc, mstrclk, ticks, adc_clk, adc_clk_khz, shtim;
+	struct device *dev = &pdev->dev;
 	int ret;
 	struct iio_dev *idev;
 	struct at91_adc_state *st;
 	u32 reg, prop;
 	const char *s;
 
-	idev = devm_iio_device_alloc(&pdev->dev, sizeof(struct at91_adc_state));
+	idev = devm_iio_device_alloc(dev, sizeof(*st));
 	if (!idev)
 		return -ENOMEM;
 
 	st = iio_priv(idev);
 
-	st->caps = device_get_match_data(&pdev->dev);
+	st->caps = device_get_match_data(dev);
 	if (!st->caps)
 		return -ENODEV;
 
-	st->use_external = device_property_read_bool(&pdev->dev,
-						     "atmel,adc-use-external-triggers");
+	st->use_external = device_property_read_bool(dev, "atmel,adc-use-external-triggers");
 
-	if (device_property_read_u32(&pdev->dev, "atmel,adc-channels-used", &prop))
-		return dev_err_probe(&idev->dev, -EINVAL,
+	if (device_property_read_u32(dev, "atmel,adc-channels-used", &prop))
+		return dev_err_probe(dev, -EINVAL,
 				     "Missing adc-channels-used property.\n");
 	st->channels_mask = prop;
 
-	st->sleep_mode = device_property_read_bool(&pdev->dev,
-						   "atmel,adc-sleep-mode");
+	st->sleep_mode = device_property_read_bool(dev, "atmel,adc-sleep-mode");
 
-	if (device_property_read_u32(&pdev->dev, "atmel,adc-startup-time", &prop))
-		return dev_err_probe(&idev->dev, -EINVAL,
+	if (device_property_read_u32(dev, "atmel,adc-startup-time", &prop))
+		return dev_err_probe(dev, -EINVAL,
 				     "Missing adc-startup-time property.\n");
 	st->startup_time = prop;
 
 	prop = 0;
-	device_property_read_u32(&pdev->dev, "atmel,adc-sample-hold-time", &prop);
+	device_property_read_u32(dev, "atmel,adc-sample-hold-time", &prop);
 	st->sample_hold_time = prop;
 
-	if (device_property_read_u32(&pdev->dev, "atmel,adc-vref", &prop))
-		return dev_err_probe(&idev->dev, -EINVAL,
+	if (device_property_read_u32(dev, "atmel,adc-vref", &prop))
+		return dev_err_probe(dev, -EINVAL,
 				     "Missing adc-vref property.\n");
 	st->vref_mv = prop;
 
 	st->res = st->caps->high_res_bits;
 	if (st->caps->low_res_bits &&
-	    !device_property_read_string(&pdev->dev, "atmel,adc-use-res", &s)
+	    !device_property_read_string(dev, "atmel,adc-use-res", &s)
 	    && !strcmp(s, "lowres"))
 		st->res = st->caps->low_res_bits;
 
-	dev_info(&idev->dev, "Resolution used: %u bits\n", st->res);
+	dev_info(dev, "Resolution used: %u bits\n", st->res);
 
 	st->registers = &st->caps->registers;
 	st->num_channels = st->caps->num_channels;
 
 	/* Check if touchscreen is supported. */
 	if (st->caps->has_ts) {
-		ret = at91_adc_probe_ts(&pdev->dev, st);
+		ret = at91_adc_probe_ts(dev, st);
 		if (ret)
 			return ret;
 	}
 
 	platform_set_drvdata(pdev, idev);
 
-	idev->name = dev_name(&pdev->dev);
+	idev->name = dev_name(dev);
 	idev->modes = INDIO_DIRECT_MODE;
 	idev->info = &at91_adc_info;
 
@@ -1069,24 +1068,24 @@ static int at91_adc_probe(struct platform_device *pdev)
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
 		return ret;
 
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
@@ -1098,13 +1097,13 @@ static int at91_adc_probe(struct platform_device *pdev)
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
 
@@ -1131,7 +1130,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 	/* Setup the ADC channels available on the board */
 	ret = at91_adc_channel_init(idev);
 	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret,
+		return dev_err_probe(dev, ret,
 				     "Couldn't initialize the channels.\n");
 
 	init_waitqueue_head(&st->wq_data_avail);
@@ -1145,12 +1144,12 @@ static int at91_adc_probe(struct platform_device *pdev)
 	if (!st->touchscreen_type) {
 		ret = at91_adc_buffer_init(idev);
 		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret,
+			return dev_err_probe(dev, ret,
 					     "Couldn't initialize the buffer.\n");
 
 		ret = at91_adc_trigger_init(idev);
 		if (ret < 0) {
-			dev_err(&pdev->dev, "Couldn't setup the triggers.\n");
+			dev_err(dev, "Couldn't setup the triggers.\n");
 			at91_adc_buffer_remove(idev);
 			return ret;
 		}
@@ -1164,7 +1163,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 
 	ret = iio_device_register(idev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "Couldn't register the device.\n");
+		dev_err(dev, "Couldn't register the device.\n");
 		goto error_iio_device_register;
 	}
 
-- 
2.56.0


