Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1902606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zHuwcTIO;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=bwuXd/Ez
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7itunjG2J42PnC7jSB4jhKO5BUVvNkVP3J0t/6cOCWw=; b=zHuwcTIOJUy87Y
	S9UQ1sG2vnM1ez6nmtlbfmJoGUuUYom7FAtY1TNV9i5bIkp0sfqo+r++ipWzJtcLb6JtBajEn/RWa
	7E0eA08guj2T/4S0xh7hthSCeDAfHAt+TSQZI6vUcjEgP3NdEc9fFtsI7ZYMF/T+vHhwfv1il4Fpl
	vEdz107hNaNVIztFgo/+lPA4kGa2rYG/N8+AV+lFzW3DDpIcNY6/gzA4w/TnQ8MvBFqhWZTQPNlLj
	2kiAjsbj2ffPR9rUv4dZ0Goyg1YvUrDebLyG9Bes63z2j82tHS7oOzQyewRk4orY72ttOjWWuGd7P
	O+IU5/qq4OdsGSI274Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9Wy-00000001GiP-2boP;
	Sun, 22 Nov 2026 15:31:04 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9Wu-00000001Ggm-0tsf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:31:04 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1494459f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361458; x=1795966258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7itunjG2J42PnC7jSB4jhKO5BUVvNkVP3J0t/6cOCWw=;
        b=bwuXd/EzapEjIlFRDRYpwNA7awBcdjFQI9veuK7Y+sZ82z0Q0cgbmtaDsRRd2VYYq2
         pnVhwbWkGkV5VSWUyjis9yKVDWPd48fHVqWW+xjAiDKlIfXNiSfz0B/bkVkzLyilb/Kx
         x8FOqgRmbjH9/v0oajNE2DMSfKolmAe41nTG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361458; x=1795966258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7itunjG2J42PnC7jSB4jhKO5BUVvNkVP3J0t/6cOCWw=;
        b=0XNqJKkLxzresNH+tsr2zhtKIe+07ItqHhLlemKdG3rFzrQ/AIooOfxtqh/m/ILHfV
         ckrBeQhtzFS5Vo9F8Cw85Mdp5ay29jbw0cjXXjp8XhFg55AyCVTN8ChqRDG+Sy4ANDs7
         8ij7umr/zmlSa6vvCZJzyfOIbCEn6tTjB9+JTi0S4fidKFIUeetMjCHF1wk2vnZORggK
         pU1w+jUY7/u2C22NSNBd6Mly7cDjVVTgP3B6Mx0l8jfDyDookOhsuOj8GXLCwgVF0He/
         g8xOeCKm7zbExG8tIFFvKMpKql1BpNlhUXJzwo6+I7mRdcmTEmLzo1yGXpeIPU9i7S3J
         Mwjw==
X-Forwarded-Encrypted: i=1; AL+hErF4pEpasePkOtwGlsStOeTsaGfwynapOlFLeirwXlZqX7jTbrBIfKiM4pseDDrdmeCxQ41q7Pj7ugDWHeHFNYMF@lists.infradead.org
X-Gm-Message-State: APuU4Z+FecMATHag4OM+JdpQA2m2lsvxpWH8bmNehqmjsMbN+dh4InoS
	V8khpTKUv+mH/IJ4JjczdBoAfJbztyRlGT3XE407geLSWUlQwkqZTUbGrhzXnnlJ9og=
X-Gm-Gg: AZFdTZcymYoRM/5h4mS94L/kcmQQBMVmijC4WhRROSAaYrZfbPqFtccsBH2lvBfG2+8
	laxP04HBYUQYVExClFSd8XNUIYtAbCv9/l82XimLwhKvCtgZBZ79a2QBeNIghZorYfPIkqDFN2a
	vKyci+RiWPKKCSGYwO3+Q5peUa4uW5O1vJ3HmJgtjbuWIssB2D0Nx0LJM7YdM0dd3S7aGiHPvaC
	m9DYKlY6WzF/Zv8X0Ufr+KxNFzVNwdtkrbm1YIASu8dEIL1fiMipsYTANKjQejSwXZMnaT/JKTO
	unWfNw+2xNXqD6aeOnAvK2jRNBk3skSeIOeVnlI/P+Ox6WvypWKlXrsS2gcZGq8bhHCAD7qtmXO
	1Cf10iKWYB0k/bLW/tP8AIBCjFz+INaPTmiPRBzlnwVxip+LRG/Rn9zyh0o690xYLjSJqD+g5of
	hbgpzvhvbqdnV3cWBTn3dm7mH6CZhZBkRZaVUaHq1S/cSQAgYfoNxd3hQDLRvo9fOZRi0msNXIW
	u5r0vKkGRINWfoahhCoIyTtdgX3B6+foVhu9qCF3BdWxKzaGWL6pLOwthPL+PoYEF4aZ9nEs4Kj
	2BKK4FamxV2BGVFPAx/UWGDEwN7BWmrPWk7Eg8/lk/K52IvPodgCIQJLk7VLuJs0JDDUpjE/oKc
	IrxYMDEoCk0oWj/+h5sXjiYIOrqjgQwF59vDYIwUIup8+/Bngyqnd2S2C0rqouKvTk/qy3Qug1K
	akUwlmts2FOLDxET9MyVao7CVTug==
X-Received: by 2002:a05:600c:64c8:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb8881de62mr177878065e9.25.1795361458330;
        Sun, 22 Nov 2026 07:30:58 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:30:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/8] drm/mxsfb: Use the bridge connector
Date: Sun, 22 Nov 2026 16:30:03 +0100
Message-ID: <20261122153032.2782768-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
References: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_073100_395975_E7F730A5 
X-CRM114-Status: GOOD (  17.55  )
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

The state readout of a connector is implemented by the bridge
connector helper. Use it, as the LCDIF driver already does, in place
of the connector each bridge creates on its own.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---
The bridges used with this driver have not been checked one by one
for DRM_BRIDGE_ATTACH_NO_CONNECTOR support.

 drivers/gpu/drm/mxsfb/Kconfig     |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 20 ++++++++++----------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 31db7a824a93..78e983b71ec0 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -15,6 +15,8 @@ config DRM_MXSFB
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  Choose this option if you have an LCDIF or eLCDIF LCD controller.
 	  Those devices are found in various i.MX SoC (including i.MX23,
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 641691fc92c8..038f5c896dcb 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -23,6 +23,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
@@ -118,7 +119,7 @@ static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
 static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_device *drm = mxsfb->drm;
-	struct drm_connector_list_iter iter;
+	struct drm_connector *connector;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 	int ret;
@@ -139,19 +140,18 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 	if (!bridge)
 		return -ENODEV;
 
-	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
 
-	mxsfb->bridge = bridge;
+	connector = drm_bridge_connector_init(drm, &mxsfb->encoder);
+	if (IS_ERR(connector))
+		return dev_err_probe(drm->dev, PTR_ERR(connector),
+				     "Failed to init bridge connector\n");
 
-	/*
-	 * Get hold of the connector. This is a bit of a hack, until the bridge
-	 * API gives us bus flags and formats.
-	 */
-	drm_connector_list_iter_begin(drm, &iter);
-	mxsfb->connector = drm_connector_list_iter_next(&iter);
-	drm_connector_list_iter_end(&iter);
+	mxsfb->bridge = bridge;
+	mxsfb->connector = connector;
 
 	return 0;
 }
-- 
2.43.0


