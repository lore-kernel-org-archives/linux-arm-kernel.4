Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813E3606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uly7U0Kv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sezenHww
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/MIwZSnhApfikm80S9HZrGcLf+++ffdILf8yJv3pCLw=; b=uly7U0KvmhAOzN
	tWB4djzy8MGhMyXdJcrbbfAk3bK1d+ltIq4/wRSyAxmglGBAEfJTGwugp2r5gDEBPlqwmAAs/TZ4q
	vYY+MwKdtBWT/WkxdC3lYEfhjhXQFHbtMHy4ZF3X99ryAH/rB0AffuR16Sdr6s7RkBSgD33d7ICA0
	mV+X6xM3RHHiPG0xXqhqNg2tVK5IFMb6FjH6Q12qGyO3kx46jW8oxmdn8nekcIPFfpUFU9RY3Eb1N
	iJrdIlMLkMCqm5UZatxzuPK/JTH5Gz2ttY1fM/rC1ug5BpD9Ie+3OSSGKmYNhsNuzvMt+MTMqhNF6
	JdZOLSvwhTO/Zytb4diA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO9G-00000008ne3-3iM8;
	Thu, 12 Nov 2026 06:19:02 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO8L-00000008nPJ-1Lo3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:18:12 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-93e64d52949so331952585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 22:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464284; x=1795069084; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MIwZSnhApfikm80S9HZrGcLf+++ffdILf8yJv3pCLw=;
        b=sezenHwwSoZVVd7DS3c66k14qgnVG/jurM29o1eiJebFFvjMqccEKuxlFE/qXCeoQ3
         tPs88gSdHbE0UkGoS8oCJh+HzgFdV0UJeTtR4xobcgXitHpSO0uukPIUhD8/apBFQ44T
         i3Sjg2tWv+EawCeQtoEK7Dp67pRN5cHAbiiLbIwO3k97jcnLCWroZH6V45eRcxBxPqmF
         Mh10vHHjNnPHgDaWR8gjHNh49D4PpWejHQMORfn4RCb2m7fGRXV02ZsBdU8yRV28cjoj
         sQeKjxh2oKh9C7uSm1JtGAeEYUBJ8nHmALfRcbD0apdK5BeF/NcXxvEaDAn7ylVUvdrG
         llcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464284; x=1795069084;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MIwZSnhApfikm80S9HZrGcLf+++ffdILf8yJv3pCLw=;
        b=Eg6aUcsWAH+QRPwPBvMXMBWcgBWdRU5kx2/uazkbjI9xAoyUqzeYbaNvZuJ9rpuN5x
         RSeb3ZwYeBKzMIMJBVOlrceKmZbGQk+HuyFfi7n9hDrnNGwGZTHri5iaNmNIsjWvmgHP
         3SYZ1i2UwtUrMDqt2csC7tJKjkRvCuDK+Mt00OL1PgSzIWaJ8E8dSV8ZVvVBeyIKo38k
         dKB4B406tUmQR2wGmp2ZqA+mABz8ScXJ2YKGkyon7qe/v3mivqXqUsrhZcixbKdPxbw4
         7UKsBpxBEOLQo/ab9TSGit8cTuq6yjjcmCyXEcwr6c/ktSDKnq6fjrI29yVGLbKOEUIU
         oVCg==
X-Forwarded-Encrypted: i=1; AL+hErFzV+wEO9Ob3EQMjkkVMcMBREBki7Q2lhRsoYOEIq+muXz2ew0rvkD946YaQbDNb6Z18jVlLj5d3cjZq+j9fjGw@lists.infradead.org
X-Gm-Message-State: APuU4Z9WM/8/0Qj0CoZ8xR5yMGWVBzznb6SdCb88ZKooFcd3b8Jxe1f8
	B86cxHefPsEAskeSKihvVFA0ilaWGyI8HeKo2xZTo18wL+R9rUGpIKY=
X-Gm-Gg: AYBFou0yMtWrlbqRdiqqCwwlFv4yJVrG7Fm2MEln1g1Tj+MaaSJZNzo28t1g0D95oXg
	GHOW7AjdxAjcnFLqwI0Is3yyC2ahJQFMyViggxZQtZfSjObzHBHT79Sjjrox+HpV4DTj6wgu0Vf
	LUKefxImNV6sanE1bNlaK2+ssIkFMZ+/B4Z2W/vAIAiJ1llZ0QJJvIBeSxpM+uUfYIiZErNuFaz
	sxkS6dd+auZTXIkXFTVkxd8FSGL6BIOSZzoXMJ1QWcWfvqldSfPAdcSVd6f4nLniuQ93STG7kaf
	eJGEGA6jN73zBwK2Rxdr+X9OiMty9LWUbJTHdmGttdNUDVXLTAuMMWq4x/UDD+QJ/4TdaU1V/zs
	j6zADOte2mygPSwZnGmLTESxf5COwqBtGnfROrYRZmlU7Q4Ebo7Ye7zW8MeARguAMT4KF6x931w
	hDUqRfFnY6FG3AvR13qvicy0mNSY9+yzMugJlPdyBlPl7oKQ2+IeElnfIVdwDACWm567N94Zt7D
	RJRntiPPozI52UsabSq13w3HcPrTcM6NtT3t+y3E4upFZ6WJwl1NC1b9RI+IcwjunmSbMsBmTZX
	23BqfxyyEs/8zxbSfR540Sxuew7TGqNd6wFu+UxP/dVMZ2QAaLH/V41FFGJouQGCQqPZLlUGNi1
	b9EmovAIRv3a2LFF6K/y4AGpyKmi9ulbwZLuSMSxwNnmqjthrXn0TG4j8wrcNNUPOyPIkZS6N8M
	3ugBuieLqnYDji8DLS26coqNVSMa2+QDvP
X-Received: by 2002:a05:620a:2257:20b0:947:b201:fad7 with SMTP id af79cd13be357-947b2022eaemr552868385a.67.1794464283900;
        Wed, 11 Nov 2026 22:18:03 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.18.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:18:02 -0800 (PST)
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
Subject: [PATCH v2 5/5] ASoC: mediatek: mt8188: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:49 -0500
Message-ID: <20261112011708-afe-v2-5-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_221805_690478_18899237 
X-CRM114-Status: GOOD (  16.74  )
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
releases the regmap before the IRQ on probe failure and removal.

Request the IRQ after initializing the regmap and before registering
the component, so that a failed request takes the existing runtime PM
unwind and devres releases the component, the IRQ and the regmap in
that order. The driver has no remove callback, so the IRQ needs no
explicit release.

Found by a static analysis tool under development.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index d9c82cd8869e..2a27e5de9184 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3306,11 +3306,6 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (irq_id < 0)
 		return irq_id;
 
-	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret)
-		return ret;
-
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
 
@@ -3362,6 +3357,11 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
+			       IRQF_TRIGGER_NONE, "asys-isr", afe);
+	if (ret)
+		goto err_pm_put;
+
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-- 
2.43.0


