Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C00606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ErfVlbrb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=seD4MQQW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=scKDB+4ysDPeICYcN+FMLGOBAhCWSy9TC1S72F4YsSY=; b=ErfVlbrbhnB7Mmr3VZJkPDYaPD
	O7d2+kh/2XN0lTmVX3gZc4x+N8UfO7LNoAPl+V6DvANY0IheTvLbrpk6wzIsSJb4rJ+wcNHWKgij+
	Gv9ORGVI5fBRtLqDO0isv5T/xVL2aspERVqC5Q3Gyh90M9wc+QnMW150SiT81+rRRzUPhxhR6Rd+5
	Dpbdpm0s8vqc6z4DIM5L/69x/sQnrECjgYbfFJQASA0+bjoYjmmgeGwLjOsjXZwDmtkrQVv7MuEC/
	9iSu8ffJFB9qUsYMwvRulu0FVr40L0cNWWKGhsZ1d2tTJ6jJ1eGsHvcO+kMFGRALlCBQbByeYRRD+
	+XgiyanA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAYX-00000009VUM-1yzx;
	Wed, 25 Nov 2026 10:48:53 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAYT-00000009VSe-3lyg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:48:51 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-38190551625so11161181eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 02:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795603726; x=1796208526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=scKDB+4ysDPeICYcN+FMLGOBAhCWSy9TC1S72F4YsSY=;
        b=seD4MQQWnP/bbrLFdfZQFC9K/hOQZGtzAnmLAjc38ou9CUJ1HbkkPWXMoKtg2aKzOQ
         1iy4UdYnY3egwRgJFNnQ5hYD7t7MyyXD7lBOyeBTv9bkfXaTD9EqOFrgIEJpRhZBnocV
         a+lJMmVmDK0gxrHjCCTsI04JvVS8U4NCClklGqczlsfrWqn6CC0dAdws0BLfr1od0BZ+
         7tWcB892x3C7OIv6X+shAkxSqMrO/YQMsl9ryNh8MOxM+KyLdah8D3QdcMKNgSFTK7as
         VcyIYu6eccW+FinyYyK+bJyV3WDtXPpGcUz3NISsaVcKQTRaAHFM20c8hCG55DNQQYdd
         BATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603726; x=1796208526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scKDB+4ysDPeICYcN+FMLGOBAhCWSy9TC1S72F4YsSY=;
        b=Biv5AdthRliJrktGg2pdmNsozLeZp/YJVZOMv6tzLPLQ6K6H2VRbN0+7TOiv4GYvz2
         qctFidwzgJCY5PKKkGWMKJVcKDFZyrPPKv2y4f4YoUMN2r2Zk/Gi8ERNoRj4DeDZnvDw
         8c6rlHf5Uy5u4kw8ZxboEBImFXvJ5vDQzaabpzWz66pt+Y3sk3qmDe20hHGYZo9WXFSf
         ZQzoNlcyag3AcJ5bcIXVW2+CiVR2V/QKYitGbJ+c5IdBWduEG5LODBeXdLOLtTytAM2H
         r3ynhkdLRs87q75rGnZJ1OfSfQsXh1Q8RG4W+paP+VENRzSYLelKDEhXyb8aBO3vwuCU
         Onlw==
X-Forwarded-Encrypted: i=1; AL+hErFMmjk2GcRjCbgGrE90JKEXQ331u/Vu5DiLEV74vY2MBBadTyGpyiqOu9zHZg0sVjt6gXI71YCxVN1Zzn/0zO+R@lists.infradead.org
X-Gm-Message-State: APuU4Z8DiA68H7dZT6dJ3PjqMfnnSGxrnyVA5Mg/lKfcs+1uV9Jwgaew
	mXnJIellbb63Ku59fSbT3rals57P0rOgMrA11IZ9Yu861C2tq+Q+Jr2V
X-Gm-Gg: AZFdTZeiTOOnT29SBdSRnoEArY5/x4xv2RyEi3Gjc5uhZ+qw2L5vcatexYZwlrfd4f6
	ebJFEsN0+5lQU5MGrfxrB17u6vWqs8ZhFWPqbSclBGeMLf7+tEaF/Dh4OQM8qUaj8SjqHq1lQ7r
	bTlDLoB7R9DnHrIjPGdtJ77Uhk65LxPtjbLv218mXcKjWcbqvC9RkGolxxEizd0n4UiA0jHyT22
	chUDXzNgENBWFpbtXSxDpqR1gZ8zWD74XliQSYAj2Tqsi27MqzF/61R5/G++52DeAplciid4Bqs
	3XJaCSZJ3QAjlAmGxfSWR3SIMi7EjrGHvjJIpM8pF76s3hqaSpVkA+8Xq0wTHMuSA6il5JXi0UA
	cbRq9xRBfgXOgdt79isNpAOJ8dTcCvAF64cuAnczvVRcazqM8JXlwWm5/YjHh51zCALiDbaM8Jp
	rHYVNeIieY3m2b5iWqAXVIVuGVUzdDaoOOyjOFRkXVEQMjHI7s3J4hfczSHjQ3nBJ2vtppqphdh
	FpnRgTgpSiHkeQBWHU5jFE2jH6/i8r+rQ3pFV9B/ir1ev7+fBoq38/5xG1MbTy1X+9J+cHKGwFG
	S74nXaM6pAamrKB+WX7F1DH2uZYFTVtQHNiaWhqYRxB8OPAKbkVdNHHmZ7yVoJ/ZwpAuNu+ztVV
	MPuwF8zIJMxMBpjjqX+i9tSm2R90wex251J/FM3546EpWjGeJKbX8t8SoSEtXIU53Wg==
X-Received: by 2002:a05:7300:2301:b0:385:4c54:3c8c with SMTP id 5a478bee46e88-3856c0c9403mr26134992eec.1.1795603726239;
        Wed, 25 Nov 2026 02:48:46 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm45094758eec.19.2026.11.25.02.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:48:45 -0800 (PST)
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
Subject: [PATCH] ASoC: stm32: i2s: Use devm helpers and drop remove callback
Date: Wed, 25 Nov 2026 17:48:33 +0700
Message-ID: <20261125104833.514491-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_024849_944405_D3359829 
X-CRM114-Status: GOOD (  15.18  )
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

Commit caff4ce8cc58 ("ASoC: stm32: i2s: manage rebind issue") switched
to explicit registration and unregistration to address a sound card
rebind issue.

Commit 58f30150ffd6 ("ASoC: core: Remove only the registered component
in devm functions") fixed the underlying issue in the ASoC core, so
devm helpers can now be used again.

Also use devm_pm_runtime_enable(), which fixes the unbalanced
pm_runtime_disable() in the probe error path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: Compile-tested only.

 sound/soc/stm/stm32_i2s.c | 42 +++++++++++++--------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 79465be82cb8..e6e861a957dc 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1255,13 +1255,6 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 	return 0;
 }
 
-static void stm32_i2s_remove(struct platform_device *pdev)
-{
-	snd_dmaengine_pcm_unregister(&pdev->dev);
-	snd_soc_unregister_component(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-}
-
 static int stm32_i2s_probe(struct platform_device *pdev)
 {
 	struct stm32_i2s_data *i2s;
@@ -1301,56 +1294,50 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
+	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
 		return ret;
 
-	ret = snd_soc_register_component(&pdev->dev, &stm32_i2s_component,
-					 i2s->dai_drv, 1);
-	if (ret) {
-		snd_dmaengine_pcm_unregister(&pdev->dev);
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
+	if (ret)
+		return ret;
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &stm32_i2s_component,
+					      i2s->dai_drv, 1);
+	if (ret)
 		return ret;
-	}
 
 	/* Set SPI/I2S in i2s mode */
 	ret = regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
 				 I2S_CGFR_I2SMOD, I2S_CGFR_I2SMOD);
 	if (ret)
-		goto error;
+		return ret;
 
 	ret = regmap_read(i2s->regmap, STM32_I2S_IPIDR_REG, &val);
 	if (ret)
-		goto error;
+		return ret;
 
 	if (val == I2S_IPIDR_NUMBER) {
 		ret = regmap_read(i2s->regmap, STM32_I2S_HWCFGR_REG, &val);
 		if (ret)
-			goto error;
+			return ret;
 
 		if (!FIELD_GET(I2S_HWCFGR_I2S_SUPPORT_MASK, val)) {
 			dev_err(&pdev->dev,
 				"Device does not support i2s mode\n");
-			ret = -EPERM;
-			goto error;
+			return -EPERM;
 		}
 
 		ret = regmap_read(i2s->regmap, STM32_I2S_VERR_REG, &val);
 		if (ret)
-			goto error;
+			return ret;
 
 		dev_dbg(&pdev->dev, "I2S version: %lu.%lu registered\n",
 			FIELD_GET(I2S_VERR_MAJ_MASK, val),
 			FIELD_GET(I2S_VERR_MIN_MASK, val));
 	}
 
-	pm_runtime_enable(&pdev->dev);
-
-	return ret;
-
-error:
-	stm32_i2s_remove(pdev);
-
-	return ret;
+	return 0;
 }
 
 MODULE_DEVICE_TABLE(of, stm32_i2s_ids);
@@ -1384,7 +1371,6 @@ static struct platform_driver stm32_i2s_driver = {
 		.pm = pm_ptr(&stm32_i2s_pm_ops),
 	},
 	.probe = stm32_i2s_probe,
-	.remove = stm32_i2s_remove,
 };
 
 module_platform_driver(stm32_i2s_driver);
-- 
2.43.0


