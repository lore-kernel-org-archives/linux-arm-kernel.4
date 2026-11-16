Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6DF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 04:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xF+mH52P;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wq+lxX3v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L+vPKyAW8x8lk/lFIW4uRVkXgnzau8sRMCBsKJVkefc=; b=xF+mH52PdZyNYJ
	lloRehF3GG9PX9s2NxVkuq0htsHzRcN41menZq7IJvLYAbJjpSOBRjqVZp2CDGV9C+KfOAzZOWMx6
	JHJ2fJZ22GigdT9QCKCusUakM2w5UYj9mXi6MtMEAUYO7cS3ez3Lk+o30jc8JTsC0HuPBLMF7868T
	Zah+OQ+QtFufHNRMcqicZ3gnZOB0DVSvdI/XMrF4DGrOAyhcHo9ofumXS8YiTKdb+vc2J/ZchH0nu
	TETYzfEy3PjKys/PMfT4exFQjY+B/Y0L345zPvh+2lH0FZKsQtGI171xLag/hzFzel52R6Pe/zDw9
	PrkoDS/LKVcf3psmWMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSoJY-000000017jc-3sYE;
	Mon, 16 Nov 2026 04:27:32 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSoJW-000000017j0-26wV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 04:27:31 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-36f8cdd30beso4441528eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 20:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794803250; x=1795408050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+vPKyAW8x8lk/lFIW4uRVkXgnzau8sRMCBsKJVkefc=;
        b=wq+lxX3vrzAnKAyCtMDU2hVX9idZLHXwqRGoCBddaX1YdxOQgZVhFpr4SVAvuyhhao
         mOkZHuZmGAOelrB9orxv7qv/GFdyhbV4FlfJJMBczTgo6weEkd1xBWbkIFMka37vqOqQ
         d+3eRX92cvt0aWhlj3pXbHt0d722ffr4M9RiliSmtkyTRhNV8kdlzr8smCZYEaOvyNFP
         uafQolwg3Qf0nSDJlSzp85rJMnFGB5stiKZp9tIILIOVjjZduiXC13KhYbU9wG5k+9R/
         5hOn23oYMuPAkPUArbdlp8qp7UHrGidFXL/aHmDMcp0xxWaoy9cbMElrVoRehWV9wMtS
         6Eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803250; x=1795408050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+vPKyAW8x8lk/lFIW4uRVkXgnzau8sRMCBsKJVkefc=;
        b=CgqdopUQsTy42z8/QRXMujboeSD7zOx2tXkBBzWuil0ahb4v0yHFBz+NmkXniEnXQt
         xFlutOHaVOTx3Q3pVpLDcb1uf1NQ11rZl7glIbiJIg/zVlKFmE1T9ceC8Vyh9K/X6yLr
         kmy7A7JdtA82ky+Bfd8RDUOOQugSU7nkxuO3ul4gc4wa3dj1roaCG7HqVRmSDXz3X1L3
         AYytW2UBJEqagTJy4v8az0GcUNjpxS3qg14Px1GORErK2TbDds4DYml9UX0kELz6sSHF
         KmxOIhTPpAc85WZ00jX8L1zSVFQBla1BnNH5OjC1CMIjanAvnE5P7Rfce1jdrWBMNGKO
         X7vA==
X-Forwarded-Encrypted: i=1; AL+hErEypfIAdZD8it+u3t09wd6UrxPSeBuNQ+8WZLxwvwYTK+FtQNFXmQhSj0e6Isp4hYNfVYLrym6V4SQVokcCrISb@lists.infradead.org
X-Gm-Message-State: APuU4Z+wRaoD70AAxkJClJpq0gt7MPBbHZWthBepplRDHspZfthJDhiF
	T3mpwGmFseph80PrpZDVrabDhh8j53taqU1w8ITCR2nch1bPDjRjj6m6
X-Gm-Gg: AYBFou0Gap7n9VYVwJ0JNmqprp8KT1s4ZL1/iNPHq0gI4RjnP88kSzcX6h2qfdp2WAt
	JBZNJ1mlmfbcEM1Ln5WT49upx8B3eT9rCgP+06K28Eq3lVO1S9V+kgGSf0kOA5cfgSgX+4ynzac
	+/v03pS6UMDvm0RVXqT7f9L4RxCVFb4V7aW71OwH2I7sizAvQc+Cb6dVRRCmSnKHTYheO3/C7Vs
	nCmVPPnRptAZSOvzqTKuc9DQlQy9gm9XGfRLUQmq/P1b4YMKyDJMX3tOAtG9gGNdeTCn8SUt/rE
	YzYslqv4oVRPji7U6JEEpLq5O4SFkcEBN0JwACkqEHMG6HCz1gVfC8UjwXENVcRaAw4FwbF+JX3
	QEEPrq9n6MuiCgFXzEOZ32SRzUypiRrcwYwv4bKkJqoZX8nnWoA5/dkTlwKqxvMw/nXhGQgGHOL
	zo3iMAI0QNerFVtf7XVoSAqys6GtNl7T2KMlsonhVEw3saz1snZvgzJaw6doF6FW1NDLFd4QiMq
	gc5tQbWAhjwHs0iP7n7Kze8knv+G/KnodqFdYJGWpcXEHRDa4eTgiAXuK44iFWBq0mYFj5iX3SP
	Wp7iwOhzNB2Y2kejNhUOjddZEAGYZm1q2yvYxbaZLFJZx4yOfqTv8toLChHfLTbKnsMWSgyX/Uh
	nvTg8qQ62nUQP/X5iPjtEcOXJ4yrLqp4W+0NA3rlKRGpN
X-Received: by 2002:a05:7300:d584:b0:36f:3da8:dbc8 with SMTP id 5a478bee46e88-379679dfadamr9965275eec.31.1794803249582;
        Sun, 15 Nov 2026 20:27:29 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm30053500eec.13.2026.11.15.20.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:27:29 -0800 (PST)
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
Subject: [PATCH v2 1/2] ASoC: atmel-classd: Simplify probe error handling
Date: Mon, 16 Nov 2026 11:26:32 +0700
Message-ID: <20261116042633.497423-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116042633.497423-1-phucduc.bui@gmail.com>
References: <20261116042633.497423-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_202730_565474_CB7729AC 
X-CRM114-Status: GOOD (  12.87  )
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

Use dev_err_probe() for clock acquisition and regmap initialization
to suppress probe deferral logs and simplify error handling.

Also remove the unnecessary cleanup label, as all resources are
managed by devm.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2:
 - Use dev_err_probe() for devm_regmap_init_mmio() error handling.

 sound/soc/atmel/atmel-classd.c | 37 ++++++++++++----------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 746e6bbbf423..59490e9effab 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -547,18 +547,14 @@ static int atmel_classd_probe(struct platform_device *pdev)
 		return dd->irq;
 
 	dd->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(dd->pclk)) {
-		ret = PTR_ERR(dd->pclk);
-		dev_err(dev, "failed to get peripheral clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->pclk))
+		return dev_err_probe(dev, PTR_ERR(dd->pclk),
+				     "failed to get peripheral clock\n");
 
 	dd->gclk = devm_clk_get(dev, "gclk");
-	if (IS_ERR(dd->gclk)) {
-		ret = PTR_ERR(dd->gclk);
-		dev_err(dev, "failed to get GCK clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->gclk))
+		return dev_err_probe(dev, PTR_ERR(dd->gclk),
+				     "failed to get GCK clock\n");
 
 	io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(io_base))
@@ -569,11 +565,9 @@ static int atmel_classd_probe(struct platform_device *pdev)
 
 	dd->regmap = devm_regmap_init_mmio(dev, io_base,
 					&atmel_classd_regmap_config);
-	if (IS_ERR(dd->regmap)) {
-		ret = PTR_ERR(dd->regmap);
-		dev_err(dev, "failed to init register map: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->regmap))
+		return dev_err_probe(dev, PTR_ERR(dd->regmap),
+				     "failed to init register map\n");
 
 	ret = devm_snd_soc_register_component(dev,
 					&atmel_classd_cpu_dai_component,
@@ -593,29 +587,24 @@ static int atmel_classd_probe(struct platform_device *pdev)
 
 	/* register sound card */
 	card = devm_kzalloc_obj(dev, *card);
-	if (!card) {
-		ret = -ENOMEM;
-		goto unregister_codec;
-	}
+	if (!card)
+		return -ENOMEM;
 
 	snd_soc_card_set_drvdata(card, dd);
 
 	ret = atmel_classd_asoc_card_init(dev, card);
 	if (ret) {
 		dev_err(dev, "failed to init sound card\n");
-		goto unregister_codec;
+		return ret;
 	}
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret) {
 		dev_err(dev, "failed to register sound card: %d\n", ret);
-		goto unregister_codec;
+		return ret;
 	}
 
 	return 0;
-
-unregister_codec:
-	return ret;
 }
 
 static struct platform_driver atmel_classd_driver = {
-- 
2.43.0


