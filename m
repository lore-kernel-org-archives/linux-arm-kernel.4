Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F84606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3OAnxQwQ;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=StFTBzkR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=thbSUw+NcaRtFGaoeja3yb9hwk+SlE5nf7vvDS++nS0=; b=3OAnxQwQ7D1p8k
	8Kl8VS237Z0SNaZM3a0AEZAHZkjhq875rGOPol39GBi3YcYrzvEAe9Kvopm9uX5ujp8ohA4/E2eGm
	BVW3DfMBpVQXm/wq2UCvDiQbCD/5DcL6nYT1MCohDve5hKGxJenpiiFa/oFjHdZY4KIvaIMXyDHPb
	GJ717TkazC/0ZanquUxeAkW2R1QqceOKtjvQNvjl344PN0bTFLn4mS1EtjRhIi7Xp32vH+GtOz1ir
	gOG5cJTTKm2MHZzXIZbd+V2i1Dm8tW0jbZx3GSuIBi3j8eaMoCPuXeFF+S6n/VRfyiBkRIBZnkuPi
	y7091D98R43RNZ9RVWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyfb-0000000H23B-3kfK;
	Fri, 27 Nov 2026 16:19:31 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyfI-0000000H1us-24Bc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:19:21 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261127161907euoutp02076991c2feb07a6cd84063db95aa82cc~r80N6r8ch1147811478euoutp024
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 16:19:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261127161907euoutp02076991c2feb07a6cd84063db95aa82cc~r80N6r8ch1147811478euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795796347;
	bh=thbSUw+NcaRtFGaoeja3yb9hwk+SlE5nf7vvDS++nS0=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=StFTBzkRlAVWp/UM4q6Lini0xq6OON/zwmYpRdUCbm5EshkH2L8lNx7SHxsTtgO7n
	 /uaFrAurgBRZVNCI7DgYNkDd5KJP/QrZE0JYVHA1Exs0btO21MOIi+VdzmevgS46Z3
	 kB21Chccflvb6W/tAy9XY2PYgSn7gkr/NlGLY6Zg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261127161907eucas1p1686924e9c6528a60f5a0f030b39c8436~r80Nc2E1T2130921309eucas1p1e;
	Fri, 27 Nov 2026 16:19:07 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261127161906eusmtip22c9327cf774f99fe5c22a0bd78fe5c8e~r80MkHIWR3065730657eusmtip2a;
	Fri, 27 Nov 2026 16:19:06 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 27 Nov 2026 17:19:00 +0100
Subject: [PATCH 2/3] drm/bridge: inno-hdmi: Report hotplug through
 drm_bridge_hpd_notify()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-inno-hdmi-ddc-of-node-v1-2-465622e1b7ad@samsung.com>
In-Reply-To: <20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com>
To: Andy Yan <andyshrk@163.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jernej Skrabec
	<jernej.skrabec@gmail.com>,  Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,  Heiko Stuebner
	<heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Byron Stanoszek <gandalf@winds.org>, Dominique
	Belhachemi <db@domibel.de>,  Owen O'Hehir <oo.hehir@gmail.com>,  Michal
	Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4272;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=A6Cyc8hcvZ4kiVH7Xrz5DISwCd3hT38SbB8So07SO40=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWRzri239OPWv68eyj6ziG+6xC6N0Du8yn9EpG5u/fSlv
	OjU9msvO0pZGMQ4GGTFFFnObow2kvzH8LT8+ONfMHNYmUCGMHBxCsBEPt9k+Kcn/OyzvInAY14N
	k2Nzr37h3vlz9yJxubedMzReR2vYs3EzMnxPZX5+/Oa2CeGm5Wbi4UpRb7oOneL6ff3nblVNv8B
	nFzgB
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261127161907eucas1p1686924e9c6528a60f5a0f030b39c8436
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261127161907eucas1p1686924e9c6528a60f5a0f030b39c8436
X-EPHeader: CA
X-CMS-RootMailID: 20261127161907eucas1p1686924e9c6528a60f5a0f030b39c8436
References: <20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com>
	<CGME20261127161907eucas1p1686924e9c6528a60f5a0f030b39c8436@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_081913_877269_FEFCBD50 
X-CRM114-Status: GOOD (  21.23  )
X-Spam-Score: -2.8 (--)
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

inno_hdmi_irq() passes hdmi->bridge.dev to drm_helper_hpd_irq_event(),
which dereferences it in its first statement:

	if (!dev->mode_config.poll_enabled)

bridge.dev is assigned only by drm_bridge_attach(), but inno_hdmi_bind()
unmutes the hotplug interrupt in inno_hdmi_init_hw() and installs the
handler well before it attaches the bridge:

	inno_hdmi_init_hw(hdmi);		/* unmutes hotplug */
	devm_request_threaded_irq(...);		/* handler goes live */
	...
	hdmi->bridge.ddc = inno_hdmi_i2c_adapter(hdmi);
	devm_drm_bridge_add(dev, &hdmi->bridge);
	drm_bridge_attach(...);			/* bridge.dev set here */

The bridge is allocated by devm_drm_bridge_alloc(), which kzalloc()s it,
so bridge.dev is NULL for all of that window, and a hotplug event
arriving in it enters drm_helper_hpd_irq_event(NULL).

Before the conversion to a bridge the ordering was safe:
inno_hdmi_register() called drmm_connector_hdmi_init(), which set
connector.dev, before the interrupt was requested.

Report hotplug with drm_bridge_hpd_notify() instead. The bridge already
sets DRM_BRIDGE_OP_HPD, and the helper only calls into the connector
while HPD is enabled, under bridge->hpd_mutex, so it does not need
bridge.dev. Unlike a NULL check, it also stays safe against
drm_bridge_detach() if the interrupt outlives the component bind.

hpd_mutex is initialised by drm_bridge_add(), so request the interrupt
after devm_drm_bridge_add().

Fixes: 969325a2597e ("drm/rockchip: inno-hdmi: Convert to drm bridge")
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
This was patch 2 of the JH7110 display series up to v8, and the code is
unchanged from there.

Changes in v8 of that series, prompted by a Sashiko finding on v7
patch 8, "Split probe out of bind":
https://lore.kernel.org/all/sashiko-outbox-201623@kernel.org/
- Report hotplug through drm_bridge_hpd_notify() instead of checking
  bridge.dev, which also covers drm_bridge_detach() racing with the
  interrupt, and request the interrupt after devm_drm_bridge_add(),
  which initialises the HPD mutex. Heiko's Reviewed-by was dropped
  because the approach changed.
- Link: https://lore.kernel.org/all/20261124-jh7110-clean-send-v8-2-de92635dd857@samsung.com/

Changes in v6 of that series:
- Split out of "drm/bridge: inno-hdmi: Split probe out of bind" into
  its own patch (Heiko).
- Link: https://lore.kernel.org/all/20261029-jh7110-clean-send-v6-2-759594e43acf@samsung.com/

Tested on a VisionFive 2 with the display series applied: hotplug is
reported through the new path. The race itself has not been reproduced.
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 3bdcacf3cbc8427c8420eac9a37e3ecb79682414..bbc90ae9eaae04166d502c05fde52e126462b8be 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -929,7 +929,8 @@ static irqreturn_t inno_hdmi_irq(int irq, void *dev_id)
 {
 	struct inno_hdmi *hdmi = dev_id;
 
-	drm_helper_hpd_irq_event(hdmi->bridge.dev);
+	drm_bridge_hpd_notify(&hdmi->bridge,
+			      inno_hdmi_bridge_detect(&hdmi->bridge, NULL));
 
 	return IRQ_HANDLED;
 }
@@ -1104,12 +1105,6 @@ struct inno_hdmi *inno_hdmi_bind(struct device *dev,
 	if (irq < 0)
 		return ERR_PTR(irq);
 
-	ret = devm_request_threaded_irq(dev, irq, inno_hdmi_hardirq,
-					inno_hdmi_irq, IRQF_SHARED,
-					dev_name(dev), hdmi);
-	if (ret)
-		return ERR_PTR(ret);
-
 	hdmi->bridge.driver_private = hdmi;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
 			   DRM_BRIDGE_OP_EDID |
@@ -1129,6 +1124,16 @@ struct inno_hdmi *inno_hdmi_bind(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	/*
+	 * The hotplug handler takes the bridge's HPD mutex, which
+	 * drm_bridge_add() initialises, so request the interrupt only now.
+	 */
+	ret = devm_request_threaded_irq(dev, irq, inno_hdmi_hardirq,
+					inno_hdmi_irq, IRQF_SHARED,
+					dev_name(dev), hdmi);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ERR_PTR(ret);

-- 
2.34.1


