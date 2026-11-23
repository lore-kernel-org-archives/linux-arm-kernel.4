Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138A5606A6A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=meroG81c;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZjN4AFfy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yjvjix1ikk+CGbe6cYBND0Wj9SQniRLSb3Q1jpj0b98=; b=meroG81cTTBlhw
	fjw9CCksX/jh04VK/41q93+AFiBOFHq0zGVudnxxegf0o/w5rCNtq7mHh7gAAl11EK1DJSgYK/LE1
	yKtPoBiXyx4LVmJgH/Ij2li0POFNIy7Ks5Re8GeyqAbJXB/R0TcS302SUghwSprbR6f2RRTvJ+aZa
	Loejyei7huvoYR8THMeLtGxHiXzVV99zSXzRXZpGHH3lPPhVsuBy93wHh8o76KSCTJIANs5ETI1WP
	aVIZ+RqhGGLXDdLLJhl1FJMGpbJy8COB51rqG4+y54Q+531kGvki69wM/sKeHFAwz9awOXnirmfI1
	H6469LNavAB38yJH7UYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQb-00000003oaa-2nFY;
	Mon, 23 Nov 2026 14:53:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQH-00000003oJI-0Vfu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1840139f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445615; x=1796050415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjvjix1ikk+CGbe6cYBND0Wj9SQniRLSb3Q1jpj0b98=;
        b=ZjN4AFfyNWAS+/r2t5xqpiEtr5OR1UL2/143ii3g0IBY+WzO2iLeCQoT5nCE2vXIbe
         bVgxBptZ+mzvUSbqZg8tJNOfCVpMlDnu25lZnEYkTbJgxlQ3kXDXPT8M+s+vh5O5SnpW
         sIxFF2d8cFwQpR+Hkc3MCcp7Z7Ob9aWTjjZQwIZx1fSxAgSL2pjSMQHsLlV0gbKWHkFv
         KZ4Rv9mdciW/z4WCx6uzOIjghHr9QI5EqISY6D3qbW7/rS5ykDJksEBcAx29ZAkyqPKH
         uz600/DjrV3ibc2Z6zytw1yJk3raUaU2+s0PccuCjcu3IK6ITI0Z5E5yBPRpxIUeIkrh
         e5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445615; x=1796050415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjvjix1ikk+CGbe6cYBND0Wj9SQniRLSb3Q1jpj0b98=;
        b=uyio0lSeEALf+6Bn+j9LJXmjjrdMVv7tal3ZT8EvmhnUf+bJq4Opxca8FB55raIfiN
         EkTEI+1559KLG21opZP5cyEK3d4m2pKBytbAys5lAVEM0MolBMKzaiwO/L3t9BpULwmS
         xPnWb1zuMDcC7MzCSRcG2U5fHxMJAfoDVew27p+xDanI6hTr5RWpnXJOsY+jfQw4gFrj
         ExCCqjv5/KL4JWhGVqNLrY6hxi9AbeUY5KlfHGK75Ud80VaVYYjHZiw5Fy3ej6MWPGEh
         Ts2ta/9LJ4tWojwKfa2avoYhZH3cgCPpNwVAkdYFTXJz0wSynhh1lGQixjUCcW12Zfzx
         CMFA==
X-Forwarded-Encrypted: i=1; AL+hErHtG/Rz+BFHh/SkMDXVnAgWxBDreRvb8FLGo8uP9+s1kYv7Gwg6ghmX/PxnparcGf2/DwH0JFk6ExlmdOfyJJRo@lists.infradead.org
X-Gm-Message-State: APuU4Z8goc/h6PnWHLriM+wGvU5ntHXYLzE7/OccQ7h+/TZOA/Ynk5/+
	9Ha2D2zd2fIsiA65NOayD4ltPCFBYjJAC7DRqo9lRo/1EKRDSaetk8gKQ6Ug3CLBTdk=
X-Gm-Gg: AZFdTZf2hEfXqbz33n0vojA7JuunVJV2+1tRejk6E1iURznaO6Bj1SLivLSHLYb08n0
	MkJijRndDdMZaXbVYzwH5VeaEhK2gCmgWiqFo4LupvNVfZAjZ0sahe3XYrB0ahnLKzh/JUWHxsr
	PD1/LjNn7TnA3qscI3X3F9qqb4ocXzYAePzeoOTL5kidahMMN43/Zqifi02aoMn6eHfXOzSXGHV
	ioPt3MWBIh2CPXWdG/hQ3rzZLL7rhbBZM5C9Y5T41hPGCo+QTmCvbR+nZ4XN1jGtYnOj+lZeqZF
	pSGnPLD/mNuARez5dhKpLfUdhJWix9+nSgbrUgoGCA9IR133GqquStV4P+P2NBYz6HJQ16vZ48V
	R9vrYx0Y/7lUqk+MdhznfyOYVvVdqQwym9vM+iE/slR0oYNmPCVWXN5ROY8a7kKS2GBRdUS5j6q
	Flvo6CqPKPrQAK4GcrE6ipdQF9Lfnugk+4BXVuiQ35o3Px/VPxHZX2kALQazUafScAB5leIpEWn
	wrNuxxAsHkd05vLAhr1rSnemu6RB6O3Esj8l9EUYgjGL9yVxiMwYiqpiUF5n25ayiehGnCsEN64
	pfZg2Qu+CfMptHgdIegENKIFeSA=
X-Received: by 2002:a5d:64c9:0:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-4abb0f3c071mr24213933f8f.14.1795445615277;
        Mon, 23 Nov 2026 06:53:35 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm23180331f8f.54.2026.11.23.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:35 -0800 (PST)
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
Subject: [PATCH v3 02/28] dmaengine: bcm2835: Add support for per-channel flags
Date: Mon, 23 Nov 2026 15:56:40 +0100
Message-ID: <20261123145728.29082-3-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065337_194249_811ED790 
X-CRM114-Status: GOOD (  16.78  )
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

From: Phil Elwell <phil@raspberrypi.org>

Add the ability to interpret the high bits of the dreq specifier as
flags to be included in the DMA_CS register. The motivation for this
change is the ability to set the DISDEBUG flag for SD card transfers
to avoid corruption when using the VPU debugger.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index b19182c6e3df..690f5ba1c439 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -137,6 +137,10 @@ struct bcm2835_desc {
 #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
 #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
 #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
+#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
+				      BCM2835_DMA_PANIC_PRIORITY(15) | \
+				      BCM2835_DMA_WAIT_FOR_WRITES | \
+				      BCM2835_DMA_DIS_DEBUG))
 #define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
 #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
@@ -433,7 +437,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 	c->desc = to_bcm2835_dma_desc(&vd->tx);
 
 	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
-	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
+	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
+	       c->chan_base + BCM2835_DMA_CS);
 }
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
@@ -460,7 +465,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	 * if this IRQ handler is threaded.) If the channel is finished, it
 	 * will remain idle despite the ACTIVE flag being set.
 	 */
-	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
+	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
+	       BCM2835_DMA_CS_FLAGS(c->dreq),
 	       c->chan_base + BCM2835_DMA_CS);
 
 	d = c->desc;
-- 
2.51.0


