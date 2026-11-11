Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA90606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 04:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AwkQLgbL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06kpRKki
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FlI97Kbc5IzIm3OlbOAAkvy4qx91Md/wmJY6Baz+hNI=; b=AwkQLgbLU2N/M6xplqXj5RJOJB
	rvBy2gVRbllF9LKRj9Zr/WHsSCl/HOd6DZYNIFwQUWV+2vVnIMOGpcbWY4LStBSkOBblNQ82aNSVn
	f9lh8WV5T0C8QxlGmL8f9WyuiM6Z0cvV4+A98yioCRB8sxA20VEuizIbjbYQ2orj9luWPt+HnPpci
	XfZeAYxEhrtzR7ITVyBUil1ywqdrK9HTFLxdSn1/dz4fN5uoge5BJHEZ5XnWkNoScYeaRMAxmmvx1
	nckm3hs6QWkCQ2tMBXDu16w4IG3c2XbHVJiQsbPdekQD+M3Ojq1bS2fnMUDbjv0F6t9sP6rxvqdUZ
	LFow9mSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzwQ-00000005c9l-4BnE;
	Wed, 11 Nov 2026 04:28:11 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzwO-00000005c9R-37LU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 04:28:10 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3712b6d9843so2642691eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 20:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371288; x=1794976088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlI97Kbc5IzIm3OlbOAAkvy4qx91Md/wmJY6Baz+hNI=;
        b=06kpRKkiUra/v2lYOa2gpd+HDzN+93bDR+amt+ZNuBiNgo/CCcybgr2wQhI4QE3gI/
         DJxW61HShRynEx8xnAvS233ymhAAGuqh7lInek4i3VL8S3yJmGdH13FBL6nFPfwiaTAk
         ZftdV73b+CChcRh9Q6P46SrCZqzQpM0YYiHkIMkW8g2GpYLRsHwJ+FPT/fmlrDDqyRxC
         UJQOd9KRL1/9ZgWn6QzKQpCHtJqNxyWWSLURf64Se71XxIyRSMStOSMg28wVcDfXou5z
         9nWn36nVK9hc6pfieqgcFzKOhCzHdY8zApERUVB5KgoJO6SqLTZC2xCwHwDnDnjv65wd
         W1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371288; x=1794976088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlI97Kbc5IzIm3OlbOAAkvy4qx91Md/wmJY6Baz+hNI=;
        b=wXRmRVZQvusGTuH/DqwGx5GT6NsYwAPZBYH0cmYX4xEI+PQ81O8JxlkXUl5nnORMT2
         7Scm3HmFiq0j9nRMrVJZCjdC0K1mOdLn8wjCZM9A8J2mDfvDXT9uKNWO+je2wySMh4S+
         Jly6pvkLVQsY7Hq1kxHUGjgsGoD1sxF5lNm2F9LnO1Psj424idcwoNZkhacIdl8Fx40J
         UG+HvKRymlIS0nMGxmv6nlOykNApPaZv2Ji2BliEjgn45zHI0w1w2JJqisCG40hF6tlz
         Sy1XCE2xtphd2fQ4qIu2pSv9bgSsQNXgdELoYq9a88JPd+Tg8vfs9VwVDmQ+fK+SoVzL
         hx1Q==
X-Forwarded-Encrypted: i=1; AL+hErFA21hQ6oSfiF6vAYnVDNcYaN9wULwNkXgCTQeGFYzRT+EOeLrq0mTPjC9e/hyGT6P8ZO/gR9Mu3mlG8bqzdLA9@lists.infradead.org
X-Gm-Message-State: APuU4Z/z9h6I059A6QkFt/Bd+GWgSDIc3jpCMpI6U7HIHep6az1JkIIG
	wuwR5obiDPCFeu5yg8k6/LTO0a6DRTP6Dy1s/agcs+GElTVnfLL6jkm7
X-Gm-Gg: AYBFou3JTTedn70veZQskdBOinmJ6DTyArheCpmwpLEpfmdaLiE6wOui+jQyBjUX97V
	Chbl2jKhDhIpDqhy08TMRJYAzrZ3utT3UgTslBcp5+3ZkB/PQlE+TdOV1nyhfYNIAvH1oSoss72
	CHNHUE8+1zY+6vKcPKt/vYZlEBQ2NfzRFhfDLw0HRznVHcL8enUbaZ62vQF1fXCzIE/n+aLOTKg
	spONWJwc8udiS3GVCsfRyRKkTElBA6jNTWxH6wDLeTw2BMFi+hngZp5qJDzvFHUsoHgLbDK/6+b
	NWHymgWD7qQdT2gMTPkCbNOvUWvChYy4QeTS70SO26I2S8GsjPKywubejQodOGd+vPOc66/2KDR
	ZyRlWNo/UnlDLtwc3LX4xcn6873yxO0jt8Yo5zEG8U19ey9YIRh64arqFPr3MbBiTUpiiOWGgzJ
	eWrRReZLYm6rzOGLFmhBeLyztpdL+ZAgRxDvwzA+Wh4fHK5iG8SdvDWAgsPCjUJIeL/63fNWK00
	haD8ddBGVEhPJ1IEa33q6ACZ8u36UWfDiPAQY3c99fCX6r/WcZVfwvp/EdtcCJlxLe05tVBaJwr
	6Q1RePpCyR4o5Dq+2ymfjmhGVlkMpKI6ozQUaTKq/UIrCdOgV0ioBWlspWjYN3YbPiKpi/kiRHm
	edspLUFT1dZddX8ACii8K4NbiEgscmPZ9DgUyIWojA+m4
X-Received: by 2002:a05:7301:d80f:20b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-37685a83893mr2193123eec.6.1794371287541;
        Tue, 10 Nov 2026 20:28:07 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm11132090eec.28.2026.11.10.20.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:28:07 -0800 (PST)
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
Subject: [PATCH] ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
Date: Wed, 11 Nov 2026 11:27:46 +0700
Message-ID: <20261111042746.14714-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_202808_826942_5F9BA30E 
X-CRM114-Status: GOOD (  15.06  )
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

This also removes the need for manual clock disable handling
on probe failures and in the remove callback, as the devm API
automatically handles clock cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index e1d8af056234..a3aeb8e607f6 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -660,8 +660,8 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	/* Get the peripheral clock. */
-	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
+	/* Get and enable the peripheral clock. */
+	dev->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
 				     "failed to get the peripheral clock\n");
@@ -682,11 +682,6 @@ static int atmel_i2s_probe(struct platform_device *pdev)
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
@@ -698,10 +693,8 @@ static int atmel_i2s_probe(struct platform_device *pdev)
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
@@ -712,28 +705,18 @@ static int atmel_i2s_probe(struct platform_device *pdev)
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


