Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8236C606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i/AtkCHa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bQXlkaWc;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IccXvVdt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vzOUbtSU35dr5ut/+N3XiJYlcrwl+j1wK6kXAv2zHH4=; b=i/AtkCHadBtvlX
	ZnZ9V6bTit+A64qK8nr9RCQuQczhmUK9cD2xyBQOyrUKmSN8zosAd9qxkNFwDJGrTze4Uann1bM8u
	QJHUHx8Q1tX/n1ikhVat3THyQmu3BTa8TP+qjjkbf76wQss7SDf8fdr5OOvOiTclj/3EjE3R6Di55
	/wijDQR347CuBOU236oVl7g8ZJwOndJOc0c2Z1Zxu1dtpCRtqB/C2SI7xFbOFuwbXhU8F92HusYa6
	S7veKBVN8Z8unoyAdQiZPPLTE4x0lvTaBY/GG133N/f5t+VzksvGApzvYYHmDo+RuqD1uWK5QMcK4
	n2N2NnVaVjqTZtIHqmjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVSo-00000003ps9-2Lwm;
	Mon, 23 Nov 2026 14:56:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQi-00000003ogO-3PoM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 14:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vzOUbtSU35dr5ut/+N3XiJYlcrwl+j1wK6kXAv2zHH4=; b=bQXlkaWcE/NUTmScdZ9kBklgON
	4MTu+yMscdEiLAXrbPD/n2+8gNsp5QeyjG48g9nBoJt5WmDadXpZy1rw+Nv99Or1f+jwGT7OZ/cKZ
	Xdx8cOOL3cnKC63EQm78aDhpTh/3i8MwmS5LWsU6QbcLezwZ3SqMUPlNGPAL4hhhPRDvQPo1CsTjL
	g+RlKi0lI6gVkQh7T7c4jTGWDS5VqV6zmNuLIopL71ZTmmw8JPB4DHR2YIkkd1mmS9JdpBtzh26aC
	2yRn/VNAU3A38a9tPon/rrsPEQvpac06Y7vpjNLuToNQdLlqvFotMQ0IMPHbMgU7q9PrO4VAdVhs0
	IRy57XiA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQg-00000003G0K-1Ydm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:54:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so42642285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445641; x=1796050441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vzOUbtSU35dr5ut/+N3XiJYlcrwl+j1wK6kXAv2zHH4=;
        b=IccXvVdtAOJc06Uq5kgjUGzNcTW+KKgu6xsetpdA2S3bdrTOCCre6n29lpNFfnGCAr
         AroLGvYE1AX5FYmBMxucr+7vsXOK/zBMp20FyXt20uSOMzBnXxu48qjSfhSV13m4sqYW
         oyz+7unu/s9rcFcMZ78UM8kmMteESgnrz7wXOvlRv0m1EWm+ZRoJJi+yx3uZpXQFwStw
         hXGmDtMsPTGTRT1lLvrPwpwundyn7vQMJRKCc5lF/c95Sy3jp3OyMli9j9c38k0+N2Xe
         c8Bozyc9MCAN1tqAB8tEJnN1xTzUkT+ycHIc9vJY20z6VjP/Tf8qvnIZBXJm2AbixhnA
         6lGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445641; x=1796050441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vzOUbtSU35dr5ut/+N3XiJYlcrwl+j1wK6kXAv2zHH4=;
        b=siGoitZ2odJDtx1k8AGuxi22NerSGou9CWtrFW0AkzjkaYyiy+HKC8AKDFLozqrfuk
         WvajvcdIvKSyJ0oE9RdiIOhye4R5dsY89TNYFvsK5x9wBelng7yGjbTNCOkOhO/+BD3a
         oWjtMLskFzVDIAsKWnVTygghuFYGcQMZvX288xK71ASzecimR/JfcjD2dg0dnqn/6BR9
         5k3g3P1GjKO0wsNXv9qY7bHEl7XgZ76pB3rSPg7yj9pf9hsFvdIBjs4lpbl4xXcwU+hJ
         2YqzAoz1nvqiio+hzdeMJfBX1BJ70YFYxc+C/eI9Pb1WYhgpmQV27so6iG9oCzdq2xz0
         10RA==
X-Forwarded-Encrypted: i=1; AL+hErFsF2d+RUoRv/Ky5+AqhNZP6ZytnifUeRI7D1OxYpNZIX3VcX/UGwhWmrDMSU+fbJ0Lt3hPnds9UxyFf+QJqSQI@lists.infradead.org
X-Gm-Message-State: APuU4Z8Xaktmb63eEn49H4z6hweuU3u43dCOT/1tETu7B4U0APyXYeLp
	KHiLkRlBVzF/LuhJNTDG22t2SZBVBAISQ4EQFsbTy28NUXxPxGM/wizZR7KjhJZnwuE=
X-Gm-Gg: AZFdTZduZxOMLq/iYlcMYR8sRu8YAYYLVGerOOwBGgyxY9BHGWMJO4Npd2wbc26qSCw
	rDDYWRsSAEfuPqxqGuhMsE/GMks66ksd3zeJxmfTXmK3bOAOeImwGB2Qm84tb4ZHAv9x00wqQnj
	FtOjo8rDAWzYIPz+X6BoWDH0EmwcvZ71XHGbn5aXbK6ZFFBx7KQ2Ygf6QbRU1g7m2U/GEQRiucT
	65yg5C0d8dZfNzMGHwcPXeWDvFBPL37DV6KOqSeXOOXMIyo+4T4s0irDk8jOV1YURghyCA/n5Fg
	bcaqtbsP/jyXZZYB4TkKZu0PyYI4BLCxF8CKJ56cXUCe1N8PLqA/kyCHj3KV8dWsKWBZmhIs9q4
	/TFd0buNjeXA1piUZb4voRzBOgTYmy9G9G7+VQQaPlidKjqCJyD7B7fs+ItPYmIwG1f4UVyKylo
	G01D+N/flfKch5cdRZe9AznqbAfRC5spu6KYTrGW6DGBTk17rzjoz4w8VrOT+JQd8O44ZY4b6Et
	Ar9jdBidxZk7o2P++pqrPRAmLlD9axN5AFbf9zf0mk2USiRJLFNd8XcC8NwJqdgyPpnKD5BH1pg
	x34sY00zaxVljp73+Bt/qUQ7bOU=
X-Received: by 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4bb887865b5mr238459695e9.0.1795445640550;
        Mon, 23 Nov 2026 06:54:00 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm340094145e9.10.2026.11.23.06.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:00 -0800 (PST)
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
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 20/28] dmaengine: bcm2835: Support channel subsets in a controller instance
Date: Mon, 23 Nov 2026 15:56:58 +0100
Message-ID: <20261123145728.29082-21-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_145402_242759_7575063E 
X-CRM114-Status: GOOD (  29.46  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On BCM2711 the last four channels of the DMA block use a different, 40-bit
programming model, and are going to be described by a separate DT node
whose reg property only covers those channels. The driver however
assumes that the register range always starts with channel 0.

Derive the index of the first channel from the physical address of the
register range, which is possible since the DMA block is 4 KiB aligned,
and only consider the channels covered by it. Channel numbers, and thus
the dma-channel-mask and interrupt-names properties, keep referring to
the whole DMA block.

Also describe in the platform data which channels of the block use its
programming model, and ignore the other ones: some device trees, e.g. the
downstream BCM2712 one, describe channels with different programming
models using the same compatible, and driving them with the wrong one
could corrupt memory.

While at it, initialize all the entries of the IRQ array, as the
detection of shared interrupts looks at all of them, and report the
number of channels actually initialized.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 58 +++++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 3ff30c41dc63..0ea903274286 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -42,6 +42,7 @@
  * struct bcm2835_dmadev - BCM2835 DMA controller
  * @ddev: DMA device
  * @base: base address of register map
+ * @chan_start: index of the first channel in the register map
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
  * @cfg: platform specific description of the DMA channels
@@ -51,6 +52,7 @@
 struct bcm2835_dmadev {
 	struct dma_device ddev;
 	void __iomem *base;
+	unsigned int chan_start;
 	dma_addr_t zero_page;
 	const struct bcm2835_dma_cfg *cfg;
 	bool map_resource;
@@ -127,6 +129,7 @@ struct bcm2835_chan {
  * @abort: stop and reset a channel
  * @legacy_bus_addr: translate a slave address for device trees which do not
  *	describe the peripheral window in dma-ranges
+ * @chan_mask: channels of the DMA block using this programming model
  */
 struct bcm2835_dma_cfg {
 	u32 cs_reg;
@@ -161,6 +164,7 @@ struct bcm2835_dma_cfg {
 	void (*abort)(struct bcm2835_chan *c);
 
 	u64 (*legacy_bus_addr)(struct device *dev, phys_addr_t phys);
+	u32 chan_mask;
 };
 
 struct bcm2835_desc {
@@ -271,7 +275,8 @@ struct bcm2835_desc {
 #define BCM2835_DMA_DATA_TYPE_S128	16
 
 /* Valid only for channels 0 - 14, 15 has its own base address */
-#define BCM2835_DMA_CHAN(n)	((n) << 8) /* Base address */
+#define BCM2835_DMA_CHAN_SIZE	0x100
+#define BCM2835_DMA_CHAN(n)	((n) * BCM2835_DMA_CHAN_SIZE) /* Base address */
 #define BCM2835_DMA_CHANIO(base, n) ((base) + BCM2835_DMA_CHAN(n))
 
 /* the max dma length for different channels */
@@ -1189,7 +1194,7 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 	c->vc.desc_free = bcm2835_dma_desc_free;
 	vchan_init(&c->vc, &d->ddev);
 
-	c->chan_base = BCM2835_DMA_CHANIO(d->base, chan_id);
+	c->chan_base = BCM2835_DMA_CHANIO(d->base, chan_id - d->chan_start);
 	c->ch = chan_id;
 	c->irq_number = irq;
 	c->irq_flags = irq_flags;
@@ -1237,6 +1242,7 @@ static const struct bcm2835_dma_cfg bcm2835_data = {
 	.abort = bcm2835_dma_abort_chan,
 
 	.legacy_bus_addr = bcm2835_dma_legacy_bus_addr,
+	.chan_mask = GENMASK(BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED, 0),
 };
 
 static const struct of_device_id bcm2835_dma_of_match[] = {
@@ -1335,6 +1341,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	int irq_flags;
 	u32 chans_available;
 	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
+	int chan_count, chan_start, chan_end;
 
 	if (!pdev->dev.dma_mask)
 		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
@@ -1360,7 +1367,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	/*
+	 * The channels of a DMA block can be split across multiple instances,
+	 * e.g. because they have a different programming model. The block
+	 * itself is 4 KiB aligned, so the position of the first channel of
+	 * this instance can be derived from the physical register address.
+	 */
+	chan_start = (res->start / BCM2835_DMA_CHAN_SIZE) & 0xf;
+	chan_count = resource_size(res) / BCM2835_DMA_CHAN_SIZE;
+	chan_end = min(chan_start + chan_count,
+		       BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED + 1);
+
 	od->base = base;
+	od->chan_start = chan_start;
 
 	od->map_resource = bcm2835_dma_mmio_in_dma_ranges(&pdev->dev,
 							  res->start);
@@ -1417,13 +1436,30 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "Please update DT blob\n");
 	}
 
+	/*
+	 * Never drive channels with a different programming model, which
+	 * some device trees put in the same node.
+	 */
+	if (chans_available & ~od->cfg->chan_mask) {
+		dev_warn(&pdev->dev, "ignoring unsupported channels %#x\n",
+			 chans_available & ~od->cfg->chan_mask);
+		chans_available &= od->cfg->chan_mask;
+		if (!chans_available) {
+			rc = -ENODEV;
+			goto err_no_dma;
+		}
+	}
+
+	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++)
+		irq[i] = -1;
+
 	/* get irqs for each channel that we support */
-	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
+	for (i = chan_start; i < chan_end; i++) {
+		int index = i - chan_start;
+
 		/* skip masked out channels */
-		if (!(chans_available & (1 << i))) {
-			irq[i] = -1;
+		if (!(chans_available & (1 << i)))
 			continue;
-		}
 
 		/* get the named irq */
 		snprintf(chan_name, sizeof(chan_name), "dma%i", i);
@@ -1438,11 +1474,13 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		 * in case of channel >= 11
 		 * use the 11th interrupt and that is shared
 		 */
-		irq[i] = platform_get_irq(pdev, i < 11 ? i : 11);
+		irq[i] = platform_get_irq(pdev, index < 11 ? index : 11);
 	}
 
+	chan_count = 0;
+
 	/* get irqs for each channel */
-	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
+	for (i = chan_start; i < chan_end; i++) {
 		/* skip channels without irq */
 		if (irq[i] < 0)
 			continue;
@@ -1459,9 +1497,11 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		rc = bcm2835_dma_chan_init(od, i, irq[i], irq_flags);
 		if (rc)
 			goto err_no_dma;
+
+		chan_count++;
 	}
 
-	dev_dbg(&pdev->dev, "Initialized %i DMA channels\n", i);
+	dev_dbg(&pdev->dev, "Initialized %i DMA channels\n", chan_count);
 
 	/* Device-tree DMA controller registration */
 	rc = of_dma_controller_register(pdev->dev.of_node,
-- 
2.51.0


