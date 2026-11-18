Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38FD606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CkwcsjXg;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=H+lTydkf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+gnpBc9synDIKGRlYDbwpGZkwJIbWk7JkbUzq9+aVgs=; b=CkwcsjXgRORa7S
	UoyIT1qtvQhtIGr0huT/3w2q40Z/fHpEv3eqUcYz+pzNBib5xIw0UKu/lUzTdQYvS0Yjwdqku8Ai+
	qHxAHRph/NLFVklHAS96nwKY+Vsm4jUE2kQrUGz1vhIvHlVUf281eHBfBcSVrMtTIbsGNl+BvQXr7
	+ao6KtlJ1STcXJHzqskq9lFgrqXG7oXdtm4wMEobu+f19kInvmwKpbGIruQKprCKg32w7FzK+Iffq
	vDSYhIb9+O44itakb/A4AkNxxOxRBSrJeGFOde/iy37RoOLnHUuA19dCLOltbSrfjechEUl+UXohE
	i15NSWvgygidfl2rw3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTitO-00000009bZM-1R3k;
	Wed, 18 Nov 2026 16:52:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiss-00000009avj-1470
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:51:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B1FD61A16CA;
	Wed, 18 Nov 2026 16:51:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78A0D5FE9B;
	Wed, 18 Nov 2026 16:51:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7555411BC27C2;
	Wed, 18 Nov 2026 17:51:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+gnpBc9synDIKGRlYDbwpGZkwJIbWk7JkbUzq9+aVgs=;
	b=H+lTydkfRATyFQnDcoY+R+GWl/BZjyUg4ecff1G/brsXOX+bUihMNt5xTeFxCZSMDjk9AQ
	LPv7JujcpJ5HB+Fw5vcVM0GzxUKR0CRj8lp97+horbT+xuJA+LRZ7WnIsn2R/BDqMYJhMr
	c8cxC7a9e2SfHp/dUYPnLcjVDuY+7sH0xhyZBp59QPpRXMUQYcawemXphHqdpi8E502D+R
	FOriwXmJFijaDd1Bmeb1A6WoZoY+soKRlc+p7jc6m9Hp+JzdVKHiVV+u6mPz1YrR4Wu/Kk
	l2NkWj2IMDpgrYBaDw6FfCkifr173jcLBzrIRN0ZjEVCegLIwe5YgsOgkA/lrw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:58 +0100
Subject: [PATCH RFC v3 15/31] drm/atomic: drm_atomic_private_obj_fini:
 protect private_obj removal from list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-15-44bb3b4a828f@bootlin.com>
References: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
In-Reply-To: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_085146_523056_02AB6B32 
X-CRM114-Status: GOOD (  12.94  )
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

Currently drm_bridge_detach() expects that the bridge private_obj is not
locked by a drm_modeset_acquire_ctx, and it warns in case that happens:

  drm_bridge_detach()
  -> drm_atomic_private_obj_fini()
     -> list_del(&obj->head) // removes priv_obj from
                             // dev->mode_config.privobj_list
     -> obj->funcs->atomic_destroy_state()
     -> drm_modeset_lock_fini(&obj->lock)
        -> WARN_ON(!list_empty(&lock->head)) // warn if priv_obj->lock
	                                     // is still in ctx->locked

The expectation is not respected when introducing bridge hot-plugging. In
such case the warning triggers if the bridge is being removed concurrently
to an operation that locks the private object using a
drm_modeset_acquire_ctx, such as in this execution scenario:

  CPU0:
  drm_mode_obj_get_properties_ioctl() // userspace request
  -> DRM_MODESET_LOCK_ALL_BEGIN()
  .  -> drm_for_each_privobj() // loop on dev->mode_config.privobj_list
  .     - lock the privobj mutex
  .	- add priv_obj->lock to ctx->locked
  .	  (list of locks to be released later)
  .
  .                         CPU1:
  .                         drm_bridge_detach() // bridge hot-unplug
  .		            -> WARN triggers!
  .
  -> DRM_MODESET_LOCK_ALL_END()
     -> for each lock in ctx->locked
	- remove priv_obj->lock from ctx->locked
        - unlock the privobj mutex

Fix this by using DRM_MODESET_LOCK_ALL_BEGIN/END() around the list removal
in drm_atomic_private_obj_fini() to ensure the two threads above
(CPU0/CPU1) cannot happen concurrently.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

 * This patch was sent separately in the past [0]
 * The issue is still happening with hotplug without this patch
 * The issue has also been reported by sashiko when reviewing v2 [1]

[0] https://lore.kernel.org/dri-devel/20260324-drm-bridge-atomic-vs-remove-private_obj-v3-1-64deefe84044@bootlin.com/
[1] https://lore.kernel.org/all/20261001130542.A40D11F00898@smtp.kernel.org/
---
 drivers/gpu/drm/drm_atomic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 81591173265d..ad2099b4dffd 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1089,7 +1089,13 @@ EXPORT_SYMBOL(drm_atomic_private_obj_init);
 void
 drm_atomic_private_obj_fini(struct drm_private_obj *obj)
 {
+	struct drm_modeset_acquire_ctx ctx;
+	int ret = 0;
+
+	DRM_MODESET_LOCK_ALL_BEGIN(obj->dev, ctx, 0, ret);
 	list_del(&obj->head);
+	DRM_MODESET_LOCK_ALL_END(obj->dev, ctx, ret);
+
 	obj->funcs->atomic_destroy_state(obj, obj->state);
 	drm_modeset_lock_fini(&obj->lock);
 }

-- 
2.56.1


