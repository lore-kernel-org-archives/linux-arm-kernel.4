Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFC3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PXQT78zR;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VQVB+vHH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=q8x7zVGGkfSdWA+EkndmqEqSgl70Bo/p7FSSNehigJg=; b=PXQT78zRE48SKhWGvEh/g4q0Va
	FRPD4m/6W52Vst76gBNVXDtxN/UNlZA7tGofrtJsGZrm6YFSRS0W/QbL+AwwaHMzkgnFxwE952c6c
	DZ+9D0xsgYsKNERYEkwb3phq4LHfn+s6163u+emX5d63aLmbE1hGCMmLKpJ7duVVt4HuX21sALgmb
	Zn/kAj5u5Aqet2HLDhH/qchuFM+Khkov93HbLO/Ruie7+XteRGGKPGnQCCBmKwjoSmBmpYpg4bDl2
	KTO+54LyRb6H7SaXB0RtheXrgJCeheEH3Q8Y2oZvqromBEt15rqVA7CooJLrr7PRwWDP1Li1CdbOG
	V66BJMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOAh-00000000cyD-0GKE;
	Mon, 09 Nov 2026 12:08:23 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOAd-00000000cwl-2Qpn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:08:21 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-15ea896ddc8so1438099c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 04:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794226098; x=1794830898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q8x7zVGGkfSdWA+EkndmqEqSgl70Bo/p7FSSNehigJg=;
        b=VQVB+vHHRYO/c6ADphSOberJeb/AcxVIhkj7/l237BInDdsert5zos9Qtj0tW6wlEo
         xRqlwST/rZmzJ5cZRk4a8PdtIh932Y7PGZGjP7UmLNqiyM07GziJUtFC4w/N/AyF2+No
         eGvdxj3vbigvByXqCHaGqKSEFa22WP3Bk/IxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794226098; x=1794830898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q8x7zVGGkfSdWA+EkndmqEqSgl70Bo/p7FSSNehigJg=;
        b=01Qsj7toFjc13bK8M9FwvCQcTCrv+JLf3T+KUJl1JG/4lzrA5eJ0v7JrkeysqvI+iw
         ZjdSg0Jf7TuqeKUJaGeSIwh8epeelRiYsRsDLDp/cvAQZdrg7NxFtTIr5G3MDUrk1yk+
         RuzokY5wXoubzJ1s0NyaXGGA+4+ffhPQRpCijQgHJNB8OH+rsLwiinUn9BKZeIlg5tQR
         UGzRnuhGwD7QY8/BJA7YekJ0B6b6Dmv6owADA+BBQb9/hZwh7pT3ocvDtGQ+QUQLI9tt
         8GZryPdq4SFAIhFCc0nZXaLQ2p4u1eQldlPqgPp+c+DTiQ/j1rkiSF5lTe9HF8dviOgB
         kvuA==
X-Forwarded-Encrypted: i=1; AL+hErE3gX3EldBmNMFKTV0gdMR6LYXyq/Kt+7Tid3GQWGmLKw/l3ikoxXh6igDcYTrq+RUOLYOJMouHAp2ca1YEdanM@lists.infradead.org
X-Gm-Message-State: APuU4Z/U4WquCazGJZxIipU02RxjyBAgqt2b46nD+dKzJmQhLvGpo5Ho
	5hxU5E1IxV+yBv/Jq/huiunSfLN2f45fcJP29D8wh/Y1Ua+PD3GlMSeossJnWMXOUg==
X-Gm-Gg: AYBFou2DmespQZqQ1coQ615QyRGeQkEqWSyMVA+cQE0JoOsw0RukJRoUSqvOMgaBgPo
	k5DTrB9Hw2lsz+9LBbzoEWlSiV/pL5yKjeiAmT2Upxi6pyTk39aEjITY5XLimB3sk66jXIvu8BT
	Cv0u9xso+ftM4pYzrT1ANA8nkvbvkopjlyqluR97FNGrk0jmXkRSLWNqzIZMmWZjPRzDtCWl2v5
	Xahtwo0O/EhYAOeKaoTz7KiwuU1OsJbyOB4jpRkTPlnmDs2s+gyF4x81eliuZiky6kFnyQ2nr8Q
	oR7owm4NaLigEzixMwy9AxpJiUXLIsqAIdZKuvejSmiSw7z5iKtZT2CqG34jqgU4tvsANEzfMfO
	6tBlbc5GMRYqnx5KoGfVsJz+BiTDGp2qXQxvQ0ouToOH04GtztU5crZdVTacxWBqp7Htf2ouIFF
	0WH+Y4xNFmqsH7kBlfnX4cYRvg2gDh512VnaUekecVtMtXguocyA5uTjf7Cjd90Z/YEX4DLI2BX
	Ru0/dm5GgHqPrMKFEmbDAGk6Ae0jXF7q/VjEItWmJI0eAbq6URH/OZKKX08280RORb8ESAgyQua
	Ipv/GHlUWHCgA4B8I6k7cB+n7ehoilFrtLi7nBbGBdresFYq0LY06MMgKShPxGJLYgzCV7CtypJ
	l/Wf3RA==
X-Received: by 2002:a05:701b:270c:b0:14a:8cff:fbb8 with SMTP id a92af1059eb24-1b39fea8a78mr6100575c88.28.1794226098355;
        Mon, 09 Nov 2026 04:08:18 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3755e936bsm16025308c88.6.2026.11.09.04.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:08:17 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Ryan Brue <ryanbrue.dev@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clocksource/drivers/timer-mediatek: Don't override the arch timer sched_clock
Date: Mon,  9 Nov 2026 20:07:56 +0800
Message-ID: <20261109120757.847266-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_040819_782181_BA8F7BE5 
X-CRM114-Status: GOOD (  21.88  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the driver was converted to a platform driver, the GPT probes
late, after the architected timer has registered itself as sched_clock.
sched_clock_register() only refuses counters with a lower rate, and
sched_clock has no notion of priority, so the 32-bit GPT counter, which
runs at the same 13 MHz as the arch timer on MT8173, replaces the 56-bit
arch timer counter as sched_clock:

  sched_clock: 56 bits at 13MHz, resolution 76ns, wraps every 4398046511101ns
  ...
  sched_clock: 32 bits at 13MHz, resolution 76ns, wraps every 165191050201ns

Before the conversion, both drivers used TIMER_OF_DECLARE and
timer-mediatek.o is linked before arm_arch_timer.o, so the arch timer
registered last and won.

The narrower GPT counter wraps more often and is slower to read over
MMIO than the arch timer system register. Doing the switch at runtime
also runs enable_sched_clock_irqtime(), which may sleep, with interrupts
disabled, causing a splat.

Other drivers worked around the same problem in the same way, see

  commit 37b8b003c483 ("clocksource/drivers/sun4i-timer: Only register a sched_clock on sun4i and sun5i")
  commit 10720e120e2b ("clocksource/drivers/imx-tpm: Exclude sched clock for ARM64")

Only register the GPT as sched_clock if the ARM architected timer is not
present. This currently includes MT6572, MT6580, MT6582, and MT6592, as
seen in their respective .dtsi files. This follows the example of
sun4i-timer.

The analysis of the boot log and git history, and drafting of this
change, were done with an AI agent. The agent originally proposed using
arch_timer_get_rate(), which was replaced by the author.

Manually tested on a MT8173 Hana (Telesu).

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

For the ARMv7 SoCs such as the MT2701, MT8127, and MT8135, the firmware
has to correctly set the arch timer frequency, as their device trees do
not have the clock-frequency property.

OTOH we could let sched_clock_register() reject replacing the current
counter if the new one runs at the same rate. But that would be a
separate discussion: if more drivers are converted to standard platform
drivers, then the probe order is no longer easily known like before
by the link order.

The splat is a separate issue that I already reported [1].

[1] https://lore.kernel.org/all/20261109095036.GA722431@google.com/
---
 drivers/clocksource/timer-mediatek.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 1b2cbcc2795a..ef67cc783635 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -15,6 +15,7 @@
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/sched_clock.h>
@@ -334,8 +335,20 @@ static int mtk_gpt_init(struct platform_device *pdev)
 	clocksource_mmio_init(timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC),
 			      node->name, timer_of_rate(&to), 300, 32,
 			      clocksource_mmio_readl_up);
-	gpt_sched_reg = timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC);
-	sched_clock_register(mtk_gpt_read_sched_clock, 32, timer_of_rate(&to));
+
+	/*
+	 * sched_clock has no priorities; a counter with the same rate
+	 * replaces the current one. Only these SoCs lack the ARM architected
+	 * timer, which is otherwise the better sched_clock.
+	 */
+	if (of_machine_is_compatible("mediatek,mt6572") ||
+	    of_machine_is_compatible("mediatek,mt6580") ||
+	    of_machine_is_compatible("mediatek,mt6582") ||
+	    of_machine_is_compatible("mediatek,mt6592")) {
+		gpt_sched_reg = timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC);
+		sched_clock_register(mtk_gpt_read_sched_clock, 32,
+				     timer_of_rate(&to));
+	}
 
 	/* Configure clock event */
 	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
-- 
2.56.0.455.g6c5a503b38-goog


