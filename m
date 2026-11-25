Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931B6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bYT3HGiz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Fhwnu/1T;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=shAo7SdN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K/q1yAvr6XkI84cojadbVWLoEVrZ2+B7AbCD60d4iaI=; b=bYT3HGizcAQHY9
	iWmZs6yZtBxkzZPji3eSYuetjX76ea5DKLDoJg3X4E303JKnlNLlgZN/nOEoNlWxA9uvd/JFU3Xvg
	UXiT3JKP2m3BD9QSAgpfqImpUuUD4UB+IlxkrwO5Q9WvxwU9jdWt3aDQPD/m+zITHjV6g3OYbijID
	RKnkAOUMeIDTlc1c1AgiFnZKuErQI7o8K7pdAWhqBL/vVuaHc0brxV5VmwEDKan/uJ9BiF5Gn5TbE
	HbnAv96SYPjqMUCzR+uWq1/4StGZJC0pd540tPUfRJvV2x2u7wUyl71bxU0TdxrDXDYIfqjebwxLp
	NAKsOv4xjssJxBgAwmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHCK-0000000Aqh1-43dU;
	Wed, 25 Nov 2026 17:54:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAd-0000000Ao7b-1rdz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=K/q1yAvr6XkI84cojadbVWLoEVrZ2+B7AbCD60d4iaI=; b=Fhwnu/1TY0UOU2xs1fZPRN/Cgm
	bUIbsM/r0LDJ0dGdlzVIV8OwZDowhvV/MJGUadQx3iokeDwOm13AhxNGJnH1CTbKAmA/UmahS5W7a
	ENHRbauO4yy+8IGfisSuTn8R0xNkd8fKDoE0kstBQp2nrCEJVY9Jg4oCmzo71y/+RSFTw7N6WHuOP
	uZMW0Pqrs8wzDeNDg2GLEE6WP5MbtVoI/XB5v6tKH7wedREOnLWbgfXu/FAwHJ5Rp14oRgfJi+Vhq
	Gwm0/ill1gOa7GuPrlNqWAKYRXQgq+7Ou0p+Bf4dbdI5kZwLNPRaxqyZlSwXXvJcMU5JlqjQ3KuS9
	+6uM4kxg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAZ-00000005bIS-3fFm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:52:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 92BE7C2B9C1;
	Wed, 25 Nov 2026 17:52:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C9E060480;
	Wed, 25 Nov 2026 17:52:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC1C811E6B0D2;
	Wed, 25 Nov 2026 18:52:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K/q1yAvr6XkI84cojadbVWLoEVrZ2+B7AbCD60d4iaI=;
	b=shAo7SdNlXc1r7UxuO7i9mk83cTF+LUto5PoOa2Brwk0Lh/A4DY7a7ccttQQT5RQkbb0iJ
	2pmbSAL7oZzDwTgL6bjk7ia4uvxzzSVYWPzUVMKDgWQzbN3YZ19ffD2MQV913semqpp5Hy
	dbPxW8nZmD7O3c/mZo2Bdo0rT2PJl9M4w02p4cffcXujcf9elqOZeqScq2xo+U7FS3R9pR
	xMUYgP6VM1Uboea7pPAR1cMarXhawpG3/++O+fqJ7tpP9jyOFVrboJC21kQ8JPU9cxr0Pc
	gnM6lZLsuurXaFuXdc1fqUYVKPCxZUrKN2TVBk4SFjYszvp6NVnhn0+aeQI0Nw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:28 +0100
Subject: [PATCH v4 15/32] drm/atomic: drm_atomic_private_obj_fini: protect
 private_obj removal from list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-15-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
In-Reply-To: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_175236_300013_38C81304 
X-CRM114-Status: GOOD (  15.11  )
X-Spam-Score: -0.2 (/)
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

Changes in v4:
- fixed conflicts after commit 6386ba453468 ("drm/atomic: Fix private obj
  error handling")

Notes:
 * This patch was sent separately in the past [0]
 * The issue is still happening with hotplug without this patch
 * The issue has also been reported by sashiko when reviewing v2 [1]

[0] https://lore.kernel.org/dri-devel/20260324-drm-bridge-atomic-vs-remove-private_obj-v3-1-64deefe84044@bootlin.com/
[1] https://lore.kernel.org/all/20261001130542.A40D11F00898@smtp.kernel.org/
---
 drivers/gpu/drm/drm_atomic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 1c3fe07b327e..096f85419b36 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1106,6 +1106,9 @@ EXPORT_SYMBOL(drm_atomic_private_obj_init);
 void
 drm_atomic_private_obj_fini(struct drm_private_obj *obj)
 {
+	struct drm_modeset_acquire_ctx ctx;
+	int ret = 0;
+
 	/*
 	 * Some callers ignore drm_atomic_private_obj_init() failures
 	 * and unconditionally register a teardown action that calls
@@ -1117,7 +1120,10 @@ drm_atomic_private_obj_fini(struct drm_private_obj *obj)
 	if (list_empty(&obj->head))
 		return;
 
+	DRM_MODESET_LOCK_ALL_BEGIN(obj->dev, ctx, 0, ret);
 	list_del_init(&obj->head);
+	DRM_MODESET_LOCK_ALL_END(obj->dev, ctx, ret);
+
 	obj->funcs->atomic_destroy_state(obj, obj->state);
 	drm_modeset_lock_fini(&obj->lock);
 }

-- 
2.56.1


