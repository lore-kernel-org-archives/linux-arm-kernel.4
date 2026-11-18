Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA8606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nar4pDlN;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uXsdnIBJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3A5cjW5s6Vm9YexlzjVRgl0QgTWKhVvRpSlRJjfgWZs=; b=Nar4pDlNHMtAP5
	z2MAV9bYW4U2DYeekiFqhaPESu0CPZBJU02gMoge7qRALoDa0sgWZr/xFDwWPBJlj5qDONViReJrT
	Rrmu7XhC1Oc4eOtJixZAeKhL29kYXnmV3mECztqdby967N7dghUgXd80g1Q5cQ3PxB15KOILJmf6D
	fHW1ugEacoLmGbIbnzxMb8RP9baRa/nGUU7V0+E7ukS3102qPMd4g3b2BhQcCT17YSy+nAAqRkW9y
	jHyeAXJRQpxVJObqm/qUzh1UgtWW+rAVJP1Isq5hes3vaIsHrrpOqLHxREkhTI5Eyjmf6+oknMtfE
	Won1O0YAsGkhf/TruMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTisF-00000009aIp-3PLN;
	Wed, 18 Nov 2026 16:51:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTirl-00000009Zv8-2PkP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:50:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EA9041A16D4;
	Wed, 18 Nov 2026 16:50:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD5E75FE9B;
	Wed, 18 Nov 2026 16:50:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B65811BC28A0;
	Wed, 18 Nov 2026 17:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3A5cjW5s6Vm9YexlzjVRgl0QgTWKhVvRpSlRJjfgWZs=;
	b=uXsdnIBJW3cWzNbsg9sgsfFjyH0gh/gnRrE+oFrbwgpp2CCif7wpjosWbY0+RJ8HowHyzD
	OPDLJZlTS/Ja+rK6g/vQi85Te21gz6FvNZyag8aE43c3nNMDUBRG7V1XgJzNNZpCRrEkXs
	8clje4Rp9PFld/PsUbUDtjLpxQKe7DuC8SA1Y3sbawlDJ1LgXnqirHp2P3v78zVNic2daX
	rHHojt9p9rsGW99i4o4U5KfpED5P4o6V3GBuZAJYmEAfLDrswzlJK+ArErTbjK+F2y2bsi
	B2W+venGvYhxjcXNwecYWXrtpygbK4Dkw6kZXx9BIygmg7pc0KtA95vDSPpT4Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:47 +0100
Subject: [PATCH RFC v3 04/31] drm/display: hdmi-cec-notifier-helper: add
 non-drmm API variant
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-4-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_085039_256740_22329A81 
X-CRM114-Status: GOOD (  13.87  )
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


