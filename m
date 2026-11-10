Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B24606B147
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SQu9RAMI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X0tlgkyU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=s1yLVKZqUlNj3njloZ4RcEDWvW8KSQFnV995646mHlk=; b=SQu9RAMI5T8GgohsgxYgkHOugu
	7ftc2Ytwt1c9ieJAfvj3Whel679zkeM6CVgGzvGsJYYkFrWl3EXNqfyLIvhoXT9X5wb6Wl37AB5bz
	u2+Dun5rBptT8xqkcoCU2+imcJfTsjT+QPcMlpQ4dY/Y/p0G3QvBX2BaKjOLXKNkXraKcb26zlyBp
	VTntDyplm3l0DCMO2FeoW+bAQ7odTIa0Qa0c6izh/FeBiJFwORNy8EUjZ3gF5fGiG+lwUnN7J3HGy
	jie9ORxgnUuRkxaOmoviGXG4wrYMfXv2feZbBwU0+OJEWd2RZfDJN/NnH3Lym+sPyYrQzBw9WsYrV
	tjRMjn1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiAA-00000003Gnh-0VUm;
	Tue, 10 Nov 2026 09:29:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiA7-00000003GnD-0X5S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:29:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-492690dd5daso1216934f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794302945; x=1794907745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s1yLVKZqUlNj3njloZ4RcEDWvW8KSQFnV995646mHlk=;
        b=X0tlgkyUNlH2qFiiLTa7oC0XrZ7xZ+swRiWpgZWK3SJi35YBWFMs9aP4dVO33e4AL+
         y2QqYYTo37/TqM9erxt0oVvgN9DjdZgEvnsptt/NpQ3A0aNTmNNQZdvM0ikD4I1/Wt9t
         72eIP2C39aoII2OZS7pz7iPBaxhFDaGj5Zwc2KJIYR0kz0Lj7+CVttUHyW3j52rchxDY
         MRZ2FojniI6ag/zKKGUuAKRVXr/rim/NeQ7fvLAvrv12WpBQi+W7MTrUDVyfa/WDO2YF
         mFxinrHb/pjM9XiHaxEUCu32nh9h7jz38HpanzmY5b/VcHaJEwYSMoSoFeLjxod6eozu
         ieKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302945; x=1794907745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1yLVKZqUlNj3njloZ4RcEDWvW8KSQFnV995646mHlk=;
        b=fPObERJaLxOp7urELaWqKeX1SaUdx7GrzzY9C77B8EA+NNRQmTKfhDMO4IPQ2jOgNF
         hds4egkKvbX9jJiwkkGnAvskLGrb2sHoSl6Y+e9I0HBXFP6M7onkaa7K7U+epKcwo4J1
         iZ0ITmVishzmYmy6GuVUUg8gI4jcwbn/aGLWJM2fUlgvPQcjYPzDhoNrzhi1nJFUUQ+k
         OlcWQaNWpb6RD7DTnCa2erhySu7x9X+NOtwuMq8UJBgGRX2C3BUC4iTWcQko50Y4gIYu
         MA8K5bgqXy5HrtiU+FOgZ6sxU36Nej62zJ61lqRw38ygkVurqmimLwAAf849nR6Y8qkM
         wCiA==
X-Forwarded-Encrypted: i=1; AL+hErG1ZBzhRn0tE8G/xN7JlB4ZS7Rn2Hc+b8/DxGtCZToy0yTlopER++0GTzEFwUYsGu1OTDbvsqr4eg2AAQ3/WkfF@lists.infradead.org
X-Gm-Message-State: APuU4Z/FG23K2fjFV7g7kqqEKyxT6Lr36gFlo1ZAuOM/2tkKg/fXNMfE
	MWd1/YKH63x9tbSEVXn4DDSwDc+6UKMBrlXtgOcMuAtcLSc98oQl+u1/
X-Gm-Gg: AYBFou0z7htUt8jXwu+jSsTzyejLkuGgO5vf+9oYCvQDQqA2CaU3N00Avs5J2+qnsmy
	wFi/PETuQHCXZ+jZCxh2Amrjqx5/QN21m7KSelrcrDHBwQmjm/QlT7KBF0OI2tw4Sko3Tu+tJvs
	OY026DV75+FiFiAowHanrev8PNvkI6qxq0gdswu86JhvCdwn0nZeB+kgF1Px2YtigNIviWJoN5Z
	WAF0U8tRM/AYflrvopBsHj2tqVQ6g5ivqCS3YDO/hDZJ/ac+G5S9vP7xTAzL11jmeeOimyOAhXj
	VejqIc6nr+8rypSXkEuMAhKlLNCYzdy9weAhaqVWSHAsu47WyCFkIzXli1sKqD89hakFbOCwVOQ
	81jg4VB2mrdumXo4VcwxS92fecFmjUxmJwAeg4MwKq3Ek9Sl8jZgEFiQuIAEWlq76db76sp8rLB
	tyyl5fuFmZhwOQrG2IOCc5nmMe/Tb0D4uROz4QgmhhWXc6/8HKgS9TXEjFPJcb6RG5KeBdOalt8
	rRGM55DvT4lmXobm/t5LNHfBRybhL/mbrZxQeiVLgGHyCw5DwxdaSSsqOWBGjFKAMhUIC9ZJyKI
	WhdzILjHKZhXEjepIABzyTI19hZyzS5x8SHh
X-Received: by 2002:a05:6000:3c5:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-4982e641f90mr3524247f8f.11.1794302944660;
        Tue, 10 Nov 2026 01:29:04 -0800 (PST)
Received: from fedora ([154.182.80.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983f7801bbsm3839798f8f.5.2026.11.10.01.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:29:04 -0800 (PST)
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
Subject: [PATCH v2] iio: adc: at91_adc: move to devm_* to fix NULL pointer deref
Date: Tue, 10 Nov 2026 11:28:48 +0200
Message-ID: <20261110092848.141854-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_012907_224562_4456483B 
X-CRM114-Status: GOOD (  24.67  )
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
v2:
 - Dropped the simple NULL check approach.
 - Refactored the driver to use devm_* API as suggested by Jonathan Cameron.
 - Removed manual cleanup functions and error paths entirely.
 - Inlined remaining trigger initialization into probe().

 drivers/iio/adc/at91_adc.c | 146 +++++++++----------------------------
 1 file changed, 33 insertions(+), 113 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 0ac74ad92fca..911838150116 100644
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
@@ -924,9 +871,8 @@ static int at91_ts_register(struct iio_dev *idev,
 {
 	struct at91_adc_state *st = iio_priv(idev);
 	struct input_dev *input;
-	int ret;
 
-	input = input_allocate_device();
+	input = devm_input_allocate_device(&pdev->dev);
 	if (!input) {
 		dev_err(&idev->dev, "Failed to allocate TS device!\n");
 		return -ENOMEM;
@@ -951,8 +897,7 @@ static int at91_ts_register(struct iio_dev *idev,
 		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE) {
 			dev_err(&pdev->dev,
 				"This touchscreen controller only support 4 wires\n");
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		input_set_abs_params(input, ABS_X, 0, (1 << MAX_RLPOS_BITS) - 1,
@@ -964,27 +909,14 @@ static int at91_ts_register(struct iio_dev *idev,
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
 	unsigned int prsc, mstrclk, ticks, adc_clk, adc_clk_khz, shtim;
 	struct device_node *node = pdev->dev.of_node;
-	int ret;
+	int i, ret;
 	struct iio_dev *idev;
 	struct at91_adc_state *st;
 	u32 reg, prop;
@@ -1140,11 +1072,23 @@ static int at91_adc_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret,
 					     "Couldn't initialize the buffer.\n");
 
-		ret = at91_adc_trigger_init(idev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "Couldn't setup the triggers.\n");
-			at91_adc_buffer_remove(idev);
-			return ret;
+		st->trig = devm_kcalloc(&pdev->dev,
+					st->caps->trigger_number, sizeof(*st->trig),
+					GFP_KERNEL);
+		if (!st->trig)
+			return -ENOMEM;
+
+		for (i = 0; i < st->caps->trigger_number; i++) {
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
@@ -1154,36 +1098,13 @@ static int at91_adc_probe(struct platform_device *pdev)
 		at91_ts_hw_init(idev, adc_clk_khz);
 	}
 
-	ret = iio_device_register(idev);
+	ret = devm_iio_device_register(&pdev->dev, idev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Couldn't register the device.\n");
-		goto error_iio_device_register;
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
@@ -1333,7 +1254,6 @@ MODULE_DEVICE_TABLE(of, at91_adc_dt_ids);
 
 static struct platform_driver at91_adc_driver = {
 	.probe = at91_adc_probe,
-	.remove = at91_adc_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = at91_adc_dt_ids,
-- 
2.56.0


