Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B6606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 06:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0EtEZ+n+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ncyNDMpX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EsIPTfnBcTrltn2jh6R8X7D3E7FmUiavoDyvK703b+g=; b=0EtEZ+n+y9pJlf
	5wkUhfwTwZWgLOGXWJsLQ6uD0D9biSh/gHH/5BOqXWW2FM6SsvnsR+fSMJOgoQaHR7uxv+HHOjj0u
	0TBImp71SQM5eF+nJkYJmLARlPKK3X27C/gwu8+odtAjVOWuAkLaEE8g57PLo8wlGxc1VldFwzMDe
	yz8Efl53pNJ6U2qJLuilfv5y46TVTm9eMK6FIU1v/2uJFEXMnqfSkXm2154gPBRERM3as5PX/g+2S
	zsQDjBQ9sgxJoIXi9GgFJ6poOuJ7ek+ZeZvZ9ZpvrdYmhVm1haAJ2ywwXp2HijoHKZ7hTOfTFEStH
	9FsPvdwZk8tAKTKW33Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCKf-00000004dlc-1GdT;
	Tue, 17 Nov 2026 06:06:17 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCKb-00000004dkB-4396
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 06:06:15 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso4003188b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 22:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895573; x=1795500373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsIPTfnBcTrltn2jh6R8X7D3E7FmUiavoDyvK703b+g=;
        b=ncyNDMpXL1WhnhYAce1w+QQqGfu4Y3aZtRNawnBjPGO2DWfL/VjVNY12BQPGjko0Zw
         YY31T73X5awZ7KOL8mFW6mZ6NGcpaZQLODuAAjKADRAyA7IEbFtCv0Hp75y5+YVVZHAl
         qqiyd5WGQ/nsuS+RAvle3Y4If4zPg/biVFqlshI8dcuyRScTLbTiu0e3Yl5+pQzc23Vi
         uOREDtsYti3TEs/wxvgmPdbeokdp1jXGugOWQv4u2EMVRbvzHg1IRmmzY53G4h3HHpFu
         /1hRcn97A/tfllq/gdDNef2h+BX0TWHu9RmezBcEp8jy+peOSMU/qk0rhORhba5skn4J
         ELpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895573; x=1795500373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EsIPTfnBcTrltn2jh6R8X7D3E7FmUiavoDyvK703b+g=;
        b=DI6nreQAzXNNSHSDd/USxm0njMxNpeIeBzWen+iKvjo0jZYjZpjmBdVejhRncpd1Rr
         /XrTk9np+MzROUwaat7RgDjVhsN7ffgbEWv2G2hIMEuAU/Qg99oahPyWKKVgVlD47nxK
         oaA5C3TDTAMN1zjwLU1TTKUPyArLvgtwOtXLn5ADQQkBw8FHqjTeT8eoN2jpaZUyikaT
         dt9hLKxWXEfoDaGiC+L6KdYFvcAdrlYj4x8nh0vKEFV/6sxnhLMb5bGDxVADJt+tyQsH
         LEwVeA1fhvbMjbye4OnsTXiIzsN9H9TC/r9FFqNfX7csMHJi0SU7bApt4Sf4gNIUdQ3U
         XE6g==
X-Forwarded-Encrypted: i=1; AL+hErEJTE+b5K/kbJgy6B/DhiOl/NuInLak9m3cljEb3sYlvgDoXoPRfD/3xgB5QT3yZk/zAmMobx2tX6fkZJ/LbT4l@lists.infradead.org
X-Gm-Message-State: APuU4Z/+PJ5Bs1gh+zvBHlB3DVx3MeFeg7xw3t7YH/qp4U1V+1zfglHk
	D9Ho1ujjPuAPY45X7QtJ5XQ0aQHJIoQqvJAD18kL8XxMBELpw/KVnY/z
X-Gm-Gg: AYBFou3TAHUZf1KUn7K6DhFrwc0tjMpfUTWF+SbGbHENmwn1ePKIYwHEYzhMqNbyUfA
	pVTES9fTw+zrJv+b/IXzT5mwiqmuNTl9x/4jPQJfRdI9kxyyP0hWkcKLeV8PVjBjxtxwS2UtUeb
	wNEQA4/Od6GfiEXWIPSY1ttrYm3SbwTObZ0gL3UV+0HPTpBZL9FJqgkXDZ060Vg20AEWntVc8ra
	eVdcapqSZ3eMv9vV/pH4cyNUwki+kSQdINLLfwYQIERgqRWKToYO3d3jHCq+YpZqYZZvsa7FprE
	o1y/6TtIBwu31J5o65kmBgnW6wqn/7I++HrubvRTlfM+9PIXWofJRFrx2ZZCJhOJURuLLHMvfUU
	XlQjO9o6M7DEEyek4uWs+YwNtaOw7IZkSkWb0QhHxYHnw5LfYc/LTd5VWAdbhAethHEh08nxeS5
	Mc1860n9OZTfXBcSaTzsFDH2C2SIV4SNBYbMmAwxwmLAXcoVyzjeZQYixiISqWeyDYQ0bbIRejp
	kq1HrU0IA4CAL+mK5lTBCq2ofiuMlEeXGbbtpEz30DvoFzSKxQpxLUiFTW1GL9DO9WLaKv84FEA
	E64P2YsKkxytTG9ltobpBFyJag7FJmYPKIXY0AdYPz+8yCUhR0rsZx3vzzlxS4eg5ywmykXXg1h
	+3uAOs6NJn8URzvPn3ObtaHq16jZ0K3m3
X-Received: by 2002:a05:6a00:bc04:b0:893:8a6:3801 with SMTP id d2e1a72fcca58-8beb6a763bcmr13607230b3a.24.1794895572807;
        Mon, 16 Nov 2026 22:06:12 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:12 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 3/4] thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal sensor driver
Date: Tue, 17 Nov 2026 14:05:00 +0800
Message-Id: <20261117060501.2611071-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117060501.2611071-1-zychennvt@gmail.com>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_220614_019632_36C3E6DC 
X-CRM114-Status: GOOD (  22.54  )
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

Add a driver for the on-chip temperature sensor of the Nuvoton MA35D1
SoC. The sensor is controlled through a register in the system
management (SYS) block and is instantiated as an auxiliary device by
the MA35D1 reset driver.

The sensor converts continuously while powered on. The 12-bit result
is converted to millidegrees Celsius using a linear fit of the
temperature table from the sensor datasheet.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 drivers/thermal/Kconfig          |  11 +++
 drivers/thermal/Makefile         |   1 +
 drivers/thermal/ma35d1_thermal.c | 149 +++++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+)
 create mode 100644 drivers/thermal/ma35d1_thermal.c

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 810eeccedfba..571b2c026311 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -530,4 +530,15 @@ config LOONGSON2_THERMAL
 	  is higher than the high temperature threshold or lower than the low
 	  temperature threshold, the interrupt will occur.
 
+config MA35D1_THERMAL
+	tristate "Nuvoton MA35D1 thermal sensor"
+	depends on RESET_NUVOTON_MA35D1
+	depends on THERMAL_OF
+	select MFD_SYSCON
+	help
+	  Support for the on-chip temperature sensor found on Nuvoton
+	  MA35D1 SoCs. The driver provides temperature readings through the
+	  Linux thermal framework. The sensor registers are accessed through
+	  the system register block.
+
 endif
diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
index 3b249195c088..bf2796e3dd3f 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -70,3 +70,4 @@ obj-$(CONFIG_SPRD_THERMAL)	+= sprd_thermal.o
 obj-$(CONFIG_KHADAS_MCU_FAN_THERMAL)	+= khadas_mcu_fan.o
 obj-$(CONFIG_LOONGSON2_THERMAL)	+= loongson2_thermal.o
 obj-$(CONFIG_THERMAL_CORE_TESTING)	+= testing/
+obj-$(CONFIG_MA35D1_THERMAL)	+= ma35d1_thermal.o
diff --git a/drivers/thermal/ma35d1_thermal.c b/drivers/thermal/ma35d1_thermal.c
new file mode 100644
index 000000000000..453f57d236ec
--- /dev/null
+++ b/drivers/thermal/ma35d1_thermal.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Author: Zi-Yu Chen <zychennvt@gmail.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/thermal.h>
+
+#include "thermal_hwmon.h"
+
+#define MA35_SYS_TSENSRFCR		0x104
+#define MA35_TSEN_DATA_VALID	BIT(31)
+#define MA35_TSEN_POWER_DOWN	BIT(28)
+#define MA35_TSEN_DATA			GENMASK(27, 16)
+
+/*
+ * Conversion from the 12-bit sensor data to millidegrees Celsius:
+ *   temp (mC) = data * MA35_TS_CAL_A / 4096 - MA35_TS_CAL_B
+ * A and B come from a linear fit of the S40LLV33_TEMPSENSOR temperature table.
+ */
+#define MA35_TS_CAL_A			274350
+#define MA35_TS_CAL_B			93330
+
+struct ma35d1_thermal {
+	struct device *dev;
+	struct regmap *regmap;
+};
+
+static int ma35d1_thermal_get_temp(struct thermal_zone_device *tzd, int *temp)
+{
+	struct ma35d1_thermal *sensor = thermal_zone_device_priv(tzd);
+	unsigned int reg;
+	int data, ret;
+
+	ret = regmap_read(sensor->regmap, MA35_SYS_TSENSRFCR, &reg);
+	if (ret)
+		return ret;
+
+	if (!(reg & MA35_TSEN_DATA_VALID))
+		return -EAGAIN;
+
+	data = FIELD_GET(MA35_TSEN_DATA, reg);
+	*temp = data * MA35_TS_CAL_A / 4096 - MA35_TS_CAL_B;
+
+	return 0;
+}
+
+static int ma35d1_thermal_power_on(struct ma35d1_thermal *sensor)
+{
+	return regmap_clear_bits(sensor->regmap, MA35_SYS_TSENSRFCR,
+				 MA35_TSEN_POWER_DOWN);
+}
+
+static int ma35d1_thermal_power_off(struct ma35d1_thermal *sensor)
+{
+	return regmap_set_bits(sensor->regmap, MA35_SYS_TSENSRFCR,
+			       MA35_TSEN_POWER_DOWN);
+}
+
+static int ma35d1_thermal_change_mode(struct thermal_zone_device *tzd,
+				      enum thermal_device_mode mode)
+{
+	struct ma35d1_thermal *sensor = thermal_zone_device_priv(tzd);
+
+	if (mode == THERMAL_DEVICE_ENABLED)
+		return ma35d1_thermal_power_on(sensor);
+
+	return ma35d1_thermal_power_off(sensor);
+}
+
+static void ma35d1_thermal_power_off_action(void *data)
+{
+	struct ma35d1_thermal *sensor = data;
+
+	if (ma35d1_thermal_power_off(sensor))
+		dev_warn(sensor->dev, "failed to power off sensor\n");
+}
+
+static const struct thermal_zone_device_ops ma35d1_tz_ops = {
+	.get_temp = ma35d1_thermal_get_temp,
+	.change_mode = ma35d1_thermal_change_mode,
+};
+
+static int ma35d1_thermal_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct thermal_zone_device *tzd;
+	struct ma35d1_thermal *sensor;
+	int ret;
+
+	sensor = devm_kzalloc_obj(dev, *sensor);
+	if (!sensor)
+		return -ENOMEM;
+
+	sensor->dev = dev;
+
+	sensor->regmap = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(sensor->regmap))
+		return dev_err_probe(dev, PTR_ERR(sensor->regmap),
+				     "failed to get SYS regmap\n");
+
+	/*
+	 * Registered before the thermal zone so that the sensor is powered
+	 * off only after the zone has been unregistered.
+	 */
+	ret = devm_add_action_or_reset(dev, ma35d1_thermal_power_off_action,
+				       sensor);
+	if (ret)
+		return ret;
+
+	tzd = devm_thermal_of_zone_register(dev, 0, sensor, &ma35d1_tz_ops);
+	if (IS_ERR(tzd))
+		return dev_err_probe(dev, PTR_ERR(tzd),
+				     "failed to register thermal zone\n");
+
+	/* thermal_of disables hwmon by default */
+	ret = devm_thermal_add_hwmon_sysfs(dev, tzd);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add hwmon sysfs\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id ma35d1_thermal_id_table[] = {
+	{ .name = "reset_ma35d1.thermal" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, ma35d1_thermal_id_table);
+
+static struct auxiliary_driver ma35d1_thermal_driver = {
+	.probe		= ma35d1_thermal_probe,
+	.id_table	= ma35d1_thermal_id_table,
+};
+module_auxiliary_driver(ma35d1_thermal_driver);
+
+MODULE_AUTHOR("Zi-Yu Chen <zychennvt@gmail.com>");
+MODULE_DESCRIPTION("Nuvoton MA35D1 Temperature Sensor Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


