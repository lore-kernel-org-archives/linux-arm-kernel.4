Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2D2606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gtsaZsqz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U82QAX9X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3cCgqwbNvrgOhuXLkkf/Vlhr66lfaezWECzWianZik4=; b=gtsaZsqzjfAckn
	B31fZkmevSZ2ExNpZYvGO8iTmV7XdU8REEPDPFsqQOzlxIxfnbO9ZoCxOKqQu1O6dgXvAvmsrjcoh
	6kc8GBgXnzwCFtYAmdD0wdfSGPJ2pKX6qxK8MnWX2Tr8ecpXhA9NN1dAlxY5ajMI973DNinl6olVI
	GyxLlvoMpteWrIAhsZSw2wiL3QxHTipPiKRS+RdmrAn6rb/RWkUZ4wIB5ZpZNbSTBVj52l2bRVFOA
	r6aaymAwgmy3QIzMjL/OC8UBuxQRZgbcJJTLMJoiLvxSCLIdJzLbh1MGvcMlZU9w5D2Sj5bjslG5R
	GHaunNU2wrQ9WaaGAv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULAT-0000000EV4X-2XwK;
	Fri, 20 Nov 2026 09:44:29 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULAQ-0000000EV3d-1JU9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:44:28 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso682065eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 01:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167865; x=1795772665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cCgqwbNvrgOhuXLkkf/Vlhr66lfaezWECzWianZik4=;
        b=U82QAX9XsMaJb+wSUAAvzg1z6DiGGiBsAfRJjrRW6K8iaQnoWBuR6XCsRoxUUbW767
         TkZ3N/bpwQt6DSwz7Sp5Zb4w+yX8gdlUSNvgZlDrZfRBNSWJ0/gnvE4dnIFeOa17znXE
         iMPMQSLGqwG/Yk/k01va5iq2FfSY31a/lS9sZjClaeqDqw4mmlaecaL/jFn81OHZCSQp
         0Ia3shw5c3ErogHumZlF3kMvfceyTCKBcx/vRQw83xtV1Luu4eKvbcU1RIo0/11Mg9an
         Z4tmS9mjdoGs8uK3cFaQREn+klWtCbrYrNLSkDCifXrQBeBaqHGA/2+xie+ecaF5IbIy
         hM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167865; x=1795772665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3cCgqwbNvrgOhuXLkkf/Vlhr66lfaezWECzWianZik4=;
        b=yisKisvQ9OolOqk9w3/gxirY9N0/ve1VhxjSZLnLtKHKrJUMLUS19KGYhesOQu3AeH
         p70ZAEunDvur2Z8StADdmVk6bBrHoRGpIaNyzQnoqX3wtSoabEZ/WGu/XU6yz6x/OYo9
         /qjZztwYjy3CgfcdyaTAX2DOu3IVkJnDY85ORRgDqotMe85rxnaTltny1aMHsvJ/lhal
         6uu01QdoKfTQKspW41q6gqIe5ZfS92ggH1HU5VaVRpsZSWYOcW/QBuDHCEhQcXm3720N
         +B/gqkWnjc9hrAsl+LxUkYRZkvBjgIP75wZ+HzzrVhllb68jO7VzdmH9PZTGbeBx0Q0c
         R1kQ==
X-Forwarded-Encrypted: i=1; AL+hErFS2ce40QdcabhUtCW0apf4X+pG5JjHJmPNjXwuzKGL4UFSj8LPgC4ps7xcRZATIxQT1uoDDciPe76N4TF77ShH@lists.infradead.org
X-Gm-Message-State: APuU4Z+Pttep1wM3aDvWKX24aWVi+7CyhWbZhAswri8fmv4mNqjI0er0
	/whap/5d670iDBjQ8n0df9gUfIAXriDNnk+pOEJrYvEHpDIDM8eyyjdy
X-Gm-Gg: AYBFou0QnZoPqfkPeUWp5hYCXg0pbO1MYYf1WWmhYgk/RdvTqqR8UM44yWvV6P3oaH9
	9gtoBSY86V63E5y3sDY7KJwP6hIk3Cte/TKAxHYKyUmnKxohx+MJ+F0yVJ+Au7DIWW4SInVPp1k
	YajjImyZu9ZNMr9jUH7O953wcztiwJl2uV17zu8U6qDC7y/CNtXTIT6KJ/csveQnFay4sdN/83w
	EZhV2OfzRCQD00EoG9Lg/j7d+RlsZB91j27Da8x0WXkZOdrJ942iGfcncC4zN06q3+DRWTtzyES
	zmF2HipcUcCVcDX8bFDskBpVDQknxQC8ZZLS7QY6HO/1mYdPtkv8uB+yCqYufuBFYd1HZ9vGZX3
	DhrQS7Un4tmvjs38jDRcJEDMbnuug7IKZvQmNdKw5fSHh/MgE+g9mYU+5D9CrDFUB8lyTTVZm/C
	zbcb0T52JJFsfIKPoF2xyOOihTox/BKh0rj/oY5WFYpD8RXNRRIb53ApgfQeVoXMOvwHY+0wk41
	KE06n+sGeZZgAac2/h3WQqn3Ewa5oLcsVGzbCK0yZ9fKcF67IVAUwfbadlfJThx9zzGv0yHYOc+
	DKFBpHOJQ3sSj4LJnFwFkKu41S9ZYrEoJSDWqPcvr6OJRtJQ4xrTb76foV9tmcS/Nqs8r6Hvfqa
	+ZnhF8R6MigS67nbxAd0ERQ8Apw3612KmdfJAcoTLH7qNJDWBhEy8u23cszyjUAgteA==
X-Received: by 2002:a05:7301:dd8e:b0:386:6c8e:b4f7 with SMTP id 5a478bee46e88-3866c8ebd4bmr51424eec.12.1795167865186;
        Fri, 20 Nov 2026 01:44:25 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3982974eec.13.2026.11.20.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:44:24 -0800 (PST)
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
Subject: [PATCH 2/3] ASoC: atmel: mchp-spdiftx: Use devm helpers for runtime PM
Date: Fri, 20 Nov 2026 16:43:53 +0700
Message-ID: <20261120094354.6814-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120094354.6814-1-phucduc.bui@gmail.com>
References: <20261120094354.6814-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_014427_042395_B7333878 
X-CRM114-Status: GOOD (  16.11  )
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

Use devm_pm_runtime_enable() and a devm action to handle runtime PM
cleanup automatically.

This removes the manual runtime PM cleanup from the probe error
paths and the remove callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 46 ++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 6ab32f0b8b8e..b034bd46cd5a 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -778,6 +778,15 @@ static const struct dev_pm_ops mchp_spdiftx_pm_ops = {
 		       NULL)
 };
 
+/* Runtime suspend the device on cleanup if necessary */
+static void mchp_spdiftx_runtime_suspend_action(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		mchp_spdiftx_runtime_suspend(dev);
+}
+
 static int mchp_spdiftx_probe(struct platform_device *pdev)
 {
 	struct mchp_spdiftx_dev *dev;
@@ -836,11 +845,22 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
-	pm_runtime_enable(dev->dev);
+	err = devm_add_action(dev->dev, mchp_spdiftx_runtime_suspend_action,
+			      dev->dev);
+	if (err)
+		return err;
+
+	err = devm_pm_runtime_enable(dev->dev);
+	if (err)
+		return err;
 	if (!pm_runtime_enabled(dev->dev)) {
 		err = mchp_spdiftx_runtime_resume(dev->dev);
-		if (err)
+		if (err) {
+			devm_remove_action(dev->dev,
+					   mchp_spdiftx_runtime_suspend_action,
+					   dev->dev);
 			return err;
+		}
 	}
 
 	dev->playback.addr = (dma_addr_t)mem->start + SPDIFTX_CDR;
@@ -849,7 +869,7 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register PMC: %d\n", err);
-		goto pm_runtime_suspend;
+		return err;
 	}
 
 	err = devm_snd_soc_register_component(&pdev->dev,
@@ -857,32 +877,14 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 					      &mchp_spdiftx_dai, 1);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register component: %d\n", err);
-		goto pm_runtime_suspend;
+		return err;
 	}
 
 	return 0;
-
-pm_runtime_suspend:
-	if (!pm_runtime_status_suspended(dev->dev))
-		mchp_spdiftx_runtime_suspend(dev->dev);
-	pm_runtime_disable(dev->dev);
-
-	return err;
-}
-
-static void mchp_spdiftx_remove(struct platform_device *pdev)
-{
-	struct mchp_spdiftx_dev *dev = platform_get_drvdata(pdev);
-
-	if (!pm_runtime_status_suspended(dev->dev))
-		mchp_spdiftx_runtime_suspend(dev->dev);
-
-	pm_runtime_disable(dev->dev);
 }
 
 static struct platform_driver mchp_spdiftx_driver = {
 	.probe	= mchp_spdiftx_probe,
-	.remove = mchp_spdiftx_remove,
 	.driver	= {
 		.name	= "mchp_spdiftx",
 		.of_match_table = mchp_spdiftx_dt_ids,
-- 
2.43.0


