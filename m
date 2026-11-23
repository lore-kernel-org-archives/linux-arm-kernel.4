Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1578606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QxBd8bYW;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bxg9PynQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e9DOyZqREfCbWSQdjYH3Cx6SxSP6lHmhvZmakX1uIME=; b=QxBd8bYWToUtfP
	YNViBcrHuQx6aowQKvwpCmJm0PA1oYIXfz+LdPU+ukHkgN3nKVHHiiN61pFJZOU8dBgkEIdXUfuEu
	lC2iEhX2Wj1FKeqN2hONTSLDM/cjglVWSmqEDfsNT60bNWI4beM4PYTgzsxGXY4f2MvWhjhe5rnsB
	k7ClTCv7mGUe617xJWLvn/kZt9fVtHO4QdzHHFmWL8UFL+vBccVP/z7JOQVXkKJYGJKcjkQZLolDT
	pwufvUwtlsCVDHh0N6h3bvysmNnr0F+l0qudcQUdH089kFhyn++Hlt+kqI4zSyJzojc2gJhwAQXuj
	By9c337wFBiNLnBv5A0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVS6-00000003paX-0lX1;
	Mon, 23 Nov 2026 14:55:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQd-00000003obb-2J4d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:54:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so26695285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445638; x=1796050438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9DOyZqREfCbWSQdjYH3Cx6SxSP6lHmhvZmakX1uIME=;
        b=Bxg9PynQjAi3eRgOYetGWT5mKDLX8Q/ci2TDiH4gLgNv/2DuNVe1Nw9rhy84zxyaOA
         Kb0q3SFAkyqXTvDSsLlDodHgJN7poEgY5yx8pMGqAihsjo58E0JqG3Tu4f6nWZkx2cGT
         bDldAZkkinEz5gXXlrTGqbMKD9y6wdlKhP4AQL/r9StnWPSUxMw3TuRUlQ3yGPGZ8SKA
         MUsSIMqmbd5O8Jyw4TsPnyCTmcwHTGov+wTcyXOcQyO9ZJ7PvujisgoWVt3xewgE8d9u
         iO9lOrsnAH37ZOPWtk1YS53aiEgq4X+QOIPr0fRS8SwNkWi3zcXaWDeX7QDz1zFTJ1ar
         SN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445638; x=1796050438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9DOyZqREfCbWSQdjYH3Cx6SxSP6lHmhvZmakX1uIME=;
        b=v//8pYf7gM2PgkjJpvQ+rZU2byJfagzt/d3K0GygG5o1k7Odb59g/JcHIUpTqLNKLa
         d4oiysONzudToqW/v1+0ED7UiUl/f7/A0EI9iyUi5yvM7jUrlcGKmqkBTYcGge1Sgjap
         x+gFmfB/IZzgbsQxyA23X8zBRKkSm7CA+pznakerfq3jthbuLdPQpGTZ3l8zB/tMhNX2
         qzJR7Anc0uYomHbEiaqRLyCAnXdEVi9Tcz0QJbLZgyB9UFoRYUcyTlkYB20ps4Qd/WS9
         Ircs6NHwXfqAFm+kkMzoOC9OzG1mkz9DgPu8auoxgk0JlYZDZWeQv31ip/8IwIEFz5xD
         x9/A==
X-Forwarded-Encrypted: i=1; AL+hErGBDNEdrgif1rO49ZnusP66i2RHz6wZXTp5D0vXuxX9yDq+PaXFo9PaS2Xp8xhpgwd2/PmU6gY4DRFxCXab+H3V@lists.infradead.org
X-Gm-Message-State: APuU4Z+QZccmTCv2Z/0dUi706i6OBYwhtsjC7ZBcw8IdkNCgFnvzxm/B
	wIWQXUEACYx/Vc9RagyTqQCEwIJ1KYA9GrVJA6ZAxxPxX32PkUkCnRPmg0L+E4nqWN4=
X-Gm-Gg: AZFdTZccZ+vQBJf6fr7TObSEWYXT1gFRw1ixE6BiiVnZoBanqhuihddEPlJsHslZqAK
	eWg0xOGZ5Y1JIKblvx9w4OVH2MxF47bbkcGV/mvW6O2GPwfOPvDQ2qkzkAdEcM6yRKStLjrzdRc
	DTPwU1simCkI1xx6ZDzwS+MKrc2Se7QyI0TBbeaqZIHCIjb6lbHpQrzzL/Jt9x5m3sllSlVE8/s
	D20+PxHAj6PnTaYneS72OvYy44tmClAYOU4jEfC335mwBNSegAf52b6M7RUC8PBDymy6/P9jxDk
	ozdxHDy+x+y64yVfT++oZMUp6fHVHOJvzIaBqmxklbwrHwUDzFACFmprHyBWhqsdpDutxwAq+fc
	1efIM6YRk0ZrENqYtfTlnaZnDq8yDlGksA6Yj/GLRVw5aso5sKCp6DAVksXSr4mHQJ/qCVgaUZW
	65e8gKGixOwxZ2sH7YJyunkmC1IqGJhhO0Hezi3NtnIexAZzknaBVxwOFyaKzEfw9IXSAfF2Z+Y
	hmNsyF0gcx08xzhJZH1kG80Her/vhGn7hDIOq9Sx6jOXEm2rKVIqdLU3KGMnLVUGXVKUC1/Fmzj
	Ty6p2ZYhFLWdvIHUhNWND7V3yMY=
X-Received: by 2002:a05:600c:674b:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb8892c0fcmr226742705e9.20.1795445637861;
        Mon, 23 Nov 2026 06:53:57 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm469509035e9.0.2026.11.23.06.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:57 -0800 (PST)
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
Subject: [PATCH v3 18/28] drm/vc4: hdmi: Pass the CPU physical address of MAI_DATA to the DMA engine
Date: Mon, 23 Nov 2026 15:56:56 +0100
Message-ID: <20261123145728.29082-19-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065359_708823_57701399 
X-CRM114-Status: GOOD (  19.26  )
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


