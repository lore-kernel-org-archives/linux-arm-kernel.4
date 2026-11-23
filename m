Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33BE606A6AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rjla5zl/;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WJYHZZed
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tVq/cXwfFrUYTvVPC8LWfCG8earbmrGADPgjnQonGc8=; b=Rjla5zl/YXIRHt
	myZX+TIJD6mp60Mr3r2j99Ye7VIh/NPpoBe4KLjZii1rcITCNPabL1qLWjq9DVJRuU2ZtyxdjDeE9
	DRxiEwketos+LuagD+gnfUeeSBlTUpMU/125bR7aBcWd3D1t1GLYHI4e9mHxNsL9lWIPSnh7ckyoT
	xEBFKCsAQl/ruFCvfM2RNBirNbqtAI+LCar8/Hp/PY15PU7QVppWeh7DFWDQzo9p6kQyS0YXQmSwU
	+Lcn4EFkQULCGgsU+/phJk5g0Hb9cVmq9g03Y03u5FnZ9wcZD+GEqHiNFepvWNEvIHig0mTxw545P
	VRoedtDdQ84nNHoViyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVRx-00000003pVQ-04ky;
	Mon, 23 Nov 2026 14:55:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQS-00000003oSY-218f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so33117195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445627; x=1796050427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVq/cXwfFrUYTvVPC8LWfCG8earbmrGADPgjnQonGc8=;
        b=WJYHZZedmO3F/mLklmEgS4gQgX/ouDgl9vlov0jIQ4QoV6ymJ6kBZk44uqPK/hoYke
         mtTqbiEX6QUlgT/bvrRyWXenIneI5xo2DKcHZ5q1DPfylGtZNWCjji9QeZ80GLEBFl9a
         dIoJ/TjiR/+iZSeYIWIruP2VcNZaR0Ds51h7yacH9/azjLzGRRKnQix61G/y7LeMN9CJ
         IyMaVWNHHtZ5yTuHDmHfAlefHSG3qM97By2loxokS5KjGnVnycWYk7Za6y7suL2+V3W5
         RZfd4OZISFnAnGvDp974UOrFIpGewPPiZDTMtG+vtZ9z9Rwc6y4Q2MGUmNMIEU/DVRWC
         1vXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445627; x=1796050427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tVq/cXwfFrUYTvVPC8LWfCG8earbmrGADPgjnQonGc8=;
        b=umypYa8Vj9CM8+3pQhr7qL+0v+QKKF1dy3fyex+rNqLFVUBT3OcnVS0ZxuZX32ly0/
         p4J1CP3pwUh6O7R8hs1fcbWLWXTmLBrkm53XqPbqwea9wTu6gaG7E+bzHafjdD9vQeIp
         8GYGIgJA2atYz0wY9NdsBLmC10NxYZRSK0xJ3CU8ixcqrOEbGGEG4E7tohPIqx/TEgho
         ngzQ0YveTUJvPoyE9ci3eoV3/isx6yy/tYPSTzRUewUCVlvh7stgsF2FMHbtU/AAxFyW
         09X9ySD1bNZJnSBsVsr3Xw2B+O98ncZiWGbUIkEmoMsCAXU8bADjVitNNxz6MTSzSI8Y
         sI7Q==
X-Forwarded-Encrypted: i=1; AL+hErHBvmo6fzKOilr7N28oEmj4zza4e0CMtYPav9KGexHD93O4S60CGPzZ82x15T4JycFxRxOzwUR4TNMINAaEJgoa@lists.infradead.org
X-Gm-Message-State: APuU4Z/atoZaPXXVCbPAaTfVScZLu9hD5dbONungFQmTmPMu4TaJPpAR
	G4oYc+50Mp0MRfEXVf/xNFNYIZ6Yr/iCoc0lIB0e3I/2jorbSOHwONja6zJnjsjSdJA=
X-Gm-Gg: AZFdTZdDLifsGPVhtPGvUd2QxMhT7HwDaA8+jcFaRz8wLl9ofSUnC5jMAruGvf/ftSc
	ZxZDPRfqPsuIf0vShiSlhovvazkyXyv5QoN1+q7zagmQ40xeVj8Kf/OdJSnEczAQKkw3wHm4cPi
	jPqdk6WbcQrKhSOgbUcDx3WkOOEs4YsKhj6GSBq00m+pzepQQsiEH5sPOW6AYQfDd58Egnd6Cv4
	JmQWMyEM/s9IuQ2jS/UETsbX4tYF/+N2iZD/O1ha19dxAG4QqMPw5bcaT0Q7hKs8qnFrseUyc18
	l32zR88oCxHjmQ5y987FoqdJEJLgha7OA6QwdJEsyazne5KuzFEls1+GZ8Ojegxl684P7k43dgf
	1pF6daONpa+5MYcz19OQFVYsmbEdZe/6CJUZmA9+v2dnrGtP2my7Kll1eRPCsyP1c9ZFBymgnBj
	rMmNYqAjZckpla+PyBMUkWdBR/ZTrcsNIjgnnmZNg9Fu/dV21ISHYnZhc3TYS5pnK1b4PYcMhUx
	7O94MjQJVgwFaIX8CkZ8CcMKIKLgw9y7JwvCNMshSlQHnC9n2LTsQzPvD7FQcg8Ezlwlgn6md7y
	NZ97Dmp0X3WH0BTY07mmBy6anMM=
X-Received: by 2002:a05:600c:820c:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb887c29b4mr212865605e9.1.1795445626921;
        Mon, 23 Nov 2026 06:53:46 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm663237455e9.4.2026.11.23.06.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:46 -0800 (PST)
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
Subject: [PATCH v3 10/28] dmaengine: bcm2835: make address increment platform independent
Date: Mon, 23 Nov 2026 15:56:48 +0100
Message-ID: <20261123145728.29082-11-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065348_666078_E0F97E57 
X-CRM114-Status: GOOD (  16.17  )
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

Actually the criteria to increment source & destination address isn't
based on platform specific bits. It's just the DMA transfer direction which
is translated into the info bits. So introduce two new helper functions
and get the rid of these platform specifics.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 77b3e2f58ac5..6180a2737e07 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -273,6 +273,24 @@ static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
 	return result;
 }
 
+static inline bool need_src_incr(enum dma_transfer_direction direction)
+{
+	return direction != DMA_DEV_TO_MEM;
+}
+
+static inline bool need_dst_incr(enum dma_transfer_direction direction)
+{
+	switch (direction) {
+	case DMA_MEM_TO_MEM:
+	case DMA_DEV_TO_MEM:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -338,10 +356,8 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @cyclic:         it is a cyclic transfer
  * @info:           the default info bits to apply per controlblock
  * @frames:         number of controlblocks to allocate
- * @src:            the src address to assign (if the S_INC bit is set
- *                  in @info, then it gets incremented)
- * @dst:            the dst address to assign (if the D_INC bit is set
- *                  in @info, then it gets incremented)
+ * @src:            the src address to assign
+ * @dst:            the dst address to assign
  * @buf_len:        the full buffer length (may also be 0)
  * @period_len:     the period length when to apply @finalextrainfo
  *                  in addition to the last transfer
@@ -413,9 +429,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
 
 		/* update src and dst and length */
-		if (src && (info & BCM2835_DMA_S_INC))
+		if (src && need_src_incr(direction))
 			src += control_block->length;
-		if (dst && (info & BCM2835_DMA_D_INC))
+		if (dst && need_dst_incr(direction))
 			dst += control_block->length;
 
 		/* Length of total transfer */
-- 
2.51.0


