Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AD5606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KNt35msV;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=W0L/qWSN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0C7+IJmij8E9fIklBb68lvmRctOkYSNRRgzk+FfCts0=; b=KNt35msV1j2NoM
	lHhMOWl0au0e6n7MQxjdMneMM78edFWkJC5Uje7znhICSKf/ZXGxnj/S0HdfL3JOX9e4ZKaxZEGY7
	DED6eaw4ZyfS0kWeHrOpdoscuFvmPd3KOJZ+C8Dtdp62emq950ntxRhN0H/qEznf0ypooT2WxgaMc
	QNxCHDTABfVMm+rADSSfNmPKOCTGdBXvDzgvINGGlA50UVNqVOMH5cn5i8+ttCRTOX+pCghrDj3ER
	OgRjZwkH+O78qLzfvBkMDxxe5vOe/Jv//2dSePc7Mlp8Z4WExmr8K5RB/b6EImB37tq+PyhODagGJ
	YH7bavjiPsWTn8qXzOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB0D-000000079sz-1aCu;
	Wed, 11 Nov 2026 16:16:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB04-000000079nx-2kcn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:16:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so37391015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413799; x=1795018599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C7+IJmij8E9fIklBb68lvmRctOkYSNRRgzk+FfCts0=;
        b=W0L/qWSN2wrJILKBlIsQ+MQ9WmbQDewBsUOYaFMQM9zX0OdZvalzAbOGbuKEJTOh/e
         YS5ax3h7Vu5T7+xJL86KnMoDFta+CZgPkn3Qqfzrpty7A0xEhlXXShWZkgQanfPtAq91
         tqqisRHF6ju+zPoTqlPyeYAb8MuXAb25PcXeGy7coYif9bkHLjY6foelZ5XDn/aNhcE4
         xRKad2a9W/JY/0fGqBQaX0qN39UQMwRW/FLfVYgl/nprEYhw8nTuuOx+tkwMiKdeWIzl
         7Z6Lo0lb1R3wNDOjf6w5aMoT6mXhq0mVOxnVMMJFMLDTC40z4ac6jGeqbXUsvfUzQXZp
         TPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413799; x=1795018599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0C7+IJmij8E9fIklBb68lvmRctOkYSNRRgzk+FfCts0=;
        b=R1hJFdyubqvpA7XEjb5ePzIcL5Mwk8/5kcs+AcfAM5oiY6zABOiX81p1bwd+2cDjZS
         WEm0p+Gzssnt7aw/nae3uIsJ4tW2wz3SaYOwNpNRe6PxK6js1XRidhq8GlNrSsyzWPqv
         1Y2TA7YIQnY4RXwt/QohOhTCcgt2ydfmAO7bh16fVEB+SJeJBcPeOXWH1XDBdc4ldOoG
         OLJrX1hI64YxzguegZ5U5aDznnJoi8x/4Ci+JAjEeL5y0T0wc5CGrA0l2YlLXmt1lFyy
         jBVQ493LrETQEN8UGkcwaN56BZlDfeHX2rVRQQ8EXC9bTIfI9yyQh6snF/W3x28va1cT
         nuDg==
X-Forwarded-Encrypted: i=1; AL+hErG8ah8PJH188RtMg1TlmIx8mzbNjIEnTfZPvX5c2e7cL3+++bTrtxo9WENWiXH+H2nhkNhLYX8n/a7+XmaPIBSO@lists.infradead.org
X-Gm-Message-State: APuU4Z8M6fxXhDhilIRX17otDHZHiDq33GaUK+YqwiwpDUWoTjz8uzWd
	hOinOilsAOln4vNQ19y4MeE+voqT3ayvETutrWEk3qUjyQObw+Kkl8lnppiOrYvLBNo=
X-Gm-Gg: AYBFou08iY6dwXB8eq/YWxVDT983j32We+/IfSywNgD6jm7qZM8mPBKEDdT9zj0e5/0
	NYk4nn7tot+3/XkvNTfz3JOsfefVsKnALrBc48b14uVXyorc98xw80pEDnNK2MNwr1CiKqrW+ek
	TbxaSheM1p/42sfRAvyr1bYQin4iEexmaxtHCMAYZ5o5Yro78KJvoU5/vSAadtmjF/LPZJPzUtW
	kFzmFvX6+do1Kv0xSARXRQtLY63cx8BQLJykR7Z+s3BZHw35f31gchO5eEkDwEakQDgLCv3CF3b
	5p96Gm6OwuQ94gEqrkU9epbsJUH+DRf+pvKAGqZOYeoM1p82ED9vzZ0qJUQZDhzj6g85Tou+hKX
	b17lLX4BMk54JVS/BUl8WRZj/Z57BXfNf3r+qKBVsUkUwcweChQdBJddCsK+NCdnIMiMWP+jqnl
	ZyXAmCHmnhmaH6H/M5MR7/nADjtGZrkZ/9qMdm4FfAtP8EaNVb0ftPrjDxyLUmX15g1j9VnSX3R
	PXbsJM5DV2vbBsv4PuMu8K6BhRWwUJcSSjwlgkYKz/KoK8lo4cumPxNhRloHuEIFhhcQdf1rqpU
	1fK5bSCf+z+aMg+tX/CH7EmA4H3VNxThAPoLFTMwWB9zGohVDcCYvbxBJptthzdHrUUp7GcCYlb
	GSA5jC+WMlhLNKG3/8t6lJ+88jhsy5K0nSfbbHDGj5d7OMEtuqnFoqmznXmdkqOocQhQCOYM289
	A5DhTI4FzBvUzWdinlu17vtLw=
X-Received: by 2002:a05:600c:4f81:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4ba09377c5amr51388345e9.8.1794413798228;
        Wed, 11 Nov 2026 08:16:38 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:34 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 3/4] hwmon: Add Microchip LAN969x fan controller driver
Date: Wed, 11 Nov 2026 17:12:47 +0100
Message-ID: <20261111161619.232141-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_081640_872195_9C86A3F6 
X-CRM114-Status: GOOD (  25.95  )
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

The LAN969x fan controller has its own register block, separate
from the Sparx5-compatible temperature sensor.

Add a dedicated hwmon driver for tachometer, PWM, and thermal cooling.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Use a standalone fan driver instead of extending sparx5-temp.
- Combine tachometer, PWM and thermal cooling support in one patch.
- Reject a zero-rate fan clock during probe.
- Add a dedicated MAINTAINERS entry.

Changes in v2:
- Register fan and temperature monitoring as separate hwmon devices.
- Reject a present but malformed pulses-per-revolution property.
- Drop the private mutex; hwmon serializes sysfs accesses.
- Preserve firmware PWM polarity when no fan child is present.
- Convert the DT period directly to a divider and reject invalid values
  before changing fan registers.
- Use hwmon_lock() for cooling callbacks instead of a private mutex.

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/lan969x-fan.rst |  53 ++++
 MAINTAINERS                         |   8 +
 drivers/hwmon/Kconfig               |  10 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/lan969x-fan.c         | 444 ++++++++++++++++++++++++++++
 6 files changed, 517 insertions(+)
 create mode 100644 Documentation/hwmon/lan969x-fan.rst
 create mode 100644 drivers/hwmon/lan969x-fan.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index a8ea421128b50..aa84893729fac 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -122,6 +122,7 @@ Hardware Monitoring Kernel Drivers
    kbatt
    kfan
    lan966x
+   lan969x-fan
    lattepanda-sigma-ec
    lineage-pem
    lm25066
diff --git a/Documentation/hwmon/lan969x-fan.rst b/Documentation/hwmon/lan969x-fan.rst
new file mode 100644
index 0000000000000..c79d8eadbc158
--- /dev/null
+++ b/Documentation/hwmon/lan969x-fan.rst
@@ -0,0 +1,53 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Microchip LAN969x fan controller
+================================
+
+Supported chips:
+
+  * Microchip LAN969x
+
+    Prefix: 'lan969x_fan'
+
+    Addresses scanned: -
+
+    Datasheet: https://microchip-ung.github.io/lan969x-industrial_reginfo/
+
+Description
+-----------
+
+The LAN969x fan controller provides a tachometer input and a PWM output.
+
+The tachometer counts pulses over one-second intervals, independently of the
+PWM output. The fan child's pulses-per-revolution property specifies how many
+pulses represent one revolution; it defaults to two.
+
+The fan child's pwms property selects the initial PWM period and polarity.
+The output is dedicated to this fan and is not available to external PWM
+consumers. The pwm1 value describes the logical duty cycle independently of
+the output polarity. Frequency requests are rounded to the nearest hardware
+divider value; requests outside the divider range are rejected. pwm1_freq
+reports the resulting frequency.
+
+Sysfs entries
+-------------
+
+======================= ========================================================
+fan1_input              Fan speed in RPM.
+pwm1                    PWM duty cycle, from 0 to 255.
+pwm1_freq               PWM frequency in Hz.
+======================= ========================================================
+
+Thermal cooling
+---------------
+
+With device-tree thermal support enabled, the fan can also act as a thermal
+cooling device. The fan child's cooling-levels property maps cooling states
+to PWM values from 0 to 255, in ascending order. When cooling levels are
+provided, the driver initially selects the highest level.
+
+Manual pwm1 writes remain available and update the reported cooling state
+to the highest state whose PWM value does not exceed the requested value,
+or state zero if the value is below the first level. Subsequent thermal
+cooling requests can override manual PWM settings. Each cooling request
+programs the exact PWM value associated with the requested state.
diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d37ddb..bc8af689ce9b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18369,6 +18369,14 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/microchip/sparx5/lan969x/*
 
+MICROCHIP LAN969X FAN CONTROLLER DRIVER
+M:	Robert Marko <robert.marko@sartura.hr>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
+F:	Documentation/hwmon/lan969x-fan.rst
+F:	drivers/hwmon/lan969x-fan.c
+
 MICROCHIP LCDFB DRIVER
 M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 L:	linux-fbdev@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 3ae676a56d95c..634e174eb4d8b 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1060,6 +1060,16 @@ config SENSORS_LAN966X
 	  This driver can also be built as a module. If so, the module
 	  will be called lan966x-hwmon.
 
+config SENSORS_LAN969X_FAN
+	tristate "Microchip LAN969x fan controller"
+	depends on ARCH_LAN969X || COMPILE_TEST
+	help
+	  If you say yes here you get support for the fan controller on
+	  Microchip LAN969x SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called lan969x-fan.
+
 config SENSORS_LATTEPANDA_SIGMA_EC
 	tristate "LattePanda Sigma EC hardware monitoring"
 	depends on X86
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index be3eb0992a0d0..3d54ead07f0b4 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -122,6 +122,7 @@ obj-$(CONFIG_SENSORS_KB9002)	+= kb9002.o
 obj-$(CONFIG_SENSORS_KBATT)	+= kbatt.o
 obj-$(CONFIG_SENSORS_KFAN)	+= kfan.o
 obj-$(CONFIG_SENSORS_LAN966X)	+= lan966x-hwmon.o
+obj-$(CONFIG_SENSORS_LAN969X_FAN)	+= lan969x-fan.o
 obj-$(CONFIG_SENSORS_LATTEPANDA_SIGMA_EC) += lattepanda-sigma-ec.o
 obj-$(CONFIG_SENSORS_LENOVO_EC)	+= lenovo-ec-sensors.o
 obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
diff --git a/drivers/hwmon/lan969x-fan.c b/drivers/hwmon/lan969x-fan.c
new file mode 100644
index 0000000000000..fae0248658818
--- /dev/null
+++ b/drivers/hwmon/lan969x-fan.c
@@ -0,0 +1,444 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Microchip LAN969x fan controller driver */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/thermal.h>
+
+#include <dt-bindings/pwm/pwm.h>
+
+#define FAN_CFG			0
+#define  FAN_CFG_DUTY_CYCLE	GENMASK(23, 16)
+#define  FAN_CFG_INV_POL		BIT(3)
+#define  FAN_CFG_GATE_ENA	BIT(2)
+#define  FAN_CFG_STAT_MODE	BIT(0)
+#define FAN_PWM_FREQ		4
+#define  FAN_PWM_FREQ_CYCLES	GENMASK(27, 16)
+#define  FAN_PWM_FREQ_DIV	GENMASK(15, 0)
+#define FAN_CNT			8
+#define  FAN_CNT_DATA		GENMASK(15, 0)
+
+#define FAN_TACH_INTERVAL_HZ	100000
+#define FAN_PWM_FREQ_SCALE	256
+
+struct lan969x_fan {
+	void __iomem *base;
+	struct clk *clk;
+	struct device *hwmon_dev;
+	unsigned long clk_rate;
+	u32 pulses_per_revolution;
+	u32 pwm_period;
+	bool pwm_inverted;
+	u32 *cooling_levels;
+	unsigned long cooling_state;
+	unsigned long max_cooling_state;
+};
+
+static void lan969x_fan_enable(struct lan969x_fan *fan)
+{
+	u32 cycles, val;
+
+	cycles = DIV_ROUND_CLOSEST(fan->clk_rate, FAN_TACH_INTERVAL_HZ);
+	cycles = clamp_val(cycles, 1, FIELD_MAX(FAN_PWM_FREQ_CYCLES));
+
+	val = readl(fan->base + FAN_PWM_FREQ);
+	val &= ~FAN_PWM_FREQ_CYCLES;
+	val |= FIELD_PREP(FAN_PWM_FREQ_CYCLES, cycles);
+	writel(val, fan->base + FAN_PWM_FREQ);
+
+	/* Count all tachometer pulses over one-second intervals. */
+	val = readl(fan->base + FAN_CFG);
+	val &= ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA);
+	if (fan->pwm_period) {
+		val &= ~FAN_CFG_INV_POL;
+		if (fan->pwm_inverted)
+			val |= FAN_CFG_INV_POL;
+	}
+	writel(val, fan->base + FAN_CFG);
+}
+
+static void lan969x_fan_update_cooling_state(struct lan969x_fan *fan, u32 pwm)
+{
+	unsigned long state;
+
+	if (!fan->cooling_levels)
+		return;
+
+	for (state = 0; state < fan->max_cooling_state; state++)
+		if (pwm < fan->cooling_levels[state + 1])
+			break;
+
+	fan->cooling_state = state;
+}
+
+static int lan969x_fan_read(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long *val)
+{
+	struct lan969x_fan *fan = dev_get_drvdata(dev);
+	unsigned long rate;
+	u32 data;
+
+	switch (type) {
+	case hwmon_fan:
+		if (attr != hwmon_fan_input)
+			break;
+		data = readl_relaxed(fan->base + FAN_CNT);
+		data = FIELD_GET(FAN_CNT_DATA, data);
+		*val = data * 60 / fan->pulses_per_revolution;
+		return 0;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			data = readl_relaxed(fan->base + FAN_CFG);
+			*val = FIELD_GET(FAN_CFG_DUTY_CYCLE, data);
+			return 0;
+		case hwmon_pwm_freq:
+			data = readl_relaxed(fan->base + FAN_PWM_FREQ);
+			data = FIELD_GET(FAN_PWM_FREQ_DIV, data);
+			if (!data)
+				return -ENODATA;
+
+			rate = DIV_ROUND_CLOSEST(fan->clk_rate,
+						 FAN_PWM_FREQ_SCALE);
+			*val = DIV_ROUND_CLOSEST(rate, data);
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static void lan969x_fan_set_pwm(struct lan969x_fan *fan, u32 pwm)
+{
+	u32 data;
+
+	data = readl_relaxed(fan->base + FAN_CFG);
+	data &= ~FAN_CFG_DUTY_CYCLE;
+	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, pwm);
+	writel_relaxed(data, fan->base + FAN_CFG);
+}
+
+static int lan969x_fan_write_pwm(struct lan969x_fan *fan, long val)
+{
+	if (val < 0 || val > 255)
+		return -EINVAL;
+
+	lan969x_fan_set_pwm(fan, val);
+	lan969x_fan_update_cooling_state(fan, val);
+
+	return 0;
+}
+
+static void lan969x_fan_write_pwm_divider(struct lan969x_fan *fan, u32 divider)
+{
+	u32 data;
+
+	data = readl_relaxed(fan->base + FAN_PWM_FREQ);
+	data &= ~FAN_PWM_FREQ_DIV;
+	data |= FIELD_PREP(FAN_PWM_FREQ_DIV, divider);
+	writel_relaxed(data, fan->base + FAN_PWM_FREQ);
+}
+
+static int lan969x_fan_write_pwm_period(struct lan969x_fan *fan)
+{
+	unsigned long rate;
+	u64 divider;
+
+	rate = DIV_ROUND_CLOSEST(fan->clk_rate, FAN_PWM_FREQ_SCALE);
+	divider = DIV_ROUND_CLOSEST_ULL((u64)rate * fan->pwm_period,
+					NSEC_PER_SEC);
+	if (!divider || divider > FIELD_MAX(FAN_PWM_FREQ_DIV))
+		return -ERANGE;
+
+	lan969x_fan_write_pwm_divider(fan, divider);
+
+	return 0;
+}
+
+static int lan969x_fan_write_pwm_freq(struct lan969x_fan *fan, long val)
+{
+	unsigned long rate, divider;
+
+	if (val <= 0)
+		return -EINVAL;
+
+	rate = DIV_ROUND_CLOSEST(fan->clk_rate, FAN_PWM_FREQ_SCALE);
+	if (val < DIV_ROUND_CLOSEST(rate, FIELD_MAX(FAN_PWM_FREQ_DIV)) ||
+	    val > rate)
+		return -ERANGE;
+
+	divider = DIV_ROUND_CLOSEST(rate, val);
+	divider = min_t(unsigned long, divider, FIELD_MAX(FAN_PWM_FREQ_DIV));
+
+	lan969x_fan_write_pwm_divider(fan, divider);
+
+	return 0;
+}
+
+static int lan969x_fan_write(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, long val)
+{
+	struct lan969x_fan *fan = dev_get_drvdata(dev);
+
+	if (type != hwmon_pwm)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		return lan969x_fan_write_pwm(fan, val);
+	case hwmon_pwm_freq:
+		return lan969x_fan_write_pwm_freq(fan, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t lan969x_fan_is_visible(const void *_data,
+				      enum hwmon_sensor_types type,
+				      u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		return attr == hwmon_fan_input ? 0444 : 0;
+	case hwmon_pwm:
+		if (attr == hwmon_pwm_input || attr == hwmon_pwm_freq)
+			return 0644;
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static const struct hwmon_channel_info * const lan969x_fan_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_FREQ),
+	NULL
+};
+
+static const struct hwmon_ops lan969x_fan_hwmon_ops = {
+	.is_visible = lan969x_fan_is_visible,
+	.read = lan969x_fan_read,
+	.write = lan969x_fan_write,
+};
+
+static const struct hwmon_chip_info lan969x_fan_chip_info = {
+	.ops = &lan969x_fan_hwmon_ops,
+	.info = lan969x_fan_info,
+};
+
+static int lan969x_fan_cooling_get_max_state(struct thermal_cooling_device *cdev,
+					      unsigned long *state)
+{
+	struct lan969x_fan *fan = cdev->devdata;
+
+	*state = fan->max_cooling_state;
+
+	return 0;
+}
+
+static int lan969x_fan_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+					      unsigned long *state)
+{
+	struct lan969x_fan *fan = cdev->devdata;
+
+	hwmon_lock(fan->hwmon_dev);
+	*state = fan->cooling_state;
+	hwmon_unlock(fan->hwmon_dev);
+
+	return 0;
+}
+
+static int lan969x_fan_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+					      unsigned long state)
+{
+	struct lan969x_fan *fan = cdev->devdata;
+
+	if (state > fan->max_cooling_state)
+		return -EINVAL;
+
+	hwmon_lock(fan->hwmon_dev);
+	lan969x_fan_set_pwm(fan, fan->cooling_levels[state]);
+	fan->cooling_state = state;
+	hwmon_unlock(fan->hwmon_dev);
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops lan969x_fan_cooling_ops = {
+	.get_max_state = lan969x_fan_cooling_get_max_state,
+	.get_cur_state = lan969x_fan_cooling_get_cur_state,
+	.set_cur_state = lan969x_fan_cooling_set_cur_state,
+};
+
+static int lan969x_fan_get_cooling_data(struct device *dev,
+					struct device_node *fan_np,
+					struct lan969x_fan *fan)
+{
+	u32 *levels;
+	int count, i, ret;
+
+	if (!of_property_present(fan_np, "cooling-levels"))
+		return 0;
+
+	count = of_property_count_u32_elems(fan_np, "cooling-levels");
+	if (count <= 0)
+		return dev_err_probe(dev, count ? : -EINVAL,
+				     "invalid cooling-levels property\n");
+
+	levels = devm_kcalloc(dev, count, sizeof(*levels), GFP_KERNEL);
+	if (!levels)
+		return -ENOMEM;
+	fan->cooling_levels = levels;
+
+	ret = of_property_read_u32_array(fan_np, "cooling-levels",
+					 fan->cooling_levels, count);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read cooling-levels\n");
+
+	for (i = 0; i < count; i++) {
+		if (fan->cooling_levels[i] > 255)
+			return dev_err_probe(dev, -EINVAL,
+					     "cooling level %d exceeds 255\n", i);
+		if (i && fan->cooling_levels[i] < fan->cooling_levels[i - 1])
+			return dev_err_probe(dev, -EINVAL,
+					     "cooling levels must be ascending\n");
+	}
+
+	fan->max_cooling_state = count - 1;
+
+	return 0;
+}
+
+static int lan969x_fan_get_fan_data(struct device *dev,
+				    struct device_node *fan_np,
+				    struct lan969x_fan *fan)
+{
+	struct of_phandle_args args;
+	int ret;
+
+	ret = of_parse_phandle_with_args(fan_np, "pwms", "#pwm-cells", 0,
+					 &args);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse fan PWM\n");
+
+	if (args.np != dev->of_node || args.args_count != 2 || !args.args[0] ||
+	    args.args[1] & ~PWM_POLARITY_INVERTED) {
+		of_node_put(args.np);
+		return dev_err_probe(dev, -EINVAL, "invalid fan PWM specifier\n");
+	}
+
+	fan->pwm_period = args.args[0];
+	fan->pwm_inverted = args.args[1] & PWM_POLARITY_INVERTED;
+	of_node_put(args.np);
+
+	if (of_property_present(fan_np, "pulses-per-revolution")) {
+		ret = of_property_read_u32(fan_np, "pulses-per-revolution",
+					   &fan->pulses_per_revolution);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "invalid pulses-per-revolution\n");
+	}
+	if (!fan->pulses_per_revolution || fan->pulses_per_revolution > 4)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid pulses-per-revolution\n");
+
+	return lan969x_fan_get_cooling_data(dev, fan_np, fan);
+}
+
+static int lan969x_fan_probe(struct platform_device *pdev)
+{
+	struct thermal_cooling_device *cdev;
+	struct device *dev = &pdev->dev;
+	struct lan969x_fan *fan;
+	struct device_node *fan_np __free(device_node) = NULL;
+	u32 initial_pwm;
+	int ret;
+
+	fan = devm_kzalloc(dev, sizeof(*fan), GFP_KERNEL);
+	if (!fan)
+		return -ENOMEM;
+
+	fan->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(fan->base))
+		return PTR_ERR(fan->base);
+
+	fan->pulses_per_revolution = 2;
+	fan_np = of_get_available_child_by_name(dev->of_node, "fan");
+	if (fan_np) {
+		ret = lan969x_fan_get_fan_data(dev, fan_np, fan);
+		if (ret)
+			return ret;
+	}
+
+	fan->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(fan->clk))
+		return PTR_ERR(fan->clk);
+	fan->clk_rate = clk_get_rate(fan->clk);
+	if (!fan->clk_rate)
+		return dev_err_probe(dev, -EINVAL, "invalid fan clock rate\n");
+
+	if (fan->pwm_period) {
+		ret = lan969x_fan_write_pwm_period(fan);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "invalid fan PWM period\n");
+	}
+	lan969x_fan_enable(fan);
+
+	if (fan->cooling_levels) {
+		initial_pwm = fan->cooling_levels[fan->max_cooling_state];
+		ret = lan969x_fan_write_pwm(fan, initial_pwm);
+		if (ret)
+			return ret;
+	}
+
+	fan->hwmon_dev = devm_hwmon_device_register_with_info(dev, "lan969x_fan",
+							 fan,
+							 &lan969x_fan_chip_info,
+							 NULL);
+	if (IS_ERR(fan->hwmon_dev))
+		return PTR_ERR(fan->hwmon_dev);
+
+	if (IS_ENABLED(CONFIG_THERMAL_OF) && fan->cooling_levels) {
+		cdev = devm_thermal_of_child_cooling_device_register(dev, fan_np,
+							     "lan969x-fan", fan,
+							     &lan969x_fan_cooling_ops);
+		if (IS_ERR(cdev))
+			return dev_err_probe(dev, PTR_ERR(cdev),
+					     "failed to register cooling device\n");
+	}
+
+	return 0;
+}
+
+static const struct of_device_id lan969x_fan_match[] = {
+	{ .compatible = "microchip,lan9691-fan" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, lan969x_fan_match);
+
+static struct platform_driver lan969x_fan_driver = {
+	.probe = lan969x_fan_probe,
+	.driver = {
+		.name = "lan969x-fan",
+		.of_match_table = lan969x_fan_match,
+	},
+};
+
+module_platform_driver(lan969x_fan_driver);
+
+MODULE_DESCRIPTION("Microchip LAN969x fan controller driver");
+MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
+MODULE_LICENSE("GPL");
-- 
2.56.0


