Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D50606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1BbieMn8;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YsaPuTLN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BrrcnjzQvcqJiMXT1xilqkGsVrudJdiOVPDn3lvn36s=; b=1BbieMn8JIgolK
	vepSpjRbrFILoV4+RaP5eMYWOgZhjiIjPMb8L0hLTctMgnI2WOKl7KPs7dv0ezli11HM6DjEWHqWT
	o5pvNAxotlWm1fgZitzIUvY2XwXdsRRf22YTRFieonj1OB88MTkDYuRSTiSTbr+5kCxoCe4BWojYF
	+q74ZpMjAvjF4zTLcLL5xBc8KG5DbOZkabhmi4S9vdyQ8+q+l7Ez/tF2I39/9lsWoDDS/nzq2S3Dz
	XXx8tykcGZPRFLG0mjrbweYzJMnnlFoh87EZwWvFmZO4M1b7XHL7RbULHTaInRCfoSK59UloOP6HD
	GAsDWuSZIXerTeROVwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTirk-00000009Zv7-0lVK;
	Wed, 18 Nov 2026 16:50:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTirN-00000009Zk4-3ffl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:50:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D1C77C4F77B;
	Wed, 18 Nov 2026 16:50:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBDFF5FE9B;
	Wed, 18 Nov 2026 16:50:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7104611BC1EE9;
	Wed, 18 Nov 2026 17:50:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BrrcnjzQvcqJiMXT1xilqkGsVrudJdiOVPDn3lvn36s=;
	b=YsaPuTLN6GqYfw+QoliiMeM+fBr9BgkHTAfj3YU/D2nxmZBuZ2HXtP9sv0oJZxWEngZTMM
	oB7nxHoiWSQHudGMnoCCOOG/njlttH5ghu7wPzOAfE7TEGWiPCUf4s32sV9tVvj2tQPS85
	eXbawEi7sAM9HIb1P42weIlCX+zo+8gnch+dslInQUPBP9+crMojO3HwPCdhZJKvDAoGJh
	iVgyGndktmVtpQzIYuFsBtpxkRsgvUvwl/AdZB7dD8Zp5MitYmPDbdat929gIw4zkgoo6Q
	s1Im/f/XapI1QamK7dVqRflt52K4+GsGU/jDBuV4n/b6MezQeVfnlTmTH8urtw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:44 +0100
Subject: [PATCH RFC v3 01/31] drm/display: hdmi-cec-helper: use drmm_
 prefix for drmm action
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-1-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_085014_117868_7A3447DD 
X-CRM114-Status: GOOD (  13.08  )
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
drm_bridge_connector) we need a non-drmm variant of the CEC adapter
(de)registration API, with an explicit unregister API.

To differentiate the new explicit unregister API from the existing drmm
cleanup action, use the drmm_ prefix for the latter.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3.
---
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
index ef6dbaa59dee..b79c41703d53 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -64,7 +64,7 @@ static void drm_connector_hdmi_cec_adapter_phys_addr_set(struct drm_connector *c
 	cec_s_phys_addr(data->adapter, addr, false);
 }
 
-static void drm_connector_hdmi_cec_adapter_unregister(struct drm_device *dev, void *res)
+static void drmm_connector_hdmi_cec_adapter_unregister(struct drm_device *dev, void *res)
 {
 	struct drm_connector *connector = res;
 	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
@@ -145,7 +145,7 @@ int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 	mutex_unlock(&connector->cec.mutex);
 
 	return drmm_add_action_or_reset(connector->dev,
-					drm_connector_hdmi_cec_adapter_unregister,
+					drmm_connector_hdmi_cec_adapter_unregister,
 					connector);
 
 err_delete_adapter:

-- 
2.56.1


