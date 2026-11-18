Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64569606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bvqzU+bb;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qyeIgh6x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R32+wDXxmTkP/gEthbKPhXatwdXsuuJxCRpBzoKrIWQ=; b=bvqzU+bbnjcTyF
	OsQgIB78ymEuLnsvjeRicTxhI0/X9omp2IaefUgW116oAiShBKY9Jm6t77BJLH200RqCxRUrOPorZ
	DzviM4eEBp/ifiv43TDp9MIrv4PALEdX/6QaY+GhPKvRyDMp6+WMsrWMK3R4XpkjoaVR3HcBtLI+V
	QswquMtmGu4ywcvrU8i36rlVDl7bLniaJJ2YUZzdfhwSg98m/rDNP1t51G5mFDUNuMTSFAkK96Pzh
	axnIasfTFqpD90lYVqpauq1RFwdbfDcbOMlxURZ7EI1SsJAzLz/JnmJ+jBa2SbTJCETInYZPc9+4m
	xaRCdy2EXCjAD142mPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTirk-00000009ZvN-1H8V;
	Wed, 18 Nov 2026 16:50:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTirS-00000009Znk-2UDK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:50:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BB776C4F77E;
	Wed, 18 Nov 2026 16:50:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D361B5FE9B;
	Wed, 18 Nov 2026 16:50:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4478111BC2883;
	Wed, 18 Nov 2026 17:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020615; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R32+wDXxmTkP/gEthbKPhXatwdXsuuJxCRpBzoKrIWQ=;
	b=qyeIgh6x4ucm581lP0wWMexA6TrEj93OPQsjQOtKh6cJMzVQqPmftSOFwNfsW2koNJqOoo
	691yiSD/OV7ZSjB9GRNmXfh5btzuiU0TQWUlhvhNorDkEr9MEdUUwWybZVKg3m6f6Bj25i
	6YGj9Pk+JygO7QNYfSnMxPjnKS4GmlXnxPaTrLhy5D/xtm2eHa4ZS5VaMQbKtC6GPhjlpy
	ZHwXv28T16Q52CdVqdM1evEOtYTyF4fMvuA9XTj0uPqj2KQTGRfPJ9x6TmY/vHc3DS2jSi
	nHutQ9+ri5P1r9Dd66wQKP4T+ZN3CxzPJzM6MHoXzBL+mZEXBuAydKuYb4cTZw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:45 +0100
Subject: [PATCH RFC v3 02/31] drm/display: hdmi-cec-helper: add non-drmm
 API variant
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-2-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_085019_457553_B22873A1 
X-CRM114-Status: GOOD (  17.69  )
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
drm_bridge_connector) add a non-drmm variant of the CEC adapter
(de)registration API, with an explicit unregister API.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 60 ++++++++++++++++++---------
 include/drm/display/drm_hdmi_cec_helper.h     |  6 +++
 2 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
index b79c41703d53..81b271659ad9 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -67,15 +67,8 @@ static void drm_connector_hdmi_cec_adapter_phys_addr_set(struct drm_connector *c
 static void drmm_connector_hdmi_cec_adapter_unregister(struct drm_device *dev, void *res)
 {
 	struct drm_connector *connector = res;
-	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
-
-	cec_unregister_adapter(data->adapter);
-
-	if (data->funcs->uninit)
-		data->funcs->uninit(connector);
 
-	kfree(data);
-	connector->cec.data = NULL;
+	drm_connector_hdmi_cec_unregister(connector);
 }
 
 static struct drm_connector_cec_funcs drm_connector_hdmi_cec_adapter_funcs = {
@@ -83,11 +76,11 @@ static struct drm_connector_cec_funcs drm_connector_hdmi_cec_adapter_funcs = {
 	.phys_addr_set = drm_connector_hdmi_cec_adapter_phys_addr_set,
 };
 
-int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
-				     const struct drm_connector_hdmi_cec_funcs *funcs,
-				     const char *name,
-				     u8 available_las,
-				     struct device *dev)
+int drm_connector_hdmi_cec_register(struct drm_connector *connector,
+				    const struct drm_connector_hdmi_cec_funcs *funcs,
+				    const char *name,
+				    u8 available_las,
+				    struct device *dev)
 {
 	struct drm_connector_hdmi_cec_data *data;
 	struct cec_connector_info conn_info;
@@ -125,9 +118,8 @@ int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 		goto err_delete_adapter;
 
 	/*
-	 * NOTE: the CEC adapter will be unregistered by drmm cleanup from
-	 * drm_managed_release(), which is called from drm_dev_release()
-	 * during device unbind.
+	 * NOTE: the CEC adapter will be unregistered by
+	 * cec_unregister_adapter().
 	 *
 	 * However, the CEC framework cleans up the CEC adapter only when the
 	 * last user has closed its file descriptor, so we don't need to handle
@@ -144,9 +136,7 @@ int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 
 	mutex_unlock(&connector->cec.mutex);
 
-	return drmm_add_action_or_reset(connector->dev,
-					drmm_connector_hdmi_cec_adapter_unregister,
-					connector);
+	return 0;
 
 err_delete_adapter:
 	cec_delete_adapter(cec_adap);
@@ -160,6 +150,38 @@ int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 
 	return ret;
 }
+EXPORT_SYMBOL(drm_connector_hdmi_cec_register);
+
+void drm_connector_hdmi_cec_unregister(struct drm_connector *connector)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_unregister_adapter(data->adapter);
+
+	if (data->funcs->uninit)
+		data->funcs->uninit(connector);
+
+	kfree(data);
+	connector->cec.data = NULL;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_unregister);
+
+int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
+				     const struct drm_connector_hdmi_cec_funcs *funcs,
+				     const char *name,
+				     u8 available_las,
+				     struct device *dev)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_cec_register(connector, funcs, name, available_las, dev);
+	if (ret)
+		return ret;
+
+	return drmm_add_action_or_reset(connector->dev,
+					drmm_connector_hdmi_cec_adapter_unregister,
+					connector);
+}
 EXPORT_SYMBOL(drmm_connector_hdmi_cec_register);
 
 void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
index fd8f4d2f02c1..7e76a163e3a5 100644
--- a/include/drm/display/drm_hdmi_cec_helper.h
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -39,6 +39,12 @@ struct drm_connector_hdmi_cec_funcs {
 			u32 signal_free_time, struct cec_msg *msg);
 };
 
+int drm_connector_hdmi_cec_register(struct drm_connector *connector,
+				    const struct drm_connector_hdmi_cec_funcs *funcs,
+				    const char *name,
+				    u8 available_las,
+				    struct device *dev);
+void drm_connector_hdmi_cec_unregister(struct drm_connector *connector);
 int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 				     const struct drm_connector_hdmi_cec_funcs *funcs,
 				     const char *name,

-- 
2.56.1


