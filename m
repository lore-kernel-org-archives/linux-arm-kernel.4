Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E05F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T+dJC6Yw;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JY/AY4Ha
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e9DOyZqREfCbWSQdjYH3Cx6SxSP6lHmhvZmakX1uIME=; b=T+dJC6Yw8MUXVl
	L+xa8bmWnd4/kJ+sXOgC/rznN4LkTmoRQQJHPNX/hhHLG12p0LkGFQvK1mrvS+B9kD7RrSpgU1AKD
	T4LkBi+MCIGgFv7XJrNcqV4aVMLE5J2m54MG2fttjJ80tEtge++RDxwrB9K+maXUMz6JaoHur1XmQ
	zeB+F6fafEhspISYKgLkr315zzSnuvvfXqoaiD2POeA4cATvDiZOh76fOY3glDSIthMc64KWC6OYq
	V4sUCYs4VhShdLsz+9fEQticgf66OYGAMSn4T4QxbSU1drl27iNek6G1t7O7Q4X+e1QmyUrknEW/Z
	E3ktUjhJ8X/sE9a+jfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuy4-0000000G5FD-0uk6;
	Fri, 27 Nov 2026 12:22:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuuy-0000000G3EC-2qUB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso81164795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781947; x=1796386747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9DOyZqREfCbWSQdjYH3Cx6SxSP6lHmhvZmakX1uIME=;
        b=JY/AY4HawXl1GIsngrjS2y1WqAP3Jn2xhIYDG/YqdcRnxmabFaEHvBzsw/hqw4+IO9
         ICsBpaWIRc87OJlSUzy6A4KHSmMmNUlLOrOeirjFDuaOMsiSKqhzj/Yk2X6xDRS8sng/
         xrhITafEAvHwiT6+iD3+vK+4heIFilOX9OEHpk44bnrY6DIaZUo8HNuG84f1p5y5bZj1
         rzQxxk8aGxEZXaLYzgF6y9ToXoRDZn2Un514jSLSnrGZkM6HsMbpekMU6QfdFC1M1wes
         /KadQJE99CDc8S6vw3Wo9aEkr22DqqmvGJlBnZAXEoWfdWAydxQmdOLYn/iakaNxXMJl
         9ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781947; x=1796386747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9DOyZqREfCbWSQdjYH3Cx6SxSP6lHmhvZmakX1uIME=;
        b=1XK0BZMBRiMXCXbkepTWZzsjwuU/kMU9//qMiPdTg+KlSo9zswUM6LTK7vkKpm2rSU
         AbQqfwvUoipK0B7FOkJuhSEZGoLFIZvuv87FZiGLgi5nSr3N4vqMWI3E7nrD3nXFg1LW
         Nieohcik1NV6QkmOIVw9SJLAh79aB/E4kJmUzg1cry4aX5kJfxWfUj0tbwOuI+q8AyIy
         xgWynJ1ChLQPJRhUUx4S2qa/ZPHwQvUIDejoQk/hCyoptGQmuLNLClEbDQpHZQuFt8xk
         ++T/GvDfzjwrx6gkJjbll2fcfNk6Uvaj+GvejOmc8aRT1mvsOddbQ2bNwsEpmCMikJFB
         cnvA==
X-Forwarded-Encrypted: i=1; AL+hErH8ngd/Fbd4sx/ZyP19SUQ6qd4bVXYk2osjHpGF08kmnrbZH6meWTp3RXA8CuDeeKcUjLxREe3gNDBcRFr80r4j@lists.infradead.org
X-Gm-Message-State: APuU4Z+7iltsgb+zgss51mRrmqusXyb5x0CtUUahEDqrAlwKEc/sPv7K
	gygWQ3WCmnHYRDvthkLxtT3qbR5yQccUljaVjyKod8lQi0yrIPg+wdm4oO2eOvBcG/4=
X-Gm-Gg: AZFdTZflX1GHRrne7zPARAFXoWll/vGnkBxUm0VxTVxD0pEFmlgiHMI+9coPpHTy6ZW
	jSrKfwggzHzHiPJyptKstDDcRt3imkVtjsfjhuuXxhWvEjjYjCEKiSX2s+iYbls1jyUtwZgZc/F
	fNDVdTr9fBUUkVAo6VP7tlD00yWoN1JYxhcQ0nroiMYgNuXJAn2c3H0TSx/Xzo/LxypzN6r3+Pk
	LGOQ5YHm1TB7DffbjBK9dcEgZYoiuRKsi/O2V88IwG/Kt75Yq8z7CN+K131tPMMSvQM+KmAjIxL
	V+lduvqguY/1TcwUnp5MLBPXInkPsdSqkKGZMf/Fb12Zlow2xlxbsm4WVRRxzUQ63jvTV6velbl
	mhg/Ip/7udz2s87D7bMHsdNaW3EIwZeEp+u3VIvR6yDz/wJgZvkZAD2SXcHJPWHyBMLoGr3SNzW
	0zd5Jl7o2sSCWIxnpkM+34OgWG3w3XeHvTk3L1JD0O03BnCnqH0T8dZBgKyuVQeFDilYKcBjp/W
	7jEkBW2qfo7IMEc+XmKYZ0jSkbV6ZvF/Xu2hokYYYY/aWb8HFnSGj/xYsraArWGiExQio2wGhP4
	UkMKQHqQkrfSAO7oLPuIrDvPeQFSFaK27Ce0XQHZM4Mx+LRilQ==
X-Received: by 2002:a05:600c:1389:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4bb88924f66mr488154985e9.35.1795781946969;
        Fri, 27 Nov 2026 04:19:06 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9065744esm373251435e9.1.2026.11.27.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:06 -0800 (PST)
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
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 18/28] drm/vc4: hdmi: Pass the CPU physical address of MAI_DATA to the DMA engine
Date: Fri, 27 Nov 2026 13:22:08 +0100
Message-ID: <20261127122236.4976-19-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041908_769975_E426F640 
X-CRM114-Status: GOOD (  19.13  )
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
CPU physical address of the register resource and drop the comment
describing the old workaround.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2cc46036f11d..9dc1a67aa7fd 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -47,7 +47,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/pm_runtime.h>
 #include <linux/rational.h>
 #include <linux/reset.h>
@@ -2288,7 +2287,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_dai_link *dai_link = &vc4_hdmi->audio.link;
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
-	const __be32 *addr;
+	struct resource *res;
 	int index, len;
 	int ret;
 
@@ -2324,22 +2323,19 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	}
 
 	/*
-	 * Get the physical address of VC4_HD_MAI_DATA. We need to retrieve
-	 * the bus address specified in the DT, because the physical address
-	 * (the one returned by platform_get_resource()) is not appropriate
-	 * for DMA transfers.
-	 * This VC/MMU should probably be exposed to avoid this kind of hacks.
+	 * Get the physical address of VC4_HD_MAI_DATA. The DMA engine
+	 * translates it into the address its controller has to use.
 	 */
 	index = of_property_match_string(dev->of_node, "reg-names", "hd");
 	/* Before BCM2711, we don't have a named register range */
 	if (index < 0)
 		index = 1;
 
-	addr = of_get_address(dev->of_node, index, NULL, NULL);
-	if (!addr)
+	res = platform_get_resource(vc4_hdmi->pdev, IORESOURCE_MEM, index);
+	if (!res)
 		return -EINVAL;
 
-	vc4_hdmi->audio.dma_data.addr = be32_to_cpup(addr) + mai_data->offset;
+	vc4_hdmi->audio.dma_data.addr = res->start + mai_data->offset;
 	vc4_hdmi->audio.dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	vc4_hdmi->audio.dma_data.maxburst = 2;
 
-- 
2.51.0


