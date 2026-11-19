Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEFB606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wxYLTn1I;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hoSF4ZBK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JZeXMm6AAi44BWshE63wgfUA4zyj+3ZnN7hXQLNUFPk=; b=wxYLTn1Ixpubpt
	sTiXhdCYCXweGB3KsBawHCkRyVNShbt+seA+p/pFX4d8Cs2bbXvFhN+pUV79IDBRBxhtSTgJY2zKC
	KRSF13zbNlfzOBZKU2GmCXZVQU0B0j+vzAOeKC8xIBVx2YfL6xtrZzM8DeSGUC1IAak0t+pWnL5ZG
	gaBFQ6290N+T6BJGd1t7BmlmFc7T+VvhkqggluMvT+ZelGc4ZKgzfyvrRqgyyrMWpvD7fMc+ylf/0
	mlCAk40ngnejib7JQo37QgJ2bw4nazNP2ItuNN36WH4K9DxZhFgIyxwSBRAWkmro2lwlpYLKelOVC
	CanxK5EDH6n8mGiArQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6LW-0000000CuGi-1RJa;
	Thu, 19 Nov 2026 17:54:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6LO-0000000CuDh-0FL1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:54:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so27228615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110884; x=1795715684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZeXMm6AAi44BWshE63wgfUA4zyj+3ZnN7hXQLNUFPk=;
        b=hoSF4ZBKxf9mQ2NtCJeDFQ+j2j3xUw6c4ENzObn2YNyO22l9XyPoWSklzInfQsaRF4
         vRPfVK5TAvGM9KunT/3WqS85fa+d8xEWpPfL22Rmyiv4ZGlBaIs4yRKWE4BCDTDiWcd0
         e+d/qyw3erkaL8FLHTjpeA1n+ycRnEFGGx/yf6Iq5PtkBSYinDYAJW2VB+rExdIFvUoC
         /GEY7Qxjbq4YpI2V/V2hWBdTOHxu3yndBUdAGEpWmSs5U/VbwcGlKrsxiJ+XxoUS3whH
         qJTYceE5fo/zLfBA7ELKVyQwg9SlXeQH8otvPJbx167V5UiJ+stwau12h8tNPm+8PYMe
         +tPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110884; x=1795715684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZeXMm6AAi44BWshE63wgfUA4zyj+3ZnN7hXQLNUFPk=;
        b=H7Gr9k9o10LcCH6Bmc92XqtHVQP9+0g5Zxvb25qgImhbnsf9Q3+n2zjMo1tsCkfqT2
         9ONQGF1RWrg83ND03j7DrK90e/ayu73mW1YYmGME/DIF4GDhH8qXUdwnwkYXo/LTPuSg
         UTugmJOFNe4G1j9OJuI+72mSzM5O5Bi3g6iAnNOPwH4C9DE5Vgg29w/7dJDZOCyUA9/E
         eFy8bgoVR/W/CkQ89N9O6YO2HzXJKh1yc7NoOxUjyzyRA09CX8q0dJ+Nh/8U5b5ceZg0
         HYGrpXUJClbB37SBYgeJe2AwhY0oERuQDMqWbMT8y6E0ZxpkKgYzKqZCyKnms7bH1Bds
         VJwQ==
X-Forwarded-Encrypted: i=1; AL+hErE5kx2pfJKjiB25PLYWHLo1aw80iCR4ig7Z/ZfzysVXN2eF3XEnGwMIzBUvZP7VtjvW8Fz7EQ2CiPRWFdaTxXGA@lists.infradead.org
X-Gm-Message-State: APuU4Z8l4RlFJwbrOSahyD7apDvoNBHivPAkxE0pLjNSKn2tMFsyw8K4
	8s650qCcBSbEl0mtyrzjmjSrTcnZmhxkxIi3TdonDd5nMsvLiXbDmhKE
X-Gm-Gg: AYBFou3qbt4htSM0Ah2zWaspo1KlrUkCZsvsmPYNQZ+YQfcyplTVlflZacE9l9+KkeC
	yl4jcyzBXEkXkz//ajScG0RhTlDTzTlOGW2EEhi1d5IhhlAxHezwygVP/Yrkx0KBQrBKCz7qSyc
	W3Wdj2G3QfrNUmHTVoKLNn7KVw2TNXxg4B0H9IiXebnVGiK4cOgIZ1nQ3bsOqi9HdhM/kUkNcIu
	BB2y4c7yuoCZsg8B80qpyNcYn5GCQJXI5i6HCiBPX6iLMGP55AuPmwDczX1EmeitW1CX5a8Y6m+
	Vns/aqbnQf/AJaiu/rpV0eMvumNW/insP/MIPPr3igKDyzLyoD1TGPXKMQcesrEZeLJFHwdI/Rf
	eZ/83Qqh8VKzdBwmszpGks/wTwBHLIl7PdbPEXR4GbfbO8C2qVac68hMipFoyPg5jHS7XC2CwQl
	z/xwCn1Kb6Vl68RlWtRnK5qJ3g4P4VWUXsZ2er5Pr+r+0/B90oDJ8vjCMxP0F0nNEYohwgjbhJf
	BpXZ1kCDFSWfo6o+kxG21WeC3/dCJ2qxrn6x5hSl2aM/GZm9d1rsMg3i2P0/BSq2S/w+kCFXDtS
	JG35H26ejITuUSalZc6Al1Ad7F5QFVsao4xv8tUUPQe8x0poZXtfn3L+/tyvCaCFitHopuYKtjT
	0+9jxr+tlop6bHnzf+hh/Za/558evWzTru5iEHFG8DotkpZIqrkprhM6/IuwL+kw0jLIDd3Ec5e
	WNAUXxqKBo37oMQmGYW+hBwfTCirpyPB7e2friWsW51B3dwQy2hSFOfSJAnSt9zcYW68QAQQl2f
	NRD0Oq+m9iholNY035VPl2FB9+CHyPDtWTiXq4tRiN6VT2IhG/bT7DV
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr8512525e9.3.1795110884056;
        Thu, 19 Nov 2026 09:54:44 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:42 -0800 (PST)
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
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] drm/sun4i: Reject fractional source coordinates without scaler
Date: Thu, 19 Nov 2026 18:54:33 +0100
Message-ID: <20261119175437.2520400-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_095446_122848_DE1724BA 
X-CRM114-Status: GOOD (  15.14  )
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

The layer code programs the scaler whenever the source rectangle has a
fractional offset, since only the scaler can apply a sub-pixel phase.
drm_atomic_helper_check_plane_state() with DRM_PLANE_NO_SCALING doesn't
catch that: it only compares the scaling factor, which may still be
exactly 1.0 with fractional source coordinates.

Channels without a scaler would thus have the non-existent scaler
programmed instead of an error being returned. Reject fractional source
coordinates on such channels.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 24 ++++++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 24 ++++++++++++++++++++----
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index cf66f676824e..f9c7f28f9fa2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -179,10 +179,26 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 		max_scale = SUN8I_UI_SCALER_SCALE_MAX;
 	}
 
-	return drm_atomic_helper_check_plane_state(new_plane_state,
-						   crtc_state,
-						   min_scale, max_scale,
-						   true, true);
+	ret = drm_atomic_helper_check_plane_state(new_plane_state,
+						  crtc_state,
+						  min_scale, max_scale,
+						  true, true);
+	if (ret)
+		return ret;
+
+	/*
+	 * Fractional source coordinates can only be handled by the scaler,
+	 * so reject them on channels without one.
+	 */
+	if (new_plane_state->visible &&
+	    !(layer->cfg->scaler_mask & BIT(layer->channel)) &&
+	    ((new_plane_state->src.x1 | new_plane_state->src.y1 |
+	      new_plane_state->src.x2 | new_plane_state->src.y2) & 0xffff)) {
+		DRM_DEBUG_DRIVER("Fractional source coordinates need scaler\n");
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 09d94f7f9977..4d3fc03f9877 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -259,10 +259,26 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 		max_scale = SUN8I_VI_SCALER_SCALE_MAX;
 	}
 
-	return drm_atomic_helper_check_plane_state(new_plane_state,
-						   crtc_state,
-						   min_scale, max_scale,
-						   true, true);
+	ret = drm_atomic_helper_check_plane_state(new_plane_state,
+						  crtc_state,
+						  min_scale, max_scale,
+						  true, true);
+	if (ret)
+		return ret;
+
+	/*
+	 * Fractional source coordinates can only be handled by the scaler,
+	 * so reject them on channels without one.
+	 */
+	if (new_plane_state->visible &&
+	    !(layer->cfg->scaler_mask & BIT(layer->channel)) &&
+	    ((new_plane_state->src.x1 | new_plane_state->src.y1 |
+	      new_plane_state->src.x2 | new_plane_state->src.y2) & 0xffff)) {
+		DRM_DEBUG_DRIVER("Fractional source coordinates need scaler\n");
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
-- 
2.43.0


