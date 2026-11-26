Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F21606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lx5c7TpY;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aHOYo3uO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aVE6uQY9znCYqrgi6+/JSfmRMS1q7/GU0dj9T9uQX+4=; b=lx5c7TpYT8CxOG
	G2K+mxhteKyifGekeiMCkvBWNUCuOTz3//Y+y5LjckPtsJJb09dxJGloiwuNvf1bkgHxSa/zyo8iH
	etZFG3go7/wGlNyudyb3gQSBUVsYfpiExxSX6mAlkGgBM5Epq6lWaZj8oY4/JjrgCjAo2NBW7tCNd
	PrI4hmutJZOGXmRAGL1E4RvzFxwII2pOwGSpClbZiTEmy+rJ4k0VFMX5lyFSDQX/BqG0L7c9yjNsI
	sMCzN0YEasdjrEoDaZKgXDuU76V6yVqEF2Mep0/HmRHpfauvdCEc1ulkAXBLMzmZs/y665S5ejEez
	4BOOOrFJ/pnr1uWjW9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTfk-0000000CGDb-2dzt;
	Thu, 26 Nov 2026 07:13:36 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTff-0000000CGBg-0Jou
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:13:32 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so2344826b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 23:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677210; x=1796282010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVE6uQY9znCYqrgi6+/JSfmRMS1q7/GU0dj9T9uQX+4=;
        b=aHOYo3uOwEcIqgjqKIJ+uuPZyKg16D7qihB12dBvK5OfSBlUEKwhIM5UqI7Y+/AgeE
         3P8RiaxiTFZZ+2AwvpCObKbT/1k/V02Rv9ygHSjy8eC9BZJPsHIvY3GFRWCgCPteMJsT
         08mvvT/Jkh0w3sA4aXB6/ZZ392CAkOlpdcH8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677210; x=1796282010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVE6uQY9znCYqrgi6+/JSfmRMS1q7/GU0dj9T9uQX+4=;
        b=v47Zlq43dk1jBpDLYkV23Z4JxSvvaf8xZmEsyG/OCq+/JT+oGq/TyH8CGLoUKtzxPx
         IUBLhzJ5bNf1LOim/++3T9+cwL4Ry3Acz0XG/DBFzAXzuOfPMVZu8qBBw4Tie/Q3mrFV
         z7VEvtSbtZHJPUxpaxo1jPB0IDRVAS38W5nyEGCdV6ws5R9YKqLIhRgY31UqCxls8Sc+
         B3bgNUVKlDstioCHxBdEgRwb6AfNH///il8vCxqjxmp1PDksyaYQ2Pn9JMLXB8xgr9yp
         Nl8zNgCdgMksAK92gZBgZ9fMCi47LPpBJWh1o662gPWp4ZxwKFSLPoegDbpxuZemjJad
         eJBw==
X-Forwarded-Encrypted: i=1; AL+hErG8pjwIxGjKBV8nyQi1nrRwfXW7yqeW2M/ZObono3e0jayjgBX8mjYmKn/LQX7VkbuXBeDxMf7Lqr/AbmVoQnYP@lists.infradead.org
X-Gm-Message-State: APuU4Z9HysdeMmjqGbUTqtY6wwyEzIOEFmH+BZVulW5qCCnrWjGUOF9f
	BES014iwt0innd8ItwsvPr/fWl+rI8+cKtHF2Zz4K2Uyr4LzroC6lZRCowZ+S7UywA==
X-Gm-Gg: AZFdTZdbYvN3LgPldCSac3TfHBGWTMZ0nWjAsm3O7J2gVly0lONAk92LT1RPp8Bo5by
	7DQqLVbybbRez8m4Zi0qyRXnYCkn23pQQOeaX28JJ14DFskWIKnZOuTCYNVybl8/zUwpyb6bT72
	ch3mNmt2G9J/IxgQTqXsm/Kf1DPdqKY4pHNIjIwf5yil/UxKwwx42QNmiQAVIcJ0tfWfUEyxBC5
	J1DxPCgMLA/6xKDXVdTdLp1HgJa11kr348zKB5/buuefrWUpJRxrSLizJ9qQahAbiHZCC+rdnuF
	WnOUEStwLQFVsuG+a9TltjcZHHy8FSRp2e2AUKOodm/E5U3eHtXb1kJmd6B9bSgJt72ibce/FJk
	TQFkW6Rl+pCouzRGuK983NLxROZA9G7VlJHMhcSyCwm+uxs0z4dzhpqW7SP5y1OhH+1wegAVXIT
	DL6IHtsCz2k1pzZrjXeCxi5POAAOaKdXNUgDYhlSdTnEoMFIZ78ofciqSLy01m2dkPrf+XU7Nwc
	mj2W+AZxznjw87oabltonV7o3eieIb6htCVB4B/ivD4Hg7Jt85cwpwXhg1nZxWLxvF4PQyg7EKV
	hsme7wKBZpDsujrawNr8T7KBgyKXNuCKDAe3IhtX10LhAAZ9/I0t7cOm9MSq
X-Received: by 2002:a05:6a00:238b:b0:89f:521:8089 with SMTP id d2e1a72fcca58-8c87bcbcfebmr18588681b3a.19.1795677210131;
        Wed, 25 Nov 2026 23:13:30 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8c87285b60csm10397352b3a.9.2026.11.25.23.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:29 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH RFT v4 1/5] drm: Split framebuffer pixel offset calculation from drm_fb_dma_get_gem_addr()
Date: Thu, 26 Nov 2026 15:12:49 +0800
Message-ID: <20261126071314.253890-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126071314.253890-1-wenst@chromium.org>
References: <20261126071314.253890-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_231331_141829_31686A95 
X-CRM114-Status: GOOD (  21.72  )
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

Currently drm_fb_dma_get_gem_addr() calculates the offset into the
framebuffer memory for the framebuffer's unclipped source coordinates,
adds that to the framebuffer's backing storage, and returns the result.

We are about to add a variant that uses the clipped source coordinates,
so there is already some reuse of code. However, calculating the data
offset for a given pixel is not specific to the DMA FB helpers. The
offset is only related to the framebuffer.

Split out the offset calculation into a new framebuffer helper so that
non-DMA users can also reuse the same code.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: stable@vger.kernel.org # dependency for next patch
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
fb->offsets and fb->pitches are (or should have been) checked by the
driver's .fb_create callback, either in drm_gem_fb_init_with_funcs()
or reimplementing the checks directly.

Changes since v2:
- Change offset local variable and return type to u64, and use
  mul_u32_u32() to avoid 32-bit overflow before widening
Changes since v1:
- New patch
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
 drivers/gpu/drm/drm_framebuffer.c   | 46 +++++++++++++++++++++++++++++
 include/drm/drm_framebuffer.h       |  3 ++
 3 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index fd71969d2fb1..ab0f37d8a5ff 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   unsigned int plane)
 {
 	struct drm_gem_dma_object *obj;
-	dma_addr_t dma_addr;
-	u8 h_div = 1, v_div = 1;
-	u32 block_w = drm_format_info_block_width(fb->format, plane);
-	u32 block_h = drm_format_info_block_height(fb->format, plane);
-	u32 block_size = fb->format->char_per_block[plane];
-	u32 sample_x;
-	u32 sample_y;
-	u32 block_start_y;
-	u32 num_hblocks;
 
 	obj = drm_fb_dma_get_gem_obj(fb, plane);
 	if (!obj)
 		return 0;
 
-	dma_addr = obj->dma_addr + fb->offsets[plane];
-
-	if (plane > 0) {
-		h_div = fb->format->hsub;
-		v_div = fb->format->vsub;
-	}
-
-	sample_x = (state->src_x >> 16) / h_div;
-	sample_y = (state->src_y >> 16) / v_div;
-	block_start_y = (sample_y / block_h) * block_h;
-	num_hblocks = sample_x / block_w;
-
-	dma_addr += fb->pitches[plane] * block_start_y;
-	dma_addr += block_size * num_hblocks;
-
-	return dma_addr;
+	return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane,
+								state->src_x >> 16,
+								state->src_y >> 16);
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index d32aceb6ca9b..589619bd8f0b 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -21,6 +21,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/math64.h>
 #include <linux/uaccess.h>
 
 #include <drm/drm_atomic.h>
@@ -1208,6 +1209,51 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 	}
 }
 
+/**
+ * drm_framebuffer_get_block_offset() - Get offset to start of pixel block for
+ * the given framebuffer and coordinates.
+ * @fb: The framebuffer
+ * @plane: Which plane
+ * @x: x coordinate for pixel
+ * @y: y coordinate for pixel
+ *
+ * This function will usually be called from the PLANE callback functions,
+ * or from one of the helpers that calculates the framebuffer's DMA address.
+ *
+ * Return: offset from start of framebuffer to start of pixel block
+ */
+u64 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y)
+{
+	u8 h_div = 1, v_div = 1;
+	u32 block_w = drm_format_info_block_width(fb->format, plane);
+	u32 block_h = drm_format_info_block_height(fb->format, plane);
+	u32 block_size = fb->format->char_per_block[plane];
+	u32 sample_x;
+	u32 sample_y;
+	u32 block_start_y;
+	u32 num_hblocks;
+	u64 offset;
+
+	offset = fb->offsets[plane];
+
+	if (plane > 0) {
+		h_div = fb->format->hsub;
+		v_div = fb->format->vsub;
+	}
+
+	sample_x = x / h_div;
+	sample_y = y / v_div;
+	block_start_y = (sample_y / block_h) * block_h;
+	num_hblocks = sample_x / block_w;
+
+	offset += mul_u32_u32(fb->pitches[plane], block_start_y);
+	offset += mul_u32_u32(block_size, num_hblocks);
+
+	return offset;
+}
+EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
+
 #ifdef CONFIG_DEBUG_FS
 static int drm_framebuffer_info(struct seq_file *m, void *data)
 {
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 38b24fc8978d..6f838b485730 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb);
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
 void drm_framebuffer_unregister_private(struct drm_framebuffer *fb);
 
+u64 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y);
+
 /**
  * drm_framebuffer_get - acquire a framebuffer reference
  * @fb: DRM framebuffer
-- 
2.56.1.839.g22a8290db9-goog


