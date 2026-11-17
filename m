Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562BD606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IVIa+ykB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hlfDytEI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=quQMrB7OSgXybtrUuyxFHk5pzIGZogKcKvne8SHcCQM=; b=IVIa+ykBqtvxSY
	K0JEjzPXSMWKlwf1uWm+fmnKISTFGwkWqZ2arLrOA3fz70QqIGpRvXLFA5oDyPamazbFHjXeuhFhJ
	l1EpgWOYMTmFoUZ/diuLm01Rbf4si4L4uLGpze6ESzOe8qsxDwN4vTL1j/svcnky1guGCRQVWjInp
	M9Ex3ZGyMyKNlagp1VCsrE4u+98gW2f//6GN4tdoUX0jmKZy0fzYsZmzEsbyK2PIlq/RiaGg8mCu/
	Kil8Ndbx1nZ+86AuGb1ilhACMNAC3BqZnFJRnmqJEOP3KKMYDLrsNL3e0Cs2bfkT1rMa1XT0XYwIy
	8jW8vHzR73Hd7AigylRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJop-00000006399-175E;
	Tue, 17 Nov 2026 14:05:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJom-00000006378-1TZy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:05:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-490f38e9688so794944f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794924350; x=1795529150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quQMrB7OSgXybtrUuyxFHk5pzIGZogKcKvne8SHcCQM=;
        b=hlfDytEIt31j493FKCrIzgm+G7aStiLu4n6E7CiPhdS9d6L8cCUIgwj2/v+Nx0PlzZ
         5dKKvAVrLD7UZ2dCZUqAOnZifHHudu/6xkub94Ztn/HaG9/LsL42RK9WsH1XhQcNHlj3
         o+jxNKN2uMSCsmtXKZr+dgU93xMNN5QYOFRSh6AK8mBQ548GvO/RpXheywjtuH45yRhx
         MJBaBQiliriTwDRAemPjZ/drjNHDcRvaJzHZlkVKek98kHFYDvMEJJ8HEHqkjsg0sRht
         PKCD/kRtBEciOYZP6rM1Soch22DHIuJpLCBuEkzVCgSv9dQSHKmryjd7MEfyHgvrBIVK
         8UDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924350; x=1795529150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quQMrB7OSgXybtrUuyxFHk5pzIGZogKcKvne8SHcCQM=;
        b=V7rR0erI68xKup66aGike3slJYiqWaqhecy4DzcdUd/X5+WdBXE6op2FGIkLuWfN7t
         90RvhnACrHcl3q4Mr3Vtt360N4ofPMT4XF4I3bC3tzwP0EsCm3iC36ad9iwyusPZPqcD
         46+8LYu1T8zqFL6iWWAxSnzWBS54UiK/DyZphbxWw4KvL7WNjJMxLzm3ECANyuWGFSOE
         RQGjQahkRxYO60uKwcBpROMNX3ZnRek8W83GvAVcXQUqCKb7n7Sw1fr8zBVOGRkcZZRR
         srVS6jtVmgablA614BWNEO4PhUVqT4rZuaLLgrkgS+CBp0HVAjY+dcEmfG1oDY07Sixo
         BbPQ==
X-Forwarded-Encrypted: i=1; AL+hErGDXeh2hSfUmppEIkVGbCEhd2cuo9doVS8Evq7ocbfhbQQijiONxVCrVmdmnMnCxkFXp+dV7kspzFcTnz8shnT+@lists.infradead.org
X-Gm-Message-State: APuU4Z/24CvpWqi20LB12bL8hSNVXAdB+5vsY9WNXmxTcn+iqnYWcKNo
	NXj1ZoqeUbiC/uuGDrlfq92X7/VVmgl970WkZq/xQ0+qTJZmb9tKHoys
X-Gm-Gg: AZFdTZcuRa/4Y83zmXZox4t/6oHSpG0iJngnXVDgolDWtZ/JjUanpskhXA74ICUptol
	lKeqJiCNt5AtKu6xUDVEWel+HHtg89eP95RRF/Ls+e/yIzP+LedtKH69h47GfXfOfc8yYW77XgW
	/TmP/acKM5Vny57rBfi66mTu4j4gvnglkIM1NH6r6h5ivO66y6aBOwhh/mG+WArgWj0gPoNLJX2
	Kpx1j6+GIpHC7zQj9wNTYD7jaxv7YR+XAr2iMdxmkYpyBwLaaGZBXLeYjIT3E/2Vg8DbE40trdw
	Sjxqk7vNuStsWtqmYIR95sauEzCv6pF2IEvPQDPzqVSjg7JMALVY8EyI4xvyTcSyMCEmzXnyisA
	FHb8hQXCDhQyd/71KfeiTAblezS5934NqVUYg6gthFpNUEabQCZ92q731OeEM2/vIL+zGlcjJZX
	8RSQ9peJjmhocUooRzH4VTZ3IrL/RGk/beG16MTxiz+g+Nwrrjs4x5iUXigR1bT/OGVecNS/gZ+
	AOSSjIqbq9pMerujNaQr80vT29DvkV2o5YF3PNM1oirTx4MEJylunZ9q3qWQ6mXqedNx3TFPNpp
	7Pja69B0+jrMFohV2o6MBjbjNp65UzwNCECRrQ==
X-Received: by 2002:a05:6000:24c4:b0:491:eb12:e151 with SMTP id ffacd0b85a97d-4a36c30c94dmr6426991f8f.4.1794924350441;
        Tue, 17 Nov 2026 06:05:50 -0800 (PST)
Received: from fedora ([154.183.162.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm2623032f8f.8.2026.11.17.06.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:05:49 -0800 (PST)
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
Subject: [PATCH v4 2/3] iio: adc: at91_adc: use local struct device pointer in probe
Date: Tue, 17 Nov 2026 16:05:09 +0200
Message-ID: <20261117140510.391907-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
References: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_060552_429037_F3F791AA 
X-CRM114-Status: GOOD (  16.41  )
X-Spam-Score: -1.8 (-)
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
in place of &pdev->dev and &idev->dev throughout the function.As a
result, messages previously logged against the IIO device are now
printed using the platform device being probed.

switch devm_iio_device_alloc() to use sizeof(*st) instead of
spelling out the full private structure type.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 46 +++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index c7fc06214c05..0553a08b8d24 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -987,32 +987,33 @@ static void at91_ts_unregister(struct at91_adc_state *st)
 static int at91_adc_probe(struct platform_device *pdev)
 {
 	unsigned int prsc, mstrclk, ticks, adc_clk, adc_clk_khz, shtim;
-	struct device_node *node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
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
 
-	st->caps = of_device_get_match_data(&pdev->dev);
+	st->caps = of_device_get_match_data(dev);
 
 	st->use_external = of_property_read_bool(node, "atmel,adc-use-external-triggers");
 
 	if (of_property_read_u32(node, "atmel,adc-channels-used", &prop))
-		return dev_err_probe(&idev->dev, -EINVAL,
+		return dev_err_probe(dev, -EINVAL,
 				     "Missing adc-channels-used property in the DT.\n");
 	st->channels_mask = prop;
 
 	st->sleep_mode = of_property_read_bool(node, "atmel,adc-sleep-mode");
 
 	if (of_property_read_u32(node, "atmel,adc-startup-time", &prop))
-		return dev_err_probe(&idev->dev, -EINVAL,
+		return dev_err_probe(dev, -EINVAL,
 				     "Missing adc-startup-time property in the DT.\n");
 	st->startup_time = prop;
 
@@ -1021,7 +1022,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 	st->sample_hold_time = prop;
 
 	if (of_property_read_u32(node, "atmel,adc-vref", &prop))
-		return dev_err_probe(&idev->dev, -EINVAL,
+		return dev_err_probe(dev, -EINVAL,
 				     "Missing adc-vref property in the DT.\n");
 	st->vref_mv = prop;
 
@@ -1031,21 +1032,21 @@ static int at91_adc_probe(struct platform_device *pdev)
 	    && !strcmp(s, "lowres"))
 		st->res = st->caps->low_res_bits;
 
-	dev_info(&idev->dev, "Resolution used: %u bits\n", st->res);
+	dev_info(dev, "Resolution used: %u bits\n", st->res);
 
 	st->registers = &st->caps->registers;
 	st->num_channels = st->caps->num_channels;
 
 	/* Check if touchscreen is supported. */
 	if (st->caps->has_ts) {
-		ret = at91_adc_probe_dt_ts(node, st, &idev->dev);
+		ret = at91_adc_probe_dt_ts(node, st, dev);
 		if (ret)
 			return ret;
 	}
 
 	platform_set_drvdata(pdev, idev);
 
-	idev->name = dev_name(&pdev->dev);
+	idev->name = dev_name(dev);
 	idev->modes = INDIO_DIRECT_MODE;
 	idev->info = &at91_adc_info;
 
@@ -1064,25 +1065,25 @@ static int at91_adc_probe(struct platform_device *pdev)
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
@@ -1094,13 +1095,13 @@ static int at91_adc_probe(struct platform_device *pdev)
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
 
@@ -1127,7 +1128,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 	/* Setup the ADC channels available on the board */
 	ret = at91_adc_channel_init(idev);
 	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret,
+		return dev_err_probe(dev, ret,
 				     "Couldn't initialize the channels.\n");
 
 	init_waitqueue_head(&st->wq_data_avail);
@@ -1141,8 +1142,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 	if (!st->touchscreen_type) {
 		ret = at91_adc_buffer_init(idev);
 		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret,
-					     "Couldn't initialize the buffer.\n");
+			return dev_err_probe(dev, ret, "Couldn't initialize the buffer.\n");
 
 		ret = at91_adc_trigger_init(idev);
 		if (ret < 0) {
-- 
2.56.0


