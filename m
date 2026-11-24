Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36458606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I5NciyHe;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jZLHJpBs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h3c2lWC29hGMhiXznbuXjidfPs4Wpjz3u2lyu3ifusU=; b=I5NciyHerkN5OK
	ZYM+uJ1J+LhBXtYCvsZNEQhVISofFyK2pdOnXYngMvsvasp8dKfdvGwBZ21RnRrGnS8ak7+zJ8lGD
	0Kz3cBCZZYv5gIkC/n58DC+vnUn3zkFhSvMNIVzd471o0q5v2di48+WHZZ9AT8oI6WVwLpsE7c8bS
	zLB5+i1aZ9folQqksMKr+Hz5bGbt5dW1KlSEEa/awzk0c6df0YVpPZClxQ7ajt1CPiaN/pszFlR91
	SlbAO/nqrC+BDS88huv9yHvxzDCAlxqB+e9+CQvs8LF0GoHiTZZWoF+hS0fvB5EKESzgq7KR+vpfU
	hKw7Ai/8TncylSoGb4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl9h-00000005nK6-0nnZ;
	Tue, 24 Nov 2026 07:41:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl9X-00000005nFx-1d7O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:41:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2f045b921caso23169115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 23:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506082; x=1796110882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3c2lWC29hGMhiXznbuXjidfPs4Wpjz3u2lyu3ifusU=;
        b=jZLHJpBsmX0Iga+ZLkplD9o5/bwM9uAsGvm+GirVYsFZ+3TaFRxFh4kM1th62x0BuD
         dOx5/rKGDGEbxLgtYc8X4hLrDtL0JlqkWy6QWWojFmIAeujeMaWXmoQR50Lr4GskkSgG
         s1/BFuO6/B+PIadkknP07RHgJwYnZ1U81IN8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506082; x=1796110882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3c2lWC29hGMhiXznbuXjidfPs4Wpjz3u2lyu3ifusU=;
        b=K9kKNlcbeBFBbcbktHpN7rHKF/VdSrlkox9aBuWe+CnzwqbjXxd6AauQYPvomLrxbT
         pctk0HxGr1C4hJrekaqbz8uDkSgUtltRNcvGAlAmFLRiPGBr0xuvbWYsLpAuLBpUp7L4
         yAeb4oo/XWFwbvAdyZldY6ZUG/ySCHD1H+6gDOEh8aDGa66Juk7UAYA/6qXgJVIlVf46
         ZBisECw5gBovjS0YyZq8/6krct7BexXMYQUzD4iMdfGhTEN3h5iNay8K0USYFEpYa6BZ
         YgJfMZGvbIGE8S5zLyK8o2LJhI7v1rBZxxTgbv9/21YpiOP8xxAsrV5On+DjvuEy5QDc
         o7PA==
X-Forwarded-Encrypted: i=1; AL+hErFcFCUWg05v9TQOIfgwboMFT0v83q9mWYCnuuF2095H14EOUKAE1scSLF7sE0iPxi3edohbw7xMrIhtb6BcssJH@lists.infradead.org
X-Gm-Message-State: APuU4Z/96ZrHWpdvNRmL5PPVcF6QW85WsQbUdLzi+SAOHMAwtJEmoWGB
	bMyMFfOvEH2xaTxLH0tP8t6Rg4hd5nJbAGbRRhTBNQnsTeof5ksyTJmpZpG/NBK7Qg==
X-Gm-Gg: AZFdTZcse+t1Z8bR02euBgcmHUNw0HuyUyLUtVC2cungmM92O0hzXHHEqAujXXR9Qqe
	D1L/FjDQJpEMIqq7HVkH79wV1BJV1X5Tip4rKF5g4z6dwn6XznPC2vtx7KrXPT68o/9b4AfZ4Pk
	fY9eLDticIvwVljGU6ww848Y4NJp/IpCUgHzlCrqOdB5Osq4rQcWSg9qBOytu3uiKFRhtm2eie9
	qRy1hZuTY1gJ1q/BCSZrwcPKjIAl4D/DD5BF5LQUG5ICu9rutJa9jSj8/+fqlUv+h12+dbrgDXP
	tfFA0HeEeH8a7QW22e+G4iCUTK6ZXvBV9/VYCT5iJiNSo5Zhh07Ev4ucgai7gwPkQu5LSiJfhls
	zCKK4corIXrpXK4iTwSPmfHH2stERjMF43XzK4qgGqLKQNFrHAEQTRnKuW5FxHbQHMYqZt4lTOx
	P8ok7vKS+an4O9dciKWLaogmvil4K0/eSjD+kdbdJJYgF0U78RKZ+uwb9apCyO+2gbAdXWxdTiK
	3EyKZb9mJPPD72FzjL4dXRzWptThuOKSDxgjN3/C2TGsvRM/f2KCUME453sHwNQMdvo5OCnKNsR
	7yazMyFuCJcqaKM/yAtzmBQopvsu3x+6sm/piAylZ+yB1rZYzXxr2tZkZjtW
X-Received: by 2002:a17:903:19e7:b0:2ed:b7e4:f5b with SMTP id d9443c01a7336-2f03f18a7d9mr127037815ad.40.1795506082519;
        Mon, 23 Nov 2026 23:41:22 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f120830sm64742695ad.61.2026.11.23.23.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:22 -0800 (PST)
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
Subject: [PATCH RFT v3 5/5] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue, 24 Nov 2026 15:39:33 +0800
Message-ID: <20261124074041.115251-6-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261124074041.115251-1-wenst@chromium.org>
References: <20261124074041.115251-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_234123_433163_BBABD285 
X-CRM114-Status: GOOD (  17.39  )
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
2.56.1.809.ga0b61035b5-goog


