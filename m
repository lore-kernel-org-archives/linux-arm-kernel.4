Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD8D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lTneZUSi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DCWPQ060
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G7bs/s+TqYFxvvyPa5R6j9Pvb+Edlkz05qUHpzm0mzY=; b=lTneZUSi4NtxGm
	4y0pAfGIqfkpnh4TFAZmEMi1uELZfJsB2cRxXkQU8u7wbV78RxYRj0wWgDFmIk7Fn3UHsgOe4maKQ
	qziDAPCIHe5Uw/6p9QfDDUacJwFbT1CQ8wy1md3rqvZAI0C7iicjtMHvflot35iNoqdyd/ygGiRSu
	AvZQwdkzYlAr8yHHZolcDqbzjEhkKJsy4SQrZ0d3a4YVvv66xtiF2+isei7IRzd1lzqQkn3N55Z3k
	qcu54AmUleyTCIea6Sg0jnSt1iaW7d9unm95qix03nLqxKsV6wZYqxWY/iXgVqcM3SxegXNekBl+k
	7N0+7i1/PqNdBlnY0qvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8EO-0000000DHvb-0fVm;
	Thu, 19 Nov 2026 19:55:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8EK-0000000DHtM-3PBW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:55:39 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48e47347279so53131f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 11:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118135; x=1795722935; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7bs/s+TqYFxvvyPa5R6j9Pvb+Edlkz05qUHpzm0mzY=;
        b=DCWPQ060XINZpxPshe2/SmJxS87cmOhjMZ12HzVAs42e5iuwtnEkaFKB+wTu8kyqLt
         QXeCjJ5IPZgCaQnZNy340LQz9nZuHRKGaxoFSx3OBWed5q2uUthvxiEchQk0qT507E4Y
         D9I86G+6u/QqvC907gXVgcISaB0BZSoF59sG+zasgCpU37n+DjFOuwXL8dNd9r1NJFBO
         rhNhh22nk+LCbQEoZuaEy81jpBJ2HUPd7RSsJbt7W/pRrR4nBGDdbvev7x2729nM2qSV
         YCQQG8Vh6gsr+7zDzDVW5nB/zAwotgJlfbRucxEKgCOoQp+m1I6VT0WujGD5vJe83XCX
         Q3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118135; x=1795722935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7bs/s+TqYFxvvyPa5R6j9Pvb+Edlkz05qUHpzm0mzY=;
        b=PaUsChERwC4b0C1UjWFu3zbEc3X0u6Mfkd2mncg33Yc5z9cZTLzeWX9dADEV7p/erl
         ggMqf4WgpsDZgISBYmYgwgr6ZrNQW9AayhQNCx4VgCffQ+H+cvdiducMgzat3ds4kiFQ
         DCYbJAB4KiSvfx10IRovc8oy3ZCohPh/zfwGTyaMFYhPSEL2EAFlIknP+gv//ZM24jLT
         fnUJ7ngTYbviUtUQhT0uOfc7K3+Kg+TBoEDRVAQsgrE736f3L9qmmEoGAuXkGtTijxCQ
         0USYgRLerBTdA5X8Vb3KWiwWfkMPtDucbyec0ieHCcESegesexbHfCpZCmlmF8TZz1N9
         M+9A==
X-Forwarded-Encrypted: i=1; AL+hErHBqLbRCcet4t4ootBBtQzT8d3qs4m2RCPqL5MmX5bo0n8jvYs9so82pON+SP1TZvnEUuTxCse/Tg1Ce2VEk1Uc@lists.infradead.org
X-Gm-Message-State: APuU4Z9bRHQAPbbQ+NmpOzE8dLpBUDr+hjXgbe6it3d7Hqi39zYH8ja6
	EnFvX+IvpEsqIUY3qLwO8TLYH+vQWfm0lKpFFL/LW601Pc/vT0OO8lIy
X-Gm-Gg: AZFdTZcRT7l8o73RFHmthX3GKegJBIhzlH3RcQGBqV14cSFNDlMD2kzShX8xN4E7RUb
	K8no7Dw1uqChYR/iT+yOseNLlxuNrjlaUCr9rsBtJVCI9FLUnG/tspi6uFvbJlJsUlRiM/AlQxc
	Oh/4j3ZjdDYQ0uh9zFidf4wqGDTuaM/ModBAEk0jA8DNEed4rzzTTRNYmR4jYCvK2jqjd9leN2G
	Q5+G3CLlA2BkFUaXqTQGKj3Ypb3ciPDZ/jfSew0ueSAMhHX0NBxwO8uDTZ2LbXM9sGmVI+6Qh8S
	/aUN4wYr3Mif++bkAlMCywEpfSLvZ+ypf2LY5mS9VqsqMMvwC2oL4d+5ypIK9TWx/mWFCRAKMrX
	FI05rRgU66rk2duS5KgZ55lV1Gr/AxxL6UFzyQIh/sUr5gKJvf1nVstrzkmlTNYFIx2mFhQ2i2b
	+lV8KaBEZLpKD9AEp22TMKe9W2PZL4+3Pg4Z0HEFSqaGR2iXuJBZZEz+xfXUokvbvw2hVrtg8m+
	fKpzK9nAz91lPbSZLFMVA1JF1sTzkwhp8M8AhpIcNJp5DbAybAFt6KPHg7ESLNDpTL3i4Y6Li7r
	WtgUmE5eEKRKRznrLUE34xO+CecMjYghbkCi6vP6nOnwfUa4c8TJWY9r60POKhl2Y4l9KRHVtGD
	mOdSU9VUSXpUAQFU=
X-Received: by 2002:a05:6000:4310:b0:4a7:b365:19df with SMTP id ffacd0b85a97d-4abb5eabd28mr816894f8f.35.1795118134710;
        Thu, 19 Nov 2026 11:55:34 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1442434f8f.33.2026.11.19.11.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:55:34 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:55:30 +0100
Subject: [PATCH v4 1/2] hwmon: add Raspberry Pi PMIC driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-hwmon-da9091-v4-1-0d6e345c3666@gmail.com>
References: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13852;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=nfrJxbeaJNu8bXTkxb2+ETQWMhVkZREkCro9tACw7y8=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1Q1snHwXP4jn/Pm0eptAW2VaSX57flO7/J9k
 nroLAe7t+CJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9UNQAKCRB4zXhFDAXI
 Z36ED/91vCesNPc5+QU0rFRKM//DSqGKgPWXXK8mWxruiy1c4WrnnC0P80XiWhLxMdl/dRXUOwP
 goWkYS1FxTT5/6DTSKEqQM+Xxpo64OgWK2MGjq/Lopt71CNI3OPgrz8NEWrf3vdRcwwGwpehxs9
 67Q4jiG78WT3ZJyKI8Aup3hnqySQjFzEDQLnxdEBfZjeh41QmYTjRLtNaLHqrapVsj7l0iUNi+E
 uDSXGpPnmgToM75wF5nrm94FGxvgOAxcQxJLj5AZ27u2VqDl2rGbZfpGwhTpOOe8nnair4rfdKa
 W0BAyTOP+4Wb2bXNy02kjM1QU5j4hhMbptW4B+DULqIXmYgYpuyWXKF6YjOk3HrkUOr4lcaYVj8
 1bLchzryAgbSZbH5izfAzZjs4PrVT9Yo3/3nD1yeD7St0wOn4iM1IoKsyFiHBGt6osSvH4y0M60
 GAlk6/vIV3JP34Yk8Dd58Yvw9l5AFVkOSiLLBK7O2dGtsJSzFEnuc6KUBN/70UJ3z3kw6+DXh4d
 G8D5G738+KwXGnQTlNmsHBDKHYpgRc+ja7dbxwTAex18auJVePWQRhwCeBuBkA0QAvNiIPFxo4g
 pOQ4uKbvE9+EHro+ikqRVsW2VxisoU38LofdqPOzSZi0DQ1qPwgCEp2EEnXV4XM2kLp2yHo8dbW
 5y2D9Mr722zDO5A==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_115537_072407_27D39090 
X-CRM114-Status: GOOD (  25.47  )
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

Add a hwmon driver for the PMIC found on the Raspberry Pi 5.
The PMIC exposes voltages, currents and temperatures exclusively
through the VideoCore firmware mailbox interface (property
0x0003009f).

Requires a sufficiently recent Raspberry Pi firmware that
implements the structured PMIC ADC property.

The driver:
- is instantiated at runtime by the raspberrypi-firmware driver
  (same pattern as the Pi 5 RTC driver)
- reads all channels in a single batch mailbox call
- uses a short refresh-on-read cache
- exposes the sensors via the standard hwmon sysfs interface

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 Documentation/hwmon/index.rst                  |   1 +
 Documentation/hwmon/raspberrypi-pmic-hwmon.rst |  49 ++++
 drivers/hwmon/Kconfig                          |  11 +
 drivers/hwmon/Makefile                         |   1 +
 drivers/hwmon/raspberrypi-pmic-hwmon.c         | 296 +++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h     |   1 +
 6 files changed, 359 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index c9018fb4b009..41b7da5a19ea 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -245,6 +245,7 @@ Hardware Monitoring Kernel Drivers
    q54sj108a2
    qnap-mcu-hwmon
    raspberrypi-hwmon
+   raspberrypi-pmic-hwmon
    sbrmi
    sbtsi_temp
    sch5627
diff --git a/Documentation/hwmon/raspberrypi-pmic-hwmon.rst b/Documentation/hwmon/raspberrypi-pmic-hwmon.rst
new file mode 100644
index 000000000000..000d85359515
--- /dev/null
+++ b/Documentation/hwmon/raspberrypi-pmic-hwmon.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver raspberrypi-pmic-hwmon
+=======================================
+
+Supported boards:
+
+  * Raspberry Pi 5 Model B
+  * Raspberry Pi Compute Module 5
+  * Raspberry Pi 500
+  * Raspberry Pi 500+
+
+Author: Sander Speetjens <sander.speetjens@gmail.com>
+
+Description
+-----------
+
+The Raspberry Pi 5 uses a PMIC that monitors supply voltages,
+currents and internal temperatures. These sensors are accessed
+via the VideoCore firmware mailbox (property 0x0003009f).
+
+This driver registers with the firmware device at runtime and exposes
+the ADC readings through the standard hwmon sysfs interface. All
+channels are read in a single mailbox transaction and cached for a
+short interval so concurrent or repeated sysfs reads do not generate
+excessive firmware traffic.
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+curr[1-12]_input	Current in milliamps
+curr[1-12]_label	Current rail name
+in[0-13]_input		Voltage in millivolts
+in[0-13]_label		Voltage rail name
+temp[1-9]_input		Temperature in millidegrees Celsius
+temp[1-9]_label		Temperature sensor name
+======================= ======================================================
+
+Current and voltage labels follow the firmware naming (e.g. 3V3_SYS,
+VDD_CORE, EXT5V, BATT). Temperature labels are TEMP1–TEMP8 and TEMP_BG
+(bandgap reference).
+
+Notes
+-----
+
+The driver depends on Raspberry Pi firmware that implements the
+structured PMIC ADC property (0x0003009f). Older firmware will cause
+probe to fail when the property is unavailable.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index bd408fc6f876..58b7dff5e636 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2076,6 +2076,17 @@ config SENSORS_RASPBERRYPI_HWMON
 	  This driver can also be built as a module. If so, the module
 	  will be called raspberrypi-hwmon.
 
+config SENSORS_RASPBERRYPI_PMIC
+	tristate "Raspberry Pi PMIC monitor"
+	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
+	help
+	  If you say yes here you get support for the PMIC
+	  voltage, current and temperature sensors on the Raspberry Pi 5,
+	  accessed via the firmware mailbox interface.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called raspberrypi-pmic-hwmon.
+
 config SENSORS_SL28CPLD
 	tristate "Kontron sl28cpld hardware monitoring driver"
 	depends on MFD_SL28CPLD || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index dfb6fa4d4492..5dbc6b864f76 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -214,6 +214,7 @@ obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
+obj-$(CONFIG_SENSORS_RASPBERRYPI_PMIC) += raspberrypi-pmic-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
diff --git a/drivers/hwmon/raspberrypi-pmic-hwmon.c b/drivers/hwmon/raspberrypi-pmic-hwmon.c
new file mode 100644
index 000000000000..ce1f6bf0d70e
--- /dev/null
+++ b/drivers/hwmon/raspberrypi-pmic-hwmon.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Raspberry Pi 5 PMIC hwmon driver
+ *
+ * Reads voltages, currents and temperatures through the VideoCore
+ * firmware mailbox property
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
+#define RPI_PMIC_NUM_CHANNELS	35	/* 0..34 */
+#define RPI_PMIC_CACHE_MS	500
+
+struct rpi_pmic_data {
+	struct rpi_firmware *fw;
+	u32 values[RPI_PMIC_NUM_CHANNELS];
+	u64 last_update;
+};
+
+struct rpi_pmic_adc_msg {
+	__le32 index;
+	__le32 length;
+	__le32 values[RPI_PMIC_NUM_CHANNELS];
+} __packed;
+
+static const char * const rpi_pmic_labels[RPI_PMIC_NUM_CHANNELS] = {
+	/* Currents 0-7 */
+	[0]  = "3V7_WL_SW",
+	[1]  = "3V3_SYS",
+	[2]  = "1V8_SYS",
+	[3]  = "DDR_VDD2",
+	[4]  = "DDR_VDDQ",
+	[5]  = "1V1_SYS",
+	[6]  = "0V8_SW",
+	[7]  = "VDD_CORE",
+	/* Voltages 8-15 */
+	[8]  = "3V7_WL_SW",
+	[9]  = "3V3_SYS",
+	[10] = "1V8_SYS",
+	[11] = "DDR_VDD2",
+	[12] = "DDR_VDDQ",
+	[13] = "1V1_SYS",
+	[14] = "0V8_SW",
+	[15] = "VDD_CORE",
+	/* More currents / voltages */
+	[16] = "0V8_AON",
+	[17] = "3V3_DAC",
+	[18] = "3V3_ADC",
+	[19] = "0V8_AON",
+	[20] = "3V3_DAC",
+	[21] = "3V3_ADC",
+	[22] = "HDMI",
+	[23] = "HDMI",
+	[24] = "EXT5V",
+	[25] = "BATT",
+	/* Temperatures 26-34 (µ°C) */
+	[26] = "TEMP1",
+	[27] = "TEMP2",
+	[28] = "TEMP3",
+	[29] = "TEMP4",
+	[30] = "TEMP5",
+	[31] = "TEMP6",
+	[32] = "TEMP7",
+	[33] = "TEMP8",
+	[34] = "TEMP_BG",
+};
+
+/* Firmware ADC indices for each hwmon channel */
+static const u8 rpi_pmic_curr_idx[] = {
+	0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 22
+};
+
+static const u8 rpi_pmic_in_idx[] = {
+	8, 9, 10, 11, 12, 13, 14, 15, 19, 20, 21, 23, 24, 25
+};
+
+static const u8 rpi_pmic_temp_idx[] = {
+	26, 27, 28, 29, 30, 31, 32, 33, 34
+};
+
+static int rpi_pmic_update(struct rpi_pmic_data *data)
+{
+	struct rpi_pmic_adc_msg msg = {
+		.index  = cpu_to_le32(0),
+		.length = cpu_to_le32(RPI_PMIC_NUM_CHANNELS),
+	};
+	int ret;
+	unsigned int i;
+
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_PMIC_ADC,
+				    &msg, sizeof(msg));
+	if (ret)
+		return ret;
+
+	/* Sanity-check the response */
+	if (le32_to_cpu(msg.length) != RPI_PMIC_NUM_CHANNELS)
+		return -EIO;
+
+	for (i = 0; i < RPI_PMIC_NUM_CHANNELS; i++)
+		data->values[i] = le32_to_cpu(msg.values[i]);
+
+	data->last_update = get_jiffies_64();
+	return 0;
+}
+
+static int rpi_pmic_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	struct rpi_pmic_data *data = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (time_after64(get_jiffies_64(),
+			 data->last_update + msecs_to_jiffies(RPI_PMIC_CACHE_MS))) {
+		ret = rpi_pmic_update(data);
+		if (ret)
+			goto out;
+	}
+
+	switch (type) {
+	case hwmon_in:
+		*val = data->values[rpi_pmic_in_idx[channel]] / 1000;	/* µV → mV */
+		break;
+	case hwmon_curr:
+		*val = data->values[rpi_pmic_curr_idx[channel]] / 1000;	/* µA → mA */
+		break;
+	case hwmon_temp:
+		*val = data->values[rpi_pmic_temp_idx[channel]] / 1000;	/* µ°C → m°C */
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+out:
+	return ret;
+}
+
+static int rpi_pmic_read_string(struct device *dev,
+				enum hwmon_sensor_types type, u32 attr,
+				int channel, const char **str)
+{
+	size_t idx;
+
+	switch (type) {
+	case hwmon_in:
+		idx = rpi_pmic_in_idx[channel];
+		break;
+	case hwmon_curr:
+		idx = rpi_pmic_curr_idx[channel];
+		break;
+	case hwmon_temp:
+		idx = rpi_pmic_temp_idx[channel];
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	*str = rpi_pmic_labels[idx];
+	return 0;
+}
+
+static umode_t rpi_pmic_is_visible(const void *data,
+				   enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_in:
+		if (channel < ARRAY_SIZE(rpi_pmic_in_idx) &&
+		    (attr == hwmon_in_input || attr == hwmon_in_label))
+			return 0444;
+		break;
+	case hwmon_curr:
+		if (channel < ARRAY_SIZE(rpi_pmic_curr_idx) &&
+		    (attr == hwmon_curr_input || attr == hwmon_curr_label))
+			return 0444;
+		break;
+	case hwmon_temp:
+		if (channel < ARRAY_SIZE(rpi_pmic_temp_idx) &&
+		    (attr == hwmon_temp_input || attr == hwmon_temp_label))
+			return 0444;
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_ops rpi_pmic_ops = {
+	.is_visible	= rpi_pmic_is_visible,
+	.read		= rpi_pmic_read,
+	.read_string	= rpi_pmic_read_string,
+};
+
+static const struct hwmon_channel_info * const rpi_pmic_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/*  8 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/*  9 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 10 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 11 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 12 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 13 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 14 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 15 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 19 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 20 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 21 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 23 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 24 */
+			   HWMON_I_INPUT | HWMON_I_LABEL	/* 25 */
+	),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  0 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  1 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  2 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  3 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  4 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  5 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  6 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  7 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/* 16 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/* 17 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/* 18 */
+			   HWMON_C_INPUT | HWMON_C_LABEL	/* 22 */
+	),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 26 TEMP1 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 27 TEMP2 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 28 TEMP3 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 29 TEMP4 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 30 TEMP5 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 31 TEMP6 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 32 TEMP7 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 33 TEMP8 */
+			   HWMON_T_INPUT | HWMON_T_LABEL	/* 34 TEMP_BG */
+	),
+	NULL
+};
+
+static const struct hwmon_chip_info rpi_pmic_chip_info = {
+	.ops	= &rpi_pmic_ops,
+	.info	= rpi_pmic_info,
+};
+
+static int rpi_pmic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rpi_pmic_data *data;
+	struct rpi_firmware *fw;
+	struct device *hwmon_dev;
+	int ret;
+
+	fw = devm_rpi_firmware_get(dev, dev->parent->of_node);
+	if (!fw)
+		return -EPROBE_DEFER;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->fw = fw;
+
+	ret = rpi_pmic_update(data);
+	if (ret)
+		return -ENODEV;
+
+	hwmon_dev =
+		devm_hwmon_device_register_with_info(dev,
+						     "rpi_pmic", data, &rpi_pmic_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct platform_device_id rpi_pmic_id[] = {
+	{ "raspberrypi-pmic-hwmon", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, rpi_pmic_id);
+
+static struct platform_driver rpi_pmic_driver = {
+	.probe = rpi_pmic_probe,
+	.driver = {
+		.name = "raspberrypi-pmic-hwmon",
+	},
+	.id_table = rpi_pmic_id,
+};
+module_platform_driver(rpi_pmic_driver);
+
+MODULE_AUTHOR("Sander Speetjens <sander.speetjens@gmail.com>");
+MODULE_DESCRIPTION("Raspberry Pi 5 PMIC hwmon driver");
+MODULE_LICENSE("GPL");
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 20141eb2cb67..90d7b66b96e3 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -84,6 +84,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_REBOOT_FLAGS =                       0x00030064,
 	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
+	RPI_FIRMWARE_GET_PMIC_ADC =                           0x0003009f,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
 	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,

-- 
2.56.1


