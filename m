Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9B0606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=azyD/Yeu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mzd6RR3c;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=hC0c0/UT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=; b=azyD/YeuLOAiM3
	WX/C8DB1TZto2Q0lwGHHoL8kw2so2EfS+XqQjoSZorBdhOEtopQ9DpLNWKsGttFylUzBUFyLtWJKy
	OhBOyG9yXACEli7KYJ0X4fc6Qql9C5GS38R5/CxQNSpqbBC+3ICwzraC7mS3TGwXvcenEO6ylgBdR
	QKQf4XUGF3/9CdvSyjvHVFCFNSM9SSoxPkjFR7LLr3b25N/csXs+llTOpv3044twwn44rw9LVK/cq
	A4KZnLIHqSyOJYUP03NW1PNKSFHZ4ayOwNCA+II6hCn/KA2HddqTWRTF9vGqB0lZ3xVeKDlH+s/B3
	b1AKc7QEM4RpteJoOzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvr-0000000G3vp-0caN;
	Fri, 27 Nov 2026 12:20:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuun-0000000G34H-2TuB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=; b=mzd6RR3cuGLDjd46g1K7O6ZT8B
	oq3Cow0CGr/GB0jdog1jVlWQiUATLMRbmcRsXDF1LGll/h8ps4+bYC22ZddbObI8l7y2fivxN4eHP
	xdidW1am/KVKcJr+xrfwitN7kFfhgXIEFRq5TI9ElNApgbHQnmHWZII9XS4RqupjSuZjalXm3QYvJ
	xDmRjIvOVKjdiEMfgsYmol9a8MrxHPlohKDS+4fMJkJzvZrutnqUy6DNyTiekxh5+gNH4oBtmNNvC
	HNxq4Hj+QR7t8ztvQnhaguM/rWVT28ndA40M6o5p+EOKac2a2G1qVctRMAeHz97GHKQHLzy47Il8I
	Nh6ioWQg==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuul-00000007gsu-0rld
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:18:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4a9be758734so5073939f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781933; x=1796386733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=;
        b=hC0c0/UTo8TBu6eBQny5S1dVQYXpwrufoeqoNezOgZgDkAyhDxYCEqzWY0prYZ0KgB
         c1UxUV80LG0lt3ANvoPyA36Q8Wf46FmW1ZHfp8hi00zVPazcaKM9hzwK9ucUqAzxAFaE
         2XulXc4lbF5HCcYGdf35KwPMBptaOpNdjW1wTgmrdLYKVpypxWYN6csvsOEF3KMHuwKn
         K/FkJWoB/XG/Q+N6n7jo7LBwyV72Hz5Arus8BC9SB8vQtNzaSjt/x0HBavcvi5vLVUcM
         N1hu37iTLRMmP19Crmf3MppJ4XCa/5V0ErRScyOpr9HxGVOcsxPdkL/rCmOSfcHEoANr
         UUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781933; x=1796386733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=;
        b=C+3Ml6gx2XLlYiA2ZoSleQDU/G9I9m0RJE12A6MhZh6HNC061PZ2Mm5ONJJS12VKoF
         8wE98p1wbb0anO4w+3PW/wd122tNlm7mpowgVHiBaLlLc1+F+H4q5WszIh8CJzyUoTH+
         OdRLgHbgqjQv41h/dcnnydw251IK32Eui6MPe9eGEuqMwtV2l76cv7mjfuQ5snBfcIif
         MWF0njF6oOeThnlqY8HDQFjmId5pp57a8lm8K3C/IA8Ip/Fpk69r8w0BsBpLyKNjXxM9
         PYMVIrGXg7FuZ9pH95Wd1GJ/Uty04OyaaxiDmrDLjN5gczgK8Ur5zwzfrE3c84jXyUYi
         t0+w==
X-Forwarded-Encrypted: i=1; AL+hErGVA+tf/NTY4oL8Tj7Igz57GKpePm0IqqwpxBJUWDljpDPSFXs75TM/eaRsRh6w2FDzAMVzv+C0XCVZQveVEwZC@lists.infradead.org
X-Gm-Message-State: APuU4Z/lL8+6Djn7hsoMtXRa1e7lRhkyc+AkTCJco/3FhrITFeTwz36J
	F+3O5ERjZsLETj2Xpr+5jSbwIA2EFqIxe+Mt91SWqJoTiE5aK2QMRzs7j+Hwkp/Zljo=
X-Gm-Gg: AZFdTZfrLZJ5plzw7BBl4rjJuk5FjXG76qzSkC+3Y/NLQhc3vvF+CWIXuzwSHe0Qxr4
	SOMh5DjNqf8UXkJ2KF/eY03KgzO1BRZ22XbaajSDRl8/P+eLSE/Y1KNGH/pe7gsVuL1PCydZihh
	cKo4yEM7D0NZgic/DJ90Ph6T6UFJvq4gyJyOuZ85HEYSC7j+dLtaMDUSKrH5gWBN3IK5ySCz0Ub
	wwksbzRchPPQBIoz/dossJMIwBY8bhROsYEBJF7r+xe59GfxO/7+RUXLOSq6og9gEaEfcPnUYDd
	4R9AzkZOm/yTPzf7LOnj1QkanNlQVlAWh4yoEtlUuwZ/A37QJOYJTypCdwzy8SxxwC6btP2KcR4
	tfIgNukUHLbZuoelDXWPDfFe36vzclEetrj0RXS9QWR+kgygxDHx5o8MAlT+XQRG8i9KukyV/v9
	WE6HQQ5F7WF9i2kEK7ustmG9Vdqm0exMM9BXiruAJY5FPmjeQf3MIVEt1+qFYoKSl0fFE/Bp0vS
	h8Cvldo2i5Q585GLpmlOSnq5Fel54gMmwcI5WFQdnahg4vHdH3lXYunEGk26p/LUlWnzywJAju9
	Xfk5wE+9mnZZ7yf+NkibheUkwcNQ
X-Received: by 2002:a05:6000:4028:b0:4a6:bc53:246c with SMTP id ffacd0b85a97d-4abb3956374mr49731029f8f.42.1795781933498;
        Fri, 27 Nov 2026 04:18:53 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm38491893f8f.35.2026.11.27.04.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:53 -0800 (PST)
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
Subject: [PATCH v4 09/28] dmaengine: bcm2835: move CB final extra info generation into function
Date: Fri, 27 Nov 2026 13:21:59 +0100
Message-ID: <20261127122236.4976-10-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_121855_119714_11E9F2A9 
X-CRM114-Status: GOOD (  16.21  )
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

Similar to the info generation, generate the final extra info with a
separate function. This is necessary to introduce other platforms
with different info bits.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index eb306397b0fa..0ba23ec6b6fd 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -255,6 +255,26 @@ static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
 	return result;
 }
 
+static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
+					enum dma_transfer_direction direction,
+					bool cyclic, bool final,
+					unsigned long flags)
+{
+	u32 result = 0;
+
+	if (cyclic) {
+		if (flags & DMA_PREP_INTERRUPT)
+			result |= BCM2835_DMA_INT_EN;
+	} else {
+		if (!final)
+			return 0;
+
+		result |= BCM2835_DMA_INT_EN;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -659,7 +679,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
+						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -690,7 +711,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -738,7 +759,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	dma_addr_t src, dst;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
 					       buf_addr == od->zero_page);
-	u32 extra = 0;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true,
+						 flags);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -754,9 +776,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	if (flags & DMA_PREP_INTERRUPT)
-		extra |= BCM2835_DMA_INT_EN;
-	else
+	if (!(flags & DMA_PREP_INTERRUPT))
 		period_len = buf_len;
 
 	/*
-- 
2.51.0


