Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3328E606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UyGze3qn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EZywUfdg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MS6DmB/ULBdfOhhhYecAUBRl9PiNKo3+G/EHjFt3o2U=; b=UyGze3qnE/7Cn5
	wPR8z7qTfgNjaDiEJ2Um0RbedMBt9K043oMJCdWSwnEIqSQrkb4PiqyL9UkZgmG9p7ImOPfrjdyFZ
	xyerwgoSL7S/txVXKo8xsniNt84laN+tdPUjTcvCjKiQs+Ql/N7ljf25WX3uF5r6m06IUwEd5xxUs
	0N2aGmi9NxIHdHEratszStSsZMWF26er+vZpCOH9WORF3h66rvN841Rc7IpuCDw1cEUVL/YbU7QjV
	kxkOTMklJNk+4wlr3LkMjCoGh853l7S2d7YjgTl2RWmsUDL0wildSPeTjyc+YA6p9khiugdlVGak5
	zuNbbhv6Sib7xJ3jl8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO4O-00000002Q20-0tND;
	Mon, 23 Nov 2026 07:02:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO45-00000002Puq-0EW2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:02:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2004283f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417331; x=1796022131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MS6DmB/ULBdfOhhhYecAUBRl9PiNKo3+G/EHjFt3o2U=;
        b=EZywUfdgWDfnOeE8BUvPpYnlf8F2DblWL0EyPUq473xKIS4vQUv4xZsz0I+PYpsY4d
         lbS5OyinL9bknGQ59QyXphpW+q8Y00KvJlc4vxL6vulImQGpMvae2/xrOTCm7EG1fiUb
         g9w3JNneUNVtMJFCYSQ+1/+0ZQ7q8OUOLtUCUSOSTAVD7ZKpZ2SUO0Hmz0L9Ou9tDokR
         G9kuahYJxfUPmq8lbWxRUtLrG+OM3lG35JKDJ4xb6AxdfIn98s2QGqTwwYBtDUxTc0Rt
         cyQp4Sp5/4NuKth07Z3t6tWKlyTwpMJh8fbCm6xqsAh09TLZtU9Hvt/5I8wq0hwYXAyr
         mc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417331; x=1796022131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MS6DmB/ULBdfOhhhYecAUBRl9PiNKo3+G/EHjFt3o2U=;
        b=RPjPl38usU3MVHvrjqshFVkdxB0WqlDZz8iJUcaRZwsbIBmGCSyO+INQ/3RjQ0vN7m
         ERvpCyOVXXoxPjWDRy5IzgxxwCRsVv+gwrTnNUnrxoLTpWhSvsofZrobfqC+e7s8a76+
         B7bfXffPbX/2+GxmIzZz7MyKA+JYpxykAxYlPNfaLNRU/AB08o3sFlWcGjvDJ1zyFFyU
         TZlY0BkTqEecPR7BdaD0V5UelLcA0jZ3zYgb/GJNixE9ss/8nVBQYwLfMKmMVjQH4MBA
         2BH8nmlC4qHuGlRmSaOnJTxoSPLopiWP8dzZ3Di9tPz1uyr/FlnVQBbgZ3JMh8pN0ljI
         Gvzg==
X-Forwarded-Encrypted: i=1; AL+hErEJVPOyzjaakPtmlDwWKqEPXQOR4yJ9narKfxrPhMYAhULY4RZFIlzlqd24hCs3278R59sgdUVKBeNpFnCZySgF@lists.infradead.org
X-Gm-Message-State: APuU4Z+zuLp8QbaylDoSnfYeGNgLlJzHbjxwLi8EdvQgXDP+uaw5mOO9
	Yl2pEiV2IsJwLaX63L6OY+8td2xmqUWBQ9ORbOzHMHSQ3rO4+Ps2bDz8
X-Gm-Gg: AZFdTZdHt5JQFp0CpXPsLea/3AdP2xjnwJBr7i+JeEMQgSDlcIhS+4AQltqjSDJdlz2
	3ASJhpnGJUDBWcAdUmSjWufONSRchgpiogJOGNwOjgw7I8JI1/PBtmy1oYdNUDBVMhnyu4HWF7o
	2KzCZGmWxUc8Pdc+ykZ0KhMiHdB379gfRChY42HEM3osYmZMP6/Zz+4FC24DT4VURTq7b4Ahpbd
	lgmIm2IsqCqlslwOQPtAV7aG7nfPz2qiIdXb3agMQpNsb30qTSE4xZGUz0Q3hyBMi+/L3Tjn7sG
	rN2TcyM49B+IhIT2q9ZYPMXK1v2OFz8NrdR1xBGTtqlO0baoL/CpWlWrHK869+f5ebalgXD31S8
	nNZPMUiFC/IpK8YGE+A/6ULxRWOzoriCH+SN0mJsRLWfoYQMkSDG0pRIBGQz/KbJcGzFUXOFHP3
	KBVlav5qb5zrkGmA4usc2CaXnQgIKQ12S6Eb3z4pO6OO40Y1BcbYvqa/h4jBGyt68ShK3mkSQy1
	Zgl5nZpW9uJC5opwUhUrq5YG1d9BK/2i22S8o/Fwu98XmQXMaRAvwf31dLfN0K54Ko0HydyqEyL
	rnoGR6oDoEjQBKKZpmPCnSuxBeh+4NrFQqy9
X-Received: by 2002:adf:e014:0:10b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4abb3c37b20mr15296742f8f.34.1795417331345;
        Sun, 22 Nov 2026 23:02:11 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:02:10 -0800 (PST)
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
Subject: [PATCH v5 8/8] iio: adc: at91_adc: convert to device-managed resources
Date: Mon, 23 Nov 2026 09:01:01 +0200
Message-ID: <20261123070101.53868-9-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_230215_491123_D5A14AFE 
X-CRM114-Status: GOOD (  24.50  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Convert the driver to device-managed APIs so that all resources are
freed automatically on probe failure and on driver detach:
  - allocate and register the IIO triggers directly in at91_adc_probe()
  with devm_iio_trigger_alloc() and devm_iio_trigger_register(),
  dropping at91_adc_allocate_trigger(), at91_adc_trigger_init() and
  at91_adc_trigger_remove() along with their manual rollback paths.
  The st->trig array is no longer needed and is removed as well, since
  the triggers are now owned by devres
  - set up the triggered buffer with devm_iio_triggered_buffer_setup()
  directly in at91_adc_probe(), dropping at91_adc_buffer_init() and
  at91_adc_buffer_remove()
  - allocate the touchscreen input device with
  devm_input_allocate_device(), dropping at91_ts_unregister() and the
  manual input_free_device() error path in at91_ts_register()
  - register the IIO device with devm_iio_device_register()

Redundant allocation error messages ("Failed to allocate TS device!" and
"Couldn't setup the triggers.") are dropped, and at91_ts_register() now
uses dev_err_probe() to report its remaining error.  Errors from
devm_iio_trigger_register() are reported with dev_err_probe() as well.

at91_adc_probe() no longer needs any error unwinding labels and
at91_adc_remove() is removed together with the platform driver's
.remove callback.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 187 +++++++------------------------------
 1 file changed, 34 insertions(+), 153 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 62f8db630640..5163583aa4f8 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -230,7 +230,6 @@ struct at91_adc_state {
 	u32			startup_time;
 	u8			sample_hold_time;
 	bool			sleep_mode;
-	struct iio_trigger	**trig;
 	bool			use_external;
 	u32			vref_mv;
 	u32			res;		/* resolution used for conversions */
@@ -607,96 +606,6 @@ static const struct iio_trigger_ops at91_adc_trigger_ops = {
 	.set_trigger_state = &at91_adc_configure_trigger,
 };
 
-static struct iio_trigger *at91_adc_allocate_trigger(struct iio_dev *idev,
-						     const struct at91_adc_trigger *trigger)
-{
-	struct iio_trigger *trig;
-	int ret;
-
-	trig = iio_trigger_alloc(idev->dev.parent, "%s-dev%d-%s", idev->name,
-				 iio_device_id(idev), trigger->name);
-	if (trig == NULL)
-		return NULL;
-
-	iio_trigger_set_drvdata(trig, idev);
-	trig->ops = &at91_adc_trigger_ops;
-
-	ret = iio_trigger_register(trig);
-	if (ret) {
-		iio_trigger_free(trig);
-		return NULL;
-	}
-
-	return trig;
-}
-
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
-		if (!st->trig[i])
-			continue;
-
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
-		if (!st->trig[i])
-			continue;
-
-		iio_trigger_unregister(st->trig[i]);
-		iio_trigger_free(st->trig[i]);
-	}
-}
-
-static int at91_adc_buffer_init(struct iio_dev *idev)
-{
-	return iio_triggered_buffer_setup(idev, &iio_pollfunc_store_time,
-		&at91_adc_trigger_handler, NULL);
-}
-
-static void at91_adc_buffer_remove(struct iio_dev *idev)
-{
-	iio_triggered_buffer_cleanup(idev);
-}
-
 static int at91_adc_read_raw(struct iio_dev *idev,
 			     struct iio_chan_spec const *chan,
 			     int *val, int *val2, long mask)
@@ -930,17 +839,13 @@ static int at91_ts_register(struct iio_dev *idev, struct device *dev)
 {
 	struct at91_adc_state *st = iio_priv(idev);
 	struct input_dev *input;
-	int ret;
 
-	input = input_allocate_device();
-	if (!input) {
-		dev_err(&idev->dev, "Failed to allocate TS device!\n");
+	input = devm_input_allocate_device(dev);
+	if (!input)
 		return -ENOMEM;
-	}
 
 	input->name = DRIVER_NAME;
 	input->id.bustype = BUS_HOST;
-	input->dev.parent = dev;
 	input->open = atmel_ts_open;
 	input->close = atmel_ts_close;
 
@@ -954,12 +859,9 @@ static int at91_ts_register(struct iio_dev *idev, struct device *dev)
 				     0, 0);
 		input_set_abs_params(input, ABS_PRESSURE, 0, 0xffffff, 0, 0);
 	} else {
-		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE) {
-			dev_err(dev,
-				"This touchscreen controller only support 4 wires\n");
-			ret = -EINVAL;
-			goto err;
-		}
+		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE)
+			return dev_err_probe(dev, -EINVAL,
+					     "This touchscreen controller only support 4 wires\n");
 
 		input_set_abs_params(input, ABS_X, 0, (1 << MAX_RLPOS_BITS) - 1,
 				     0, 0);
@@ -970,20 +872,7 @@ static int at91_ts_register(struct iio_dev *idev, struct device *dev)
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
@@ -1142,16 +1031,34 @@ static int at91_adc_probe(struct platform_device *pdev)
 	 * trigger for classic adc.
 	 */
 	if (!st->touchscreen_type) {
-		ret = at91_adc_buffer_init(idev);
-		if (ret < 0)
+		ret = devm_iio_triggered_buffer_setup(dev, idev,
+						      &iio_pollfunc_store_time,
+						      &at91_adc_trigger_handler,
+						      NULL);
+		if (ret)
 			return dev_err_probe(dev, ret,
 					     "Couldn't initialize the buffer.\n");
 
-		ret = at91_adc_trigger_init(idev);
-		if (ret < 0) {
-			dev_err(dev, "Couldn't setup the triggers.\n");
-			at91_adc_buffer_remove(idev);
-			return ret;
+		for (unsigned int i = 0; i < st->caps->trigger_number; i++) {
+			struct iio_trigger *trig;
+
+			if (st->caps->triggers[i].is_external && !st->use_external)
+				continue;
+
+			trig = devm_iio_trigger_alloc(dev, "%s-dev%d-%s",
+						      idev->name,
+						      iio_device_id(idev),
+						      st->caps->triggers[i].name);
+			if (!trig)
+				return -ENOMEM;
+
+			iio_trigger_set_drvdata(trig, idev);
+			trig->ops = &at91_adc_trigger_ops;
+
+			ret = devm_iio_trigger_register(dev, trig);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Couldn't register trigger %u.\n", i);
 		}
 	} else {
 		ret = at91_ts_register(idev, dev);
@@ -1161,36 +1068,11 @@ static int at91_adc_probe(struct platform_device *pdev)
 		at91_ts_hw_init(idev, adc_clk_khz);
 	}
 
-	ret = iio_device_register(idev);
-	if (ret < 0) {
-		dev_err(dev, "Couldn't register the device.\n");
-		goto error_iio_device_register;
-	}
+	ret = devm_iio_device_register(dev, idev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't register the device.\n");
 
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
@@ -1340,7 +1222,6 @@ MODULE_DEVICE_TABLE(of, at91_adc_dt_ids);
 
 static struct platform_driver at91_adc_driver = {
 	.probe = at91_adc_probe,
-	.remove = at91_adc_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = at91_adc_dt_ids,
-- 
2.56.0


