Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FD5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nERqkgvl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQOxuFFg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bNV2fv5l405CqkXTgWu59K3HR6/f7q0GR5+FH0usqwo=; b=nERqkgvlB1nEWGCS/9TJkgJvJN
	wqEhguzzVAFqXYmhsiJM08gASkZPFuwjl0ESSZZCaklLG7CoA0mjFOopwIJSWwhImiTFPkiyPXX/R
	97L9Hj1OjRMFSatEK7C13/klZLcG7ZpoIMkPRcisR0FldSKDwXjDdG7XLvqSWiPeQpdmThutwpQfU
	ZgUAxaExfKwuQm/WnCB+bsv4p5IQx5yDyE0X1ElbkeQJGooweHVEKYmjOBcZdnZHPYURm3pjGTvXl
	9uruZoQTlee0m/bwtapcTz4tQ/DVbGhf+XUnUsa/mBAgoofq1Vlpz3hmN8KTbJ+4zRLYcT3Ro0vEH
	14DVZDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuUD-000000024Fb-18Xa;
	Mon, 16 Nov 2026 11:02:57 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuUA-000000024Ev-2mCx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:02:55 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-380b40312e2so47358eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 03:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826974; x=1795431774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bNV2fv5l405CqkXTgWu59K3HR6/f7q0GR5+FH0usqwo=;
        b=KQOxuFFglTishxOOQwApDHAEBC8ApI8rXjAnK4XcA9f/41CW99QJL9z4j/lDAJPlGS
         tMj2ym/gNJWZjeUrhm/C0a6heUe0YadeFLm+fwpaNjGMikrKcb61mZkGcG1IK/6XoHLx
         QMhQc7pAcX4HElLjO77XjQnUXU5QELAZVJWSYVaFRrNUrd+q4CnQqNL3qK+Wi+c2bBYU
         Bhy4WL/jciYL2FA85JYY4g4aWVkpr+oPdl/IbMjHSsVyDa8IV8nqsmiMRKYru4hoQmpk
         +QMnz9itAizUxgEtYvv58gK/NEVq6cGmTJunQy+hFHD0wWqt+GY/jYJ0WLOUKHFdfUwY
         nFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826974; x=1795431774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNV2fv5l405CqkXTgWu59K3HR6/f7q0GR5+FH0usqwo=;
        b=v2FKWFfO3D5e69ntlxr3Mh3bkSJzFTBL90OvglS6QogGcyN7FyNz/88cn68OAdQx8n
         NU9TFbFntoFS27e4xFrc339m4SVIDfGmmmzEBsfKmm7NBZS24j+RgGseh9OFcttGdTmW
         0vOXnjNY9AyINkXaodzn7GyFUgYJP1WKuzKRscCUsjxOKHFpPNBfiLzvUjrH3Hb6UC7T
         oytSXuahOOY/y1jtlY4+Jc1A8cd7jJVni6yxqVT8SbmZH4ooLsTTEPOyw1wlnHZemOk0
         W8GPDOqaCoMJ0a1d9iEyCfOnNZJD2vvNXxxEhbwFVfS7uYupfuBWnNxWC15N7O0npV/+
         fOfQ==
X-Forwarded-Encrypted: i=1; AL+hErGZl4Q13L1MRRjiCPSaj4yNgT/Q/G3BMTgyXLBQdoj8W29+N02EGnhfctKhlNPk69vf4aPtz0qgPLmYTwhokyqh@lists.infradead.org
X-Gm-Message-State: APuU4Z8SuemA7/Wu/BOwLoCzh4ia8YaSLJdKwXaniOwbZbtDL25aQD3z
	qft1Ry0Q7hzerTOrL45bTWT4Y033F7VnhqvclVWunQroa5LZ2yPAtd15
X-Gm-Gg: AZFdTZcNSp1bSRCnlxzqBy3OVEWTbJCKnKTF+HWY8AOe8Mr2kgBHUhGXBbAsK9ENN6F
	wcfc4gntX3OUIghFvidrpEVKNPittGivyP7RvYXHorZdU3I74eWgulj3dmTiDJjKkPT+gQFnA7V
	TlJIeuSNKYiaOT3ZALp9u40F5/PNUTVkhPWnVbc4qOIyvJAUWw/9/3PDz8z/22+xdQ/DSbdQThA
	PQeIi4lojwBSlABYa4+2w2428Ton4iJZjgaaN0BXJvBEXZjiBMUKO7v0yo4mk2ToM2HlEr9ehDV
	qjGslHWeaBGeiXbZfZL799q7FBBjlY+7U4puTG4u6s6jt/SnDcoRZuLJ69YebQPYiMtu0aGNLg6
	eqS+eqjh5crjq4ht+5DqzmTcrw2V6Adosi1EAVk//ShFu3TlkJZUS9JfGddkVH6ORWWjnJIOigI
	PYQFh4fuIy6JuXQE2M5Mo3oRZUoXfot7qL2cCXhu2yBXBj4sdyCoJ8torzpUI0PECA0ZmPkBrN7
	/icmkKlADvOkVFR82v0wu+QCGK8jyPApGRMy3oRTz2YFPml28ay0MqfnOa6lGJqzGswDu455SjF
	2ybrCOBEKDIpgUeT7iwu11QbvAvy9qNlRSiHbKJPAYbZuznwaR3EZZo9EDmoncubAKcEe8KWI9L
	2hDub+e1HYsx2q6/czNA7TyMZfsIC+5l9Hm1MRAZydQj1
X-Received: by 2002:a05:7300:bf9c:b0:375:370e:f1ff with SMTP id 5a478bee46e88-379671238f1mr9906182eec.35.1794826973517;
        Mon, 16 Nov 2026 03:02:53 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm51018182eec.8.2026.11.16.03.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:02:53 -0800 (PST)
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
Subject: [PATCH] ASoC: atmel: mchp-pdmc: Clear busy_stream in hw_free()
Date: Mon, 16 Nov 2026 18:02:12 +0700
Message-ID: <20261116110212.522478-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_030254_700522_A8C75D8B 
X-CRM114-Status: GOOD (  12.41  )
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

busy_stream is set in hw_params() but only cleared in remove(), so the
"Audio Filter" and "SINC Filter Order" controls keep returning -EBUSY
after the first hw_params().

Add a hw_free() callback that clears busy_stream, to balance hw_params(),
and drop the reset from remove().

Fixes: 2ed1a4a5c005 ("ASoC: atmel: mchp-pdmc: Retain Non-Runtime Controls")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-pdmc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 039b2eba0d9d..8b55d864f3d5 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -614,6 +614,15 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int mchp_pdmc_hw_free(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct mchp_pdmc *dd = snd_soc_dai_get_drvdata(dai);
+
+	atomic_set(&dd->busy_stream, 0);
+	return 0;
+}
+
 static void mchp_pdmc_noise_filter_workaround(struct mchp_pdmc *dd)
 {
 	u32 tmp, steps = 16;
@@ -748,6 +757,7 @@ static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
 	.set_fmt	= mchp_pdmc_set_fmt,
 	.startup	= mchp_pdmc_startup,
 	.hw_params	= mchp_pdmc_hw_params,
+	.hw_free	= mchp_pdmc_hw_free,
 	.trigger	= mchp_pdmc_trigger,
 	.pcm_new	= &mchp_pdmc_pcm_new,
 	.auto_selectable_formats	= &mchp_selectable_formats,
@@ -1121,8 +1131,6 @@ static void mchp_pdmc_remove(struct platform_device *pdev)
 {
 	struct mchp_pdmc *dd = platform_get_drvdata(pdev);
 
-	atomic_set(&dd->busy_stream, 0);
-
 	if (!pm_runtime_status_suspended(dd->dev))
 		mchp_pdmc_runtime_suspend(dd->dev);
 
-- 
2.43.0


