Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8CB606A68C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a0SjrCr8;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=oxmiIUGK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zQFj3ohXXKJNtzT891WGzt/tJZd/i4b5W1/3UD7wxug=; b=a0SjrCr8Qtx2d2aPr4p2nd/uIU
	/X/JoaN8PC6C7wFKSzYE9m8KmNoBDNo818Bzfc+NegTbBbBNZidUOJBaxDOMxub84hxcxkDDbgpVS
	qVvIWfDPoorGl0H7kW8IbYYMeIDz62kugV30jcukAw7dy7Ew0Zgkfs1lWLplUDtQKKr1fCLrBnXiX
	+q8xPECJt0tUdia2sfJs1mftxR1WZcRyob3OjO+bgs2CGl8uWssQu97cDC4EgXGnzT9yxYDOr5ehJ
	bB1nLHbvav7/dj+JZ/Wzh09REXicFEzy1gxkelnyqYW6CalTtyvJbISMWLp83lWD+fbH4eZuglfNj
	upC1zt1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXG5-0000000CngQ-1cTT;
	Thu, 26 Nov 2026 11:03:21 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXFd-0000000CnYd-3qO6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zQFj3ohXXKJNtzT891WGzt/tJZd/i4b5W1/3UD7wxug=; t=1795690973; x=1796900573; 
	b=oxmiIUGKW1RW5hoGpknR22ruqi2Q/UTQrCl+R4ezyxekWTLcx1kJSAXakZ6suymiTkoqP3Kdnlv
	PzH0HQl1r4euc+YWVr3n++DzMaIMR9iXM2kQpljKbh2yqfyG8w4Hsxf9MFlIHmAvp7BsyP69Z41M1
	TJevO/dbH4G8reJ1oPQd5mSH4ejsfQU6c+DYtGjBOa05JZfRYSFXo8XLZYFnBd219FUC/0wykuyvU
	4KBeqeHakFTp5tIvmrQGffiZMv7KZKXCO8cONuq9l3+3bSFkySSOB0D3CDguL+i7OinlWqTBgDC6X
	AYGdaN0n++dI5F65MtaKDxN9/H1EyVgOhC9w==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/3] ARM: imx: Add a more agressive idle mode on
 i.MX6SLL
Date: Thu, 26 Nov 2026 12:00:53 +0100
Message-Id: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGkRCGsC/3WNwQ6CMBBEf4Xs2Rq21Bo98R+GQ4GtrEohLTYYw
 r9b8OzxTWbeLBDIMwW4Zgt4ihx4cAnkIYOmM+5OgtvEIHOpEWUhuJ91yl4UpmEUNSp1UuaCpM+
 QNqMny/Puu1U/Du/6Qc20SbZGx2noP/thxK33zx1R5IIKadEqRUrb8km9My0d2dkBqnVdv4nYo
 de/AAAA
X-Change-ID: 20261123-imx6-idlestop-b14454a91e67
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux@yoavmoshe.com, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=3326; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=3y1MjYnUQP1b4i/yB5OBFm8L7NSHxZ/2T79EJ2IZZrU=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrCBGo20QiKQj2Kk6TYiezX1vwmhPlg87VpjS5R
 MDTZEeHB2eJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawgRqAAKCRCEYUX6QCjc
 8doQD/4xNG0xsfpcIWVuJNun49d1/vLRPIJ/NmKqBZJLk2gZCbQmMcmLZ/UzMzp8jzUPNfm4dPp
 AZqRZKXCBE4rrk7A/HEPhOjnvCLkd7EuSL5iiD+YuFVZx5xVdg61TlRC2yOkfjLRZIIZsvnEfWU
 Ys9wA7fj5JHGCLQfyEmWBMDslmZgmCrJqWqRTdM4Ke/MHdsNzyiVuu2TZGv/Xz09AMi/NZmWNu+
 4qHNFJdAxi3Xkzrhx/3e9h4h/5N+uspi0YmGb3N2/zeFTsMYfzmrUhd2vD7x82jBFK8QpfiZD95
 G35+059aamcwmTtjzwK02f5ljVf4piOrC5xEwitb/ShWX2p/6RdsoTMJJ4dSg5o9J/iCpwYSc7Y
 6TxF116CgVXkAHyk+JAfrrTb5k/5UT268u1tMnZi8qVP/2F+0BYfvE1jwJeSXYfMRt5wBRhh/Ch
 F6GcgSpp/Hjuq03APY3ll1M4meKTCfLzJALhJnbBMmSASUGs8/rW/hczrJ6RRnQhlR+UkGy8SsX
 3RTRT+YTG2EwTLNfx/4gCNtEiFbgDQNN9xzYlZwHbSTMMWtOOnROjN+0MWl8czLKCe4/WG224YH
 gD3fjLusGdFRroL6dQGdCQpMkZF1NxEuZ2pjtYAIVHeY/z/XwPHi3dtSo6FB6ZK5Vw1wENGOUAO
 AOHHknY4VLyQJeg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_030253_981639_4115EA56 
X-CRM114-Status: GOOD (  19.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Ebook readers there are often situations in which the system waits
only for some GPIO IRQs and no module is active, all the clock system
is using most of the power, not every clock gets disabled via RPM,
esp. those are marked as CLK_IS_CRITICAL.
A usual he situation might be mainly wating for touchscreen input.
Since nothing needs to be sent to the display continously, clocks
are not in use. Maybe some frontlight is consuming power, but if it
is not used in maximum brightness mode, the clock system is still
using a significant portion of power.

In contrast to suspend state, that is not forcefully turning things of
and wake up only on selected important things when the device is not used.
E.g. you might still want to have frontlight enabled.
Vendor kernel work around this by adding an extended suspend mode in
which more things are disabled, e.g. the touchscreen.

So rather add another idle state, which is only conditionally used
depending on clock usage.

System timekeeping is currently using a high speed clock, which is a
major blocker for this idle state.
Use 32K clock for the timer and the clock source to avoid that
dependency and allow the timer to be used in stop mode if that low
power clock source is used.

Other things preventing entering that idle state:
- imx-thermal driver: probaly needs some notifier block called by 
  cpu_cluster_pm_enter to avoid false alarms like ti-bandgap does
- PXP and DCP drivers are missing RPM, so they keep clocks enabled.
- serial console: needs to be unbound

With these patches are applied (and the not-yet-upstreamed EPDC driver)
I can run a loop displaying the current consumption in every 20 seconds
for about one week. Power saving is around 70% in such
situations.

Patch 1 and 2 can go in independently,  patch 3 should go in afterwards
since it will break things if the timer driver is not prepared.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
- honor disabled idle states when rejecting the new state
- remove redundant imx6_set_int_mem_clk_lpm
- more comments
- do not show new idle state on other cpus and when thermal driver is
  enabled. The latter to avoid misreadings until things are fixed
- block new idle state on dcp activity
- adapt min_delta for clocksource if 32K clock is used

- Link to v1: https://patch.msgid.link/20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info

---
Andreas Kemnade (3):
      ARM: imx: enable STOP-ON mode in idle if wakeup requirements permit
      timer-imx-gpt: Allow 32K clock to be used as a clock source
      ARM: dts: imx: kobo-clarahd: Use 32K clock for the timer

 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts |  5 ++
 arch/arm/mach-imx/common.h                         |  1 +
 arch/arm/mach-imx/cpuidle-imx6sx.c                 | 54 +++++++++++++++++++++-
 arch/arm/mach-imx/pm-imx6.c                        | 31 +++++++++++++
 drivers/clocksource/timer-imx-gpt.c                | 17 +++++--
 5 files changed, 102 insertions(+), 6 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261123-imx6-idlestop-b14454a91e67

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


