Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6A4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ha9hnR0D;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zLWgssqc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xtXpCQXpPiOT+irqNFj2LIP62ii+qGz0h1uHq/y51ek=; b=ha9hnR0D2/sxUo
	NtYj1cNY4WFkBllnvDm08vJvAcIm0+skYXYUbjFJYiqDYEUXgzxpe1zqy2W9eIIojelv5W4fiWpia
	U2rXHPwFwUjZ15A2GmNOhcNaLTDTgn2PP5b+3MkENGAfec7yhHO+DrcDJA1TYhZ3KQKaOZzweewQ0
	uo32FC1cY1YcFLj3sBx5Cff7ddDpsGq/XBcPWMZDiDigxD2RzWbQw2KrnFb6YRk5V6Kh21VQl42jw
	U/vXn/FIIZ1l/3ThP+ztQWVrqEu+UctsmIcTzIDT6kV9J6mpHthUEiagwllcBDuwKd+rWbgtaCEsA
	zW2gSOtiZJY/UOQfjsdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzTi-0000000BZFT-0cPK;
	Thu, 19 Nov 2026 10:34:54 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzTa-0000000BZAQ-1KsT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:34:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2e9995ce866so15968885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 02:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084486; x=1795689286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtXpCQXpPiOT+irqNFj2LIP62ii+qGz0h1uHq/y51ek=;
        b=zLWgssqcfurgTctagD/vjH8Byklc4Trl9po/dLphp8xh5CySt8VO4nj9uPX/I3sWp6
         0LeY0RNcKrG6XKX+9vLSizWSSF8Sv/3suL2D/xU2mpkQRZX/uKQ0WqHp4/9+kh4MnaSg
         l3pdVbZ3xn/SOFQd5XgbCmw6Qrplj1pR0WttjPW4ph6ryqR3RCx17H6Ilkii9nCmQRXx
         0JmA6H5eaKcxXo+7+TmV/RwfPtAJ4l2vcj9d6+Dvh5AtZFuZoRbfSKLgGL2QmzQ6zOqR
         GtnRiKe4Xo4rQuVP7h2l+QK+yLmyJy1YrHn64gjwXA230q1AQtgptbxuOvrVgmOyqi8b
         M3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084486; x=1795689286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtXpCQXpPiOT+irqNFj2LIP62ii+qGz0h1uHq/y51ek=;
        b=alStUaBpP33oAZnR1Hc6UDwlzr2yUcC1gG7kp28VGTZTRMbp+gljKANWADCkvOxHZr
         e2lRSbTLCeMVV+ZXvy38+NXS+TRC/lY/CBDwIMrWn7IsEFSWUzIG84YA7T5TlUFyX6w4
         IY/LwVUYwrcg07uEnCukjhZvwGy2/KdiZ4Zy2UWXoHL4aAUYk+ofuLmwoqB2aLr4qEhz
         x1Og2qS6zU+CDPBGGpfAZ68gIzGXi01U/8i3C2tAgRXMkEg0q8etxZJSd3EzOgLam7+2
         rJHj5Q0aJ91ERoQNsz4DE519Vcuhn1eF7hqevJ2tXeNKiXxcI/Hn7khR7uy8xwfVBNxG
         BIkw==
X-Forwarded-Encrypted: i=1; AL+hErFi4q/hWkrPHT7ahJvbyPFOeghLkbinXqJ0u30pGAfOMFdSw/LIZgZCHSHWrATTEAFR28fpu0SkAxmsmgXYdNid@lists.infradead.org
X-Gm-Message-State: APuU4Z9uvRDkzzLzkHItwdlyc5U8waJdcrXcDmrbJaoEtNy6hnZRXjJ1
	qIGgBD5HJ56hOuw+2NdBPSyTBpgdQj3AJkCDc8vLcNY6kJy75Plt/bIeX639Mg==
X-Gm-Gg: AZFdTZcNtEDJAeXBy5ef1+BYVADzjXswJjjNJVH4jli2LW26dOpLontQfqCg8wIoBwl
	SU3JwS+TSPbSOttiRAds6Hr8r9gB/b0dOhwRowhDe5JNjKgjgjG98Pbj7DQqKLMF9qjK0WeBtFk
	yXBwgJECprVsyrk3/ltISHSjacHrkHbVwD5PEgSz0aiCaT22aKgaVgXwhFT1AJ93EvEhQzZJlKW
	DQiQ+26gjZK18iJFAtOVpxT7OCOQY+pg+YXeZLMnbfgQdy/9KcqTfYUhQ2PDQ1ISryiqatpCFNM
	cLDKfAL2S5TEta9xDnYwEJKIz73c2xEm69FlIWiAS9FyGfM7ntoOxgb2oXsktXA9VzvTcy1GklA
	cWwVonG44xGkXScGgeYK3S2Ay+H1SM3+Dw+hokPldQS3yFuzkOX1qZNkMZiy9hI+x1hqAywk2nm
	/1/cVzbFOqtvzaMkQF+HI4JWiWPFSko0Sfz7Hzijo5BlOaWm6Ix5xnuC3KEQbwbgE8UXb1LPB+a
	mKI26bUx4oX1CnNP5geIx9Ze7bQENie7iWzHj3vPw6DwbNtT2y4O/KPeSm58+uEhL+PQVcfYsw6
	aTSD4r9Dy9RiAY24jaQUuHsJlPhOT+O8Jyyq4RGwl23FLTSFu36K0ilpvgKQhrR1vykgp96qsBR
	6S9WVnlSS04IsH/+VaD21CeW8t48EGnRl4AMKlfgrNzWbH635S6SQ+yxC+0nQRHyiyQ==
X-Received: by 2002:a17:903:2406:b0:2ed:15af:d38c with SMTP id d9443c01a7336-2eff720e4ccmr54759955ad.4.1795084485616;
        Thu, 19 Nov 2026 02:34:45 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:45 -0800 (PST)
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
Subject: [PATCH 3/4] ASoC: atmel: mchp-spdifrx: Move IRQ request after runtime PM setup
Date: Thu, 19 Nov 2026 17:34:12 +0700
Message-ID: <20261119103413.31729-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119103413.31729-1-phucduc.bui@gmail.com>
References: <20261119103413.31729-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_023446_388953_5CF091B9 
X-CRM114-Status: GOOD (  14.05  )
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

Move devm_request_irq() after runtime PM setup to ensure the IRQ is
released before the runtime suspend action runs during cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 25122f6ef3c9..41c65e835765 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -1113,16 +1113,11 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* Request IRQ. */
+	/* Get IRQ. */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, mchp_spdif_interrupt, 0,
-			       dev_name(&pdev->dev), dev);
-	if (err)
-		return err;
-
 	/* Get the peripheral clock */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
@@ -1168,6 +1163,12 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Request IRQ. */
+	err = devm_request_irq(&pdev->dev, irq, mchp_spdif_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
 	dev->capture.addr	= (dma_addr_t)mem->start + SPDIFRX_RHR;
 	dev->capture.maxburst	= 1;
 
-- 
2.43.0


