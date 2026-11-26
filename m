Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10262606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tjQClImI;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZuUqZkV6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qPWijXdqnnf31Uvd9pQegZ3VFu+gZGvbQbzLAzg1T+4=; b=tjQClImIzS1NBX
	Nsqax69dEwgx3GeZ4h8YUA3bmKx5yBfSSmxacZynBEDvWZtLlGk+3aJJNYJfW56mMR6UAQfVnpQCP
	41aJMd9NvE0Q40GVyqCWvdo/XeO9EZEaRsVDfJocln67I18TqAX5oXv/Q8UMsrDJGnuz4/BdjPadz
	ws08BQoQVlxPYVr1onP7ziuRrEGXpN8oXoeC/U0sE1RG89a7CcoDGYfdMDYneOwivbU2QIP5TySRa
	5pSaA8eS5e9jJ0QbKX56aUSNZeOojGVUxfEPF0el13hVUaK6X3P4XJcCHrTXzOeP5BKKjfnFzJLRZ
	rGzSpbY+jvctRISeQo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTft-0000000CGJB-3pdv;
	Thu, 26 Nov 2026 07:13:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTfl-0000000CGDt-1nR7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:13:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2f0458cc9easo54090235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 23:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677216; x=1796282016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPWijXdqnnf31Uvd9pQegZ3VFu+gZGvbQbzLAzg1T+4=;
        b=ZuUqZkV6xy34V+DZkriSaG/B+9P7Q39juPVFVsvKG7luda4Uz72JZeUF149a0gqr9D
         FANXA3Bmzd3puw7SQaE40i0V6H9iyj71KQidBWzF5TCXGwIrUBaHwHV0NRarf4W3hI84
         UbIAMkS4dAN6SCZzWhYnW/U0Cy35c98T+aRtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677216; x=1796282016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPWijXdqnnf31Uvd9pQegZ3VFu+gZGvbQbzLAzg1T+4=;
        b=GXwpDMvLl32lWUwqzWxStCVOzhfR+/B1HQ150+UdG5FHWm2vj8xlfID0ektNZp1Yft
         glqfZ2DW01TQGXYoyzayi25q89Xd2+6BlIA52DWXdO8CtkMbMXyy7yMfmqg5/6tQQnz5
         dGR0DEu5RmjS7NFnD+DmgRjquUJisXluzHHZuY2jeuC2jfNM3dtehR3PMGFi3SGnuJHm
         F81LrBHKDeZl2ytCeecKN0n7WSKPdl+nxBujz6v5rP+DpwnYj99ubK2Ybi74dpgXgWxH
         /Fxax7tl/Kc2YEoIMFzBVoXkX0yTOM1bajxjsZfNsBMg/6FnCLDpgUlR4HGRt5fU0TaT
         Y8fQ==
X-Forwarded-Encrypted: i=1; AL+hErG19YemKF74hGCSVloaI+2xdLPepQNAWXsLHcfmvqqgJI+ilfjnkETBcT37aRI0afcEVqDJYhGASRYcRa2P4qZd@lists.infradead.org
X-Gm-Message-State: APuU4Z81yn21ZOJTIyaegESTH+XYRMDQzy24LAp9l+yluF1pp+zgODe0
	JXGvaZvv1+Zwf+ZA0CKjzoljTDTUakEH6zTHZNGZco60GIYwktjutE2NkBLimN4psQ==
X-Gm-Gg: AZFdTZcKDKlOLratODMEu7EndGjNUZB6Iv4tloUYBvJPB/6C30ZS+C/AXUnDGKDRQ0H
	2QwzVorAjbLMue0pJpWcY6r6uiY9CRFB6z7+tIb8QJPoH+G1y98xogs4dsIWK4trdfQIVcZ21iW
	Yvh+bHtMp4vzh+kzzuwcgNY3X2GlWWHow7KuA717+RTMJaumaP5nkeU4Yw/3f+JaSDxUXKy3gHp
	oCe20K0R+m3MivKlNI0xWyW6FOjmuiNqTEfBWG8eYVriv5DhB80t4ZmyqhvfXCoVHB8Y1DXNn5X
	/pR9buMESEwkZh3YDU0gyiL/K/MLFTc9HsjAC+6qnJnWywmaK2bNLNEMBw/dUM9wvYUJ2q/i5hw
	Sx6pBkidmMtOwgQ9PfoqfKIAkAfvwfnriGCoMOdR2A6XOx6EyDC15BKambyNF4jgQDj9iBpxCeb
	Vs26n4KDIYozep/mYli3clyv1uHo9hReG7aJonG+bdzH42Fbxg7WZVvFTtKA88H/1SSALXghor0
	21CDEm4cf5bpLZejMFx1UHpf8xUDNX9QSPQzUSHfa1RAGu/k59yS0Ob2wpnDg9IwE8jPlmkFDIT
	C7m9OcCo3JsJWM/XuycweUkqV8HnTHbfoEwdettZpIQw4NzcG644zdk6aB5R
X-Received: by 2002:a17:902:e847:b0:2ed:c9bf:9570 with SMTP id d9443c01a7336-2f03f1a4599mr214081945ad.26.1795677216392;
        Wed, 25 Nov 2026 23:13:36 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f120769sm99461835ad.57.2026.11.25.23.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:36 -0800 (PST)
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
Subject: [PATCH RFT v4 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Thu, 26 Nov 2026 15:12:50 +0800
Message-ID: <20261126071314.253890-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126071314.253890-1-wenst@chromium.org>
References: <20261126071314.253890-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_231337_475878_8C01EF71 
X-CRM114-Status: GOOD (  18.87  )
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

drm_fb_dma_get_gem_addr() returns the DMA address to the "unclipped"
framebuffer. However some display drivers want the "clipped" framebuffer
instead, as they are also using the clipped coordinates to program the
hardware.

Some of these drivers are open-coding drm_fb_dma_get_gem_addr() with
the source coordinates replaced, while others have been incorrectly
converted to using drm_fb_dma_get_gem_addr(), which would end up
causing incorrect parts of the framebuffer to be displayed if it were
somehow clipped.

Add drm_fb_dma_get_gem_clipped_addr(), a "clipped" version of
drm_fb_dma_get_gem_addr() for these drivers to use.

Cc: stable@vger.kernel.org # dependency for next patch
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Expanded kerneldoc to explain clipping
- Added comment to highlight different source coordinates used

Changes since v1:
- Use new drm_framebuffer_get_block_offset() helper
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 50 ++++++++++++++++++++++++++---
 include/drm/drm_fb_dma_helper.h     |  4 +++
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index ab0f37d8a5ff..789e6ac42c17 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -60,15 +60,16 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
 
 /**
- * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, for pixel
- * formats where values are grouped in blocks this will get you the beginning of
- * the block
+ * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped framebuffer,
+ * for pixel formats where values are grouped in blocks this will get you the
+ * beginning of the block
  * @fb: The framebuffer
  * @state: Which state of drm plane
  * @plane: Which plane
- * Return the DMA GEM address for given framebuffer.
  *
  * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, unclipped.
  */
 dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
@@ -86,6 +87,47 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
+/**
+ * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for the start
+ * of the visible (CRTC-clipped) part of the framebuffer
+ * @fb: The framebuffer
+ * @state: Which state of drm plane
+ * @plane: Which plane
+ *
+ * A plane may be positioned partially off-screen, in which case it gets
+ * clipped to the visible CRTC area by drm_atomic_helper_check_plane_state()
+ * (populating the clipped coordinates in &drm_plane_state.src and
+ * &drm_plane_state.dst). For example, if a plane extends past the left or
+ * top edge of the screen, only its right and/or bottom portion is visible.
+ * Drivers whose hardware cannot clip by itself (i.e. accept negative
+ * destination coordinates) should use this helper instead of
+ * drm_fb_dma_get_gem_addr() so scanout starts from the visible portion of
+ * the framebuffer.
+ *
+ * For pixel formats where values are grouped in blocks, this returns the
+ * beginning of the block.
+ *
+ * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for the visible part of the framebuffer.
+ */
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane)
+{
+	struct drm_gem_dma_object *obj;
+
+	obj = drm_fb_dma_get_gem_obj(fb, plane);
+	if (!obj)
+		return 0;
+
+	/* Use clipped source coordinates state->src.[xy]1 instead of state->src_[xy] */
+	return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane,
+								state->src.x1 >> 16,
+								state->src.y1 >> 16);
+}
+EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_clipped_addr);
+
 /**
  * drm_fb_dma_sync_non_coherent - Sync GEM object to non-coherent backing
  *	memory
diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
index c950732c6d36..b2a0bd7ef9d0 100644
--- a/include/drm/drm_fb_dma_helper.h
+++ b/include/drm/drm_fb_dma_helper.h
@@ -17,6 +17,10 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
 				   unsigned int plane);
 
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane);
+
 void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 				  struct drm_plane_state *old_state,
 				  struct drm_plane_state *state);
-- 
2.56.1.839.g22a8290db9-goog


