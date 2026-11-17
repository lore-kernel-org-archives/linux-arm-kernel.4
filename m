Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821CD606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mt4hETBO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bD3Gp+PV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YnUCdj0ZJZzzvPnpwhHMUkbSJzZL3zHDWabQB4+Fnv8=; b=mt4hETBOBYCT+S
	NbUHPwOGEJK7RmPpnw+2wAY2DhDZDy9xqGMHx6dh2otNsbbYB5efPLuKyFKf0Xi2xlfip+IaAecvH
	fKTanXnRgwhqNXDglb25qA58mLxG5dh/21XQYOaMshWeWmT2FksYxtNk7nwzjE1p1D44dwlvElFgA
	sh3oD4GljuqTuCzvav7OQxLrykjVcut+cJZ9EVr+1jCRu1/FPi02bpucOZVLjJ331GzIzSkzW38VT
	oK/4y32SJpVW9pcin+WtiQvcMUOVeU/4QRJlduui8n7Te/EswPhOUYgv4FGcYJk76wEI9szNFRflY
	238W5fmN30ki0uOcZXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJp2-000000063I1-30UF;
	Tue, 17 Nov 2026 14:06:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJou-000000063Cl-3520
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:06:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so21473615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794924359; x=1795529159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnUCdj0ZJZzzvPnpwhHMUkbSJzZL3zHDWabQB4+Fnv8=;
        b=bD3Gp+PVq4VTI3M9d0R+FdtjnkSkBu7poF3Lxu4vn6RaahdJz5/Kfz8Pcziy8UWrxw
         0X5OtsrYeO6yHck/BHokpY69w1t5+MExgXnBrYMKIq+RyFlFRFUnJcSshjfkgyARLeBC
         spu/ShBUbQ+67u2q/NYDnGVZ98fJgqSvIqIxIIucPH7omDZ7cm6Ys8QBCvUDFMdq3OGD
         1uSwVs9qCl8kfms9WSNyxBEGbfYA6UQyx0MREyK5otsm1UfRFxwvhfGWRT3K5z9Nujtk
         h/3KpdhJM7i6rvLNVjkBMPEhf9yXjW58MqMU7jvMpMhUbjoCmbo2Doay5R0qoQZVfn50
         hNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924359; x=1795529159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YnUCdj0ZJZzzvPnpwhHMUkbSJzZL3zHDWabQB4+Fnv8=;
        b=ItogSvt2MlGKo8UvDB5hbT11wqCOHF0bVx8X0Sr0Nvqt6gB3sgbSi7A0BifHhktMJl
         QAC4xJlYeqiA9JYPUOvBqr/OClowo3W+vZ/ntaLSmmEmbGrAeJ6hS4utnV0E3uRIymtq
         zx8hk1aqZbSzCo8eSgkUwyAdzTP7BYxjfJuPmV4618pfOtDSSzrdL8JT99JtiSWadJG5
         EOLue3ryIwM5KG0a0qhaPrqXAvk4+SKsvBDmE33jJYolbrISU16icPtD9+KCUtqKJZne
         9fHF6FPL+YZiU8xjU8zgpMG1U2dYetY8rlPH328vyoolpmU9PXYlizvJLStOZys97uoT
         y7ww==
X-Forwarded-Encrypted: i=1; AL+hErERb1w0hC5/7rDpjeg7IffKvG6veFXENDEMkHfpHRw/ZOW5FEgEuDpyZfQaQj1mIQN/s1ykcOch05pXBjKejrOV@lists.infradead.org
X-Gm-Message-State: APuU4Z//nhKj1NGvodP72zQjG8+CkBHckZwUMjBhZzBZoPNv2IuESU5C
	O9/Z/zLhRC2pqm2lmuPsN/8zoxoSpItVNF+77GEkihpEjGjChIjAZ7Tx
X-Gm-Gg: AYBFou2CibHPkY0glAb3vC6kEBLR8FcWYoi3JuvHLs2twku/J3gyHSD8v6dYtOso4rf
	lpHHWHvLJY7v3XvYIUWPRMAoRDvOfbXi5BkHfsvrWaIhwtBzCGKyOgQ+nsznUOtba7CpEmlUeEE
	YvqjyAZ+7SuE3D9Dzt8uk/G5Ev3l+3SEANe+pA5N85GHMjTpk8yuKkKZ+olQWS5Gb6zi+zN/dXA
	kUP1NSN3t+CyKOOGBNqQGIP1DKIglPlamKw5F7/gImMpBJ70x4uVoNurTPPQnW0TaBGPnPr98KF
	kJumK+c//DgIf8RvDdMcg8whx7/1ueCiugTDkP46qbt18w2IazUCj2YopKXQy+x0DL9eOST8DcF
	jY+AgpTF3VHdO4tLGboKYHUOCOQX6lmg0Cqj7CJG3veY6ItbJfxfbC2x6Rs4yOmd02fh00aTqfw
	twso3fs3drnC/P+fGTrvlq/XBa0cn8IO89nTqohhaRSUswf5B2+zJYZNWA4DxA1iQ1moD+pP+Qx
	GzqXAl2ALVx0pP2Of1AsYvod5RD0FHkvYVUZopll4pY/3v2WQQOaiM0Pc+iO37Zn1SPJWTLD117
	SqEMisuuBFaPSBujYPeUBkkScofUQDQVXGTjRg==
X-Received: by 2002:a05:600c:3f18:b0:4bb:6ac0:6dc0 with SMTP id 5b1f17b1804b1-4bb6ac06e5dmr155099075e9.29.1794924358798;
        Tue, 17 Nov 2026 06:05:58 -0800 (PST)
Received: from fedora ([154.183.162.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm2623032f8f.8.2026.11.17.06.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:05:58 -0800 (PST)
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
Subject: [PATCH v4 3/3] iio: adc: at91_adc: convert to device-managed resources
Date: Tue, 17 Nov 2026 16:05:10 +0200
Message-ID: <20261117140510.391907-4-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
References: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_060600_825583_49655048 
X-CRM114-Status: GOOD (  23.92  )
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

Convert the driver to device-managed APIs so that all resources are
freed automatically on probe failure and on driver detach:

  - allocate and register the IIO triggers directly in at91_adc_probe()
    with devm_iio_trigger_alloc() and devm_iio_trigger_register(),
    dropping at91_adc_allocate_trigger(), at91_adc_trigger_init() and
    at91_adc_trigger_remove() along with their manual rollback paths
  - set up the triggered buffer with devm_iio_triggered_buffer_setup()
    directly in at91_adc_probe(), dropping at91_adc_buffer_init() and
    at91_adc_buffer_remove()
  - allocate the touchscreen input device with
    devm_input_allocate_device(), dropping at91_ts_unregister() and the
    manual input_free_device() error path in at91_ts_register()
  - register the IIO device with devm_iio_device_register()

at91_adc_probe() no longer needs any error unwinding labels and
at91_adc_remove() is removed together with the platform driver's
.remove callback.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 187 ++++++++-----------------------------
 1 file changed, 39 insertions(+), 148 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 0553a08b8d24..e4cf5b1f231e 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -605,94 +605,6 @@ static const struct iio_trigger_ops at91_adc_trigger_ops = {
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
@@ -928,13 +840,10 @@ static int at91_ts_register(struct iio_dev *idev,
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
@@ -952,12 +861,9 @@ static int at91_ts_register(struct iio_dev *idev,
 				     0, 0);
 		input_set_abs_params(input, ABS_PRESSURE, 0, 0xffffff, 0, 0);
 	} else {
-		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE) {
-			dev_err(&pdev->dev,
-				"This touchscreen controller only support 4 wires\n");
-			ret = -EINVAL;
-			goto err;
-		}
+		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "This touchscreen controller only support 4 wires\n");
 
 		input_set_abs_params(input, ABS_X, 0, (1 << MAX_RLPOS_BITS) - 1,
 				     0, 0);
@@ -968,20 +874,7 @@ static int at91_ts_register(struct iio_dev *idev,
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
@@ -1140,15 +1033,39 @@ static int at91_adc_probe(struct platform_device *pdev)
 	 * trigger for classic adc.
 	 */
 	if (!st->touchscreen_type) {
-		ret = at91_adc_buffer_init(idev);
+		ret = devm_iio_triggered_buffer_setup(dev, idev,
+						      &iio_pollfunc_store_time,
+						      &at91_adc_trigger_handler,
+						      NULL);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "Couldn't initialize the buffer.\n");
 
-		ret = at91_adc_trigger_init(idev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "Couldn't setup the triggers.\n");
-			at91_adc_buffer_remove(idev);
-			return ret;
+		st->trig = devm_kcalloc(dev, st->caps->trigger_number,
+					sizeof(*st->trig), GFP_KERNEL);
+		if (!st->trig)
+			return -ENOMEM;
+
+		for (int i = 0; i < st->caps->trigger_number; i++) {
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
+				return ret;
+
+			st->trig[i] = trig;
 		}
 	} else {
 		ret = at91_ts_register(idev, pdev);
@@ -1158,36 +1075,11 @@ static int at91_adc_probe(struct platform_device *pdev)
 		at91_ts_hw_init(idev, adc_clk_khz);
 	}
 
-	ret = iio_device_register(idev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Couldn't register the device.\n");
-		goto error_iio_device_register;
-	}
+	ret = devm_iio_device_register(dev, idev);
+	if (ret < 0)
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
@@ -1337,7 +1229,6 @@ MODULE_DEVICE_TABLE(of, at91_adc_dt_ids);
 
 static struct platform_driver at91_adc_driver = {
 	.probe = at91_adc_probe,
-	.remove = at91_adc_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = at91_adc_dt_ids,
-- 
2.56.0


