Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6D60A3825
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w+ig78Uj;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bgNX4NAP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aN7ZfX2fzTUuVA8ldlfQcBZtVWylxKsPo5u6oPKsLgo=; b=w+ig78UjvjvBWe
	5FcyBilekQJDpLVEXLXD8X7AxUO0WpDC4CjF8qoOkNzw05f4MNoHPwnTsJTBTZc5gc8BPC3qdoTd9
	UA1b+469KL307eOgZ/OY5QWENkwj3c7leqxihlwIbXmQImEIb4r8awfUrC7q6BRRHQQH4lfvI3kYF
	36rLoRhc11xZLlkUfF0Gal5igr1gc6sL0A4tAFOa7xgUTRzr7AcWflLwAPBFEFlSLfZcmE8qfEC0b
	KZoBAQ6h0Yobt8R+f0RjENGciH0OugKj/B3DyWvfMdQu35Ki7gY7Z3r3YUDUfSTScJU447d3OAYiG
	/hgpnVAHcLkD4YA9PLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTitc-00000009boD-1BZ3;
	Wed, 18 Nov 2026 16:52:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTitN-00000009bWX-1ulJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:52:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 76E6A4E41635;
	Wed, 18 Nov 2026 16:52:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43C5F5FE9B;
	Wed, 18 Nov 2026 16:52:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8CED11BC28D4;
	Wed, 18 Nov 2026 17:52:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aN7ZfX2fzTUuVA8ldlfQcBZtVWylxKsPo5u6oPKsLgo=;
	b=bgNX4NAPXcaG5Mb9ugUFKhvQfe61a1fXQ1SyKiFu2HgkLUHvmT8G0SceNCkza9LwVilR++
	/NwCiXLLAkGFaqZzNYNwlA17e4yvK7p2JCyNPFGCf2HpMFOlMzhYiTqJdu2kE/XbZ7D1SD
	CGUCT3RR+A79/NwHumgamxuw8A3jgf+p3nyEsq5MolqESxyljokP+lzvItH48k2OMj3Iq5
	TxCvwBE1aYkJiHSzFr8e/fm+LdV11S73YMiphwmXphNRTjqt62B7FN1WbywupCyL/3g1Tp
	PpmHDjfY7KgAqbnsBg33tFnyZw76ZtyxvYFJVmCFS7rDnZmPqJwo3ZWIkYXJLw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:03 +0100
Subject: [PATCH RFC v3 20/31] drm/panel: implement .get_next_bridge
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-20-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_085217_704807_05DC976E 
X-CRM114-Status: GOOD (  11.25  )
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

This bridge never has a next bridge. Add get_next_callback func to expose
this.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_panel.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 560ea57591bd..11ca2d192669 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -77,6 +77,11 @@ static const struct drm_connector_funcs panel_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static struct drm_bridge *drm_panel_bridge_get_next_bridge(struct drm_bridge *bridge)
+{
+	return NULL;
+}
+
 static int panel_bridge_attach(struct drm_bridge *bridge,
 			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
@@ -227,6 +232,7 @@ static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
+	.get_next_bridge = drm_panel_bridge_get_next_bridge,
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
 	.atomic_pre_enable = panel_bridge_atomic_pre_enable,
@@ -610,7 +616,7 @@ void drm_panel_add(struct drm_panel *panel)
 	mutex_unlock(&panel_lock);
 
 	panel->bridge.of_node = panel->dev->of_node;
-	panel->bridge.ops = DRM_BRIDGE_OP_MODES;
+	panel->bridge.ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 	panel->bridge.type = panel->connector_type;
 	panel->bridge.pre_enable_prev_first = panel->prepare_prev_first;
 

-- 
2.56.1


