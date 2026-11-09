Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D5F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=40DYzTx3;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=FFN6A7Kw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ArFSG1MfNYwGmj6epQAS9P5R+vfkTG0tqXWEL/txXy8=; b=40DYzTx3BC8bAj
	iKlwePZvXtE4Qmt5hxLvANW5a35ziNQTW5achpWiKI4qRomBhOQwk1dAUUAirzzUI7hyFuC/uDWfT
	oJY6M3/otwFKLiYmPwnEGpfirWcBEIR0/E6d66Cj52lHQTjgwqWS9IG5YeX81hU5NWUnZfxqhK+uW
	kGzczRdLBPqjTCR/agdq/7aj6Dno4iewzQXdoYGg8yh2wBreVdtfYeBGCQC7SbUUKscOxS0+pOYv8
	lnQjtt9gsjxqaYUoewPB8jwRapj47/R4ZVyvUwTs0Z8LbdrLV3HgzaW7i20pqRVUWf0pa4FkPrflo
	mXVoyR5ewFW1mmckHP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPY4-00000000pjX-1dED;
	Mon, 09 Nov 2026 13:36:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPXx-00000000pdU-3IWr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:36:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so10334005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231388; x=1794836188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArFSG1MfNYwGmj6epQAS9P5R+vfkTG0tqXWEL/txXy8=;
        b=FFN6A7KwjS7GvNw/EMeHPJzEwWROgwp1acFH8WfGKbnyA75C3FNH41OwtKvAHZD01X
         tbhvQLZWDEudcXakXBZxy4tAFKsoYYFqzFj59dmj5f0xSGcS8lc3Tzo+eC1TZBZVRq3Y
         K3Zi/PEC58I6W+Lf+MB55Mb6OH7+QIIJgqqg3qugNkhZ+NJqpJB0aKDaOaT+jmS9jrA5
         i88HA9zk/Im8PeMFosvHiTLMFFcRWoejDVueMFWR2SsmwpvIgmD3eBClYFktQ6C/C6CG
         rTeULcHoZz5urJ+kWrMzDPSZkE7hUyXJUMDvrXAk0Q15NoMYMwf3M0lnzdC1i6b2hASy
         G7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231388; x=1794836188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ArFSG1MfNYwGmj6epQAS9P5R+vfkTG0tqXWEL/txXy8=;
        b=aDVYWyohnOPcYvDLvBkEDz18IEEym38Gzu22O+Geo71LH5uo6hlAXgfa1zIPLyg/E6
         CKJdheKPhvn4jzuNfx5MZTDwDWIO2eP4mG+XaC675TctLy0CWztIGGH1z4pUGl6eX/jQ
         yyiVz1WXaJZPbrJlQq8ZWON4fEp8iMZ//dIz4LpOHM4vovVrFJ/pF8BmXEylq2vmVlP4
         nwuwGkvHl7vGql5xwSUYbYGbYkZJjZXPy9KWkEbFH40QVdFeUZ2afzqK2N7OByE2MsYs
         4SRtQ34EuP1HTKx9ya3rgx7aaWz8e8l6tlDgfN810quYQGC/IpqLHllS5mmoVpH7yZ4r
         67JA==
X-Forwarded-Encrypted: i=1; AL+hErHq0VQFwQggNI0/WRJfotCIpOSLeYZehrE52SUGZNg+ciVRz0uxgfU6DfrlvnseEkQiTcVXrsS58TDooKW2o3Lr@lists.infradead.org
X-Gm-Message-State: APuU4Z92kRW301zDa259C8NDsVlVNQHIXoi1saehqHF7VbJecEI3Ary0
	96jkmxh7ulz4tF5fNV4olc5BYJwfZfBFduOoWze6TEDs0gc5sY3o9VBVD9laKpxyw9o=
X-Gm-Gg: AYBFou3faIMM2SSjpDMm80pxePL+1vT4sOt150y+Kn2IoW4QUn5egBfLOeycyNHiBhZ
	gKgo/81+BRVqJPj+BqZ8BxQrBbZ60BR3q03lD1HGKEHIpEsT4bc6qtZgAEx/9SEv7mTBwwDxvKA
	SpV43JT9BvlovEY+9cdhqjC/Zg9z83JSi/XbJAvAR3NA/3LCSa8EbennYh717cf1+iluUy0Ts0m
	N87FLHZhl8x6DcK7LN1AOqWAGlqI21TLbGsXBSog5LVMhonBcLADeUs/zgZJ/9NrssZNHgozWSz
	5KlFOwEe3aXoL3WcX3dQUtcSLCpoNmkjo+lgeHY0VpOIVYQs2jaW+o1OgiYIvfE6+hn0l+FC6ve
	4gfAufXEeRlkdAoQfYkvlAPmSru70IlNY2BfTI/NL79gElc+jhk9Bp0L4WCgPZ9AKwoUtKmjE8g
	2GYdzERkCWtvL/BSX3wRG0yWxmnNthMIcOpiEeh2oSwxkIFGMNi6gG41kAmIrpMjdzg8zNMQfBG
	QeiYRiTuqSBWxEwSp2Z9jTPYt8HWS2Dglq82kv6cOkAxmEj1AEHHKlDPAf1Uq946bW5JH+Fkef2
	YgGrDXD/zqszoRt5ExK2770ISkCpwZooZ4K6PQ8nF/JFk++dEJb0xjeQy8quBUL7UQw3Ct7y8VF
	+V/OXF3tHRomiHIsxPBFAuKL1vmHmttUFHx2p4mSrA32RA664Uoz9obBWtvXSBrlZTXXmedfJD7
	DhsCg=
X-Received: by 2002:a05:600c:8705:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4b94d75ecbbmr79305425e9.2.1794231387807;
        Mon, 09 Nov 2026 05:36:27 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:25 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 3/6] hwmon: sparx5: add LAN969x fan monitoring support
Date: Mon,  9 Nov 2026 14:35:07 +0100
Message-ID: <20261109133609.810876-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053629_875556_2C3E5486 
X-CRM114-Status: GOOD (  25.27  )
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

LAN969x has a fan controller with a tachometer in a register block
separate from its Sparx5-compatible temperature sensor. Match the fan
node independently and expose fan1_input on its own hwmon device.

Read the optional pulses-per-revolution property from the fan child.
Preserve the temperature-only behavior of existing device trees.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Register fan and temperature monitoring as separate hwmon devices.
- Reject a present but malformed pulses-per-revolution property.

 Documentation/hwmon/sparx5-temp.rst |   9 ++
 drivers/hwmon/Kconfig               |   7 +-
 drivers/hwmon/sparx5-temp.c         | 146 ++++++++++++++++++++++++----
 3 files changed, 139 insertions(+), 23 deletions(-)

diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/sparx5-temp.rst
index 0140809089542..a053d12fbdbbb 100644
--- a/Documentation/hwmon/sparx5-temp.rst
+++ b/Documentation/hwmon/sparx5-temp.rst
@@ -15,6 +15,10 @@ Supported chips:
 
 Author: Lars Povlsen <lars.povlsen@microchip.com>
 
+The driver also supports the Microchip LAN969x temperature sensor and fan
+controller as separate devices. The fan controller uses the
+microchip,lan9691-fan compatible.
+
 Description
 -----------
 
@@ -30,4 +34,9 @@ The following attributes are supported.
 
 ======================= ========================================================
 temp1_input		Die temperature (in millidegree Celsius.)
+fan1_input              Fan speed in RPM (LAN969x only).
 ======================= ========================================================
+
+The tachometer counts pulses over one-second intervals, independently of the
+PWM output. The fan child's pulses-per-revolution property specifies how many
+pulses represent one revolution; it defaults to two.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 3ae676a56d95c..deb9eb82b8501 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -669,11 +669,12 @@ config SENSORS_I5K_AMB
 	  will be called i5k_amb.
 
 config SENSORS_SPARX5
-	tristate "Sparx5 SoC temperature sensor"
+	tristate "Sparx5 and LAN969x SoC hardware monitoring"
 	depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
 	help
-	  If you say yes here you get support for temperature monitoring
-	  with the Microchip Sparx5 SoC.
+	  If you say yes here you get support for temperature monitoring on
+	  Microchip Sparx5 and LAN969x SoCs, as well as fan monitoring on
+	  LAN969x SoCs.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called sparx5-temp.
diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index 0fd5c147f8167..1f197004780cc 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -9,8 +9,11 @@
 #include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define TEMP_CTRL		0
 #define TEMP_CFG		4
@@ -20,9 +23,26 @@
 #define  TEMP_STAT_VALID	BIT(12)
 #define  TEMP_STAT_TEMP		GENMASK(11, 0)
 
+#define FAN_CFG			0
+#define  FAN_CFG_GATE_ENA	BIT(2)
+#define  FAN_CFG_STAT_MODE	BIT(0)
+#define FAN_PWM_FREQ		4
+#define  FAN_PWM_FREQ_CYCLES	GENMASK(27, 16)
+#define FAN_CNT			8
+#define  FAN_CNT_DATA		GENMASK(15, 0)
+
+#define FAN_TACH_INTERVAL_HZ	100000
+
+struct s5_match_data {
+	bool is_fan;
+};
+
 struct s5_hwmon {
 	void __iomem *base;
+	void __iomem *fan;
 	struct clk *clk;
+	unsigned long clk_rate;
+	u32 pulses_per_revolution;
 };
 
 static void s5_temp_enable(struct s5_hwmon *hwmon)
@@ -37,6 +57,24 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
 	writel(val, hwmon->base + TEMP_CFG);
 }
 
+static void s5_fan_enable(struct s5_hwmon *hwmon)
+{
+	u32 cycles, val;
+
+	cycles = DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_TACH_INTERVAL_HZ);
+	cycles = clamp_val(cycles, 1, FIELD_MAX(FAN_PWM_FREQ_CYCLES));
+
+	val = readl(hwmon->fan + FAN_PWM_FREQ);
+	val &= ~FAN_PWM_FREQ_CYCLES;
+	val |= FIELD_PREP(FAN_PWM_FREQ_CYCLES, cycles);
+	writel(val, hwmon->fan + FAN_PWM_FREQ);
+
+	/* Count all tachometer pulses over one-second intervals. */
+	val = readl(hwmon->fan + FAN_CFG);
+	val &= ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA);
+	writel(val, hwmon->fan + FAN_CFG);
+}
+
 static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
 {
 	int value;
@@ -62,6 +100,17 @@ static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
 	return 0;
 }
 
+static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
+{
+	u32 count;
+
+	count = readl_relaxed(hwmon->fan + FAN_CNT);
+	count = FIELD_GET(FAN_CNT_DATA, count);
+	*val = count * 60 / hwmon->pulses_per_revolution;
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 		   u32 attr, int channel, long *val)
 {
@@ -72,6 +121,10 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 		if (attr == hwmon_temp_input)
 			return s5_read_temp(hwmon, val);
 		break;
+	case hwmon_fan:
+		if (attr == hwmon_fan_input && hwmon->fan)
+			return s5_read_fan(hwmon, val);
+		break;
 	default:
 		break;
 	}
@@ -82,62 +135,115 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
 			     u32 attr, int channel)
 {
-	if (type != hwmon_temp)
-		return 0;
+	const struct s5_hwmon *hwmon = _data;
 
-	switch (attr) {
-	case hwmon_temp_input:
-		return 0444;
+	switch (type) {
+	case hwmon_temp:
+		return attr == hwmon_temp_input ? 0444 : 0;
+	case hwmon_fan:
+		if (hwmon->fan && attr == hwmon_fan_input)
+			return 0444;
+		return 0;
 	default:
 		return 0;
 	}
 }
 
-static const struct hwmon_channel_info * const s5_info[] = {
+static const struct hwmon_channel_info * const s5_temp_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
 	NULL
 };
 
+static const struct hwmon_channel_info * const s5_fan_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	NULL
+};
+
 static const struct hwmon_ops s5_hwmon_ops = {
 	.is_visible = s5_is_visible,
 	.read = s5_read,
 };
 
-static const struct hwmon_chip_info s5_chip_info = {
+static const struct hwmon_chip_info s5_temp_chip_info = {
 	.ops = &s5_hwmon_ops,
-	.info = s5_info,
+	.info = s5_temp_info,
+};
+
+static const struct hwmon_chip_info s5_fan_chip_info = {
+	.ops = &s5_hwmon_ops,
+	.info = s5_fan_info,
 };
 
 static int s5_temp_probe(struct platform_device *pdev)
 {
+	const struct s5_match_data *match_data;
+	struct device *dev = &pdev->dev;
 	struct device *hwmon_dev;
 	struct s5_hwmon *hwmon;
+	struct device_node *fan_np __free(device_node) = NULL;
+	void __iomem *base;
+	bool is_fan;
+	int ret;
 
-	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
+	match_data = device_get_match_data(dev);
+	is_fan = match_data && match_data->is_fan;
+
+	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
 		return -ENOMEM;
 
-	hwmon->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(hwmon->base))
-		return PTR_ERR(hwmon->base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	if (is_fan) {
+		hwmon->fan = base;
+		hwmon->pulses_per_revolution = 2;
+		fan_np = of_get_available_child_by_name(dev->of_node, "fan");
+		if (fan_np &&
+		    of_property_present(fan_np, "pulses-per-revolution")) {
+			ret = of_property_read_u32(fan_np, "pulses-per-revolution",
+						   &hwmon->pulses_per_revolution);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "invalid pulses-per-revolution\n");
+		}
+		if (!hwmon->pulses_per_revolution ||
+		    hwmon->pulses_per_revolution > 4)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid pulses-per-revolution\n");
+	} else {
+		hwmon->base = base;
+	}
 
-	hwmon->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	hwmon->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(hwmon->clk))
 		return PTR_ERR(hwmon->clk);
+	hwmon->clk_rate = clk_get_rate(hwmon->clk);
 
-	s5_temp_enable(hwmon);
+	if (is_fan)
+		s5_fan_enable(hwmon);
+	else
+		s5_temp_enable(hwmon);
 
-	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
-							 "s5_temp",
-							 hwmon,
-							 &s5_chip_info,
-							 NULL);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev,
+					is_fan ? "lan969x_fan" : "s5_temp", hwmon,
+					is_fan ? &s5_fan_chip_info :
+						 &s5_temp_chip_info, NULL);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
+static const struct s5_match_data lan969x_fan_match_data = {
+	.is_fan = true,
+};
+
 static const struct of_device_id s5_temp_match[] = {
+	{
+		.compatible = "microchip,lan9691-fan",
+		.data = &lan969x_fan_match_data,
+	},
 	{ .compatible = "microchip,sparx5-temp" },
 	{},
 };
@@ -154,5 +260,5 @@ static struct platform_driver s5_temp_driver = {
 module_platform_driver(s5_temp_driver);
 
 MODULE_AUTHOR("Lars Povlsen <lars.povlsen@microchip.com>");
-MODULE_DESCRIPTION("Sparx5 SoC temperature sensor driver");
+MODULE_DESCRIPTION("Sparx5 SoC hardware monitoring driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0


