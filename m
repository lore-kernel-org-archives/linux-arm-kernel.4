Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F74660A263B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r14JYpkJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OQsol5aN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RxSPduDOiaRwH24FYN3D1kk/0l8Fy9fc2Bjq8nF2JJA=; b=r14JYpkJSQvSauO5i4AdPI+Qtp
	7cgjRpsHR8ZZGP3uu1x1sFS0C1tucLhb668bG2MjTzD+Yp3qK2s5vI06o8olFuguGGgZbWjNiAQ1v
	U1zpctNqpByd4BbTp6cvyDFhuNnYvp9dJQsMY+X35L3EjPV7o47NqE8ULLBRt2IoTNQZ6O7NJE/2L
	NQdSVbDB9FKdzdGX8oa3O5aXqLkY9Xv0DCW12IFso+1A0sYIXqOnaTmTH5as1Rx3yd/XV9sWERLtP
	n9aNSMK0pGhu1gHqtqQ4yX3O3cTZpPoQz8lA8BWf+WegUezP2nJjl49p8zs4F3dgC4KZG1WPz9ikS
	HnvwQVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuK0-0000000DaWJ-1NTZ;
	Fri, 13 Nov 2026 16:40:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuJ8-0000000DZgE-1xW2;
	Fri, 13 Nov 2026 16:39:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DA87C6291E;
	Fri, 13 Nov 2026 16:39:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587961;
	b=s86bV+Cac68hQ5HU3g3kkJogOc9ApZxwIKaNr/TfCCOdel8LVUfx9xklEvUk3aS/kv28
	 qS/28upT6juVQsja8Q4HlsYwITN9CEcSbNBiubWrOwxybC6AiGPxeTxyZnmbfLVvFfRip
	 rZgkTJoe2oQUr18H1jHyayyxY7Z4FH/54PMQMz0fXfbt/90+LsL54DzMduv0jqLTl0axs
	 Q7UNCOZ9GBp6xTx/5YK8icm7KIbLBDPzps3bnk4TVn77udqpx0XqMdzcrZCE32x3gESkM
	 6jJvOvhxi2EHX3hO+uCGEMxSDAvc/qWflKjudT2TnAwvDNQwuA332vxFb3Y5y0D8icw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587961;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RxSPduDOiaRwH24FYN3D1kk/0l8Fy9fc2Bjq8nF2JJA=;
	b=nrgiCt5cWIRULFpL7k0JynE/7dvmviMV1gSFZlKgpBMFgf80k8IrVlVLmc0vdt59q/j4
	 bMOpOB6C3h0BgBphhne7WbOEwMkpETe89toteaRKqntDpChxhuTw8IGTXok2p88jlO9YI
	 ZICRWLcv8azxler3muGcQN/CxT4bFHM6vkMvA2YuRAap5xcJTqkI59+rJZkUXZhRYAk/m
	 QSIDSD/3e5qMVhWBC1jjuyCb1Ie9oOxSu6GA7yGZS84cL1ejeeB0jfJIkAM/tnjhRzJKi
	 M81HYgfEmXzMP6TFb++iJvN8KbXXdopFSFcvJwyU6VgnA8LDrXu/qX5vmcn3atgLj4g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76FC11F000CB;
	Fri, 13 Nov 2026 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587961;
	bh=RxSPduDOiaRwH24FYN3D1kk/0l8Fy9fc2Bjq8nF2JJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OQsol5aNf1uXX2dUm8oO4jIhguMpZgV7cjjtG/1G505aWLHoqCVH2b5zJ3PT9jxPf
	 4wEPe5NoIZcgZxOfRUdRb8uptBHi0AGAKSACICX9GVrRLE4mLXtFwrAhaJo8HFwroH
	 rthyGICias9U/oFZ3J2Cok3d014ZNQjfBX6xZ1CBa++nQPuKFyS06b0PxWLfOWv8xI
	 bW970A9iHrPRGf4q7fNNLDbjbOM1Y7f0FU4WhB/HNNdyFD9Ive6zrIxJNFtCSc0VI1
	 5v062EnVuY+tKdDWtkQqzVL8JlB+17hnJgGcnCPvN+6qfv54d0QZl/1RWZYC3lGEkn
	 KjPx8ZDAP0Kag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 15606499C9;
	Fri, 13 Nov 2026 16:39:19 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:39:24 +0000
Subject: [PATCH v3 7/8] drm/rockchip: vop2: Keep the other LUT_PORT_SEL
 fields on gamma LUT updates
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-vop2-fixes-v3-7-08ae37e83b5c@gmail.com>
References: <20261113-vop2-fixes-v3-0-08ae37e83b5c@gmail.com>
In-Reply-To: <20261113-vop2-fixes-v3-0-08ae37e83b5c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587957; l=1431;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=SkwWlNjcbiIUimcs4iIv+zOxIFtUHq1H2Qpz0WkqgFg=;
 b=AlThRHuxtJ9AiM2MPRZ+nBKGtidmigRvebqlaSPq5n1dGKgsE42ZiGxgJl2H9b6Hrc7i4+swD
 IMiRbZMjpl1Cnxa7fWQBbBXWWE3QuOPZ9fwYGe7VBsAWdq8lYqTo5ee
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

On RK3588 the gamma LUT update writes the whole LUT_PORT_SEL register to
select the write port, which clears the dclk source selection of video
ports 0 and 2 and the VP0/VP1 merge enable held in the same register.

Only update the write select field.

Fixes: 4f537776340d ("rockchip/drm: vop2: add support for gamma LUT")
Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index de3da292b05a..0c300279399a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1621,8 +1621,9 @@ static void vop2_crtc_atomic_set_gamma_seamless(struct vop2 *vop2,
 						struct vop2_video_port *vp,
 						struct drm_crtc *crtc)
 {
-	vop2_writel(vop2, RK3568_LUT_PORT_SEL,
-		    FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
+	regmap_update_bits(vop2->map, RK3568_LUT_PORT_SEL,
+			   RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
+			   FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
 	vop2_vp_dsp_lut_enable(vp);
 	vop2_crtc_write_gamma_lut(vop2, crtc);
 	vop2_vp_dsp_lut_update_enable(vp);

-- 
2.55.0



