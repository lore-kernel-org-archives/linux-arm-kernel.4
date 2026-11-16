Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF613606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ygtSdpXY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqFpplJK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GxMkERKJmX/L9djyDc07wmpOjUjv26OkhX/qedLHuEo=; b=ygtSdpXY7bVjga
	9yG5ndfQfBmK+kCHYH+4rdrKeTqeUneIakkK4q3qvUbKvtE+F22wjMk/+5SvsaLdJrEjHMfVlsasS
	f+tnaygK4tgiUhzhgoWx9pQ9hagGYESTacTJ2pu6PX8I7GkTOTiysgE3kHRRpX/pVIx8HltVbk4RG
	FEbcUzr6Yy1SzuoPkSo0kHc/KVmj1wpnrr0YcqxcGZzJEMEn41Xw03LpQLj444gd4fAHETKGzrCP/
	Wk/NpkRdAei+tbXwB2SOzrP8W9/QiER0Ii/COb7ZokB1SIwQj/U1f1FFBCrbrcefGWJ+xbk8VicMg
	Uiol5ZiTsPExR4suduag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsx6-00000001lML-2QZJ;
	Mon, 16 Nov 2026 09:24:40 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSswy-00000001lIX-27h1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:24:35 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1193207a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 01:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821071; x=1795425871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxMkERKJmX/L9djyDc07wmpOjUjv26OkhX/qedLHuEo=;
        b=uqFpplJKlAXquOmKBUTVj/gFC68+8c7Bfq+I8VNtIYTFbMlEcX+7fvpBB2fPfl/yMJ
         WhXUX4FlQasrq50MUnslpf3mjVH8rm4wQE3g68DGugTquj9Tc1epdvxx0YzuVSAa9ely
         F4vMqIKNYgHOdHSXs/k+2DV4LNevNVXn0XkUmf7WcDIluybUV5EEpXhn+G4PFq7kzMTd
         7Iw+07xAW/nezyRXiqBpJgh742jf3hKyHduR8eSVYM4lOG3yJTj4NYxzFsifODhOEkvD
         wJsb2abb+P/gItLHwfVFmTXMIEKI5B8g064g+GvJzhSeWE4NnBr1WxlIh3ViU1mBfypG
         EwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821071; x=1795425871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GxMkERKJmX/L9djyDc07wmpOjUjv26OkhX/qedLHuEo=;
        b=v7hucDbxkTx+nA/+hVFbg6tgrmDXoKL2box5inK29sCREqvX+ddulh/3U/981Gk83T
         k9cQQZNj/fXXYh4euVK3NKELUparkGeeRs0a84f1YJkuUkB+In7DG5UOrHFriiuJRVlj
         U5Yt1/A3yJQNlwVtYqOxbrg50PAY/rzAW+YYrMvsynDUlvG/qUUWL89dAQrO+V5rUtX8
         0jk2G1cJBb8+ZBbjb4irbazcIC0vjmCtPXO4/bK/RXhM0m4HEATxJZu7iYkB5ojX4yfq
         Ocs2Wp0b9JWendRf+myUWOEXWWlIjJGdQwPwpK5OyQ019IZSWZ8RaHqSQtC3jdjGFXIG
         A/VQ==
X-Forwarded-Encrypted: i=1; AL+hErE3rcJYM6MaEYXVXA7GWT+xb2Isw6yDxB8F3wl/5t8ymelbg/9S4oZcQ/o7vaoB0xX+cnWoT3UF3V3bSO0b9APU@lists.infradead.org
X-Gm-Message-State: APuU4Z8CHvDlsZ727ujdC63y8JmgdPp3HeKs2S1npeSbJwppOZ8iDVh/
	VwBvKloH0R5I4rJHN2049H6KbabYvR39TUC/l8X2SwbCQisd88eI3RZc
X-Gm-Gg: AZFdTZfM8WNaaA/sJ19a/72ZvjHvsyl30kWcLYrpBUIvCXuLjdTgVDy8mqkbPhTL3Wn
	a+xvAfv/CUJrdMUcBDnUtJ1EqIvjgNJceXcY+XVCGFb8NLaSAI4No+vQTqEqcfRZ/4IXcgw91ig
	XCfDf7I9sGk98F8Uu++qZft7nL06m80cddUt1+71PKvqPi5ZdUO5Y+Y3ucRYmW1Nx6SLYGo1eRh
	jiHqs8kpHeIlaP6+8Z01VOJCPbwJq6cqN9Qmlo2MiqlQqKR49laBKFq5V4ewj3LVuG9OFNG62l1
	YjZc8K05JQnWcSsH+NmK10cUQZuKboJ9NMBlUvIdwBQHkYaE3HdWfgYBy6j/MRW6jL2Do0XQAGh
	uh3N1uSGmc+9tM2nkyNu/2ECRsR+hVNI3oM9HAX4nFPi6ihiewR3pEy+7bHRlhcZZyYu2fWFi38
	YApxBB0ZbgyMZCJ8rB3zrMrh+4cWqjsJPfvJ7LvgpytiwFoNwUecImYOT7PauUC9d4oXbFcdNnz
	YVxMR2Ofhv5cPhuSuph2M70gswE0kU30qyk+9ptMRkQ3sfaXS1WMB+iIt2bAUU4uW94sg1iCskH
	sVPK1g1P0ApQuWqzDbBnSG4CfjKwIafqnIiPcy8p8ZNmjEULWTDSRWwWnv8RRoU33eKIQyVEmHl
	1qD3aMZEVBPxVTwp3VRCm/L+xOqfqPwjN9B34cNfsIm6s
X-Received: by 2002:a17:90b:1d46:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3b1b0a4dd29mr9560360a91.39.1794821071518;
        Mon, 16 Nov 2026 01:24:31 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm15661189a91.10.2026.11.16.01.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:30 -0800 (PST)
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
Subject: [PATCH 1/3] ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_optional() for gclk
Date: Mon, 16 Nov 2026 16:24:04 +0700
Message-ID: <20261116092407.514998-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116092407.514998-1-phucduc.bui@gmail.com>
References: <20261116092407.514998-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_012434_262373_D0F51A06 
X-CRM114-Status: GOOD (  12.98  )
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

The current code is unnecessarily verbose for handling an optional
clock. Use devm_clk_get_optional() to simplify it.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index cb0f3e55b05d..9d8043a85782 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -1073,14 +1073,10 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	}
 
 	/* Get the optional generated clock */
-	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
-	if (IS_ERR(dev->gclk)) {
-		if (PTR_ERR(dev->gclk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_warn(&pdev->dev,
-			 "generated clock not found: %d\n", err);
-		dev->gclk = NULL;
-	}
+	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
+	if (IS_ERR(dev->gclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->gclk),
+				     "failed to get the generated clock\n");
 
 	dev->soc = of_device_get_match_data(&pdev->dev);
 	err = mchp_i2s_mcc_soc_data_parse(pdev, dev);
-- 
2.43.0


