Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85411606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mRa6PbP/;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CKizmTj1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rsARERdZD46Vb5O4JLoK8Z3OY4IcI9MHjMKxLTV0Ng0=; b=mRa6PbP/GLeccmR7f9WlvnBnMk
	ovBDI1qLQSYYEwm5CM9zajrrHQ/Ip03z0NeYxms8a9xZuPrWvQSZGjzVE0zGfZxOiUP8ApopOXOd2
	egj8AUgkpyDvoyJF6eVh1W1+l3zOdK/YxITWLHYM4XfBDjwCp1IH35fayvIsN5uQ8MVqXNUo3Rep5
	OQzmk/L8O94k8n5xJvf43LpuEdbOp7jAr/4JzZRkf4ethx1d0jcdc0+d3SdRzm/FKU92pOh7/STfp
	vYsMlrLZzlPR92EjHR8qqSEvXhvHlN55sCi5t+MOHbz4IuukrhGRztZi5zJ1fGa1LgDTUOKYDZzUt
	i9IJd0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOQD-00000002S5T-2d4e;
	Mon, 23 Nov 2026 07:25:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOQA-00000002S56-23wN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:25:03 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2f02f04a426so24044825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795418701; x=1796023501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rsARERdZD46Vb5O4JLoK8Z3OY4IcI9MHjMKxLTV0Ng0=;
        b=CKizmTj1W39C4RkWnoUYb9E6Stb7iAbCRkn+8kH0aA/t5imYAejRgcFZkfbjhBYFHV
         4Zz8+3QjmvClefmJecpvc1iivnheHmnOr5WX+d4UUhpe31sia1PiEQuSptxSpQOkB2Qj
         tLwL7Fbc5dqB8IE2M6A8ugyLob67D+0z8AoRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418701; x=1796023501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rsARERdZD46Vb5O4JLoK8Z3OY4IcI9MHjMKxLTV0Ng0=;
        b=BWq21veP6YWa929UJ4NZwVlmr+6CvrVl+YKUkp933i+KzKksMP91Knfd2EiOar2QXV
         lDQ2A6O7j77d2x1ktyfUbu1kAkVsigrmIwThMxBVlhKncMfEWjBdTyNZ1Muzj8ZEYgIa
         FM/vSn0MF83/BytVThQf4MdBUfOo6V30V7vBXfdL/LVT7XYyeg8J6xZrznK774sdaHX9
         83SDZS13lKHYRf2vIR/2I7SZiaBrnJzxMkLlXfTBQa8kUlFnYXZIPsbCplTHwCNnbFa6
         H7IxgtowYIIeLeYdGwzPflToNfg1MCT7jHQHRdE14C3tqiilpj59EhjEQKqNdL8mX+yz
         5TOA==
X-Forwarded-Encrypted: i=1; AL+hErFaQI8m0ft+T+ExL4GpG3jisaQ3tr/74hxe7gAUFN93x5v1I5quSmTGoRc6wwOE+HImXdyZXRQXOVlCCySHWQDU@lists.infradead.org
X-Gm-Message-State: APuU4Z+P9E7lOw5PHLi3/hpkQfWHHeqMErqKzKJbjNHorjg8SaZgpk3q
	q9SwqCxVGXoXOm1nfwdy7tffHK5df6Vvwr/SVXGhQXb637oK4qqtGDg0IkBhwnZDnQ==
X-Gm-Gg: AZFdTZc37oBZ9+fsglmdce36v9gDRgujnY6yj1b3En/ygp+a6pRCvD6aBbhYY1YwBJr
	S29U4ITaVuQj0UL5EMKGhojqYORautybfyePaDfg+62493H9p7qQgW7+6uVaEJ2R9N4ZHIm/yvP
	z6XKk9BunQcr9FV9OL+1DnVmcs6kCkhkMaJGlMkFci1Xi6L/R3HVOeahv1HyJF+jHDfPS/UtUwq
	Kj+05mKcgQ5KEWBxkI7kP6Z3R9g5VsiuPzkEWfzS2B2hfsGMe8xFeqOZxrHkU4W6xodbJd94cfV
	tN3n/HnSgHtfxOorQ+usKOepHKMHV3fuxt1fh+xYHRgmiLb23PgJhrXweZWVMjfUT0yLwF8dB6B
	6xgns3MgOkARfzvTaiKX+8bOIto0K7stFdoqangvyv+/YnJC+3MG3/TjunMO4RaK5yktT/44pPL
	Xgh25yd8jyfmUlFIut8npmwm6pc74sFoiTI7wYo/2lfUB6ThGA1iPTjcOZ4AXkoWS7AOnyYnGGN
	ihKZOw+kL7OzKgB8R1bjxP+XNAMBfBCy6l4d/V9O+WRqgdbwB4Hjgqynr16VrRCO6Mr3IxChMJi
	TMw+cFCf5U8xHhek6q9wGZLjwUa5w3OI2zubp8VJ7jg552o6ADr1q1pRBmTk
X-Received: by 2002:a17:903:1acc:b0:2f0:a113:4e46 with SMTP id d9443c01a7336-2f0a1134e76mr11816085ad.48.1795418701534;
        Sun, 22 Nov 2026 23:25:01 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:fde8:799d:8c83:f2ab])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03ee84294sm47180345ad.9.2026.11.22.23.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 23:25:01 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/exynos: Set supported modifiers during plane init
Date: Mon, 23 Nov 2026 15:24:54 +0800
Message-ID: <20261123072455.2221408-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_232502_569777_BF5989ED 
X-CRM114-Status: GOOD (  25.57  )
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

The exynos driver currently checks the modifier in a helper called by
the plane atomic check helper callback. This check only concerns whether
the selected plane supports the tiled format or not. This is tied to
the plane's hardware capability.

Turns out the tiled support was added around the same time modifiers
were being plumbed through DRM planes. The latter provided a way to
describe per-plane modifier support.

Add a field to the hardware plane capability struct to allow adding
an optional list of supported modifiers. This is passed to
drm_universal_plane_init(). This also allows the core to generate
and pass to userspace a list of supported modifiers for each plane.

Also provide a .format_mod_supported callback to restrict
DRM_FORMAT_MOD_SAMSUNG_64_32_TILE to DRM_FORMAT_NV12, matching
framebuffer_check() so the mixer VP plane does not advertise the tiled
modifier for DRM_FORMAT_NV21, and validate modifiers against the plane's
modifier list.

EXYNOS_DRM_PLANE_CAP_TILE and the existing helper are removed, as the
check is now done by the DRM atomic check.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Add .format_mod_supported callback to restrict
  DRM_FORMAT_MOD_SAMSUNG_64_32_TILE to DRM_FORMAT_NV12 (Inki)
- Fix typo in commit message ("down" -> "done")
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 49 +++++++++--------------
 drivers/gpu/drm/exynos/exynos_mixer.c     |  8 +++-
 3 files changed, 28 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index b126cd129944..ab0edb826261 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -92,7 +92,6 @@ struct exynos_drm_plane {
 #define EXYNOS_DRM_PLANE_CAP_DOUBLE	(1 << 0)
 #define EXYNOS_DRM_PLANE_CAP_SCALE	(1 << 1)
 #define EXYNOS_DRM_PLANE_CAP_ZPOS	(1 << 2)
-#define EXYNOS_DRM_PLANE_CAP_TILE	(1 << 3)
 #define EXYNOS_DRM_PLANE_CAP_PIX_BLEND	(1 << 4)
 #define EXYNOS_DRM_PLANE_CAP_WIN_BLEND	(1 << 5)
 
@@ -112,6 +111,7 @@ struct exynos_drm_plane_config {
 	const uint32_t *pixel_formats;
 	unsigned int num_pixel_formats;
 	unsigned int capabilities;
+	const uint64_t *modifiers;
 };
 
 /*
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 020e8c9cf7de..92ed00e2b6f9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
@@ -161,6 +162,23 @@ static void exynos_drm_plane_destroy_state(struct drm_plane *plane,
 	kfree(old_exynos_state);
 }
 
+static bool exynos_plane_format_mod_supported(struct drm_plane *plane,
+					      u32 format, u64 modifier)
+{
+	unsigned int i;
+
+	if (modifier == DRM_FORMAT_MOD_SAMSUNG_64_32_TILE &&
+	    format != DRM_FORMAT_NV12)
+		return false;
+
+	for (i = 0; i < plane->modifier_count; i++) {
+		if (plane->modifiers[i] == modifier)
+			return true;
+	}
+
+	return false;
+}
+
 static struct drm_plane_funcs exynos_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
@@ -168,32 +186,9 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 	.atomic_create_state = exynos_drm_plane_create_state,
 	.atomic_duplicate_state = exynos_drm_plane_duplicate_state,
 	.atomic_destroy_state = exynos_drm_plane_destroy_state,
+	.format_mod_supported = exynos_plane_format_mod_supported,
 };
 
-static int
-exynos_drm_plane_check_format(const struct exynos_drm_plane_config *config,
-			      struct exynos_drm_plane_state *state)
-{
-	struct drm_framebuffer *fb = state->base.fb;
-	struct drm_device *dev = fb->dev;
-
-	switch (fb->modifier) {
-	case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
-		if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))
-			return -ENOTSUPP;
-		break;
-
-	case DRM_FORMAT_MOD_LINEAR:
-		break;
-
-	default:
-		DRM_DEV_ERROR(dev->dev, "unsupported pixel format modifier");
-		return -ENOTSUPP;
-	}
-
-	return 0;
-}
-
 static int
 exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config,
 			    struct exynos_drm_plane_state *state)
@@ -241,10 +236,6 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 	/* translate state into exynos_state */
 	exynos_plane_mode_set(exynos_state);
 
-	ret = exynos_drm_plane_check_format(exynos_plane->config, exynos_state);
-	if (ret)
-		return ret;
-
 	ret = exynos_drm_plane_check_size(exynos_plane->config, exynos_state);
 	return ret;
 }
@@ -308,7 +299,7 @@ int exynos_plane_init(struct drm_device *dev,
 				       &exynos_plane_funcs,
 				       config->pixel_formats,
 				       config->num_pixel_formats,
-				       NULL, config->type, NULL);
+				       config->modifiers, config->type, NULL);
 	if (err) {
 		DRM_DEV_ERROR(dev->dev, "failed to initialize plane\n");
 		return err;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 9b210ff7449f..5da871e5ac9c 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -93,6 +93,12 @@ static const uint32_t vp_formats[] = {
 	DRM_FORMAT_NV21,
 };
 
+static const uint64_t vp_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_SAMSUNG_64_32_TILE,
+	DRM_FORMAT_MOD_INVALID
+};
+
 struct mixer_context {
 	struct platform_device *pdev;
 	struct device		*dev;
@@ -148,8 +154,8 @@ static const struct exynos_drm_plane_config plane_configs[MIXER_WIN_NR] = {
 		.num_pixel_formats = ARRAY_SIZE(vp_formats),
 		.capabilities = EXYNOS_DRM_PLANE_CAP_SCALE |
 				EXYNOS_DRM_PLANE_CAP_ZPOS |
-				EXYNOS_DRM_PLANE_CAP_TILE |
 				EXYNOS_DRM_PLANE_CAP_WIN_BLEND,
+		.modifiers = vp_modifiers,
 	},
 };
 
-- 
2.56.1.831.g720f3f5937-goog


