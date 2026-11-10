Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E216606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RLpqXj0r;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BasFEmq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OpLzfSX/nDS/byczFTKxU2z4XNzaXDseodN60rHL/Gc=; b=RLpqXj0rygvfyXhEtkhGd59KrK
	hmHnxPuqpr5RYrbyRv7YqU716pDDizGpqcfukrvEJ3iS+59Gz3uX/+PMZAuAknpvBWqXgTiV2foDa
	AY1mtJMDMlDIejidoS4C+SonXBG2PtDvMgUEZWZeNYu18rdKT0Dvxo6Vm9iK+EV9RMilE94oXs3tY
	99rxK6poaxhs0S72IiiFLmVfYFP0mU4Z9kHEJ80oBe4yWMEcuDTr6GcROahQNeZdSYLsC3vvL0Mud
	5e9pRlAwDe9sTI9eBd0koANJgXdiFlvxUXCJ3W77VuslXvIB3Hs1yHEFbh86ECPuu0ud+b0Sx4Vu2
	Xtl//cpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfyW-00000002kTJ-0poE;
	Tue, 10 Nov 2026 07:09:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfyR-00000002kQV-28BC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:08:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EEF3662FF9;
	Tue, 10 Nov 2026 07:08:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794294534;
	b=sS+dAVsvf/9la6pyNZG3Tdf0x2GyHOg3mRSBPvHWoiAd4Y/8wcpEfmXTEVlxZThRrpzd
	 2mO8CtaL6mbJsk8rb5q/9AfHRX+oHZrimucSAXgbPwdClT6879eOV+IJMI3dwg9Oies9k
	 82y4boc5FKHgOHaoy4+OIKmFKLmh/IxveEM0gLO6sYHZcY45MlTt20SSHBDyPCme1/LD2
	 7S2+Jd0AfzFa7K+shDvV7Nis3Y0gZpd3bU93MRXjczZymViwwqhk3A6xeSvzTJKaE2PZM
	 Eo0HZqjN9Cno7e1NPp4DFkyiu8tc3E98r2Ke75+Jh2H0M4ggAtQObF9u6wk8iRvY7NA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794294534;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OpLzfSX/nDS/byczFTKxU2z4XNzaXDseodN60rHL/Gc=;
	b=fLEOwh9i5CW96GXwIkgvRkSxzyEBU8LsOkzgs4A3rOocnrCHvOgSWrPfpDDatIdK11zy
	 XDTuEtpbw+sr7r9NCOuiacczQrSoD2sWM0YMwYSxYXan2DpKdzNPFOCOr9xgGQSOxW/vM
	 5j2l0JVW86MBMlg764V/w6YtHGEpXtHv3KNVj8mtvfi93/vtN0/AgOc71IyrpSjc93pK6
	 7HVcv1Lbn2jxtQplByVRdtbvabuZVKarp3E6s9kLMMzblGwUit3tbMWs13y46iFMw5rIE
	 0GjWPq8DHq4QELoanfFNaF2K/XvTrF0PT3+sV7MUlWNP+MIIJZuvAV3mo9T8jZbJbPA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D8811F008A4;
	Tue, 10 Nov 2026 07:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294534;
	bh=OpLzfSX/nDS/byczFTKxU2z4XNzaXDseodN60rHL/Gc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BasFEmq0ArC5FnE8VgQsvxfn85Z10Ix3YyHrZBndlRDUbLZ1XsRQrbqzw1DS0sP3N
	 2mV/QK+Iihzto+OkSoJFBWCKyglEORxe90rfVw7UiCjJ4JvvgjdZFCIZOx205YY7i2
	 nyAw4k1xAzIqOxuFgPzWiW3fFNLORtxG98PIxhXzpTBWVgi498VgqQ22IX1vf3wjXZ
	 5xH1GZolcKCrK6Ei8ccp3VnK8DYX9Lv8udeFlVNue10AGCMil9NlQBrry/puTuHUWp
	 PbtuS40cwwzfb7oy1bFdMrH4SpQqMGPI15Xft19aA9OA0tta9Rk+FMK7qldkvCAgKV
	 Yx5gUGsP9bFaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A35364891E;
	Tue, 10 Nov 2026 07:08:52 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 01:08:53 -0600
Subject: [PATCH 2/2] usb: musb: sunxi: Unregister the extcon notifier in
 sunxi_musb_exit()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-musb-sunxi-unbind-v1-2-d821584fc4a4@gmail.com>
References: <20261110-musb-sunxi-unbind-v1-0-d821584fc4a4@gmail.com>
In-Reply-To: <20261110-musb-sunxi-unbind-v1-0-d821584fc4a4@gmail.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: regressions@lists.linux.dev, Zijun Hu <zijun.hu@oss.qualcomm.com>, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Rajan Yadav <rajanyadav0307@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794294532; l=4095;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=bZWjWO4qmuHUgam6/ZPpcz8gwogqcCZCYDKe6vCCA9A=;
 b=wKfVzErbcdvcU83jM0aWxFQUbpAvri86BapqOpv41VUu7uUe2s3QOfZlTfgzIOIHtY4aGTvN9
 fQaPbIuNbO1DVwzeAdvDg8JvZAjYrwKGdVNw7Ac2JDL2HNhsMSVU0G4
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
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
Reply-To: rajanyadav0307@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rajan Yadav <rajanyadav0307@gmail.com>

Binding the musb-hdrc child again after it was unbound fails on v7.4-rc1
(KickPi K5C, Allwinner A133):

  # echo musb-hdrc.1.auto > /sys/bus/platform/drivers/musb-hdrc/unbind
  # echo musb-hdrc.1.auto > /sys/bus/platform/drivers/musb-hdrc/bind
  notifier callback sunxi_musb_host_notifier already registered
  WARNING: kernel/notifier.c:24 at notifier_chain_register+0x98/0xf8, CPU#1: sh/312
  ...
   notifier_chain_register+0x98/0xf8 (P)
   raw_notifier_chain_register+0x14/0x20
   extcon_register_notifier+0xa4/0xe0
   devm_extcon_register_notifier+0x64/0xe0
   sunxi_musb_init+0x170/0x280
   musb_probe+0x330/0x125c
  ...
  musb-hdrc musb-hdrc.1.auto: error -EEXIST: musb_init_controller failed
  musb-hdrc musb-hdrc.1.auto: probe with driver musb-hdrc failed with error -17

sunxi_musb_init() runs each time the child is probed, but it registers
the extcon notifier with devm_extcon_register_notifier() on the glue
device. The notifier stays registered after the child is unbound, and
the next sunxi_musb_init() registers the same notifier_block again. It
also stays registered while no musb exists, so an extcon event can
still queue glue->work after sunxi_musb_exit() cancelled it.

Commit bb1d1ce8c74e ("usb: musb: sunxi: Uses the resource-managed
extcon API when registering extcon notifier") introduced this; before
it, the notifier was unregistered in sunxi_musb_exit() and on the
sunxi_musb_init() error path. Restore that, and unregister it before
cancel_work_sync() so that the notifier cannot queue the work again.

Tested on the K5C with v7.4-rc1 and KASAN. The bind failed as above
both without and with the previous patch. With both patches, three
unbind/bind cycles of musb-hdrc bring back the UDC each time, without
warnings or KASAN reports, and unbinding the glue device afterwards is
clean as well. This patch was not tested without the previous one, and
the sunxi_musb_init() error path was not exercised.

Claude Code (Anthropic) found the cause, wrote this fix and the commit
message, and helped with the tests; I reviewed the fix and ran the
tests on the board.

Fixes: bb1d1ce8c74e ("usb: musb: sunxi: Uses the resource-managed extcon API when registering extcon notifier")
Cc: stable@vger.kernel.org
Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
---
 drivers/usb/musb/sunxi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index d880c3758c9..e9107ae9d34 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -246,15 +246,19 @@ static int sunxi_musb_init(struct musb *musb)
 
 	writeb(SUNXI_MUSB_VEND0_PIO_MODE, musb->mregs + SUNXI_MUSB_VEND0);
 
-	/* Register notifier before calling phy_init() */
-	ret = devm_extcon_register_notifier(glue->dev, glue->extcon,
-					EXTCON_USB_HOST, &glue->host_nb);
+	/*
+	 * Register notifier before calling phy_init(). It is unregistered in
+	 * sunxi_musb_exit(), as this runs again each time the musb-hdrc child
+	 * is bound.
+	 */
+	ret = extcon_register_notifier(glue->extcon, EXTCON_USB_HOST,
+				       &glue->host_nb);
 	if (ret)
 		goto error_reset_assert;
 
 	ret = phy_init(glue->phy);
 	if (ret)
-		goto error_reset_assert;
+		goto error_unregister_notifier;
 
 	musb->isr = sunxi_musb_interrupt;
 
@@ -263,6 +267,9 @@ static int sunxi_musb_init(struct musb *musb)
 
 	return 0;
 
+error_unregister_notifier:
+	extcon_unregister_notifier(glue->extcon, EXTCON_USB_HOST,
+				   &glue->host_nb);
 error_reset_assert:
 	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags))
 		reset_control_assert(glue->rst);
@@ -280,6 +287,9 @@ static int sunxi_musb_exit(struct musb *musb)
 
 	pm_runtime_put(musb->controller);
 
+	/* Before cancel_work_sync(), so the notifier cannot requeue the work */
+	extcon_unregister_notifier(glue->extcon, EXTCON_USB_HOST,
+				   &glue->host_nb);
 	cancel_work_sync(&glue->work);
 	if (test_bit(SUNXI_MUSB_FL_PHY_ON, &glue->flags))
 		phy_power_off(glue->phy);

-- 
2.34.1



