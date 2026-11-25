Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A849606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2YgPRyuD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FL2cZe6n;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nGhmE+SH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uVOZcTNesWkxQue4smQ34ukC/TjgYibdayPA5A159MA=; b=2YgPRyuDlrk5PT
	pYvv5ez4wQyrv+mLxDLA7kl6LwUunxTczdRdPywA5O4QSjD/gWmLJwXU2k7j+/jw7CaFlgd+pRuPH
	miaYgXRsETXTwmPlKNRncT7QsY0WBb72FH39dZVuAuVIJokS61sfMfNf3HQLEqrzS3lqNDwT16B3D
	QqNQ6OG+PrdGks4nsLta+8H8J87+dAnyMk0WJZvKpIpt2QYr3XT1mOy0WrbIEbvLD+8yiSACq0P/T
	Z8adQgFWMGzVTLj6xOYmAU6MPNeBWPWj6ijYfFkxEavLxOarIIjoeJi36iHEnvxniRhpcz4WuSfvn
	Sv3S9rg3UpyffB4+IMFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDG-0000000Arwl-3gJZ;
	Wed, 25 Nov 2026 17:55:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHCE-0000000AqYb-3MFK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uVOZcTNesWkxQue4smQ34ukC/TjgYibdayPA5A159MA=; b=FL2cZe6nsAk6JllI56MezTSuoC
	QsChdUzXw1dYlyM53NkwL10eELDk8KUa0Sc+WOUJyaIb9BhvHbWyOVPpNVE/aUGm0i/HpP421AG9B
	zR9ogKy50PfcuJdURberwME9b5oH5RsLJPFGrVCk73u3ph2Wg+/as/NZXxiYGBFUusiwhoSJC59fF
	VQuvCpnPFunUstngHsfgrOXQvwOfENafvk/zuokhjpqP/WjBoeTCFFGX5xUy23N0RGJ+ggWMwyjIT
	FNBryyzhhn/OKq6rvGatSmzC0X2Snk97WN5YyOtONLipm9XEDwr9BhFiO22+9BE7zacVASbQM55SV
	rTZ8vXpA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHC7-00000005c2i-2CO5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:54:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8C17F1A1803;
	Wed, 25 Nov 2026 17:54:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6109360480;
	Wed, 25 Nov 2026 17:54:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CEFA11E6B0AE;
	Wed, 25 Nov 2026 18:54:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629248; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uVOZcTNesWkxQue4smQ34ukC/TjgYibdayPA5A159MA=;
	b=nGhmE+SHu6Q6Yt6/Cq67MPgFEVQCPrG5iVyfi0K+Izo1bSo6FZVQKFWDro9im1XRLi8hkk
	jcpo35BEFslgmciJ0IPO+k/Qobg3K+W2ua5BtqtsCBKIrO6yVuHmTe7PvVgPuRygwcs8g0
	lgZrWdygCcCoBbI0bjRBtqr8j/f9L/+M+M6UYjagzIz9AOwRHLKDvoaaVjNAxgmdqOotkf
	v5uWMKmgwYzkdCPPgUZGSQOQ5uo+z49OjNQU6mPorVNBjb/AnEx8W4SBCO5jZu4Oxmz1/W
	0GwTUDc3q2dXB2VTMHoAvNZ6ZwKU1lXeDYjy52EnnfK6HbUdH7ylqy8OqIyF5w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:42 +0100
Subject: [PATCH v4 29/32] drm/bridge: clear bridge->encoder on detach
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-29-822722850492@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_175411_589234_188ED9B0 
X-CRM114-Status: GOOD (  11.86  )
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
index c00d5276e55b..d82e81b26ace 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -751,6 +751,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	drm_hotplug_event_notifier_notify(DRM_BRIDGE_DETACHED, bridge);
 
 	bridge->dev = NULL;
+	bridge->encoder = NULL;
 	drm_bridge_put(bridge);
 }
 

-- 
2.56.1


