Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DB2606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YZw0s55s;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gVHX8nsK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZnUOXR4q7AEOdZeeEt7YaH+i+q8V7R+T5wpH12+fNyk=; b=YZw0s55sB4jY8q
	igcZZX/UeKfmynEelqK26M0mod0xMRORFSe6T2b2I7dS15+xoqHadcDPQhvHO2XmKvS74w9gvbvts
	FKvnUvV034A4Ru1QyDkWiit20twvBa4JNoNoOVFEn3+FAem2E+02xKdM3cij6r4+rYhLCm3gzqlVk
	6QhiUX7hiJRQmece1BctLqOmFISy7wwwaHl8DXA5LECjH5b4cx6Ome3BsjrBDTORQZSvPqiig/65u
	TY15KXOZBa50aJf5epIjnn1J6RMgZ3qsYiAUn33+eeVEHK94WzrmZMtF4ECzak97x0Gk1Nq0ZhB0o
	0R56O3s0x8cisc4kNjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl9g-00000005nJb-3Sym;
	Tue, 24 Nov 2026 07:41:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl9K-00000005nAz-49Is
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:41:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2f05b465cd1so19754165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 23:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506070; x=1796110870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZnUOXR4q7AEOdZeeEt7YaH+i+q8V7R+T5wpH12+fNyk=;
        b=gVHX8nsKA69L+Z1uPXP/7azwha2yBV8XSsy6zSky4zyA0ZPhOVZSJHu+gr13wWIwSl
         lK+ZAu1MdAg0b4e69Z82UDwiKMiKyJoo90epYoN0upCrijC8Ml39X5VaohzMjrtbycZS
         2U/iujc1M4D7yVGkf2XtFyewINA/Y23fvcqaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506070; x=1796110870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZnUOXR4q7AEOdZeeEt7YaH+i+q8V7R+T5wpH12+fNyk=;
        b=qLT7C8X8bsa9eirWQvUkrxtnPBBvnESdWT+G2LKrtz9o6e/agrOFdMd0RXjPh7xEw9
         MEmnXvnS3UHvRi2C+NiBUALhilPm0YOUm535eNiLV60/GZLqSOX7EORY28kJ3oNLRg7O
         bm2YMJfV+ZOWk0HdA49zLYYvPLU/aYjfplLDpp0LDCz18X2D0m/730eVpoJb3VmKUeXY
         ZvlCTHzYA/EDDeJdPPbbsvPaGqrGrR9iCX0SX8HBlUJ4G9/It+pBL1dbJIzUK3Ruykxo
         rU1S0Msij+EO1C246+T/vHtCWuU7puRlcpYxHNcqYjh/d3fKMOtuA+MlCqbYcYBAnZYD
         fiLA==
X-Forwarded-Encrypted: i=1; AL+hErFxge57UGmNemkloBhrNjzu02V+GR9Ty3u2RA0Ztuo8DAKrzh+39asiCpFLV9mgQIc/0Z6u9F4qYjZ+9NpupH5X@lists.infradead.org
X-Gm-Message-State: APuU4Z+XHxTuZxEjiOfRwSq/O9m229ElJfC1t0wtAKD/2Fh+VEsNayNi
	l/8LP0ipQ7XsV3feW/R1bbjPoE+7l46tOfheR3pX7BZMXLbt/lNyQ1kLmI6CN8uUvg==
X-Gm-Gg: AZFdTZfNYxJ8B8JrGO5y8s4A+R9MZd//5pSqpa42onm2dK98/tdY8FY2UAjgyp6aYK5
	LKY0SggfO8PzLVkmhaLzeeartgPhOHaUK0843xgcirNP0zbKiRHw0FA0KOJ/t/95DV5WI5Gc4oe
	jSMSqMzvUw+yqXm75Hy4qLXb5ZKcNBMYuKfhvgKyYo4sgXD9hxqo50AF8Fqywr5yJOFEQCsgfCN
	VP8yEplZ7y4HQyPaGcwR9INiBoWofScczID2idJe+pz2YJ+lE9SAKPzRk1fTxsZQveh00qsh1Ku
	LGdTqw6Zx3iD8TeTdl7IoFAId4yDK9CrB8CorSrK8/ZUA8EIYI1+c2wN7JbBjPksZrzd87V8BEY
	1Lm7+BJ1MLiCDQcUCq49dGcEN4FOv/j5EhQ5wjq1cvRySOKAsPHiRj5fiHtYGYTVCyrjr82GQDh
	Hcl5MZ9T8CeP0vLOabT0w+MXrkarxVMqRO2q8Pbg+A09ardrf75Uo5vCRPrsuvk+ctc14Kezy/R
	LRJ+9JYXVRR9qYuXBiUclGr+8f2C0P4GXY0Gy8Ue/8XlHvXscsrpu5qveclOPkZZUH9Ooz5sHxF
	8tHc88faN0IoxQ+9rSTjIM4khsmk+/MuxbiTCC2apBKNthyyKzqGIlIjLMlb
X-Received: by 2002:a17:903:298c:b0:2e9:5714:6075 with SMTP id d9443c01a7336-2f03f117c82mr126158455ad.17.1795506070067;
        Mon, 23 Nov 2026 23:41:10 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f04f6049dfsm55300615ad.19.2026.11.23.23.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:09 -0800 (PST)
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
Subject: [PATCH RFT v3 3/5] drm/sun4i: layers: Fix VI buffer address for clipped offsets
Date: Tue, 24 Nov 2026 15:39:31 +0800
Message-ID: <20261124074041.115251-4-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261124074041.115251-1-wenst@chromium.org>
References: <20261124074041.115251-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_234111_033803_46A74E29 
X-CRM114-Status: GOOD (  22.50  )
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

Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
get display memory") dropped the code to calculate the framebuffer's DMA
address in favor of drm_fb_dma_get_gem_addr().

This turned out to be wrong in a couple ways. The hardware is programmed
with clipped dimensions, so it needs the buffer address to start at the
clipped boundary. Moving to the helper negated the clipping. Also, when
clipping on the left, the buffer address needs to start at the first
pixel in the sub-sampling group even for the luma plane. The hardware
handles the interpolation internally.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary. Calculate the intra-group
offset and adjust the luma plane buffer address so that it points to the
start of the sub-sampling group.

Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory")
Cc: <stable@vger.kernel.org> # v7.1+, needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is an alternative to Jernej's original revert:
https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com/
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f9c7f28f9fa2..67cce1b0e70f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -130,7 +130,7 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
 	ch_base = sun8i_channel_base(layer);
 
 	/* Get the start of the displayed memory */
-	dma_addr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4d3fc03f9877..b6796416d550 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -205,7 +205,21 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 
 	for (i = 0; i < format->num_planes; i++) {
 		/* Get the start of the displayed memory */
-		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
+		dma_addr = drm_fb_dma_get_gem_clipped_addr(fb, state, i);
+
+		/*
+		 * The mixer can handle odd offsets into sub-sampled YUV
+		 * planes, but needs the address of the first pixel in each
+		 * sub-sampled block. Adjust the luma buffer address backwards.
+		 */
+		if (i == 0) {
+			u32 x_diff, y_diff;
+
+			x_diff = (state->src.x1 >> 16) & (format->hsub - 1);
+			y_diff = (state->src.y1 >> 16) & (format->vsub - 1);
+			dma_addr -= y_diff * fb->pitches[i];
+			dma_addr -= x_diff * format->cpp[i];
+		}
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
-- 
2.56.1.809.ga0b61035b5-goog


