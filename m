Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE1260A2602
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3lKd1Etj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xo8ZC9XE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q6/GOlHX/rHWCXwjgQKfv6icGhiILOZa+YGNntlphsc=; b=3lKd1EtjKfBKzgkNRctSt7WOpF
	q8KHagGqSktpCMTgCL5XOBqfF4Q/aCAVHpRizB08GQAsowviwuJzgaR3fgcTodcG/Ek7TZLHW9pE5
	clZrmR067HWzlSQmVQ+/vWsnKRxIBabEgnFCZuHXFOdeOB6bO4aqD6NF/T4njyPKU1Y3YmEvR/wv+
	jjWr3Qpq53WSGieM1CV+4JdKxPKPfzFUomtkNjr807CCd+y1phiN/XG6If86pjfdvvW8Zn8bdpyYc
	Zw4AOgPiZW6A6+sopLUJfAexV92e5j/USbiCfOf4vpPJhEIKFq3AM1FIjzXANF9KUbm+CFlPPMWwM
	XfHmSrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz1t-0000000BTwS-3eTF;
	Thu, 19 Nov 2026 10:06:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz1m-0000000BTtr-3oAp;
	Thu, 19 Nov 2026 10:06:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 863BE62F35;
	Thu, 19 Nov 2026 10:06:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795082761;
	b=SE+d8OCuwC3h8WKfrGbFfiX+XRLrKbkUmdyGCw4SE1/wMxiwuCRqND2JwKsIA3Oh97PC
	 u7PbdHF8p3lkz4poS+bFJC8jXjpVQZK9DPMxr54TpwPDqp4K2R/ccXW0PLwj3TCki3FgP
	 K26t30g1CpOLF8hkEWwYl97QRKwVEBMjvJPH3AmfFgwmlU8BgGPf3+yYtslH2qRU4tb2W
	 Ag8sJeB9nIj6VSjGX+PS220uz9cbCoyGi1BeyeDJAMBG/zljpjvXlSlgwmIu08et2tqFt
	 LsvoZ1NeAhVs1kypt8QfTZlXPBLPJqx2Aimdyo7/yWrT3psQWeb1SWBmbbulMO5JNNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795082761;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=q6/GOlHX/rHWCXwjgQKfv6icGhiILOZa+YGNntlphsc=;
	b=Xsz25k7AdmexmlDQUFO/gekHGqdJyj6repVNTOoPhgRP8Z60++MU2nywUF1O4s53NVAl
	 4A9GITh7JGa6M+6cOHjpVBzOaPqPJhlZdnEwDXQ+3C7hFrT2RGWtuBAOscN9bR0PmqEpq
	 gbg4gtbyIEYOaW76sPms5hdDe4pL3CRxahqBask0PXwFB/sb5fvihhgc2J3tQ96fWeF22
	 SimPGZmPW+Y4hdRmyhDVpnnqSWWJdq9mWUM3waiwOgMudRCLOdATrdkeEcS6JXIFurdxP
	 Ac2pMRd9DIVKkOTh38K8Orw9d5gd6ocEDhVTEMmotvnQ7bUBK6z3bluhNgszlCs6LoQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 795311F000CD;
	Thu, 19 Nov 2026 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082761;
	bh=q6/GOlHX/rHWCXwjgQKfv6icGhiILOZa+YGNntlphsc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Xo8ZC9XECwHq72m8tDvyfpWB31wz8tRZdLWwyI5VqGPrvWsNH1U9UVNyLyZlqiPXL
	 wYYvgttmFI6gBzsa+WJb6j5Gz0g4+iEH9FPpEiMW3goT0rJpVFhjHpj843RlXeCQzH
	 dEFhsQq6qbFuzGLbnChGi2QNCw13b8rMvsirfBS9mb+onxNoZO/raDFOY51Y8rEjuk
	 TOgLITuvD3jmfoB8JHGVBHweIiXLWnqbvSAtEpIWA/kN6AmjLuSkC+iCBtxwPgrYdY
	 ccxGv3oFJhfWzMaklBBbLBL7bw3fzkr2rZ2TcHGsl9q99WsRCG91PZJ6xUWZscV/O/
	 KQ/uBcLXJAFOA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0286C4B21A;
	Thu, 19 Nov 2026 10:06:00 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 10:06:01 +0000
Subject: [PATCH 2/2] drm/bridge: synopsys: dw-hdmi-qp: Allow interlaced
 modes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-rk3588-interlace-v1-2-993212e389cd@gmail.com>
References: <20261119-rk3588-interlace-v1-0-993212e389cd@gmail.com>
In-Reply-To: <20261119-rk3588-interlace-v1-0-993212e389cd@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795082759; l=903;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=JdB991WB7QVchwubHLTwNcdcVa5HjMmWEsErXD/u8W4=;
 b=r1/DJHRQSz10f0nFji6A4bZTO3kA+yUy0oqg26h+aDwBGKbD0rsj3WPPSyhvvxyQxwovoRIya
 j5yeRuZ4inLAoHkuHDnBLuPDOaRosszuCF9yE+p8H5r4Py/QfrknRww
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

drm_bridge_connector drops interlaced modes unless every bridge sets
interlace_allowed. The controller only forwards the CRTC timing, so set it.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 984220928836..75b5adbe8178 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1169,6 +1169,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.interlace_allowed = true;
 
 	if (hdmi->no_hpd) {
 		hdmi->bridge.supported_hdmi_ver = HDMI_VERSION_1_4;

-- 
2.55.0



