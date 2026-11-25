Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEE5606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 23:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sdL7fRZ9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VT7OEweE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XYTc/DcHZroRC4kTjFqOBmNj9WcBY99HUsdGTOAweDw=; b=sdL7fRZ9d+wXncCvr6I7ED1Vu8
	MtPNWrc+A2mrks6/CJfx3HuIBYmvHRuCJUBx4oSh50QTK3jmr1IFYvOLgQNu9ll546046/r1/Q9t0
	2k7zO/3dQd0UNADtskCkRXe8mGWXRUjXZzxsHkmO3ZuAa3IH2z5hws6+w5YnpGuBN3rB4v4+sEyB0
	72dode5vL0hpWxgdw8kDLczPRYrd854JCI+AiZCgq3EJ+6uthp3Z5WJutv35rF7HggH1a0WnqWsji
	OzBRHilt5Wk9hcNZCYEBOmtIGeRvIlqL/NDqDQVx+YEyz9/41P+FIGFq/6io42zXOHT30oi4i07B3
	/eY/qvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMJh-0000000BXks-01Jq;
	Wed, 25 Nov 2026 23:22:21 +0000
Received: from mail-oo2-x03.google.com ([2607:f8b0:4864:31::3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMJb-0000000BXk2-1Kx4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 23:22:19 +0000
Received: by mail-oo2-x03.google.com with SMTP id 46e09a7af769-8459f7bc7c0so2353146a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 15:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648934; x=1796253734; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XYTc/DcHZroRC4kTjFqOBmNj9WcBY99HUsdGTOAweDw=;
        b=VT7OEweElA1xcOO15QAesVJ3N1RRm3CQ4JYNjEgSud3zgMiWXDSSlTt8ExFfYO61X5
         9334MZvejOJkyafY+R+BZn3Bk0fWX+RjYB/nPPsXsUdTFtVALPyHmAhOhUZBajRqrUEd
         isJMQMLfO81ekL6ZR9mMMVoLahmka6KDl1em0RF+ZooNMkSRV4Wp5b+RyXzrmKtx9yrM
         RwOXHLyEBVgss8ye9YWqyDlb1n/a/1T7EIsrzrR6wn3AoJn5kMAeQT38EUPpKTxOTvMj
         c6AXTQ0uMsNbJSXUyyx27w9f1CBD0HplNlVF44HXEef+Z+o1CnuBuXM+BoxSuKm1ZTo4
         TS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648934; x=1796253734;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XYTc/DcHZroRC4kTjFqOBmNj9WcBY99HUsdGTOAweDw=;
        b=HVTLDyYOPNhff+gOdTE1ajdh9tOutl/D2kjqVp2uR01CubXLQHaWWRluwHD51Hpxv7
         7u5qPVAholFiUDyQAyPFrtkwK+/PFnr3QazDrBGR1sF8p/m5fnVrNNSe/oL9mKFnbBg6
         vrHnpvRPAkagmzciBr6AfazCc4B9gs1yNAF6A91X5904p3W3+YsFki1/9+FRl4AxrZwr
         GP9l+UfW0ssoM2zEbqZE6RjH7Vi49BjNMFje2O8qXu9Me88CF8A+El0OCxMC1ZF0/gLI
         uiU2kcsZzCDh8jinpa6c5MCv222WHJFqFrRZFLJgY9h5lfQcIcswoNp9m5QssIVx1+6l
         YSvA==
X-Forwarded-Encrypted: i=1; AL+hErHD4lB071Veaq1QMqt8qCm9aagdrWA/dDNvYR5HLsIF2bsB0mkTIg5+2nnnmFdluT0SqlbJjQsAacZXdzgFVj7c@lists.infradead.org
X-Gm-Message-State: APuU4Z87Y+t/JO04/kIU/iPFLP/AzT8RhcMKs6Cu+1XlEbEidygndpot
	ch6O/1lpBLo1ulgde8Q2Dk9lqGkoutlhEb/V8WHQtvZChAnGcDs+x1PV
X-Gm-Gg: AZFdTZdsg16mlpoWvCMrMrHTHpamHrT0mlq5Svq+q7yIqTXxZ/3JpG9IPlbUXlJOLFa
	jC5re4dXK8UJCQGSlUrKfZDe3iwGu6R4pSNRL0oKCLdUNp8+qJniBjzp93A/P9bRxY4/WdDx/xS
	0oHQ4awJ5Qg6AMkZTg29DhLur0UgwkPBEUw8+YD6sZ9ULjhdG69TZlZIUIoxZw3gzSqq8rzDFBq
	bdwucZxNAEQ9hF1AVH+kDbhS06rc129qoWqJHHuEZmMKXzJkgUkbnt7g8Uig1pFKKSUPQa2KAbq
	k5omCaVPevPO6YGQnd46pHfcyGCTylXHqbhW9/kh4Vt3zYSGrFSN0CynFeZcYBt6P2skjk+x/4d
	g1/2YSua8y2F1f9nR7QORbsbUA0iBvZGYRcKft0CpzeBbvCPCYeMDYPKzJ+l3qLuLL8XeMz/c70
	+sWlH3waw95ENw8X7vMNDoVGsyZQB7FJ4pnz0pK86ZGJ3UAGK0tBUdpPqjCXpRBIB3fnW3mtler
	Hz3NwDtSW1wJN6iJuTvSA0V/8AfsiHJ07nppS+Mkukcjqm3e9QXx+AT2muHvGL2o2UP4CiNxnLd
	Tcz4opIsLLX5MiRaAibHm1oZqG+q1LYdNLo=
X-Received: by 2002:a05:6830:4490:b0:862:88c6:1843 with SMTP id 46e09a7af769-8631598542amr20958825a34.19.1795648934144;
        Wed, 25 Nov 2026 15:22:14 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692d9f7sm14895213a34.24.2026.11.25.15.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:22:12 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 17:22:11 -0600
Subject: [PATCH RESEND] clocksource/drivers/timer-mediatek: Enable the GPT
 irq before registering
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NsQ6CMBCA4VdpbuYMrQQKk4OsDjoahoYeeNFSb
 BuiIby7CU/g/Cf/t0KkwBShESsEWjiyn6ARMhPQP8w0ErKFRoDKVSllfsTEjgI6smwSPXGcE3J
 4ow+WAhpdabK6rAddQCZgDjTwZ9/f4dre2ssZukzAg2Py4buri9zrf8AiUWJppbVDXVVKFafRG
 X4deu+g27btB+wAC3rQAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795648931; l=3241;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Z6bwbYGmDlV4q9VQg3ShvOBo1zqZq9E6xE6bSf63Eo8=;
 b=ze5Kfc37HiJ33uhw5RVqcNwV0MgJgYbChCd5ePQU/CqzWvUHCPjZZNCW+BG7LC0ljYNZu0xr3
 nezA6dNSplsCElHWsNlsqiUEtzGQAQD9zIp8FrdgrcMs3stihwbx7bd
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_152215_469110_1045BCB3 
X-CRM114-Status: GOOD (  21.58  )
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
is clear, nothing is latched in the status register, and the waiting
CPUs are never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle
state in use, this hung the boot in 20 of 40 boots, and in none of 16
with this change.

Enable the interrupt before registering the clock event. The IRQ line
stays disabled until enable_irq(), so the handler still can't run before
the clock event is set up.

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Reviewed-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # on mt8167
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org> # on Hana (Telesu)
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
MT8173 with PSCI CPU idle the boot then hangs about half the time: the
broadcast device is armed at once to wake CPUs that are already idle,
and that event is lost because the GPT's interrupt is enabled only after
registration. Traced on the board with prints in
tick_install_broadcast_device() and mtk_gpt_init().

This is a resend of the 11-03 patch with the review and test tags from
its thread folded in. The code is unchanged, and it still applies to
v7.4-rc4 and tip timers/urgent. As a 7.4-rc1 regression, it would be
good to have it in 7.4.

This patch was developed with the help of an LLM coding assistant.
---
Changes in RESEND:
- Collected Reviewed-by and Tested-by tags from v1; no code change.
- Cc Daniel's oss.qualcomm.com address and Chen-Yu.
- Link to v1: https://lore.kernel.org/r/20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com
---
 drivers/clocksource/timer-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..1b2cbcc2795a 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -339,10 +339,10 @@ static int mtk_gpt_init(struct platform_device *pdev)
 
 	/* Configure clock event */
 	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
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


