Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847A9606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p0F2kNLu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cSEUQoLD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P3CbdVECzHkNah5hBh+CX5V1muidzZFJcZgyMPPIoGM=; b=p0F2kNLunKU250
	0YPAVaJTqa92rwADVdfEqBWkqXsMLnrAFagYIGk1Jo/8bfj5UnywGG9Azid/l5F5OfgtGnhLvKp+Q
	GPTuNiGUZkAtNVIJw9mCpYZHCX0BccEGAkLK+nqH3qyvgcHrvTkoQgFA/OhVhQ4YPsZP6YD7PuVjU
	V3M/WQXvNq8NgSoFPP74bpYCR/DP7qAelskUotWDGnrrooIHrbOBBPBZ5LJhmqzXbo/0JrSxDtXBa
	kaAKLzM+jeCIEc97E9M2246BWQMYF9eFI1LF6sabb/0fmE/B8DA1UNLrlVHlyhNo3yTAifkKAzUtZ
	cjEjc/elr/sVromtNrKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULAT-0000000EV4M-2CfH;
	Fri, 20 Nov 2026 09:44:29 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULAK-0000000EV21-43DI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:44:22 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-382c3c9671fso945109eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 01:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167860; x=1795772660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3CbdVECzHkNah5hBh+CX5V1muidzZFJcZgyMPPIoGM=;
        b=cSEUQoLDTM3xdxKU29PooBteoTVlwN5EtQIvueqxaZE9P4DdLgG/7jPhbEAlAtUgTL
         0bp0yqFgKXumZGyiOX7LbcZVU4973H499eCf/ot4YvGr0Mdoiyxrfcfh9Qhz9SCe/Nza
         LmYUsbCs6FdrOwAEDV2/3OCovmSQ7zMNDv8U73+a6667Su+ShVNcgPHIHWUPXJAvqma1
         LQ1cr9gkcR1KKahsP8n8A0VSeDzEu4CvbT0f9FGdcHZGaOqYxYU7l7IPZm8aXWepx7e7
         6mwSgKfNtDtTPYDtUQ/d1CNzSESpc5HfZo3zKAr7qZ4iUIX6+E4oREblBeyRXQ62cyAH
         QNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167860; x=1795772660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3CbdVECzHkNah5hBh+CX5V1muidzZFJcZgyMPPIoGM=;
        b=HwLef7PHtraF2+NHq9ALHWvrk+B+Si7/rirZxgGcbRr7oQgWohXxPUQcA838SQeWRA
         wAilhf0qSmfhAEDGbfysk6flDX66+hSzNhyOlrBUSxFczGhhVIHZMwqnd5T4XP8ILVUT
         XxMvGxMQ8NcArhOT7bOpKI7AeBgKEK2ZZ0ZHgxjn5LCDHZAVbfm2K/3fHdhqCQ52mpBa
         nBLe4F5nrCVMDkd/p+a8tGFhzjzrkkJblAZcVLBlU8y1JMCGqs2U7cLsKxobdrpYvPEw
         2wavbJ7knPBITWi5zOSGG/98tJz2sykOyoKtAZq4iUA5X3u+MpKXSwrqABA50GzCyLzg
         bYAQ==
X-Forwarded-Encrypted: i=1; AL+hErGL/56rDJLcBEX7Bonu6vBylr7NEQf7ko4jSlq4qPV0XFRVDnkuGk/zYXqd6gHxBTkLqaZ/gfMTFhKHL8vLjyi0@lists.infradead.org
X-Gm-Message-State: APuU4Z+2LEg3zH/ImcbZfNEkLJ9twqmgUaF+fE84Cn3/ip/019kcArj1
	rv2JxxqLQ+9U+LYyMQrZ/zbLD90vqeHu1Fkv/sh6LGQGJG+KqYUNEGC3
X-Gm-Gg: AZFdTZcKIglg5UrMFXreiJ1V7rwBZF58YFLCMxJKjzHYGDFr0F5SKrm2cx9IrgaNjch
	geAiVOV8IvMs+XcsoS5tMposIKM4Jc886/iyzSpaUB98YYyiUsTABodKpllc/0NJFMttdznRj3I
	IKFkF434+mevRJd0Q8IZeOeoqTZ6rnoXjX5XQj/wdb8c/ofrKmDq3OZHZ6lpPi2qtZgOMtZ/42o
	5uY8OlM8SfidDo5aZ2eH0wUUNk5M60K2f4CouPaYWX3O0TmBhvM4dQfNUGSZ4TJR04o7H0dj8d8
	H2wAkjwRknIVgAs4E2Umr2uJPonEu7FboZYCUeVW6uZawR8ESVxkBDUq0uXtvm8YfyxI+xXS4W3
	RYDg1jZXG/UuJY1op+AoW0Y70trZqsSsi/rJhWHp6V2cllr9M2/KNVkQmezVgWLMsAactX6TW1F
	7vLd3PPZMtfW0W383QZCkdAVoL++eW/aaJxJvKAzTZT8sYoxJKdW80wFHGTBwW8z5cVXIiqAS5e
	XlpBOhoPdsQs7cewv3858QJyKYR5JBbVOVszQUltg0Lql53olg2pRqRYl2qfpe5JClci+hZCncq
	DJg/IOqdod2pN2fjuKEg+zyJ8CxEYqvJ3vScTcPICAHoWDTfmiJJWW6r4Q64v5/SMOu7kF4lsno
	TPcpRThiq2Wor0Y+/Eok+dmRA/12AEVtJO8KIv8x+Vl0N
X-Received: by 2002:a05:7301:a0d:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-38570847a85mr2483136eec.33.1795167859917;
        Fri, 20 Nov 2026 01:44:19 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3982974eec.13.2026.11.20.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:44:19 -0800 (PST)
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
Subject: [PATCH 1/3] ASoC: atmel: mchp-spdiftx: Improve probe error handling
Date: Fri, 20 Nov 2026 16:43:52 +0700
Message-ID: <20261120094354.6814-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120094354.6814-1-phucduc.bui@gmail.com>
References: <20261120094354.6814-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_014421_010755_98F7A75E 
X-CRM114-Status: GOOD (  10.68  )
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

Use dev_err_probe() when retrieving clocks to avoid logging errors
for deferred probes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index fc635ed6856e..6ab32f0b8b8e 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -815,21 +815,15 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 
 	/* Get the peripheral clock */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		err = PTR_ERR(dev->pclk);
-		dev_err(&pdev->dev,
-			"failed to get the peripheral clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
+				     "failed to get the peripheral clock\n");
 
 	/* Get the generic clock */
 	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
-	if (IS_ERR(dev->gclk)) {
-		err = PTR_ERR(dev->gclk);
-		dev_err(&pdev->dev,
-			"failed to get the PMC generic clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(dev->gclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->gclk),
+				     "failed to get the PMC generic clock\n");
 
 	ctrl = &dev->control;
 	spin_lock_init(&ctrl->lock);
-- 
2.43.0


