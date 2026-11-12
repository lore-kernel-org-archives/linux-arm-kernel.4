Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D7A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rg+6uwqQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laJpWWaD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1nckocVz+afCDBQJ43glnhAGvucCdYHH86OsKUgx7bE=; b=rg+6uwqQYbSztQ
	KFS8CnqGYXXqnJCNxkpTOk1Ia7YbCf7vtGAcgLUwsxymQcSWhmWy/PFRh2gfwXOGQlZBp3RAOJXMZ
	ScHp3mXiS/P5R7TRdXI48EofxgpD4yUqtgQaHQVMZ/hG6mnITgUN8RbXbBxCE/zPf0OmmKCfQpc28
	tQwsbKy6lsdO65zRPWWMSRMzFjERkw/NtTowW1vhvbeyGv+8QYmxMuA3zWvvt5adRWoI4mzmAD4y6
	u9OBN6RHZ82QiWMWB08e6dGW+LdcfOXeACZVJfi6W/k6y9FwSXsBevkHGJ56Y25hX+rV0WetdMMjT
	Aa0L9MCFundz2ONlw6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO9H-00000008neJ-1Eks;
	Thu, 12 Nov 2026 06:19:03 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO8H-00000008nNJ-1cnm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:18:18 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-93f2b8cf037so346334085a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 22:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464280; x=1795069080; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1nckocVz+afCDBQJ43glnhAGvucCdYHH86OsKUgx7bE=;
        b=laJpWWaDBXzcXYz2pHuL9y1lehUKAPFqLdpUn7Yxj8oOw/DWgWuzNzbByWZpjoTUkB
         wSIZS2LgKaabaZkDAHD6xrDI5cg1AjJZmR5WcD+YIrVSKQlxKPpFAfXMqsL/0i4fRWF4
         jVrulehJzbfYSJPL8PRmCUBfsKhNZdbk3MZDNBVX1ga/SzRhg1KbP4M+0yTAVC0L383Z
         GjMdwi1qPcufpqQTa+jbNlCPr9uOj/RqWVkQInt//dB+xYWCDwcMb/0rG9x14pagTJP9
         5oJE8gKRJo5wYe/ntSukzMdSnskX1u4AmJSFGV/xdQGl4LbVI8XqNOuT0uiscp3vyxa3
         fBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464280; x=1795069080;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nckocVz+afCDBQJ43glnhAGvucCdYHH86OsKUgx7bE=;
        b=NeG7qeEIZaf9GgH81eufjmmFp8AGSqdXWi9G46jwfIGAZHHeInrOLyZdyTFosautFm
         3ue5s4O5qXEmkNkfVzgsWt9qk9T35BU++NKd5ZHwM74dy0liSALxDLzh8RuWcWe8EWa9
         3dcTX7D2VFPhKU+7oBwmN0k/mGUMSIjhqPt3kt1xbNY2AKOF0M2uJ4/mwP1BX45G1W4f
         Lh8ZXaWhSNmJHIjXFud5NAybRvl/GVGe9gUKwRhgmsURkRj3xRpJNvE88skcn6ZgKanU
         OcN4apY+TnivP0aCKXl704334PLcQxRbhHpvt+nL/UjHV8XP0bUfqSeHVJETaYv54/OI
         +6BQ==
X-Forwarded-Encrypted: i=1; AL+hErFeVq6KNP9xPxbgFQ+m+uE19WABEkKSNhBy8LSYRkVblEx74MBXpGj4OkGbqstQ9sbZA5V6ALPsPaWcQi0Bl7xs@lists.infradead.org
X-Gm-Message-State: APuU4Z+MpqPeU95YNN9TUaS1/+PGSR3Hqw+ruNRXw0CjfvwQru13QZlx
	xvY1AGDvrlpvMFFHQzsY4mkGCV+HVYkp6HBpXGKZ12I96x8UP8wHO3c=
X-Gm-Gg: AYBFou2MV+bQmlcXH/2cD6xX7zqBfMeyTmextTBq2MOv0ryiEtxeUda5heK1d+BHn1s
	P8sZB6/0lIgjv99yp46PiBsruXHcMwczIwHa002ksRRhfoZM4hQGbG3XSrn1xfM+rmJg3a2u/Kr
	oPHoT3k6RveU29hnpf5vHbNmhDMQ8CBHoKcqVMNtwJcjQklxPmBsCo0QVf5oEWrOsDe8jIPu9mV
	bTMnAj17tvOQGft0sKUqaEDNw0h8muHGFDBvzwdV5ItiokwDoIrqjEdbGWMwkG+qXrzVWhezsUt
	KYoL9MKRmoNqT8ng2GZi8IkwSVDFsuqeUoGQ4BXrTa58BlPTfPwpEUcJ8uD/qbggssIKPmjuG0U
	YRWE09jij2v5VKA+tQ8BnisVzUjWSlptRH6Zg1sL8O2n8gNKZ4IqNJCGpodgVEfz+0+IA4xejyW
	OgoN7i9OqjlZr4CXR56yXZtb82igHx5Din7YgiT/VagSs62Su1SPhgTzUbw++NDwdLQDDRjeN8v
	3g3bJwd3CsC1Mn5rKDo0gwK6t2J+fIuVDfIME3BpDLL4u7iLQOcDXjnTcYMHuXfikZkLlePWS9+
	1V050CpDdWeOS8ImDIdUVJEKFfYV/m39HwMzKqYsKCREdfrvu5vx9pvQIwW+pEgSAb+DuFFmMAr
	TkAqkdBfUgHtE0NAuO0Ndda9HsRiZrOBC9tQCol8Yv/ZM7HbV+5mSlKkIi1ix56hdCKtbbZqR2W
	ds+z3ONNckdUt9EAjw7/e6o7VW+/8A+ALc
X-Received: by 2002:a05:620a:4726:b0:93f:365b:42bc with SMTP id af79cd13be357-947affc152fmr801189585a.52.1794464280101;
        Wed, 11 Nov 2026 22:18:00 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:59 -0800 (PST)
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
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>
Subject: [PATCH v2 3/5] ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:47 -0500
Message-ID: <20261112011708-afe-v2-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_221801_803891_F1F41B62 
X-CRM114-Status: GOOD (  18.90  )
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

The managed AFE IRQ is requested before the regmap is allocated. The
handler can therefore run before its regmap exists, and devres releases
the regmap before freeing the IRQ. The remove callback also suspends the
AFE and disables its clocks before devres releases the IRQ.

Request the IRQ after initializing the regmap and before enabling MCU
IRQ routing. A failed request then takes the existing runtime PM unwind
without enabling that routing. Release the IRQ at the start of removal
before the explicit clock shutdown, using the IRQ number saved at probe.
The regmap's managed lifetime also encloses the IRQ on probe errors.

Found by a static analysis tool under development.

Fixes: 57513aabfe5b ("ASoC: mediatek: mt8196: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8196/mt8196-afe-common.h |  1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 16 ++++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-common.h b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
index 4951a6f32abb..ce5d586721db 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-common.h
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
@@ -186,6 +186,7 @@ struct clk;
 struct mtk_base_afe;
 
 struct mt8196_afe_private {
+	int irq_id;
 	struct clk **clk;
 	/* dai */
 	void *dai_priv[MT8196_DAI_NUM];
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index f69ea22cfabb..dc462dd4235c 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2403,12 +2403,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", afe);
-	if (ret)
-		return ret;
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2463,6 +2458,12 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret)
+		goto err_pm_put;
+
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
 	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2490,8 +2491,11 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 static void mt8196_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
 	struct device *dev = &pdev->dev;
 
+	devm_free_irq(dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(dev))
 		mt8196_afe_runtime_suspend(dev);
 
-- 
2.43.0


