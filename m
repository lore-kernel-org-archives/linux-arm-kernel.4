Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C35606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gZxErlpk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkebzcZl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0y1qYoq7NoViWaxpRI0L9NF8oo0LErcNzMW4ST3VRQI=; b=gZxErlpkJEDYY2
	PF4YHRBy8QaLY5oV0kDKWJxbFeAUWXXlEzBoniC1s2BcVfLIbQ/Lr6Z6EHA9YHHRHEJtOXJfxT5zo
	pJAWaDwcrMN77/BoXkXwYbuZgLuXdxqXMZV/NsjkvJEd6pMIknDfvrGSU1FH7SS4YvviqElxE7gXP
	BHhstdWk02rPFjOlj8kwmyOkhwBIIcQp18lOXiSRcEfrDFSWOoncV5CAEyrjox59do6l9eMQWWFbh
	732aPQEC8cl+SNcN8lcAhua08eVhKYhs/TxUPdGrKYyPhPGxrYkreoZrUxwb9/8VwwGv5uxs7msjn
	qi1QdatgwD3Ms+LNZP+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZxY-0000000AtpX-0XGt;
	Thu, 12 Nov 2026 18:55:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZxJ-0000000Atl2-44ak
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:55:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a210470b49so1110905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 10:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509728; x=1795114528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0y1qYoq7NoViWaxpRI0L9NF8oo0LErcNzMW4ST3VRQI=;
        b=xkebzcZlSpDHazXtV9ZWEgDm1m5LzukQ4djQVPKTqV0967XswkbdmNwP+bNjUevJ16
         QaisRuwis7ctTkBoyGYGIWO9gY8HVU//fFaTscTfnEFO42I2ryOO2bMcaLBDpteuALQy
         sXzyz3jbEwME0ZudOCmK464E4HL/zRYsxM+DmHbY2OyOgw9Phd95m5zpoNrAcakA/eVc
         vwe8Sh36T+eOMpLKCp0Po0Yu+S/d/hU1YkOfJF97CmfYQN1wqdyEOG0sZt9vm1ZOPmm5
         pxcmawFYZCJz1UGcPLRuuKwWlFrF9AwhGpzVABxgSwoUQQiAfZoJelDMJFqqmmtj1s8w
         kMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509728; x=1795114528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0y1qYoq7NoViWaxpRI0L9NF8oo0LErcNzMW4ST3VRQI=;
        b=Xinv7s8CLq1YUd5MEJjiEuwYMSQoO4UlzbkGO+RAAs7JYPObABLVoVBvDKlg8SuwHh
         0s8uVbbfdEMOTwn4cuohSrq2obqeR8+3ZBHlcF5UpuqDXGOVHNQvOT1jbr+g4zyzXsvg
         +ld3vQ2TYassazqQbKzgGB0/6k6JlOYWzU4G9lBx66A0Jbf2JDfbOHYpbb5t+gDK5Qlw
         Z7Kd9F0VYvlrWAfSJNokgUHRSPOwAqp7fAu41Sz7nw/IFteuO6EcHUGk7uRVnCCHdO7P
         7DjXbTtoFAZqG6p88stSjanWTgv3wE9ilkEjaM60rWdi3+ublRQbHFVbqUc1l4rvI7kB
         X00Q==
X-Gm-Message-State: APuU4Z8t7oUnKMuQECVfPWVeah7lOB+UBZRSaYqaWQDdTmpi8+D1vD2b
	gG9WQPfNRk6S0yhGsvbesMHdF5J39mbHej5p5xYqER5A9liXoKc7G3ih
X-Gm-Gg: AYBFou1h90QOJ1nbSz10VRNSFeAuLKiozqpMQEAKw0zhJT0Z7wQB+Dz+zTUL/7A6+Z3
	RjhPUWYpp2a5R7+Vs0gcaUuEibsUDoEmqQXlBYfmq5JIy8IVH/8X5+IuakTOytoYRKFAvFGl5Ud
	BEGyz9emPuKjPvhRNNkIaVY1vTH6i6s5aS2f6uF43WYXVtgqaS0FIyuVBiYwm53wcwTZijXH6ph
	Y2kgXbkR7gVA17rpsRPtAo5fuwmlPdUDMorEwZbQEnSyRkqn5a0/hnLv4AsrAPsD6nuDPQP2Rjg
	OnYra7m9ebMH+q+QlZ5RdfzGHDwwKLWMll/4D/e+xIjMSXzimrMwwRGMjy9FE4gRxfpge8Oj97Q
	M+bjQwIxdeGBxm/t8gAm99pj1ODr7rtSXRuMYvMiBHOY4cGoC9/OU0Fbn+6BzKuoQtad+V8ZWYP
	UvDeyCmYfyrKOUniR+QofeGfsmgEhDW1NfSPMgPNTjE20jNTMFWKnpBIaHgwTbWOottsGMpEk52
	goDDx9KAEM6UW/P3jHRmdpX7XK20m0EaVocN9q1TLhMDpZqHQtLPwqqHj1Nv/Y6EBlQllEmEOvS
	6MIhuXoKw+BbLNWz086ORvMdQyf9kc2WsjydmlLBED+CX6+bxDebt+6mgK4sx3xjzKeb8CGlkdj
	jTChSqCp2BHbyZlFolVydvFArDX06
X-Received: by 2002:a05:600c:1d0e:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4bb55abaef4mr1766655e9.24.1794509728021;
        Thu, 12 Nov 2026 10:55:28 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm71734755e9.7.2026.11.12.10.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:55:26 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 22:55:10 +0400
Subject: [PATCH v6 3/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-vt8500-timer-updates-v6-3-fd1cea645d1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7950; i=alchark@gmail.com;
 h=from:subject:message-id; bh=TKbNAsM+ZSZcFRoALRRcTOU4cJIrVJEa/4qOimCrMHk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9456aYbiuQlt4Zs1EN36TD5cMnrXz8DWwmkkdsCp7u
 fdswTy/joksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb62G2G/1W+zZfv/vGWu3vQ/KzhfUvXkE1JFwMNT59tVv8kt0mB0Yfhf0hPetD
 T+j+p638oPl6mcHODinrtrrMsOe9+GiuqaiTOYQAA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_105530_572977_9A64FC2B 
X-CRM114-Status: GOOD (  28.31  )
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
index acc4d2915460..80aefe2f5481 100644
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


