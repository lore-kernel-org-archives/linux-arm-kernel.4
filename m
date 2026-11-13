Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70797606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ga7lT/N8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YwY91uuc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vrUiKRg4BvpWB5jyg+qr4DPnBX95IfoxUcaWHJw9PDs=; b=ga7lT/N8xJ2wdtXe6kWMj7HgUP
	tmq+b4LyrjZFwaEsYNZy3Zgmg3iyPP3YCDousK7yK0E1aZpSMilHa+ul6EPQaE3SBuwAT1H8qXsW2
	qGkYQDhoVMdD7LIwh3c3DZaCRGIARXBNAuhhiG75Y4ioOEn7XUuWwq8YtbVTjbn9Gr3bpN4GhFBLK
	6fGrNJnt8AES2NDg/PInzDBYMDTF2eX6N+OwhC8QOEDy2C+NVpVmSgss6MDQUdIxRJ1QYvmtuEzxl
	xFr0zTKTtw3dCtqQd2Se2lsZSIVsGeZKVV+Zlv6E8lCEk2X4+1cnCmUuLUIwRQSQkaOVb8r1LdCKJ
	bz+AwDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuJz-0000000DaVN-48fp;
	Fri, 13 Nov 2026 16:40:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuJ8-0000000DZgb-2Cny;
	Fri, 13 Nov 2026 16:39:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DD5F43B25;
	Fri, 13 Nov 2026 16:39:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587962;
	b=PV0RK+UjZ1uQZwI89VMIsfkrI724D8wVLnPMTuHOVopveK/iCUbcoJwHPSacPi0Ri+PP
	 FEiEUG/4ostRMyJNUkH7lGssad/vktb8tAY49IQ4SNE0ZbValrFTVQo3jAeDLuM4K80Bf
	 v1v3Avj+DN6oP3ZkbtI6r+AQRcGqbvmgBkkke+aLDzX/BsfgfzjwwNIXe8sXoFjedbJzT
	 snIAyuzejE3WmgbCTRDOs/lyUhEtmuKN45hr74yd1j8nF3qZCo6zRJBN4wLwGGFzRf7JT
	 BfztnIZ8L+Rk3FGVzXY/Ade6VFS5ntmqK+m58TcIyAVZzlinUqO7oEWGJY2wks+2dng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587962;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vrUiKRg4BvpWB5jyg+qr4DPnBX95IfoxUcaWHJw9PDs=;
	b=0WxH4nrMFJ2hVIO1lAT8vvn67ulv7Shn6SBHRv0PzGJ2KjWLKq/STN1PzhgejP2Wpkcp
	 eSrxS7df2jj9/95uW2M8ZNOud+TbiRmQXbC+5Kv/NNw2p6LiawImBLhSAiVf4znaMl9uD
	 6eKYKesG/Z8bzutTi/Jb4LpB3dvOi9lYSUoruNGppvlhrsbsPh9XZIUaavD1TR4gaBGqY
	 cULwSpLajcYQvjDFhVfLToio4kVY3WfSGN3P8YzfgeYhv3gh4cv3ZoeXHQj1FUSz4VZeM
	 z4PK0+VkyU27O2t/chTq6ikNHlLGeckTbRBHvG/+txnVaVOsPzLwqf/1kSyiShVPhVw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 044611F000C9;
	Fri, 13 Nov 2026 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587962;
	bh=vrUiKRg4BvpWB5jyg+qr4DPnBX95IfoxUcaWHJw9PDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YwY91uuc02HtPdYLj/fq0aqgsCkddrJPKLmk5ZAoXR6jIssIgWditnzHVeMIieZ6D
	 KxvMmCIo2eratr9Z91WdgDgAGHnqfA1ePPqhnr96KArbrRvTb24iRdacAy4R7Yna6J
	 VJTeFFGMAVt2dbrK3McfauMcqC/ZZK4lz2Xan7JLdYcNjJ29zPUmC55jiHD/D7eEUx
	 Xui1Dzaf8DZBtC9EqDvX3Gc3KLCIGRHZ65d6WSmWQfPAeZ/Ia7hfceD8vXTcs1aBeW
	 cMskR2bI6/zjDMfWWvy8iyGNst190HNu7QzRY1+UWBscdjapq8MTm6CDCqxu99qiAp
	 kgUIpsViQqJkQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DB546499C1;
	Fri, 13 Nov 2026 16:39:18 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:39:22 +0000
Subject: [PATCH v3 5/8] drm/rockchip: vop2: Only accept AFBC YTR for 8 bit
 RGB on RK3588
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-vop2-fixes-v3-5-08ae37e83b5c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587957; l=1386;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=hx/HDUh+OCmrvWMNMgvNBg8ErM3GEomonan6L+h5ND0=;
 b=3hhlWWJBEKUEQKpkKu1iHKAHK83iKtuEMoOwLdV5OQYYb7Ezz5tv4TeETl7C1szOsy3qTG2Ml
 8sswI7OPypcAd42oZWA0wCmxjULEDoh84p2Ke+llBvQVgWc6y2nF4fG
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

According to the TRM, the AFBC decoder of the RK3588 Cluster windows
supports the lossless colour transform (YTR) only for the 8 bit RGB
formats. An RGB565 buffer with YTR gives a black picture and
POST_BUF_EMPTY, while the same buffer without YTR displays fine.

Don't accept YTR for any other format on RK3588.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e8ef83d6924b..de3da292b05a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -404,6 +404,11 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
 	if (vop2_convert_afbc_format(format) == VOP2_AFBC_FMT_INVALID)
 		return false;
 
+	if (vop2->version == VOP_VERSION_RK3588 && (modifier & AFBC_FORMAT_MOD_YTR) &&
+	    vop2_convert_afbc_format(format) != VOP2_AFBC_FMT_ARGB8888 &&
+	    vop2_convert_afbc_format(format) != VOP2_AFBC_FMT_RGB888)
+		return false;
+
 	/* Different windows have different format/modifier support */
 	for (i = 0; i < plane->modifier_count; i++) {
 		if (plane->modifiers[i] == modifier)

-- 
2.55.0



