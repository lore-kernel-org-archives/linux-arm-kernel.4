Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82EE606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J7i7ek4N;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ND3gOHEX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M8xbWLTM1tDLF8IdDJE0ybXERn0+Q9azTV5NEZXnfIQ=; b=J7i7ek4NmUtimB
	8WDmq4Mq30BqJ1To6kPJ1o44oKjsYdTTdPV5PHhYHoKNZ5ZpOg0Eoaj5WMBM/chlt018GZUfGJh86
	2h++zXmnGwLoyBiRJ606aqdyN4WfjEbVUY9yLFJxewvB0EhWWBPW2XeVXoA5kt0KaS53dPdkCbj23
	Imi/PEh1szUqcuhgtSBvTh1qNNOprxboRbeyJ87eUOWXJ1P6L5GsHzZ2vFjcYW3lOk1oGb1cn6zOZ
	EBPQA1qUlWzesPeXSxeRZiC0ybqj/SwoZ8yXNsgbCy/EBkpq0ij9d5p2L6kqmS66QrJxjWIscisYI
	wu+DXiTJuylRp7r3GU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZxX-0000000Atow-3FOS;
	Thu, 12 Nov 2026 18:55:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZxM-0000000Atle-0N1J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:55:37 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso860835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 10:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509730; x=1795114530; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8xbWLTM1tDLF8IdDJE0ybXERn0+Q9azTV5NEZXnfIQ=;
        b=ND3gOHEXeKklp1dHBg/iyH4Y53MaHcxY2yO0YK5gqyCScb94T+MCZrr2XgZxQvdxmg
         e/BqZSNrIwZE3jJQJXcelgidsxnc6HmuTGA6PLFWOspb7aQOmZtUBObPa7R8Cav5ZiCD
         L/HPIAzmuijrZr3DYRzTZzxbhFGQlU50r3BS/eE6qv/8yduViTTNzzMp1VBwaRZDJ3fG
         zpc4Dsr6Qm9lBbJ8vBrTKpVUn3GrL6GaaoPl4EVq/YHgSncLdFUhGFz+hEICR2k3m2E3
         /tL9R49LHS1wBVGFBgo7E1u6Ytn6EK/pqPDVYw1hDDkF12KWfAgE1741uzP06pubbdpo
         IA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509730; x=1795114530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8xbWLTM1tDLF8IdDJE0ybXERn0+Q9azTV5NEZXnfIQ=;
        b=GzH6HsrfafxvlgvIVDpOLV4YoFJhr6dADMxyBAbimpjWO7Ea8IS96v5CtbjTzK7MUn
         19y4K2HJkBCYJoNLnBc8ghI5lDolUsXBf9zSvo3mo2bwS8UkmmXR9G5J8xURRCX1RnCm
         FrP1MX6AMkRhfroNYZuMZPSyhBQfU8+NkfVpfdz18H1nZN+US5+Y3xMVrQCHOVPOGdYk
         7TuXAUK4BiLAhLAEWGmYxxtYB6cMRgRnnLYLr/g693/yo98uB2YPbgDw5vG6KVyApGvl
         GnsVJ4iEzXCaWRhpNTHmNBHagkw9x0ZzZXzde3Ze2BbyGOuTqQhA2Khv4p/qgP4w9Idy
         fatw==
X-Gm-Message-State: APuU4Z9irmhRUxePFeJNgGP3rc8ARIgAsJ16zHsvXVMu0iuWVcKMKXAr
	/x793OjXBAQhB3s7H0YhK+UKv9DrBd389AfHcS++RMO9DtY/Jm9FTAEu
X-Gm-Gg: AYBFou2zRFp9kn1VgHYSdOOWaDEXSxLMl30z1n3iDPtS9iEg+OGKtJLQh5ODXZsVRWD
	bYG4bNYSQWIMsn8KkkHnxGv8jNKUjHhrUri0AKbO0ahcPD/MY4L63171ogme2q8uf5CxUgZSFbC
	+ntvrYPcxiGt5oeRnkJtaurbxThb0Sza6BJSDiEATzbUTmJ5YbfI3iSOAD7FfbyXWqYLpmJCsgz
	ijuRnob9ZoGUEPljoI/njMioH9m/sNvUKImINe4MxVRNo1vsv9eyFG1rv82FJmyPErtRv89fLCa
	UUf9FVOmFouiOYa4cFYPHD7M1RHV+JA842YzDEZH7A0X9jrExdmjXlcfhtLPjJmKlrEk2Unna0e
	Rf0TsSYoN0HK6JRohS61kgo99uykfIjaLQnoSNKCEUtggkgAjXJd4UcgYWFd01RtlXeEm0XSTrW
	XDY67ULtDYokpD9gb08bvMALkR9amHwN65pKilr5eIPpCGVwGrMwHlK9NNy7aUTUIgbs87CK1JG
	4Gq2yiqB1qzM9eAuqh1K5dAkxx5OVIUpOeJwW5CoHbtJeDRPxgU25qAZ4z+CqEHDUvjrbiyxsR/
	gX/Ps44vSWRG7pmKZLkZZCQglfFmhs1jMqFUTmwNGckrHB0A68cvh0la5PZLpf7KU7OTuwWllcx
	BUl0iPcir
X-Received: by 2002:a05:600c:6092:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb55a44be7mr2737975e9.8.1794509730281;
        Thu, 12 Nov 2026 10:55:30 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm71734755e9.7.2026.11.12.10.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:55:29 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 22:55:11 +0400
Subject: [PATCH v6 4/4] watchdog: vt8500: Add a restart handler
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-vt8500-timer-updates-v6-4-fd1cea645d1f@gmail.com>
References: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
In-Reply-To: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2437; i=alchark@gmail.com;
 h=from:subject:message-id; bh=mhiGhVHaKTYXayUI3xItTRTmu/lVOn1Xybq1LOkaLfI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9457KJNYU8KBxuukRh1TepIj3vSFT2Y3K/HRezn62L
 ZPLXcmwYyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKne9Jbhf7bE/eTPHLPCjjzMiZf8bpdj4/j46HTVI4v+dUrFXHPf9ZiRYc2lfdM
 Klr9VNJebZHyI5YRmybOTQT9V3px7HCA7U0SllxMA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_105533_628134_73D0C1B4 
X-CRM114-Status: GOOD (  15.13  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reset the SoC through the watchdog when the machine's own restart hook
leaves it running: the PMSR write in vt8500_restart() has no effect on
WM8950, so a reboot there ends in "Reboot failed -- System halted"
unless a watchdog armed from userspace happens to fire.

Arm the match a millisecond ahead of the current count, which leaves
ample margin for the register writes to land.

Register at priority 128, the default for restart handlers and also the
priority of the ARM machine restart hook. That hook is registered first,
from setup_arch(), and handlers of equal priority run in registration
order, so this one runs right after it and only matters where the hook
fails to reset the SoC.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/watchdog/vt8500-wdt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
index e0f838fd1d50..0ce1e2b06410 100644
--- a/drivers/watchdog/vt8500-wdt.c
+++ b/drivers/watchdog/vt8500-wdt.c
@@ -25,6 +25,9 @@
 
 #define VT8500_WDT_DEFAULT_TIMEOUT	30	/* seconds */
 
+/* How far ahead of the current count to arm the match for a restart */
+#define VT8500_WDT_RESTART_TICKS	(VT8500_TIMER_HZ / 1000)	/* 1 ms */
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
@@ -75,9 +78,18 @@ static int vt8500_watchdog_stop(struct watchdog_device *wdd)
 	return 0;
 }
 
+static int vt8500_watchdog_restart(struct watchdog_device *wdd,
+				   unsigned long action, void *data)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+
+	return vt8500_watchdog_arm(info, VT8500_WDT_RESTART_TICKS);
+}
+
 static const struct watchdog_ops vt8500_watchdog_ops = {
 	.start			= vt8500_watchdog_start,
 	.stop			= vt8500_watchdog_stop,
+	.restart		= vt8500_watchdog_restart,
 };
 
 static const struct watchdog_info vt8500_watchdog_info = {
@@ -107,6 +119,7 @@ static int vt8500_wdt_probe(struct auxiliary_device *auxdev,
 	info = container_of(auxdev, struct vt8500_wdt_info, auxdev);
 	watchdog_set_drvdata(wdd, info);
 	watchdog_set_nowayout(wdd, nowayout);
+	watchdog_set_restart_priority(wdd, 128);
 
 	/* Let the core feed a watchdog left running, e.g. across kexec */
 	if (readl(info->regbase + VT8500_WDT_EN_REG) & VT8500_WDT_EN)

-- 
2.56.0


