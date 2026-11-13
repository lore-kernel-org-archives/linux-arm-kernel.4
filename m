Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3A0606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C1zp/eij;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIg8ETDX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Mb8tlnodrofCrSAqZEvoJQbBu1LG0AIHx4hhl5dhBKA=; b=C1zp/eijeh8kJi
	9xTz+WM5U4mWQRbkhcb0TLK3qS7dztnXMChO+S3eBJKHiFFk3Cy95KjVk9x19ui2em0gCR5oeaQsS
	UAxGn56EtzfVdo/jR9SvSREMzRoj0+NRfb63RDg32maL9rVqHuSvHUjXaI+TZ5G9s0WoEP6z7F7Dh
	VdaMEkYt98WV5GnXLbBBY1I5CSio+a/P78yGRp/DeJYVWbSY8Q8WQ3tZBffH4XqstW6gZx4hdNCNd
	6Am1HDOA2f5dJC86xZN3FNVo/Ww1XUDhJln0A94aTLEZ8PYF+M/2Jr5MFXcSPTHWZqRkRG0DXGZ8T
	Q/cIeEXzIHDfL5vhJXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRofW-0000000COQw-2zvS;
	Fri, 13 Nov 2026 10:38:06 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRofU-0000000COQN-3H2g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:38:06 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1000310a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566284; x=1795171084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mb8tlnodrofCrSAqZEvoJQbBu1LG0AIHx4hhl5dhBKA=;
        b=WIg8ETDXqa0uaj0EEC80gAxUJyhnuvDV1deLR5SwxAmJYLoAcw9t8JKCO33ykxahau
         1LjwIFn8t3SvX7ZNDq1QAowNnkMQ0BpeicI7n6D1+KsR8Ecrujk9/bsNTKGVYhWlvfJR
         V+rFNTyjAKeNHR8b4E0y/pdaIQY+XYv926cwiEOR9VC76yo4g5k8OAxgb0QMqRrVtvj+
         EnD4lesxi40T9DNIKaf6XfQ1uO8ExNMaG3BLaxnDuOTaBVyGPyOliyGydeyrggNsfDG9
         gXk8T7f+aWygs9Di29tL3pjqUfp0yeulER+m6z7p9/Ra2XgNfIPiLAQq+Mnc8YRW1ish
         A7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566284; x=1795171084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mb8tlnodrofCrSAqZEvoJQbBu1LG0AIHx4hhl5dhBKA=;
        b=eAXDu8b4X9hFDYYkZOwR+CFOR1n9KK6dGySyA6XSoMxD/HGwjvFG2xCrWBnqG63XED
         krPEDrS44unWHHbxhxWMySwq1CDanBmzY53SzFVXovyGNu/ekNWetZ3QOazvgaqo/YLW
         n7Aw7LcCMp7/h50se+ftY30bv0KQ06we1HbWScEACljtGY6roIKpbFdM7HlxoZo/SpNF
         XiyDP8WqT8n4IsWl2ySP7ClrQ7KNZhOBSZQl/laV/4sgkz5cBeu6ttNMh9vJNiYrdVBG
         h3EJFCfD5i4xuIWZL5wI+Lx50gsMxQP4qZIN3xsMuixADMYcFxUP6OqiQKO+T7v/iYaj
         fqQg==
X-Forwarded-Encrypted: i=1; AL+hErGiyrI2XU516Pxh8SjZYfLcyRDdGtJxdQQBKkljxI+IqPOzikD0iyEpJWnVebZhiRDc8Xa12Z+7KwdQZNVy+BOL@lists.infradead.org
X-Gm-Message-State: APuU4Z9R7zeXrI3G2JRG4D7H4kWV5O/b9u8Vose+Q6CwyLOOz3eRpk9l
	S6BghOn9/11YER65NRLggp1WvONUQaO0VxUBseCINTEg3JnNbKFzyf3K
X-Gm-Gg: AYBFou1zBqcxE6E2O3EC7n6AzmzXq6D5s8+Ul+Wzjlx4wyqlv83bZUsfg8DfJS+JTGm
	3YLz7Z981IMJnI+tRuwWuuFPwvENdzyWO5+ccYnCwcRB7+oc5BBaZqs0GfEQu4VFblxWdwYw7gS
	n5+/HXgEkN4+CoLDiv4xFy9GrUD17qN9DOYgQKcQAJPrWFJrpgzqnpiRb/UdUwGxLaQqBWq1TZJ
	3/F1n+YVT/hnIujEl00EDjTleC9CAf/PU4+ht++BHCfb4Oze4T8EBYu3+3GNshIguac/2n5WtCb
	MI8XteMFcjwXaR5rbn19zQgkb+zY1L6whQp50xGkLolEBc4VjTTROT/Cs0h/7y9REhTwrBRUr5c
	5jlK63x0BwYVrCxuJNsTCGLuc6u3Wec79UyuW5kvjf084cXRSJ50S7TL4zamF6RCHSk8ScO05lf
	t2AM2fuRSxzYT3QbX2W6dz+OYxFFEUmA1Y3h4oNw0MC5a06vQkd9xydTKxdMtLJEBgnrUZU8npv
	85iEnfqVZa1k1z8wL7DMy2k4lR1Bv2FpaThd5A6Ev19E0pVBYNZtG6a0P6IGjb7MBN3iGtAk/zD
	+1v6QRnBmgSz3NZuTNVnUW56gZqNDCRDKF2wn6I5jRuqQm7yQh7TTOw1YEhhcy/MsoQAvj5ouG/
	FIFkT9mzP8/7wxZMfyHCBr58jL1RqbV7UaEVYC3oTdXTy
X-Received: by 2002:a05:6a21:687:b0:3e0:d032:31c3 with SMTP id adf61e73a8af0-3f7a7ac97ebmr1933929637.46.1794566283860;
        Fri, 13 Nov 2026 02:38:03 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm890955b3a.10.2026.11.13.02.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:38:02 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: atmel-classd: Enable pclk during probe
Date: Fri, 13 Nov 2026 17:37:27 +0700
Message-ID: <20261113103727.30449-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113103727.30449-1-phucduc.bui@gmail.com>
References: <20261113103727.30449-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_023804_828942_4EF7F954 
X-CRM114-Status: GOOD (  12.78  )
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

The peripheral clock is enabled in the startup callback but never
disabled, causing its enable reference count to increase on each
startup and preventing the clock from being gated.

Use devm_clk_get_enabled() to enable pclk once during probe and
automatically disable it on device removal.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-classd.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 117c8e400184..b6d815804e33 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -122,19 +122,10 @@ static int atmel_classd_cpu_dai_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
-	int err;
 
 	regmap_write(dd->regmap, CLASSD_THR, 0x0);
 
-	err = clk_prepare_enable(dd->pclk);
-	if (err)
-		return err;
-	err = clk_prepare_enable(dd->gclk);
-	if (err) {
-		clk_disable_unprepare(dd->pclk);
-		return err;
-	}
-	return 0;
+	return clk_prepare_enable(dd->gclk);
 }
 
 /* platform */
@@ -546,10 +537,10 @@ static int atmel_classd_probe(struct platform_device *pdev)
 	if (dd->irq < 0)
 		return dd->irq;
 
-	dd->pclk = devm_clk_get(dev, "pclk");
+	dd->pclk = devm_clk_get_enabled(dev, "pclk");
 	if (IS_ERR(dd->pclk))
 		return dev_err_probe(dev, PTR_ERR(dd->pclk),
-				     "failed to get peripheral clock\n");
+				     "failed to get/enable peripheral clock\n");
 
 	dd->gclk = devm_clk_get(dev, "gclk");
 	if (IS_ERR(dd->gclk))
-- 
2.43.0


