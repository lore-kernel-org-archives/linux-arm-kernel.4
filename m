Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A10606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 23:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TdMSi4yV;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OYt6b6/D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2XiawxssXXv44CNWTaqQT2qKQdjrgp5aUYtmWBVrWtk=; b=TdMSi4yVROZMtd
	I7nJYmM9m7zXH3SY+p4obKlRz7Dy1THCUxD4xJCwfMOuh1hYjKeriQp0ExNRw2RKVDv3/kAmAueNT
	LGIIEYURntaPreZR2kSncr4yooNwIF4URY94L6jHwstC02fnyxBFSSQRcRaMQqkhyHfpqnkDhWEZS
	E4zUTz1Bn5Y47bL9ioHqQbYPKhNzs8RHs8LXNbK6JPR7Y3vhyYyMRSL6Lzt75Ae05lDbL/oTC86Eg
	3KB9Ts8epgRTf69DCQTqodihFnSMw/4udSvh/ZxClagpYTd685bL9DMx1TlOscgfU5Ch572zQ8g38
	KXByK0nCRycFxb2Tu6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSRn-00000007HY5-0dlc;
	Tue, 17 Nov 2026 23:18:43 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSRh-00000007HVw-1ZZw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 23:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2X
	iawxssXXv44CNWTaqQT2qKQdjrgp5aUYtmWBVrWtk=; b=OYt6b6/DZuxN9m65Wz
	xbjsou0Q3LqRlvdSX5wGjdw1+9zP57hawgwifC6iUat0xlRH+0ThedclIchtfhrt
	4zV5/HG6GTid5BjPlVPcCRFMrIHEtZxmdFlElvpOJfouw1rGLU3N52r1JgYG89Sm
	LXxmbSyqWwRrL3F1T1qKklOj4=
Received: from SYPC (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCXyQiu4Pxq15exGA--.55935S4;
	Wed, 18 Nov 2026 07:18:09 +0800 (CST)
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
Subject: [PATCH v2 2/2] drm/sun4i: backend: report coverage blending for alpha-capable planes
Date: Wed, 18 Nov 2026 07:17:51 +0800
Message-ID: <20261117231751.264258-3-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117231751.264258-1-hsyysy@163.com>
References: <20261117091932.12063-1-hsyysy@163.com>
 <20261117231751.264258-1-hsyysy@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgCXyQiu4Pxq15exGA--.55935S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4DWFyrGF1xuFWrKr1Utrb_yoW8GrykpF
	4kGayUK3W8Crs0qayxAa4UZr13Wa1rGFyIgF9xX3s3Xwn0qFnxC3s8G3Wa9FyUJrs7Cr4U
	tw15WFZF9FnrC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4_M3UUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7hE+cmr84LED1AAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_151837_751824_7EE34796 
X-CRM114-Status: GOOD (  11.02  )
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

The DE1 backend planes expose ARGB8888, ARGB4444 and ARGB1555, but the
driver does not create a blend mode property for them, so the new
validate_blend_mode_for_alpha_formats() also warns on A10, A20, A31 and
A33:

  sun4i-drm display-engine: [drm] [PLANE:31:plane-0] pixel format with
  alpha exposed but blend mode not setup. Please fix.

The backend blends a layer onto the pipe below with the layer's own alpha
channel and has no premultiply control, which is the DRM "coverage"
equation.  Advertise DRM_MODE_BLEND_COVERAGE for these planes as well.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 drivers/gpu/drm/sun4i/sun4i_layer.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index d65587d..0e6e0d1 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -228,6 +228,13 @@ static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
 	drm_plane_create_zpos_property(&layer->plane, layer->id,
 				       0, SUN4I_BACKEND_NUM_LAYERS - 1);
 
+	ret = drm_plane_create_blend_mode_property(&layer->plane,
+						   BIT(DRM_MODE_BLEND_COVERAGE));
+	if (ret) {
+		dev_err(drm->dev, "Couldn't add blend mode property\n");
+		return ERR_PTR(ret);
+	}
+
 	return layer;
 }
 
-- 
2.56.1


