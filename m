Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E98606A889
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QeqCoVI2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+U1P7nw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tjOZX/K6WuuHANRm5zaWFMNlF3ieqw+28w/8fCcYL6g=; b=QeqCoVI215K+oe
	A7kQD4A5VRyMvoHbH0Y90Ibyp48gOPgHHthbNam2evZtV2mNNQN+UqhRSjKu8yrAK1WAdPar5/KRs
	LwuU/4/Dg0505ghICWC11H1otKnvXqQosLV9W12haYkXgTvt7mZaoVX6L7F26rQVPcD70kF8RlKfK
	5zoknFTDh6BccisiJLpieSV/q1YrfB9c1H5ribvGq/eTSKVAVtsNNzWRssh+lLdYDrrhEZDI73F/Z
	y1qDvfmCl4ptPoy3+hVGmNGrPAF3r465RVIccIqxsEPeb78Dzijnd9Vh8bkNr8Lp0oYgmb+8s1T9C
	ff/oU3c7LKxw485CfO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrHK-0000000CvVx-11A4;
	Fri, 13 Nov 2026 13:25:18 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrH2-0000000CvMK-2TeP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:25:04 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so472082f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576298; x=1795181098; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjOZX/K6WuuHANRm5zaWFMNlF3ieqw+28w/8fCcYL6g=;
        b=D+U1P7nwaoUyFSS41UBpcLywZsYf+BRhEm0akldE4M0Fbd09GWJAuv+aA4PidG/XiZ
         y2TdXwvPx6D/JaTFPaleNqtnulDX+yiwsDJI9v7M6G8aoEZvwzOhBTagO4sc5ikEh5w5
         gukd4XxWiAu0aWaemZxfVseOmH1PScUxAkeHaZ4ibNxDQtVq0j5o9pge7K1hg2K3Ajv9
         PVMjBSCwej/IRNMlZ3szArPS6e0JTVcLP/hwiL4cFgCFikeUPfS+hkL54RhWQLFij8Sz
         EbX+AhBTUFBYCyWXoNrju2Ly9rWBv7wkCVYyoO3WaTR9S0A8ALm8aOfrvXNBlU1n+8I6
         pfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576298; x=1795181098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjOZX/K6WuuHANRm5zaWFMNlF3ieqw+28w/8fCcYL6g=;
        b=BlTpzrjg2vVCMHOIM4jEbAmPVpEcTECvKLyCiXUNcsFLH6/y7cnk8xhPU5e59e55RY
         j8OgGNxGubxfSQrLNXEtOAR0RaGEVr19wjUwUt/4SBtHToc2PZ+9/7h1gY1TcQ7N+GN2
         NrMG+VgSqChu8DnbClokg2cxcWFfQv4Mj6/CWlETjpwxexTpY+I6VTOVon19k0Ehvtpp
         wzIZm5z+M3pWmdX/JVB644NXJcvU8fLeSOEw05dnJZEBpwwEk6GMfuM3HTswYrc1ZcPR
         /tYvOtpMm/rMFOLXjzjMN+8DLHw8ZmSVU5hx67vPWc0gvHhuYpBm8WrrdjFVXQcsFPUF
         6Xlw==
X-Gm-Message-State: APuU4Z+E0UnVrFKIjT/6BVVMgY7RrVlGN44TT3mFYiT6T/T2fYweHRA4
	nB+26a9/PPL/eAdG95SI4nVdJSVkc6eLYV/ujUF8F+FNDgflSzs3P1A/SvVWSPyhNb0lNw==
X-Gm-Gg: AYBFou0t+D521qkSCDubk5e53D368W+au5GvMXyY4YZEcq6cQ6J21gZC7wbIhJyOSlJ
	zTwzK55IY3pn/C9lZ3a/7xpwT6UdU+lUnlTGHUucznLTlkQDoef8YrnzpYKZN9xJOMZ0U4vZYqM
	V0q43E7LEfvKZDHu/kUSG9SKdC+pe48kBEn53hSrwplfzMm3TRU65h0k6E3gypl5XMJUKu678en
	S4nnuo79A6sqfkftz9dw18iqTPFkPPlOPZ6yRwrmebKWf7FHW9Yzgc1RXgxl10MMMuoqiQor1Jf
	NdZy97WxQtDJSYNjW2YxRk3vYRUryG+Vg6oFr8Hk8/2PLFrYc6XQhwXtg4g5PtCHurH9yC+npsb
	bSn/keiTtqAVFF7ns8NiCG56gbiAElg0b0hZMNHw/RGLtOqe+SJHiZUnS41bZK3FFD+uWH6S6jP
	/pNEtbQi+KwRzAN02ysDSsDd/ewxKlumDehByQvdC27COuDq+u7w4SdpHH1tu+n9oKm+5lUdXPF
	t2NLDuuvaZ+2vMrc9hUQ/PKzjgXCZf3azDjaDYo4MEighCrFTKA/ky5dFAVFVU4VV32JdkYVKGM
	cm32i4YYDMbG/ehlvzrKB+IwTe7yQF3LqPYoFh6XMoYjxGpw5e4rMWPdaK2R/OHsRUvP
X-Received: by 2002:a05:6000:2311:b0:48d:ffe7:e883 with SMTP id ffacd0b85a97d-49c741b1371mr6012548f8f.46.1794576298236;
        Fri, 13 Nov 2026 05:24:58 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm4680211f8f.57.2026.11.13.05.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:24:57 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 13 Nov 2026 17:24:42 +0400
Subject: [PATCH v7 3/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-vt8500-timer-updates-v7-3-a1dcc4031b12@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7950; i=alchark@gmail.com;
 h=from:subject:message-id; bh=hyWHvc0h3BNHC+IYNfkAcOOw1wzOzOaIDKO9cWPzNvA=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9519gFZe/do7rxqneGrHZ/JNmPFy0+WO72/LJp/bqf
 t7lwTMvpmMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICp7pnPyPBocqxM5Nk3Et+jt/YWzfOITuS81mnP/29ZcW9lxrPN6XkMv1m/v5j
 7Q+bp2Wszlu9iCfls1XKH0TBipefWWcv/1S/ZXMoLAA==
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052500_778161_EFA9FE1D 
X-CRM114-Status: GOOD (  28.00  )
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

VIA/WonderMedia SoCs can use their system timer's first channel as a
watchdog device which will reset the system if the clocksource counter
matches the value given in its match register 0 and if the watchdog
function is enabled.

Since the watchdog function is tightly coupled to the timer itself, it
is implemented as an auxiliary device of the timer device. Build it in
rather than as a module, as the timer it depends on is always built in
and the driver is tiny.

Report a watchdog found running at probe, as one armed before a kexec
would be, so that the core keeps it fed until userspace takes over.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/watchdog/watchdog-parameters.rst |   7 ++
 MAINTAINERS                                    |   1 +
 drivers/watchdog/Kconfig                       |  12 +++
 drivers/watchdog/Makefile                      |   1 +
 drivers/watchdog/vt8500-wdt.c                  | 132 +++++++++++++++++++++++++
 5 files changed, 153 insertions(+)

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 348229ffcb43..27453b659545 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -637,6 +637,13 @@ uniphier_wdt:
 
 -------------------------------------------------
 
+vt8500_wdt:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
 w83627hf_wdt:
     wdt_io:
 	w83627hf/thf WDT io port (default 0x2E)
diff --git a/MAINTAINERS b/MAINTAINERS
index e8c2b1101b68..73039535eba2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4010,6 +4010,7 @@ F:	drivers/tty/serial/vt8500_serial.c
 F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
+F:	drivers/watchdog/vt8500-wdt.c
 F:	include/clocksource/vt8500-timer.h
 
 ARM/ZTE ZX29 SOC SUPPORT
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index c884f86be4e3..a252f9c9c2c8 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1183,6 +1183,18 @@ config SUNPLUS_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called sunplus_wdt.
 
+config VT8500_WATCHDOG
+	bool "VIA/WonderMedia VT8500 watchdog support"
+	depends on ARCH_VT8500 || COMPILE_TEST
+	select WATCHDOG_CORE
+	select AUXILIARY_BUS
+	help
+	  VIA/WonderMedia SoCs can use their system timer as a hardware
+	  watchdog, as long as the first timer channel is free from other
+	  uses and respective function is enabled in its registers. To
+	  make use of it, say Y here and ensure that the device tree
+	  lists at least two interrupts for the VT8500 timer device.
+
 # X86 (i386 + ia64 + x86_64) Architecture
 
 config ACQUIRE_WDT
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 19cb25f51624..5a5a111b4815 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
 obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
 obj-$(CONFIG_GUNYAH_WATCHDOG) += gunyah_wdt.o
 obj-$(CONFIG_MA35D1_WDT) += ma35d1_wdt.o
+obj-$(CONFIG_VT8500_WATCHDOG) += vt8500-wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
new file mode 100644
index 000000000000..e0f838fd1d50
--- /dev/null
+++ b/drivers/watchdog/vt8500-wdt.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: 2026 Alexey Charkov <alchark@gmail.com>
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/limits.h>
+#include <linux/minmax.h>
+#include <linux/moduleparam.h>
+#include <linux/stringify.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+
+#include <clocksource/vt8500-timer.h>
+
+/* Offsets within the timer register block */
+#define VT8500_WDT_MATCH_REG	0x0000	/* timer match register 0 */
+#define VT8500_WDT_EN_REG	0x0018
+#define VT8500_WDT_EN		BIT(0)
+#define VT8500_WDT_ACC_STS_REG	0x0024	/* timer access status */
+#define VT8500_WDT_ACC_WR_MATCH	BIT(0)	/* match register 0 write pending */
+
+#define VT8500_WDT_DEFAULT_TIMEOUT	30	/* seconds */
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+		 __stringify(WATCHDOG_NOWAYOUT) ")");
+
+/* Arm the watchdog to reset the SoC @cycles counter ticks from now */
+static int vt8500_watchdog_arm(struct vt8500_wdt_info *info, u64 cycles)
+{
+	u32 deadline, sts;
+	int ret;
+
+	/* Let a previous match write settle, as the timer driver does */
+	ret = readl_poll_timeout_atomic(info->regbase + VT8500_WDT_ACC_STS_REG,
+					sts, !(sts & VT8500_WDT_ACC_WR_MATCH),
+					1, 10000);
+	if (ret)
+		return ret;
+
+	/*
+	 * The deadline is matched against the hardware clocksource counter,
+	 * which is a u32 value incrementing at VT8500_TIMER_HZ and continuing
+	 * past wraparound. When the return value of timer_next is greater than
+	 * U32_MAX then the match should occur after the hardware counter wraps
+	 * around, thus we take only the lower 32 bits of timer_next return val
+	 */
+	deadline = info->timer_next(cycles);
+	writel(deadline, info->regbase + VT8500_WDT_MATCH_REG);
+	writel(VT8500_WDT_EN, info->regbase + VT8500_WDT_EN_REG);
+
+	return 0;
+}
+
+static int vt8500_watchdog_start(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+	u32 timeout_ms = min(wdd->timeout * 1000, wdd->max_hw_heartbeat_ms);
+
+	return vt8500_watchdog_arm(info,
+				   (u64)timeout_ms * (VT8500_TIMER_HZ / 1000));
+}
+
+static int vt8500_watchdog_stop(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+
+	writel(0, info->regbase + VT8500_WDT_EN_REG);
+
+	return 0;
+}
+
+static const struct watchdog_ops vt8500_watchdog_ops = {
+	.start			= vt8500_watchdog_start,
+	.stop			= vt8500_watchdog_stop,
+};
+
+static const struct watchdog_info vt8500_watchdog_info = {
+	.identity		= "VIA VT8500 watchdog",
+	.options		= WDIOF_MAGICCLOSE |
+				  WDIOF_KEEPALIVEPING |
+				  WDIOF_SETTIMEOUT,
+};
+
+static int vt8500_wdt_probe(struct auxiliary_device *auxdev,
+			    const struct auxiliary_device_id *id)
+{
+	struct vt8500_wdt_info *info;
+	struct watchdog_device *wdd;
+
+	wdd = devm_kzalloc_obj(&auxdev->dev, *wdd);
+	if (!wdd)
+		return -ENOMEM;
+
+	wdd->info = &vt8500_watchdog_info;
+	wdd->ops = &vt8500_watchdog_ops;
+	wdd->min_timeout = 1;
+	wdd->timeout = VT8500_WDT_DEFAULT_TIMEOUT;
+	wdd->max_hw_heartbeat_ms = U32_MAX / (VT8500_TIMER_HZ / 1000);
+	wdd->parent = &auxdev->dev;
+
+	info = container_of(auxdev, struct vt8500_wdt_info, auxdev);
+	watchdog_set_drvdata(wdd, info);
+	watchdog_set_nowayout(wdd, nowayout);
+
+	/* Let the core feed a watchdog left running, e.g. across kexec */
+	if (readl(info->regbase + VT8500_WDT_EN_REG) & VT8500_WDT_EN)
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+
+	return devm_watchdog_register_device(&auxdev->dev, wdd);
+}
+
+static const struct auxiliary_device_id vt8500_wdt_ids[] = {
+	{ .name = "timer_vt8500.vt8500-wdt" },
+	{}
+};
+
+static struct auxiliary_driver vt8500_wdt_driver = {
+	.name =	"vt8500-wdt",
+	.probe = vt8500_wdt_probe,
+	.id_table = vt8500_wdt_ids,
+	.driver = {
+		/* Unbinding would leave the hardware armed with no one to ping */
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_driver(vt8500_wdt_driver, auxiliary_driver_register);

-- 
2.56.0


