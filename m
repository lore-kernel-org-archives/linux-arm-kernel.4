Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64263606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Pwuo6x2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aJ0V6mlX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bUZA7hMUWYzvfTDfqEtex6oK6rRrBhkZaGJWsa6dlWY=; b=1Pwuo6x2QH3bPx
	isrNCi5ykN37RXtGhgjBS6wehiOjrW2IUsnQmGswER+hTNPgpRgJBljDMpLLz9C6S9gdbJCsTEpsb
	W/3Cy1wxAaZPcKsP0Elcz6R6f2BHe6DwsDDmxBa1omXGYHWJyZXJvYcSYkP9qefjhx7svQW3C1mmx
	XuSyhg/6SqEHBUHONKvUMcdgLd64Fo2ykRdQC09444qdApPsur7GT4cgjLblqRkaNV8DVx+/kL4BI
	kkbkQ9s59IPHjM9KoSibTVbilv/rQy5EsRhWbIdXmNQ0NdosN2CVhNz1DKi61dIrVSc+6DnVycBAS
	l6sEAPtXRwGIrD/dmYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU81F-0000000DFEQ-3mmI;
	Thu, 19 Nov 2026 19:42:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU811-0000000DF0I-2JIg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:41:57 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-490d59c3edaso44117f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 11:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795117309; x=1795722109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUZA7hMUWYzvfTDfqEtex6oK6rRrBhkZaGJWsa6dlWY=;
        b=aJ0V6mlXJeFLm/etb8XRPeAJiOVIfdgTYW5Ryw+fLkV3np0gom87Fshh/qeuNxi8Pt
         8EvF/SaB16AMyywWXruaK5/mZGQjt1HeUTGgjK3G9TgRqaje0JW8OitHHyGOtKiwSGpL
         ch5DDKQt9a9psLWg05ZB0m6CThZ33v1j+XXN7LaEWU0s3htX2E2cBWge7CCyz26iikQw
         +Q7NEjPrU3MNbJ/36JScItdCvKexxPkYnZulxlOaWFPDWAfDfT5gS/kvo1Jy+qKKsMwZ
         +uQm+V2ZD2UrvoutCeLY02l8hA51rBtNFXYit9XaWAUPZ2EfvdkaRZ+iPGV6VdBN+Iu4
         Ypmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117309; x=1795722109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUZA7hMUWYzvfTDfqEtex6oK6rRrBhkZaGJWsa6dlWY=;
        b=RDAGAQZEsIqHV5lOkut63Tdmob0HBRsgVNxJXQDRxJCPvIhMscdsFNFoXG7bBiq60g
         4Dzk6KsLGdrr8CI1weDxZsZZN4ATPuqz+MpcIgx5TL+5O3SOzDf+XF6B18vXBsXhfqf9
         yk2v75VF6WvvD0+R8ouxVdAGMuFzlKjkQm19GQopCkIrW/edHAX1eylOj74Qg0Z5Yi7d
         OdayR6t9Dz3OG2lBeiO8Bw/Q+lJ8qLQ24AeLXFDV63BOBWkU2IePzjtcjGzI3tZFtuv1
         NPrvCrcgb/FQkPlO6dfvSWGhcEjDv/tin6MorG8oQZKlv4U9iwSLgBBeDMcYHFIFd8FG
         5qbQ==
X-Forwarded-Encrypted: i=1; AL+hErFmiRWTwE376V3QZK8owSU8+fBinNr3Yo/dQMoiEAyq3NGMqgDtVZar/WkXLpsa/Ra+KIbJuKFlwtf8oebdc30M@lists.infradead.org
X-Gm-Message-State: APuU4Z9JOXgPORfkqTsS8LG7Xw2G5yF2NtQPGZRhmEHW1865yxbzgncI
	uhqcRBoo2D4zIxfWN8zrVZTc6eGubAi+h3YnqiIPihiQux02DQuXFsfcxbYSBEBLk2A=
X-Gm-Gg: AZFdTZchkiYhbXPFw08XkXas2FJGGBIoxavsKc5tinG8iXaYzGgwNoivcZRFNMrB4/3
	5DiBn2LegGcrWXWN8Z8Mlhzj9I6tEc+b/pm9f7c75xXsPS6gOMYZpAN142syTSdTWJso6jLLhFk
	Sg+5WpjYonKODVckrBhR3Sh7Bb+FRjb+aFfgCaR5bpmvEBlzkohDQRU7pfFwTnAx/cLts1CNaD/
	GYo0R83qqDHfSJAAraTZadwaAldtrtJX2/EBqyya7gF1Eh2SfqZnP2io9OdIzuZCwd1bUahVyaZ
	nzZk0Gm9NChKrlG2LAYMdIJIitcgvg4PGpm8DvB6FBgKh1vPMCY1euU/GLduSVv96BOt8QVmeKH
	bZI/woeVPiEAZCUYHQMGV82onRsXh1sUDdGWVcmWUQYtux4fW5Fd+DGd+POYKaePH+NjD7Eku0s
	PXiXqx9dRD0RCBQ2v17shBprRuh7UaHcsG8k6Q675+e0dnVBayE3TF2GohmDCGODoGhye2e+ScC
	fnxA0iH42f8LBAuLFdnbDl6IzybC+Wc05ExZmedwUVFFBztphXIeL56kH2MgZqegGBZsILnQd8H
	4i5jDgeKp+9YkofiIboAjES9CnNRjON5zPvqGw3ZVpN5Bjr6+F8ZXzWjkpAs+mScPGPvVeThnlJ
	NpG0X3cY/WQM7jbwG3Yj2genA8hHwEjyxl/du
X-Received: by 2002:adf:fc8e:0:b0:4a6:4ac6:d94f with SMTP id ffacd0b85a97d-4abb3956acamr680617f8f.19.1795117309468;
        Thu, 19 Nov 2026 11:41:49 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm1375537f8f.40.2026.11.19.11.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:41:49 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:41:46 +0100
Subject: [PATCH v3 1/2] hwmon: add Raspberry Pi PMIC driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-hwmon-da9091-v3-1-15956035d7b5@gmail.com>
References: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
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
 bh=3Ol1g3+090HR3CJo6dV6UXCrE2tR6OiUbBc3Z6NK/qc=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1D7X8jBRjs1cm98LNzZvENJHQWAP0qqLihDN
 uZkPo0LniOJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9Q+wAKCRB4zXhFDAXI
 Z7yED/9ojvk7yl8yBhfQB6ICmusUVb2Ow7iEVavQY6UcfqK8BFZVJNdpjFcwgSmfosQqZUVFeNT
 iR9sKn8FGFU2HNq7rYEmtoh1VH1xxJI1XhWg9SBYfT6x+BwgTJTRX46zNDEBhzqE6eX1oXOMcKO
 q/XgIRGgtDy2mZiMqO4cAQ//ArV3fkuFMbj8bG0Gsnb2y7ZCCwxsFsIffwJ3YGglAi8x7KO4f9n
 4G5jIRxeb734Nv3FdMM+aeLrz/qVPY9HDlGwAloQ5lsu7RSE54YCICtPtdqZuA8hmCC9VsfcG7y
 KjhS2X+egbxgVF4wCr2Hsz2Z7Ir2W8HRY9GD4TuviMpRw5oFYdJjrd2hTXlGuFVbnPBC3qsjyCd
 T5ELl4ETGWsJlkyktf/fZXXyPpxOcAynVFcWzQyDMLK6XluZQL//7SRsfYxfLLevFRRMlUqWrI+
 J/BZeVQq6procUfD9rS/lCzo1gbRIfnD/23vIcg9yXuhMhqlzz26KBve5yufaX8WjATPjIQmQJm
 FVfk8rkbt/qlejLg/UKNVG0xUG2Nbrnaxf3H/EvUh2ENc4ExAMSCZqNq/d6JWZX8g1IjpHyWvDf
 sqW9yhFmWS6nRxLUlKhkWiG7geKRskQbVZehcPZui/oVh5nnWc00uncEwhjDxj35LT3rfWYwvdJ
 yyQpxCoIL+6UuBQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_114151_758491_DD6D51F5 
X-CRM114-Status: GOOD (  25.58  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
index 000000000000..cb6ddb5b7d4f
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
+						     "rpi-pmic", data, &rpi_pmic_chip_info, NULL);
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


