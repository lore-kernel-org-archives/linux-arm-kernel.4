Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EC360A261D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NNk+SfPJ;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A7Kx9TT1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iHS1CP9tSXe3fyN73BGrE3K8GQSmYW6v05x00gz8hDQ=; b=NNk+SfPJFDbNQX
	aeYeDiiD9ldMGG/X4vWZTkxQ0XtmRvw2f2ThkaDHD71p53wh/1MghOmgkWegPgOA7cdc9nFN7HS23
	Tzel144TApeAusg4w/hReOZDgRYpWo1fdyygWA4SamIRqAHi/cnQOzyqOK7UZSsFgtHIRcDACHrRw
	ZLjG3xFw0kA8TH2OWZOsT9x+MCuJndgbQRYoBU03jC9LzSEeYVCl26bd06RqRySVmflbIqt38bQVL
	3OO9sN05gzgStF4B6y3v+rSc2UTMhymlCcpQPQz++bi2UQsz8/33KZ5yQSBCwgkQJfRT5aVF1F/Mu
	SdjFX7k+lTF3wQfuG2Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTisp-00000009arY-1Ed4;
	Wed, 18 Nov 2026 16:51:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTisd-00000009acg-2K4A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:51:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1B8BB1A16E2;
	Wed, 18 Nov 2026 16:51:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEFC35FE9B;
	Wed, 18 Nov 2026 16:51:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD33F11BC27C2;
	Wed, 18 Nov 2026 17:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iHS1CP9tSXe3fyN73BGrE3K8GQSmYW6v05x00gz8hDQ=;
	b=A7Kx9TT1tx1v7xnjVIVqScxdjU6vfofBonPi+8rfV09BF7rP5dVeHL9aQPpdOKQZ+fKCLM
	JBgraxfuQipCB9fgw5EdNhbp++9FwBmzSag++L5aGseLjVWj0KutbIRkjM7Y/Yid20bpck
	YUP28BT8jlNRXEdc3QG2VwtcnPCQaoNRGjLR+PkbjCtLvZW375ZUC3JCAZTIR7ARXv4GHO
	mM5Fe/DTX6Z8dC41rM0nZvHbPXwfTIGFi6u0BwFUAMTyC4/BWm1nOHVHbjwm8XFD5lr61u
	lTLviEri//6K68J7+qnwd0UM7LmW44m1PwJQ2gkgGTJKgfLhzIfzWGAYBDNKPg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:56 +0100
Subject: [PATCH RFC v3 13/31] drm/bridge: initialize chain_node list head
 on detach and attach errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-13-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_085131_793529_BBD75D04 
X-CRM114-Status: GOOD (  15.84  )
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

When a bridge is detached it is removed from the encoder bridge_chain list,
but the bridge::chain_node list head is not cleared. This is going to be
problematic with the upcoming hotplug bridge support because if a bridge is
detached from the encoder chain but not yet removed, when later detaching
it the encoder code may think it is still attached, thus trying to detach
it twice.

Avoid this by clearing the list head on detach, so there's a clear and
simple way to know when a bridge is not attached anymore.

Do the same in the error management code in drm_bridge_attach(), so that
chain_node is always empty [as in list_empty()] when it is not
(yet|anymore) in the bridge chain.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index f1a88c8c75af..d54245f3c4d3 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -664,7 +664,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->dev = NULL;
 	bridge->encoder = NULL;
 	mutex_lock(&encoder->bridge_chain_mutex);
-	list_del(&bridge->chain_node);
+	list_del_init(&bridge->chain_node);
 	mutex_unlock(&encoder->bridge_chain_mutex);
 
 	if (ret == -EPROBE_DEFER)
@@ -694,7 +694,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
 
-	list_del(&bridge->chain_node);
+	list_del_init(&bridge->chain_node);
 	bridge->dev = NULL;
 	drm_bridge_put(bridge);
 }

-- 
2.56.1


