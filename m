Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B00606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 05:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ptk38FIz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7UJFQL/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sZtIcM4ZyjDVYdAn2REZBDWV2ouYRj2GEzN/Ts0yUQA=; b=Ptk38FIz9GqbSZus7zHWVYQfyW
	PqTk2utWhNIDeQ5bZh49DT1LeJAxyrxeGekNP/WmYeWxFGXChGW3O0oXKStZE9y9q0I84dIXqENL7
	ek6ItGIFfRgOWd9LiEhoORTvXGBvhHCubHfGqOZtIxTrvBgzk9lGxGSkxD+Q6F7VF4ztsLFT6ZLrR
	GxUgrRkwnv8zZuWBh4vTInhqeI1atdCJUcgvX/7aA4Pn4ZYrthk5pb4TNiWxcKrKIIRXy6EyUsDsQ
	7EbhrgYKN9Lhax+GlRm2kaYTbz91Ihvop0QAU1yeVduU0v4eVfW9UbxE1ZLmkiP4mM/SaCNUnr2HD
	7QUEC3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuat-0000000As9B-0AVB;
	Thu, 19 Nov 2026 05:21:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuag-0000000Aryy-1yjs;
	Thu, 19 Nov 2026 05:21:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A73FD49019;
	Thu, 19 Nov 2026 05:21:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795065705;
	b=Zj2E/dNUvAjG8pLhzljeq4PreYqN6VyQgaCMVyK6ySFufxBMdLFEqihPn4zUHNj0M3Ul
	 qjyR3oyrc4wo41Ju6NMUnWiYQ9tgApCU3vxTWOvNB134EYpe2BZqO/TnxaYp0b749y4/e
	 6YVHYR4hhBImZm8IrGYbTSrllmWaJcZHO1FbeoHvdbnggixZ4fmHchlNa1nkLWE40t25o
	 ghOdRm2zZOYPJnL2FTxPti0qGWgYgAEf7ARDRJvsnB5gm06DkcCPTEClTppypj2rymfhy
	 QEPeqSEUv279f2kK/LAFFKDdhzahvFwfsVvyJeJ6kJpeJySjOjOl07Sy+xnK3jiBLjw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795065705;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sZtIcM4ZyjDVYdAn2REZBDWV2ouYRj2GEzN/Ts0yUQA=;
	b=UoAiDogB8gGICXiFgYfJh4tFNa+UJd8hYjZw8Z1/u/xSPsMLucOj3TbZ6/O9zfWjviW2
	 t+mxdFK6s0aOcO3G9t1ioz0mPz3xB8AHMlWb3xQ5M/3qHC8E0gj3SLklWnHFmZAoDHudd
	 vX5mPoLKQ6Fy8QTfFOcn/3E3ScpD4XzV6PTO1s7HPTUzbkXe9YN7Zl5WhERT7Uld7LUL8
	 yXd6YXVDL9t0FhZ+rzzdSWOClVgr4GIk4A0r1SQVP46rCl1DtI6N+yQThS6VLaVnRH459
	 SOsw3eLrPnZ3Jsa9oF1sT8z2OHQ9nSfpLT9ajEmh55Ba2LaBM6xq6ThDF2oWuzAw01A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF3571F000C4;
	Thu, 19 Nov 2026 05:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795065705;
	bh=sZtIcM4ZyjDVYdAn2REZBDWV2ouYRj2GEzN/Ts0yUQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F7UJFQL/CMbisqVNtYdCrp2RpTrujwOGGHaidmFuHiwgBZ3SUNmm0Tlc5cpU+Rl3l
	 niuEhDPco+OBVbXaFjdPOGzovWeveNUAF1+2bIP4JFBYsjGu37kWX2doYn8w7aGbBL
	 dwVSsDrg8RKlaZq7Oau6bgMZrjFyiyMmLhGOIuOSXXcnLgl50zWCR8cXPPAXkTCDVp
	 PaDs+2s1eqXUaWyOMls883fMbG3IHZe0QhZAVcNx4CrEcj1LYe6IFhyWkm+EBuj+z1
	 SMoFz/252rxjTL5jnjmi/8ZBXxdn1OFfK15e5bNj4F/QdHaRGoUHUVwZyGEoYyF+84
	 btkHy176s1/Ng==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AFDFF4B109;
	Thu, 19 Nov 2026 05:21:43 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 05:21:46 +0000
Subject: [PATCH v4 5/8] drm/rockchip: vop2: Only accept AFBC YTR for 8 bit
 RGB on RK3588
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-vop2-fixes-v4-5-4b8f5e7148c9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065702; l=1440;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=uMnTJIcFwj1gG3DgCMEJ8nNkx4JZMnStu+mMXXYuIVg=;
 b=1b22BtMFBoMuRj7piWq/bszlAYD84J3qIiaw2Tx3rGku6UHS7m+1JvGyHTqRz8zZpjR1a7xiW
 OBiBKooC9EqA/jC3N9CpVVNkiQiMuuJJ0UTke/Pvj0wL3Y+UDB3OR34
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
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e8ef83d6924b..1408b539c311 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -396,6 +396,15 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
 		return false;
 	}
 
+	/* AFBC YTR on 3588 is for 8bpc RGB only */
+	if (vop2->version == VOP_VERSION_RK3588 && drm_is_afbc(modifier) &&
+	    (modifier & AFBC_FORMAT_MOD_YTR) &&
+	    vop2_convert_afbc_format(format) != VOP2_AFBC_FMT_ARGB8888 &&
+	    vop2_convert_afbc_format(format) != VOP2_AFBC_FMT_RGB888) {
+		drm_dbg_kms(vop2->drm, "Only support YTR with 8bpc RGB formats\n");
+		return false;
+	}
+
 	/* Linear is otherwise supported everywhere */
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;

-- 
2.55.0



