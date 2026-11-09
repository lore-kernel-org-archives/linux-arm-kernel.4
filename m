Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F35F606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wpyDCECq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFpbxydf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6lQZd1bM6K+vPoeN+FFObtB7PVIN9WoNQwEnxWfTQwg=; b=wpyDCECqLwYBMr
	/f6GXL6BmPMjGPJYpTdA3795giZX4hMm+BhgaaTqjioqUc58nakT9a5WrVmlgUjtinMiN+K1WTPE9
	Pz02ZLFDuwvYP5j/0dvgcmAd/X1eBp7wLlEzwDexhMJP6b2f1YpE/TSAgLNF0IJZY42v+tYO2CJEo
	1eRK2YczSB4NfzM8c+BQF8ezr3jFyxRhz4MXEPSn/B7ujij59i5rdyXJUqLAZtklfQ4WWtDgD4Agi
	94zX4LISrj+aF0cM9QTHWag1yzq/veJHRvmIuSUND67A2zrUCAnx1SDLrqOMP+Yu2kocTf04snvCW
	/6aAyodoL8xRcpx2TXkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWj-00000001OdY-2EKS;
	Mon, 09 Nov 2026 17:51:29 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWY-00000001OSC-43iH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-491971ac844so1146560f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246677; x=1794851477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lQZd1bM6K+vPoeN+FFObtB7PVIN9WoNQwEnxWfTQwg=;
        b=zFpbxydf8mLU1nZS9svXpNfHaRO8aosVlMFR2cDPVIgtVLgGnbStFw8KdJLG1AASSM
         +cUOiNdVJwiKCPkCofEhHgTgighiTJT7P1Q+JwdXOgDDv9zLryNmtLxVpQUGpmEbEqh4
         94VQNNsa9uAgpPtLMV8ABY28NcBH6gfZFl3F0pPIFANZ7Tv7sgwfSxC38ApBfBuiHspZ
         SjkyVKKB0WpHVE2pINenpOQ+N/VgY/HK1mwlrEll+8mGd+GIsp0c4FmpRKo5C0cvOdMl
         c1Kw6lcXZT8VBW/gxg6zo0zaB1+wGRFNqom69SqAo1vF3SWd2OXTwgxwWZulscP9ed+o
         uuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246677; x=1794851477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6lQZd1bM6K+vPoeN+FFObtB7PVIN9WoNQwEnxWfTQwg=;
        b=PB3Y+IdDGiK2thgZ5dueWH/CSEcqTFQwjUqs2/KP+DLnGuA8DLQ8oa3GON5pJ/4zuK
         XJIIjjd8xWFslYFDd0byrZZ6PWCA7jtLMiAaxDPejjLZWv3xNjUtCiHhxHVPv0lQ4APL
         H041OvRtVWtpnU2r/USJJu/zLzVKnQlY5mbyt7jONWSAJXWPdIYZCWpXyCsygDYe+YPW
         TqiXOvg+yrfLf5hiFBrf30TJeQ2osLuaho43rDZlGaCuP/XkGpUGBP1C4kaOQm3Cpj9u
         jweyCgQITb2Cj3pjOa+hu4TdCkr1rXsOpsDn8lQA04Iv6vSx3ZOk03JvsUP2qTFIK5mx
         EvPQ==
X-Forwarded-Encrypted: i=1; AL+hErGkqmcmy5KjjfB/vkysoaJCZhCkfuDq1iCEU2nPpsQgcXJdWQ55YLqoqhE8xYoqkRu4bOGUxIW/SIDSQkCd1y9Y@lists.infradead.org
X-Gm-Message-State: APuU4Z+pFEk1wp/BT+EqArnU0/5m0UVAvkqrClniU9CjFcZMuYtCn2kU
	JEE8C6caDDaOOj6jYrjCQLPZBSCLSpfLtW89qFQUrWgK5YMVXvhK0dqR
X-Gm-Gg: AYBFou34u5Clh7tMFpmd7All//D+FTkMQViN+GhvOC0TymgeFBSdxHLtzgZUJBND9pL
	N455cP3jQSAgQpzn4QFajbljCzc6P3flWEbsg0uMpv+//N6hM7cmZGw6vTuaF/7JIQeY2PoW3zv
	gaIi4tw4TQ9FtFbq4LRc2kblw66riGX/TbiY5tiauvi0/q8Te7sjmNThxvze89ESgbfb1T4RGak
	Yh/K1PbtubaxIqy38TMoQl54kHIIkPTmJz6wbMOx59uScOvV5ss16UGHvHr92qElgJKjkYXdIY9
	WJ6KZKP4PPZx7EYgj+Mcfgh8p8FcL2WX2dKeadiqWbxVf38P6lAz1BKP0TIfN0Re3f3cUXweHFW
	iaBu54JQa/3vT6/3B25fkBZn+3M22HuGa/uKQwi8AcPLi/axRxqi6aNzdL9tPUOKMkV7ALhgsHt
	ixwoOFhTTqP3SWDz8R2wk5ajGeDbGif/vA3UoSIicwyYKWf3UKJSkTSwX70Z2xVRLtB6pwPbiAv
	0KSCwDqkLp2EOnQsMjc4iV+6++lJNwyZhLtvOu8MrVOmx/49enA2ElLcQW1gHBrTZpzoskoiYuv
	ZKth8bktrkazIeV9ih81RdvEAVR5Q/TJClVDNyhU1GuzulK+/YFvCmPjxwPu27eoMuGJww2JK9g
	h60Di2NCofOkYataZ7F/XebVmOiXfswxulHAx1OGfEZfMAQK2lSpIAozOzD/xCXH8u0QybEikPH
	nQeURAr2qYdirhPXhaV9LkpGKDsrmw6F8x5MrQXLEaAfiTDt9Gw5gKBz110IxvZvawGf9fnhU2o
	rt/p/2ni1O1Q0Sz1KB27hNuMApsLENSIQLfGwi/YDSD3afDTtY=
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr85435405e9.35.1794246677280;
        Mon, 09 Nov 2026 09:51:17 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:16 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 09/11] staging: media: cedrus: h616: use the 256-bit DDR mode
Date: Mon,  9 Nov 2026 18:50:14 +0100
Message-ID: <20261109175016.42061-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095119_038530_B9C3E8EC 
X-CRM114-Status: GOOD (  20.87  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With the DDR mode in VE_MODE set to 128-bit, which the driver uses on
all SoCs, the H616 H.264 engine reads corrupted reference chroma, while
luma is fine. H.264 and VP8 P frames come out with bit-exact luma, but
with about 22 dB PSNR chroma. H.265 and MPEG-2 are unaffected.

The vendor library selects the DDR mode based on the VE IC version. It
uses the 256-bit mode without the 2 MiB reconstruction write mode on
the H616, and keeps the 128-bit mode with the 2 MiB reconstruction
write mode on older SoCs, like the H6. Doing the same on the H616 makes
all codecs bit-exact (tested with BA_MW_D, CABA2_Sony_E,
vp80-00-comprehensive-002, AMP_A_Samsung_7 and MEI.stream16).

Make the VE_MODE DDR settings a variant property and add an H616
variant, which uses the 256-bit mode. Replace the FIXME about the
DDR mode with a description of what the vendor library does.

Fixes: 1f24d4307515 ("staging: media: sunxi: cedrus: add H616 variant")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c    | 14 +++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h    |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 14 ++++++++++----
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6c6aa45f5f96..09b789640646 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -27,6 +27,7 @@
 #include "cedrus_video.h"
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
+#include "cedrus_regs.h"
 
 #define CEDRUS_VP8_MAX_WIDTH	4080U
 
@@ -679,6 +680,17 @@ static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 	.mod_rate	= 600000000,
 };
 
+static const struct cedrus_variant sun50i_h616_cedrus_variant = {
+	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC |
+			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_H265_10_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
+	.mod_rate	= 600000000,
+	.ve_mode_ddr	= VE_MODE_DDR_MODE_BW_256,
+};
+
 static const struct of_device_id cedrus_dt_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-video-engine",
@@ -726,7 +738,7 @@ static const struct of_device_id cedrus_dt_match[] = {
 	},
 	{
 		.compatible = "allwinner,sun50i-h616-video-engine",
-		.data = &sun50i_h6_cedrus_variant,
+		.data = &sun50i_h616_cedrus_variant,
 	},
 	{ /* sentinel */ }
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 572e70a94b3f..78efd3938c77 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -181,6 +181,7 @@ struct cedrus_dec_ops {
 struct cedrus_variant {
 	unsigned int	capabilities;
 	unsigned int	mod_rate;
+	u32		ve_mode_ddr;
 };
 
 struct cedrus_dev {
@@ -204,6 +205,7 @@ struct cedrus_dev {
 	struct reset_control	*rstc;
 
 	unsigned int		capabilities;
+	u32			ve_mode_ddr;
 
 	struct delayed_work	watchdog_work;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..b66d855daaf8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -36,11 +36,16 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
 	u32 reg = 0;
 
 	/*
-	 * FIXME: This is only valid on 32-bits DDR's, we should test
-	 * it on the A13/A33.
+	 * The DDR mode depends on the SoC. Like the vendor library, use the
+	 * 128-bit mode with the 2 MiB reconstruction write mode, unless the
+	 * variant says otherwise.
 	 */
-	reg |= VE_MODE_REC_WR_MODE_2MB;
-	reg |= VE_MODE_DDR_MODE_BW_128;
+	if (ctx->dev->ve_mode_ddr) {
+		reg |= ctx->dev->ve_mode_ddr;
+	} else {
+		reg |= VE_MODE_REC_WR_MODE_2MB;
+		reg |= VE_MODE_DDR_MODE_BW_128;
+	}
 
 	switch (ctx->src_fmt.pixelformat) {
 	case V4L2_PIX_FMT_MPEG2_SLICE:
@@ -254,6 +259,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return -EINVAL;
 
 	dev->capabilities = variant->capabilities;
+	dev->ve_mode_ddr = variant->ve_mode_ddr;
 
 	irq_dec = platform_get_irq(dev->pdev, 0);
 	if (irq_dec <= 0)
-- 
2.43.0


