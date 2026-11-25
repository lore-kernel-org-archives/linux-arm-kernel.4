Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B771F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2R0Kf9JO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=T5a/ENfw;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=POhwRb1e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PcycRmA0N7JwWG8IrfXbNLId07ZHA9iVWljKGyKyKAA=; b=2R0Kf9JOPQHc73
	mqEUYr2gXclKqva+AMxCFT6SSvHSXK6xatNxE9jng4GeTpxdlyTL8XbWJftIE53FZoHVlTChBC+tw
	fTUiJFwUsxe2d1r3v596eREHMWHlqe4ak/D1+lV5MqhMa915y+jfsBfwo/+Y8s73NzhSb3RafrgWl
	q+m5aSDizvQlkERalZrLxDrdi4p9/f94b3p3cOMOy/ywQ3BkPmbhHxFo/QdeCGhcfqQdcWvSB/Kbe
	iaHlVP9h7yC3/RA+QaQHXxfvjlro4KIqIT7/MsIboMxINQuo1wXQH2Mu2Mbg4hGr3sCCRlP+H6jbG
	7vCoXdKiMH94DaVaATvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDB-0000000ArkU-1clf;
	Wed, 25 Nov 2026 17:55:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHBl-0000000Aq4q-3atT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=PcycRmA0N7JwWG8IrfXbNLId07ZHA9iVWljKGyKyKAA=; b=T5a/ENfwX/tx097zlFBQF8Jzyu
	TSClYQ1Xp88Zo4IvUqFUBZKK5+Pq19JlebylZ7ZZPLKe6MP26uahhRwI47jGFcHTc82f/K5QkUK++
	s4mtlLeB9I+ZFNrMaS38yEIvzfHynrQtJo4k80AjkFQYSdX1xnnYl1A5dGhvNhFMar8H+xXh+M044
	DK9aQFy4YdwA4Krbd2aWXA/+/86Q9lBnHdxGrA5PXJ9dL0Mtf0bqp+vKhgrJOaaUyH1Cs56ZapyP+
	+CetnclAQSqefEgwa4ISyZJe+X/WTI43PUZqzpwVuv843cB04qD6XxBjbwYaxPcPbAHcGfbR/74Xb
	kYh1YY6Q==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHBT-00000002CTt-2pNd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:53:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5F0A94E41785;
	Wed, 25 Nov 2026 17:53:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 333BF60480;
	Wed, 25 Nov 2026 17:53:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00CAA11E6B0CB;
	Wed, 25 Nov 2026 18:53:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PcycRmA0N7JwWG8IrfXbNLId07ZHA9iVWljKGyKyKAA=;
	b=POhwRb1eHes0UPhuLBIQuwdpoNuJavA36m1+2PdC8kia1ma5zuNDKFYEzQUwbiYVEeSf08
	ROvKL0RydcKTC5S4Rpo0ul869yzKyQvz0cDiM6byNUYbgNgwNIfZHNlCxz8Yg6FSYSUB+h
	hOuAcIsXxgAe9Q0YudCZtqJXf/d/VCXzRMohdEVeYSBtu3rTX/VhBNLk/RqXlnY4KfFHB8
	mTedU878nFVuIh+oehu/q6yMcODOcR5lWsSU+F0mpMUQF5WdY0Q8GaSS0efIRRzzYLL9If
	v864IOAovyiSRCr0Pt2WjQm+09iqy+nRzsAPAk5TvwAfnHNb0DH2FNSrLplgHQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:35 +0100
Subject: [PATCH v4 22/32] drm/bridge: display-connector: implement
 .get_next_bridge
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-22-822722850492@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_175332_876197_BA9DE359 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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
 drivers/gpu/drm/bridge/display-connector.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index eb3412ec30a0..8b16ad89c7f1 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -36,6 +36,11 @@ to_display_connector(struct drm_bridge *bridge)
 	return container_of(bridge, struct display_connector, bridge);
 }
 
+static struct drm_bridge *display_connector_get_next_bridge(struct drm_bridge *bridge)
+{
+	return NULL;
+}
+
 static int display_connector_attach(struct drm_bridge *bridge,
 				    struct drm_encoder *encoder,
 				    enum drm_bridge_attach_flags flags)
@@ -214,6 +219,7 @@ static u32 *display_connector_get_input_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs display_connector_bridge_funcs = {
+	.get_next_bridge = display_connector_get_next_bridge,
 	.attach = display_connector_attach,
 	.destroy = display_connector_destroy,
 	.detect = display_connector_bridge_detect,
@@ -412,6 +418,7 @@ static int display_connector_probe(struct platform_device *pdev)
 
 	conn->bridge.of_node = pdev->dev.of_node;
 
+	conn->bridge.ops = DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 	if (conn->bridge.ddc)
 		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
 				 |  DRM_BRIDGE_OP_DETECT;

-- 
2.56.1


