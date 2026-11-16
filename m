Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9E9606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oPJD+NkV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ku/qOqws
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XBl6SSviqpQOksI/O76xGkK2rzDNjLeiKDxI3tZWuYQ=; b=oPJD+NkVOrbMqz
	4BIzSUSv01ElYW0gHSLkNbBnbBc5o8u1PvTqbks9SvLaZrVoICP7khzy8ToYTbEgBBmcttzjEX/Xq
	S8ATXtWFZ0cs/a3ldEkdyu7CbnOGbL9rCW4tzfyRADLwPSyXXixGKvfADfK7NjDyrtwl7Cf6rZck4
	jnnkGgl6IwL4V0OSdbsYEkQJkyRcc1FwrdmFcOu3OGOIqE8ClwmVZNfsR0FTUkSEpQqS3zQSdACG5
	2Pa46OMnv1D9dbjGY9kvyd1vcf6pSUOZq6RR9iMxfYuANvUFRVZAH+HiS4DXVZOcnoWwVJDTIROn8
	O9FFJiyUqlrkZJkJ9Lbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsxC-00000001lQC-31J7;
	Mon, 16 Nov 2026 09:24:46 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsx6-00000001lM6-0b8y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:24:43 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1624720a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 01:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821079; x=1795425879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBl6SSviqpQOksI/O76xGkK2rzDNjLeiKDxI3tZWuYQ=;
        b=Ku/qOqwsisG7RkXWPvNRCS4eN31d2FmYSuhXoHEalxzQhefRZm0qbhY4a7I7QBgRHJ
         z+HcmJa6RjHuLRynYKfJixYyP8NPZnggsQNlEzUksAeEK+kohVcKghC0j0dBlPbM2Fxm
         Ax3p95nWjFGeXaWEt2cdHU5ylbhSeuzcfH2yFFHbKQFZ70xYuGUCvjIS8PUBERSD3hbD
         6/OYdaCn3bZDjaIAORPHdyPog8IggWc51rt0OFgGGbHtCS/8jDqC2hJcuZJPRVIB5pif
         fOtSKpvZnsz4zpHhfsVYoT9C90DZdT9yAGmRrCrSoAFn8E4cTMUUgwIb4BhuwLZpPtLd
         CoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821079; x=1795425879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBl6SSviqpQOksI/O76xGkK2rzDNjLeiKDxI3tZWuYQ=;
        b=dFVg+l0T1n/LMxx16ZDcPZLNz22LVPKpUGsvxnpznxj+RsJui+TS4XwYz/YdJIKS1t
         rs1dTUh5NRhvaUBJlYWL7kwZohaWma3KSBVr6Y4tbVA6HxLgE4NSHOi4H5d3EvhTmC8z
         fryvy6Qwvoll7r40JQku/EcG1H9p7FJPQaf5rKeVlrmkxeb9oKrdxsgFhEZcxwzT6ki6
         5YrRQSj2HhRrN9mlPeowFHiDnOIa/7+UWP8lIAcNcPMTBzD3AqFxoTjGEIOK5Yd2BF36
         KKFhKv2K4QKL64ZgDNPrCws+L5MEE4Oiz5I0i6iJVxtN5akTL3vChvqNXYUiiSBJnMmu
         TmvA==
X-Forwarded-Encrypted: i=1; AL+hErGgcIMxRHMFiXYy56NQWYlfinQO0OPoxvGOhBuSyHegoaiT994c9KIZHwgoNd5BF+aS/VjBevTFBoS0ElCPlLi9@lists.infradead.org
X-Gm-Message-State: APuU4Z8nV9FHRjvKBNW6PxWiC9X9mqVq64eZj9H7JL0piqiZTY3UMTOL
	t9rjYYBr7wwP/gt+xjlr/Bk0eDN2bwvcdH12w4Cc7FVlTbookgeIP5qm
X-Gm-Gg: AZFdTZfD4p4J8RFGNxTK+OUSI9rM0Qee1gIiTZlwrLF3/iCWAIGBLOKjOk9zUn0uWl4
	nVMrjmEIN2N7pVZ6VbAdruwzbldj7WI790+8iHcoA+azTVYAi4ybQ+upGO6PnH8MLUzcxMtA7UW
	BOvEjB27Sb0N91LP9ftpMoX3E1N0k5IkiswfbATry8U/fqdcvSIGK/FNf9pWQetuM7XIm8zv+Yc
	p0mG2tp0lIyBjuEYxO/lLdyFDJBky2P0/YzgqD+lhdngdfZqQsJFxr7SeKoWlA6ZRa7d2dxBcGb
	WLa4r482GM3v0eKQnfgXfcMQy5Lh3EqA/7Jsb4/5nuHEEz4samqNJTuTG1hv1j0oKPM37p29xlU
	4WT1d2aK33r7Nj9zlKD0yZP+OVrg55AizYspe9AmrUHjcvbOkytR/EtihCwbKb9r+NHojOGL0sS
	CrghNXiLl3e9j9Y94lOhJTyZrfsUcY9F1z3wZlWIgVoskV0xATTqXmQRu5U/vfpfdVkKXF8Ju65
	SIUy96/zIxdvd2xdETobTLYT7SiGbhTs7JaT0eYFfpBqMIlrNnROnDHnh/PZP6KHWgIQO0Y1WBe
	OPD3JoS9OBaWnRafGWZ/jjuhhQ3nbk4+FZD/N3slpAOtWA3OsdbF7U6Rrd1Rkz/WZSTxdSRiXy+
	LiYgWfzhetFsMzlj9aGh23/FbCk0UG0YyWiSFhxxJKdsE
X-Received: by 2002:a17:90b:558e:b0:3ac:9ed8:f319 with SMTP id 98e67ed59e1d1-3b1b07fec26mr8956019a91.2.1794821079320;
        Mon, 16 Nov 2026 01:24:39 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm15661189a91.10.2026.11.16.01.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:38 -0800 (PST)
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
Subject: [PATCH 2/3] ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_enabled() for pclk
Date: Mon, 16 Nov 2026 16:24:05 +0700
Message-ID: <20261116092407.514998-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116092407.514998-1-phucduc.bui@gmail.com>
References: <20261116092407.514998-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_012440_185570_DAF45678 
X-CRM114-Status: GOOD (  14.26  )
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

The peripheral clock is enabled once during probe and disabled during
remove. Use devm_clk_get_enabled() to automate clock management and
remove the unnecessary remove callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 9d8043a85782..fe42a8c2cad3 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -1064,13 +1064,10 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		err = PTR_ERR(dev->pclk);
-		dev_err(&pdev->dev,
-			"failed to get the peripheral clock: %d\n", err);
-		return err;
-	}
+	dev->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
+				     "failed to get/enable the peripheral clock\n");
 
 	/* Get the optional generated clock */
 	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
@@ -1087,19 +1084,11 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
-	err = clk_prepare_enable(dev->pclk);
-	if (err) {
-		dev_err(&pdev->dev,
-			"failed to enable the peripheral clock: %d\n", err);
-		return err;
-	}
-
 	err = devm_snd_soc_register_component(&pdev->dev,
 					      &mchp_i2s_mcc_component,
 					      &mchp_i2s_mcc_dai, 1);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register DAI: %d\n", err);
-		clk_disable_unprepare(dev->pclk);
 		return err;
 	}
 
@@ -1109,7 +1098,6 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register PCM: %d\n", err);
-		clk_disable_unprepare(dev->pclk);
 		return err;
 	}
 
@@ -1121,20 +1109,12 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void mchp_i2s_mcc_remove(struct platform_device *pdev)
-{
-	struct mchp_i2s_mcc_dev *dev = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(dev->pclk);
-}
-
 static struct platform_driver mchp_i2s_mcc_driver = {
 	.driver		= {
 		.name	= "mchp_i2s_mcc",
 		.of_match_table	= mchp_i2s_mcc_dt_ids,
 	},
 	.probe		= mchp_i2s_mcc_probe,
-	.remove		= mchp_i2s_mcc_remove,
 };
 module_platform_driver(mchp_i2s_mcc_driver);
 
-- 
2.43.0


