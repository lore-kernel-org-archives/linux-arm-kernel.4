Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74CD606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ngp830Ce;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QP7jnb+F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5zaK3r75fyAGpe/N6SPZ8mxSlYoXEgN0WMAWjFhZmTw=; b=ngp830CeJieYVA
	E4BJIv8SMmsYhIP6SDJiEm4ABRBohZF0xJHwUt2I7VXc16EYV8h7PJp1WeVx6Td2n+Z9qAbXxoqMn
	wt7Dg56KBjXBVPtGas2aZIsuPHsdK1SIPmgAe6I+Xyk0+H7FV7YyqW4SKuZ3/RnbFbzNbv6h2VLj6
	D5Z57LSjoKRP5ki72TcLpGfh9hgelEeKWKkXTSzAlG4Px7+ozZsNwFXUYbugw4FtZ3l7yuPo6yg93
	3oy/z6TRDG0+4TrjmokU1O2/sOBl8vOw+0ZiEh5sLHerJj9V6Qq5YuN1TV5ZCifc5YNMlk/ryxraC
	yUwFQtgmE9gm4tClWeMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrHK-0000000CvWJ-1mw0;
	Fri, 13 Nov 2026 13:25:18 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrH6-0000000CvOP-2mVX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:25:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-497614c95f0so425483f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576302; x=1795181102; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zaK3r75fyAGpe/N6SPZ8mxSlYoXEgN0WMAWjFhZmTw=;
        b=QP7jnb+F92wTAZNS0a/oYXxq+R1J/WqYsv36oS20xsFE1nrw2ql00p6NjvZaSMRFaH
         5LoSyG4Mv0MiGVySiL7al4puVuT/kO+gwCopsY6lMgb3cm2l59Rab7Q0bGjtNC1t+KX3
         9aktdikMWBYzZcC6MOLdgNovT2VPBx8N/fbt2z3P8bQCCx2DtGa/k+g5BBT+9FuG+wAG
         4emmUXcWGulmSq/5E5CtBR6uQz3TwneZkkWKzgLZzRZDDi7ZoBSFkBttWakwx9NOwPDW
         3BCpzgdfNo8Q7YgGoYhza91JxVKRUHdBKf3PfWinYoZ+itpkr4MBajm7iy6x1q5lsU47
         HXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576302; x=1795181102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zaK3r75fyAGpe/N6SPZ8mxSlYoXEgN0WMAWjFhZmTw=;
        b=llZPBs0DJgvlIR2XMkXrzQnqC4uFNAOmDf0CQJcUE/vfiMBXYiu9PcIjUfYUOVWb5a
         Erh3/8ONoDJOIGXZd51DEq63j6mXNeCa9C/hQFTHfO+2HyocTGggjsT3lSrzOe+GqaZH
         36fTMRsHJW5c5OegcvJecGPPXaRh2zGQtFLMKR9HT0QzyZvOKk90N6VUhe3XsfQlV4/y
         v5Q4hDaoEJIV4Dy4kXb+o6A/Mdl2TLtTS6e6NmXNkFFS4Gw1iyLA3jKr2C6V2GG+eYuZ
         nNoTk7y+zLk394Q0nkoUDKwn4qeJdXVEZ1bAsuxnZkb/vkZfR9goBMI5CdhL9hAKJlqZ
         xYww==
X-Gm-Message-State: APuU4Z8cRStrUkczOVdLntCu17zyPE72G4z5yd/jtvsRdl+ZX3AexK3P
	JgjecqHc1zR/Z7Spp/4mHT8GIk8j+uSdrSiAO3qbYaeh/MooNxqof+LC3clngpKkwxnsEQ==
X-Gm-Gg: AYBFou2bXUDHZiol0IwMVq+edVKkzRXE3tLVQtZVRz/o4Y5armh9xi1LFlWX6lBw9eZ
	ZgAPPd/L2TRwIxpM7ETkg9rKdNTrargAkbpYXmCHKtV0twka/y8ru3aYQ9L5wlTMd53m8Ghvui3
	ETPfzdPUGIRnTVP+PEn7gofogTC453o2LiMbFOCCn1NjIeXJ6GWVn76IBZnQS6QvfCGZnC5LAn+
	SIrlkpN99dtde1db8UtNV4yUXpDnOqtyJTazLlUp9el5gdITLIJDYrlgNMYyJftirlwNRsJOacW
	QU5Ib0Ap59V90DRn/gilEwAkmAEJtlbDJpZwNyraedKzfydCK6Yjg7d0RAfA1Vpp4OE7Q1IO3Ar
	UOS/HAGwEw8+nVtmcCNpRk5Bmv2GTxSDT3D078npE5VDs7dl9WA5WKX8b0EEP6UNcRH9LWV6dgF
	PjNgM9TMZfJALN1p+HpufPewlgMvY5lt4DSXh7LPhavFIzsCZULTlZ4oF5eBAL41wFXFqetwp7+
	k5jNrDLLn2KmAa9G99g5iVSi47NuogvwxGwh/7H+C7steBtHNwF6QBUJn/Y9dLf9fOVmsCZGkKh
	rh1ICTF7OtjNSWOXGm7XJO4TM+IAO4dcKvKJGIsXpl8NtLw90ZzpbGJ8wFIFk8N1Zn4vkIn0UT5
	UDFVEK86x5tg4lAKXU1PGdoQQCZxb
X-Received: by 2002:a5d:588b:0:b0:49d:8ce1:265b with SMTP id ffacd0b85a97d-49d8ce127f6mr623677f8f.6.1794576301673;
        Fri, 13 Nov 2026 05:25:01 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm4680211f8f.57.2026.11.13.05.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:25:00 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 13 Nov 2026 17:24:43 +0400
Subject: [PATCH v7 4/4] watchdog: vt8500: Add a restart handler
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-vt8500-timer-updates-v7-4-a1dcc4031b12@gmail.com>
References: <20261113-vt8500-timer-updates-v7-0-a1dcc4031b12@gmail.com>
In-Reply-To: <20261113-vt8500-timer-updates-v7-0-a1dcc4031b12@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820; i=alchark@gmail.com;
 h=from:subject:message-id; bh=OwJrpMobo3ei/jcBwY7ucGlfHptMOi0z7hTygfzHI6M=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR951+4t1B7S1azcYJz5ITif+9trrD0BLrGLV92x9do4
 6RL8kmhHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1YgEjQ8/7/oUK3+bHSH85V2trxP7D6+LsrQf2HjzYytNWtePVtUiGP1wce5d
 wPeN2uJehqMrC/Hk737eHih+fqis25D2tvhRjzgoA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052504_752879_A7C449B4 
X-CRM114-Status: GOOD (  17.42  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reset the SoC through the watchdog when the machine's own restart hook
leaves it running: the PMSR write in vt8500_restart() has no effect on
WM8950, so a reboot there ends in "Reboot failed -- System halted"
unless a watchdog armed from userspace happens to fire.

Arm the match a millisecond ahead of the current count, which leaves
ample margin for the register writes to land, then wait for the reset
to assert so that no later handler runs in the meantime. Return 0 if it
never does, or if the match can't be armed at all, to let the remaining
handlers have their turn, as an error would stop the restart chain.

Register at priority 0, the last resort, so that the handler runs only
after the ARM machine restart hook at 128 has failed to reset the SoC.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/watchdog/vt8500-wdt.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
index e0f838fd1d50..bde8a5e1a9d4 100644
--- a/drivers/watchdog/vt8500-wdt.c
+++ b/drivers/watchdog/vt8500-wdt.c
@@ -4,6 +4,7 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
 #include <linux/container_of.h>
+#include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -25,6 +26,10 @@
 
 #define VT8500_WDT_DEFAULT_TIMEOUT	30	/* seconds */
 
+/* How far ahead of the current count to arm the match for a restart */
+#define VT8500_WDT_RESTART_TICKS	(VT8500_TIMER_HZ / 1000)	/* 1 ms */
+#define VT8500_WDT_RESTART_WAIT_MS	10
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
@@ -75,9 +80,21 @@ static int vt8500_watchdog_stop(struct watchdog_device *wdd)
 	return 0;
 }
 
+static int vt8500_watchdog_restart(struct watchdog_device *wdd,
+				   unsigned long action, void *data)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+
+	if (!vt8500_watchdog_arm(info, VT8500_WDT_RESTART_TICKS))
+		mdelay(VT8500_WDT_RESTART_WAIT_MS);
+
+	return 0;
+}
+
 static const struct watchdog_ops vt8500_watchdog_ops = {
 	.start			= vt8500_watchdog_start,
 	.stop			= vt8500_watchdog_stop,
+	.restart		= vt8500_watchdog_restart,
 };
 
 static const struct watchdog_info vt8500_watchdog_info = {
@@ -107,6 +124,7 @@ static int vt8500_wdt_probe(struct auxiliary_device *auxdev,
 	info = container_of(auxdev, struct vt8500_wdt_info, auxdev);
 	watchdog_set_drvdata(wdd, info);
 	watchdog_set_nowayout(wdd, nowayout);
+	watchdog_set_restart_priority(wdd, 0);
 
 	/* Let the core feed a watchdog left running, e.g. across kexec */
 	if (readl(info->regbase + VT8500_WDT_EN_REG) & VT8500_WDT_EN)

-- 
2.56.0


