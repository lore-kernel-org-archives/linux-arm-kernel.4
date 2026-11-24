Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E63C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ax2UXx7/;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SPcfckdn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=74TXVSiLNJEh4EdaGe7nzkm4UiqpR2QLi5goWWiHysE=; b=ax2UXx7/XzuzdG
	4VENmQ6IZtiWt9LM+qcZLBH3Cw2VOgDCxAfa7YUyfMJdj1T4W9vvij4pOiROxJaV1HWGTu6oXE4ch
	0z63YGamjCy2j3g7Gncgirqe1Y7XnZ8J2VTl9R1Nd9murtG7uef+TmO2pfngvB5qIhxJQJnbpNvc0
	NO9vPMVvKtJw+HCKPvK9cBpJPsUeXDQiQ7HKcRtaYa4AeCXKcUhHBx6DUKraxiB2sQ0LBhovFROy0
	sJHHvPVpcSHjT8DFm2tbLubZKk435mt0GPgHd3pd9MTMJvpjAqpoIhnwPd7q6X9uPmoCO2aF4iZfJ
	i6s3LWCMoE8VBzROtkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl9h-00000005nJu-0JXk;
	Tue, 24 Nov 2026 07:41:33 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl9R-00000005nE5-3xbu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:41:19 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so3548513a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 23:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506077; x=1796110877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74TXVSiLNJEh4EdaGe7nzkm4UiqpR2QLi5goWWiHysE=;
        b=SPcfckdnpRNTOEBQGv0FwPv5T029e86P4wor5Vjbe1o4eq1GEYaPZJUsZePtQnCdrL
         Lk6oBsmv0JCTJaySWaQncgBU71ummp9yFgCgMWYyr6660GP7nJWeMF3VIGZbryK8B1kZ
         DbTvP+7iwMNJ4w6nuN2UQy0GCufvoRVZP/SsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506077; x=1796110877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74TXVSiLNJEh4EdaGe7nzkm4UiqpR2QLi5goWWiHysE=;
        b=chYXD8deUtKou8mYYVeepnY0BK6VURrZxQc5bVPPw639ltO/2+CkKgHOM4AFIPES2k
         jFw2ew3MqX4IdvuhJfCj1R2P1/xKDS+hkYF/AhqtBX2t5ROCmJAylrRPQsIM5aZ2d+K6
         cVK8/KKvXclfuPt1HCC/Is/g9zEsSm5BXUXq3aXr7kdyztWZQlhKy860bpYkmwUvVqBg
         vWrg9hPpUuaWTtlz3VlWXn/8/eoeDqamhimzc3qCn4hY8VstII2zMgLdbEHuflHtXubU
         jB7/7uTVbDeigUxbmDo3AA7t1qCJTQgGcz7fRMKaBDsKIjm2ofAso6TfCZsbGjOKSd+W
         H3iA==
X-Forwarded-Encrypted: i=1; AL+hErFypkTU1kddGcseb5yxwQSMQAAJ12/MvLyxjSGsn2yzjAMEE9FwnxfzrY+zyXQXnL3+F6GgrnBjLZ6c41aLi3oM@lists.infradead.org
X-Gm-Message-State: APuU4Z+A4Yo5M4/QHAPQtxOIenipwzMR/7D48op5Yvodsk2obChmksmE
	5JusqpUtuZExAqCbvGWXoo48qoqf08aK0RBug9uLHgm332E8sKMyfysZTJusWR9UhQ==
X-Gm-Gg: AZFdTZfXXd8urMxNHsVKMuUKNE30876XPU0F1OEgoN7sCO0h7pOnfoJqc+3gKUOLHza
	BzZrJ2jLXCvteyd2xQWTejx97bpBm0RxyO5dtGlSlgNrLI9LaYwX8u/ybz9MNRxAaL9H2gl/SnP
	ge5A+tMHdjJS2uPjnqdMbfv+6Si3lshNrhFDnpGnMAF5PZ3hgypLbA9ATqPB+vj3HVn/4ChOT40
	X+HIzXJkebP12kYtB3RGCHZwadQaKuoMnEMv2FNZIOPizrR6HWX8LW4U+NhwemBGJav4z2JOWmR
	pMmJlm2OJzWdKfoJw1Gll+6J/+naZZ7lAwpViLoDn0pWNTAMaXZrBbIyuc4iP+ENcM5gH9iYsbZ
	0p8LisjMpYv6vX+gljfbfTqJ1jg4z0qsGY8geKKhyeWr+KTqXdFSufCAy94ZWPWIa/NknDZal7j
	H6JLoipDQgahPZYvCiEwxcDu/qN7iWK3wz9RiZXHHK3+wo7a/eDqdSUE6TswY6m3BrcEH9J6F0C
	BcsOHTQAlh7Sgj/GNe/pk7ZJ9Vx6mvHrROksLB3dXtKRAXgy8pl+yNvXa0sjXYInTZEPhI6z2+/
	q270iQcp7RyRMP2ho1SebcWppW1P3FPmykImk6Y9ufeeda1ZpVaQg9N251kI
X-Received: by 2002:a17:90b:3d90:b0:3b3:ff70:4d0d with SMTP id 98e67ed59e1d1-3b41c8d49b7mr11902997a91.14.1795506076825;
        Mon, 23 Nov 2026 23:41:16 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b44b7a8c64sm9100767a91.3.2026.11.23.23.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:16 -0800 (PST)
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
Subject: [PATCH RFT v3 4/5] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue, 24 Nov 2026 15:39:32 +0800
Message-ID: <20261124074041.115251-5-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261124074041.115251-1-wenst@chromium.org>
References: <20261124074041.115251-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_234118_546824_F6C5A531 
X-CRM114-Status: GOOD (  15.53  )
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

The hardware is programmed with clipped source and destination dimensions,
but the framebuffer address is calculated using drm_fb_dma_get_gem_addr(),
which uses the full source dimensions. This will not match the source
offset if the top and/or left sides are clipped.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary.

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Cc: <stable@vger.kernel.org> # Needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index 62dd0576fadc..35eb5039f5ac 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -65,7 +65,7 @@ static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 static int dc_plane_check_fb(struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
-	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* base address alignment */
 	if (baseaddr & 0x3) {
@@ -146,7 +146,7 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_commit *state)
 	src_w = drm_rect_width(&new_state->src) >> 16;
 	src_h = drm_rect_height(&new_state->src) >> 16;
 
-	baseaddr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
+	baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, new_state, 0);
 
 	fu_ops = dc_fu_get_ops(dplane->fu);
 
-- 
2.56.1.809.ga0b61035b5-goog


