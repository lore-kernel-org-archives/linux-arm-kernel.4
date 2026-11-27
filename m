Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDC0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ra9W3Oo8;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=C4Da9/tp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=; b=Ra9W3Oo8o82qQI
	qBWk8vNKPnLrjfg9Ut8bMO6hgESUYpPMg1sBE4lVNNqIdPV3bvEPWVv1uy/765h8mgA9FJf5pCUFG
	7UXBeOSf7EzOW9a9U/5DAIXJ+evD/b4VX5L0Y3NdRWIvUy/Rjotbov3GE35YfDcwZaUPSl75V6Og3
	4yYa/4WahHurWDOVTpHPNU/cQEFqhD6Bld5a/fgm5dZW5bALeFMe5xKWSkPy4b3exVp8qS7j0fBoX
	WM1gZp3u5UONyPbvwuhVo4+QdPylwad8pHlmbmaRtJ6we6s5EgF65jXsPAnj6MYagnLZl0gOIE6uz
	Jl1PsP1HNcPIgqLvlN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuy4-0000000G5FR-1YiP;
	Fri, 27 Nov 2026 12:22:20 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuv0-0000000G3Gu-1pxb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:12 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-497614c95f0so4584471f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781949; x=1796386749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=C4Da9/tp4z0Jezy32QZC6VHWonxSS7lOMEoLWgNxSPehsc27oTDKORhHDXbCuBL75b
         Hr9hqEfw+IsQCa6IFcq7bZVeuzqfO1GQIcUF3b45jlDIDWeCKULVkECVGROpgWpLud9E
         v8rbiEKT5vkuRVYsLHfJ4i1SqluMcMVFm1IJs36cvobZB/a2v9l+v5bGzIpIgPDoUtvG
         +6K683zjYz+xD1ehTRj1amj86cLQ1Mfj3n3sJhexeY46Vh8I4gNFZSPjXO3TUC82P/UZ
         MgAAQZ4Icw3o2nnCEaDdNBK+bgtJ6wUN/GVseeay6XhZzVmVjC6n3uuTm53qqMRg9D4g
         de8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781949; x=1796386749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=rA8d895ag7SirZE+X96QU7gQ5iQgPfrgTNxXeWj+wIrvRaNxySMr2DvqYQM/yJheVD
         kFEI8xLbAY+Ne10pAmhVh/Xb22guf1OsxgTOpAECu8m01pO1VVWoZOlIvY+/u5/Lf6IT
         te0oZacj9Kdzf8GgkczqiP+NoLaTq1diWxDMsJX/IdD/nmprcNVT5LUskeQqwmw7FmPq
         zv1U7XTUYU5zklfDHwlNwy5K3Z7XksRvwp0QboxNad6hzu0D6OBeW9H3HyfCWvM533M2
         ziT8Jdw4d5RZPVccIN+sU9RsmQLyFCrOoiqJ4/4g1pauv0HWSl7J+iw5GWMw4t0ZZZ23
         mS5w==
X-Forwarded-Encrypted: i=1; AL+hErGfgvDOBaVrbBBMz+CiNBK3jbcfiMHPl3YAthOJT9jS1RVZhx3XsZf5UqgPPVs+K5DSVhf7gAIeZ0oWPW45KVBL@lists.infradead.org
X-Gm-Message-State: APuU4Z/uieWcWC0os9tV1GLwnUhZ5g7miW0vxv2okRn9vaooFXx+xAhT
	0pgtl50MnBlstAmJGXZ48aqhEEjLXEFff8IzLgxE4BNrPMOB923VX8R6S6JOVElA8m0=
X-Gm-Gg: AZFdTZfOLoKIE1PJKQAh811gKaDbJWMTpjhf8Ccxl2LYbrPAvq09zqc7/sZGRc4KqeS
	QRgHerFzmQEpTAtCGY8x+4TiS/WZVeRTwsdyKKiufMtXr3SFIZt/50LkM3V8XtSpKQg1yfXLK9m
	9eTcTZ2OTKgJZLlL5xzw7HyVFPkbklWPRcvX6SYLL739+wQj3hvYwWJcU/HAAI5eE6uBsrgpI9A
	mgB/DhHBdDHnacfzBB9LG4Ff/331hnvfooEMEIYwJXs+tuLy4rSO6drv5jh+UsXAmeKt5jbf0uU
	ADmCHLjkXirMfDdDHoSyviPlGUJfTflWwKmzBOF7ReANns7ixTZu+HHh5JE3n3wvbWNG/m0pWUJ
	D29NKLBDL5zJE0Kjv4Jr+EH13xyAaODZTI4dmFyhlen5xiopFyzZKGxYuiuS+zScT3S6hMbo58o
	LwLYdQEyeKzVbIvP/dtK7VuItNqt6FVI210GMvySyXhhAm9za5+SLbIIIzPR3cMLlqxrlz1R25R
	uguJckCKfrnr8877O2kxd6fTjvOM53vHalfweYKXxMqXZ1kqYpl2BrC0roL3UD+h/ruBp3hjaMP
	8XT0uDBL9/1NVzuqBoYagKxjVnJR
X-Received: by 2002:a05:6000:2685:b0:4bc:9b4e:62c7 with SMTP id ffacd0b85a97d-4bc9b4e64ccmr8999178f8f.45.1795781945689;
        Fri, 27 Nov 2026 04:19:05 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4bef07f9e0dsm3454109f8f.53.2026.11.27.04.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:05 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v4 17/28] ASoC: bcm2835-i2s: Pass the CPU physical address of the FIFO to the DMA engine
Date: Fri, 27 Nov 2026 13:22:07 +0100
Message-ID: <20261127122236.4976-18-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041910_508945_9C97443C 
X-CRM114-Status: GOOD (  16.68  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The address of the DMA slave is handed to the DMA engine through the
dma_slave_config, where it is meant to be a CPU physical address that
the DMA controller driver translates into its own view of the bus. The
driver instead reads the untranslated address out of its reg property,
which only happens to be what the BCM2835 DMA controller expects because
the DMA engine driver used the address verbatim.

Now that the DMA engine driver translates slave addresses itself, use the
CPU physical address of the register resource, which also gets rid of
the open coded parsing of the DT node.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 sound/soc/bcm/bcm2835-i2s.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 208977828254..ad95412cc8b5 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -30,7 +30,6 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/slab.h>
 
 #include <sound/core.h>
@@ -843,8 +842,7 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 	struct bcm2835_i2s_dev *dev;
 	int ret;
 	void __iomem *base;
-	const __be32 *addr;
-	dma_addr_t dma_base;
+	struct resource *res;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev),
 			   GFP_KERNEL);
@@ -859,7 +857,7 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 				     "could not get clk\n");
 
 	/* Request ioarea */
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
@@ -868,19 +866,12 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->i2s_regmap))
 		return PTR_ERR(dev->i2s_regmap);
 
-	/* Set the DMA address - we have to parse DT ourselves */
-	addr = of_get_address(pdev->dev.of_node, 0, NULL, NULL);
-	if (!addr) {
-		dev_err(&pdev->dev, "could not get DMA-register address\n");
-		return -EINVAL;
-	}
-	dma_base = be32_to_cpup(addr);
-
+	/* Set the DMA address, the DMA engine translates it */
 	dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK].addr =
-		dma_base + BCM2835_I2S_FIFO_A_REG;
+		res->start + BCM2835_I2S_FIFO_A_REG;
 
 	dev->dma_data[SNDRV_PCM_STREAM_CAPTURE].addr =
-		dma_base + BCM2835_I2S_FIFO_A_REG;
+		res->start + BCM2835_I2S_FIFO_A_REG;
 
 	/* Set the bus width */
 	dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK].addr_width =
-- 
2.51.0


