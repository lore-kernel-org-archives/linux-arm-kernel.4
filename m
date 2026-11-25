Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E0A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a2EsYYUG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UrOZVyr0;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ijorIaC8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NIAZ+/hyjnKqz1ePTzVck9yPvFyI0frACZa5EJ4HvJs=; b=a2EsYYUGEk3QFk
	a4HaEqOf37qaQGdRoTKPcxv3mzCOItmU/o1AbSMjvAETynOmWuIP5L8OP6xwzrypmhcd1tfl7ldwn
	BXr6epBTw5dtYo08kjiZqSV7TyCs0e6H1tFA/HDQ/Z1X91sCBeSzllMeJ1Z+FmqcRtqAohuvF5Qch
	D2vIGHr2AeRHsEevfd1pRVZwyimFqX/NjBBzm7sSide5M3C6ARRqtU5FCB80AjpduD8ZXe1xbf4EE
	0PErDSaGE1g7KwAX8RJaeELNEDvlukH7MKQbZdcnmorAyILt+L9AXQlRR+0g7iK3MwwKQdplwGOfW
	y0+5afgxhXJag5otjaUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDD-0000000AroO-1EcK;
	Wed, 25 Nov 2026 17:55:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHBr-0000000AqDd-3XRA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NIAZ+/hyjnKqz1ePTzVck9yPvFyI0frACZa5EJ4HvJs=; b=UrOZVyr0wIni9oXOEb5zNY+lno
	bEbdczDQIXAnHSR0iOm0NLumCKMGiVEBJdsOFT+/XPsrW+B/5IVuvDHu/ytw/sutBX0dXxsWqpMQy
	zQqRwvyHrw9xbUfCRzlcr1s4W9varJ2d5Hjb7kHq1uwt7LXL4v9SWcz+Pwgqb1q2OmBOaRIpY6JAQ
	RDmae7qtw+m6oAKVhjU+zEPtp6JEQPhXhXCsupN13feunOEnAMgjZb56BBTova6HB3M1mfiqbU2kc
	pAMURo0hfGk7+wDxfrwJmJumqwf2syRZwxl93w1ZNTl0XkpQUxrH7ycEeI69S5R3BaLuxIGcWWqJZ
	4sFOGkRw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHBn-00000005bt0-2pQC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:53:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B13A9C2B9C1;
	Wed, 25 Nov 2026 17:53:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BAEA760480;
	Wed, 25 Nov 2026 17:53:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA92711E6B0AE;
	Wed, 25 Nov 2026 18:53:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629228; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NIAZ+/hyjnKqz1ePTzVck9yPvFyI0frACZa5EJ4HvJs=;
	b=ijorIaC80piy8nLkF8pvbYYe0j9pW4Ix5gjoALw9yPoLWYROQQ26ax92390sWcsBR3xWhf
	yMSMObDdXYRtI2IP392NuPn5pJNSEgCWl0xQA0HfH5sqOcU/IgJwPYtyCr9mvA0R/vRCwG
	k97A7QGSjgGEKmyrO394T0L4ZCIIW07UGJtW4vssEwNskm5BsCOYVtcZOcQKpE8uqoSH5C
	BgZT/21/veBWnjPz6qq3KgGv5jkN44PJypNrgtgZWD4JSrGxY18qqkOBgyEWtvqaQcOGj6
	Iv/z5o5k3aqgBi6S6vD0jlxyVluZ0rqZNYG/QZcoUP+MViQ4yzp34P0btCGeKA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:38 +0100
Subject: [PATCH v4 25/32] drm/bridge: samsung-dsim: implement
 .get_next_bridge
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-25-822722850492@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_175351_688040_EBBADF96 
X-CRM114-Status: GOOD (  12.16  )
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

Add get_next_callback func to expose the next bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- add missing drm_bridge_get
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 480e568dd2c9..a00902871b79 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1821,6 +1821,13 @@ static void samsung_dsim_mode_set(struct drm_bridge *bridge,
 	drm_mode_copy(&dsi->mode, adjusted_mode);
 }
 
+static struct drm_bridge *samsung_dsim_get_next_bridge(struct drm_bridge *bridge)
+{
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+
+	return dsi->bridge.next_bridge ? drm_bridge_get(dsi->bridge.next_bridge) : ERR_PTR(-ENODEV);
+}
+
 static int samsung_dsim_attach(struct drm_bridge *bridge,
 			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
@@ -1832,6 +1839,7 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
+	.get_next_bridge		= samsung_dsim_get_next_bridge,
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state			= drm_atomic_helper_bridge_create_state,
@@ -2183,6 +2191,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+	dsi->bridge.ops = DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 
 	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)

-- 
2.56.1


