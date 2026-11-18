Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6F160A2620
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rx2Y5rK5;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pqNW5zsl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xMDGdQQqSK1PYacGJc8PKE4CVLn0Cepep5ypo7GFAAg=; b=rx2Y5rK5a1B2Et
	UfQOj++BP8pD2Ph74V1/6KNuVfqyncI03DQ7D0vX+Nr4UYLez4zjQDLl061lH01KEGLYC63WIwQ2e
	JGYrbKPrFPczyxK1msCATxsiB5ymWKrWGbtTOLh9ClNWf/kksW5A3+m0E0tN69+RGZl5SewgrUN9D
	mU6WA+qcW+9puApyoF9aI2cEUpp5pArlMmjqKBTjGCkVFn8YQ2LNnwuIASVjoPHaOwoTylSFp3XLz
	+4vOucLXCiuM+8XK894METq8enIn06PAk0zQ0BHB2UIKYKAdgFF8x1MyvP7QhN5xu0/09HNEV3hcg
	0aKXy9nJIWstq6JMbobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTisi-00000009ah5-3ctP;
	Wed, 18 Nov 2026 16:51:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTisB-00000009aF9-1uWM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:51:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8326CC4F77B;
	Wed, 18 Nov 2026 16:51:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9BA7B5FE9B;
	Wed, 18 Nov 2026 16:51:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BA6A11BC28AE;
	Wed, 18 Nov 2026 17:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020655; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xMDGdQQqSK1PYacGJc8PKE4CVLn0Cepep5ypo7GFAAg=;
	b=pqNW5zsl8ZQ5lcZuQt5/FjlGuooQvzkr9GHMqaOBYyJxRMuQI7bwN4mu0wambTvDRR3Heo
	J5mp/T8C2UV8k/9YPgh6fP1fI1VCqdBS9Ou9vKt/yEVeA0CJXw+VH/GY9xhbAYD9aJU0za
	54/APJSdXIGrmRHaO5uKGKVHt6YLB2liEmfJzgQTW7IhOrX2OPKvx7BvC/+lGO+Q1QNMZj
	nGa1zmbhMId5S5TejKF3Q7eoDx0Qr0NY1LzjzGCOUxJ3zhNrsagZHrBr3VSSfDAPh6zBEA
	qFvVQcuT7eoe8aLs0I5IJ64mWNSN7JUIQDk7DGPrrU1WJkd4sKehAYD7S2NIRg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:51 +0100
Subject: [PATCH RFC v3 08/31] drm/display: bridge-connector: hoist error
 management to common code
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-8-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_085106_662753_6AEB04C1 
X-CRM114-Status: GOOD (  10.01  )
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

In prepataion to add more error management code common to the HDMI and
non-HDMI branches, move error management to be common to both cases.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 19cacae617dc..f4a71801e8a3 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -1057,15 +1057,13 @@ drm_bridge_connector_initialize(struct drm_bridge_connector *bridge_connector,
 					       &drm_bridge_connector_funcs,
 					       &bridge_connector->hdmi_funcs,
 					       connector_type, ddc);
-		if (ret)
-			return ERR_PTR(ret);
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
-		if (ret)
-			return ERR_PTR(ret);
 	}
+	if (ret)
+		return ret;
 
 	if (bridge_connector->bridge_hdmi_audio ||
 	    bridge_connector->bridge_dp_audio) {

-- 
2.56.1


