Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784BC606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lOj8K36r;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gbs4+j75
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jDAcxjc/NLdfruGXejtq5CjFyH7icsEJFXVAPztuGkg=; b=lOj8K36rvlfXIg
	2aCKDqQdMZ+jgnHvBMxNP28yuTC7yXP4Xkfwoi3Gn5C2SXrrDOcH4uFG0I9IBLJB/BAcKoKcvjmZY
	m9xMadGEYJ8fpbEaizlyJxPGakfkZXOGg7qiykg1o0+bQg1yyWI4TGsqQMO+cxSSrXCv3np9hGBe9
	azY5Xs1ABSEOS3ipFHd7QXL8YpCme6rNfEYJQoNYp/12nrBmDopqOUL4BAD95X6c1nzXBlIt80ltM
	vdBr1NAgtO7V925wlSFigSGBIpmHNKc4Qxls+utxSSa50gbUE/yeOw5y4bC4fasfwpyrpifYRrpxM
	WaitBSPJRgqTHuWh0+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuxF-0000000G4ib-338B;
	Fri, 27 Nov 2026 12:21:29 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuv1-0000000G3JL-42Yj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:14 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so64998125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781950; x=1796386750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDAcxjc/NLdfruGXejtq5CjFyH7icsEJFXVAPztuGkg=;
        b=gbs4+j75KJrNqE4dF/KiA/F/LbTV/LpfiygdcAC64AOCfbtUxM2MkrHb79cKwo3xlI
         sAtwed+2Zd9/gdEMkkS8liank3uQBv4QGlHmuHxhw3r64wrxdXRj8wAVxEladjHxI0bH
         7VOP+8os64FsF28U0tpUJ/JALtLtiHbLp3VvCA2XJabk744fF1TXzn6C/zhMJJ1PlrXi
         BlxFadRMnyOCMHSWqwSgolJUUegYJSk2g5VjelJX7L8ZQ+bWEMchWeeVCw7K/n6lbahP
         q9SHK3bCK9l4lKAP3XvzEsRF8gx+sqzFmwI8z+cbXhCI5iOprd4dUwlQT8R0B+3zr216
         iYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781950; x=1796386750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDAcxjc/NLdfruGXejtq5CjFyH7icsEJFXVAPztuGkg=;
        b=ys2p0hCvWu53AJJF8Qd0Ll5v9BOGj8W/YqreZytmlNyiEIUdlcI1K6qa92yKPeLM43
         IhzqOCc0Wlp0FIpwQXDoWgT/JHE0Q9WcWVobvCbWgupmFSykFsQz9r4g7jVsAtmgVcud
         eqxOiIsf8tTqex1qGmVKchKILsBddw2bL/0wR/qYkcw31DI++eaWQOsuaa/dLPJdi5J9
         UOKtzTUGPIhbI8kBghT7BDc6mHdQI/PmdTUcB9tm8huvWPxfEif7RwH0CwTvg588kexR
         SPwOMx3s9zt/Wfe07ZafmDaim9PmnS8L1EgrnnM064nkxjMZ5QyxT1ASfZt0qIgIxJ4H
         gU9w==
X-Forwarded-Encrypted: i=1; AL+hErFY65CoLaQf6Et1MunV61WWim356uNwnFCVt+pUHlslzf8HLbyFzzbGJs2PkahwM+NZsvHfhcfYNxoqyGEJTem8@lists.infradead.org
X-Gm-Message-State: APuU4Z+eHrX6yn8h8oTZPECLtSunuDbhjQUFOFTH5N0mDhDeQVUQeBp4
	atT/C0lrzIwoGjwZYXlk9k/MyO0bNCx6ghL9dkHW+XUaxJYGjBDGvW4a2PwfRHONJzs=
X-Gm-Gg: AZFdTZfuizhFcWXMuanGztapce066XQdWYSo1MY3MPmKhVPD+llj66fvK0KAhQXSeFj
	fsmsoExi9/RVDvRfleKM1qI+PRcpSmOjzCLtwXZxNEMzrPq85xUV9NFSXgQK6BuqeRKpMrfRgRo
	WlimHUnClS7AaYwDVUih4YPPx45zU1WZHfDNAOx0KyvFwZRQlmoaqpyQ82FRImHiOEuhSVsIbkw
	lF12SkU2uz2s0nlzNRvo8KAs8SJw2SqHOUBGg9tMPZCkCwJcfWe9U9deyXUP6fCqjgZb/ogV90Y
	vlhNK8x6CG5BIVtRb+iLXkzhuaUulY5r09tlx3dhZSoCknALrSuzWTtGCGB6kVf48kCcRLqouX0
	YlmyJ9kRShQ40ilJvPbiSBGMesmacSiE+a9oJboyZgZmh829wGeTPqRfMSu0QVFpvE8NOjDMrx5
	rjakTDB1nGMcFHQVn5mxRGhNH7GCTzIgK+kLe30VsDQCb7gwg9ueqxtDip7pB4BCCsCEdZsFyWb
	uGLzqHMA2F154MLnjOsmNMDKlG/7emQhxA10dv2BiDj+uDAbW797TeZYby38SMAqGIRCnJ67hy/
	uC96S1HkqBARhsKyk3C3AAkLlfud
X-Received: by 2002:a05:600c:5901:b0:4bb:5e8a:7c9c with SMTP id 5b1f17b1804b1-4bb861467c8mr415882465e9.7.1795781949777;
        Fri, 27 Nov 2026 04:19:09 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm53811123f8f.14.2026.11.27.04.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:09 -0800 (PST)
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
Subject: [PATCH v4 20/28] dmaengine: bcm2835: Support channel subsets in a controller instance
Date: Fri, 27 Nov 2026 13:22:10 +0100
Message-ID: <20261127122236.4976-21-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041912_045847_851B2DE4 
X-CRM114-Status: GOOD (  28.27  )
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
index 42ec9be7a8f7..8379b26a80ae 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -45,6 +45,7 @@
  * struct bcm2835_dmadev - BCM2835 DMA controller
  * @ddev: DMA device
  * @base: base address of register map
+ * @chan_start: index of the first channel in the register map
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
  * @cfg: platform specific description of the DMA channels
@@ -54,6 +55,7 @@
 struct bcm2835_dmadev {
 	struct dma_device ddev;
 	void __iomem *base;
+	unsigned int chan_start;
 	dma_addr_t zero_page;
 	const struct bcm2835_dma_cfg *cfg;
 	bool map_resource;
@@ -132,6 +134,7 @@ struct bcm2835_chan {
  * @abort: stop and reset a channel
  * @legacy_bus_addr: translate a slave address for device trees which do not
  *	describe the peripheral window in dma-ranges
+ * @chan_mask: channels of the DMA block using this programming model
  */
 struct bcm2835_dma_cfg {
 	u32 cs_reg;
@@ -166,6 +169,7 @@ struct bcm2835_dma_cfg {
 	void (*abort)(struct bcm2835_chan *c);
 
 	u64 (*legacy_bus_addr)(struct device *dev, phys_addr_t phys);
+	u32 chan_mask;
 };
 
 struct bcm2835_desc {
@@ -275,7 +279,8 @@ struct bcm2835_desc {
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
@@ -1418,13 +1437,30 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 			 "Please update the DT, replacing brcm,dma-channel-mask with dma-channel-mask\n");
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
@@ -1439,11 +1475,13 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
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
@@ -1460,9 +1498,11 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
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


