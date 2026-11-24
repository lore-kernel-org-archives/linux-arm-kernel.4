Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A2E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x703RToF;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IF417Fa+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NOv+lCeuytPMgK0k4vfCvQSlUO2ysKfU7YDIKLNZGwM=; b=x703RToFgb1EHK
	9fCP+xZ0vdLGAO10QISo3bTKwWXIXMEjuJSS7I1eaikmDfeIn/wBI7gyfwpro1/bCCXUuyHeISuoE
	/4ockZitPrVVgGH5a6dexkn8YQQKj1k0TNTcz6c0oKq+6dmip0y1xUMwf0IdtDX6NYNcYDE/hn3FC
	Rnyr7ZArKa+qxnX9kkxDwfn3v8CSdUjXhJLbWvV1L+CxtJyA5VvHB8wkUdV3nCb9CvSYz4ptt7/Pz
	UYwFWbttslfdjFlfVvaof2gAwmV81sytHb57nyQPfEHd2lqjTJDB/k1/4FiFRJc077AVBNNK9I0Rr
	rZhVBeinfmGfjrpepLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl9M-00000005nBc-0s9y;
	Tue, 24 Nov 2026 07:41:12 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl99-00000005n7T-45c8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:41:01 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2293113a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 23:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506059; x=1796110859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOv+lCeuytPMgK0k4vfCvQSlUO2ysKfU7YDIKLNZGwM=;
        b=IF417Fa+oEoux7QDiMzcBtcVWTgPWmI2FmiTsl1mkfjboOrvFavTYgRVAMwZcjMI++
         lgsUaTOz/W7mWQGmHDbKyzOUjGzTQNGzyzEJbuNHuRqov9mL2Zsvbu9ZpGqFNu0MlghB
         23ukQxiUghGLZrreFwcjgDNMayJswb1qVItJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506059; x=1796110859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NOv+lCeuytPMgK0k4vfCvQSlUO2ysKfU7YDIKLNZGwM=;
        b=kR9ciE7Lay/XDuw+ZFK2HT2qqj9hyiCWgYXor0Lxa9BG0J96O5RUOt8RGIiTAVi4zX
         uEGj/1WVKrB/gM4U9Fm2eVfSajlBRNz8p1Q3mL6f1xSliU/nypi/inJciWVK6lP0NMkO
         LjoL7qsCQEhZCNchADpYgHcwzWaTurJeM+Yhcc3j726JyNv54YJO60Nehb1vu2AEGTUO
         o26H0H+FjlIqkqqPi0FJDB8djgAamnYE3MfS1AKez0fKjWGmoA3n2wcDVQ2usvmEDCc5
         Jrih4fv1nN2ujEdLKDBqeQI+8GyVUxkfJaa0zxKV13MgISzbrsT/HxLAEb9j/4vVfqr4
         QKnA==
X-Forwarded-Encrypted: i=1; AL+hErHdhUPjcRwEDz8Wu/PEXeEOVm2nbJtgZU8RcsgtF5BFGTiZpTDMEJwV0VT3HqfGLuOhrw+039Z3Oqov9l3Sn6F3@lists.infradead.org
X-Gm-Message-State: APuU4Z+uC7vjSXZYt00jTkfXs7xbF8uCzaRUEIV8VgqxSo60JTsx2kBs
	tnvjMaiEkcGO+g2dJILRb0+bBT2q9xfVRWe5595Q84BWe4LN7RVBoTDnvhT/2u0Q8Q==
X-Gm-Gg: AZFdTZdsZGCmkE8q+A7zL/14gmtivskO5IjJ1cyhlfZPBhlugm1zaag3mNDgGGPeWer
	jElxVCeWZdfxAAwUTC9HWkSlalVJbM/+8+db144V3K6DJZOteI3FwJT9m2jywNuyZ9gweD3n1z6
	p6UpASRJZVOqFmYFBuEvMmugZLbCQAiW6fXCIFTFpJlpMjpDPu5AjtvQSoLqwLhYqHD+4bvwOYu
	J4hGTt1QpbjNM69+6s6z/enwiUTbp5tVORbnqGnSSIhjIJ4VWEnC/BCm2DqAM7hwTbCHdqgKTee
	NeJce2lh8wjWlylVKvX2JAQAbGnC4NLC8LpPVKXpHKnRtqHhaIbtNEss6q6Bxg9Cuu86eEUB7Pe
	kEH4fgYKYr9RKymnhPmUVBGi+HsHh05e62zm9RFroUznXNRF6lL+1d65sscsrUHh8FJ06j0k1qG
	qOtY7VjekyLySCUuKTzpbR29SelfUiEwHDOSw1jPh6wQsinRpK3LURtPM3YYfEvyhT3K6EEiAtE
	sVXus+XR4lVc758TE4hvjFGOwn6eHcfzpNHG4wdbHV7YHi9QMF/zEFEIAz+0Z9dBe3px3FkHxm9
	FGZXz6QUuFTAQgqeGxvvmNyG/O8nl4InHva3uZjUL9++Jldf0k14R6/M5lx8qngkDoyuiQi5fhX
	DVmO2QQ==
X-Received: by 2002:a17:90b:2247:b0:3b3:fe38:d8d4 with SMTP id 98e67ed59e1d1-3b40a5f92ddmr11465678a91.34.1795506059023;
        Mon, 23 Nov 2026 23:40:59 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde6cfc8829sm6568259a12.8.2026.11.23.23.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:40:58 -0800 (PST)
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
Subject: [PATCH RFT v3 1/5] drm: Split framebuffer pixel offset calculation from drm_fb_dma_get_gem_addr()
Date: Tue, 24 Nov 2026 15:39:29 +0800
Message-ID: <20261124074041.115251-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261124074041.115251-1-wenst@chromium.org>
References: <20261124074041.115251-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_234100_056079_83B03FCE 
X-CRM114-Status: GOOD (  21.65  )
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
Cc: <stable@vger.kernel.org> # dependency for next patch
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
2.56.1.809.ga0b61035b5-goog


