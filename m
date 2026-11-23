Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEBF606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SRWJm8PR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LoenmjPZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jo04Jgbh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=itP1hoxcgyxT3Gqtak+dePMpVPLjPeNpaNu3XlNcqvw=; b=SRWJm8PRXxAWYk
	ptq3fQWPM/SNsEDvAhk47t2GgTaZ48/qHXxqgZ3XJ5fMiVBQACT6R45WjUuU0Tns90rvQ1xEaGS8Y
	c8T9mjOsifgKkDa68qu9397ShmAJwaoN5Mo4tZujLucx9I8bs4p0ajORkDvvIWXXCDsuK4X1yHSVJ
	laS+ipJSsiUuDOPWPblMDz9DKTU3kpdAryHstgKKWmB0OlxoqTw9Y5Cw82Pmgj0ms/rxgsJTUfW10
	d7weaBcsfXBi4+I2pLXXXpgt7y/L1VlzNzP14HlW78yNvhyoAEgWhgvpxy8Bcly6MMOnE/5WynA51
	3T/WT+9CqSFGNqGGzydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO48-00000002Pwf-33Ik;
	Mon, 23 Nov 2026 07:02:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO3x-00000002Pta-0QMv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 07:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=itP1hoxcgyxT3Gqtak+dePMpVPLjPeNpaNu3XlNcqvw=; b=LoenmjPZMpHPOFcQwfMiY0m5Dp
	vzJ1UqXVIcFUFF9FdUt2dQixIEo7ZCb4kolQQUPwRMunKyG3PkioMkBinwYc6pxgkdehOHMo6ZK7V
	sAuCPv3jUGPBzDklRn04vobN7N1SLx9bZ+3u72sZDdI+mvOkn1NCHbeIldzLEQhbbz+lbC0PyEb9Y
	Cn6LJPIHhzRpjAsc4g4lL8DFB1U+R+UgFN82oV0a4yZlGbO1mk1QVsfRx38JADGA8o4QqhsIKmEFQ
	HW7t7Xnp+wsCZolJAIQgNf5dpb47J2rBXv4KMdZF4jP+eigkL+32E/ohXzX+2jzN5kp7RRBXkTr6+
	AP2u9X4A==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO3u-00000002nuj-2bvz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:02:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48dee593f18so2778904f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417321; x=1796022121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itP1hoxcgyxT3Gqtak+dePMpVPLjPeNpaNu3XlNcqvw=;
        b=jo04Jgbh6a1feQzSmXVAwC5oIi6I4gbMk+CpyGPKRKz8fTqqEvFZNuH4KHdC/fhHBU
         QAqHkDapVXjW4sTO7AGcMSed5YA3BP3P1XDh4YVIb2Ff+z7GBct2frxieSnWjOoy4mFi
         3nAZdObUd0VUU1g8M5103afGnnWSQ/HakJo/iMIdt69D75hW3kQgWxHrzQZnrJvP4p01
         9Kq+bYb4sUf2KpM8Kat3Ia1UIkUKTBjWjd7Tfcb6IIgUXX05ZpwYr815658HaYEngWRz
         1KunS4YBYhtlIY3oEeHQOr4voq1bWm7DUC73AGJKlFdEazoeAymTf4r/n/6fnDnrhXqO
         2mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417321; x=1796022121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=itP1hoxcgyxT3Gqtak+dePMpVPLjPeNpaNu3XlNcqvw=;
        b=QF0eFNg376hTCO/qA8gBZdUqKXuYC2ryV92YHRLvlMt7/I5I4Nd11cYQ3zB7c7hF2N
         oYA2SJJ2vLP2Fm9tkIMIHGbMNmR3JKuW9Cxl83CQESEZbM9emH1cXStn+oie8BF+8zXx
         hSKn73b3elbKZfJuYS5WkZ7+epMd6QpILiThLAr0uFvg1sJPzaq8SezL0/LwRodwrD15
         ApEWMiHQgqON/HmJhDS1P5ZWhkaF/EpUgFHpsTWZ5YcHn3mmCnNYAWoHXPIei7sx+2gZ
         7qTRhUhn8HeGcEvAu2/aAhi7r7CUBMew1g5SzfF5d5YDveVbWcHA5qwGFJWJ/0MLJLrl
         BvrQ==
X-Forwarded-Encrypted: i=1; AL+hErGEbjw/GjzegZMppSKNeqWjz5c5LjKYwR8/ec8mQHe7cmDCftWhFH8mYOJOXEcuIbKNSSRN4FiybRCqKLHaYsN0@lists.infradead.org
X-Gm-Message-State: APuU4Z/rZObJylxINVaPLO9dwCFh1svq/yUBHGFjvCJmTjvYLLM9fx6l
	8MBAWKcP4scOUDqkGsNq35i1zQ8nxoimkyyOUBYbWpDZe+jNvwwWoRG5
X-Gm-Gg: AZFdTZfQcqx2BLxjhxI2Gd+X5Dgn40OJlOb+0SlBT7gxf0OfhhnuajIoTmmwIz8dCMZ
	08qkjwECfpmSSplOecEqwYRV39vxIPezTtbawijhNOfmkDN3oqatmvHdf8Ql3e383s5AeXMpbkO
	f6snDo+zBmjlvnG/JLtO39G/2x94GXwmIlxESblpFnzP4Hwl0lImiHrWP8ILKLJb95tRi18MC2n
	TotQc+r0H+qQF7TuDcEVoYDghFb529QBcb0t7drDKsXll/YT4oszrCkqk6In7/qKHPq9vE/2JmD
	5xBoFFlg/sTRAM6WQ7YPOfGe9AfJMtewExUBpfw6JEYr3qCkqQpULpVQ+oig42DcNYdWbuAem9e
	xpOwqWrZ3/6P+dMIu1fm1RsDN47bv7ssnS1Amt4ib1bf6MPaBGxdHQV0+S1b9pIby/Zn34H8Esc
	5gixic+H5DbG4EUDMCnXa8Xv7Cp4gLhZTprEVesXiL7gI4u3ulmogoxkAq/Xp1vs/Id7axXOmAy
	4mk7ho/HGc/zURxWbgxvMc5U3c98R6L1c+Ny2Ur/LpIU1FphibwYcBxdQg0PvU/QgHoMOOsFIKP
	EvhSllmWKoDXgTlHtKnKUxeHqCnQyuldECJv1Qr61yofmbMxWh1lWyCY0g==
X-Received: by 2002:a05:6000:2312:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-4abab6de675mr21620895f8f.5.1795417320763;
        Sun, 22 Nov 2026 23:02:00 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:02:00 -0800 (PST)
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
Subject: [PATCH v5 6/8] iio: adc: at91_adc: pass struct device to at91_ts_register()
Date: Mon, 23 Nov 2026 09:00:59 +0200
Message-ID: <20261123070101.53868-7-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_070202_582801_70B749BA 
X-CRM114-Status: GOOD (  13.86  )
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

The at91_ts_register() helper only uses its platform_device argument to
obtain the parent struct device.  Pass that device directly and simplify
the function signature and its call site.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 3d9ae99a2ce6..05e8b3deb043 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -925,8 +925,7 @@ static int at91_ts_hw_init(struct iio_dev *idev, u32 adc_clk_khz)
 	return 0;
 }
 
-static int at91_ts_register(struct iio_dev *idev,
-		struct platform_device *pdev)
+static int at91_ts_register(struct iio_dev *idev, struct device *dev)
 {
 	struct at91_adc_state *st = iio_priv(idev);
 	struct input_dev *input;
@@ -940,7 +939,7 @@ static int at91_ts_register(struct iio_dev *idev,
 
 	input->name = DRIVER_NAME;
 	input->id.bustype = BUS_HOST;
-	input->dev.parent = &pdev->dev;
+	input->dev.parent = dev;
 	input->open = atmel_ts_open;
 	input->close = atmel_ts_close;
 
@@ -955,7 +954,7 @@ static int at91_ts_register(struct iio_dev *idev,
 		input_set_abs_params(input, ABS_PRESSURE, 0, 0xffffff, 0, 0);
 	} else {
 		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE) {
-			dev_err(&pdev->dev,
+			dev_err(dev,
 				"This touchscreen controller only support 4 wires\n");
 			ret = -EINVAL;
 			goto err;
@@ -1154,7 +1153,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 			return ret;
 		}
 	} else {
-		ret = at91_ts_register(idev, pdev);
+		ret = at91_ts_register(idev, dev);
 		if (ret)
 			return ret;
 
-- 
2.56.0


