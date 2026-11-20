Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1DE606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 04:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2HMimTVD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ErpuxggP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3o8lIoxd/J68fTCxNjKUOwU7KIWlfdsl4McX0KjPG74=; b=2HMimTVD2yCscL
	JUlVSDdieGdP1IhrMoZ+5qNnt1jiQ0jcvb2z5QN0XIuXLjwO6vgdfndvYJm06vUnj8puJYubmd9FD
	29W8seO32thEPdCHtF/Fadzc3ffx3LbzOayJTp+JSjSHcCN1fgpsFJ7kwDVYjBzqbNLeWaOZKnUm3
	gKLvLR3Rs1awMYkeAJ36c8Sic42cgMfxynQ5Jd8jHpvYEjjnC6NpjLg9F+BgnLKjhcXDQWxd65Hmg
	9Ws5ufEOA6rw927acTXqlU9x0yDK0/k06g9eV9b32qvlMXVaSSqejVF5Df/an2h08czXXjUAwAV/U
	lp2AAy0m6UbuGoWPmN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFnL-0000000E0IU-02Xk;
	Fri, 20 Nov 2026 04:00:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFnC-0000000E0Fd-01gy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 04:00:07 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2f01f296937so3492345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 20:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147204; x=1795752004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3o8lIoxd/J68fTCxNjKUOwU7KIWlfdsl4McX0KjPG74=;
        b=ErpuxggPE946PRcCW/9QwCM2NtBYxqzDRjQzGQkIlmCZ8J2t2/2a5PnqNPZVQHVQXN
         1L61F84FRapWW1qm8OIAvUb/7GiAYQG3jOA0co7Q3t3OaTohfxkOaoxTui0NIlXgy3nz
         V1FpBkvkyplu9/yZFE/RBipquohFD3YT9WZf9144ycZ0QhJHceJ2xYMHHgP9o4Uc6Ee4
         Iu1ymDnKYfc7fUAZOXO//CxvDCfxtyjA9AJ+V6XGsDjtTs5QSl0SsY3juUmK+bkgWTQf
         /fZrHgs1v2yE9yCzHWbHJH/kpAgMiTpVXwhc9jixjJ4hGk6MckHs/W6eOIRiqjJPRPvc
         tkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147204; x=1795752004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3o8lIoxd/J68fTCxNjKUOwU7KIWlfdsl4McX0KjPG74=;
        b=EhUz27PaloRNrtI84Jl5Tkm6K6USgMfNZHDdI0gmWY+LdaQTAHNcAhOBRlr6+pkrZc
         Oy4DngOkx+2fTo5CNfzYYkb0TBilHftbzrxwd9K4/n0GVxh1O1KjmpZAUPuNBvGDvHc5
         q7QLJwILcNiBCIujGwlTAmIV190/3zQ/Sox5OLzQXnSEjfx1laSVouotMmscojksSwAV
         wq2ok4Kk8Li/q6xi6/kagxrBjf3nJdUz4HUY6/qmc+VdUIzzo4YXqTt6XZXQjNmXFXof
         iwjHPvmPq+Dzhf0ag210IUrhIa1QwugVphu7s3DOvWTvn9s0yrBHWteNKg9wb3lSuTte
         03qQ==
X-Forwarded-Encrypted: i=1; AL+hErGSLsFTAdDfzItoHNn3lfcjrSTLL6vqnz6P6nQacz9d56BbpJClCJbZpCOSkD5FqJSDVqZzhmWF5ZK7K4iLplu5@lists.infradead.org
X-Gm-Message-State: APuU4Z8xKWytjBlG73lQgkQVtaPh4Z1drm2Tzu1RO+eEOvfR1hMVpkLS
	Z+pkaZG2h7SMO4D0dJ2TC23lFtQFw8/GjDBGAAa5z24L79aCrNk7v9w6
X-Gm-Gg: AZFdTZdgsjbrQaTq7LiYQBDXe+epLffDbMA4x/IccpF6Brtqxf8wxd13+igTwEyll5B
	vS9TR9aEX8UTd7TpifHh1wnjUL1dr4iMtFO531z4KAEAmUvFX6ZniAeUj5jN88ShO43x6cXXbST
	kGl/DfYCEnAiNM+edG6S7/0bFwQ2EDVKESARLtaK9kkcaae2OdeaALUI3N7MYFArGm4IaAS5Aw4
	yYOmBTlReU7eZrzf5z9XxWHGSBaGowpawwV/ZA09+VWuTGWwUD+gs/losXFHSYpD1snR+p/5fdJ
	7jtenLotPZJ+9eOpE37GsqYQZleneWkyJ/QBt/6ArnZT5DnT2Dcb9xpMM7wZH8KGqEP6Mp4ae5w
	Njwe/F0qtBC2sMPMFTOjgleiL/+Hw9T9Q/B8PlK1/Rd+gjmgPpAej2BEZDpGMcqSz1hnc4cZBlC
	qNhSI/Kt2ExJ+EWLCVq6jGmxMxOhFUAUkidpO9SiM6PgHtmc3LQ9Ak7xVZcn7LxL+QCylEnS7kZ
	g1EPpEFV0AtGGYDuRdNbvilcMemRRekZYEfHcaWFcAeDrjKWbPIOQW3X4b9SU6ny7YFChqPp9hR
	DBRYkKa2hEYhR6+HrZlz7KF9+cLM5zVortoGxZFOXgFcq/JfvOHofQuRghZnDWzJfjsHrE/wUIt
	TBDw3aNCbO2EFriGYkGon/EsodhMKR51X1gLSDQg87d6K
X-Received: by 2002:a17:903:22c8:b0:2ef:dc24:c71f with SMTP id d9443c01a7336-2f03f2980f4mr21004545ad.56.1795147204267;
        Thu, 19 Nov 2026 20:00:04 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm7801115ad.63.2026.11.19.20.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:00:03 -0800 (PST)
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
Subject: [RFC PATCH 2/2] ASoC: atmel: mchp-spdifrx: Preserve MR defaults in hw_params
Date: Fri, 20 Nov 2026 10:59:39 +0700
Message-ID: <20261120035939.12774-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120035939.12774-1-phucduc.bui@gmail.com>
References: <20261120035939.12774-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_200006_052278_83AF82E6 
X-CRM114-Status: GOOD (  11.67  )
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

hw_params() overwrites the entire MR register, clearing the
VBMODE and SBMODE bits configured in dai_probe().

Use regmap_update_bits() to update only the ENDIAN and DATAWIDTH
fields, preserving the other MR bits.

Fixes: fa09fa60385a ("ASoC: mchp-spdifrx: fix controls which rely on rsr register")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: 
Hardware testing on SAMA7G5 is needed to verify this change.
If the current full-register write is intentional, the issue
may instead be in the default MR configuration in dai_probe().

 sound/soc/atmel/mchp-spdifrx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 06a2a5a90a63..e37470165717 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -502,7 +502,9 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(dev->dev, "GCLK range min set to %d\n",
 		params_rate(params) * SPDIFRX_GCLK_RATIO_MIN + 1);
 
-	ret = regmap_write(dev->regmap, SPDIFRX_MR, mr);
+	ret = regmap_update_bits(dev->regmap, SPDIFRX_MR,
+				 SPDIFRX_MR_ENDIAN_MASK | SPDIFRX_MR_DATAWIDTH_MASK,
+				 mr);
 
 unlock:
 	mutex_unlock(&dev->mlock);
-- 
2.43.0


