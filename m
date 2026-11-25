Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE908606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gcBkYFTh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Zl5H9fkp;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=anXMl4pv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6cbsoztBQcTi641oZ6OxIPoBLguf/ah1kPl/rYJNvpY=; b=gcBkYFThyjYNOg
	JCBbU1gG3d/dupMgTg1ZdNy73+jLx+wo2V1O18aaBSxjyE6vKsNanin+4jlBGAGl4JMAo0k/6BgRG
	XyJsYNLgJkFwQsN4Nu2AjoCEgsZ47s/1BNZ9pvsCzyX9iztQT7IOQ5QgY2tTi7Bk0+coI8qgVXNqP
	r8S37CoiyZPdMP8T5PCe5Hok5g1qKEVRPJM0FrKI6G/psSroevq5glWilgwAzYGOK1XcQg4wgZDOx
	0owU9sV+gREfsjHj1Hz/cBo7a+eLjMkuSTfEDMgYcFDirKA083V5LdCUzbGnZWeYK0oX61wZDjiuw
	Hu1LzOELXihVfeauCWaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHCL-0000000Aqhm-1jRD;
	Wed, 25 Nov 2026 17:54:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAl-0000000AoFG-2ahW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6cbsoztBQcTi641oZ6OxIPoBLguf/ah1kPl/rYJNvpY=; b=Zl5H9fkpFgqkia4Rb/UDJDr4vy
	HFWYSsXrOn3gJkUY0IURNAm4BXe3dWVZAQX9JJ/wKRJ/cLrdHJwpBXxH7CDHMOTC2EskeKq0Zf2IO
	C7uqungx6VyXLU4ZMLOLNMH2FBbi2RihzyuZirnZE7jLp4pOtTsDmmR/m5YQ8v66CYWJamg5yFCgm
	bUDWpfues4ufVRLHuikhSkoNvD0ENFpd8d/u0hb9uex1WTe1yHOKuBBXPRq85nfV1wAN0K2oExNnI
	vXz6O47+sY+ImYETGuqTBItPBdIViFjfwBrxWcgRbf++X4/HoEIjBymz7jiCOr+vtJM7kYvuwmPD7
	6vbr1a4A==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAf-00000005bL4-3B5t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:52:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A43FC2B9C3;
	Wed, 25 Nov 2026 17:52:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A26E860480;
	Wed, 25 Nov 2026 17:52:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90B6D11E6B0CA;
	Wed, 25 Nov 2026 18:52:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6cbsoztBQcTi641oZ6OxIPoBLguf/ah1kPl/rYJNvpY=;
	b=anXMl4pvSSNFgVY/qlO/0Fs59i17Xq9P02OZgtWSEzIcXcLB4qmfuWpMDhRAU1649frZbw
	OCqUUVBIgKyajIQKNU5i+KMMmxe/UvqH4lWK0SnOoGZkeckzSfY7/vWh8aI/JYA0hOhSwn
	3ASSNiPb+1QSIDHT8LzpFO1597uIaMjDpjb/5Si4XDxf08QDC0Im8nSvpN0u5mfTtU4PW7
	CoKnSpbFe8GuoFy4opoFh2D4Adcd/ukL0ioqjEvy1pMYshNGJkCjLMUUhQc+zqUofnlKPx
	OPE1UfOlmcuVec2D1jrwTaNS7wiP4odJdLFe9lOm9H4zAeNwwoWrfQao3IAwoA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:29 +0100
Subject: [PATCH v4 16/32] drm/probe-helper: add per-connector polling
 enable/disable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-16-822722850492@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_175241_921311_D76B762B 
X-CRM114-Status: GOOD (  19.34  )
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

With the upcoming DRM bridge hotplug support, drm_connectors will be added
and removed at any time after initial card probing.

This means the existing calls to drm_kms_helper_poll_init() at probe time
will not enable HPD on connectors added later on (and potentially not start
the polling work), so late connectors cannot perform HPD polling.

Similarly, drm_kms_helper_poll_fini() cannot disable HPD for hot-unplugged
connectors without disabling it for other connectors.

Add drm_kms_helper_poll_enable_connector() and
drm_kms_helper_poll_disable_connector() to enable or disable HPD for a
single connector, and also arm the work when an enabled connector requests
polling and stop on disable it unless other connectors still need it.

Polling must still be initialized once per device with
drm_kms_helper_poll_init() and finally torn down with
drm_kms_helper_poll_fini().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v4
---
 drivers/gpu/drm/drm_probe_helper.c | 92 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  2 +
 2 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 856b40fdaac4..e468971ab642 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -224,6 +224,14 @@ drm_connector_mode_valid(struct drm_connector *connector,
 	return ret;
 }
 
+static void drm_kms_helper_disable_hpd_connector(struct drm_connector *connector)
+{
+	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
+
+	if (funcs && funcs->disable_hpd)
+		funcs->disable_hpd(connector);
+}
+
 static void drm_kms_helper_disable_hpd(struct drm_device *dev)
 {
 	struct drm_connector *connector;
@@ -240,6 +248,16 @@ static void drm_kms_helper_disable_hpd(struct drm_device *dev)
 	drm_connector_list_iter_end(&conn_iter);
 }
 
+static bool drm_kms_helper_enable_hpd_connector(struct drm_connector *connector)
+{
+	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
+
+	if (funcs && funcs->enable_hpd)
+		funcs->enable_hpd(connector);
+
+	return (connector->polled & (DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT));
+}
+
 static bool drm_kms_helper_enable_hpd(struct drm_device *dev)
 {
 	bool poll = false;
@@ -316,6 +334,32 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_enable);
 
+/**
+ * drm_kms_helper_poll_enable_connector - enable output polling for a connector
+ * @connector: the connector
+ *
+ * Enables output polling @connector and reschdules the polling work if
+ * needed. Intended for connectors which are added after initial probing.
+ *
+ * This must be called after polling has been initialized by
+ * drm_kms_helper_poll_init(). Safe to call while polling is already
+ * running.
+ */
+void drm_kms_helper_poll_enable_connector(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+
+	if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) || !drm_kms_helper_poll)
+		return;
+
+	if (drm_kms_helper_enable_hpd_connector(connector) ||
+	    dev->mode_config.delayed_event)
+		reschedule_output_poll_work(dev);
+
+	dev->mode_config.poll_running = true;
+}
+EXPORT_SYMBOL(drm_kms_helper_poll_enable_connector);
+
 /**
  * drm_kms_helper_poll_reschedule - reschedule the output polling work
  * @dev: drm_device
@@ -927,6 +971,54 @@ void drm_kms_helper_poll_disable(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_disable);
 
+static bool drm_kms_helper_has_other_connectors(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_connector *curr;
+	struct drm_connector_list_iter conn_iter;
+	bool remaining = false;
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(curr, &conn_iter) {
+		if (curr != connector &&
+		    curr->registration_state == DRM_CONNECTOR_REGISTERED) {
+			remaining = true;
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	return remaining;
+}
+
+/**
+ * drm_kms_helper_poll_disable_connector - disable output polling for a connector
+ * @connector: the connector
+ *
+ * Disables output polling for @connector. If there are no other registered
+ * connectors, also disables the output poll work.
+ *
+ * Polling stays initialized; call drm_kms_helper_poll_fini() to tear it
+ * down. Does nothing if output polling is not initialized by
+ * drm_kms_helper_poll_init().
+ */
+void drm_kms_helper_poll_disable_connector(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+
+	if (!dev->mode_config.poll_enabled)
+		return;
+
+	drm_kms_helper_disable_hpd_connector(connector);
+
+	if (dev->mode_config.poll_running &&
+	    !drm_kms_helper_has_other_connectors(connector)) {
+		cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+		dev->mode_config.poll_running = false;
+	}
+}
+EXPORT_SYMBOL(drm_kms_helper_poll_disable_connector);
+
 /**
  * drm_kms_helper_poll_init - initialize and enable output polling
  * @dev: drm_device
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 840ae5f798c2..ae58c1b078fe 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -26,7 +26,9 @@ void drm_kms_helper_hotplug_event(struct drm_device *dev);
 void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector);
 
 void drm_kms_helper_poll_disable(struct drm_device *dev);
+void drm_kms_helper_poll_disable_connector(struct drm_connector *connector);
 void drm_kms_helper_poll_enable(struct drm_device *dev);
+void drm_kms_helper_poll_enable_connector(struct drm_connector *connector);
 void drm_kms_helper_poll_reschedule(struct drm_device *dev);
 bool drm_kms_helper_is_poll_worker(void);
 

-- 
2.56.1


