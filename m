Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46862606A68E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sg16dsOY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txzQMgpd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ArMJaHbGKbGUeWN7hQdiXN3NlwJTftX/zR/PjftffQQ=; b=Sg16dsOYtcTMdDCOx/VyaVR6//
	NlaTGkksH/6fD29OpLDxGOs9Gny/erlGMI7loitnUex3IRvlUJESvGUhcoLdpQyFAH1FNSWyL0RrL
	UEsfg4u1ML2XF3yOYXevkH/BhdERSSmD0bSMU3vzkPbuWFBzf9Lqq2uUaMXW7FE3MaBYsXzVohUy3
	Egi6VcBrbEMJdT8vs3QdPiqtbgpijHwMt2v0a0hqTf6/88gV5dAbfY9GcSV0vbfv+wBfC021tiQoW
	KEGNU7nin0+yQ9/Vt56GeZER+Jh+MLC9Lz/IBizlch3eqy0Ly8fOWPjV6jeQonvw9kjiGAe+5jFM3
	25tpgd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWOW-0000000Ci4h-3GRV;
	Thu, 26 Nov 2026 10:08:00 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWOT-0000000Ci3g-3x8z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 10:07:59 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so3581144a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 02:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795687677; x=1796292477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ArMJaHbGKbGUeWN7hQdiXN3NlwJTftX/zR/PjftffQQ=;
        b=txzQMgpdgi+awiOcb49ClKyrpEzhJ/fTH/iW35FTzn/6NzPxXZZZxbWZ1JfIknkU4p
         tJIC8umYna3bIjjuc+FTpsxduiZec2H3X+MVajsCkRukBFFMcj7PpqpLFLkAq0kCn/O0
         l4aYN+6WriTVePxwfJ5/6Iw3VXY0ccwzLDN9HubtOXg+4GtJXSxJUYSG1GieyIi+G+V/
         Bp3GftaFVAQHF739IUBhH2Gic8Qj3sFPHGj4zfjPfs+xkDMYUU4bAQ+vgOj0k+SiLh7h
         o4mXWhZWQUdYOBcXB7gkXFu80C8+eRg2NcnMvnTO+xlx2gJtHrJyx8lMZYp4moEyk3Ci
         uk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687677; x=1796292477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArMJaHbGKbGUeWN7hQdiXN3NlwJTftX/zR/PjftffQQ=;
        b=GAPdfHegxLfDcXOIFNH3DheQaGbcezgX4Gp+Ss6YiLv6DSg0q31pRg2RoxanakgZdb
         /lQ3/ow9lU6dkN/DeR6m8IccwAepCCd7eGgB3dw7f3CCEn/LkP44cnpG29wO8hGn3JjB
         17pUriw9nyc5seB6wFNqSLXlS1mcut373aOyFZ/BXVBRwQYsq7GOamSN6MHVozDhjlML
         /EKHNzgSk8VSYJ99xXqyYngyB1sx2Q0QL20C4/9/m67atpZNUv2pu9Va8/5PgSsmHce3
         k6Ui1Y6K/WHczoB5GWNCA4+iY44xL56ce1FgjSS7phgo97bSszah7LOLC9V3ixXS+wL3
         ErXA==
X-Forwarded-Encrypted: i=1; AL+hErEKzHgFJ/s/7RkUqNGcZdIx47GCSm2Aq5yeYahWGMVuW5QH6CDhiXifdv77EsqkJKNWZ0QCf1mwLrGLPPIoJjUh@lists.infradead.org
X-Gm-Message-State: APuU4Z+Y0M3pZw1OJRMlHjbSae/IkDMk0hoFlPxK3cxi4fRGbdqvQEgn
	g60nA9Gm9VDn9wxYH6txYKMHS+pyyFBxjKP0ohKEP0OOnWTzrdnoXXHy
X-Gm-Gg: AZFdTZfwxe3/+LVjMZwaH6qJ5Myt4WuQMsH2qGMDCS+3WyvA021FW6qHnU7QygH9Hcs
	43+SrnBsoK6WZKgcgd0Az7djK4ABczlS5BoAWnQvHBbyO9LVh8A+NiNkHK1OCHeBRve0OqFwCQ8
	VJl8Vy6wSgOVUbwccFl5tSS3wnKDJ+X6VyCINa8fWcaZhITXFWSP1KPBjD4VEYfKrEnQ+zWzno3
	HdRfTjj10Qq6zDWaBLbFROSIj2sHugSe1t23P2IADhSh6N6xhm/kJAwZpVrwOSgPAVf6dVleNd3
	BoNeemeLuirs8/P6mIENqN4LJvbaoL8BozL46KhkBnMqrg1oHry+0Tt1rW23j6dlEAF4Ds/LT8y
	poTp5hBXHWl6024YXb/CSN1bGakBbXSWS8JsVUoceovj+YX/UyWce8BtBbzDPMEsU6o0d4Q9JR7
	snDOpik+JhAuFOLcaabXnKBKyFX2jo2ILJqvXsKp1biHHctudWyFgRcSbN8oQTbTfxyv3Ah9+sF
	u6ZVvI95yuVTYsv2sI7Yf47L4AotdIra0524UzYU++zL0FNK59FvpQ8Co0ncF7eYqBRhgIjB4yU
	G1SVFulDDEcfe3gx3E88oe9yIU4gCLaVDTsogPlPCNr8rw1uoUZY9qCqOfG9Y4SeCTeTnvSnwE2
	+Zkibd2UjCsyZYcovzCs2xqduytuOQkKzbpcGGHz925E/
X-Received: by 2002:a17:90b:5109:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b41c953f98mr21178436a91.49.1795687676930;
        Thu, 26 Nov 2026 02:07:56 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm15034992a91.3.2026.11.26.02.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:07:56 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: stm: stm32_adfsdm: Use devm helpers and drop remove callback
Date: Thu, 26 Nov 2026 17:07:30 +0700
Message-ID: <20261126100730.10594-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_020757_986425_D3A967C7 
X-CRM114-Status: GOOD (  13.39  )
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

The components are registered with devm helpers, but the remove
callback unregisters them explicitly. Use devm_pm_runtime_enable()
and drop the remove callback.

Also get the IIO channels first and register the PCM component
before the DAI component.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: Compile-tested only.

 sound/soc/stm/stm32_adfsdm.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 083dc4c26274..cd54fd071b2b 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -336,12 +336,6 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, priv);
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &stm32_adfsdm_dai_component,
-					      &priv->dai_drv, 1);
-	if (ret < 0)
-		return ret;
-
 	/* Associate iio channel */
 	priv->iio_ch  = devm_iio_channel_get_all(&pdev->dev);
 	if (IS_ERR(priv->iio_ch))
@@ -357,19 +351,17 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = snd_soc_register_component(&pdev->dev, &stm32_adfsdm_soc_platform, NULL, 0);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &stm32_adfsdm_soc_platform, NULL, 0);
 	if (ret < 0)
 		return ret;
 
-	pm_runtime_enable(&pdev->dev);
-
-	return ret;
-}
-
-static void stm32_adfsdm_remove(struct platform_device *pdev)
-{
-	snd_soc_unregister_component(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &stm32_adfsdm_dai_component,
+					       &priv->dai_drv, 1);
 }
 
 static struct platform_driver stm32_adfsdm_driver = {
@@ -378,7 +370,6 @@ static struct platform_driver stm32_adfsdm_driver = {
 		   .of_match_table = stm32_adfsdm_of_match,
 		   },
 	.probe = stm32_adfsdm_probe,
-	.remove = stm32_adfsdm_remove,
 };
 
 module_platform_driver(stm32_adfsdm_driver);
-- 
2.43.0


