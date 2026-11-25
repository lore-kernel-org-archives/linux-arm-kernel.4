Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B80606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a0RJfpAY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Xb4Ek3JS;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Sj1AvK8B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=utdasQYRvDkNeySeJoOR7BHLdC3SmZiu0oAuKRibaD0=; b=a0RJfpAYJTH7ip
	e5otkZP3FzZfat6vW/MwnZGWRCuWxxCtYd+D9IwRaC/TSp+PiXST3sT5NGRoBfdoYGB/A2w5r5lu3
	BQBrTtn2X2aLHRL24eLaW1hgKAf2p1UhKavV6ViKPPd0ye3W0IuphauFRWWVQ6/4rL4ZpSbZ95/67
	fNtIGMeOLMQYEqztbq0IeBDs/+dvlelyJMivF1vXpoRQzCh+5FqK4/0h5RXldTQ/szRrjahZQHSxK
	rixeNB4PbvcFkq+gyN4kIzBvOK01vKWAIyP/J/uahHhlt+1OX/TzlHuXny7nQsZ41aO3t+YMXXL9z
	EOxfhFdhxEps9y+SjPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDF-0000000Artb-36UH;
	Wed, 25 Nov 2026 17:55:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHC7-0000000AqRM-1dZN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=utdasQYRvDkNeySeJoOR7BHLdC3SmZiu0oAuKRibaD0=; b=Xb4Ek3JStYLXs08BBVZl9mE+53
	1u9PnxtUyjG0A8sGYqxkaiqsDG+T/SalKsMUzSwT74Cya8kVbOYVRsVyVotdStARwrG6vlddPZN53
	JnklTo2SJ/D7ME8eKV+eMc9EgHJ2DsdsXzH/BgqrMEoGXMecJmIh2bl1gAtvp033N8MEMgPftiI1q
	19roBqt/pLR8vYFCKYSWk02ZOUKirsUY5N6TD639vLFN55oKFSXh1DFKg2FsMQXsE6m+IRteUz9Ok
	/1ysslfLHlwmdyco3V6rJTAEfavg8Y6qVQHU30yh5iF+E2Y4kRlSb85RPWbMsYeCfC7Ze+bVsJq+v
	Qmf/E1Ug==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHC2-00000005bzx-0tOZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:54:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38EC6C2B9C2;
	Wed, 25 Nov 2026 17:54:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40D0B60480;
	Wed, 25 Nov 2026 17:54:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9622211E6B0C5;
	Wed, 25 Nov 2026 18:53:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629243; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=utdasQYRvDkNeySeJoOR7BHLdC3SmZiu0oAuKRibaD0=;
	b=Sj1AvK8BgUEvfwlaQ/xrJblnUYR89D8CFBmtrEa6fYKsN5ZyVVt8uPgWRzNchDvJwpG2ZB
	WtcyORoRb0lLLgNhriuPtvOv5eTD5ZCkeAIHqwyN+4lRKfyng8i6j5tXHdM0gtS3o2+BPw
	VjzSPE/wOXToYO0vjQnjaIIOu6TLgETL8KN7hmR+hw7XKRi9wfBaCsE0u2y8ax5Mj191NN
	mFDz0y0PTXnwEBjC9UEDTb1LvCDbfz08YQAqxuXFvwvRGQu/L4jeHRKimwVUjAQ7mjh+E8
	BgREgH/zeVSeJonjO2YQFQkYjy8LkjpqFinsW9FYaql/xOQjSPMNgRKJFRgc0g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:41 +0100
Subject: [PATCH v4 28/32] drm/tests: atomic: add tests for
 drm_atomic_shutdown_encoder()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-28-822722850492@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_175406_236171_7F04C008 
X-CRM114-Status: GOOD (  19.12  )
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

Add KUnit tests to exercise the newly added drm_atomic_shutdown_encoder(),
including in the case of a card with multiple CRTCs.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3
---
 drivers/gpu/drm/tests/drm_bridge_test.c | 209 ++++++++++++++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
index f56209c0ab1c..06d08d1316ae 100644
--- a/drivers/gpu/drm/tests/drm_bridge_test.c
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -5,6 +5,7 @@
 #include <linux/cleanup.h>
 #include <linux/media-bus-format.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_atomic_uapi.h>
@@ -951,6 +952,213 @@ static struct kunit_suite drm_bridge_alloc_test_suite = {
 	.test_cases = drm_bridge_alloc_tests,
 };
 
+/*
+ * Two CRTC/encoder/bridge/connector pipelines on the same DRM device, to
+ * check that drm_atomic_shutdown_encoder() only stops one.
+ */
+struct drm_bridge_two_priv {
+	struct drm_device drm;
+	struct drm_plane *plane[2];
+	struct drm_crtc *crtc[2];
+	struct drm_encoder encoder[2];
+	struct drm_bridge_priv *bridge[2];
+	struct drm_connector *connector[2];
+};
+
+static const struct drm_bridge_funcs drm_test_bridge_atomic_no_destroy_funcs = {
+	.atomic_enable		= drm_test_bridge_atomic_enable,
+	.atomic_disable		= drm_test_bridge_atomic_disable,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_create_state	= drm_atomic_helper_bridge_create_state,
+};
+
+static struct drm_bridge_two_priv *
+drm_test_bridge_two_init(struct kunit *test)
+{
+	struct drm_bridge_two_priv *priv;
+	struct drm_device *drm;
+	struct device *dev;
+	int i, ret;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	if (IS_ERR(dev))
+		return ERR_CAST(dev);
+
+	priv = drm_kunit_helper_alloc_drm_device(test, dev, struct drm_bridge_two_priv,
+						 drm, DRIVER_MODESET | DRIVER_ATOMIC);
+	if (IS_ERR(priv))
+		return priv;
+
+	drm = &priv->drm;
+
+	for (i = 0; i < 2; i++) {
+		priv->bridge[i] = devm_drm_bridge_alloc(dev, struct drm_bridge_priv, bridge,
+							&drm_test_bridge_atomic_no_destroy_funcs);
+		if (IS_ERR(priv->bridge[i]))
+			return ERR_CAST(priv->bridge[i]);
+
+		priv->plane[i] = drm_kunit_helper_create_primary_plane(test, drm,
+								       NULL, NULL, NULL, 0, NULL);
+		if (IS_ERR(priv->plane[i]))
+			return ERR_CAST(priv->plane[i]);
+
+		priv->crtc[i] = drm_kunit_helper_create_crtc(test, drm,
+							     priv->plane[i], NULL, NULL, NULL);
+		if (IS_ERR(priv->crtc[i]))
+			return ERR_CAST(priv->crtc[i]);
+
+		ret = drmm_encoder_init(drm, &priv->encoder[i], NULL, DRM_MODE_ENCODER_TMDS, NULL);
+		if (ret)
+			return ERR_PTR(ret);
+
+		priv->encoder[i].possible_crtcs = drm_crtc_mask(priv->crtc[i]);
+
+		priv->bridge[i]->bridge.type = DRM_MODE_CONNECTOR_VIRTUAL;
+
+		ret = drm_kunit_bridge_add(test, &priv->bridge[i]->bridge);
+		if (ret)
+			return ERR_PTR(ret);
+
+		ret = drm_bridge_attach(&priv->encoder[i], &priv->bridge[i]->bridge, NULL, 0);
+		if (ret)
+			return ERR_PTR(ret);
+
+		priv->connector[i] = drm_bridge_connector_init(drm, &priv->encoder[i]);
+		if (IS_ERR(priv->connector[i]))
+			return ERR_CAST(priv->connector[i]);
+	}
+
+	drm_mode_config_reset(drm);
+
+	return priv;
+}
+
+static int drm_test_enable_pipeline(struct kunit *test,
+				    struct drm_device *drm,
+				    struct drm_crtc *crtc,
+				    struct drm_connector *connector,
+				    const struct drm_display_mode *mode)
+{
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm, crtc, connector, mode, &ctx);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry;
+	}
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	return ret;
+}
+
+/*
+ * Test that drm_atomic_shutdown_encoder() disables the CRTC feeding the
+ * encoder and detaches its connector.
+ */
+static void drm_test_drm_atomic_shutdown_encoder(struct kunit *test)
+{
+	struct drm_bridge_init_priv *priv;
+	struct drm_display_mode *mode;
+	struct drm_bridge_priv *bridge_priv;
+	int ret;
+
+	priv = drm_test_bridge_init(test, &drm_test_bridge_atomic_funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	ret = drm_test_enable_pipeline(test, &priv->drm, priv->crtc, priv->connector, mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	bridge_priv = priv->test_bridge;
+	KUNIT_ASSERT_EQ(test, bridge_priv->enable_count, 1);
+	KUNIT_ASSERT_EQ(test, bridge_priv->disable_count, 0);
+	KUNIT_ASSERT_PTR_EQ(test, priv->connector->state->crtc, priv->crtc);
+
+	drm_atomic_shutdown_encoder(&priv->encoder);
+
+	KUNIT_EXPECT_EQ(test, bridge_priv->disable_count, 1);
+	KUNIT_EXPECT_NULL(test, priv->connector->state->crtc);
+	KUNIT_EXPECT_FALSE(test, priv->crtc->state->active);
+}
+
+/*
+ * Test that drm_atomic_shutdown_encoder() is a no-op when the encoder is not
+ * driving any output.
+ */
+static void drm_test_drm_atomic_shutdown_encoder_disabled(struct kunit *test)
+{
+	struct drm_bridge_init_priv *priv;
+	struct drm_bridge_priv *bridge_priv;
+
+	priv = drm_test_bridge_init(test, &drm_test_bridge_atomic_funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	bridge_priv = priv->test_bridge;
+
+	drm_atomic_shutdown_encoder(&priv->encoder);
+
+	KUNIT_EXPECT_EQ(test, bridge_priv->enable_count, 0);
+	KUNIT_EXPECT_EQ(test, bridge_priv->disable_count, 0);
+	KUNIT_EXPECT_NULL(test, priv->connector->state->crtc);
+}
+
+/*
+ * Test that drm_atomic_shutdown_encoder() only stops the pipeline of the
+ * given encoder and leaves the other CRTC untouched.
+ */
+static void drm_test_drm_atomic_shutdown_encoder_two_crtcs(struct kunit *test)
+{
+	struct drm_bridge_two_priv *priv;
+	struct drm_display_mode *mode;
+	int ret;
+
+	priv = drm_test_bridge_two_init(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	ret = drm_test_enable_pipeline(test, &priv->drm, priv->crtc[0], priv->connector[0], mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_test_enable_pipeline(test, &priv->drm, priv->crtc[1], priv->connector[1], mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_ASSERT_EQ(test, priv->bridge[0]->enable_count, 1);
+	KUNIT_ASSERT_EQ(test, priv->bridge[1]->enable_count, 1);
+
+	drm_atomic_shutdown_encoder(&priv->encoder[0]);
+
+	KUNIT_EXPECT_EQ(test, priv->bridge[0]->disable_count, 1);
+	KUNIT_EXPECT_NULL(test, priv->connector[0]->state->crtc);
+	KUNIT_EXPECT_FALSE(test, priv->crtc[0]->state->active);
+
+	KUNIT_EXPECT_EQ(test, priv->bridge[1]->disable_count, 0);
+	KUNIT_EXPECT_PTR_EQ(test, priv->connector[1]->state->crtc, priv->crtc[1]);
+	KUNIT_EXPECT_TRUE(test, priv->crtc[1]->state->active);
+}
+
+static struct kunit_case drm_atomic_shutdown_encoder_tests[] = {
+	KUNIT_CASE(drm_test_drm_atomic_shutdown_encoder),
+	KUNIT_CASE(drm_test_drm_atomic_shutdown_encoder_disabled),
+	KUNIT_CASE(drm_test_drm_atomic_shutdown_encoder_two_crtcs),
+	{ }
+};
+
+static struct kunit_suite drm_atomic_shutdown_encoder_test_suite = {
+	.name = "drm_atomic_shutdown_encoder",
+	.test_cases = drm_atomic_shutdown_encoder_tests,
+};
+
 /**
  * drm_test_bridge_chain_verify_fmt - Verify bridge chain format selection
  * @test: pointer to KUnit test object
@@ -1381,6 +1589,7 @@ kunit_test_suites(
 	&drm_bridge_get_current_state_test_suite,
 	&drm_bridge_helper_reset_crtc_test_suite,
 	&drm_bridge_alloc_test_suite,
+	&drm_atomic_shutdown_encoder_test_suite,
 	&drm_bridge_bus_fmt_test_suite,
 );
 

-- 
2.56.1


