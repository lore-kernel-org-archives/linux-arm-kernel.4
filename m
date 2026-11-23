Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA3E606B08D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LIlf+ep/;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WjgkJCUP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=; b=LIlf+ep/WonXBs
	jTOglaRJjozeuJ9HofpM3sdmVsG/KiiSwZ8COnVOyVFXzYQf1uYukdcbCZm+4b+zteP7HyV8K8Loj
	lLaGhdbH+n4FQBb3RzEwjqc7jtzEnEGBwsQflEOLFVkn4tJoGUhmoHasXhNrHozKD3+7ahrOE8ijg
	LL+Y21L9l5hf+R32vs+SQZ4ClrHkoNJ1cbHWEAKkafhaiXKB7m2twSYjTKikOwSTZVJAOSuRSvrwU
	ef37ENzOlL/ZoYqK6pV/dJ0Kn372Z0BpQtq0aOWmD/4nYkUov6wiKjVOihjNUsry8zJQoqRHyKPzn
	S9+3XcU2KmoAvya2/x7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVS5-00000003paC-43y0;
	Mon, 23 Nov 2026 14:55:29 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQc-00000003oaC-1eNr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4a32576da88so1959344f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445637; x=1796050437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=WjgkJCUP0ZDt9BUikJDZlTczRBWa17GQkFPk6n9FFrBF+eR4PjS42+waIxPqstECY4
         G1d9e5dxHIS92tUHaudMDnMpLX390tz9bkbrLXrQpphlMvOfIY6hcda8pmY8aetgKBKp
         4dYagCyU6Cbrq7AriQgEnt7TX56A4Y+OykaSTp4tK62vIQRNzlXD1CS10R2VHcGh5g0T
         5nCPmlFU7wKo3/lGIeJoPOb3xG3nLvyuSqm5uapjcBmGXULxifCak7JGjNR7kEifYnVk
         HCV4qp3O0Tcl8tbyZb0V0DI6A49Cuc1HxqDhAr5mapqhk4QHcqOzbDGnY5W1uasjqVsW
         mfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445637; x=1796050437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=SIvOwBv7Ntn/4ALXX4rZU0NREwCY3cR59NMdLvbF1vYPVf6FMGMUpXKsrtiGSEnDjV
         lDjH9+uxAs2cfzjAfjetOLfBgCt7hylCAkN+D6YIwWO8BmOQSR2rf+XlTICwp7mTPCuA
         bzc+oC9d2uNftVOEqGMUzi5FGATiDulqBFWDbLbhTZGxgx5+mvDkEC8fE+utk+G3AFJZ
         mEGIVjOWtMz/KN4MvG919tTxp3ANI43bnBDjk34FcFBkLSyw1Mke5hAwSTmundoGSAut
         CIQdJnCmgkJLpHs8grdHVt/A5qRR2KeSijvvWXqKC+ivvx+vvzRfkMS+Tnkw4PZ6rVOu
         TMxA==
X-Forwarded-Encrypted: i=1; AL+hErGFCPg4gYMT4Wb6yqnKemSLeiQ8GMM+EQkYMN5RehAckeo3IOtZP5lFZpXEItuyvKmBTn7EmvGvGebBFmzQLrnH@lists.infradead.org
X-Gm-Message-State: APuU4Z9cry4eBTfZkfonTqXqDSlJqq4AiB/BH2HGqs5z92c3/SMlDVqt
	4hBbzZNrk996vJepsaqkRtgYrXIzWaD+4GLgnmwrCVbwUiMbf61QLHfgB0mbB1MBGK0=
X-Gm-Gg: AZFdTZfaPFT+1uOGncst2krITpJb/19kcTGyLhVz8kmHxM6FhTohMKwH3hvgF/VxU9e
	8PyOzuMViMeU9SFNP01yUbDUPC1hOdPZu08k0sYc75P2ewbVoxK+vNSpAie5xfucZRVMXlDzaVd
	mXvZVhmCTF+LzNUzblBGMLxsJqZv6Gbb4AI5ODzGfB5B/hUR/HmrXgy0YUBDNamLAE4xuQZiSG0
	MhpvwA4k4bVIC2MLjxbwwsfqF0hS14q57X6NIzggjDWH5mZ5wxVGXp5oWavm7H1FWAV/p6n6Pag
	1SycpVAJLEJxxMO1P/JHWBiGxSidO20Sp1RGMUQf/v3c+OYNRPCz0N1xHCYWeot6e1XOuo1OkCq
	MAk9GJ0LIKwxkoNsl2+mIbbcTcuI7EsbhzJzzJ2Ksj63Q/Z3KnfXsCaEgwu2l//ow4Xm7pZaxw+
	xQwg5SKinO4o32TeoG9TGHGeDrPAPNiSapwofov5XmZFe5b8uB+JhYzUIXv8MzhQsfvG6x/bn9T
	YB8yAhTJs3IYuMZ0pDq5iEOffoUJizK1pQlHVx2jZLMEYiMFNriOqmns4YXiH5qnjHOeMbShLM2
	OJ2f3YGlIF/x+j39ANeiYfO8+jv7A1Fqgqtkt8frRKskytOa
X-Received: by 2002:a5d:5d82:0:b0:4ac:7595:6f68 with SMTP id ffacd0b85a97d-4ac75957253mr19069216f8f.36.1795445636715;
        Mon, 23 Nov 2026 06:53:56 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm22292067f8f.10.2026.11.23.06.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:56 -0800 (PST)
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
Subject: [PATCH v3 17/28] ASoC: bcm2835-i2s: Pass the CPU physical address of the FIFO to the DMA engine
Date: Mon, 23 Nov 2026 15:56:55 +0100
Message-ID: <20261123145728.29082-18-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065358_454569_74B02903 
X-CRM114-Status: GOOD (  16.91  )
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


