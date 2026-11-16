Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5ED606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 04:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mPJMSRUp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXUPh+FB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ll4WYNWhfbzf2fuFTwBl2v6+pYsK8R5wKGt8sosgi6k=; b=mPJMSRUp59oEwR
	JZwONqmFfbOjQrcCb9IrNc5LaXApdjNDkhmpMd9G1aDQ4ZAoQUq7/svEzQL1qUt66m4u2PUlQ3y3h
	0pD/HEZtwtjA8ZIwtWSjF0IGHZhTZENYeEmX560CFOxWLY+tdG/iVJXbCqyNtaA3l7W0uC2D0W4NN
	gzi9zfiqs2vUOzIHrgELlBijc1OOjdbclhx4I8hc9Tg5IEFJZvCruxSAJg2tYIN9+BtuYzqmSn0fW
	E5vb36tgI5xsQr3tX8OEef82/PSktRv2X/tuOBIB661RSCjQld9b/YHTIvAU+owQ1gcl8PSJy3vAq
	L4214ObcSZPHI/gi0AWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSoJf-000000017mj-0Nul;
	Mon, 16 Nov 2026 04:27:39 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSoJc-000000017l2-0m9I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 04:27:37 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3634409eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 20:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794803255; x=1795408055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll4WYNWhfbzf2fuFTwBl2v6+pYsK8R5wKGt8sosgi6k=;
        b=CXUPh+FBga9SlIgN1oGPjLwuOrbmm7lc3PZjpVSq3PUSU35Dn2rQ2UYfh3Wg8vNXG1
         aJm8i7ZAB/BeqsvjOBt8sXsGxNg7GQzu9u0cr6W/jMnsH4Jmrn9wfw7SWjF5gtvRBVBy
         gtnfqSaSJ8FqAHljvmdfgW4qzLRH3EYLMZd+KpeAbJI+/sr9Du81Q4+2veJ0hW8gNKCG
         P17Jdjbup83Ah7OyhcfdKk4wFEiXNDicKKl8RNwfdpjtUMWgBnu6EipZR0QyXqPlces5
         9DHDVHi4pnlLqowsU9ofmCDyUy/i4sqFIe/0Jr6MdShTaNNjkt8D7PGGYWLls5WwwFFE
         nH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803255; x=1795408055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ll4WYNWhfbzf2fuFTwBl2v6+pYsK8R5wKGt8sosgi6k=;
        b=y/vZ60cSmg7WW2O0SnszrnUZY1VMBwG+wE84O1AUSPzY1SOVZgOt2HQsgD4um3kYgY
         W0anwAbMB5Z7IHYiSqepFYDBWgbApf5+E/J12owKZ1hMs0V+WpT1/9hv1bLRI5JzX0NS
         zb1/mzxEhY7+ZHBDK1lVML+yOUEb0lfjJellO20oN6mWf8m1eQFBxEj5YBHeOCdiyclc
         4Nb56IGNOVY4iblsJLfoBzcD5ONAkv7B0R7Tu6iWJlpWOEJ+BuIVDTzcRqiWxqOF3/LD
         oP3aQjMa7XsjtgL/3ljkBXQNS8GWaShK5rXko2EcNKL924jjnQIjAY38DyUPfUG4riQo
         fDZw==
X-Forwarded-Encrypted: i=1; AL+hErEZLQt+Tb/0pvoUIuGc65K+hQExoTnn9MEbn9dYz72vERkSEODvePvu+SHtv3EcVfpnK2P0MKl0LPc58EZ9rIxF@lists.infradead.org
X-Gm-Message-State: APuU4Z9Sc9eI3w+XadscNhKtau5puEY6WvIUJf93vZ1DfTQQAZOsGNuU
	K3kUWPmTLFBI8m3E14R2Jaob1qj8LyY2oWJE+3QMrdZZZ8i0HscDSdp8
X-Gm-Gg: AYBFou1rAkwOf08s9zYJdi2DCgfbgCPss3JpLGXlK7xcCZmlPkj6h84AotXiqb6l222
	zS3k5am4En6XlwbkvWwLBPXGiKwSgRiKkYYIiPaWMFfPLQmOqMWattHhwfSa9uvgsivaMs7BAed
	R4orxF3CEiVSs8Omcg+Jy6vldXCINTLsvWFbGfcA85QuIxgPaeRcP7FIOWRHZ4qAW7tBX3T+rTJ
	cxgTmN4R1RaR2w9JAaT2BVknZlL5L+gYzkqu2KTCvIwruUcGoiPLejI21ZXrle9XrSbasthOpNg
	R89YTE4ROqF1Lilz/VHbYbePqwUL7WYSM2Rxl9uzAMLTXBTSu2jYM46+Gz0eKhRqsx3mao5uhbQ
	vdh2uK9xB/y1dcrHdpEc2O1NDiJXwq20s3KMiHHJhJ4LUwF2tOeZfuOHzOP69e9Iww4EA+ZfjTz
	p0Y9bh+SJ/rh172J1gyMVYK1o7xyENJ5fhiZkf9vrGXBqmg+OssRC0P+obj3ixbnNnz1cce4JAs
	B5TkpG4vTuocyRv69vGiw6uFL12fypKryAyBkiomgv95nBhTRngDYMNQrllBRuuf7kksf6BvbfS
	bLqba+WtKwbymd0DYrziLOB+SGAa1syZujeK67HeQBHF5oAgGxw5vTbh8u4PTdfN7cCI2iynVBt
	pKNDK70oZ63f3tqRJrX4gIDxY+Hxe+c+JLv/OU5XijF1BZUSFVF9k1t2NZwAPp4zONQQ=
X-Received: by 2002:a05:7300:fb17:b0:36f:6d81:3f99 with SMTP id 5a478bee46e88-3796676fd59mr9490074eec.7.1794803255030;
        Sun, 15 Nov 2026 20:27:35 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm30053500eec.13.2026.11.15.20.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:27:34 -0800 (PST)
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
Subject: [PATCH v2 2/2] ASoC: atmel-classd: Enable pclk during probe
Date: Mon, 16 Nov 2026 11:26:33 +0700
Message-ID: <20261116042633.497423-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116042633.497423-1-phucduc.bui@gmail.com>
References: <20261116042633.497423-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_202736_232494_BF80586F 
X-CRM114-Status: GOOD (  12.69  )
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
index 59490e9effab..4216a28d3371 100644
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


