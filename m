Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC279606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QZF4Wrhs;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvPVKgWa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B5lFknzbFblOuXPlPPjcfE8p4dbikqXW3Uf43fx34os=; b=QZF4Wrhs7LYBwg
	g3MZh7bw9EYRIfT/ICpR0V9mk6Rgcy9KTEAd7Ph1LWbJFl3IZuR9G4qmsre6sCoJ2FZ5ZkZV8T7jK
	KDDim0J6IJNBbw7PCmSnDocrXe1k3YuA6icY64s1/UFLsEOz2aTpp8qiNkUMYZ5QDvByPAzuBuwp0
	pekfqpn4WPPLyP58GS5CMaSTk6kVDPgaA1zdxxbYepNJyYPJrlWFAPopZoqmoG/9Cch7dPAvsHHFg
	sSblqovk6xxpNc8sUr1woPfCfXPgXqtOTY9kcbpWuJhtmVHqU4cmf7AhVbRz4u+BWhUQhmg2Ba8IJ
	qnjrlWDhKiJa4aj6mYYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO9H-00000008nfK-4B5E;
	Thu, 12 Nov 2026 06:19:04 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO8J-00000008nOz-10sC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:18:23 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-91eb5559b34so29296106d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 22:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464282; x=1795069082; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5lFknzbFblOuXPlPPjcfE8p4dbikqXW3Uf43fx34os=;
        b=bvPVKgWaehBkb7+dCUbRYh2bZdFcFj89Cmio0KL0T6ncJxZAUwypHzudPx4j8rbn/G
         muhqkqCrvnyH1C4GAr2DsBin2xVImOPp1R0DZTCsl9UOT8IM3OzAWr5L4ybgkNnldaYL
         N9gKw8O0QOaJid4LKM+FD39G4a5tRfIDNnTZFrlqm9KnUy7fO6/G0ybje5BD3zHaKDnF
         p1diSVv9XC3czrB0jQduEe6eM4wUUvkRzv1ztBCZXZf/cpl2zyWrTfH851HNHwoix3yO
         zo0vNT8SEc5F7aDvvyGvdHBBVgxzYazVLciaObF5O0coauEPiuUAAoTEiuLMoi/a1Xga
         R7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464282; x=1795069082;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5lFknzbFblOuXPlPPjcfE8p4dbikqXW3Uf43fx34os=;
        b=HCvBag9hvj5b61jPlAJvfSHk3Xrus+VsDx8isx8aX39WkZki96/ov236uDA7wl0nl1
         YbvXfHqCxOWIZfY3NaLHzusYkI1GsyMTB1CgMuNvpKAEO9D8idZs85JLmmlRICiFZm2n
         MN/ADG0w3f+O/LQddcvJI7vpxL35V9GbcdRZTuXGqn7ZqUJGQaELJIFTrFiZBPhl4lXF
         voxgWWK9DUO0OR7zx1BwZR/TU4g8OAVhTJnocJEvTksRYLEL/8kWbGslcGfPPxAiGYM0
         1r5w0DojJr/tNQT+PL10CpnsLAB5ItHY7tAGSGeMBVngBUtf8gWg5OvXx5vIAB0Z11Fr
         l53w==
X-Forwarded-Encrypted: i=1; AL+hErGsCz7EB4Ja8b+wsgYC2D0JF3zLxWDuNlV9e0C9FVRdZBx4O7r6GqRb24urNNLYCby5MabRieFsNv2kOqwZnDDa@lists.infradead.org
X-Gm-Message-State: APuU4Z+5kdiJBPtpmQuLNFnXB1TquBH2z5ngsjxuO/RKQOmI2q5Ij6h5
	2Fl2Zz3jJVHMo1sZpvut55F6zOcYRfNCVSxHq0y7Y5R7CUaXiI0kaL0=
X-Gm-Gg: AYBFou37ZYjlhIL6NX8AK2FAJ8gZTb0ZlQKePIXfuZ3vlLaOgotR4UFbeLg/Ur8sjEf
	S2CQCavMSbJPrDkgxy8Ij/BlNWj4lRmSUnf9EArrKrSmxvwppsnwSKKwaHfHDzBZCgzKsCF82d5
	OsURSFlbPRob6th2prfOaFiQ5AdBIpcC+sujkfVs28Szi9Ck07Cai6UgC2P1SmkTMhGTSyhUXX5
	4opToxlyPY0P3Ale5hzHI6LOeQdFAXLaSLmDiCQJTtfoYEsy84adJSUbaOSkqCprwnlbF7rUB+w
	WvmlYKuYTDPih9Ov1FVOCVZHqWf5bb4EYNII9py0ccJCGNqHf8+aitKsFmee6l6VIvFQJSND8W3
	rf0n9C/86DmlJyiCYL2RxQSWUMv9nQkVsyuBfLtth9C8XCwEvIlsz9MqZL7LY6czlm7szxx5qja
	3fvgvcgE7GlPLXXf/3lBAFBkYEprTPIbkirBC58oJiXm2MpahqjL9VHG5HD1GRgjOi0dqNt2DmK
	ndY4QTxmZWZ/MciYdg802UUzvkgOzi88DhvXWYR10Ar0X/dXvAt9uf1eWongcGWpu+gO467mjtA
	lPioXzZzsV2rz246uhEtnR6L/WyvMFYkohswPpMS2iVD8abYV1LqDmZigneq1Tqnde5VTBDM8QA
	LGw/vaKb8tubbbiqC+w/w2MYXLw+I4eEf+AuY5/cwocxn/vSPGpsrrQDfAEY5M8cPOVAbqrHZRH
	AFKOw1rXqWiYpvxyapPyhYOmxBifzcAsIt/cg8D+Ky/AdVUdWGsoC2Pw==
X-Received: by 2002:a05:620a:2628:b0:93f:565f:e46 with SMTP id af79cd13be357-947afff4ee6mr743160185a.52.1794464281908;
        Wed, 11 Nov 2026 22:18:01 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.18.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:18:01 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 4/5] ASoC: mediatek: mt8195: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:48 -0500
Message-ID: <20261112011708-afe-v2-4-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_221805_667073_E60BE3C3 
X-CRM114-Status: GOOD (  19.05  )
X-Spam-Score: -1.9 (-)
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

The AFE IRQ handler uses afe->regmap, but its managed IRQ is requested
before the regmap is allocated. The audiosys reset earlier in probe
makes an interrupt before that point unlikely, but devres still
releases the regmap before the IRQ on probe failure and removal. The
remove callback also suspends the AFE, which disables its clocks, while
the IRQ is still requested.

Request the IRQ after initializing the regmap and before registering
the component, so that a failed request takes the existing runtime PM
unwind and the regmap's managed lifetime encloses the IRQ. Release the
IRQ at the start of removal, before the AFE is suspended, using the IRQ
number saved at probe.

Found by a static analysis tool under development.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  1 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-common.h b/sound/soc/mediatek/mt8195/mt8195-afe-common.h
index f93f439e2bd9..905f29673d3e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-common.h
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-common.h
@@ -123,6 +123,7 @@ struct mtkaif_param {
 struct clk;
 
 struct mt8195_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct clk_lookup **lookup;
 	struct regmap *topckgen;
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 13e5bc02fac5..0cf39f66992e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3133,11 +3133,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret)
-		return ret;
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3192,6 +3188,11 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
+			       IRQF_TRIGGER_NONE, "asys-isr", afe);
+	if (ret)
+		goto err_pm_put;
+
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
@@ -3223,6 +3224,11 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 static void mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
 {
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	devm_free_irq(&pdev->dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8195_afe_runtime_suspend(&pdev->dev);
 }
-- 
2.43.0


