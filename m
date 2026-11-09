Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25857606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M3pYbJ3B;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qV2lTQYL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/d1U0A2dfiNuwij3Ofh6GUJRUsPvJzrc8bAF4ywOpeQ=; b=M3pYbJ3BpU75qV6xnJCn5erLk4
	DU1S9bv9b/9ibxBDaD0a+rfR1hdXkA/hUyZfLEU2Es0iBDoy89VmgV9ECzZvfXeuOtIvs4uKIgNUT
	vd8kEM+QXwpPDWD8bqrBM6yJj4oIyia5ev5AQu50Imyb4E4jv/UiFaUm1Beuzlog5T1o8YwVFYdk8
	BgUy14WDQonb9GaCxxKSb4eJlAKgY/V2fLw83qclTFCo3+BUF8/IaCVXS9JZNOlRjgCJZS8gIn/E/
	+3uihedRC7bspKyMA1nfQWtTpWZfvABhebpOoBA4fvGYvhTXlV7Y2Z/l+ddnAphgkVYN8GZNlTYtA
	NBowHr1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVfH-00000001cND-3hEP;
	Mon, 09 Nov 2026 20:08:27 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVfD-00000001cMN-0Bcc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:08:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so879862f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 12:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254900; x=1794859700; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/d1U0A2dfiNuwij3Ofh6GUJRUsPvJzrc8bAF4ywOpeQ=;
        b=qV2lTQYLZzBuf+SUdbMv3upJ8Hg09doZ3rwND1uzdT4TsFJQqRpAmJPUvRBwjuXvFZ
         v2BZYLaAbB7OlsrUR7B//iSsFf49MRV+j5MVvwmgctsJLyzeJlE51ryNXYlV5A60g2PD
         iWCXlylysbEn+VugAxWj2BYRE1ZoTcdVo6I2WCgfd21RjIlztV9+wQQ6GNPbvbR1TEeF
         eFnLxl089VQk9vcYNHUsfNUdkyxbcvneyZwCNuj57Yawf1PydACBjGEkwa3WPHNoZ74g
         JiDlovesi0vme+flqyEeYEPlke+4Yubvrg+iClByHDT1NkIGkCNAFL0ozMYioHZ+ZLoc
         PcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254900; x=1794859700;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/d1U0A2dfiNuwij3Ofh6GUJRUsPvJzrc8bAF4ywOpeQ=;
        b=vplXPFr1KpOd8cRWhyCjpjyyiF2EaM33i1SXvdvQwAdFvukG41ej0XjBZWObZXwqQC
         ys/mwle3libD48tylWxTZZmb8PcPfFCZRGyj2gi33JTQ1+zI4kqtv3y3b2ra+saLO8yT
         6Fk0UcnGW347teFt/oNHUwllU03loM15qgoPz2oCiZ/tjWKQR9wMf2X6HIWeV6nw4Hi3
         Jx6JS23ulEoUgo6XJGGGAAlfYL8Xy/JWQ1EuVIiWb920EIXZeiJCQH0fZYN9xL5fzfFA
         ZuyJXUwcdmE/BEUhgYfw8zfmokL4Dg7h7K9mmoeW9fSJ1OHBxHhE5/Waj3SOKjE0JKwL
         Yl8w==
X-Forwarded-Encrypted: i=1; AL+hErG38h7yFjfeeP1aRzb6wZjGk7awdjr+RB/mxENoTvUFXBNsqhkkSUhdOFwKEwUo+MHGSYhfiTBTa3lEKmvqrFyS@lists.infradead.org
X-Gm-Message-State: APuU4Z9WMYguC2jm27jKSMHqaGooIAr0yHq8BF6ETtigfZaeQeCWRPjn
	dNdW60tfderw58OVFmAqsGVbSUD/fl9O/w/Zwyp+atEa29rLhyDBNuT6
X-Gm-Gg: AYBFou2+qukc/nRV+dM0mZmJFHbnT9p3k1ReV+G5FtoHXgcqlZ+xWP9idSeDEqn5e0n
	pvSWYjzng9iFgsuXvUrcZhuSB+87ymQnQiE7cq1iP55VhmpwKvR59KczJTiGVQ4fvjoGUjZghDr
	oOxq9A3wf215CT7sw1NbkX0ebAg7WLB6US04UcZwaqphJUexTyNAWKc/ri0YnU6rq0KukOcnj06
	uHWTLeeJ2604/qKhVc6a1qhmvFtpV4dd1BJy7RSCiXiz+l8kZq3VaJq0NeZMPeosYKXIyXA3i6i
	3BQYWQ6GD99sMvOxKkeBMWOjWL1hYig0mlhv02JBmkuwVFCkQP+zOQc8eOo6bgflSL/1sHvzXRl
	3lR6KtOIp2OEpO4RFktve254aldm8MRBEmzYHo8x5oic2ylVy6G0HH15JX++VDobXDhZzpuGgVn
	YQOP2KJuDj0Ot8OL+vA0h8RhxxK/ADofn0ja44vI1k/2ZTISsS6x1oy6+UQpaeSnDnxwoMCkscq
	+LTdZ+cr9msbK3b3JYuht7ghfMY6jtf6kw1ZsaJtNRXTkGG4GOo0MDbzXWAl5tU9SfcGNjH819y
	TXwq1KFr63JB5cegbdfuWxn+nWXNRpBVA1+rjnaV
X-Received: by 2002:a05:6000:18a3:b0:493:c0a:5087 with SMTP id ffacd0b85a97d-49830e767fdmr972903f8f.51.1794254900091;
        Mon, 09 Nov 2026 12:08:20 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835859080sm1003909f8f.19.2026.11.09.12.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 12:08:19 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 09 Nov 2026 23:08:04 +0300
Subject: [PATCH v14] reset: zte: Add a zx297520v3 reset driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261109-zx29reset-v14-1-1a05aaa7309a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ5AMBAAvyJ71kSrEXxFHFq2rAPSRUTj74rjT
 CYTgNETMtRJAI8HMS1zBKnTBLrRzAMK6qMAlalCyqwS16kqj4ybyF1htNPW9qWB2K8eHZ3frGl
 /5t1O2G3vAO77AQWijM9uAAAA
X-Change-ID: 20261109-zx29reset-3f6a4f4bbd8a
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13429;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=snZfNSAC20sZnLBmUI69XM4PLRaPCMcGcxywFTp19Qc=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBq8igy0yQgqmTxgtDAI9aP+ifSpl2uvHBxs4brL
 Z7xWGsJOm+JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCavIoMhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK++g//YTpcUxJ/uZJW+HzsLewaMwlbaIyaSN/
 svfqBNRQC22MyZDp9RQvlpJzY8/0Lz9a51+2Oy1cu/9YgJkSJ7nGXmD/rW2sGEZ4jQXPY7MFh2c
 BKahDISAqAPxjsACaIG8wa8hmo1WYXSV2AN0oZdW0JhvI9my3lmU4RTV426zw899ccKY9LHegQR
 07pRS8Plut9GyslHYSeYKcM+cdtW1vnZrssmydYkPUAgw6TDiB64Jp7N1LGQxv+QJZrZDSMZlW4
 gP1h21YaLw/MEfpL1tNXVtrvq2lWcK2Nggr9Xgabi1G9+lsde0RfxDYiFZCQovkvSvoRio48TT0
 jNR/s4t/LjpAHcedzaI4lSC4SB9Sc/njh1nTOtH4B30y+si7hSK7H2Fi9QAr4KpO8zmnFn8wVp5
 ezw4oYZm14Ou529lhk5hewNbwLv05y8UvB+QVKWSx1OIlYOQ7Bk4fJvddsbk3Im2p/Pl6905cog
 82WrAST/JRsjdqO0Vc+mVCWRDwmrBwSo38dTlFMkkM4gm6XWYCsWreTK4DG8YFNPYjTn9UVRbxE
 OJGPENxh/i7+XuLXVbeC8/3IgJAWHuXVzlsRz2Lk9k3MwHKoz4aIj3tQnkpvCCR8JllJhkntWOi
 uv4SLnnZZUXlqcUTyk5KJmjdxu8geAbzfWpAmz5hudOeGBePt748=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_120823_230601_989C1C49 
X-CRM114-Status: GOOD (  30.13  )
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

This drives the MFD child devices created by the zte-zx297520v3-crm
driver.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
v14: Stand-alone submission of the reset driver for inclusion. The DT
bindings are already upstream, so the driver builds as-is.

I have removed the line from MAINTAINERS because it will conflict with
the patch submitted to the MFD tree for the MFD driver linked below:

https://lore.kernel.org/mfd/20261108-zx29clk-v14-1-48694e5a9d10@gmail.com/

v12: Correct SSC reset from bit 24 to bit 28 in matrix+0x94.

v10:
Add ZSP reset in matrixcrm

v9:
Remove HSIC and USB PHY resets, the phy driver will access them through
the shared regmap directly
Sort include files alphabetically
Depend on HAS_IOMEM due to "select MFD_SYSCON" (Sashiko). This has some,
but not consistent, precedent in the same file

v8: Select MFD_SYSCON for COMPILE_TESTing this driver without the MFD
parent driver.

v7:
Add MODULE_DEVICE_TABLE (Philipp)
Add DDR control and LSP resets

v6:
Add a comment wrt checking all bits in .status() (Philipp)
include cleanup (Philipp, Sashiko)

v5:
Make top and matrix MFD children instead of aux devices
Split USB PHY reset into its own reset ID
Remove USB reset wait code - this will be handled via syscon from a
future minimal phy-zx29-usb driver
---
 drivers/reset/Kconfig                |  13 ++
 drivers/reset/Makefile               |   1 +
 drivers/reset/reset-zte-zx297520v3.c | 237 +++++++++++++++++++++++++++++++++++
 3 files changed, 251 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f..e68e33a35fec 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -438,6 +438,19 @@ config RESET_UNIPHIER_GLUE
 	  on UniPhier SoCs. Say Y if you want to control reset signals
 	  provided by the glue layer.
 
+config RESET_ZTE_ZX297520V3
+	tristate "ZTE zx297520v3 Reset Driver"
+	depends on HAS_IOMEM
+	depends on MFD_ZTE_ZX297520V3_CRM || COMPILE_TEST
+	default SOC_ZX297520V3
+	select MFD_SYSCON
+	help
+	  This enables the reset controllers for ZTE zx297520v3 SoCs. The reset
+	  controllers are required for booting this board and are part of the
+	  clock and reset management controllers on this board, so you will also
+	  need MFD_ZTE_ZX297520V3_CRM. Enable this if you are building a kernel
+	  for a ZTE zx297520v3 based board.
+
 config RESET_ZYNQ
 	bool "ZYNQ Reset Driver" if COMPILE_TEST
 	default ARCH_ZYNQ
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6bbe3..8cff33919b29 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -53,5 +53,6 @@ obj-$(CONFIG_RESET_TI_TPS380X) += reset-tps380x.o
 obj-$(CONFIG_RESET_TN48M_CPLD) += reset-tn48m.o
 obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
+obj-$(CONFIG_RESET_ZTE_ZX297520V3) += reset-zte-zx297520v3.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_RESET_ZYNQMP) += reset-zynqmp.o
diff --git a/drivers/reset/reset-zte-zx297520v3.c b/drivers/reset/reset-zte-zx297520v3.c
new file mode 100644
index 000000000000..6a5711446502
--- /dev/null
+++ b/drivers/reset/reset-zte-zx297520v3.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+
+/* Most devices on the zx297520v3 SoC have one reset bit per clock line. As a rule of thumb, the
+ * lower bit disconnects the device from the bus, similarly to turning off PCLK - registers read 0
+ * or hang indefinitely. Unlike PCLK, this reset may have a lingering effect after deasserting.
+ * E.g. timers will be disabled, but retain their counter value.
+ *
+ * The other bit resets the actual device registers.
+ *
+ * For some devices, e.g. GMAC, both reset bits behave in the same way: They disconnect the device
+ * and registers will have their default state after deasserting. For devices that have two reset
+ * bits, both need to be deasserted for the device to function.
+ */
+struct zte_reset_reg {
+	u32 mask;
+	u16 reg;
+};
+
+struct zte_reset_data {
+	const struct zte_reset_reg *resets;
+	unsigned int num;
+};
+
+struct zte_reset {
+	struct reset_controller_dev rcdev;
+	struct regmap *map;
+	const struct zte_reset_reg *resets;
+};
+
+static inline struct zte_reset *to_zte_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct zte_reset, rcdev);
+}
+
+static int zx29_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+
+	return regmap_clear_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+}
+
+static int zx29_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+
+	return regmap_set_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+}
+
+static int zx29_rst_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+	int res;
+
+	/* Devices with two reset bits need both deasserted to work. So only report them as
+	 * deasserted if both bits are set.
+	 *
+	 * assert()/deassert() will always clear/set both. The only reason a device might be in a
+	 * hybrid state is an unexpected handover state from the bootloader.
+	 */
+	res = regmap_test_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+	if (res < 0)
+		return res;
+
+	return !res;
+}
+
+static const struct reset_control_ops zx29_rst_ops = {
+	.assert		= zx29_rst_assert,
+	.deassert	= zx29_rst_deassert,
+	.status		= zx29_rst_status,
+};
+
+static const struct zte_reset_reg zx297520v3_top_resets[] = {
+	/* This bit is set by ZTE's cpko.ko blob, it looks like a reset bit for the LTE DSP
+	 * coprocessor. Clocks for it are in matrixcrm.
+	 */
+	[ZX297520V3_ZSP_CORE_RESET]  = { .reg = 0x13c, .mask = BIT(0)            },
+
+	[ZX297520V3_UART0_RESET]     = { .reg =  0x78, .mask = BIT(6)  | BIT(7)  },
+	[ZX297520V3_I2C0_RESET]      = { .reg =  0x74, .mask = BIT(8)  | BIT(9)  },
+	/* Only one reset. Bit 5 is settable but does not do anything observable */
+	[ZX297520V3_RTC_RESET]       = { .reg =  0x74, .mask = BIT(4)            },
+	[ZX297520V3_TIMER_T08_RESET] = { .reg =  0x78, .mask = BIT(4)  | BIT(5)  },
+	[ZX297520V3_TIMER_T09_RESET] = { .reg =  0x78, .mask = BIT(2)  | BIT(3)  },
+	/* Only one reset. Bit 0 is settable but does not do anything observable */
+	[ZX297520V3_PMM_RESET]       = { .reg =  0x74, .mask = BIT(1)            },
+
+	/* I haven't found any clocks for GPIO. It probably wouldn't make much
+	 * sense anyway. Only one reset bit per controller.
+	 */
+	[ZX297520V3_GPIO_RESET]      = { .reg =  0x74, .mask = BIT(3)            },
+	[ZX297520V3_GPIO8_RESET]     = { .reg =  0x74, .mask = BIT(2)            },
+
+	[ZX297520V3_TIMER_T12_RESET] = { .reg =  0x74, .mask = BIT(6)  | BIT(7)  },
+	[ZX297520V3_TIMER_T13_RESET] = { .reg =  0x7c, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_TIMER_T14_RESET] = { .reg =  0x7c, .mask = BIT(2)  | BIT(3)  },
+	[ZX297520V3_TIMER_T15_RESET] = { .reg =  0x74, .mask = BIT(10) | BIT(11) },
+	[ZX297520V3_TIMER_T16_RESET] = { .reg =  0x7c, .mask = BIT(4)  | BIT(5)  },
+	[ZX297520V3_TIMER_T17_RESET] = { .reg = 0x12c, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_WDT_T18_RESET]   = { .reg =  0x74, .mask = BIT(12) | BIT(13) },
+	[ZX297520V3_USIM1_RESET]     = { .reg =  0x74, .mask = BIT(14) | BIT(15) },
+	[ZX297520V3_AHB_RESET]       = { .reg =  0x70, .mask = BIT(0)  | BIT(1)  },
+
+	/* USB reset. 0x84 returns the USB device status (0x1 for HSIC up, 0x2 for USB up, but
+	 * all 3 bits (PCLK, WCLK, PHY) need to be deasserted for the device to report ready.
+	 * Thus polling the status is the responsibility of the USB PHY driver.
+	 */
+	[ZX297520V3_USB_RESET]       = { .reg =  0x80, .mask = BIT(4) | BIT(5)   },
+	[ZX297520V3_HSIC_RESET]      = { .reg =  0x80, .mask = BIT(1) | BIT(2)   },
+};
+
+static const struct zte_reset_data zx297520v3_topreset_data = {
+	.resets = zx297520v3_top_resets,
+	.num = ARRAY_SIZE(zx297520v3_top_resets),
+};
+
+static const struct zte_reset_reg zx297520v3_matrix_resets[] = {
+	[ZX297520V3_CPU_RESET]       = { .reg =  0x28, .mask = BIT(1)            },
+	[ZX297520V3_ZSP_BUS_RESET]   = { .reg =  0x3c, .mask = BIT(0)            },
+	[ZX297520V3_DDR_CTRL_RESET]  = { .reg = 0x100, .mask = BIT(10) | BIT(11) },
+	[ZX297520V3_EDCP_RESET]      = { .reg =  0x68, .mask = BIT(0)            },
+	[ZX297520V3_SD0_RESET]       = { .reg =  0x58, .mask = BIT(1)            },
+	[ZX297520V3_SD1_RESET]       = { .reg =  0x58, .mask = BIT(0)            },
+	[ZX297520V3_NAND_RESET]      = { .reg =  0x58, .mask = BIT(4)            },
+	[ZX297520V3_PDCFG_RESET]     = { .reg =  0x94, .mask = BIT(20)           },
+	[ZX297520V3_SSC_RESET]       = { .reg =  0x94, .mask = BIT(28)           },
+	[ZX297520V3_GMAC_RESET]      = { .reg = 0x114, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_VOU_RESET]       = { .reg = 0x16c, .mask = BIT(0)            },
+	[ZX297520V3_LSP_RESET]       = { .reg =  0x80, .mask = BIT(0)            },
+};
+
+static const struct zte_reset_data zx297520v3_matrixreset_data = {
+	.resets = zx297520v3_matrix_resets,
+	.num = ARRAY_SIZE(zx297520v3_matrix_resets),
+};
+
+static const struct zte_reset_reg zx297520v3_lsp_resets[] = {
+	[ZX297520V3_TIMER_L1_RESET]  = { .reg = 0x04,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_WDT_L2_RESET]    = { .reg = 0x08,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_WDT_L3_RESET]    = { .reg = 0x0c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_PWM_RESET]       = { .reg = 0x10,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_I2S0_RESET]      = { .reg = 0x14,  .mask = BIT(8)  | BIT(9)  },
+	/* 0x18: Not writeable */
+	[ZX297520V3_I2S1_RESET]      = { .reg = 0x1c,  .mask = BIT(8)  | BIT(9)  },
+	/* 0x20: Not writeable */
+	[ZX297520V3_QSPI_RESET]      = { .reg = 0x24,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_UART1_RESET]     = { .reg = 0x28,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_I2C1_RESET]      = { .reg = 0x2c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_SPI0_RESET]      = { .reg = 0x30,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_LB_RESET]  = { .reg = 0x34,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_LC_RESET]  = { .reg = 0x38,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_UART2_RESET]     = { .reg = 0x3c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_WDT_LE_RESET]    = { .reg = 0x40,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_LF_RESET]  = { .reg = 0x44,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_SPI1_RESET]      = { .reg = 0x48,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_L11_RESET] = { .reg = 0x4c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TDM_RESET]       = { .reg = 0x50,  .mask = BIT(8)  | BIT(9)  },
+};
+
+static const struct zte_reset_data zx297520v3_lspreset_data = {
+	.resets = zx297520v3_lsp_resets,
+	.num = ARRAY_SIZE(zx297520v3_lsp_resets),
+};
+
+static int reset_zx297520v3_probe(struct platform_device *pdev)
+{
+	const struct platform_device_id *id = platform_get_device_id(pdev);
+	struct device *dev = &pdev->dev;
+	struct device_node *of_node = dev->parent->of_node;
+	const struct zte_reset_data *data;
+	struct zte_reset *rst;
+
+	if (!id)
+		return -ENODEV;
+	data = (const struct zte_reset_data *)id->driver_data;
+
+	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+
+	rst->resets = data->resets;
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.nr_resets = data->num;
+	rst->rcdev.ops = &zx29_rst_ops;
+	rst->rcdev.of_node = of_node;
+	rst->rcdev.dev = dev;
+
+	rst->map = device_node_to_regmap(of_node);
+	if (IS_ERR(rst->map))
+		return dev_err_probe(dev, PTR_ERR(rst->map), "Cannot get parent syscon regmap\n");
+
+	return devm_reset_controller_register(dev, &rst->rcdev);
+}
+
+static const struct platform_device_id reset_zx297520v3_ids[] = {
+	{
+		.name = "zx297520v3-topreset",
+		.driver_data = (kernel_ulong_t)&zx297520v3_topreset_data,
+	},
+	{
+		.name = "zx297520v3-matrixreset",
+		.driver_data = (kernel_ulong_t)&zx297520v3_matrixreset_data,
+	},
+	{
+		.name = "zx297520v3-lspreset",
+		.driver_data = (kernel_ulong_t)&zx297520v3_lspreset_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, reset_zx297520v3_ids);
+
+static struct platform_driver reset_zx297520v3 = {
+	.probe = reset_zx297520v3_probe,
+	.driver = {
+		.name = "reset-zx297520v3",
+	},
+	.id_table = reset_zx297520v3_ids,
+};
+module_platform_driver(reset_zx297520v3);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 reset driver");
+MODULE_LICENSE("GPL");

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261109-zx29reset-3f6a4f4bbd8a

Best regards,
--  
Stefan Dösinger <stefandoesinger@gmail.com>


