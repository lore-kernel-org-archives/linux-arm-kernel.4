Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F07D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 04:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=POSQSyfW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqtSCSn7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CpA5O4wyUxbqGe+dCFjBVccndMPCv3b8o+hsoVqh4pM=; b=POSQSyfW8EPejj
	Y7tG9gJaOfIMmqga51pvABDnUOoLoGmgxNm7cWgt1YuoW77u1dDAo6p6ykxfmJjqtLnsJmp+b3K2L
	BH48NBi6th+xEKthkSQhKYFd6W4SaD0Btypu03uxJ6uCtRlV+6b5zEn1GsDWFTC6hE+AAbWgiSeGs
	31qPGc2rjIwdWUH+D7VbO56sEGJZryym+JcIamToY5tTJaXf/xajDNpP1Mjk201CGTDln3iwgn4+T
	2JuzI5fzaFTfl4P+q/r0BhGp3Fo84Ing+2jMIyb3Pnmq0gowgm60GxrUE/hCK2RHO8jp84LBl/rbp
	PZleKGQmJq8uARE3UDPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFnD-0000000E0GT-3iyw;
	Fri, 20 Nov 2026 04:00:07 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFn6-0000000E0EP-1Cxb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 04:00:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2f045b921caso872825ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 20:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147199; x=1795751999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CpA5O4wyUxbqGe+dCFjBVccndMPCv3b8o+hsoVqh4pM=;
        b=eqtSCSn7TYeoE4jqiy6v/5bnKIsX0VYnM75A/wlrY4Z/e+t8/2YIyCWfSmcKC02j++
         oMhh6rCXhSx4K043AjIa/Kzpg9ojeg70zUILgMXpxAcLgZRv08bUiZEpXUO3z6HM1vJl
         HtpL9kL9IVRwdtfAAZ79VUwbHtjHX6BjSI6ciiV9GfBFxLptyg7gq2w/0viUUFjwg54t
         1G0BaorbGsdexcnWETw10erEWCZbdjlmhpzF0ECiqZGO1CfOcI4ij4aPfC4jJU4XHJ7w
         OOdDroKlpLQemuJXQZNHZvIEMm9Mhdmb6RXFMp1jjE+VJhjAjFQushRHnViWetHDpRTe
         lnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147199; x=1795751999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CpA5O4wyUxbqGe+dCFjBVccndMPCv3b8o+hsoVqh4pM=;
        b=z6eSYJRYhTRQvT9Qt1LcRIWrVjRwtadSRmycjwoxku74UqpAdIIt4LJ5I+ut0Q4rcd
         pATIKWXz6K9HSaCCLQeNVYI4Rpcu1XNyfw5m5mUPWPjIHqhhsA3KlFKd5FHksSzS5XLM
         iRW90wSrMTA3rY8ZvMj9Pd8MEFR4mAHSMpCpIhhRhf44+CobT6r+M1yXolfoZVPkmZvw
         DESND2bni3DCJTlr7nUpEAeGI8tBzmXgUulL6oqXUtvSFpm+Ax+1eSKyOzeArBnLFk/h
         P3bloJ+1p1ZKnf6FirhidNwWkvfRmcB69nH9bjKGRluCnA9iiRRTQSi3ygT5mOs79Cmw
         nehA==
X-Forwarded-Encrypted: i=1; AL+hErH4y8S5QkbYNXQRafx0Goc+Zs1iyKvOZ8KNE7yi79mOvARr9HN55LhjrdKC/39RGmgwuURf1W3Wzq+CMJcj2Dof@lists.infradead.org
X-Gm-Message-State: APuU4Z/AQddOW0X6kNLLETd55rnYLcXe4npNTIGXM67lxdlcCGhsnznS
	EZ/q4mY393nhKPjcgYkRM2F81YpmO2FTsQ0mktwqU/YT1o5ADn3SSxEu
X-Gm-Gg: AZFdTZdqYhYaLzOvgfibFng55w4Wgceob6oUl9OKDfNxBQ43D2Y6U70k5KS6WpyMRIr
	++NA0SJlAHuUiEzxNTC3//n5nGimmj1seTZ5kpCLfFWaHMohq/MJpNYY4/OIyRKy3CQekIYhW5v
	p1q8D6dcJqJ84mBY91axBOPN5Q+hdtfY9VacVuG7BrtiSOGtOiOFb/uG5ZEo2QOg5fJ2Zt1oOwp
	86f9ymKxLol3ozzn4VnZ6E+FMYPS8Gh6QjZaFbi0HU7B3GslhfjDagvCYHCS+WTiitbASpY0hWG
	wePdVwfwX3cYc3iS29JXyR5AIZNahFszsIQHbMy6EHfleu/JB+tq3kgwBqqTLmxrQ/+1/+nMesw
	gA2Tj9rpOGepqt+4VgcWYxplH3ZPXW32uZqYOtqBMqjg68phUXFYBBd/8LfEB1E/JHP5/3LyyfS
	JeHKPdATO/FDElVFeWXRoAcpoxLqZ6vm2NaU5Z23AeL+Y9tPId9euqlzyi9jP2A/DTMxCx3ZRjD
	DejF2ivESn7Fy0+ydO1wDTTh3lE3/rjcIijM2HbmwnPAmk7MrTJpbpJdcMgBbXbJbB1efqrOMKu
	xBuIAsaekAb7Fj5FS8S5Dn/nJ0a1fQcB3XbyDCJ+nQIK5aQ6L6QSGsjaEbyQeOZ5JymIBGStG3N
	AwifWJwa2SoTY2R8su+e5KpYzdLG74kb3kvC1qvu6Li+u
X-Received: by 2002:a17:903:19cb:b0:2ed:2afa:9221 with SMTP id d9443c01a7336-2f03f1707f5mr19772845ad.27.1795147199236;
        Thu, 19 Nov 2026 19:59:59 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm7801115ad.63.2026.11.19.19.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:59:58 -0800 (PST)
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
Subject: [RFC PATCH 1/2] ASoC: atmel: mchp-spdifrx: Fix 16-bit big-endian format check
Date: Fri, 20 Nov 2026 10:59:38 +0700
Message-ID: <20261120035939.12774-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120035939.12774-1-phucduc.bui@gmail.com>
References: <20261120035939.12774-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_200000_332576_2E3D17D2 
X-CRM114-Status: GOOD (  12.26  )
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

MCHP_SPDIF_FORMATS advertises SNDRV_PCM_FMTBIT_U16_BE as a
supported format, but mchp_spdifrx_hw_params() checks for
SNDRV_PCM_FORMAT_S16_BE instead.

Replace SNDRV_PCM_FORMAT_S16_BE with SNDRV_PCM_FORMAT_U16_BE
to make the format check consistent with the advertised
supported formats.

Fixes: ef265c55c1ac ("ASoC: mchp-spdifrx: add driver for SPDIF RX")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: 
The SAMA7G5 datasheet does not explicitly document support for
16-bit and 20-bit big-endian samples. This change only makes
the format check consistent with MCHP_SPDIF_FORMATS.
Hardware testing on SAMA7G5 is needed to confirm whether these
formats are actually supported.

 sound/soc/atmel/mchp-spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 632da8d7bc81..06a2a5a90a63 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -455,7 +455,7 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S16_BE:
+	case SNDRV_PCM_FORMAT_U16_BE:
 	case SNDRV_PCM_FORMAT_S20_3BE:
 	case SNDRV_PCM_FORMAT_S24_3BE:
 	case SNDRV_PCM_FORMAT_S24_BE:
-- 
2.43.0


