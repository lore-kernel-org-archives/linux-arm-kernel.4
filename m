Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F47606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E1UloqZj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qiiZhrvt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3KmBFIU1iR/HTXXXArEC7zokn13fH3rMiHXgEuMLclw=; b=E1UloqZjsRVeKEz5l9K6Xi9LrF
	1SlyNYH1KGIloTj4zhB8PHZBptflb+DCMa/iynKJi1eDYn8G8fSeWzyu9GgO0lQVu++zYOFCN286s
	PAMBfael/ItRldoeY5ZKjoisF8Un//55w9Ho9FtN74vaioJgyi270eLOGp+Z4qjEBpxRWqz73PK2X
	oDkrgIImsnBMK+LLDimpc9seJbfgo2i1NNUOyqjZ0H15eun7giZ8gZkxC8oHnP+a4600R9yreCgqj
	TeGRZm0Lo1GxkHP+fsstwqJyMerYci9746RB17F209tTpErRarQqwL7xAMPTTAvZRH0L9QoneXIdq
	0xHwDAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdON-00000002NYO-1q38;
	Tue, 10 Nov 2026 04:23:31 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdOI-00000002NXC-0oQ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:23:27 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-945ae2daa3eso181536285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284605; x=1794889405; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KmBFIU1iR/HTXXXArEC7zokn13fH3rMiHXgEuMLclw=;
        b=qiiZhrvt5Zt7AAcsSbHuvUzdX4PWWXwxTc1nvURHWqW6PixP3CxCq+eAT1Yz1I7Ymc
         CmSHzCz++NeJQv7rUW+xsfQFPfZO4d/lMf1CYmEoEq33PNT5pGFZ55CrJb72FiLONbTf
         zGeuy+IenBVy1C3NlBgLU6+g6q3xRdEdNFnJsVvDc5q6GHZmfLhFw6MkCQ8a4JR4Sgii
         ZrJme00rIYMR9tWZ/8F66YjvHgNe2fiKNoCUEnqL3vgnXkajoA5mmDLeAH3WSeFzZYTT
         W2iLhgLW5sjd8C0iI0WaZQgeHmGawjejs0+1oke3XwfGNohPDQr++WvDjq/tVrRr5JsV
         66TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284605; x=1794889405;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3KmBFIU1iR/HTXXXArEC7zokn13fH3rMiHXgEuMLclw=;
        b=oz34glpJcXoyAxkTlX1RTEQtD1HVDirsjjKPNb9ZmmnoxUi2OJ8VD0f1XeZHOpfZgV
         05UxeZvk84JTei1skMz0qGekbBxTzZ+e0e6yDUMr4JLNkOeRmueifnMk9fwpPY3ozavB
         SjLgpDY41+dIUvFqWhjLA1v0PsKqaDeIxQTuCKhlVckkSLfd/VT5aDBvSOxjA1J3/o0e
         4b/Xs6c48FzSOhA5pmPkVeWZOnlOQqymI/Kofbfj0ZTkRtug8VmpkgUXGVult6+Su5K6
         426avNelTTCD9QO3JeKFPojcds5mXK56PUIh/1fQfteic2brGdvk1+NQXvSyeKqy0oKJ
         B/cg==
X-Forwarded-Encrypted: i=1; AL+hErG2NYEoey2aW4KXFYz1ohSc7g8UPi9arTr3YMISQy533zOhKC994Y1A5Mvbu/k6Bevwb8KJOBOTJmswR9pdHs4/@lists.infradead.org
X-Gm-Message-State: APuU4Z8VEZBPN4lRKU9w5HWT0+B3TWg+hJK1hvabKTJpk2B68bHqi1ko
	qWd2DHtM3WIcac1R39/iBLXv0oGoqguabPVgB14aXJtTsOiLAZmYgIA=
X-Gm-Gg: AYBFou3T7CGYNfBlAwTaaBicfjdNeKKEd2+MapY2T2yqIihLAFDdCd8XEhDdR7oUWoS
	yPQcVIeqPCqeozwP3uhXvE7zFdnzAxaefdPFE0L6ENdf9RHWEu6BL0g2eMfIX8C3QWGYITNz4zv
	8GkqTvVOWB+Lw4nshUjWBlYtUJtBJE0+oo14jgS1PArzlLYw9rHVlJ6oYxEg2EZ6+LTGMS3ER8Z
	t9RvYz3+b5kOiFEViOfRDCZ6ltUCSMRjOHvih/o2bQLKvb4/puCR4k4Z+iNzeXKUB/LKLXEJtrP
	2nUbpZNx1HR2ycbuuoj149OVe0K1WR8skPv0oBmZFjta6wZGC8TZQR0OrPimnNnbLIDUXSawHoh
	iNeJKDSFQvmuXcFmkvwPJ7rB+RGQC3A9hBjkF2qNAMSEfrnNyG70T06dVUV3tRLBDtZbpECCuzd
	vEweAGGf/9m3FXssngjYSof7+DKb8gyI+GX7L7qQLEJi6bmTLsA46lSr9ZLvZjrE6Aj+tcYHA8Y
	Vmb1bjGZPQ5qS6rq34tPUrfmkjMh1GkdBHflPbnhhN/eaF1th7qG5i9lwurjJ8OoDPk6O/q2Tff
	dxA5z+u2GEuwbDSRH/TBfeCwJkuuiheJeEUQQ9n2DNb3RavCA0oHol7j2B/xVLBML3z1FoHf0HY
	DVuv4IfbNFM6Rb+LFLpZBEEG+Hwo+wwczODKybCIesiD2SIqHveZaEv0o8ailAFnq
X-Received: by 2002:a05:620a:28d6:b0:93f:35fc:5253 with SMTP id af79cd13be357-9479f34274fmr240626485a.31.1794284604776;
        Mon, 09 Nov 2026 20:23:24 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e61b8f8sm136682085a.1.2026.11.09.20.23.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:23:24 -0800 (PST)
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
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] ASoC: mediatek: mt2701: initialize IRQ dependencies before requesting it
Date: Mon,  9 Nov 2026 23:23:21 -0500
Message-ID: <179428456134.51374.1588994696516825613.mt2701-v2@gmail.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_202326_244389_4CB6A4FD 
X-CRM114-Status: GOOD (  16.60  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ASYS IRQ is registered before the regmap, memif arrays and clocks
are initialized. It also remains registered while remove and probe
unwind disable those clocks, allowing the handler to run without its
dependencies.

Request the IRQ after initializing handler state and successfully
resuming the device. Release it before PM and clock teardown on component
registration failure and remove. Check runtime resume errors and avoid
running clock cleanup twice if the manual resume path has already
unwound a failed clock enable.

This issue was found by our static analysis tool under development.

Fixes: 43a6a7e71063 ("ASoC: mediatek: add mt2701 platform driver implementation.")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v2:
- Rebase onto current code.
- Replace devres actions with explicit IRQ release.
- Check resume errors and preserve CONFIG_PM-disabled unwind.

 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c |   27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 3c5a76591..4054083e3 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1620,11 +1620,6 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (irq_id < 0)
 		return irq_id;
 
-	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret)
-		return ret;
-
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(afe->regmap)) {
 		dev_err(dev, "could not get regmap from parent\n");
@@ -1684,15 +1679,22 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (!pm_runtime_enabled(dev)) {
 		ret = mt2701_afe_runtime_resume(dev);
 		if (ret)
-			goto err_pm_disable;
+			return ret;
 	}
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		goto err_pm_disable;
+
+	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
+			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
+	if (ret)
+		goto err_platform;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-		goto err_platform;
+		goto err_free_irq;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -1701,21 +1703,28 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 					 ARRAY_SIZE(mt2701_afe_pcm_dais));
 	if (ret) {
 		dev_warn(dev, "err_dai_component\n");
-		goto err_platform;
+		goto err_free_irq;
 	}
 
 	return 0;
 
+err_free_irq:
+	devm_free_irq(dev, irq_id, afe);
 err_platform:
 	pm_runtime_put_sync(dev);
 err_pm_disable:
 	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt2701_afe_runtime_suspend(dev);
 
 	return ret;
 }
 
 static void mt2701_afe_pcm_dev_remove(struct platform_device *pdev)
 {
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+
+	devm_free_irq(&pdev->dev, platform_get_irq_byname(pdev, "asys"), afe);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))

