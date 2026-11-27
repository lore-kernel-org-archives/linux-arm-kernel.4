Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DB6606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rnm+6l2W;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OVAFVKw9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMNNSjlm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ml69IgRKM7/7TN+34G3sEPU4t74jsAOvfTxlEPAKFTk=; b=rnm+6l2WA3ZxUS
	tduDzWZwC2XKuNs64MM+/FCQoBmKiKDqHI7NJ/Cq0z1uNdYmIY2MvnEI0MpVznOYhXFwuH5UL5T4w
	ru5Eh7tTmb4VaXJD4gW90yP8js1ikm+z0yzSfkDzrJD2TpzFeM/ct9BCyzNCUaQexRKngHtxVBfof
	3i5XrMKGU3+xpWdeBMSI5SpBipAMVj+/vTOa/nFbVy/60Z/z+NEu4FWyJ+d6jiebqfFbCS3TwGQ9B
	sbwQ9DpRuvxu7hlIISKxlf6xoZwzN4C9qzqB19DjChAzoKP0cipGFH9cXjlPqxTDGuwiD6YudxKLR
	IVJWwvtT5aThWqh2XqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsBm-0000000FQEr-2Xca;
	Fri, 27 Nov 2026 09:24:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsBk-0000000FQDc-4AGK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 09:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ml69IgRKM7/7TN+34G3sEPU4t74jsAOvfTxlEPAKFTk=; b=OVAFVKw9eG/N5n3vxVp1QPgEnJ
	vJMrgJMU8uBa+sn7P3PeInyN/8oDw+9KX2M2YqKe480zvNTBEZrmZBcamn1IidGo2QkRK2gR6tYo+
	6w2ggls6jYYnm1spiq6mfGhSCRAFibdVJL68J85hGAW966KkpLBVkr5gzhDbpd7xBYSMJj8uAaBAS
	AP1ELPWknkdXeF/6wUtc5gHVRMpnFSmYh0LrEV3bDr0rXmSS7HJwXuVdvZvJgo1RLC0XUlA/t9Qwh
	zw8gXvrTrmHvYWfYEHbckJJsFWp4s3nJum7PzzVQifhzeF4xdEW16vbmdmZA44IW3dqedljuSN54Q
	XXqXB8cw==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsBg-00000007Vfe-17OM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:24:15 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso4545717a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771449; x=1796376249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ml69IgRKM7/7TN+34G3sEPU4t74jsAOvfTxlEPAKFTk=;
        b=AMNNSjlm7ihjnjGhRcoOskWIznsVCAGOiU9EFD6BNS7LK9ASAUePJ3ebjtIU0W/Qc5
         dfFQdvSgLA30/60E/Ix3Gr3vwhzBat0AK/VqJR8OB3vKYYoUjw3NN8t08HL1pvqC22+z
         lJY5xpAeSEIlErp0Qibe9Bg/v9+40wWVZGf0KdK0keRHDybau3tAznB5i2NM/gzGpsuD
         SaPdoXzHJbrGCC0Csjva3lZSvY/MzjUOMbAHuaWCgEflTSXfZs0657WnzUttHmx7pns1
         431Db4hcNw1MHRG3SsjUppJkGmfxA2M+OiJogBaIbLRpdctawXVe/wuCoP+smul56SyN
         I6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771449; x=1796376249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ml69IgRKM7/7TN+34G3sEPU4t74jsAOvfTxlEPAKFTk=;
        b=zNK+99qFAQSTX0F7Y7Qxg4XvFAzochQI9AJmMYGvIFdy9DA67iTIG43rFFJVBbK97R
         VbbdUM8NmmQYYwBG0XQPRUGzGQ8UM+tAb61HsESKmDDvNz73kdma/voMJdGoNX1htcvz
         OFjdgr94X1kSKpH4khL57nUczY9fsjXvEBfWXJbIfPwmnDSybmd1Lq26kQcOYi+zCSIo
         YfgdTnxMOSe1J9L0XDifGcpuI1K1HyoUoZH15yvaG/P61NgNtEAD9OnP9O9ohwIxhoLh
         KUTm/847/MxcA86bvGb7GrvHwHTYfrQnZ2N7pquYv6BgFL48IXYLpmQnCP7FmAhLmAjD
         5NHQ==
X-Forwarded-Encrypted: i=1; AL+hErHiXqrkBPnLLscFTTyXP3PDiW7qGdb7AuzafHhIiXbYFqTUS/dUT333w0UZiE0s3/oUPz1qhxuay/Np+PfxNW+N@lists.infradead.org
X-Gm-Message-State: APuU4Z9mPP0v52/EyfDODiLKpwmsZL8ST1Hq2A8gKyDIsgc5QbGhLJse
	H9780oBwNFyKbp2Z5oZx8zIw4HDlJ55z+yAcJ+o8VmU8ZseUhFoBpXFq
X-Gm-Gg: AZFdTZcb9WTUN/07DMnAE1GZ2nhJTjU1CgnWpkdYKEGx+bbSte48ZG0gFdJkzKXQPAY
	rVJSHmhRyNksdzX0pizTWgODDX+Ou7ka1GpFWRkzQX3aOp35U+/LHF4Rm2Xp3B5N4Ir0ktV/psF
	lp6oxMWB3rHeHjVmRYeJ0+Ttc1+cSfhnhJ3jJI2xKZ8zOxzGYQH5T+1smPtZjivN32/2zQ9ayas
	NgHA3l0fOZ5Omfz6Kk00/M14w8lCpbKQjJF2IH9j7PIgrNv2yKJaNi/nXQ5oL1WGDJmlus7miip
	WKB9BR0lrVuJivFvXjQuG4VPQSBrIK773Y5mBXtvLHDd2GWcGMSx0pPjtlNId0Fl5DmnoSP/k8V
	IUZX1f15N7I+omKqmD//Fn7PEZ3m4AwcKRBqdf3f9gYTROpP1YQLpFN26/dDQ6bC+22yD1nhpFa
	K/IxIwGWuAwhmKBiDD7aRw3g1BxiMi0Teo71UfURBLef7IaFq9hzuSdk8TV4KL75axy/55uFlwk
	D2DcdlIysaH6fmloDDY0RODpPY4NH5hko8T1H1604F3iEc8WBY+FZHKOp+tA1JhomZNYPfhCsoe
	oUHK1285SVKGTrJLuQMA4yekmgKMmBnX3vrrPvxb2+yFgBsQyQZy2OFSE714dRdVdKWIQgEMPVh
	KCBw9dhwRW1TMpI6GzqPGnd1tPmWYq2MPLHxP8sZuYbr+
X-Received: by 2002:a17:90b:5289:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3b41c8fe855mr25424331a91.15.1795771449232;
        Fri, 27 Nov 2026 01:24:09 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm37942052a91.6.2026.11.27.01.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:24:08 -0800 (PST)
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
Subject: [PATCH 1/3] ASoC: stm32: spdifrx: Use devm helpers and drop remove callback
Date: Fri, 27 Nov 2026 16:23:43 +0700
Message-ID: <20261127092345.12383-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127092345.12383-1-phucduc.bui@gmail.com>
References: <20261127092345.12383-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_092412_256578_CA711797 
X-CRM114-Status: GOOD (  16.61  )
X-Spam-Score: -0.2 (/)
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

Use devm helpers to manage the DMA channel, DMA buffer, runtime PM,
PCM and component registration.

This allows removing the remove callback and simplifies error
handling in the probe function.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 67 +++++++++--------------------------
 1 file changed, 16 insertions(+), 51 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index f6f7d4aaa94d..467c3c583a00 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -396,24 +396,16 @@ static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
 {
 	int ret;
 
-	spdifrx->ctrl_chan = dma_request_chan(dev, "rx-ctrl");
+	spdifrx->ctrl_chan = devm_dma_request_chan(dev, "rx-ctrl");
 	if (IS_ERR(spdifrx->ctrl_chan))
 		return dev_err_probe(dev, PTR_ERR(spdifrx->ctrl_chan),
 				     "dma_request_chan error\n");
 
-	spdifrx->dmab = devm_kzalloc_obj(dev, struct snd_dma_buffer);
+	spdifrx->dmab = snd_devm_alloc_pages(dev, SNDRV_DMA_TYPE_DEV_IRAM,
+					     SPDIFRX_CSR_BUF_LENGTH);
 	if (!spdifrx->dmab)
 		return -ENOMEM;
 
-	spdifrx->dmab->dev.type = SNDRV_DMA_TYPE_DEV_IRAM;
-	spdifrx->dmab->dev.dev = dev;
-	ret = snd_dma_alloc_pages(spdifrx->dmab->dev.type, dev,
-				  SPDIFRX_CSR_BUF_LENGTH, spdifrx->dmab);
-	if (ret < 0) {
-		dev_err(dev, "snd_dma_alloc_pages returned error %d\n", ret);
-		return ret;
-	}
-
 	spdifrx->slave_config.direction = DMA_DEV_TO_MEM;
 	spdifrx->slave_config.src_addr = (dma_addr_t)(spdifrx->phys_addr +
 					 STM32_SPDIFRX_CSR);
@@ -919,26 +911,10 @@ static int stm32_spdifrx_parse_of(struct platform_device *pdev,
 	return 0;
 }
 
-static void stm32_spdifrx_remove(struct platform_device *pdev)
-{
-	struct stm32_spdifrx_data *spdifrx = platform_get_drvdata(pdev);
-
-	if (!IS_ERR(spdifrx->ctrl_chan))
-		dma_release_channel(spdifrx->ctrl_chan);
-
-	if (spdifrx->dmab)
-		snd_dma_free_pages(spdifrx->dmab);
-
-	snd_dmaengine_pcm_unregister(&pdev->dev);
-	snd_soc_unregister_component(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-}
-
 static int stm32_spdifrx_probe(struct platform_device *pdev)
 {
 	struct stm32_spdifrx_data *spdifrx;
 	struct reset_control *rst;
-	const struct snd_dmaengine_pcm_config *pcm_config = NULL;
 	u32 ver, idr;
 	int ret;
 
@@ -978,46 +954,36 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	udelay(2);
 	reset_control_deassert(rst);
 
-	pcm_config = &stm32_spdifrx_pcm_config;
-	ret = snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
-	if (ret)
-		return ret;
-
-	ret = snd_soc_register_component(&pdev->dev,
-					 &stm32_spdifrx_component,
-					 stm32_spdifrx_dai,
-					 ARRAY_SIZE(stm32_spdifrx_dai));
-	if (ret) {
-		snd_dmaengine_pcm_unregister(&pdev->dev);
-		return ret;
-	}
-
 	ret = stm32_spdifrx_dma_ctrl_register(&pdev->dev, spdifrx);
 	if (ret)
-		goto error;
+		return ret;
 
 	ret = regmap_read(spdifrx->regmap, STM32_SPDIFRX_IDR, &idr);
 	if (ret)
-		goto error;
+		return ret;
 
 	if (idr == SPDIFRX_IPIDR_NUMBER) {
 		ret = regmap_read(spdifrx->regmap, STM32_SPDIFRX_VERR, &ver);
 		if (ret)
-			goto error;
+			return ret;
 
 		dev_dbg(&pdev->dev, "SPDIFRX version: %lu.%lu registered\n",
 			FIELD_GET(SPDIFRX_VERR_MAJ_MASK, ver),
 			FIELD_GET(SPDIFRX_VERR_MIN_MASK, ver));
 	}
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 
-	return ret;
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, &stm32_spdifrx_pcm_config, 0);
+	if (ret)
+		return ret;
 
-error:
-	stm32_spdifrx_remove(pdev);
-
-	return ret;
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &stm32_spdifrx_component,
+					       stm32_spdifrx_dai,
+					       ARRAY_SIZE(stm32_spdifrx_dai));
 }
 
 MODULE_DEVICE_TABLE(of, stm32_spdifrx_ids);
@@ -1052,7 +1018,6 @@ static struct platform_driver stm32_spdifrx_driver = {
 		.pm = pm_ptr(&stm32_spdifrx_pm_ops),
 	},
 	.probe = stm32_spdifrx_probe,
-	.remove = stm32_spdifrx_remove,
 };
 
 module_platform_driver(stm32_spdifrx_driver);
-- 
2.43.0


