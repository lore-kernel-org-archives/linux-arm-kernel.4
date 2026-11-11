Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF95606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V8ne09W9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BMGN9TM4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p7pXPD4xGmJxoqNUMjBHFW+XcIKHkp+3oSxhorL2mg4=; b=V8ne09W9a3dJfG
	sUcnpJVrbxbS5d7+Xo0THVBL11WFFYBeVo8iL5WBDwqEjNDTlGZT2rBNjATLDA5Ys7XlZG0bStnUD
	mRV4blS87zjGMzA8hfqNN2GJodfB1cuvlCi5L9TFyfHIHabyLnrn3o9ze8RQVCQ4yIx2it+JGREdn
	z/c4XYTxR8BnWf4lR3seZnrdvPIAAk/5fDwcpel2mwOv8zgvsTHE/EV5F513yqnfJzxIRisaruQqy
	pC62x/q3Ce+be8fBfl7emZkosVc4ppYMOUKT0itwPK5sSE2MJlzdeTDoANwA7zulAunE1PaEqsLsj
	5vnLoQKmbgTcx3ZpXwFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5E6-00000006IPu-0kci;
	Wed, 11 Nov 2026 10:06:46 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5E2-00000006IOw-475J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:06:44 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1a2761c69fbso5008028c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794391602; x=1794996402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7pXPD4xGmJxoqNUMjBHFW+XcIKHkp+3oSxhorL2mg4=;
        b=BMGN9TM4ulEhNlY0nVysuGwjZt7n7LQK6sre1xm4CZvef42aUo+raHx+uEVrA0hMDd
         lhfccls2Dgrg/2Xo0SF5VmN1iZAZn2lVFf7AJsIEZWe/gFLGri1WvblyOtn4SwwQhbDK
         bUxjtq2OOd6GAlFRoFHx80PDUpnZStZBfsf/78HldsPQ9eLLi9LN05KPoC2Ez3RdQJzy
         8LjtOofL+NR0diOGvgiGT/bdkLp5BsKGBzAZhyRmsEueXGng2x5VTvZQgFyM3wvnfH7s
         sCnC2SAx7e0RCIEWDAq3QUypnYoZWPER0KpZ3fGa/8rEzeaEna5v6OfTTyL/Pq5cMZ10
         tlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391602; x=1794996402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7pXPD4xGmJxoqNUMjBHFW+XcIKHkp+3oSxhorL2mg4=;
        b=FQ16cgz6LixXm3eT0pMJq4GGKZcJXQ7hgMcrtX/g+E8nUyPUxnL+59s6LFEDtaphiv
         BsvO793YLnihtdP9+e+BzqDNGUH8LTales/wVjH3RJ4SMU5bRhg6nvYKLBjRQ3hVRRy/
         lsInMsaVhPvwyxLCLGgui7V6JvmyJ6eXkMq11B6BddsbJn++nBMnk+3r3/5dA8z7jJ0I
         8MXGRaynAve2TyD0OfOZEmoQvR0F2qXx318XzYnIuWrO4/pyNj802w95tV0ser8lQg/c
         xUwdY10x0+Ccj27BnCbJXPU22FRyCr/YtM9wVtjYB5VzceUjlFIue57g/ThaupdLz8Vv
         RQZQ==
X-Forwarded-Encrypted: i=1; AL+hErEhnDwayeS6Vy8rvR9oJ6M/uH621nG79Ir1aZUyK9knbO7t3LUnUB0XXVqMKs3ACA+viMBdMnmTiPCfmym8QC8e@lists.infradead.org
X-Gm-Message-State: APuU4Z96XAjOWjtvMBVylDFswexWQtYiiq39kYOMFtIMJ7xmTMuOhIhd
	geQvg5qJKZh37CWSS3IKOgccv/eVsXwjuNy080SlQDqnKyF6dMMI20d3
X-Gm-Gg: AYBFou1PrX5WTsBYMmtr4/ZZ2SVYthsHl+MwZ1AW3KoIUui/Cf0FZvMXs8zaTE1CY5C
	7tr45l8DAE9SKKH8QXuFl0aYxyCmLUgsMUJ0tXPjFt/8HkwujMiZs+dSh33ziZWTRZGrTAWCTHn
	j6dFtbG/VxPR+xS/ZMbZNpt+OoGseEvhZAkFgWpF6yCaCEhySD5Ep/YIS1Kb4Vi46oWyFmybx1M
	4V7d4KX2USjQ5wCRJ6eFG0mjYS+DXn0tDj+60PMul9QqXZvOsgQN3Ew+7wA0XWX3b5uRJDK/Duz
	n73rFTDsh+jqgQW+PrYq1rJ89aiLK2Nv8es/3LTMRvZRi5uZQf0FUt/51PLoMJFIHya2Etkg43l
	PT8JUMYhefk0MUHatSw0LtkKNV1O7VsfyhlfaL/55TvLMAcKVde9TP0CuMk/GT1ijbmvPm/agPQ
	KGALZ3DlwWDWR2YbhseJQL1HrmZyAmX8ug4xmTxCg8jstP3ck70uiHqZl05mmpDVisx2fnnzKxv
	wrQoA1btOqt3ynCkoLSvPVTK+MI9Jqrs1WYACv5Iq7a2715sN0s9eA/pZpnRq/H/Enyo27MASQp
	yWKRQRuY3xLrmyiRC8py9cETzpcDprQJTFo9ux3U4Sq4ou5iLTYwxj4vFhLXZS9SFAxXrqfyupu
	emgj26Qe+R8MCfvR7VMp93+yRGLQviWQa+1P47nT8igiL+mnxHZqiOhAPX76YzRU1QfI=
X-Received: by 2002:a05:701b:42c9:10b0:194:3a84:e67d with SMTP id a92af1059eb24-1b3c0360b4cmr2033927c88.44.1794391601941;
        Wed, 11 Nov 2026 02:06:41 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm15778025c88.3.2026.11.11.02.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:06:41 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
Date: Wed, 11 Nov 2026 17:06:15 +0700
Message-ID: <20261111100616.31211-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111100616.31211-1-phucduc.bui@gmail.com>
References: <20261111100616.31211-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_020643_045065_1BACBE59 
X-CRM114-Status: GOOD (  18.77  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: bui duc phuc <phucduc.bui@gmail.com>

The peripheral clock is only acquired and enabled once during
probe. Use devm_clk_get_enabled() to combine clock acquisition
and enabling into a single call.

Since the clock is now enabled during probe, request the IRQ
afterwards to ensure it is freed before the clock is disabled
during teardown.

This also removes the need for manual clock disable handling
on probe failures and in the remove callback, as the devm API
automatically handles clock cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move the devm_request_irq() call below clock initialization and
   dev->regmap setup, as suggested by Sashiko.

 sound/soc/atmel/atmel-i2s.c | 43 +++++++++++++------------------------
 1 file changed, 15 insertions(+), 28 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index e1d8af056234..60e885980f4c 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -650,21 +650,16 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* Request IRQ. */
+	/* Get the IRQ. */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, atmel_i2s_interrupt, 0,
-			       dev_name(&pdev->dev), dev);
-	if (err)
-		return err;
-
-	/* Get the peripheral clock. */
-	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
+	/* Get and enable the peripheral clock. */
+	dev->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
-				     "failed to get the peripheral clock\n");
+				     "failed to get/enable the peripheral clock\n");
 
 	/* Get audio clock to generate the I2S Master Clock (I2S_MCK) */
 	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
@@ -675,6 +670,15 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
+	/*
+	 * Request IRQ after initializing dev->regmap and enabling pclk,
+	 * so devres frees the IRQ before disabling pclk.
+	 */
+	err = devm_request_irq(&pdev->dev, irq, atmel_i2s_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
 	/* Do hardware specific settings to initialize I2S_MCK generator */
 	if (dev->caps && dev->caps->mck_init) {
 		err = dev->caps->mck_init(dev, np);
@@ -682,11 +686,6 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	/* Enable the peripheral clock. */
-	err = clk_prepare_enable(dev->pclk);
-	if (err)
-		return err;
-
 	/* Get IP version. */
 	regmap_read(dev->regmap, ATMEL_I2SC_VERSION, &version);
 	dev_info(&pdev->dev, "hw version: %#x\n", version);
@@ -698,10 +697,8 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(&pdev->dev,
 					      &atmel_i2s_component,
 					      &atmel_i2s_dai, 1);
-	if (err) {
-		clk_disable_unprepare(dev->pclk);
+	if (err)
 		return err;
-	}
 
 	/* Prepare DMA config. */
 	dev->playback.addr	= (dma_addr_t)mem->start + ATMEL_I2SC_THR;
@@ -712,28 +709,18 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	if (of_property_match_string(np, "dma-names", "rx-tx") == 0)
 		pcm_flags |= SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX;
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, pcm_flags);
-	if (err) {
-		clk_disable_unprepare(dev->pclk);
+	if (err)
 		return err;
-	}
 
 	return 0;
 }
 
-static void atmel_i2s_remove(struct platform_device *pdev)
-{
-	struct atmel_i2s_dev *dev = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(dev->pclk);
-}
-
 static struct platform_driver atmel_i2s_driver = {
 	.driver		= {
 		.name	= "atmel_i2s",
 		.of_match_table	= atmel_i2s_dt_ids,
 	},
 	.probe		= atmel_i2s_probe,
-	.remove		= atmel_i2s_remove,
 };
 module_platform_driver(atmel_i2s_driver);
 
-- 
2.43.0


