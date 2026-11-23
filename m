Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBDF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 06:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F1iFFres;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybfp0+pW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d7N7akItKXqErTZCoCZXojsQbx4u2LaeuSFiRq3q31I=; b=F1iFFresPyFXBB
	BJBqAl2I2EMhW39JZzKpwpvw97oYFIAlFhPZDwPsGHc2hXg2A8iFN64d/3a2ZbIVBo5v8qXKL8+DN
	pIj6gys/v8Uov144tT8rSM/RwYdNCR7Iy2Pgg3fAPdxxoWQtJRf48bTULQk6dFam8iMoV8vUmUpaZ
	riyY65gVX85VcKJyKuwyGpK1ViSKMBmK2QcPd9rD32B1Azfk4yTDfX5B1hSv2vj27CDzxR2Fg0e8F
	UWQb6kKROkteXD7QwbXpQx/xLsZpsYMFwKLO1UxcF82wuPINdPzZ5Mx2+Tl3nUD3henC5tg7n5DW6
	57NMgRL68wQas/c+7EtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNue-00000002OpB-1AI8;
	Mon, 23 Nov 2026 06:52:28 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNtK-00000002OiS-0O1q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 06:51:24 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso1005486a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 22:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416665; x=1796021465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7N7akItKXqErTZCoCZXojsQbx4u2LaeuSFiRq3q31I=;
        b=ybfp0+pWFJIDLvGBbpdy7C1dEY8f6wxqLGEA5HQ1XmY/yS/jk5jawT7k3K7x6F47+v
         3Fb85HwlBkfMMJj/H60sPITh/5HXpjXI/3qjYk37W+jWJQKuJzTS4EFydFLcpFo4jPnP
         fYWHM4+jCnQf4hTBs3/nqjtDeJ7osQLmukOhNVXgiiU4NXUxv8l5As2vl926aFi5kT2T
         FkW8f3c4B2wSe8Jp5JYMcby3y6OFQ+kwh3SJhSOiQxFtsetWFjyLpT85Q34oFrFFCzym
         PRgtGqaP7/LCI+Tv2/dI2Q78M4X+360IrAU24TsRKXCqC7fS+gUKXzOQZhp4SmYiUg+/
         HYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416665; x=1796021465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d7N7akItKXqErTZCoCZXojsQbx4u2LaeuSFiRq3q31I=;
        b=x7dmsasrQcPI8o78kfnD+QSTuaI0bEcoXkhOg01pj+Z2yRiGwzCkIlN+DUg5KcQvro
         JkEGiHPFHbcbSg40NVdxlkG1xaDPf0UescJErqbobv+COX9+xs8aFIJ9ZpaxMkNqh265
         2+lNRZnEOuobfCk873EdU/GL064EK/PkHJQdRvYHpFdIhTz2dOxDgXLIq6F1TtTKTH95
         w2Uj+8Dl3J16P0ABUtQeCiHYusMxtYsDtuZPtK9hVMdGFxsQF7CTv/33q3++pPSxrXXW
         1GeUvdX41OdJEESl8H5eAQUMZ9Vlfdsx6XlTCs8iSrEkE3i/uBRdQb5I/B74rwOnUu9w
         Fu/Q==
X-Gm-Message-State: APuU4Z8T4aOPHrzSheal+UIVdleTioySinBq7LmUl12uH6VFzd4yPueZ
	G2OUqwMmlHr0XshtGUr9LbtReshvQoKnPlF3Ew4S3q8+PQDsxKMF3/XA
X-Gm-Gg: AZFdTZeFo/OwiVMJTlQ86t//yUpo2kWVgkHj/chBshQa4YcAf9hvS+uSUOKrBYS+P71
	f8E4sXy5jqW1x7ILah1S7nZDnSrJ768HucV0ge2w5ZhBKv34LDiuIkrWgewTwgSLxA2e1dFdBsk
	WfCFTNTonFoEKD318V3ADoRgC55pzOtuEXyVz0zFEBsPwvG7473lMnKvEs/n6zHVoHXMgKYAlfh
	vWskPGpqF0TW7Ax0NkNCW8xiG5V01eGaAgEUb4bgSYuOfrREOSJmtt7SeC3rA1SdRjkjvAtPMlo
	2RYMmg1lFWOqVDt4tAOr1ee2Z5XTuIr6FfH9m7/DolkXZwu1lN7zxaEv3Qh7O1jyVja2QKZO1PJ
	1Bw5EWUxPARBaco6q3Rwmh6G5lgKXEdtoESCreUAi9MRb9k7GwMwIdnYJSf2PWh04Q1V4Fpll+B
	fZnjGvFjblH+xAf0BQIN7W3cZJPKEVcvgWlwIhyUS3STPO4h9iIv2IsKjW8uC9srM8/Wany8Ujl
	paiJhvp5PWuCziSaXLfVsu/nERhBQu6JdpuBWa7KxainUzh2rNKl7aud7L5aSUdHcp0s9XJaszg
	LP7Voddd5bU3ui0/G6Q8UmO/xsyw9aQQTQW7O6RoHWSoCE9tU7a/n2r05a12eEK8CbYVeSs44Pz
	CCwNIhl0DL0nGYxE=
X-Received: by 2002:a17:90b:3810:b0:3b4:ac3:8af2 with SMTP id 98e67ed59e1d1-3b41c9cf6famr9184421a91.27.1795416664913;
        Sun, 22 Nov 2026 22:51:04 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm5224811a91.9.2026.11.22.22.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:51:04 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v7 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Mon, 23 Nov 2026 14:50:06 +0800
Message-Id: <20261123065006.28768-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123065006.28768-1-cwweng.linux@gmail.com>
References: <20261123065006.28768-1-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_225109_395820_DBB206E5 
X-CRM114-Status: GOOD (  29.40  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add a PWM framework driver for the Nuvoton MA35D1 EPWM controller.

The controller provides 6 PWM channels. The initial driver supports
up-counting, auto-reload, independent output mode and period loading
mode.

Configure the waveform generator to drive the output high at the zero
point and low at the compare-up point. In up-counting mode the counter
counts from 0 to PERIOD inclusive. CMPDAT = 0 therefore generates a 0%
duty cycle, while CMPDAT > PERIOD generates a 100% duty cycle.

Limit the period to 0xffff counter cycles so that PERIOD is at most
0xfffe and CMPDAT = 0xffff remains available to represent a 100% duty
cycle.

The clock prescaler is shared by each pair of PWM channels. Preserve
the existing prescaler value and account for CLKPSC + 1 when calculating
and reporting the period and duty cycle.

Do not modify the controller during probe, preserving PWM outputs that
may have been configured by firmware. Configure only the requested
channel from the apply callback, and refuse to change an active
complementary pair to independent mode if doing so would disturb the
paired output.

Period and compare values use the hardware period-loading buffers.
Because PERIOD and CMPDAT are written separately, a period boundary
between the two writes can result in one transitional cycle using the
new period with the previous duty cycle.

When disabling a channel, clear its output-enable and counter-enable
bits. Clearing the output-enable bit places the output pin in high
impedance.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 drivers/pwm/Kconfig      |  10 +
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-ma35d1.c | 382 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 393 insertions(+)
 create mode 100644 drivers/pwm/pwm-ma35d1.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index e8886a9b64d9..d971760b37c6 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -463,6 +463,16 @@ config PWM_LPSS_PLATFORM
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-lpss-platform.
 
+config PWM_MA35D1
+	tristate "Nuvoton MA35D1 PWM support"
+	depends on ARCH_MA35 || COMPILE_TEST
+	help
+	  Generic PWM framework driver for the Nuvoton MA35D1 PWM
+	  controller, which provides 6 PWM outputs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-ma35d1.
+
 config PWM_MAX7360
 	tristate "MAX7360 PWMs"
 	depends on MFD_MAX7360
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 5630a521a7cf..7ad761ea27d1 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_PWM_LPC32XX)	+= pwm-lpc32xx.o
 obj-$(CONFIG_PWM_LPSS)		+= pwm-lpss.o
 obj-$(CONFIG_PWM_LPSS_PCI)	+= pwm-lpss-pci.o
 obj-$(CONFIG_PWM_LPSS_PLATFORM)	+= pwm-lpss-platform.o
+obj-$(CONFIG_PWM_MA35D1)	+= pwm-ma35d1.o
 obj-$(CONFIG_PWM_MAX7360)	+= pwm-max7360.o
 obj-$(CONFIG_PWM_MC33XS2410)	+= pwm-mc33xs2410.o
 obj-$(CONFIG_PWM_MEDIATEK)	+= pwm-mediatek.o
diff --git a/drivers/pwm/pwm-ma35d1.c b/drivers/pwm/pwm-ma35d1.c
new file mode 100644
index 000000000000..0a6efb660570
--- /dev/null
+++ b/drivers/pwm/pwm-ma35d1.c
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Nuvoton MA35D1 PWM controller
+ *
+ * Copyright (C) 2026 Nuvoton Corporation
+ *               Chi-Wen Weng <cwweng@nuvoton.com>
+ *
+ * Reference Manual:
+ * https://www.nuvoton.com/resource-download.jsp?tp_GUID=DA05-MA35D16
+ *
+ * Limitations:
+ * - The hardware supports 6 PWM channels.
+ * - The hardware supports up, down and up-down counter types. This driver
+ *   supports up-counting mode only.
+ * - The hardware supports auto-reload and one-shot counter modes. This driver
+ *   supports auto-reload mode only.
+ * - The hardware supports independent and complementary output modes. This
+ *   driver supports independent mode only. If a channel pair is already active
+ *   in complementary mode, applying a new state to one channel fails with
+ *   -EBUSY to avoid disturbing the paired output.
+ * - The hardware supports period, immediate, window and center loading modes.
+ *   This driver supports period loading mode only.
+ * - The hardware supports programmable waveform actions at zero, period and
+ *   compare points. This driver uses zero point high and compare-up point low
+ *   actions for normal PWM output.
+ * - In up-counting mode, the counter counts from 0 to PERIOD inclusive. With
+ *   zero point high and compare-up point low actions, CMPDAT = 0 produces 0%
+ *   duty and CMPDAT > PERIOD produces 100% duty.
+ * - The driver limits the period to 0xffff counter cycles so that CMPDAT can
+ *   be set greater than PERIOD to generate a 100% duty cycle.
+ * - Period and duty cycle changes are buffered by hardware and take effect at
+ *   the end of the current period.
+ * - The clock prescaler is shared by each channel pair. The driver preserves
+ *   the current prescaler and accounts for it in period and duty calculations.
+ * - Polarity and waveform-control changes are applied directly and may cause
+ *   a transient output change if the PWM output is running.
+ * - When disabled, the output pin is put in tri-state by clearing POENn.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+
+#define MA35D1_REG_EPWM_CTL0			0x00
+#define MA35D1_REG_EPWM_CTL1			0x04
+#define MA35D1_REG_EPWM_CLKPSC(ch)		(0x14 + 4 * ((ch) / 2))
+#define MA35D1_REG_EPWM_CNTEN			0x20
+#define MA35D1_REG_EPWM_PERIOD(ch)		(0x30 + 4 * (ch))
+#define MA35D1_REG_EPWM_CMPDAT(ch)		(0x50 + 4 * (ch))
+#define MA35D1_REG_EPWM_WGCTL0			0xb0
+#define MA35D1_REG_EPWM_WGCTL1			0xb4
+#define MA35D1_REG_EPWM_POLCTL			0xd4
+#define MA35D1_REG_EPWM_POEN			0xd8
+
+#define MA35D1_REG_EPWM_CTL0_CTRLD(ch)		BIT(ch)
+#define MA35D1_REG_EPWM_CTL0_WINLDEN(ch)	BIT(8 + (ch))
+#define MA35D1_REG_EPWM_CTL0_IMMLDEN(ch)	BIT(16 + (ch))
+
+#define MA35D1_REG_EPWM_CTL1_CNTTYPE(ch)	(0x3 << (2 * (ch)))
+#define MA35D1_REG_EPWM_CTL1_CNTMODE(ch)	BIT(16 + (ch))
+#define MA35D1_REG_EPWM_CTL1_OUTMODE(ch)	BIT(24 + ((ch) / 2))
+
+#define MA35D1_REG_EPWM_CLKPSC_MASK		GENMASK(11, 0)
+#define MA35D1_REG_EPWM_CNTEN_EN(ch)		BIT(ch)
+#define MA35D1_REG_EPWM_POEN_EN(ch)		BIT(ch)
+#define MA35D1_REG_EPWM_POLCTL_INV(ch)		BIT(ch)
+
+#define MA35D1_PWM_WGCTL_ACTION_MASK		0x3
+#define MA35D1_PWM_WGCTL_ACTION(ch)		\
+	(MA35D1_PWM_WGCTL_ACTION_MASK << (2 * (ch)))
+#define MA35D1_PWM_WGCTL_ACTION_VAL(ch, action)	((action) << (2 * (ch)))
+#define MA35D1_PWM_WGCTL_ACTION_LOW		1
+#define MA35D1_PWM_WGCTL_ACTION_HIGH		2
+
+#define MA35D1_PWM_DATA_MASK			GENMASK(15, 0)
+#define MA35D1_PWM_MAX_CYCLES			0xffff
+
+#define MA35D1_PWM_NUM_CHANNELS			6
+
+struct nuvoton_pwm {
+	void __iomem *base;
+	unsigned long clkrate;
+};
+
+static inline struct nuvoton_pwm *nuvoton_pwm_from_chip(struct pwm_chip *chip)
+{
+	return pwmchip_get_drvdata(chip);
+}
+
+static inline u32 nuvoton_pwm_readl(struct nuvoton_pwm *nvtpwm,
+				    unsigned int offset)
+{
+	return readl(nvtpwm->base + offset);
+}
+
+static inline void nuvoton_pwm_writel(struct nuvoton_pwm *nvtpwm,
+				      unsigned int offset, u32 value)
+{
+	writel(value, nvtpwm->base + offset);
+}
+
+static inline void nuvoton_pwm_rmw(struct nuvoton_pwm *nvtpwm,
+				   unsigned int offset, u32 mask, u32 value)
+{
+	u32 reg;
+
+	reg = nuvoton_pwm_readl(nvtpwm, offset);
+	reg &= ~mask;
+	reg |= value & mask;
+	nuvoton_pwm_writel(nvtpwm, offset, reg);
+}
+
+static bool nuvoton_pwm_channel_active(struct nuvoton_pwm *nvtpwm,
+				       unsigned int ch)
+{
+	u32 cnten, poen;
+	u32 mask = BIT(ch);
+
+	cnten = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_CNTEN);
+	poen = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_POEN);
+
+	return (cnten | poen) & mask;
+}
+
+static u32 nuvoton_pwm_get_prescale(struct nuvoton_pwm *nvtpwm,
+				    unsigned int ch)
+{
+	return nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_CLKPSC(ch)) &
+	       MA35D1_REG_EPWM_CLKPSC_MASK;
+}
+
+static int nuvoton_pwm_config_channel(struct nuvoton_pwm *nvtpwm,
+				      unsigned int ch)
+{
+	u32 ctl0_mask;
+	u32 ctl1, ctl1_mask, outmode_mask;
+	u32 wgctl0_mask, wgctl0_val;
+	u32 wgctl1_mask, wgctl1_val;
+
+	outmode_mask = MA35D1_REG_EPWM_CTL1_OUTMODE(ch);
+	ctl1 = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_CTL1);
+
+	if ((ctl1 & outmode_mask) &&
+	    nuvoton_pwm_channel_active(nvtpwm, ch ^ 1))
+		return -EBUSY;
+
+	/*
+	 * IMMLDENn = 0, WINLDENn = 0 and CTRLDn = 0 select period loading
+	 * mode for up-counting operation.
+	 */
+	ctl0_mask = MA35D1_REG_EPWM_CTL0_IMMLDEN(ch);
+	ctl0_mask |= MA35D1_REG_EPWM_CTL0_WINLDEN(ch);
+	ctl0_mask |= MA35D1_REG_EPWM_CTL0_CTRLD(ch);
+
+	/*
+	 * CNTTYPEn = 00: up counter type
+	 * CNTMODEn = 0: auto-reload mode
+	 * OUTMODEn = 0: independent mode
+	 */
+	ctl1_mask = MA35D1_REG_EPWM_CTL1_CNTTYPE(ch);
+	ctl1_mask |= MA35D1_REG_EPWM_CTL1_CNTMODE(ch);
+	ctl1_mask |= outmode_mask;
+
+	/*
+	 * ZPCTLn = 10: output high at zero point
+	 * PRDPCTLn = 00: do nothing at period point
+	 */
+	wgctl0_mask = MA35D1_PWM_WGCTL_ACTION(ch);
+	wgctl0_mask |= MA35D1_PWM_WGCTL_ACTION(ch) << 16;
+	wgctl0_val = MA35D1_PWM_WGCTL_ACTION_VAL(ch, MA35D1_PWM_WGCTL_ACTION_HIGH);
+
+	/*
+	 * CMPUCTLn = 01: output low at compare up point
+	 * CMPDCTLn = 00: do nothing at compare down point
+	 */
+	wgctl1_mask = MA35D1_PWM_WGCTL_ACTION(ch);
+	wgctl1_mask |= MA35D1_PWM_WGCTL_ACTION(ch) << 16;
+	wgctl1_val = MA35D1_PWM_WGCTL_ACTION_VAL(ch, MA35D1_PWM_WGCTL_ACTION_LOW);
+
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_CTL0, ctl0_mask, 0);
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_CTL1, ctl1_mask, 0);
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_WGCTL0, wgctl0_mask, wgctl0_val);
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_WGCTL1, wgctl1_mask, wgctl1_val);
+
+	return 0;
+}
+
+static int nuvoton_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			     const struct pwm_state *state)
+{
+	struct nuvoton_pwm *nvtpwm = nuvoton_pwm_from_chip(chip);
+	unsigned int ch = pwm->hwpwm;
+	u64 duty_cycles, period_cycles;
+	u64 divisor;
+	u32 cmpdat, period, prescale;
+	int ret;
+
+	if (!state->enabled) {
+		/* Clearing POENn disables the output driver and makes the pin high-Z. */
+		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_POEN,
+				MA35D1_REG_EPWM_POEN_EN(ch), 0);
+		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_CNTEN,
+				MA35D1_REG_EPWM_CNTEN_EN(ch), 0);
+
+		return 0;
+	}
+
+	prescale = nuvoton_pwm_get_prescale(nvtpwm, ch);
+	divisor = (u64)NSEC_PER_SEC * (prescale + 1);
+
+	period_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
+					    state->period, divisor);
+	if (!period_cycles)
+		return -EINVAL;
+
+	if (period_cycles > MA35D1_PWM_MAX_CYCLES)
+		period_cycles = MA35D1_PWM_MAX_CYCLES;
+
+	duty_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
+					  state->duty_cycle, divisor);
+	if (duty_cycles > period_cycles)
+		duty_cycles = period_cycles;
+
+	ret = nuvoton_pwm_config_channel(nvtpwm, ch);
+	if (ret)
+		return ret;
+
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_POLCTL,
+				MA35D1_REG_EPWM_POLCTL_INV(ch), 0);
+	else
+		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_POLCTL,
+				MA35D1_REG_EPWM_POLCTL_INV(ch),
+				MA35D1_REG_EPWM_POLCTL_INV(ch));
+
+	/*
+	 * In up-counting mode the counter counts from 0 to PERIOD inclusive.
+	 * With zero point high and compare-up point low actions:
+	 * - CMPDAT = 0 produces 0% duty.
+	 * - CMPDAT > PERIOD produces 100% duty.
+	 *
+	 * period_cycles is limited to 0xffff, so PERIOD is at most 0xfffe
+	 * and a 100% duty cycle can be represented by CMPDAT = 0xffff.
+	 */
+	period = period_cycles - 1;
+	cmpdat = duty_cycles;
+
+	/*
+	 * PERIOD and CMPDAT are loaded into their active buffers at a period
+	 * boundary. If a period boundary occurs between these two writes, one
+	 * cycle can use the new PERIOD value with the previous CMPDAT value.
+	 * The following period then uses both new values.
+	 */
+	nuvoton_pwm_writel(nvtpwm, MA35D1_REG_EPWM_PERIOD(ch), period);
+	nuvoton_pwm_writel(nvtpwm, MA35D1_REG_EPWM_CMPDAT(ch), cmpdat);
+
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_POEN,
+			MA35D1_REG_EPWM_POEN_EN(ch), MA35D1_REG_EPWM_POEN_EN(ch));
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_CNTEN,
+			MA35D1_REG_EPWM_CNTEN_EN(ch), MA35D1_REG_EPWM_CNTEN_EN(ch));
+
+	return 0;
+}
+
+static int nuvoton_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
+{
+	struct nuvoton_pwm *nvtpwm = nuvoton_pwm_from_chip(chip);
+	unsigned int ch = pwm->hwpwm;
+	u32 cmpdat, cnten, period, poen, polctl, prescale;
+	u64 duty_cycles, period_cycles;
+	u64 prescaled_cycles;
+
+	cnten = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_CNTEN);
+	poen = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_POEN);
+	polctl = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_POLCTL);
+	prescale = nuvoton_pwm_get_prescale(nvtpwm, ch);
+	period = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_PERIOD(ch)) &
+		 MA35D1_PWM_DATA_MASK;
+	cmpdat = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_CMPDAT(ch)) &
+		 MA35D1_PWM_DATA_MASK;
+
+	period_cycles = period + 1;
+	if (cmpdat > period)
+		duty_cycles = period_cycles;
+	else
+		duty_cycles = cmpdat;
+
+	state->enabled = (cnten & MA35D1_REG_EPWM_CNTEN_EN(ch)) &&
+			 (poen & MA35D1_REG_EPWM_POEN_EN(ch));
+	state->polarity = (polctl & MA35D1_REG_EPWM_POLCTL_INV(ch)) ?
+			  PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
+
+	prescaled_cycles = period_cycles * (prescale + 1);
+	state->period = DIV64_U64_ROUND_UP(prescaled_cycles * NSEC_PER_SEC,
+					   nvtpwm->clkrate);
+
+	prescaled_cycles = duty_cycles * (prescale + 1);
+	state->duty_cycle = DIV64_U64_ROUND_UP(prescaled_cycles * NSEC_PER_SEC,
+					       nvtpwm->clkrate);
+
+	return 0;
+}
+
+static const struct pwm_ops nuvoton_pwm_ops = {
+	.apply = nuvoton_pwm_apply,
+	.get_state = nuvoton_pwm_get_state,
+};
+
+static int nuvoton_pwm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pwm_chip *chip;
+	struct nuvoton_pwm *nvtpwm;
+	struct clk *clk;
+	int ret;
+
+	chip = devm_pwmchip_alloc(dev, MA35D1_PWM_NUM_CHANNELS,
+				  sizeof(*nvtpwm));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	nvtpwm = nuvoton_pwm_from_chip(chip);
+
+	nvtpwm->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(nvtpwm->base))
+		return PTR_ERR(nvtpwm->base);
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Unable to get the clock\n");
+
+	ret = devm_clk_rate_exclusive_get(dev, clk);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Unable to get exclusive clock rate\n");
+
+	nvtpwm->clkrate = clk_get_rate(clk);
+	if (!nvtpwm->clkrate)
+		return dev_err_probe(dev, -EINVAL,
+				     "PWM clock rate is zero\n");
+
+	if (nvtpwm->clkrate > NSEC_PER_SEC)
+		return dev_err_probe(dev, -EINVAL,
+				     "PWM clock out of range (%lu)\n",
+				     nvtpwm->clkrate);
+
+	chip->ops = &nuvoton_pwm_ops;
+	chip->atomic = true;
+
+	ret = devm_pwmchip_add(dev, chip);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to add PWM chip\n");
+
+	return 0;
+}
+
+static const struct of_device_id nuvoton_pwm_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-pwm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nuvoton_pwm_of_match);
+
+static struct platform_driver nuvoton_pwm_driver = {
+	.probe = nuvoton_pwm_probe,
+	.driver = {
+		.name = "nuvoton-pwm",
+		.of_match_table = nuvoton_pwm_of_match,
+	},
+};
+module_platform_driver(nuvoton_pwm_driver);
+
+MODULE_AUTHOR("Chi-Wen Weng <cwweng@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton MA35D1 PWM driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


