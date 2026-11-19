Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C569606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 05:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XnHL5385;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DTHKT/pA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t8OUTjcEA/bsDeIubO7Cit5FqjNzQshMSR9Mm0bmIeA=; b=XnHL5385quWhyezQ1hwEWrTvoS
	6mXZhMPoezeYz01TM8URGCnL6RN+qGVnsbrw00eBVarHEQrFp7/RXVLiFgjgtQbIPIUU9MnZYzO+j
	cyih0InuiFLDJWitiBcJbQKjJ+YrkhVMWYhcEgtEZSOfAzSXna3COTwDTAOJpdPelK4I1a3MwNlqN
	R764odZH8ajd9fcqWJSukTUssDXsDVP8TN2fbucWGMvwZ6T/LOyExSLeRV0PbCUmtalVbGO/tNLKo
	hcoNVbPplVb3LQrcTByls+hmHO9B2pbDkAOmeRSBWdrIhm5YKglB2r9LcSE3Vm1DDWtXzc50Btshd
	DQbE1CJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTubW-0000000AsnQ-0FN8;
	Thu, 19 Nov 2026 05:22:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuah-0000000Arzk-2G5F;
	Thu, 19 Nov 2026 05:21:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CA8F6236C;
	Thu, 19 Nov 2026 05:21:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795065706;
	b=zJxwKAN7XVllkVDU7Rzg/quiTZd9C5u693jw3MPRyV+bDpU1lx6YVkvhTNPQSZsBKN1o
	 zBNY4bEtJuLLj8tBwNKCMGdSxnNooIHmBWqWSB8oUP4KWCCfg7SneVYw5hD4dRAtG6X4a
	 blP+0iAec79QgqxqY/f+Vjvcd6ideH7XIo0mAyGyujdjvWeMdf0zC40iMjDccNCFCoP6W
	 qR7JV9InaZYBQYwSaQaTw8LXt8bA7e645v2/gDLahQITEPUxhrS0p/6r2iKar6lTWDvSb
	 JWk6780hRtpVoUSCW036YZpEa05fCzd/IQPB737pwjqhshRte/28QtrSsw8QeAqeLMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795065706;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=t8OUTjcEA/bsDeIubO7Cit5FqjNzQshMSR9Mm0bmIeA=;
	b=dVFZABO9df9DPnTviu0ceXELwBOrwTkmMY8Heb2HkOO6MV7Pb1dpLGqTa0Nl867Quyr2
	 sbtM2nB09TU/ye5qh0DqnjO45yjnPgCAKX9FN0fyer32wBfYfABmZlOxA3I7aAF28CYEf
	 /9sLBuzsAt7GnxQvK4JMsRZB21c06z1ptjX4CMLB+jBOxo8Dne9vm7qSuB7MHoh+I5Okd
	 81egcVArUhHeIoLQTYoIKceUsoy+OZiU0mj7i92NUg3b5y/j8qINPSgEkiz76HgTUFEs8
	 tHEolo1PPaaaLF26trYscONBqd2p9s6/z26lg285cKcdeIn0ssoj+EY27p5ujHR0V8Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 954131F000CE;
	Thu, 19 Nov 2026 05:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795065706;
	bh=t8OUTjcEA/bsDeIubO7Cit5FqjNzQshMSR9Mm0bmIeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DTHKT/pAbPwVqVNZC1HEa0crNxsDYWfOu0jolkvWa1aBG4/93Q2kpHdp7n8T+/Ja7
	 9B3AeaBRTJEwA6zEXjzjypEZ/B9gvT/hm9/fhFk5JzyDQqOKGJHEY0vUKfS2wzHCjT
	 hJB4MKrLQxMiy7RS6/zVuUUBOA/xRN6uAA1zxftB61TDpKipN3IixYjk6MLfuq4LRI
	 NDUsfCDjVyYrmQnGcXP21LLBTytZiMqi4Pe+vzFZFTsL7vo5cjaBQyxkC8JxdElwT8
	 pU0ZVh3VPWUdD0Yf51o6HYzKw2gJHh99KfTsCA0BHAawDRcfFPtGAQcOvJ1N3PISoS
	 x999LRzGdV4CA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E27004B111;
	Thu, 19 Nov 2026 05:21:43 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 05:21:48 +0000
Subject: [PATCH v4 7/8] drm/rockchip: vop2: Keep the other LUT_PORT_SEL
 fields on gamma LUT updates
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-vop2-fixes-v4-7-4b8f5e7148c9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065702; l=1431;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=3e27nsfR3kLioD20l/ktODt6iemFLIN5uuPeuYPl4xA=;
 b=mCPe/r/rGkvgWMHa2PkASfNke3mNliov89vNPYIHiCo4PxJZT2FoEDQbpcL9NWDgnvzvuXIzn
 PFJ0S95xfNyB63yJPNbjlLbS0pnd46K9t7DIKjSGv8bdaQOLsf9Edh+
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
index 1408b539c311..d4103e02f37f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1625,8 +1625,9 @@ static void vop2_crtc_atomic_set_gamma_seamless(struct vop2 *vop2,
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



