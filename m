Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A74060A260E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y1KrQptG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=glgTxyPW;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mvkFhNIM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zAeMH+m9bbuc4/9b5hVR3Zv1XPAgorcFNusL+dN/Jro=; b=Y1KrQptG/wucBw
	oa9GDopFc1JZkeGPEPaRF7aJFVDSgRT6SzD+ZO4wQ4qysvSwzmCRQCg4znIj4yi2F+PI97qyFk7/R
	YUukfyyvkZbdxuRy6ZpF2G/orAsOamoVUNKxeBWtaPHaO5RxbykG/54GkrCHlZodJAAUH9ENsqag5
	D0vxP94YfI5c3zi7cjVjjctLOG+SwXzEwJFwhbEWnmTDg8ZLO0G4fe9oUye1NiJKa5vtY4sLASClr
	zHA8Cpgc2x4otE/5+lzGquA5kk5FF2BcWckf/JSFK3qYM6GRV796D7UbEEZlm7SBr00K3mHxHicDT
	1TpbmQQ2dFVLfFkCWJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTius-00000009cfa-0xRN;
	Wed, 18 Nov 2026 16:53:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiuE-00000009cOK-1QkV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 16:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zAeMH+m9bbuc4/9b5hVR3Zv1XPAgorcFNusL+dN/Jro=; b=glgTxyPW46nwmTZD00ExBCnARv
	2f+9eJI3zi/2NCizK63CIy6Y7fCF8xzAeBjiA1DoPJ1v4u4gRtVM6dBxso4Dq/s/yKPel5azt4EE6
	pmoapm6eQveM7+4qV97dgv6iu5BErEzswzAokuU5dSgV88rnxIWGPxKo1goj9+0kMwqZIopqeOcEA
	NIH0mVoeL7WPScWyhKrBrGEZYbeNBfBpDmqurb4KDVteuFxBFCQwjCiIqBTx2gKZBdwRkSJvymjHb
	ln6NLaZ2qD0i4Kny/pOpvkY9vNUv3GjqqA+I0a2rakXbfVwqGs52aaX8wPW4mH/ypmuAwT2boI3W0
	qTR1x8Xg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiuB-0000000GIlx-0ZdV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:53:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 23D55C4F77E;
	Wed, 18 Nov 2026 16:53:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DE9A5FE9B;
	Wed, 18 Nov 2026 16:53:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C1C711BC28F7;
	Wed, 18 Nov 2026 17:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zAeMH+m9bbuc4/9b5hVR3Zv1XPAgorcFNusL+dN/Jro=;
	b=mvkFhNIMGZR8HN2aWke+n2DEjJ5DlPR9jmwQZCf8mnEOriEdPvaf4pgPLr3k+ARmb3bXS+
	sWPQI9K3PlVFaz+SqvNVho9YgBs9Ea/UFDlnzDmaDsdOX7Lqi7LmbnGqweVLvX5pmXomZB
	5QlIU7T51RRmcu4A5Xlv1XhdhLUVQ4/fvVDg/vfCv6G48yKY0DUHnIah/u/1CZL47xG8kl
	x7tLUvrjqnAxoz2k5Id6znYmdKOwDaZL6TkXj8i7tYOv1l8yjHwDe0bisHN/UQMpitk+n9
	3iGr+gZ7ydBEs4JhHAnvlkdCVKmkMMKLqt1FK83SFmenrytq3J5/1tZla+w0MQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:11 +0100
Subject: [PATCH RFC v3 28/31] drm/bridge: clear bridge->encoder on detach
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-28-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_165307_106439_021F6BDB 
X-CRM114-Status: GOOD (  11.31  )
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

Attaching a bridge to an encoder rightfully sets bridge->encoder to point
to the encoder. It also sets it to NULL in the error management path.

However drm_bridge_detach() does not set bridge->encoder to NULL.

This will create a potential NULL pointer dereference in a following commit
(part of when introducing DRM bridge hotplug) because drm_bridge_remove()
will have to detach bridges attached to an encoder, so it needs to use 'if
(bridge->encoder)' to know whether the bridge is attached to an
encoder. For this to work, the bridge->encoder pointer must NULL whenever
the bridge is not attached to an encoder.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Issue found by sashiko:
https://lore.kernel.org/all/20261001131425.A001E1F000FF@smtp.kernel.org/
---
 drivers/gpu/drm/drm_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index a29f3e60bb24..ea7ed2c3bece 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -736,6 +736,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	drm_hotplug_event_notifier_notify(DRM_BRIDGE_DETACHED, bridge);
 
 	bridge->dev = NULL;
+	bridge->encoder = NULL;
 	drm_bridge_put(bridge);
 }
 

-- 
2.56.1


