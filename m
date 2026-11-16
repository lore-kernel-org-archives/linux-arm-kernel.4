Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37408606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iwgbsBc4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXOXPtKG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WUxp2BAdKNaxPyxlUG7gwr+X39RWETzd5B6iN9Tnzbo=; b=iwgbsBc4mRktYs
	Fj/lnIE1SavXQqmyKBo078gRWYHjRwQUjkmEniLyExPLPEZmIHg9e2JpZbKXcJZegAtK5dTYDCd4g
	WnCy+brv3549Udp/uThTaFxK6HpyWn1clOC9oQ0H9Et5GlruAzobgGPxQupZB5os1gTQSNmWaCf66
	3Z/jnkcFTMnFP0u61Ld1giTZ/RL5+aVrWhLJggkSaA4mMhP34Ep7flYzFj8im3roNz0IsipPBt3VT
	HqG3MdiYx7R/XOT9LNgqLUk3eYAMXglEepABLQ7hepR9k2hW3NepA2anig2Kxm921kNHhlf7GnbmE
	gkSIvnisV+UovSjsE6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsxC-00000001lQW-3Rve;
	Mon, 16 Nov 2026 09:24:46 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsxB-00000001lP0-0Jxt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:24:46 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso1338443a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 01:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821084; x=1795425884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUxp2BAdKNaxPyxlUG7gwr+X39RWETzd5B6iN9Tnzbo=;
        b=jXOXPtKG2HzgITOP0VxdgLHQD1O3PZPGKtK9zGzfVe0u68ymQEJcmKcRJuYf5bT5yV
         8BaD8HzI/4WuAW0AlUsXOUQQ7koskIGWRRoqwNeNy+pkRtyLytn8EOW5s8WT5yqQMONb
         1UCDRlPA8o4Zl2V55fsSSZEFtmVKpQlCDYinm07KR2e1tyMza2cUlyk0ooD8pet3RIg9
         eWHJYrtXz3A8zLyYjHUCX4fGkvlBXVO9GCZ+8tMkGXgBcxDF2y+K/ZehjeDlMynk3VX6
         sRN3JjzKKYXulgfpwmxVMG3XyVgBr9gkZ08YLqiCCCtvukOjkG7jPYshcIQiHzTI8YEX
         fsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821084; x=1795425884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUxp2BAdKNaxPyxlUG7gwr+X39RWETzd5B6iN9Tnzbo=;
        b=bRi5QL9X4Y+Xh5ILsSjW1xvkDRrC9Ckjqds+zK5htwo347nXKrpXPM90FCZZmZpSa4
         8X3mQfHEPLLaJMDmeTISPBbVyQS1/zomRj/tcjUQh7DJPGecZBuMWykM7d8Sn0uH1H+I
         MuiAcbDrxpILmIVZypYApwbD0OqTmviqnEqD2QL4iR0vlR6ddPzl8wtd3+Maeku8+Wy1
         CO7dZrCyYk/5t4Sm+0fKbQjiFhgSrpHQG9eBVQpMaBXVPAwG8dtCXUKC6xDWpXMJXF7k
         kkyiUHK2SBdE1CESTsYNQ+IPxjLnxrJd+vVWbsTQdkbP1rDtQY+agTwe7mYWbM8xBZTd
         i32A==
X-Forwarded-Encrypted: i=1; AL+hErED36yH3SiHYolErinOe9yjpcTqvMW/JKK6uFi54gliIuIBWXPsFiIle2kB3/eE1pO/QSOON0RqG057K4IdIjWZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/GqteMq5pTpK8WUR93MJy935qM84Hg3xEV6wtP0DyLo0XUA4Pj
	p3cVBW7N1rWauA3J2MZ46Cz2nZEYhsw0xrQSITCtyOz9XLc9vn1bveff
X-Gm-Gg: AZFdTZeljO6yK8RupWxvN0izZRct4IxQasj6ZbIwF+Xr23ZEK9XscpIQCKMIYYb3ELh
	tJOk8fR1VpQNq6nGuNn9Ky44dJ/4wfbYaj3oHTz7z6TinxCWW2OffcynV/xrR8aszhXGI46u/Jy
	cjfwbo/C/Hwhx+anoMqaslPu+bunxVuFMsOMk1qa52TtNZY84dMJ7r/XaKGIAJpwx4jSk1lDXaL
	F4flupcif4s+5FaJoJnLp2LgMzJsJ2fKJrLp5M7JHEpklcJyGbvRCgtCj3GsNDIthNNDNcEXyxB
	ubbJR0Q5MbG6uDt+0DDqyfdaX8fL8NczE937CVoQFOrlSRx4BB7BYUF8X0X4nug2n3nAOhK1NYx
	vFT4++XkqFbsDK8MG2gNPYO86BivPvHfAkJsuGpZg4TPJ4VcUQMJua1vlU5p6rM4eyiLTh43iTL
	fc3UmxpxkfTSPhwCsAnWHYF/0BvlsYi7PN6h0f0r6u+JvslPw7cOMrR6Nrfmdx5279lIN0WRov0
	zCj0a51gbJ/WCZl0eeNAKtPlgf7PAYhYiqfGveTN3CH21ADg+FUgYDe4Ty0QUoNJ1dZHNFIZnFz
	JJUL6vF4eQ251QQHv9EPIg8893C9aW4n6uyzMHP0T6O06HJvEYIz4Vkm1tpO65+jQKQ7rDPDUQY
	tQtJusRu9am8AwgZqjFKDaGsGkZvPTUzDRi6ROxzIZnQJ
X-Received: by 2002:a17:90b:1d03:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b1b0b49f55mr9644834a91.26.1794821084142;
        Mon, 16 Nov 2026 01:24:44 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm15661189a91.10.2026.11.16.01.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:43 -0800 (PST)
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
Subject: [PATCH 3/3] ASoC: atmel: mchp-i2s-mcc: Request IRQ after enabling pclk
Date: Mon, 16 Nov 2026 16:24:06 +0700
Message-ID: <20261116092407.514998-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116092407.514998-1-phucduc.bui@gmail.com>
References: <20261116092407.514998-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_012445_121496_037A2CC8 
X-CRM114-Status: GOOD (  13.59  )
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

Request the IRQ after enabling the peripheral clock to ensure
the clock is available when the interrupt handler accesses
hardware registers.

This also ensures proper resource cleanup ordering, with the
IRQ being released before the clock is disabled.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index fe42a8c2cad3..6a54d3d67e86 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -1059,11 +1059,6 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, mchp_i2s_mcc_interrupt, 0,
-			       dev_name(&pdev->dev), dev);
-	if (err)
-		return err;
-
 	dev->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
@@ -1084,6 +1079,11 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
+	err = devm_request_irq(&pdev->dev, irq, mchp_i2s_mcc_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
 	err = devm_snd_soc_register_component(&pdev->dev,
 					      &mchp_i2s_mcc_component,
 					      &mchp_i2s_mcc_dai, 1);
-- 
2.43.0


