Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095AF606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sSrtR/cA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lv3SBxuT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bKP+aWmCnAOyzY6tYN5Sieibvo/NSg7cNkXShke5YqE=; b=sSrtR/cAoYHDsc
	OMDAZf1fVPO8TpmskiuLegYif7HxKP0cJ6EWnSSTl4akPBURqUB5DzEhLm7ARcrHjVa5pLTy+yAD0
	U/O+wlFcTT90PCYWb1Qlv9T9j0S7sVM4gXz+0Hq+VcH3h39+UQhZG8fMDiFFMkz1faMDffqA0+4yi
	ZWH/cJxeJEmKtZXccbdW0CEOWjFYrnSRpC64iSyV5tiE5vGtAqgp6U3Wu5T1BYKzc48ajrwyCan+a
	GBN/EO2/OZEENMmvasLKB2mZzYUhZUJc3T1VczGPPMuTKNdqUkKGM0XUWcss+MHN508hXjUm0lRL9
	5i9EorN4paUFdBkLIUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSf-0000000H6eV-03hK;
	Sun, 15 Nov 2026 06:11:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSZ-0000000H6bv-3qnh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 06:11:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12577295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 22:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723086; x=1795327886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKP+aWmCnAOyzY6tYN5Sieibvo/NSg7cNkXShke5YqE=;
        b=Lv3SBxuT5iAf+idg/3dkZL98FZAV/SIfMIMatE+dhekNA3QJrCUGZ5zpHjhEwD5rZy
         HGXFrk2q0CA0K1X90HyDv5L5xMFRxiM2V71R5zTriDzhzEbqjss8AZFd2/GK0O0OGFib
         zMD9r8AYbKPoSp5c6lsBln67ulWytJzl3+UxNY1TLPoyZcC9TSyo50FXSHK1x/fc5sNN
         G9gi3on1Y9HQ/WOvnqdHfP1jNEd5sBcQ57/6JHETZvsEQ+xlH4kR1LuGEmXJoKYE1yDU
         gspqI4j1wgh14mkV7qAqXm0CPSZSn0Jg2xzRBrfTVBt6ZKL454n31xwci3FJyh0PFRHM
         RuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723086; x=1795327886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKP+aWmCnAOyzY6tYN5Sieibvo/NSg7cNkXShke5YqE=;
        b=ZZABA7LMRjLMP2dTyvuMAWcHuMYVWj/DqVvtT9IHIYHfhpn/L9NbbJlRnPcgCMdZna
         WYNfius8QleQtU+0hzCxYnLvB/J/ZNhGGxxeluiQXFCYkO/uWnKSRsN/udr9avKU+6uo
         qA9X+giQnq51WMVKyIZ+XaEUA6RZLsc7JPOrqjvIt/f2koP+qv6iWZRvmhm3uYaIKPB+
         yFD7PId14Bhw5GsCr1hLj1pjsXuj/m6MrdZ7EaEnpz8MJCSDtXVD8P9bwylcoJwn8oXb
         1mhFBdL1kXGSFSEFrLZvATurO0Uuphd426E9y9SRKk2hpovMd35bPTgqM9VDy8glrsju
         un8g==
X-Forwarded-Encrypted: i=1; AL+hErFmL4RmlbPcyRfrpT0bQGpQQaD2uqnAHOEuwHqtS4T5q3mev1uaQ40dpoZdajO9cDGnka13rFa9oATuON99LGXZ@lists.infradead.org
X-Gm-Message-State: APuU4Z82XLTG4urv1RCRYPHJIsrZnsZMNIRK/0e12ol/IExkq2S1QwDW
	+GoSm0CITMDalBKnjNX/EsxmpxIQabiwO4/fQ2Q7Qz/kD/qkEaJ2Sz6L
X-Gm-Gg: AYBFou2yhTlk00kfYcyF7LcHM4Hme4MsaKJ59omrpBVeQrLXInNA9B8nc3rOGAe49Mg
	JT2EJ14SBAyw89q4vpJku3tyTY8cSA8mixpEqoJb7ywRyb5lm4fVIj/Tu/u9QQ4/+f3cFtIlGTj
	dGc63+H62dt4t4Zje4cjbN+fpPHuySvOm2rjGV5aJL0YoxAVXY4QqhLt10AEDpHLsu9XxQW40wC
	/rj9eYcrb8me4lPU9Qq7J3PVzDPkls01GJ8T5Da6HtE8s0OPw1IReRGCwfsKd60pcLpIEiAYXqe
	YCf2Ti8Hw94bPvKZszldAxKAB4olP0pr6v/KLBCRq+ON72FpMACT2jWz3SZfuufdbyGwT0CPkVh
	m/SOEYn0b3WqWN2PyIbqkRdsgtmQlPV1b2iL/03a2tKvet002DVu6fnbmJWBG4b2UQYbotTLZsj
	T0+/oOoRfwRfJc79OkXINdqWM4oCSQEYwe1Kjtg6tqS1vKkilghLD1mBUKpP2AUuYo5s1bd+Gqq
	MjfWeXr5SB6PU4/KoX+PfxdomPnIL0hv97pA/+QeccHT+MECGJEI9l8KTgt0gCvMCPM/uzusncD
	A/XCjEZB2jcRaHBIWEJacLr1hyN6DtHUYVspqf13d/1uU+4aAU+x97tlydLSHVQ8iXG4T5QRfR7
	BcqocQhFr/ufd9St/m/QJlo3mYcSHmEYzKsnvNnn7kcorqDuVuT9RmIueghr6f5FiZc2c/uJ8ww
	RzlaV/aJ67fb4QEMiGslV2hpg/Xe6ghsDN61m3cXImDYAElUr25NsN/6usRJyVEryuODR2wReXn
	2/VqQm3F1oISg==
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr151025935e9.13.1794723086291;
        Sat, 14 Nov 2026 22:11:26 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:25 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 4/8] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sun, 15 Nov 2026 07:10:58 +0100
Message-ID: <20261115061102.229680-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_221128_224025_47E5929D 
X-CRM114-Status: GOOD (  15.31  )
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

YUV formats need scaler support due to chroma upscaling, but that's not
yet supported in the driver. Remove them from supported list until
DE33 scaler is properly supported.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 72 ++++++++++++++++++++------
 1 file changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 6b19fafd50ad..09d94f7f9977 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -380,6 +380,33 @@ static const u32 sun8i_vi_layer_de3_formats[] = {
 	DRM_FORMAT_YVU422,
 };
 
+static const u32 sun8i_vi_layer_de3_no_yuv_formats[] = {
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB8888,
+};
+
 static const uint64_t sun8i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
@@ -395,6 +422,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	u32 supported_encodings, supported_ranges;
 	unsigned int format_count;
 	struct sun8i_layer *layer;
+	bool yuv_support = true;
 	const u32 *formats;
 	int ret;
 
@@ -410,8 +438,18 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->cfg = cfg;
 
 	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
-		formats = sun8i_vi_layer_de3_formats;
-		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		/*
+		 * TODO: DE33 drivers doesn't support scaling yet, which is a
+		 * requirement for YUV support.
+		 */
+		yuv_support = layer->cfg->scaler_mask & BIT(phy_index);
+		if (yuv_support) {
+			formats = sun8i_vi_layer_de3_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		} else {
+			formats = sun8i_vi_layer_de3_no_yuv_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_no_yuv_formats);
+		}
 	} else {
 		formats = sun8i_vi_layer_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
@@ -443,22 +481,24 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
-			      BIT(DRM_COLOR_YCBCR_BT709);
-	if (layer->cfg->de_type >= SUN8I_MIXER_DE3)
-		supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
+	if (yuv_support) {
+		supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
+				      BIT(DRM_COLOR_YCBCR_BT709);
+		if (layer->cfg->de_type >= SUN8I_MIXER_DE3)
+			supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
 
-	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
-			   BIT(DRM_COLOR_YCBCR_FULL_RANGE);
+		supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+				   BIT(DRM_COLOR_YCBCR_FULL_RANGE);
 
-	ret = drm_plane_create_color_properties(&layer->plane,
-						supported_encodings,
-						supported_ranges,
-						DRM_COLOR_YCBCR_BT709,
-						DRM_COLOR_YCBCR_LIMITED_RANGE);
-	if (ret) {
-		dev_err(drm->dev, "Couldn't add encoding and range properties!\n");
-		return ERR_PTR(ret);
+		ret = drm_plane_create_color_properties(&layer->plane,
+							supported_encodings,
+							supported_ranges,
+							DRM_COLOR_YCBCR_BT709,
+							DRM_COLOR_YCBCR_LIMITED_RANGE);
+		if (ret) {
+			dev_err(drm->dev, "Couldn't add encoding and range properties!\n");
+			return ERR_PTR(ret);
+		}
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-- 
2.43.0


