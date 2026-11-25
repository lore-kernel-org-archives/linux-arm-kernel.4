Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92415606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4kfADR2O;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T3yBgD7k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BrrcnjzQvcqJiMXT1xilqkGsVrudJdiOVPDn3lvn36s=; b=4kfADR2OXFvYIB
	52x+EqsXoslEHsUl/1dWXIG4lAx/4VJTQjZ2Em2LQD4lEEcTqSFM43LrrLW9BuXqLtHM2t0ukF/6L
	EISIcqQqXgSSZQB4MNBzlpUGAWMPQayVZYcRC2UhCgo+J0D0dpYj+F42CMEMgFTrXWfTu1bJ6ziM8
	2AVsT2UjTS/p1rgJnPcPGPuA3ToEfb2EwqmHoQJFVaB9B29H1iWcKcgsxLVDneBxMZYEEEwPSOgjn
	4XZAjW8lVEb3HwD1Xh5F9O36L5v3gf2QkVoMKJEdrIYEfspfQtIFk1g+u/hJ+7ke9ti4yd4RiWs99
	F6ijkm8cHwmMKq1R0/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWH92-0000000An01-40GZ;
	Wed, 25 Nov 2026 17:51:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWH8w-0000000AmyW-3WfR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:50:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D8A884E41780;
	Wed, 25 Nov 2026 17:50:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB43B60480;
	Wed, 25 Nov 2026 17:50:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13EC811E6B0AE;
	Wed, 25 Nov 2026 18:50:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BrrcnjzQvcqJiMXT1xilqkGsVrudJdiOVPDn3lvn36s=;
	b=T3yBgD7kNom/UC8jM/fqJ0PKNpxSkNWy6tbuEqzfZoVxS+CJpXNXszU8oP+OxAG+d3lwVK
	M0x7bLm5BNNwYnZHmfqRw2TPVPFf5uICtiW8KVAjcxwcUdpd3yEIbOkk2Jy6j2Mm/i+Ktd
	YT76oPZNaEzPIbUqsoURhquEcYgqaxs6B+PSZoV+et2/VZ3LUk/5QYgvnS9dbJpzmUDYpH
	ROPrzbUscL/jaoWLidsC0zHmJhBVo98+FPbATV1KaybKTfLNSFP5JcD+/DNLDmh19o4sHi
	Uf5hE7Fp18gA3VHn30honf1AxR1Wla+gIkfmEZ9RApzU1XkC1p3BfBNY55kulw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:14 +0100
Subject: [PATCH v4 01/32] drm/display: hdmi-cec-helper: use drmm_ prefix
 for drmm action
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-1-822722850492@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_095057_241796_C758B96E 
X-CRM114-Status: GOOD (  13.66  )
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


