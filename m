Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333AF60A2610
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LO55wUzv;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Wjyl9hRE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iAGzeSzQwFqFiRrdmKxP4pGyOW++Nadr+7x8PnEbmSQ=; b=LO55wUzvItBetf
	wwQ3YFC9CHAblsKY0O40cNz2LVnCQN99kZ6Tb192w6RnKSVWy2winI/IilH25b/9lQ0M7Gl8tZrij
	U58o74IJ1otwG6GYI5lQk54Lefmrtsz/cB25wlzXjewZe9PlteAFKyrXYiomd7akntG3kH0Fy1AQw
	XvwP9iwqAx6OSBX40vCJZ/sD0uEjw3ehDMP1YIL1sz/eXkYnc5Ep1nR8v1ACth2zLHhL+gQj0MXQ1
	Lg93q+Ok8DMTt8xMqvyrTQqiXwKTAwgKPcvqYW1BCkLVZDLP58OAKmIC8VjG426Cn9AWToXsdblSI
	jAQjd1XdWc1nP8uVOFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiva-00000009d9C-34N8;
	Wed, 18 Nov 2026 16:54:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiuL-00000009cSL-1UPS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:53:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B2E521A16CA;
	Wed, 18 Nov 2026 16:53:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B7A95FE9B;
	Wed, 18 Nov 2026 16:53:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69E0D11BC2904;
	Wed, 18 Nov 2026 17:53:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020789; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iAGzeSzQwFqFiRrdmKxP4pGyOW++Nadr+7x8PnEbmSQ=;
	b=Wjyl9hREMsVMqqx8rCv7E+eKTYNGdme+CXHkd+Ur19lrSkXoO2ThBhZcJ2lyIs8SzB/ENw
	5CDky1x7oVwGE+vZsdE0JmKyWqYkTOdrO7ZjjlylRmaqAiiM4FyWSkUnwGli7DTpA1tXkA
	MdS1BV8nhaBY8zBkX/9QSv3YHV9zL1Al4qsMERa3Mx2qBYpS0Bo1R9+Gu4j+jGFpjtAmAy
	JI/JxB37auZtFDTLLezPIFumutGvWlhvcSWViXkVFjRUtSELI9l/5pYHiGokcFYZq7bELg
	WJZX7xHCWRg2XqVzTL2ZC8pfGPTWPX3R674Me9Wy2T0vemWo4mVdLPVTKxFBYg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:12 +0100
Subject: [PATCH RFC v3 29/31] drm/bridge: shutdown encoder and detach
 downstream bridges on bridge unplug
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-29-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_085317_567111_46569514 
X-CRM114-Status: GOOD (  12.63  )
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

With the upcoming support for DRM bridge hot(un)plugging, bridges can be
removed at any time. When this happens, shutdown the affected pipeline
components and detach from the encoder chain the bridge being removed along
with all the following ones.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

changes in v3:
- do not shutdown the whole card
- adapt to use drm_bridge_detach_from()
---
 drivers/gpu/drm/drm_bridge.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index ea7ed2c3bece..0c2295c8137b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -29,6 +29,7 @@
 #include <linux/mutex.h>
 #include <linux/srcu.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_debugfs.h>
@@ -547,9 +548,17 @@ static void drm_bridge_detach_from(struct drm_bridge *bridge)
  * it won't be found by users via of_drm_find_and_get_bridge(), and add it
  * to the lingering bridge list, to keep track of it until its allocated
  * memory is eventually freed.
+ *
+ * If the bridge is currently attached, also shut down the encoder pipeline
+ * and detach this bridge and the following ones.
  */
 void drm_bridge_remove(struct drm_bridge *bridge)
 {
+	if (bridge->encoder) {
+		drm_atomic_shutdown_encoder(bridge->encoder);
+		drm_bridge_detach_from(bridge);
+	}
+
 	mutex_lock(&bridge_lock);
 	list_move_tail(&bridge->list, &bridge_lingering_list);
 	mutex_unlock(&bridge_lock);

-- 
2.56.1


