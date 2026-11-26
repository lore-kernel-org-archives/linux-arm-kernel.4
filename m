Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C1C606A339
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 05:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2awFcn1s;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdsDbqZT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IQC0rmb60+7fGUy4+e3ojRybTycBzBk8+WNROPwteGo=; b=2awFcn1sYM2ONF/VBLoutYy9oR
	8Ym40LrJE1Z6sY/xWf6s92Vl+zjba/N9AThKdMXbpMrwavXT+h/5/IQ0/ismUNl6hLbEQi3Iadeic
	5n4jd/Qy3PUNntqpj7ULnlF1p4yzJ+2qAluNuIAmBWbb5Z6njZswnMuJHuQI6Gjg2HfeuxNKZBnhd
	56ZUwgewFGGN//0fl7X2ZlrdzNQ5FX+zjpsqveqpg2muMfmdlao9Yrcosyh2oPG7I5pEHkXPtoGnf
	xhpNyj/6K8nL1mszIJoKBYiJo3BdxLkgeUikWvxoTAYr+6JzXNJucv6gX4ghFsgJMVGvHr67rUHQ2
	GErgIkVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRoD-0000000C6oF-1zWL;
	Thu, 26 Nov 2026 05:14:13 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRoB-0000000C6nI-3CCm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 05:14:13 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 46e09a7af769-862aa241d77so2112194a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 21:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670050; x=1796274850; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IQC0rmb60+7fGUy4+e3ojRybTycBzBk8+WNROPwteGo=;
        b=XdsDbqZT9OoiNYKLyUPUxPDR0N1aaTsDGdYPZc6C7BFaOZ+xc2GKE/id1tSZbLc4g6
         DuX6HpS7CL7rWzX9rYPrmRTtQ4hHF7tD4KmFpbDFcDblFMXxUrQJuPvs8cqPYHwthm1r
         vvf9dKua/Qu7uWgdMjznvlgLLix9EF2jTigUhLrodzct+r/jd/w0BJdMEnoJJ4ayEaaf
         IKEBJIZPGgRcHsuaho9GE6xmAFUmTnMZlC+/W/Y9GjbRjIZJF6BBqdDvRPTIJACXrh/6
         uw63SQnd42v9Yh/+uslLOMHk7QxNmVpJI/3VMjsCwAiKvHq1I/A88EZbwpcIeugweO23
         pbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670050; x=1796274850;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IQC0rmb60+7fGUy4+e3ojRybTycBzBk8+WNROPwteGo=;
        b=KMwwETSOMQVsRNrsW4CK8Xo2JdTxl/YITon/fP52epzZOoiNZwIY39/5pp2+uPcs0H
         jy0lWAHNQdTP8BCBFMRatByfJ4zz09fw/d6Wao283X7EbT255ME4fwqfQ4ezI+kz/Qvo
         Y7sJYHKiJBThUENCpbQeWED7ejlOV+BwFC0RAEorIqgZqHz17ClCt3v+hGeT+EkDhx32
         HEpHaLaig8SD8VSM/AkUoUxvYwklSb5BwGB8rIpaNhWho+e/icjBZHIITohokVQ0KIMJ
         UQNrfl/2oDIvC1EN6zonwLqkAJj4ahJBfZhkViC5p4Xv4s56dtUWbnfdC3gm+Lekk7v5
         YhCw==
X-Forwarded-Encrypted: i=1; AL+hErHdpREF2pzptGyags+OAFQrjMAGTfcv2+slJauQ4s3yhiQlOm+yXg2oS/xSkBNjcRKjgX2T3a7BLr5MZUYrKa8n@lists.infradead.org
X-Gm-Message-State: APuU4Z90HooZn/8zCuIHSFJycss4vO/ZxR6ySWpIQHKGl7579yei72gw
	hNHe18XQCgwyDAMBLeg2838PSir/rPVfVQCoL8zgBtJdYqUzZIf3KWYRmkfWnVNnaKT5cw==
X-Gm-Gg: AZFdTZd2l6+/zLOSizc2d9gT+6r3QBXudTRYkWJlNnX6YcCyri1td0TYhYYYNho1Ci9
	fMiiXWn2ZZSQWNilzvT+XZcdKAR6fxUS1vwABdmdpdhwmNklwyz3400MEWm1HDyFRTdt4rUYlvg
	FwIBn5lmf3OGqnGDm3amVaWOtuYQJaDKA3CEcGsgxaDp1Ct7y33a6z9CzQfYzdmq4FoWclljaEL
	E5x9zE7sYucuO1+8zT80YFoKGrpxpVjyy/Sb/T/r4OaSqNI8wl3HKpAlwI71a7ugcAwmBcaD7Go
	LNp47Y9DnzqKyU26xiAU8dMTtfTyCR3YYkGFm29sd3w6n+GSfQtXN5zwBPou6mTXnQ1Cq5Rtsq7
	Hu7oxJEU7uL1HDC7X+DcqDZOe+5DNAreuS//CwgQcFVcHZAW3BncwY+3kdOQgh2WdfLc3qcvqxK
	L9Itqq8GD1La2/G3MiAhY8gc7bzJ9AHK2r4cb/sbjiv2opX6e0n5PRwy14IXObI7zVMGbYhU6ib
	UeyEJYm4h9V7nM1UgKybQQlbjBg6Xy03KJpDiEqqCfAnZXg7Yo9hZEenEtxclTJeDTolxonHxwl
	lmGL8kFWTE1ZBfuoGRxFEn16pcYmLXC74rM=
X-Received: by 2002:a05:6820:83c2:20b0:716:c772:c70f with SMTP id 006d021491bc7-71b39623cd7mr12571634eaf.86.1795670050407;
        Wed, 25 Nov 2026 21:14:10 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm13907873eaf.13.2026.11.25.21.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:09 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 23:13:50 -0600
Subject: [PATCH v2] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NsQ6CMBCA4VdpbuYMrUgrk+9hGAg94KKleBCiI
 by7ARdH1n/4/gVGEqYRCrWA0Mwjxx4KZRIFdVf1LSF7KBSY1ORap2ecOJBgIM/VRA9shwlZXhj
 Fk2DlrCPv8mvjMkgUDEINv3f+XiYKOh6nKJ/9NuutHoRnjRpzr71vrtYak93aUPHzVMewfX6Iu
 RxALJksz1Jyxv8j5bquXwydN+QNAQAA
X-Change-ID: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795670047; l=4132;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=sn1/LETHb9l5ZV1gGwt2OIOVEadtpiYZmU8VXT/KLM4=;
 b=Fspx+wv2picpFbsKN9ogP399KLyj59R3MswLn7ymZsrv0ULnFVlAH1GfHX93CuEIG85Yc6w2A
 iZtsCrtCZ4pD4u29I631RHiV9upWNfX/oTc7T/+NexXnKxgAnX0Wje1
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_211411_812552_628076DB 
X-CRM114-Status: GOOD (  22.33  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the driver probes as a platform device, the GPT clock event is
registered late in boot, when PSCI CPU idle may already have put CPUs
into a state that stops their local timer. Those CPUs wait in the
oneshot broadcast mask on the hrtimer broadcast, and
tick_install_broadcast_device() arms the new broadcast device to expire
at once so that it wakes them.

mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
clockevents_config_and_register(). The forced event fires while the bit
is clear, the status register stays clear, and the waiting CPUs are
never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle state in
use, this hung the boot in 20 of 40 boots; with this change it booted
16 of 16.

Enable the interrupt before registering the clock event. The IRQ line
stays disabled until enable_irq(), so the handler still can't run before
the clock event is set up. With the bit set, the timer that
mtk_gpt_setup() leaves running could latch an interrupt that
registration doesn't acknowledge, the kind of pending interrupt that
commit fc686d0037d7 ("clockevents/drivers/mtk: Fix spurious interrupt
leading to crash") acknowledges in mtk_gpt_enable_irq(). So stop the
timer before enabling the interrupt, until the core programs an event.

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
MT8173 with PSCI CPU idle the boot then hangs about half the time: the
broadcast device is armed at once to wake CPUs that are already idle,
and that event is lost because the GPT's interrupt is enabled only after
registration. Traced on the board with prints in
tick_install_broadcast_device() and mtk_gpt_init().

v2 answers Sashiko's review of the resend: enabling the interrupt early
also enabled it while the clock event timer was still running from
mtk_gpt_setup(), so it could latch an interrupt that registration does
not acknowledge. v2 stops the timer before enabling the interrupt.
On the MT8173 tablet, with CPU_SLEEP_0 in use and prints around
registration, v2 booted 16 times out of 16. The status register read 0
before registration in every boot, with v1 (3 boots) as well, so the
stale interrupt never showed up on this board. In 3 of the 16 v2 boots
it read 1 just before enable_irq(): the event registration armed, then
delivered once the line was enabled. The tags from v1 are dropped,
since the code changed.

This patch was developed with the help of an LLM.
---
Changes in v2:
- Stop the clock event timer before enabling its interrupt, so nothing is
  pending when the IRQ line is enabled (Sashiko, via Daniel).
- Dropped the Reviewed-by and Tested-by tags. The code changed in a way
  that I think merits that, but let me know if not.
- Link to v1: https://lore.kernel.org/r/20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com
- Link to the resend: https://lore.kernel.org/r/20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4@gmail.com
---
 drivers/clocksource/timer-mediatek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..14723c6f5f5e 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -339,10 +339,12 @@ static int mtk_gpt_init(struct platform_device *pdev)
 
 	/* Configure clock event */
 	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
+	/* Stop it so that nothing is pending when its irq is enabled */
+	mtk_gpt_clkevt_time_stop(&to, TIMER_CLK_EVT);
+	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					TIMER_SYNC_TICKS, 0xffffffff);
 
-	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
 	enable_irq(timer_of_irq(&to));
 
 	return 0;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


