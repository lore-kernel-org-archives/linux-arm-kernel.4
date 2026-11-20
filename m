Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5E4606AB98
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XKifRVOh;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hk7ohV3C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Oz3DzHqzANRXdOf1qOfILmgSuOIeY8r0MCU4DvwHK+g=; b=XKifRVOhU1ZUwe
	84B++V14U/UFY03Z98ngk/9Oo2cbvFt7RLOQj/PPLid2XhnIB5YfkDxSBDvz4dODjylrCybDyVqg0
	uTuocVm6hCGFYt/+HNk4gA0z2zWT1QkfQDJVEcvrpxXOH30NI3eOdx2NqB35GXyuYMae7Zw2eWVqe
	xai1Dmy8yQGjv+pOZs4COTEcGYTKqu577LmH3G9u8hZXBRTmONJ3bV1/e4xyOcqm5Wa0GwEdCZnJx
	h5uk1C668ZRSXVGMjXc0ovaSqh4Kx/tJqiMIh/jM2UVBHNP9fMbrm/dwRmzqRmmcccMXtBU8FEnOc
	QMAhB/cEszLn5K/x7SFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOOy-0000000F3mZ-3lO2;
	Fri, 20 Nov 2026 13:11:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOOp-0000000F3e5-2EXZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:11:33 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso460447f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180289; x=1795785089; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oz3DzHqzANRXdOf1qOfILmgSuOIeY8r0MCU4DvwHK+g=;
        b=hk7ohV3C6PqyJKRH2URa4YNlCgzMLAho4eLgK+wbgGDSt2G2QlFlmhY+ZlYiz7jBwW
         8Lj27G9yIvJ4CkxeUUYiXGqQN4xsXF/DuwiqIqj4B/nrR+PQ3O8hcndgSdn0ITnlD2ju
         xKkwdixaYQ63sY95yJMsCr2SKFI/00KtBfl+4wSD8mGA7/6TA9BcaaZYkOve3rXt+AXk
         ddFeK31NgHkwN8vKpd2jSD00rBbaThjNm0ByGgNOaIMOwOxoS+LS38zg3tSUlvE4XUqX
         dMUsaQRiIZnhqc61apcfjtK+gJWGB7N0et7uOwSn7urxugC83E2Vi14bsDW6x2xpxOeX
         P3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180289; x=1795785089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oz3DzHqzANRXdOf1qOfILmgSuOIeY8r0MCU4DvwHK+g=;
        b=1HosHiRArSCcpcm4svrWqThc/CF92aK7SRUN99ijX4mu4vxnIPpL5jZqQUjTxiyiyH
         kFoj9oNlATKgeyo+xQeTy4ugHPxBtmrrsjUyI3GrmNCuWJVtnaW2r2ZhPeFRc5GWTOAZ
         WbXyuxO1JdX5/OrmCC5q1c684PZ/9O4pic2aJUQXBdmWTGuBKFlM7w8RO75jmyMnORpA
         w4ULBD1DqrKe3uFp7PzxRaCJIOGC0E2o4fiqRdutare5+8WlkdCe8gpOTXmPW6Ty2mf0
         X/zZn0PoN/qwaaTfuDBNrwGdeKIN7cjX8OvPrMKjdO59jG0x19/v244dP60VBqByjQ5D
         i5pQ==
X-Forwarded-Encrypted: i=1; AL+hErFgfqyOcgRJO1ELYMtbMCNR60vYiMhsC+qvBT+bIV3L1kQbDrqfx/xuCuceSsGkokeKY0jZk3TPRpVrNd314FiQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+eaitgqI9LveDu4CLAicbtHIxAOVDicOvfUpU75rK4JNj+q5m1
	O838m2vkWqpHQRlsw3wWZnAeGUDhuBZB4ekYActThHW5ETlGEBoYkoPzZn/0RKsezkM=
X-Gm-Gg: AYBFou2EPkPmpiUoaErmAyiKEdy2ZbKu2pJtQSyaldJ0OAB9E8+nvb2klsq/O+/wktT
	tU0YVohP5WLZcF3KYktkTHPgI1ZiTp5hKfY43ny5EmBlyPfJnxSMIWFZjaBcfpEQpSigWQMBPfV
	CRKw0h7jqYfnjJkROo37TzorAkwoALietL+kKsSMKRnGdn6LNpGDlHljLVWy9LU+bWmhIebZSwT
	xxygESfz2eYkasjUfAkQkvSFSQ/dHyvWCm91LvDr4ONtwIztzTwTF16Z9Brx5ZTYUxZiJ7hc+wD
	e7RaHevwg4S2rbgrtyvpvBZ6r6kejlb/uwhMISXubB8K6Xa+ySY0M4J/EeI2Wh5mhM9FTK5BWiu
	XCJBxfwcKBTQKPa5AlFdNEpR2tEq5x+j46vj8RzoMfVNFnM9haXNUEpd6Mkf+Bee3HZjPUpcJz4
	pyjqAYGDxfede7oiD8+pOlSTM4VlrpgUQ7RIHUAKKrGMaaqUM+IC4kqMJH6qVlq+V4h8H19DUC6
	wty9+lJEnbXb+fgp6bL2LzQ8kWjJbNfK4V8NozXgoVnBcQ8eU8lpZXp6JvFt73c692mQ/CU8EGq
	m66/4862O/uOOtN9sZc8zdIzVRMZHjs6jZDyyDg3lh4hj9RxoAk61rPx8LMBJpWf+uC6Ne75y9k
	1zQZPXkBl88RqPb2I2IeUS9cdxP61JI05rqMvukhZNFg6Mw==
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr72990565e9.4.1795180289461;
        Fri, 20 Nov 2026 05:11:29 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:29 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:07 +0100
Subject: [PATCH v2 4/6] clk: amlogic: Add S7 PLL clock controller driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-upstream-s7-clk-v2-4-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_051131_771986_51A0C099 
X-CRM114-Status: GOOD (  21.92  )
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

The S7 PLL controller provides the fixed PLL with its fclk dividers,
the GP0, HIFI0 and HIFI1 PLLs, and the HDMI PLL.

Add a driver for it. The GP0 and HIFI PLLs are expected to run with
their input divided by 2 (div0p5) and the HDMI PLL without it, as the
firmware and the init sequences set them up.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/Kconfig  |  14 +
 drivers/clk/meson/Makefile |   1 +
 drivers/clk/meson/s7-pll.c | 696 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 711 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index d460514bb8a1..35f2971448af 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -229,6 +229,20 @@ config COMMON_CLK_S4_PERIPHERALS
 	  Support for the peripherals clock controller on Amlogic S805X2 and S905Y4
 	  devices, AKA S4. Say Y if you want S4 peripherals clock controller to work.
 
+config COMMON_CLK_S7_PLL
+	tristate "Amlogic S7 SoC PLL controller support"
+	depends on ARM64 || COMPILE_TEST
+	default ARCH_MESON
+	select COMMON_CLK_MESON_REGMAP
+	select COMMON_CLK_MESON_CLKC_UTILS
+	select COMMON_CLK_MESON_PLL
+	imply COMMON_CLK_SCMI
+	help
+	  Support for the PLL clock controller on Amlogic S805X3 based
+	  devices, AKA S7. This controller provides the fixed PLL and its
+	  dividers, the GP0, HIFI0 and HIFI1 PLLs and the HDMI PLL. Say Y if
+	  you want the S7 PLL clock controller to work.
+
 config COMMON_CLK_T7_PLL
 	tristate "Amlogic T7 SoC PLL controller support"
 	depends on ARM64
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 56b04254eb1a..9d439106d11c 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -28,5 +28,6 @@ obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
 obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
 obj-$(CONFIG_COMMON_CLK_S4_PERIPHERALS) += s4-peripherals.o
+obj-$(CONFIG_COMMON_CLK_S7_PLL) += s7-pll.o
 obj-$(CONFIG_COMMON_CLK_T7_PLL) += t7-pll.o
 obj-$(CONFIG_COMMON_CLK_T7_PERIPHERALS) += t7-peripherals.o
diff --git a/drivers/clk/meson/s7-pll.c b/drivers/clk/meson/s7-pll.c
new file mode 100644
index 000000000000..737420027d83
--- /dev/null
+++ b/drivers/clk/meson/s7-pll.c
@@ -0,0 +1,696 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Amlogic S7 PLL Clock Controller Driver
+ *
+ * Copyright (c) 2026 BayLibre, SAS.
+ * Author: Carlo Caione <ccaione@baylibre.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include "clk-regmap.h"
+#include "clk-pll.h"
+#include "meson-clkc-utils.h"
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
+
+#define FIXPLL_CTRL0			0x040
+#define FIXPLL_CTRL1			0x044
+#define FIXPLL_STS			0x05c
+#define GP0PLL_CTRL0			0x080
+#define GP0PLL_CTRL1			0x084
+#define GP0PLL_CTRL2			0x088
+#define GP0PLL_CTRL3			0x08c
+#define GP0PLL_STS			0x09c
+#define HIFI0PLL_CTRL0			0x100
+#define HIFI0PLL_CTRL1			0x104
+#define HIFI0PLL_CTRL2			0x108
+#define HIFI0PLL_CTRL3			0x10c
+#define HIFI1PLL_CTRL0			0x110
+#define HIFI1PLL_CTRL1			0x114
+#define HIFI1PLL_CTRL2			0x118
+#define HIFI1PLL_CTRL3			0x11c
+#define HIFI0PLL_STS			0x120
+#define HIFI1PLL_STS			0x124
+#define HDMIPLL_CTRL0			0x1c0
+#define HDMIPLL_CTRL1			0x1c4
+#define HDMIPLL_CTRL2			0x1c8
+#define HDMIPLL_CTRL3			0x1cc
+#define HDMIPLL_STS			0x1dc
+
+static struct clk_regmap s7_fixed_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.n = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 11,
+			.width   = 5,
+		},
+		.l = {
+			.reg_off = FIXPLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "fixed_pll_vco",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "fix",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_fixed_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = FIXPLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "fixed_pll",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_fixed_pll_vco.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+#define S7_FCLK_DIV(_name, _mult, _divider)				\
+struct clk_fixed_factor s7_##_name##_div = {				\
+	.mult = (_mult),						\
+	.div = (_divider),						\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name "_div",					\
+		.ops = &clk_fixed_factor_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&s7_fixed_pll.hw				\
+		},							\
+		.num_parents = 1,					\
+	},								\
+}
+
+#define S7_FCLK(_name, _reg, _bit)					\
+struct clk_regmap s7_##_name = {					\
+	.data = &(struct clk_regmap_gate_data) {			\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = &clk_regmap_gate_ro_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&s7_##_name##_div.hw				\
+		},							\
+		.num_parents = 1,					\
+	},								\
+}
+
+/*
+ * The datasheet documents FIXPLL_CTRL1[30:26] as a single fclk_en field, but
+ * each bit enables one divider.
+ */
+static S7_FCLK_DIV(fclk_div2, 1, 2);
+static S7_FCLK(fclk_div2, FIXPLL_CTRL1, 30);
+static S7_FCLK_DIV(fclk_div3, 1, 3);
+static S7_FCLK(fclk_div3, FIXPLL_CTRL1, 26);
+static S7_FCLK_DIV(fclk_div4, 1, 4);
+static S7_FCLK(fclk_div4, FIXPLL_CTRL1, 27);
+static S7_FCLK_DIV(fclk_div5, 1, 5);
+static S7_FCLK(fclk_div5, FIXPLL_CTRL1, 28);
+static S7_FCLK_DIV(fclk_div7, 1, 7);
+static S7_FCLK(fclk_div7, FIXPLL_CTRL1, 29);
+static S7_FCLK_DIV(fclk_div2p5, 2, 5);
+static S7_FCLK(fclk_div2p5, FIXPLL_CTRL0, 25);
+
+static const struct pll_mult_range s7_pll_mult_range = {
+	.min = 134,
+	.max = 265,
+};
+
+/*
+ * BIG FAT WARNING: each VCO must be registered before its div0p5 divider.
+ *
+ * div0p5 divides the PLL input by 2 when set. Linux doesn't change it at
+ * runtime, but the VCO init sequence writes it (set for GP0, HIFI0 and HIFI1,
+ * clear for HDMI) unless the PLL is running and has
+ * CLK_MESON_PLL_NOINIT_ENABLED. A divider registered before that would keep
+ * the power-on value as its rate.
+ *
+ * meson_clkc_mmio_probe() registers the clocks in ID order, so each VCO has a
+ * lower ID than its divider: the VCO init runs at registration while the VCO
+ * is still an orphan, then the divider reads the final value and the framework
+ * recalculates the VCO rate. CLK_GET_RATE_NOCACHE makes the divider read the
+ * register again whenever its rate is queried.
+ *
+ * WARNING: the multiplier ranges assume the init values, div0p5 set for GP0,
+ * HIFI0 and HIFI1 and clear for HDMI. A PLL the firmware leaves running with
+ * the other setting is reported correctly, but the same multipliers then give
+ * twice (GP0/HIFI) or half (HDMI) the DCO rate, possibly outside the hardware
+ * limits, and the driver still accepts them.
+ */
+static const struct clk_div_table s7_pll_div0p5_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ /* sentinel */ }
+};
+
+static const struct reg_sequence s7_gp0_pll_init_regs[] = {
+	{ .reg = GP0PLL_CTRL0,	.def = 0x02520800 },
+	{ .reg = GP0PLL_CTRL1,	.def = 0x09900322 },
+	{ .reg = GP0PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = GP0PLL_CTRL3,	.def = 0x00000006 },
+};
+
+static struct clk_regmap s7_gp0_pll_div0p5 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = GP0PLL_CTRL1,
+		.shift = 27,
+		.width = 1,
+		.table = s7_pll_div0p5_table,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_pll_div0p5",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "gp0",
+		},
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap s7_gp0_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = GP0PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = GP0PLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = GP0PLL_CTRL2,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = GP0PLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = GP0PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.range = &s7_pll_mult_range,
+		.init_regs = s7_gp0_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_gp0_pll_init_regs),
+		.flags = CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_gp0_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_gp0_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = GP0PLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO |
+			 CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_gp0_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct reg_sequence s7_hifi0_pll_init_regs[] = {
+	{ .reg = HIFI0PLL_CTRL0,	.def = 0x02520800 },
+	{ .reg = HIFI0PLL_CTRL1,	.def = 0x09900322 },
+	{ .reg = HIFI0PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = HIFI0PLL_CTRL3,	.def = 0x00000006 },
+};
+
+static struct clk_regmap s7_hifi0_pll_div0p5 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HIFI0PLL_CTRL1,
+		.shift = 27,
+		.width = 1,
+		.table = s7_pll_div0p5_table,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi0_pll_div0p5",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hifi0",
+		},
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap s7_hifi0_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = HIFI0PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HIFI0PLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = HIFI0PLL_CTRL2,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HIFI0PLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HIFI0PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.frac_max = 100000,
+		.range = &s7_pll_mult_range,
+		.init_regs = s7_hifi0_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_hifi0_pll_init_regs),
+		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi0_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi0_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hifi0_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HIFI0PLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO |
+			 CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi0_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi0_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct reg_sequence s7_hifi1_pll_init_regs[] = {
+	{ .reg = HIFI1PLL_CTRL0,	.def = 0x02520800 },
+	{ .reg = HIFI1PLL_CTRL1,	.def = 0x09900322 },
+	{ .reg = HIFI1PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = HIFI1PLL_CTRL3,	.def = 0x00000006 },
+};
+
+static struct clk_regmap s7_hifi1_pll_div0p5 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HIFI1PLL_CTRL1,
+		.shift = 27,
+		.width = 1,
+		.table = s7_pll_div0p5_table,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi1_pll_div0p5",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hifi1",
+		},
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap s7_hifi1_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = HIFI1PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HIFI1PLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = HIFI1PLL_CTRL2,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HIFI1PLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HIFI1PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.frac_max = 100000,
+		.range = &s7_pll_mult_range,
+		.init_regs = s7_hifi1_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_hifi1_pll_init_regs),
+		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi1_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi1_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hifi1_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HIFI1PLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO |
+			 CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi1_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi1_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct pll_mult_range s7_hdmi_pll_mult_range = {
+	.min = 125,
+	.max = 249,
+};
+
+static const struct reg_sequence s7_hdmi_pll_init_regs[] = {
+	{ .reg = HDMIPLL_CTRL0,	.def = 0x00881000 },
+	{ .reg = HDMIPLL_CTRL1,	.def = 0x2c6011cc },
+	{ .reg = HDMIPLL_CTRL2,	.def = 0x86801000 },
+	{ .reg = HDMIPLL_CTRL3,	.def = 0x00000000 },
+};
+
+static struct clk_regmap s7_hdmi_pll_div0p5 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL1,
+		.shift = 19,
+		.width = 1,
+		.table = s7_pll_div0p5_table,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_div0p5",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hdmi",
+		},
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = HDMIPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HDMIPLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = HDMIPLL_CTRL3,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HDMIPLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HDMIPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.range = &s7_hdmi_pll_mult_range,
+		.init_regs = s7_hdmi_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_hdmi_pll_init_regs),
+		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
+			 CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+/*
+ * The datasheet documents HDMIPLL_CTRL2[22:19] and [18:15] as single fields.
+ * [22:19] holds two cascaded power-of-two dividers, od0 [20:19] and od1
+ * [22:21]. [18:15] holds two parallel ones: [16:15] is hdmi_pll, [18:17]
+ * feeds the PHY and is not modelled.
+ */
+static struct clk_regmap s7_hdmi_pll_od0 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL2,
+		.shift = 19,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_od0",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll_od1 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL2,
+		.shift = 21,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_od1",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_od0.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL2,
+		.shift = 15,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_od1.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_hdmi_pll_pix_div5 = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix_div5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_hdmi_pll_pix_div6p25 = {
+	.mult = 4,
+	.div = 25,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix_div6p25",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_hdmi_pll_pix_div7p5 = {
+	.mult = 2,
+	.div = 15,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix_div7p5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll_pix = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = HDMIPLL_CTRL0,
+		.mask = 0x3,
+		.shift = 9,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_pix_div5.hw,
+			&s7_hdmi_pll_pix_div6p25.hw,
+			&s7_hdmi_pll_pix_div7p5.hw
+		},
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_hw *s7_pll_hws[] = {
+	[CLKID_FIXED_PLL_VCO]		= &s7_fixed_pll_vco.hw,
+	[CLKID_FIXED_PLL]		= &s7_fixed_pll.hw,
+	[CLKID_FCLK_DIV2_DIV]		= &s7_fclk_div2_div.hw,
+	[CLKID_FCLK_DIV2]		= &s7_fclk_div2.hw,
+	[CLKID_FCLK_DIV3_DIV]		= &s7_fclk_div3_div.hw,
+	[CLKID_FCLK_DIV3]		= &s7_fclk_div3.hw,
+	[CLKID_FCLK_DIV4_DIV]		= &s7_fclk_div4_div.hw,
+	[CLKID_FCLK_DIV4]		= &s7_fclk_div4.hw,
+	[CLKID_FCLK_DIV5_DIV]		= &s7_fclk_div5_div.hw,
+	[CLKID_FCLK_DIV5]		= &s7_fclk_div5.hw,
+	[CLKID_FCLK_DIV7_DIV]		= &s7_fclk_div7_div.hw,
+	[CLKID_FCLK_DIV7]		= &s7_fclk_div7.hw,
+	[CLKID_FCLK_DIV2P5_DIV]		= &s7_fclk_div2p5_div.hw,
+	[CLKID_FCLK_DIV2P5]		= &s7_fclk_div2p5.hw,
+	[CLKID_GP0_PLL_VCO]		= &s7_gp0_pll_vco.hw,
+	[CLKID_GP0_PLL_DIV0P5]		= &s7_gp0_pll_div0p5.hw,
+	[CLKID_GP0_PLL]			= &s7_gp0_pll.hw,
+	[CLKID_HIFI0_PLL_VCO]		= &s7_hifi0_pll_vco.hw,
+	[CLKID_HIFI0_PLL_DIV0P5]	= &s7_hifi0_pll_div0p5.hw,
+	[CLKID_HIFI0_PLL]		= &s7_hifi0_pll.hw,
+	[CLKID_HIFI1_PLL_VCO]		= &s7_hifi1_pll_vco.hw,
+	[CLKID_HIFI1_PLL_DIV0P5]	= &s7_hifi1_pll_div0p5.hw,
+	[CLKID_HIFI1_PLL]		= &s7_hifi1_pll.hw,
+	[CLKID_HDMI_PLL_VCO]		= &s7_hdmi_pll_vco.hw,
+	[CLKID_HDMI_PLL_DIV0P5]		= &s7_hdmi_pll_div0p5.hw,
+	[CLKID_HDMI_PLL_OD0]		= &s7_hdmi_pll_od0.hw,
+	[CLKID_HDMI_PLL_OD1]		= &s7_hdmi_pll_od1.hw,
+	[CLKID_HDMI_PLL]		= &s7_hdmi_pll.hw,
+	[CLKID_HDMI_PLL_PIX_DIV5]	= &s7_hdmi_pll_pix_div5.hw,
+	[CLKID_HDMI_PLL_PIX_DIV6P25]	= &s7_hdmi_pll_pix_div6p25.hw,
+	[CLKID_HDMI_PLL_PIX_DIV7P5]	= &s7_hdmi_pll_pix_div7p5.hw,
+	[CLKID_HDMI_PLL_PIX]		= &s7_hdmi_pll_pix.hw,
+};
+
+static const struct meson_clkc_data s7_pll_clkc_data = {
+	.hw_clks = {
+		.hws = s7_pll_hws,
+		.num = ARRAY_SIZE(s7_pll_hws),
+	},
+};
+
+static const struct of_device_id s7_pll_clkc_match_table[] = {
+	{
+		.compatible = "amlogic,s7-pll-clkc",
+		.data = &s7_pll_clkc_data,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s7_pll_clkc_match_table);
+
+static struct platform_driver s7_pll_clkc_driver = {
+	.probe		= meson_clkc_mmio_probe,
+	.driver		= {
+		.name	= "s7-pll-clkc",
+		.of_match_table = s7_pll_clkc_match_table,
+	},
+};
+module_platform_driver(s7_pll_clkc_driver);
+
+MODULE_DESCRIPTION("Amlogic S7 PLL Clock Controller driver");
+MODULE_AUTHOR("Carlo Caione <ccaione@baylibre.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("CLK_MESON");

-- 
2.56.1


