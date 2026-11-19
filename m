Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100FA606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 05:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1aeJ7LgK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=astNp3gr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A/N4Va6GTxIaxciIAUqKko3R3j2OxhnaENL34pkh6n8=; b=1aeJ7LgKflPezy5YR/MSTDPMPc
	7OQWpPbijHHF1eNjMDpjBjdQXrwROnnp/6GSBARe6Icn1VqwfPqebQRQrCCWmBzQVb0B55z9RkO7R
	F7BD3wNn1LQj/EPidwwwObw+YinTCVs9R5Hr5Udpi9mCM5AEZ4n+VGh7Eg4WrC6XS+wAYptVloAeO
	sxe6H0N9PTRtzP7lmVsvvSifKdsHCfaqaeEVlxmc4vUPWCk+etXd6ZghkZVjmnL5gC12iiywtRT8o
	eYjkRHfcDERNzk9m6vALPKN9jyohW+PC5P/QCwBUjlNWjwpGrdUVum2T9/LkSYaprHWbpvE18c2kD
	NrnSZ42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTub0-0000000AsGm-1ct0;
	Thu, 19 Nov 2026 05:22:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuag-0000000Arys-1fR1;
	Thu, 19 Nov 2026 05:21:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DA7E62133;
	Thu, 19 Nov 2026 05:21:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795065705;
	b=TlDK4wPEWdoP48QPDgEKNNbJPnBUz6Snt2LH9KryitpbmQCccOsz8HLYRyIphLH8qf3X
	 CwRczhITTBHdc0jwSLfReQyhkuWJod3jzu8cfDpQf47AZAbl9KWuxVsh4gxepmgtBcZyn
	 PXVrY8T+TXP0/LIISxuci9ocCHh3h70+PvROeZch707sljQruFtllb2DX32NlIEolpykH
	 022j18N0a/HC9Doh5UH2hXC/l0FKUSVHehCwxDafJio9Vev0DPYhDOIjanAJPiVM9e251
	 1k0SmMvBjzaW6qUKpA/oJlEUUu27nEEdLYqf2DPguS24QVictgqz7QbJ5hrVpwZ0AKw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795065705;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=A/N4Va6GTxIaxciIAUqKko3R3j2OxhnaENL34pkh6n8=;
	b=rnAzObXwDfACSd9hh7eiofkW4dsYe+k/Dx/fQUvIpJp4gtQPsFKZoWdz6QK7pNo8sniD
	 XshXrseVmIiO0Nz66OVtt8ipbOHvMDK+p6TcOKGAPPihbDb7kxu2jgrcYedOG99sfxY0F
	 6V2ZDpWwlxPugzeQtTVjk3vHsf9WGTbCT2y0H309spA2ueWxTHkKVDB6OS5vSO3js8U1I
	 GC5zMkP5Oz+rUK44wVo1bmmq/KSUHsZagoi7iu7TFLeCxXrpMqU61Hz/8Rhn113wsdJxQ
	 RIy20ai1dSIIv/cmCQjSlas85/braOxbZnGz+aMsOSDuGucMM3pFsqwqseC6LNW7MlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19B711F000CC;
	Thu, 19 Nov 2026 05:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795065705;
	bh=A/N4Va6GTxIaxciIAUqKko3R3j2OxhnaENL34pkh6n8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=astNp3gr5OuvTjB7bByj01s2ZrXEGgUEzdumbAjB4PgYpMN1dHvAwlvJHDAc2B26I
	 jCvp7q/u1EhTEFI4pNz2tIGLaVIfxS+J5MU3DbQnhGXlsmicKvpuSJ6Al6DGaGZxkK
	 wZ+rSKGiq4q9hjX+BcNcG/4N9vhuN23+stp/ksRT59Zr1pkhTgoIFiEsvDR4MRgIGA
	 M/9WWH8AK403lB2dRxDjUeNaVytC2sYsXUrcYzlzotHUovZDDbfYQtDTyLdHMab0+d
	 VA25GA1tKgobIJEW0gtmgnPiteYLHXriCH2qF34J44qkQV5zxd+kJU+7L0XJQjnYAu
	 OsFePuYhrVbZQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 96DEA4B105;
	Thu, 19 Nov 2026 05:21:43 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 05:21:45 +0000
Subject: [PATCH v4 4/8] drm/rockchip: vop2: Fix the HDMI sync polarity bit
 order on RK3588
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-vop2-fixes-v4-4-4b8f5e7148c9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065702; l=2035;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=W7Y7lBtSYyb5btdgg00p53tpUWo/IcKqgTwt/QaaHdI=;
 b=6zCU085P42dAkMTaUg8+8x+PxI1IfDUTstuxRy0xEGgPcmHR5aSXyqMnF8djt7DxYPoFq7JYd
 4m2CMZOuOC8C3EuXpg98b82MeALeTSuWNvqEz1FIS2pFWHg+ujpeeQn
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

In GRF_VO1_CON0 the HDMI vsync polarity bit comes before the hsync one
(bits 5 and 6 for HDMI0, 7 and 8 for HDMI1), but rk3588_get_hdmi_pol()
puts hsync first. Modes with mixed sync polarities go out with both
syncs inverted: the HDMI controller sees 1920x1080@144 +HSync -VSync
as -HSync +VSync in VIDEO_INTERFACE_STATUS0.

Swap them and name the bits.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 2 ++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 1c2d7d97a6c2..de325cc50c59 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -409,6 +409,8 @@ enum dst_factor_mode {
 #define RK3588_GRF_SOC_CON1			0x0304
 #define RK3588_GRF_VOP_CON2			0x08
 #define RK3588_GRF_VO1_CON0			0x00
+#define RK3588_HDMI_VSYNC_INVERT		BIT(0)
+#define RK3588_HDMI_HSYNC_INVERT		BIT(1)
 
 /* System registers definition */
 #define RK3568_REG_CFG_DONE			0x000
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 3e654cb99ddf..3a95d2f9516c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1683,13 +1683,12 @@ static u32 rk3588_get_mipi_port_mux(int vp_id)
 		return 0;
 }
 
-/* The sync polarity bits in GRF_VO1_CON0 are set for a negative sync */
 static u32 rk3588_get_hdmi_pol(u32 polflags)
 {
 	u32 val;
 
-	val = (polflags & BIT(HSYNC_POSITIVE)) ? 0 : BIT(HSYNC_POSITIVE);
-	val |= (polflags & BIT(VSYNC_POSITIVE)) ? 0 : BIT(VSYNC_POSITIVE);
+	val = (polflags & BIT(VSYNC_POSITIVE)) ? 0 : RK3588_HDMI_VSYNC_INVERT;
+	val |= (polflags & BIT(HSYNC_POSITIVE)) ? 0 : RK3588_HDMI_HSYNC_INVERT;
 
 	return val;
 }

-- 
2.55.0



