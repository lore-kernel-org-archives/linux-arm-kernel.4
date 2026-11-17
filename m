Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFD0606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 23:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ol4ehgFS;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Nu++3NeI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OFZbREjsf49enuS/73KTBKoLcystcrUdilFE3iKgq+A=; b=Ol4ehgFSTSzNW8
	nKvGGdZzTbP9XTGJ/p3IVWywAdd+/pku9YzCOzV342pXuGC5M0Py26w6bNz9A7qex0LDK5DexTZIf
	I2ECFhAvu5Lxz7MCj2A0LccnQX6m4vUCg2eYVRW/7LtJLpckoJZqmd3ihZUD4t1z1nBEbvzPpO0sC
	vyZeZRLbI3eQQUdAIW2NJlWBP1Z3R5R4THGlbmWDHUDlTi5AyvOGNztcLj7tQVMGruIvd7v6GrEzi
	2clUlvuhv8g7goF3wUx8qyym6MBCNwEemp0dQnFe8z6iNj+6elKukT+M81ZxlwET3vAeR0jIG3gvJ
	8X7qYCnFopMTO9fm7bHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSRn-00000007HYt-2niE;
	Tue, 17 Nov 2026 23:18:43 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSRj-00000007HWc-0n4M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 23:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=OF
	ZbREjsf49enuS/73KTBKoLcystcrUdilFE3iKgq+A=; b=Nu++3NeI1PVbPdurBW
	WEtwwZw69UEXY4csT3e9BSE0/sh+pFE+WT8iAyYiNZ74LIudSI7rIYAeFi+Nqdn+
	FjqiXl/FrjwyJiNn8Sm/05ySW9xelpjxUBgJLyz73BvVaupopga+NGlMoFiUz0fo
	ntbc7ehklf3h+k3h8Q68fRdIk=
Received: from SYPC (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCXyQiu4Pxq15exGA--.55935S3;
	Wed, 18 Nov 2026 07:18:08 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/sun4i: mixer: report coverage blending for alpha-capable planes
Date: Wed, 18 Nov 2026 07:17:50 +0800
Message-ID: <20261117231751.264258-2-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117231751.264258-1-hsyysy@163.com>
References: <20261117091932.12063-1-hsyysy@163.com>
 <20261117231751.264258-1-hsyysy@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgCXyQiu4Pxq15exGA--.55935S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryktrWkCFy8CrW3JFWkWFg_yoW5Jw45pF
	4rGFy5K34UGrWYva43Ary8ZF13Wa10gFy8Kry7J3sxXr1qqF9Ik3s8K3ya9ryUArWxCr42
	gw4UGF4q9FsFkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcsqJUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7hA+cmr84LADwwAA30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_151839_581316_C3938D2E 
X-CRM114-Status: GOOD (  11.08  )
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Linux 7.3 added validate_blend_mode_for_alpha_formats(), which warns once
per plane that exposes a pixel format with an alpha channel but has no
blend mode property:

  sun4i-drm display-engine: [drm] [PLANE:35:plane-0] pixel format with
  alpha exposed but blend mode not setup. Please fix.

The mixer blends a layer using its own alpha channel: ALPHA_MODE is set
to PIXEL when plane alpha is opaque and to COMBINED otherwise, while
BLEND_PREMULTIPLY keeps its reset value.  That is straight alpha, i.e. the
DRM "coverage" blending equation.

Advertise exactly DRM_MODE_BLEND_COVERAGE on every mixer layer that can
expose an alpha format (UI always, VI on DE3 and later).  This matches the
existing register programming, keeps userspace behaviour unchanged and
satisfies the validation.  Premultiplied blending would require driving
BLEND_PREMULTIPLY and is left as a follow-up.

The DE1 backend planes are handled by the next patch.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 +++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 00756ab..57bc603 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -283,6 +283,13 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
+	ret = drm_plane_create_blend_mode_property(&layer->plane,
+						   BIT(DRM_MODE_BLEND_COVERAGE));
+	if (ret) {
+		dev_err(drm->dev, "Couldn't add blend mode property\n");
+		return ERR_PTR(ret);
+	}
+
 	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 09f668c..ab95c55 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -436,6 +436,15 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		}
 	}
 
+	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
+		ret = drm_plane_create_blend_mode_property(&layer->plane,
+							   BIT(DRM_MODE_BLEND_COVERAGE));
+		if (ret) {
+			dev_err(drm->dev, "Couldn't add blend mode property\n");
+			return ERR_PTR(ret);
+		}
+	}
+
 	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
-- 
2.56.1


