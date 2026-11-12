Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1872606C818
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ER//QRsB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JipJScFP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xf9jjECCHCJTLAEiaGfeK99eKdy6RyIXv+cYpPJ4C2s=; b=ER//QRsBvWXNUaqoyoEp/rSDgu
	fT8RFtOY14Wg2csNEojViKqSw0wig44wQkQIdqFF+KQ6jRqviaBgXU8Tih3+PTZbJ8EWv73obRYYI
	y1caQWGgHwlXDypjxesqwTdug6x1ue1NjsmF90Xq2aikCxB74XDuc6MFgywY5tmVdiEfpv7GGDOfX
	iWLTLgsTh6mlDuRTgVXoZFMfj5WQx5QCTpgJu9M3GyXjIYSE+UwNdWT22fz9E2HYYh62vp/GRUXjc
	SEbjuXSkJhlKG9v3/ODGy+pGKvKvtnkstfXWZKLm9meIBhuPTISxmo78uXPVljP5FTF4+NTiVHvx8
	frfnOu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQHn-000000099ng-180L;
	Thu, 12 Nov 2026 08:35:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQF2-000000098Pl-37uK;
	Thu, 12 Nov 2026 08:33:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F8FB412C2;
	Thu, 12 Nov 2026 08:33:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472388;
	b=ADOxuUHJiS2833FkGWhrZzhbfdRf/FwunAjtnH9lKej/8hfFSPD0XqozMO4ECdtpV81j
	 11eGRpTo3NlqbxjBr0Cp7podZyzaYGSTnUE9DKu9ZgrQbMfAIm6RLTFQSqlZh4AeA4vlK
	 5o69851CLQTGyEkVo8R0nbLUykplFK18gli1Kg4Nzk+85rC2X7XYlQemsCncwFKDHghSU
	 WmQV0DE/zs6llHUlDYAYfpg/dL0Rmma4UMFX2VbZodBtOeLBbzrpS0SlFRgPCsrV66oj/
	 1IgkV61KnTkSyAIdbVgACpeaz9BvyLBYfLwMeHiEBNCG2PKWwD7cfM0jjbD+nwnB/+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472388;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xf9jjECCHCJTLAEiaGfeK99eKdy6RyIXv+cYpPJ4C2s=;
	b=sp2gaftxWfRccWr2ajtvsc0age++QXjsDRkRY1gGCW1co46mRQ7k9olZN0ulvAlG7lKD
	 1JEFMypmv1hUXK9RJPudqcQKjFGwg9Xbd5DwK7aD1F/fYdkqYbGnzbGroHeal4/WOsC0r
	 Oq6137WOY40Uh+a04M8u34CAtIarpG5Vs04uQ+W6DFasb7FHgg2ws0wkYZCzPgHUqga9U
	 E/kSIwgiDU5gQ+oDBbix2Dku+F0eXjWrZ9vFFMkZJ6vvFUwgGaxqNI2MkHhRliXECPdle
	 nM1DIqOKK1/70S6e6KmD4kdaRX3BjhP66OvfMGXrEJQvhn6WbYZxKYni/dW9d0anxPg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB48D1F00A0D;
	Thu, 12 Nov 2026 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472388;
	bh=xf9jjECCHCJTLAEiaGfeK99eKdy6RyIXv+cYpPJ4C2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JipJScFPgpR4hdxObvBklY9uDoUPxoX/jR3WObv7/NhRHEdUfktK3qOerIUMxNuct
	 B2cmZJC8KhmTHFTN5Alv5yz7rBOsL4zYEXtEkIfQ23EK+pEXJjYJIm1p5N1lIXgxmR
	 vxFPEL/03G2KsFp1VRasvv4zcxYfvJuvz83BUzGKonWoyAyFnu4Lalgwv7T4mBGAj8
	 jUlJ8S4+KukkShvhC3NDcNf7VIQUGHpTG687Hnk6pf1CCGfFm/CKKfuOx7GLwZ81yQ
	 0onKKndO2dRrryBH87Nn3ZPvpaMUqKCbgfu1Cm0tFue/EMfOjaSX3lGswwcxft6s8m
	 oOqi1cwGV3NJw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 645F04939A;
	Thu, 12 Nov 2026 08:33:06 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:33:06 +0000
Subject: [PATCH v2 2/9] drm/rockchip: vop2: Don't use uninitialised
 dividers on RK3588
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-vop2-fixes-v2-2-8218c1cf8ac8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472385; l=2150;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=+pfuSp1M99YrjvoyOVjakpSrJdneJ0OxzWPX/oIDiA8=;
 b=0BgDQWF1kBoGdrpcP5kaQ6tsQPCIUaT39TeoawJASLmg159mIIeOABJjhO2G+1Cjo09Y14D6r
 3uEyW7rU/13Az+oPwNYDFyYRkgHyggR5gOwfp+vo/xQGD3/UFy3jKLi
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

rk3588_calc_cru_cfg() converts all four dividers to their register
encoding with ilog2(), but only sets the ones the interface uses:
dclk_out_div is left uninitialised for HDMI, eDP and DPI, and
if_pixclk_div/if_dclk_div for DP and DPI. The garbage is then written to
RK3588_VP_CLK_CTRL; on an Orange Pi 5 the dclk_out divider of the HDMI
video port reads back as 3 (/8) in every mode.

Start all dividers at 1. dclk_out only feeds DP and MIPI (and HDMI with
DSC, which is not supported), so for the other interfaces keep it at the
dclk_core rate, as the vendor kernel does for HDMI with DSC, instead of
letting it run at the full DCLK rate.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index c44648e1bc0d..659fd0a3ab63 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1579,6 +1579,15 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 	unsigned long if_pixclk_rate;
 	int K = 1;
 
+	/*
+	 * Not every interface uses every divider: dclk_out only feeds DP and
+	 * MIPI, the interface dividers are unused for DP. Start from 1 so that
+	 * no divider is left uninitialised when its value is converted below.
+	 */
+	*dclk_out_div = 1;
+	*if_pixclk_div = 1;
+	*if_dclk_div = 1;
+
 	if (vop2_output_if_is_hdmi(id)) {
 		/*
 		 * K = 2: dclk_core = if_pixclk_rate > if_dclk_rate
@@ -1648,6 +1657,9 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 	}
 
 	*dclk_core_div = dclk_rate / dclk_core_rate;
+	/* An unused dclk_out must not run faster than dclk_core */
+	if (!vop2_output_if_is_dp(id) && !vop2_output_if_is_mipi(id))
+		*dclk_out_div = *dclk_core_div;
 	*if_pixclk_div = ilog2(*if_pixclk_div);
 	*if_dclk_div = ilog2(*if_dclk_div);
 	*dclk_core_div = ilog2(*dclk_core_div);

-- 
2.55.0



