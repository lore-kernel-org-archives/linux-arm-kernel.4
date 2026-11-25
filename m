Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DB4606A68B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tOqbE2yb;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1CA6yBKV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3A5cjW5s6Vm9YexlzjVRgl0QgTWKhVvRpSlRJjfgWZs=; b=tOqbE2ybeAgHGs
	d0KhaoW0v1dr+PSU1qCkkthN6FbV8hC3k5D4iIDMSVTsKZhZGFW3INGm95MaLc6O+bID0ThOuJnIJ
	cDpihgjwMXe4UCDfi9vysi26Y8canUi/FOD7F4aN9v6qcZkzPfHRhZKaIEafcNQl3WorcpafGuINU
	jSiZr7RxvoFwxYhM02j4YFd06lAm8EbE0nEA+Dfn8wIapGJpOBLGapLzO0b+QfAl8M0PxSGecP40V
	HsKm63fcAboycJd1J7J71pSygdOz5tfnFpiGcZvZEZllFstwr0DUGM3RqRQOwe3LcCgqQFnrq6YI4
	W+YHskFXahhNOIjyMi8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWH9s-0000000AnKX-1SgU;
	Wed, 25 Nov 2026 17:51:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWH9B-0000000An2D-1Dg6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:51:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AA4FF4E41783;
	Wed, 25 Nov 2026 17:51:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B1B460480;
	Wed, 25 Nov 2026 17:51:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FAB311E6B0AE;
	Wed, 25 Nov 2026 18:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629065; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3A5cjW5s6Vm9YexlzjVRgl0QgTWKhVvRpSlRJjfgWZs=;
	b=1CA6yBKVAq8sZAQ8KU+pXmBM+p/6F3rx+KOh79Vgstzg726iK4gp6c5SvZan88jxDuz0On
	lr9yEJXN9ytvidiRusLZr9sVNRQtBJ+A61Lkd0wzCfaT1ebpEiPnSqGNPu7WWzmpKBrsa6
	k3AiWy2Auo55wJCUexRoJ+z5R6vle71qRjUbYLh+ly8+rc6g7+y1MGkUftPi3QERU6ltCA
	PgL2cDm7L7GrE5PGWYuWCoShz+lym9GIcA8zy5JbzGHECXoc+RlrbvVth1GONZVUh/h7RR
	bykLFayrTiSnPT57mtgdssWSdoKK7yjSUaP79ljgMJ82DJqxvforJzpQDR+q5A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:17 +0100
Subject: [PATCH v4 04/32] drm/display: hdmi-cec-notifier-helper: add
 non-drmm API variant
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-4-822722850492@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_095109_933049_0EAD7A41 
X-CRM114-Status: GOOD (  14.46  )
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

For bridge hotplug drmm allocations are not suitable because a connector
may have to be added and removed multiple times in the lifetime of a card.

In preparation to support hotpluggable HDMI bridges (and the
drm_bridge_connector) add a non-drmm variant of the CEC notifier
(de)registration API, with an explicit unregister API.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3.
---
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c | 30 ++++++++++++++++++----
 include/drm/display/drm_hdmi_cec_helper.h          | 15 +++++++++++
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
index 47662bdc5d08..2f30844fcdad 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
@@ -29,8 +29,7 @@ static void drmm_connector_hdmi_cec_notifier_unregister(struct drm_device *dev,
 {
 	struct drm_connector *connector = res;
 
-	cec_notifier_conn_unregister(connector->cec.data);
-	connector->cec.data = NULL;
+	drm_connector_hdmi_cec_notifier_unregister(connector);
 }
 
 static const struct drm_connector_cec_funcs drm_connector_cec_notifier_funcs = {
@@ -38,9 +37,9 @@ static const struct drm_connector_cec_funcs drm_connector_cec_notifier_funcs = {
 	.phys_addr_set = drm_connector_hdmi_cec_notifier_phys_addr_set,
 };
 
-int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
-					      const char *port_name,
-					      struct device *dev)
+int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					     const char *port_name,
+					     struct device *dev)
 {
 	struct cec_connector_info conn_info;
 	struct cec_notifier *notifier;
@@ -58,6 +57,27 @@ int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
 
 	mutex_unlock(&connector->cec.mutex);
 
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_notifier_register);
+
+void drm_connector_hdmi_cec_notifier_unregister(struct drm_connector *connector)
+{
+	cec_notifier_conn_unregister(connector->cec.data);
+	connector->cec.data = NULL;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_notifier_unregister);
+
+int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					      const char *port_name,
+					      struct device *dev)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_cec_notifier_register(connector, port_name, dev);
+	if (ret)
+		return ret;
+
 	return drmm_add_action_or_reset(connector->dev,
 					drmm_connector_hdmi_cec_notifier_unregister,
 					connector);
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
index 7e76a163e3a5..8d648532eeb7 100644
--- a/include/drm/display/drm_hdmi_cec_helper.h
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -63,10 +63,25 @@ void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connecto
 						  u8 status);
 
 #if IS_ENABLED(CONFIG_DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER)
+int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					     const char *port_name,
+					     struct device *dev);
+void drm_connector_hdmi_cec_notifier_unregister(struct drm_connector *connector);
 int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
 					      const char *port_name,
 					      struct device *dev);
 #else
+static inline int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+							   const char *port_name,
+							   struct device *dev)
+{
+	return 0;
+}
+
+static inline void drm_connector_hdmi_cec_notifier_unregister(struct drm_connector *connector)
+{
+}
+
 static inline int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
 							    const char *port_name,
 							    struct device *dev)

-- 
2.56.1


