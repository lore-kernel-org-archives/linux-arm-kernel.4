Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFE0606C1BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XBTtqntZ;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JA1rYky/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GrSoWjeoZdpdA2pLivwg9kOVjevNBkSDdhik7u3RWso=; b=XBTtqntZP1qVQO
	+kPzWd/rduN6f4zcnDL3NgwehpyMMQ82R9n6gJhORLOo3QnZrxlIfxGSn3U8EqDU9w47odluMcwIX
	W/H2DCGfHWUNX3xQGOjSynkTrN6wZccYDTukLj4uyS/vtPezxRcJY2G/6NTn3sB+cD0GHL7epcGsx
	+wMWw4R8mGN7p5uDgrD2HyBoZQweurOFveS/kkwLsFzvIKGmE/hDLbJQab+D/huADHebqbw57VUF/
	+td7OEOlCiwPiZ8hvSnZ0PqfOFAbS8IXxxJjpWgA5zdiUPrPM3EXO00mQZzZAL1dCG2kZlFC6K2zE
	k8rTaAAz+fHsnCDn5Nyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQs-00000003opg-23gc;
	Mon, 23 Nov 2026 14:54:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQL-00000003oNQ-2efd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so26196595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445620; x=1796050420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrSoWjeoZdpdA2pLivwg9kOVjevNBkSDdhik7u3RWso=;
        b=JA1rYky/C4NDSjPSDWK5ia9ryK/nGNVtfadlg9HIMZvKp5lvrVIOZm5OWOthTdbwzi
         WZK4vOXkcgP12+hnSmi+YApa1NDpxlFFZ6b6dfPO/YuT5tp/xGCYyS/DdGUt/FhxLPNU
         y5ACzctzqPofuHXrUH40PS21hVd02IY8fuXqscnhnTcpBNk5rNRiWkePYPBzOoK/NCGX
         KxLlBVONImWLu8Yh3XoBrybDlVF0iN5/nvKq8iwYp1ulngWL0dYKJioJaa8ZDmaAP6TD
         S447c78LOu9dvFCE93UbKwGccSAp4mSnv+/BCvKRqxeHUrWHBfV48zXqc2Yk89Jb7EV5
         kxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445620; x=1796050420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrSoWjeoZdpdA2pLivwg9kOVjevNBkSDdhik7u3RWso=;
        b=00wYiip2yT29JRJvYluNUyzDA4VfgUgh5WXaXWK8eiVPVIw0KEHZ6F3x/t8huQG33/
         WHmAXFub1gagaeMvpGJGsOpFYpVuGVeMlUV1o+58hkrNnmd0VgOgrC5W7XeaIWeLMDtR
         t/IdLGbLAhrLBWIfQ3zkCKFkV9vhuhb0yDJjOBI9atLXz5j+T8+0tH8NfiSeocWdenV8
         C9cZoERN34SToy2VRHtiAiQPAbt/S7uRjZyrOHFd3Rji8PWYqf0WOUBA5pwJxbw2+5ai
         x/Ve7G1Hbof9WqTduFIXaN7E0FUiVVg8S7K9FZ6pmCSFBVnUkloHv2nrlgNwu21l+Afy
         +92A==
X-Forwarded-Encrypted: i=1; AL+hErGkWb8EJbxy+nG+ssTVaV9NYsvwqsF2Lc6VYafWa1lWL+iNtAzV7FZIGsXp1LE2pXygDlzV/e3MCBf5GR12gBnc@lists.infradead.org
X-Gm-Message-State: APuU4Z9qGSOF6pYsHHpHRHdCqUon5sDB1C9Qd/TZQsRPnj/xgqlsPIwy
	xTA/P+8W02nbafhiyL1kc7rGmxZ8arcNjc8ZGnBKeveoR4NTNFc/Mw4mRiv9JiPOLzk=
X-Gm-Gg: AZFdTZfEUftFG+OvFDZ6yU1dgRbn6ZFgtKc5IQAYptV0WGKvCF1Cw8qMmOd6rEHO7XV
	+xy+n8+JP2cLQFC2FSqVlbvcYOM42cvUD86cpWnjiw566zC23dzDd701QlmafCAMCQqouyVf8C3
	3b83WBP981LrVFr2U3PzPAyW1hOUkf+PR6EEFsaeEIMWWsId2tQt/yVzIdXf9+dr0KVV6MW3LAR
	EmN2M6Nsas6UNBgXAH8T9YSe/fnPmlMzUhqHKLYLZz3L4eSp6vjqi5S5JewNwqFoo65KZ0cg6PT
	Qyl2+j77AWDYL0A25oeKBalo1iiiXzSymCrwWsfbgnRYFY8GgRZTnmSr/ZXF+qoRJs8sKuX+xtm
	Nx3vZQvcMad9mpUa1Skg9GHnvVq7jOOUEdE4PqqWlMgZYxTQpCe5GkaLZRi0PeN5H0F161LgFUP
	TPWxBS3ubhYc8K1IVjGzpritqxLMPxqKGA9TdZU3e6cZWj0EguR7kjNrLu/uRj5tUjMvSzvKFWm
	fnzRvWVsmvPJHbUhNsDl/eiG94lHyPCezsd1ioJeBvZVcNpbABh8x2u1VwEpjLD9f/ONH53hn5D
	/NW9tQbM7PjeTe+faNZ6BYAIp2o=
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr233321345e9.25.1795445619780;
        Mon, 23 Nov 2026 06:53:39 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm663224295e9.4.2026.11.23.06.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:39 -0800 (PST)
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
Subject: [PATCH v3 05/28] dmaengine: bcm2835: Fixes for dma_abort
Date: Mon, 23 Nov 2026 15:56:43 +0100
Message-ID: <20261123145728.29082-6-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065341_757201_18574D8C 
X-CRM114-Status: GOOD (  18.28  )
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

From: Dom Cobley <popcornmix@gmail.com>

There is a problem with the current abort scheme
when dma is blocked on a DREQ which prevents halting.

This is triggered by SPI driver which aborts dma
in this state and so leads to a halt timeout.

We attempt to abort the channel, which will work
if there is no blocked DREQ.

It it times out, we can assume there is no AXI
transfer in progress and reset anyway.

The length of the timeout is observed at ~20us.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 063e1b2aabe3..51e3a40dbaec 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -419,7 +419,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 static void bcm2835_dma_abort(struct bcm2835_chan *c)
 {
 	void __iomem *chan_base = c->chan_base;
-	long timeout = 10000;
+	long timeout = 100;
 
 	/*
 	 * A zero control block address means the channel is idle.
@@ -428,19 +428,33 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 	if (!readl(chan_base + BCM2835_DMA_ADDR))
 		return;
 
-	/* Write 0 to the active bit - Pause the DMA */
-	writel(0, chan_base + BCM2835_DMA_CS);
+	/* We need to clear the next DMA block pending */
+	writel(0, chan_base + BCM2835_DMA_NEXTCB);
+
+	/* Abort the DMA, which needs to be enabled to complete */
+	writel(readl(chan_base + BCM2835_DMA_CS) | BCM2835_DMA_ABORT | BCM2835_DMA_ACTIVE,
+	       chan_base + BCM2835_DMA_CS);
 
-	/* Wait for any current AXI transfer to complete */
-	while ((readl(chan_base + BCM2835_DMA_CS) &
-		BCM2835_DMA_WAITING_FOR_WRITES) && --timeout)
+	/* wait for DMA to be aborted */
+	while ((readl(chan_base + BCM2835_DMA_CS) & BCM2835_DMA_ABORT) && --timeout)
 		cpu_relax();
 
-	/* Peripheral might be stuck and fail to signal AXI write responses */
-	if (!timeout)
+	/* Write 0 to the active bit - Pause the DMA */
+	writel(readl(chan_base + BCM2835_DMA_CS) & ~BCM2835_DMA_ACTIVE,
+	       chan_base + BCM2835_DMA_CS);
+
+	/*
+	 * Peripheral might be stuck and fail to complete
+	 * This is expected when dreqs are enabled but not asserted
+	 * so only report error in non dreq case
+	 */
+	if (!timeout && !(readl(chan_base + BCM2835_DMA_TI) &
+	   (BCM2835_DMA_S_DREQ | BCM2835_DMA_D_DREQ)))
 		dev_err(c->vc.chan.device->dev,
-			"failed to complete outstanding writes\n");
+			"failed to complete pause on dma %d (CS:%08x)\n", c->ch,
+			readl(chan_base + BCM2835_DMA_CS));
 
+	/* Set CS back to default state and reset the DMA */
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
-- 
2.51.0


