Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27F060A263A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vwi9wxCJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BzxJhMbG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ku1LNAdK9+Sshw+wLpGB4DZKU6CyeOx3BEylFZHlcIU=; b=Vwi9wxCJq814FB
	cDbuaidYZeoxS2Y+uEae/yMi8MLCiOt2BkhfGc5izboFLhS0BhGnitYHbA9vusaxjBwhoEUsROtXR
	I/SuuaU0ghiu4v9FXtlfuHpYYAjAvSDqmoMerzTQ9CXmU7fLCf9KpX6D8gmFer2wnBGOArF0fXC+S
	bw2Nok3zZAilBXBZQwVdWIbf431TzQ3alqNtEqoK1kbgJWNRoQz/gmaOwJz35qyJpJA1bpyivWWcO
	AfGjVVk2lC7t0szRpWz4mDw1tjQRdgCo0UWJ0MtaClnHGz2xwQMbcPwGnD7wZfK5Fk1Wsolw484oD
	SpXsOWd7UloCb6NtOeoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzTb-0000000BZBG-3tYo;
	Thu, 19 Nov 2026 10:34:47 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzTV-0000000BZ75-1r7e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:34:44 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3b402824d07so262745a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 02:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084481; x=1795689281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ku1LNAdK9+Sshw+wLpGB4DZKU6CyeOx3BEylFZHlcIU=;
        b=BzxJhMbGpWEPoqy7NglVR5NHIMlLSerp62SHRjMugMZkzZPKi9aLawEttIVZpXt4OQ
         LNxNldFJgP5cufkYcqJQ0PnGe6Ceb6iNXyd/fplOcMu4VXUt/wY6xW6LFUENI7NqvF7s
         Fmxq0cyjsunSxLfCN2yf0O+IHhNNo/TKM3cExET1gfCok5T7kOxqYaaR/+QwjBZHSuoF
         fNqp7d6iKic9uJS3MSxwN2W5gV5iLxQD8C95uOpUt2yVeO/7AbgK50WkkToSOMrdqM+f
         3IaAtT/r8kzr4mu7a3znxKqaVkRrs70wR0r4s+fdXOE4Y/VbMDnXpmmH5JN/OUQLKZZI
         q3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084481; x=1795689281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ku1LNAdK9+Sshw+wLpGB4DZKU6CyeOx3BEylFZHlcIU=;
        b=ZKazsYrR6/DK3nU4iGajFI9XbESj4p/M5KNsDyycBVwx6LygXZgTiHSnSVjZZiCXbn
         ycJVXNtm4mYFlMUrJb0J+IVTb868Js8CgNxd8wJL90ko27ZwRijmAnNAdtJfVWN+2g6a
         DdqVYX2onf9K4Tt6VafOF3/WPYgtPGY6GeAzNEMrQWV7De/oiBh+JxPPWFlHAbMgp+78
         V55T7jllCoLIb+9oDUOSsOoyUtnSflpZD5eRjCllOlzEvol2Fx2G7qf+TgAp4qZ2YVKC
         kdiMzyTQCKfZd7OKDt/eBxCVpMifLJApOLWbFKkkTYzbLTaPlINvHxZ7LtkYlrKKNmpZ
         uzWQ==
X-Forwarded-Encrypted: i=1; AL+hErHLHF8rxt1MQF368w3m7HlH1Gf2ug1Z2yRDAJDJcCnF4Uz1Dys2P6ltcYFnmdWyfaDPTJJIFfUmYAIqRDPNgBJF@lists.infradead.org
X-Gm-Message-State: APuU4Z9uBQfaiFKb7ajvl5EhDO5KWONyYgogjjvRSReZah+2y+ecDlGT
	1D0fG3f0Fk4WDGHrFhW96IQECws44cSXsr6+eBW6D2umhXAuolGJPsY8kZ+kPA==
X-Gm-Gg: AZFdTZcsCU3gHuHW6AYJiddbtYpXngD+NBIyKslrqmYAqOpVHzMk+gY8J1AktJHHbtm
	/NOD8/zr7hJxZU/8619ybewLRJeJs4r3m3Iltskw7y5S92yfSpfxhom4zOJUYRzML3DVEehY9Mn
	/IdrQ/iw25MZqQ+cmSE7/jln/SRiCIEydIyB55NO2YvzM2hQI41dqfk5hftd43xfXwDYcyCZv21
	MFXfpLj7A0XSZnm8YQwpBkgE5WnFqPCHgFzcEixG3XxIWZ7sBgn1pM3mWdy6lOZ+hHDxJxZ9Rwt
	gfs3X722ufTSOm0SICLYlS4X8SreMElAqXIbnX2IDsvqkPleNPuSElgDAEBiGvQUaa2wG94ShrM
	m/IItoTlztHU2ZnBZIVtVy9sZYWICDRD3buyk8BW3VsWxGj0Bwq3vIsG0064wDIJaLX/crl/fW+
	OOq55bIZfykqmIXTWU1izIjz+lKXjrZwq5aJ7nsfe5zLU+Yocq8ANvF2Lgzf3Jm3eyc9Da2SSo9
	evgFSMLJOX1W6TJFbfJxej4+etJajiAl+EsllgBq0lbaU+kHClYaI7nwILwAahi9V/KI/Zht1P5
	jBdUuqdZ9jZDACEsAmKZq78jAepXDDUEOP2O/EUb3a1pFXLapFcp0a50iTtqXsrtEWpX/CtdoHI
	hGTFsYSALGX/CDbah7uIBpnsCGhjIRA3CVzuqsnbFhwQq
X-Received: by 2002:a17:90b:3f88:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b3d074e2a8mr5208458a91.17.1795084480615;
        Thu, 19 Nov 2026 02:34:40 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:40 -0800 (PST)
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
Subject: [PATCH 2/4] ASoC: atmel: mchp-spdifrx: Use devm helpers for runtime PM
Date: Thu, 19 Nov 2026 17:34:11 +0700
Message-ID: <20261119103413.31729-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119103413.31729-1-phucduc.bui@gmail.com>
References: <20261119103413.31729-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_023442_839612_68E39BB6 
X-CRM114-Status: GOOD (  17.15  )
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
 sound/soc/atmel/mchp-spdifrx.c | 47 ++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 7d80f35576cd..25122f6ef3c9 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -1079,6 +1079,15 @@ static const struct dev_pm_ops mchp_spdifrx_pm_ops = {
 		       NULL)
 };
 
+/* Runtime suspend the device on cleanup if necessary */
+static void mchp_spdifrx_runtime_suspend_action(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		mchp_spdifrx_runtime_suspend(dev);
+}
+
 static int mchp_spdifrx_probe(struct platform_device *pdev)
 {
 	struct mchp_spdifrx_dev *dev;
@@ -1141,11 +1150,22 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
-	pm_runtime_enable(dev->dev);
+	err = devm_add_action(dev->dev, mchp_spdifrx_runtime_suspend_action,
+			      dev->dev);
+	if (err)
+		return err;
+
+	err = devm_pm_runtime_enable(dev->dev);
+	if (err)
+		return err;
 	if (!pm_runtime_enabled(dev->dev)) {
 		err = mchp_spdifrx_runtime_resume(dev->dev);
-		if (err)
-			goto pm_runtime_disable;
+		if (err) {
+			devm_remove_action(dev->dev,
+					   mchp_spdifrx_runtime_suspend_action,
+					   dev->dev);
+			return err;
+		}
 	}
 
 	dev->capture.addr	= (dma_addr_t)mem->start + SPDIFRX_RHR;
@@ -1154,7 +1174,7 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register PCM: %d\n", err);
-		goto pm_runtime_suspend;
+		return err;
 	}
 
 	err = devm_snd_soc_register_component(&pdev->dev,
@@ -1162,34 +1182,17 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 					      &mchp_spdifrx_dai, 1);
 	if (err) {
 		dev_err(&pdev->dev, "fail to register dai\n");
-		goto pm_runtime_suspend;
+		return err;
 	}
 
 	regmap_read(regmap, SPDIFRX_VERSION, &vers);
 	dev_info(&pdev->dev, "hw version: %#lx\n", vers & SPDIFRX_VERSION_MASK);
 
 	return 0;
-
-pm_runtime_suspend:
-	if (!pm_runtime_status_suspended(dev->dev))
-		mchp_spdifrx_runtime_suspend(dev->dev);
-pm_runtime_disable:
-	pm_runtime_disable(dev->dev);
-	return err;
-}
-
-static void mchp_spdifrx_remove(struct platform_device *pdev)
-{
-	struct mchp_spdifrx_dev *dev = platform_get_drvdata(pdev);
-
-	pm_runtime_disable(dev->dev);
-	if (!pm_runtime_status_suspended(dev->dev))
-		mchp_spdifrx_runtime_suspend(dev->dev);
 }
 
 static struct platform_driver mchp_spdifrx_driver = {
 	.probe	= mchp_spdifrx_probe,
-	.remove = mchp_spdifrx_remove,
 	.driver	= {
 		.name	= "mchp_spdifrx",
 		.of_match_table = mchp_spdifrx_dt_ids,
-- 
2.43.0


