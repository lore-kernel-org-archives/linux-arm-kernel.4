Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEF3606C82B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ppnij2OO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JeuSwk5S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zw+frS1U/oJIoV7oqdbavUJYx/5VdFVnuw73RpCkb6s=; b=ppnij2OOTVcgz4U2KBbJIpaSoq
	ABqj3HmlWDWI4DOcWiPu2iq8BoZsibdzPAhH3Qpv21Z1CGFl9MT6Vx89gLOOIvkoCVlO9u4gcYE7L
	8owFY3Ff5LG9v2VEowqO2neC+U2xJNbDwRxGp+mkOahdpGqpz1H7qvbunvyO5/RPvj1IntnlEXTHv
	/pwIXC2n0YdagNl4mT66zcXdW1mLcURyv1K6T5tvPRqSMceW3RkZ00B0/d8gRPH599oAvGnvoeb0T
	ePQVXmRhi/0LyBLgpUN68eM7njZp9d9s47hrVO9/b+H2oLJqFq3Hcc6xbrtHvO7Tx6TOMf1eT4NgS
	4hD6xP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQHC-000000099TD-1YOy;
	Thu, 12 Nov 2026 08:35:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQF3-000000098QA-49F8;
	Thu, 12 Nov 2026 08:33:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC3424792E;
	Thu, 12 Nov 2026 08:33:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472389;
	b=MS9d1oOl2/EiUmeQ3BhehXnFUvcQDxa0B4rFYeYUMONptKbwR4+8oNjLHzDtRlJOGQQK
	 DFrA2TPHvi64MaAttRtz3bhos2wRT6OOgUmYmGMSvwU2CK5Y1ISAjRn8eddljdc/kZqDD
	 P+SVZn6x4yTZ6hp8NucOVGmVJ9mafmV+crpT8xficDI9bX5StMg9hc1UX++b5sGnPMMex
	 EWtH1uKe1ZBFmP6Yt/4yr3Oznfs2wz5AB+cUJWUPusoPSajGHjeOWXC2UXxy5bWWkuoQV
	 ctHzzJLFiO6gFiKwUvVn5Za/I0s747SA6wJqKqMtVLhuwwJiYK9nEZCJGNMrDDlxR9A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472389;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Zw+frS1U/oJIoV7oqdbavUJYx/5VdFVnuw73RpCkb6s=;
	b=anJfB9wVYHgmOA6RFPFUVwFrkGz+/MHxG54oQjf1syuNuLu+vCR3yc0XOfLylJW1/gr0
	 YpMgqA3UZMhSnGOB7NqiedZwsGJzOuphGh14Kq0rMj39R4v76E7n51y1qvk0BE+W+dNQH
	 cXYG5xqiisQSxSVc64a6K8Rs31GkkX4fi9objpnx/t2evFskjnwm7nJQC94kZ7QDnlPLE
	 loAPSfdl/fhYKqcUyObpBAuyh9eRTygaugBt/wOxWDPwRga47h9UJhSfCOwxXAppcCz/G
	 T8UdOaKWueeey+v7crau1XXMIvz6/dMP3pA2Bdz5o4s6s9VfAKEjhf3DKR4o41A0wTw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF0341F00A07;
	Thu, 12 Nov 2026 08:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472389;
	bh=Zw+frS1U/oJIoV7oqdbavUJYx/5VdFVnuw73RpCkb6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JeuSwk5SWgOzigEFivYix4K0wtojE88ZB294yBnzs02Xuh8UpJPjFYinOZnThp3Ys
	 sCI+rAqBedXxSOAWS91T4AsSWYFREm4WM8HDl8zo7IZp3cUFfNhmJvR0QpjITnQqcW
	 Ub9yIhA+uY85Hq4lVlu8XhyG1U2n3765usIj2cskwDvQtivkCj0uWaFsGvHGwWyyG3
	 wAqkoJBpS87F/HCg7LfiKjFIYbQuyB/sLmjHRKKNdAmILRLRqXj71QT+H4b+pZ+eu4
	 TdXBwWv7Xz6YEy4PKxpoS0ZCvgNI9zDtSseAzCDP9l3a14o4LyZVTAjQ1IS6k7vxdz
	 HZ5MNVk1CEfsw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C7057493BE;
	Thu, 12 Nov 2026 08:33:06 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:33:11 +0000
Subject: [PATCH v2 7/9] drm/rockchip: vop2: Find the first mixer of a video
 port with Esmart3 too
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-vop2-fixes-v2-7-8218c1cf8ac8@gmail.com>
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
In-Reply-To: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472385; l=2016;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=XuhTBwXc6OuQQ9kwuxgdwauJ6jcO4D6ro+WdnRqi4fQ=;
 b=18nBynrhRwhtGRC6mxBqGiMn2xlhq/tEdUkOMoV9Rv7z5FSChLqmiNez7wtf+BZIPo37LbFKO
 z2y4vYhk9o4BVKCOejcIHO/Ziq6t6xRgVO3EG6lnE9/VXe6qWMBIU7p
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

vop2_find_start_mixer_id_for_vp() looks for the first layer that holds a
window of the video port, but for_each_set_bit() takes the number of bits
to search, and ROCKCHIP_VOP2_ESMART3 is the highest window id, so Esmart3
is never found. A video port whose bottom layer shows Esmart3 then starts
its alpha setup at the mixer of a higher layer, or, if Esmart3 is its
only window, past all layers, and programs mixers of other video ports.

Add ROCKCHIP_VOP2_MAX_LAYER_ID after the last window id and search up to
it.

Fixes: d3fe9aa49585 ("drm/rockchip: vop2: Use OVL_LAYER_SEL configuration instead of use win_mask calculate used layers")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 1 +
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index ccbfbdb8d246..290990632388 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -857,6 +857,7 @@ enum vop2_layer_phy_id {
 	ROCKCHIP_VOP2_CLUSTER3,
 	ROCKCHIP_VOP2_ESMART2,
 	ROCKCHIP_VOP2_ESMART3,
+	ROCKCHIP_VOP2_MAX_LAYER_ID,
 	ROCKCHIP_VOP2_PHY_ID_INVALID = -1,
 };
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 83203d18865b..088c1f3a972f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1889,7 +1889,7 @@ static int vop2_find_start_mixer_id_for_vp(struct vop2_video_port *vp)
 
 	for (i = 0; i < 31; i += 4) {
 		match = false;
-		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3) {
+		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_MAX_LAYER_ID) {
 			win = vop2_find_win_by_phys_id(vop2, phys_id);
 			if (win->data->layer_sel_id[vp->id] == ((layer_sel >> i) & 0xf)) {
 				match = true;

-- 
2.55.0



