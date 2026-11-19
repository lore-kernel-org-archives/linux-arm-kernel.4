Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6712606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 05:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gXwkyG7p;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cx1SiotZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vmmsCAmkFJPF5VXt86nWzLOnvQgS7sQpk97nCjyz42s=; b=gXwkyG7p43j/X2dn2abx2QdCXv
	AazTom2s7fHtcd/071KyOJ0uYk9GnB3baw0hktKTTaCWnEIqROb2H3Bz1h1P+glesIknH9Qi6sfZi
	YCW3jiCNeWrRHf88FaXdr7aeAw9RnUi504obF6y829Gk33L7uEoyYWmuSICONJrIUDaW4TyoY4xT2
	NEuVlyuqbF3waCIA9O/uFE5kvuq8T3tQx0H0KzmHXYbgKU8uWQdkYtJ4aJp3dMtyxCLgIy7FGfJCS
	cAoK9KMp2hYKlfDJpU/WaapnlwgsnxwItrHbZnXtt3ZL97/j/y83itY5u6RWCVQ3D8S56HCoOAIZB
	IsaPScLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTubN-0000000Asfl-2tZ0;
	Thu, 19 Nov 2026 05:22:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuah-0000000Arzx-1DVa;
	Thu, 19 Nov 2026 05:21:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12B3940BF9;
	Thu, 19 Nov 2026 05:21:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795065707;
	b=ku6wQ+46Kbh7rjeSmjKZQDS7jh90pnx99dANjtUEu/9+mkzrRRN/v4EtfdXALHXB1GBW
	 ejijsOy4fPAfRpokp0DPtOMJ/kihCaZ4JiHSrZdPGF1QRQ2YqTXKY8mlrLfs8lEHlsJV/
	 jGmHQR2Ut+fph0TmiYeYzMZND5anwMwowsSvnd9l+GP3lQMq19uHroy/tV8nQogHEdFzt
	 cBDTkvwGaN1hWF6kSF6yZ9hr5mQuHujUXnsCh8AOOaNC5Rpd9VDaLd3Ii73gP5VxQMGUQ
	 LLcPn+e+9anbc192ImS93PHuZMLMszPdsfQxh2yRwe3zO+R0jD4sFRbLYSljxC571ag==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795065707;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vmmsCAmkFJPF5VXt86nWzLOnvQgS7sQpk97nCjyz42s=;
	b=vPui3xgcPqk24k8CCad1gjf9VKVL+HaKLZ22IGg6yV11VRW80b1wydfioyfjxaYTMHmi
	 JRZAu6QLqtGxAqPKYPARzBV1EKkLW0zuevCPYSHj4QEsDTj1JGUAKHkFnOrnD+1BV3cWb
	 yJKrxDHnoNEFvdkqF21IdknsBLQy+7yUlauiJzi5iUh0tJmcylLOWRSRFbUUtdd3mOVMC
	 PQ++I6n6AvWzgJdTrMHyUBc7SNaobONMdCIufJMndCfmrQxe1TpxxfUI8mZNC240pRlRV
	 4phM3J7fRmchXo1oqIhVizmE1FR8s6Rx7oT1LoA0vmgSRDHU3RHoB34fnfSVvFc11RA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1CE11F000C5;
	Thu, 19 Nov 2026 05:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795065706;
	bh=vmmsCAmkFJPF5VXt86nWzLOnvQgS7sQpk97nCjyz42s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cx1SiotZbWSumq13MxnpkD8KXzy+VyzN2UfnZ00YSPX3uvuWK313L6wJXfryo0FOA
	 8kHaPEVWE1WQvlJuv1HWRi0bOv56WUyFoztjd0oKmqbmzLBF0Xg7j1X53tO2UvFeo7
	 H/CG9xLT0QcRdlMgySlnyocuN4WJzcEZuJURadtygIEeNfJ19vU1gSUsVlFTFGhkvX
	 lSkiF96NTNg/aLj47tKHFvfwRKPQq9rtt1mDzly3kGKjG8LGzVXWnrZXjTkpg4Vf7G
	 2aCP9trY88TLWlLS+qK0uA7sqn7ksqzCDlJ4QF/m9+G/bfb8FVi0ktMdQpv5pfSFMm
	 e0SLsJHRH+vQw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C8A894B10D;
	Thu, 19 Nov 2026 05:21:43 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 05:21:47 +0000
Subject: [PATCH v4 6/8] drm/rockchip: vop2: Find the first mixer of a video
 port with Esmart3 too
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-vop2-fixes-v4-6-4b8f5e7148c9@gmail.com>
References: <20261119-vop2-fixes-v4-0-4b8f5e7148c9@gmail.com>
In-Reply-To: <20261119-vop2-fixes-v4-0-4b8f5e7148c9@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Damon Ding <damon.ding@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065702; l=1927;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=65jy5ymajpG89k237tvRGcCxVl9Lytdo/uG5Ow0DDXs=;
 b=eavln/Szzu2kfv6EJn+f2yUSSyS0oEHYBNjqxRmhWRR/dAprw5iUYDy1WujlwSeTK+xNvx6ez
 rWN54Xr7MO7CsJooBXzdymCxHWAhNHwjRjYMqcM/IDF31l1DrduV844
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

vop2_find_start_mixer_id_for_vp() passes ROCKCHIP_VOP2_ESMART3, the
highest window id, as the bit count to for_each_set_bit(), so Esmart3
is never found and a video port whose bottom layer is Esmart3 programs
the mixers of other video ports.

Add ROCKCHIP_VOP2_MAX_LAYER_ID after the last window id and search up to
it.

Fixes: d3fe9aa49585 ("drm/rockchip: vop2: Use OVL_LAYER_SEL configuration instead of use win_mask calculate used layers")
Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 1 +
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index de325cc50c59..a1668d234b84 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -807,6 +807,7 @@ enum vop2_layer_phy_id {
 	ROCKCHIP_VOP2_CLUSTER3,
 	ROCKCHIP_VOP2_ESMART2,
 	ROCKCHIP_VOP2_ESMART3,
+	ROCKCHIP_VOP2_MAX_LAYER_ID,
 	ROCKCHIP_VOP2_PHY_ID_INVALID = -1,
 };
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 3a95d2f9516c..6927db8a592d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1881,7 +1881,7 @@ static int vop2_find_start_mixer_id_for_vp(struct vop2_video_port *vp)
 
 	for (i = 0; i < 31; i += 4) {
 		match = false;
-		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3) {
+		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_MAX_LAYER_ID) {
 			win = vop2_find_win_by_phys_id(vop2, phys_id);
 			if (win->data->layer_sel_id[vp->id] == ((layer_sel >> i) & 0xf)) {
 				match = true;

-- 
2.55.0



