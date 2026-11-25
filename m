Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C20606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XzuFYBmU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fGwy6mF5;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=F9Hoe0Jw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ASSBGT3kIF8HMn738GqJjgyGhYuB+a+EzuLMKqOT5K4=; b=XzuFYBmUfwtR28
	rYB6LT1kwhvxYuGu/bokSwbVWoyZt6ozUi6n+MM1Gw6UpiAPAdwPYL52hhVLb7ubm0wVbOKSHDFAf
	PNlI+O3cGQ2vekAoBVQCGxOlWxce9lpPGvWdzNNo7vNJ4VcueEiOBFdbeZMBjIF/Y7JaevjkBhgtl
	iDLKO6t7MXsXcyRPqR8DOqctVjxlpitkhof71TkouoIVtTYHmGkho/xdSACu+w0Jifjdm5AW5F3yj
	F5V71uuIqzxr8TgPZTyce0zgaHeUtKPObJ2HVkQLqdRI7QUjHbVp9Pxx8ivdh4XptGsDDnsl+S5Jq
	MROkZ97vxn1BSt8LPcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDH-0000000ArxU-1c7C;
	Wed, 25 Nov 2026 17:55:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHCJ-0000000Aqef-3PPU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ASSBGT3kIF8HMn738GqJjgyGhYuB+a+EzuLMKqOT5K4=; b=fGwy6mF5jziU3I7ti+0hQe+VHM
	nDsojVe6DjkJ7QXbqtdOSufJlUD0JpKzVnn2dI5wfpZG9GpplcPkT2q183nzfQ0Dtjya6LKyfTPRK
	gobZlFoB1rQodAM5plQ57LHKEkBYWrdcYDifA+bEWaeKVw7gsybnam8JEyboiCDYomrO24NMhRp03
	VoTQ0vk/vePnRolCYh5s9Lk3Um9D0saB27a3nVHfLR6L1SlthP6I60DRD+rYGwAAcJ6QQhnV9CMYl
	TyQXshSGdzlXSxpFejAC1SrxVrXEjrRFY1VuwHGoz00POgNzC+6QZ3ere3plFICVAK4uxO47mdc74
	x8rOV2Fg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHCD-00000002DXU-19R5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:54:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6F15D1A17FA;
	Wed, 25 Nov 2026 17:54:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A0A560480;
	Wed, 25 Nov 2026 17:54:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F75411E6B0CA;
	Wed, 25 Nov 2026 18:54:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ASSBGT3kIF8HMn738GqJjgyGhYuB+a+EzuLMKqOT5K4=;
	b=F9Hoe0Jwv0B7vRuPw5GL/CXXP7rOF26K3c+pz4ybkcxhJFMexZ1uMKkVD0yHjA69iVdEMu
	HcTQ9476ysHSYMoKov+0hyrFJ8uBcQb2miISO/TNyePjfNJHt/Pi7nTkCALWsWaOdXi0p7
	HKl4rgjoaLkiVNXPoM4rUzg6/GmVUH6453HSNAfqhjpFUZ52ISNxgDzUjvWLCKmVsrRttD
	4PBI4aGnZjFeLi7L00k+W/A7vW6KMvQu427r7EBk7HikO+4YaLYIRKnRc5IG3smCBAaDsC
	FEFdAomMS6nLgv7aSZlpM6CcoQjg/64SEooOaW1OabDxzecUrFnNjay852f3bQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:43 +0100
Subject: [PATCH v4 30/32] drm/bridge: shutdown encoder and detach
 downstream bridges on bridge unplug
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-30-822722850492@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_175418_857113_8FC4FF2D 
X-CRM114-Status: GOOD (  12.85  )
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
index d82e81b26ace..d942c776db1a 100644
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


