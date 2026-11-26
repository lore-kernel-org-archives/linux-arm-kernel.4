Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD76606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DLATJYft;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m+jmnHtN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J5KKQj+Grt6zgozyhH1Cn99N5gjYRol48Ra+q72Y3/4=; b=DLATJYftcPgbQy
	CQxRXqgc9Om9vYYsAXg9qEI3N4grGUoIA5VAABHjBS+vt0nclCEIjLklyFHRuTAgBTGb3i+bEOS//
	XjRbS8neki0ftU20hVGtX6zeHKScLt+2/YqqC6VJ1ELN29Ov7jnmJIoWSx6/mpPMCEA+QlRzqQhXW
	ELz+bXncnoMRe9ujZ6BtlYUjbp7WpinZVoX3AoysLAwx8D9m6R9SuFAXOqOB5J74se9e4iOpBWmKY
	THf6zSSrr6pLNlQBsvcjCulz4M26P6TO83UDGZembKrGqYLchyN7rd3tXPxph3wvASXn/7vT/lAdn
	PpkFf2bnaxb8ZCARRbqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTgD-0000000CGVP-0XVj;
	Thu, 26 Nov 2026 07:14:05 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTg2-0000000CGP0-3bB7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:13:56 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2f046b0adc0so38829115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 23:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677234; x=1796282034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5KKQj+Grt6zgozyhH1Cn99N5gjYRol48Ra+q72Y3/4=;
        b=m+jmnHtNBoLe9Dfs9kkqxlubDePv+Po8ATZzt7xe2AWIoUe9XDmc0lDdLKQ8Vw+z29
         2uftTJ9jtpcMlXqgPiBJ1EQ84XaMj+FIBOscrCkFNmkeJ3KQy3LWH8Gf+jBUlTMc57EZ
         NZwGziIhlt/Ti5qggWZXSbqIhZKDOdgEs50dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677234; x=1796282034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5KKQj+Grt6zgozyhH1Cn99N5gjYRol48Ra+q72Y3/4=;
        b=wG6cY+Xy8hNx13gnbYwv4rFO6Sf8DpxuKZW/idLXbMYt2N9bgP3nmAn/ppuBdfMQef
         AV6D5KDGaC6aTpJGbS1ouFZMNzJSnmIm0TG9syt3o50nN8l6CXn8HzJkF8KWuqvB3Xih
         D6lX72ksojJYVQWd8I1n0S5kViZB6Z2u/iwWOMP+BbEP0mFW1Vv5/KNUHjAoCzrLc266
         qx7iC3r5QLgRaajYQ5GcehtE4stDFPtcPQlCM+J2IebTJBHZIk0dvFkl+YbApjLVETJB
         cTdFe2xYm1L23+zF4c2gP93nmqCpdsCBZm02w8BWbOXqGH4cOHUZ9cJ+aYH9NR/KGVAg
         s7DA==
X-Forwarded-Encrypted: i=1; AL+hErFTwrv/6ttCMnPh322q7k62bRrkUMtZqjMwoZdTRzafRMQx3MFXTMTdlRC9QTPIC2z3f6ATJDzeRWXkMhFFhz8E@lists.infradead.org
X-Gm-Message-State: APuU4Z+ZooZEv0yP3LIhMOpWdmhglO8ALprQ6Nx4I0Jp+/qjC9+KkvEu
	6g7ZV+I7+QXYT9GlpNCdmefMUV0DHNfM0nouvJo/1jC/6rG8VRnw+fx2mBPFl4A6Jg==
X-Gm-Gg: AZFdTZf9Tz+IlsjxV/EIDLGq2VbD0bo68QMtGEdML6h/X6MoQvIor5vzwJ9wBBzMIaW
	8pNNktZ3sQEjRNR5OUpM14smMtOIR6CBojix1i/IFPOUQnDaHDFM/49aWI+44gIwnOesEnYcZfO
	TFq018BGcLGUoWXVMC9S8NhZkl9v0uiilG8qXVS9WT5HCQyi6BvKZreSzsOT/8QsCoiWKYboiC6
	57lofVeGOqLXHJv3/6RPRB5CdMZ0YeBhcVR2NO+mT/mPElrUJ4QnW1CGBMkOpfAnLAhkj/ncPWg
	SZtGSwlVsSymvNGiKySWU0Ik0ehOvWM5Htj+J8AF0mU7pZg2wprwRFGyXM+ggLLxi88Gt7g3FeT
	NR2MO15HGmsRyuzeF5NT1iDYVVI+mjuAyTSthp7Y9lOaJ2cN78w/jCZIik1+lsMBmI11scXyjwW
	NpBgq9xp5WwLmg6vtWe6/LlwHPLwmN714XOKLcl0czUeBvheSKELF8qfXGTax7A57blRJB3wlO3
	DfXFiPt5ZnwQOvhuVAp/hcii8JuleLoFmRsePmwufLWG6g8Al+XBtgGpXIZCPpXl+dlnteShv0q
	fzI72OlPKAQ0nNL0TegWjnh4HDPzbDjn58l5wpCy9/VWix1ysxa0SFxo30YizVNf+RaQZw8SW71
	wl+Q9Ng==
X-Received: by 2002:a17:902:f545:b0:2f0:585b:8d8e with SMTP id d9443c01a7336-2f0585b8e12mr169849155ad.60.1795677233916;
        Wed, 25 Nov 2026 23:13:53 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f0bc695f31sm41539205ad.49.2026.11.25.23.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:53 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v4 5/5] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Thu, 26 Nov 2026 15:12:53 +0800
Message-ID: <20261126071314.253890-6-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126071314.253890-1-wenst@chromium.org>
References: <20261126071314.253890-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_231354_948044_C411F751 
X-CRM114-Status: GOOD (  17.45  )
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

The i.MX DCSS driver is open coding drm_fb_dma_get_gem_clipped_addr(),
with only a slight difference of rounding down the X offset for the
first plane if the format is packed, sub-sampled YUV. This is likely
to correct the buffer address to the first pixel of the 2-pixel group.
Otherwise the hardware will start the scan-out from the second pixel,
which leads to the U/V components getting swapped around, and the
chroma component of the next pixel group being used.

Switch to drm_fb_dma_get_gem_clipped_addr(), and offset the address by
a pixel if the X offset is odd.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 34 +++++++++++----------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 303e93fd036c..580d9cfb4053 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -219,28 +219,22 @@ static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
 	struct dcss_dev *dcss = plane->dev->dev_private;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
-	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	unsigned long p1_ba = 0, p2_ba = 0;
 
-	if (!format->is_yuv ||
-	    format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			format->char_per_block[0] * (state->src.x1 >> 16);
-	else if (format->format == DRM_FORMAT_UYVY ||
-		 format->format == DRM_FORMAT_VYUY ||
-		 format->format == DRM_FORMAT_YUYV ||
-		 format->format == DRM_FORMAT_YVYU)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			2 * format->char_per_block[0] * (state->src.x1 >> 17);
-
-	if (format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p2_ba = dma_obj->dma_addr + fb->offsets[1] +
-			(((fb->pitches[1] >> 1) * (state->src.y1 >> 17) +
-			(state->src.x1 >> 17)) << 1);
+	p1_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
+
+	/*
+	 * TODO fix address until helpers know packed, sub-sampled YUV format block size
+	 *
+	 * The buffer address for packed, sub-sampled YUV formats such as DRM_FORMAT_UYVY
+	 * need to be on the first pixel of each pixel group or block. Otherwise the first
+	 * pixel of the next pixel group is read and the U/V values get swapped around.
+	 */
+	if (drm_format_info_is_yuv_packed(format))
+		p1_ba -= ((state->src.x1 >> 16) & 1) * format->cpp[0];
+
+	if (format->num_planes > 1)
+		p2_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 1);
 
 	dcss_dpr_addr_set(dcss->dpr, dcss_plane->ch_num, p1_ba, p2_ba,
 			  fb->pitches[0]);
-- 
2.56.1.839.g22a8290db9-goog


