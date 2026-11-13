Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B6B606A88B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dwgYq7te;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbgGnqYc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6BwyZXaVSatDJOrT+DlVGlFui1bbW5cnZJSxQxMX77g=; b=dwgYq7terDWAoI
	Y+xihFdE43LWYDvTgTqjldWebdHPvyypV7U3u5RcPZOUQkVck5xNopKIwZUIpc6KgI5XstX8swmeQ
	mnymcH2h74jtG6zzTyXqBZKaE6vVe8kV9U/M2wmMQc9Lcuzm4OOSQelFrufuroTknsPnjp462wOL4
	8wl6w7rlS2FCQPORN+IPxHQA2opXQ0hacb54vE6t4CWoONdVz0JffQ2ztSiCtCjBjDcliDPY9Gw6r
	0KrJGsQA09EaTMpxUPXZ+xWnv1/BXcpKphuQtCL0681Onp9v5ArIw1zzQE0dxa1Cbs+e63mpmt2j/
	3Fr7J4wnM5wCg/LJF8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrHK-0000000CvVU-0QN4;
	Fri, 13 Nov 2026 13:25:18 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrGz-0000000CvKY-3vf7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:24:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-491846221ffso1017002f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576296; x=1795181096; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6BwyZXaVSatDJOrT+DlVGlFui1bbW5cnZJSxQxMX77g=;
        b=cbgGnqYcjpD1VN1SLpVqWEQe6+b+Y/04v/AqqCRoYwCaaHt81CgBxd1zko4/YRjsHY
         MCN/y6IoCmnp3f0JX+uQWur0T5vbilXhCEE33+i6XmjFOmsrOpvAu+0Z1zMKl5h1FEDd
         fxT9l2fU1slK6LiziLpRwaGa/qV6VNrpY16Q1gyYk+6hL1VEoZW6LhStiaJVi+ce9ohs
         NQQ3dBegL9DPU2YqC+okF3OuD6G2FL196F/kHSqdl2Qys1df6F4mP2c+ZohEQX3yYwE8
         iwJZhcP05PP79PfQmySMf9BGHRjZy6ghBWpnjYvuzrgeYAOn4wMh5sP9ASpdcAXJLLYM
         Jv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576296; x=1795181096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6BwyZXaVSatDJOrT+DlVGlFui1bbW5cnZJSxQxMX77g=;
        b=NrD6WRFe52B0s5PbvBLRWQ83/ZEUrNESlyRYEgYxVCLTuGUoDG5/xLcHZv4IXjHIIP
         7drW6+GClHEY3NbEnGp5BTAACSlYrhhJeSE5GEDcDYEpAfEKYiq53RjAqz6kKh2k2d9v
         Cj5yxzWKLf7xKNX3v3dFQYSVOYl6qVrDTCoDksmME+HeVIWoY2fdw73i3T8e59pHpqx5
         d1AtS301iacaDwWmkXi8/NA3Tz+/V1Sd1AeSOCZv/0Uu8wShEozTvOAjBxCJFq+sYCeb
         zKOwQy/CiaHQbeNky7/GXXcULF4JygHKHRmgsnJJH6sdA7lsNrn0iwNAHYEonlYyjAYL
         BpVQ==
X-Gm-Message-State: APuU4Z+Gegjlt8VxxZsmSKZkUjP+d0M7HobZyw4i1y0sfEFGxYTdNgfq
	88HOLa1+mVf7xBvsq8GRSymW5SP/kC7UKFHR2NOpCc+AK1j10A17019PduPp1JTRKRf0zg==
X-Gm-Gg: AYBFou3sNDX9nR4rfjluGOetLzZmkc1uCbSXBr6JSJ+19ru/eUMpu/6VTTFIw5Gfl8z
	qShdr0hXhmFhkiCEk+qhPgtO32th6mbe18DgFkU79GfqG+URECw9vDXg+wruJRhC1Mbyb/N0Ilm
	MlEhNOAUkN2l6FPNIMl79LX/3WRKwi8BblJTR8PSOVrQKeseALsAhJBmAGI8inF7OHrbbvWRaUK
	sddXmAsTPF5EimgzjLDQuvztu9oW/QHpcyroXqrpqNJLWcCvWN0Hry2UEsH9bAALUQQQMf8ETv2
	8LbBw3G+G6dbKf3ZPS1T2Cuoj8tI2pQsODZZJXZhp5P/kRzjR4MP0JTMyxCVnGMI/CA2pjnQKfJ
	PTVrUUmQYKNs8JG0P3rFxJar7z9BuFbYsGdq9o91Jp3NnvxxIQQAGI2m/LT3qm4dBjU6BYxGwCZ
	vrkYy1NMNDoxTA2fKMn45h0XJJrDD4bSFDVmEXUhwVPgP9NlA9xZrpixXiMeEiqA/goKRr4wR3N
	uTO7i0z0AfSQACoqspU1961sYHKEBCCaMs2JNKTL8Cc13IfHUTRKjQAy1UMD/xsC8EoB8whEL61
	CjZNSKLB3YWlB3frg+VHQysLAOI1HGhq1HwmppBxLNYJLHMm0J7JlsNdlg6+OJ9sMoR6T833Tv9
	9DbByjzA=
X-Received: by 2002:a05:6000:4a08:b0:48c:49bd:62df with SMTP id ffacd0b85a97d-49c6d63fbc3mr5457891f8f.1.1794576295782;
        Fri, 13 Nov 2026 05:24:55 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm4680211f8f.57.2026.11.13.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:24:55 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 13 Nov 2026 17:24:41 +0400
Subject: [PATCH v7 2/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-vt8500-timer-updates-v7-2-a1dcc4031b12@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8797; i=alchark@gmail.com;
 h=from:subject:message-id; bh=5DdTPTv9ZzwJsaVqiqLCcCVuOHUAj1GkaRC43w/zm68=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9518w8+i5yqfT+vsvGOxOjP3yoefKld097NoCp64fX
 /SyvuViaMcEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ikY6xjxMDFKQBTvVqB4Z91368/oReCvGIV/9rbBG+svrLCp7T3xYzd/95a9f3St7Bg+DH3lN1
 T4R6L8vf5cWqHdtyuPflUap4Np2DvHbmJXJ1mTAA=
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052458_113581_87D59E84 
X-CRM114-Status: GOOD (  33.19  )
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

VIA/WonderMedia system timer can generate a watchdog reset when its
clocksource counter matches the value in the match register 0 and
watchdog function is enabled. For this to work, obviously the clock event
device must use a different match register (1~3) and respective interrupt.

Check if at least two interrupts are provided by the device tree, then use
match register 1 for system clock events and reserve match register 0 for
the watchdog. Keep match register 0 for clock events on device trees that
list a single interrupt, and offer no watchdog there.

Instantiate the watchdog as an auxiliary device of the timer from a
platform driver bound to the timer node, as the timer itself comes up too
early to have a struct device. Share what the watchdog needs through a new
header, include/clocksource/vt8500-timer.h.

Unmap the registers if the timer interrupt is missing, so that no watchdog
gets created on a timer whose counter never started.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 MAINTAINERS                        |   1 +
 drivers/clocksource/Kconfig        |   1 +
 drivers/clocksource/timer-vt8500.c | 127 ++++++++++++++++++++++++++++++++++---
 include/clocksource/vt8500-timer.h |  22 +++++++
 4 files changed, 142 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7070cf5dbfe9..e8c2b1101b68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4010,6 +4010,7 @@ F:	drivers/tty/serial/vt8500_serial.c
 F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
+F:	include/clocksource/vt8500-timer.h
 
 ARM/ZTE ZX29 SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index da83483296d5..d060863fcc07 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -197,6 +197,7 @@ config TEGRA186_TIMER
 config VT8500_TIMER
 	bool "VT8500 timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
+	select AUXILIARY_BUS
 	help
 	  Enables support for the VT8500 driver.
 
diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index c4694cf8bea6..b54ed5d692d7 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -11,6 +11,7 @@
  * Alexey Charkov. Minor changes have been made for Device Tree Support.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
@@ -21,9 +22,9 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 
-#define VT8500_TIMER_OFFSET	0x0100
-#define VT8500_TIMER_HZ		3000000
+#include <clocksource/vt8500-timer.h>
 
 #define TIMER_MATCH_REG(x)	(4 * (x))
 #define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
@@ -53,6 +54,9 @@
 
 static void __iomem *regbase;
 
+/* Which match register to use for the system timer */
+static unsigned int sys_timer_ch;
+
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
 	int loops = msecs_to_loops(10);
@@ -72,21 +76,26 @@ static struct clocksource clocksource = {
 	.flags          = CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
+static u64 vt8500_timer_next(u64 cycles)
+{
+	return clocksource.read(&clocksource) + cycles;
+}
+
 static int vt8500_timer_set_next_event(unsigned long cycles,
 				    struct clock_event_device *evt)
 {
 	int loops = msecs_to_loops(10);
-	u64 alarm = clocksource.read(&clocksource) + cycles;
+	u64 alarm = vt8500_timer_next(cycles);
 
-	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0) &&
-	       --loops)
+	while (readl(regbase + TIMER_ACC_STS_REG) &
+	       TIMER_ACC_WR_MATCH(sys_timer_ch) && --loops)
 		cpu_relax();
-	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
+	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	if ((signed)(alarm - clocksource.read(&clocksource)) <= MIN_OSCR_DELTA)
 		return -ETIME;
 
-	writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
+	writel(TIMER_INT_EN_MATCH(sys_timer_ch), regbase + TIMER_INT_EN_REG);
 
 	return 0;
 }
@@ -128,16 +137,29 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -ENXIO;
 	}
 
-	timer_irq = irq_of_parse_and_map(np, 0);
+	/*
+	 * The watchdog function is available on channel 0, but not on other
+	 * channels. So to use it, the clock event device must use a different
+	 * match register (1~3) and respective interrupt.
+	 *
+	 * Check if at least two interrupts are provided by the device tree,
+	 * then use match register 1 for system clock events and reserve match
+	 * register 0 for the watchdog.
+	 */
+	sys_timer_ch = of_irq_count(np) > 1 ? 1 : 0;
+
+	timer_irq = irq_of_parse_and_map(np, sys_timer_ch);
 	if (!timer_irq) {
 		pr_err("%s: Missing irq description in Device Tree\n",
 								__func__);
+		iounmap(regbase);
+		regbase = NULL;
 		return -EINVAL;
 	}
 
 	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
 	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
-	writel(~0, regbase + TIMER_MATCH_REG(0));
+	writel(~0, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {
@@ -163,4 +185,91 @@ static int __init vt8500_timer_init(struct device_node *np)
 	return 0;
 }
 
+static void vt8500_timer_aux_uninit(void *data)
+{
+	auxiliary_device_uninit(data);
+}
+
+static void vt8500_timer_aux_delete(void *data)
+{
+	auxiliary_device_delete(data);
+}
+
+static void vt8500_timer_aux_release(struct device *dev)
+{
+	struct vt8500_wdt_info *wdt_info;
+	struct auxiliary_device *auxdev;
+
+	auxdev = container_of(dev, struct auxiliary_device, dev);
+	wdt_info = container_of(auxdev, struct vt8500_wdt_info, auxdev);
+	kfree(wdt_info);
+}
+
+/*
+ * This probe gets called after vt8500_timer_init(), which leaves regbase set
+ * only once the clocksource counter is running: that counter and match
+ * register 0 are all the watchdog needs, even if registering the clocksource
+ * or the clock event device failed afterwards. Create the watchdog device as
+ * a child, since the registers are shared.
+ */
+static int vt8500_timer_probe(struct platform_device *pdev)
+{
+	struct vt8500_wdt_info *wdt_info;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	if (!regbase)
+		return dev_err_probe(dev, -ENODEV,
+				     "Timer not initialized, cannot create watchdog\n");
+
+	if (!sys_timer_ch) {
+		dev_info(dev, "Not enabling watchdog: only one irq was given\n");
+		return 0;
+	}
+
+	wdt_info = kzalloc_obj(*wdt_info);
+	if (!wdt_info)
+		return -ENOMEM;
+
+	wdt_info->timer_next = &vt8500_timer_next;
+	wdt_info->regbase = regbase;
+	wdt_info->auxdev.name = "vt8500-wdt";
+	wdt_info->auxdev.dev.parent = dev;
+	wdt_info->auxdev.dev.release = &vt8500_timer_aux_release;
+
+	ret = auxiliary_device_init(&wdt_info->auxdev);
+	if (ret) {
+		kfree(wdt_info);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, vt8500_timer_aux_uninit,
+				       &wdt_info->auxdev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(&wdt_info->auxdev);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, vt8500_timer_aux_delete,
+					&wdt_info->auxdev);
+}
+
+static const struct of_device_id vt8500_timer_of_match[] = {
+	{ .compatible = "via,vt8500-timer", },
+	{},
+};
+
+static struct platform_driver vt8500_timer_driver = {
+	.probe  = vt8500_timer_probe,
+	.driver = {
+		.name = "vt8500-timer",
+		.of_match_table = vt8500_timer_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+builtin_platform_driver(vt8500_timer_driver);
+
 TIMER_OF_DECLARE(vt8500, "via,vt8500-timer", vt8500_timer_init);
diff --git a/include/clocksource/vt8500-timer.h b/include/clocksource/vt8500-timer.h
new file mode 100644
index 000000000000..956863d50d02
--- /dev/null
+++ b/include/clocksource/vt8500-timer.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef CLOCKSOURCE_VT8500_TIMER_H_
+#define CLOCKSOURCE_VT8500_TIMER_H_
+
+#include <linux/auxiliary_bus.h>
+#include <linux/types.h>
+
+#define VT8500_TIMER_HZ		3000000
+
+/**
+ * struct vt8500_wdt_info - timer resources shared with the watchdog
+ * @auxdev: auxiliary device the watchdog driver binds to
+ * @timer_next: returns the clocksource counter value @cycles from now
+ * @regbase: timer register block; the watchdog uses match register 0
+ */
+struct vt8500_wdt_info {
+	struct auxiliary_device auxdev;
+	u64 (*timer_next)(u64 cycles);
+	void __iomem *regbase;
+};
+
+#endif /* CLOCKSOURCE_VT8500_TIMER_H_ */

-- 
2.56.0


