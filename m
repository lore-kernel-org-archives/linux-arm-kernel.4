Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6CA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4EA/cna4;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NoEOwOKk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cQV4QP0qYKuYxZ6jnr2bO2k6G5yVFMpzRyKHmSwnLAg=; b=4EA/cna4+0vpNF
	rYjfDKDF8knkLeXGoYT5jZrXFSqh3Wv/jSzl7BDRhKT7LsE1jiEQZMjCeIHyybgyBrH228hc/6eRS
	a6dqf8AmknPvUzBMk+Ga6QUWql8E2MpBoYy4E1UMnSyPGMjw6L6aVvyDXG6wDDiidULpwkoQVNgng
	F3X91T1koykl3cUbJVgWP2A1i38kp3PFvM2KJBdZCF8GEpjIapReBzscokyzbvyaXgA2gxRiJ741W
	3+ONOgjLG9HXSjZk4oLJ6hbIHyKDoigczawbJE9+JY91AGPMrBJj6EQ4qyen5CNFXfAiFXn3bNF1H
	H3L0OaYOWyW+Q0dvBXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTfv-0000000CGJo-0lf1;
	Thu, 26 Nov 2026 07:13:47 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTfq-0000000CGGY-3yA5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:13:44 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso2440078a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 23:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677222; x=1796282022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQV4QP0qYKuYxZ6jnr2bO2k6G5yVFMpzRyKHmSwnLAg=;
        b=NoEOwOKk+x/19QmTLlGQY5rJVuEYPn1m7GMzQrK7ph5odIQG+A9aX6rGHJ8BqkYdR0
         cUoO93ZGoGVULeJd7neYaBZ/ZT6/VMpQp8ONL+NPO8CFTWuBIEgDV7IqW8CEjRtihh6+
         6EjXBKGf5gT25wqRDkIkDpWUbyytINMzbpqck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677222; x=1796282022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQV4QP0qYKuYxZ6jnr2bO2k6G5yVFMpzRyKHmSwnLAg=;
        b=MlUQprP+BhwbMYYqbU4aSGYD3a5YU5jxU4PwjbMcZ7op+nSGzH5ve1q1ZthzHwREm9
         10sIdnEBrfuLFA1G5ALIkFPAHA2UayMptrXN7s/5EDGfHAUioJynpObMln7cKPJLAPIe
         AdWpneuoaSnpK95MCn1p4iR4hSaSLz848KCVQHbfsh/BWhJbinNaaOVYprN5MpSEAMAd
         1BfreyJ9LsHvRVPYQQmFVvTprtmVFFu6gBYIEvKEVDrBywFX3ot1VXuAKV96SJ6/E5lZ
         4Q8g9o1wLRFRg1kzev9/ex8acqoZdlIWIdysh/LVLCpfBgsPK/IMQecmpJacbTUFdHxw
         4hdg==
X-Forwarded-Encrypted: i=1; AL+hErHKNbaPSjpV1iwxxhkWP1GwhQiEHTf22OmoKNimUBbKarP4v9Imqp3fq//hVdX+sPTF+jgVrgn10arTkiGTjV5Y@lists.infradead.org
X-Gm-Message-State: APuU4Z8DneftcSw3rlWK12369yyop7W/Jkl4UF0qOVzjuaTDB1R5quG/
	B1Px6SyvAb2svQuS2+khzlSIBtFJdJCHziWcsPqXUMenCFN0FuhkCKGYnkHuvZWGAw==
X-Gm-Gg: AZFdTZdGwXaFrnbT9gsFSvZ6JdXJz0uP50wa9AZyCnTqMYkhVAPWHqnOPK5ZTfUGBSk
	QIhwY3EXjsqOECN3I2k6hBoyLt0lcB8nSv+hZXOrhdL97v6yjFr8Tla/grTbuaUmtteqlwOIuA7
	l/2xPabVXzWd4RaYKeN+appDsLDwVp7TQ6Pg4vjrcgFPNDDgKCNO8CMzoR0bZWzbm/UzQODFG10
	i7sjuO4yOr2gHPAh8Gnh4JJinq6j9WtySk2AhJUKFHvE4YhGulxxiv57TKgosZi5nhYqPOI8+HQ
	8Zr+DG7Y5xFba2+JuLpKGtRs0JFigB7mFVi4BHb64c5H89Z5mDbeLDkmCky3M3sQQQdFkwminRT
	PYjmjr2GULPdPg3xYUenq0c67r95GSm6paBXg7CmYpbB3VR+UsA5GyO88Yo32CTbdiKw/q3BkCy
	fw/R80J/A+BIOljBJpczEgW2lYYZKCAf8OIIYTVm+fa3KQtXsdczvovtZgEfSl47TtOAVanxKek
	P2y7yZdtfasZMVDE3vLNDmQI3S7ZgZ6IkM7hH5a6kZIFMGC6yKw7nEnaGXlLJEzNWiGJMpHpaVX
	TACPoovTVv3PkUG8nuE/6tAlpOw75cjyi4ngVygYy+nvjDiCUMEztKlT2dPTgy/5IrcZ9Rwie0Q
	nBfZonw==
X-Received: by 2002:a17:90b:4b0e:b0:3b1:8380:a9a0 with SMTP id 98e67ed59e1d1-3b41c95c18dmr20709401a91.46.1795677221915;
        Wed, 25 Nov 2026 23:13:41 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41ad0b52dsm33777492a91.5.2026.11.25.23.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:41 -0800 (PST)
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
	stable@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH RFT v4 3/5] drm/sun4i: layers: Fix VI buffer address for clipped offsets
Date: Thu, 26 Nov 2026 15:12:51 +0800
Message-ID: <20261126071314.253890-4-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126071314.253890-1-wenst@chromium.org>
References: <20261126071314.253890-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_231342_994122_5EB01ADC 
X-CRM114-Status: GOOD (  22.44  )
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
Cc: stable@vger.kernel.org # v7.1+, needs drm_fb_dma_get_gem_clipped_addr()
Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
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
2.56.1.839.g22a8290db9-goog


