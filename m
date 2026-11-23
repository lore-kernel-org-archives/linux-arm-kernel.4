Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2B2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4NosF8ZJ;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=HaVxhite
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=H3n6mAsS5DvYsC96ijuqCARg8ELNAIedKoWS8muN3HQ=; b=4NosF8ZJfkftmBHtsWrY6a+nSc
	kvaezjN+JFHf8EoWtgyG1gMS/tB+cQJ3xv9iC/mrzuCNgZUeq7XJqVQjwIR6JiuDp/0R31XgLVIqU
	U432D5UEoD+RByN/pffCPnPiIS5qtX8+Bnm7idTeG1hfdqYP5K7ePLhW/DpvHdXUFZ5Bu/JCrEvIs
	SHV/A+65fAQXLvlbIUEiGg5VK4+BLgkot9QSPOM9FGeVY9Gxas/H+7OJcsoas+DdFii3SB/RgIfYi
	Vh7B74IDksR2rNVGIY3SzF5Mgc7jAnW8MKSNy9p5lB2wNG5T7Jrbc59qvArt6L8KM+SHVWyZ2rLD2
	Y7o3kPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVajs-00000004rNE-1tV4;
	Mon, 23 Nov 2026 20:34:12 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaik-00000004qdm-3WYx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=H3n6mAsS5DvYsC96ijuqCARg8ELNAIedKoWS8muN3HQ=; t=1795465982; x=1796675582; 
	b=HaVxhitepFpouuV1rhK+NQhLoFVAWcktlvCYgghYa4javS18si4VD6irLVpYAcGzbV3mAafM6Iz
	HEj/BeJo5KcK04h4bizyb4CCWmdvNkkeMCmY0MQ5k4TzrKUMVd1gEbmMKLl7ThLtaz3s+zAmTI0el
	QE0lZlBkV2KOOYSzqPIh7N4tpXK+Q92/QRNWly37eLkAcx95kh858wktY5kF1qYaaGfUZQRCCiNov
	3OyFEi616dC4dwWN/VOVVh3608gDvTc1cpFuAvlVuoIZztQDglP46IEOtGmkmpRJbpWWHzPUrvJ5z
	uNNUHAAss87qt9AN9EVgfLGFK7+Uvvr2KmFw==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH RFC 0/3] ARM: imx: Add a more agressive idle mode on
 i.MX6SLL
Date: Mon, 23 Nov 2026 21:31:18 +0100
Message-Id: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJaiBGsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNj3czcCjOgWE5qcUl+gW6SoYmJqUmipWGqmbkSUE9BUWpaZgXYvOh
 YCL+4NCkrNbkEZIhSbS0AaYt1WnEAAAA=
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
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2710; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=Hxj0SZ3rC+SPvFigy5m6+QiE4mX53fcOuVFZ5Bi27dY=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBKKmZbyCj/we5x+baOU/ADXBrxjmg0W4muH6x
 QEQOnJoAb+JAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawSipgAKCRCEYUX6QCjc
 8WrsD/97uMR+tAVbPbcosjxxdibZzavWR3FLDAHpesQUukjgItYmQ/reMgRGvcD7NmA1/K3ovto
 82iQEefJnzz/LZdsOWBTfAQczC3Zabne1Str3ZFOXKwTQC8oLVLsnpSeqFh0zM75jDggNui4i4S
 NQQGOUjUYQT4KMeIZY5UYv5Cw7Fnauo9GAy5fmSZtJlCUNKS7cujlTYmwJabY41CtwI4I+vZgtZ
 R14zuNKX1Vn9KTYAzGBIcP6xGoRtOYJwTkC3ewULcLJIhRxMxA5V+HpJGaSiu2BiGLmlfwXNoSN
 zrXze/Ke2VydtJ8SskPhAoaDSqdYKXauzwaL2TX3aQdyHnrXGooriSMmydcGhy0g5rkrIw1UWJC
 ffbd0dba++JZQ1fidQrvw69PENWoGEg2oxbr6HTf7Llh1wKiUHCj0zI551gbQHL6DCPVA8Cs8Np
 Wf9V+uyFUDsLmZ+8S9fXlzCw6Xn14HgD7RpR7pP+u6xk8S1wUSU6AdydmGssVdYaIq+hGDyqr4z
 4suAH2XsgJlRB+ywfuQDCTnPIh5fcAZw0viEB5Jev3aJW+7C/IBkSlC4gBhdZ282ZIoASPRvSfH
 boY98KXQi2C89iq3RIA8MM5ObaCt7h5AupdBH0k/BdfBOqN7/9d7aj6VTdgSqSWAuFXgtiYiMvW
 bFPk5EimRzpa77Q==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_123302_905201_B0231999 
X-CRM114-Status: GOOD (  17.59  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
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
The imx-thermal driver currently needs to be disabled, maybe some
cpuidle notifier block called by cpu_cluster_pm_enter() is the solution.
PXP driver is missing power management, so it should be disabled, too.
Also serial console needs to be disabled.

Use 32K clock for the timer and the clock source to avoid that
dependency and allow the timer to be used in stop mode if that low
power clock source is used.

With these patches are applied (and the not-yet-upstreamed EPDC driver)
I can run a loop displaying the current consumption in every 20 seconds
for about one week. Power saving is around 70% in such
situations.

Probably patch 1 needs a more clean solution, Patch 2 should be good to
go, after that patch 3 can go in, too.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Andreas Kemnade (3):
      [RFC] ARM: imx: enable STOP-ON mode in idle if wakeup requirements permit
      timer-imx-gpt: Allow 32K clock to be used as a clock source
      ARM: dts: imx: kobo-clarahd: Use 32K clock for the timer

 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts |  5 +++
 arch/arm/mach-imx/common.h                         |  1 +
 arch/arm/mach-imx/cpuidle-imx6sx.c                 | 42 +++++++++++++++++++++-
 arch/arm/mach-imx/pm-imx6.c                        | 23 ++++++++++++
 drivers/clocksource/timer-imx-gpt.c                | 13 +++++--
 5 files changed, 80 insertions(+), 4 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-imx6-idlestop-b14454a91e67

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


