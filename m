Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBE4606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=slgVRPZQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbWb19XZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gc0YH7tul+j0foN+otRZFbZgrVsjLkGsvyOuJz0JIG8=; b=slgVRPZQHy17EB
	Jhr04dTH0m8Yt8ovz/yVWzdMCEbCBTGRZ7vi94RWPLj5HSZtB5HryompnKA1F3TKVX6wiA5BQ1KXE
	BnNUwnrUfXGIVlni07m0vWto+ZhJ14q/9XyCcQ9x9lu1WNC/72QDDTVfFt43JRp87YiL3Ij8p6DXx
	gSwRmYAs1bt/vVEKtF/gaM5PxgZmNlPQ+83lU2NLQESeRXMtj+wleH7tElXp4Z5Pd3oL2REoBjaQt
	mUtxpOZEcxXXgaMu58DxppFE7iKPljK2KTzZoeemyLlMuld91Nxf9r2sfi5w1srcxOwxeBSnH8NEF
	0FbSOuscMHa5uNFShgVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULAh-0000000EVA9-30UV;
	Fri, 20 Nov 2026 09:44:43 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULAV-0000000EV5K-0Eyq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:44:32 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-3863db981d4so206067eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 01:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167870; x=1795772670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gc0YH7tul+j0foN+otRZFbZgrVsjLkGsvyOuJz0JIG8=;
        b=gbWb19XZREZq45YZrAstkkO4Lf76fJ9cRrD53sesZJcUXx2BFMwErD1dm3it3GtVMF
         LkohHnTxJsXIgKRYY429waPoomN2VCfjsU+7rzqEALLi8D/8nY1VvpKrMw0gzgAIfYNu
         jmqeP/UesifNWMO5Co8H71JK4ivb8jWHrY4+oha5bBzx4OST9rOhr2p8t2jR4J6bKs6l
         esQ05iJfrr1ujvjqkvUs9/RypBUhjFwpmQLXiolYjl0ZoxAJM0BqXWHQpkdp8p2rQ7nL
         PHoXpdi3zu00tsSOTRgPiHR25n8XbXKD9hxFxM+ZSTBd+NJbBpSyRGgsPEp9CSLwGet+
         vVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167870; x=1795772670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gc0YH7tul+j0foN+otRZFbZgrVsjLkGsvyOuJz0JIG8=;
        b=L510mCXXhbOxymUz28NJhDlcLp0T2zjFTPn9Ak/kMnz89IbEP3XQdjmFBBybRaW7Gm
         BiJHUTDDA2G5ygFBlwA/yYhyyi24kGUzwArO3ikcydOWq4AYl3qHNrHARPbfJY06Kxn9
         c1mfxFAkeqHjcCM87gxIYcNg0eejWE/n15hHI1zECP7yU6aPOSpMiVHnyUbcmzPHT6Ps
         91YQt/Z2Ez+UoRBCpytxqdNjqo/oFv+l9sGd3kVAsU7NLPjoBa2CsNHJWni+yvFt8VyN
         Ps4ABLvHRBmbzvSY79+T9srpzh7/sQKMliyeCGPrcKX07WInZ0Hi+1xkJbUy2+2trkuZ
         iiPg==
X-Forwarded-Encrypted: i=1; AL+hErHXN8i3a59ViaLIxcUwusJpsNSM+cX4fR60m0IGvHbT4+GTBrh/RRU8EtCjfyxxQU5pnxkvi2uRgtGAYXgTpKJD@lists.infradead.org
X-Gm-Message-State: APuU4Z98H07XDsyaCSzQLGIzTIWzyuk7yrJJl7PQGAnTBnZKcB4770Zj
	IEttlm8BFebhSbaWO9uPy+JGDiRgSV8riKXo7GZNifJ7E46VrFby21Ss
X-Gm-Gg: AYBFou1vnriH7gdfzCX6TnxEBUgq3FBTfZ6rpN+8dUwbZ4hvSBzvRsrVFMyCyjJTIvW
	LbdFx7rCAR/6y1kJ0VjGkZDKrnpc6kIATb9QdR2lRa1D5l4pbgVyr7ZTVTePQ2kyUEDENGtivMp
	wP3SD6n2EinAhfxXUTn7WPWRFwhZy7XhOqH65miKncpifvvKetWHC7Xc9PjuMJyQV5Hgkb9OZRH
	SmifHLvc0G58RaDuivja30cS3t/3pT2+/i7nsLdioc/N0SCvNq6AvzHhMdB13M3rZyBGAndotkL
	oZn8/ad/CyPRMZ7ZlLuh/Amh/oddnierUuIg1i3Q8WhC8uByre3T/YkirHPbhUrGDdviLoOtKD6
	4x+fmQLJvrd23KpfbOTTKdQ5vV9p8Zj2XQOEs9/A9P1k9FJZSHdrtKPv6SmhNxSbmo4Smk1v9TW
	4Cq0FHRWQUw2nRpvrByoa+FMgh/a/sdshVtzz0ud6VHas5rhrrsWH1aAzg5PHbeXaw8nB2bAWJ+
	FtiXQa+/3PqFsCf4Ag1epVxXQNajQJKtPOOGkxg5ijrKOeAEBuRbxWtVUqeI3oOeKVUpX2TORZH
	LfyKHLzNRBvGvryycZS38UMh+gJZAs/oabuS0qKjKtD9vfw7OZwhbA12eUbsqBGn7nb/fcq4P9F
	6lY2Kf8kVOJBHrsviXOZ8mLJq73QNHxMUFg2Kf3Ak0dYI
X-Received: by 2002:a05:693c:4091:b0:379:4197:5eef with SMTP id 5a478bee46e88-3856f65b3cfmr2456499eec.8.1795167870262;
        Fri, 20 Nov 2026 01:44:30 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3982974eec.13.2026.11.20.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:44:29 -0800 (PST)
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
Subject: [PATCH 3/3] ASoC: atmel: mchp-spdiftx: Move IRQ request after runtime PM setup
Date: Fri, 20 Nov 2026 16:43:54 +0700
Message-ID: <20261120094354.6814-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120094354.6814-1-phucduc.bui@gmail.com>
References: <20261120094354.6814-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_014431_100965_71E06AE8 
X-CRM114-Status: GOOD (  13.18  )
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
 sound/soc/atmel/mchp-spdiftx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index b034bd46cd5a..658ff667439c 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -812,16 +812,11 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* Request IRQ */
+	/* Get IRQ */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, mchp_spdiftx_interrupt, 0,
-			       dev_name(&pdev->dev), dev);
-	if (err)
-		return err;
-
 	/* Get the peripheral clock */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
@@ -863,6 +858,12 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Request IRQ */
+	err = devm_request_irq(&pdev->dev, irq, mchp_spdiftx_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
 	dev->playback.addr = (dma_addr_t)mem->start + SPDIFTX_CDR;
 	dev->playback.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
-- 
2.43.0


