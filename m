Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF68606D803
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rQ6QUYDA;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=RdkaLyN1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4NRkATOS7zVqPGKPDehqJ5moLmosYe5MEheGQEZKtl4=; b=rQ6QUYDAPNP4Od
	gQQtSuA7lOaaMW4r6ro/zmOn/Zr8A1N82pfCpgd+kZFYFcWb0anLLXtRJYn/qpFLPeAJeXaBEYja5
	aoNJcYfchEClW4AMmkkm2G1DGUnivH5kWF7XsGIXsUCeTvn2st6yHFifSLj3rWK440/MtO4TGBM8x
	5U4JQkkrrVnWDrDvkNDFZVFSeMqOsJQ0OYYGV8Eofn5WHyzE7Y0eLWpQ6TQ1wZH3hQNo3Tl6+/F08
	sWRlvvN9sTB/CfoQ9f7uzZ0/sLvKB4EoyaYfRWDFOlNVpCU8dqcEIhCYYpsJtVjstTyrJ3DisKXEd
	kNOYxkS0FLfxqJvLnn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPYG-00000000ptO-3rNy;
	Mon, 09 Nov 2026 13:36:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPY2-00000000phW-0X4m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:36:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so6972575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231392; x=1794836192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NRkATOS7zVqPGKPDehqJ5moLmosYe5MEheGQEZKtl4=;
        b=RdkaLyN1F4lv6B5kG4dqxL/BsieN5OpGkS0kzCAZy8rqtXoajTUc+Irc5KTErgtfZa
         K6mHIiRGYKfHOpoNhwfVMSIpP+p8Uw7ZI7AVzhfXaitxKfZRnxfG2/iArwuFRioifTiX
         vl08k1uNYI+D7Q4UiS15rWm9Nuiyey4IsgUoVE1Bl8EEDd+CfQ00Eqbc3y5J1Omp7dxa
         kJP9f/iA82K45xPSE2dLJiVgFXQQXaWTAIZLf/auc7/NEJw7JAdmLOxHfSn5kBTO6bom
         kYz7glJjNG4I5Gxqopdsu/BkmzP1gmGORkbOAoB/TM7ALOu+3Hye+3LpdszmlUpYkH6V
         eLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231392; x=1794836192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4NRkATOS7zVqPGKPDehqJ5moLmosYe5MEheGQEZKtl4=;
        b=ZGiI8Ut8VhKKtM1Eu8f1byB5ZDATR5c/CYOtzEsCto11r+a/E1Urv0S9HlTor3v8R2
         +gZYKhh35UxiX1F/jBbdyqsliWfEo1cigP4ok2tISmSFlOA2Wo623/CIi+ZyfB6gAMlP
         v+fvds0PbkuC6EMWuvZVXwsc/etZU3PgCwfvjrX13Pk5BymyJoWYfsXxpxuL7vgyz0zw
         fUBcsZNSgfg1cFBkbIzp2gmLmuk7aXF5A9x39kjqEZyl0Ou6NCQGt4u0VhJz5/R9tw9C
         XPJo+FsGDQCpt9T9x2XBCyQwjYFPlOFnDYIc7aAhLKr4JXRlV0QhxgzyzqL+AzCUJHpw
         Q2FA==
X-Forwarded-Encrypted: i=1; AL+hErHjGrZNeJZkEImFMVkVnQ009xLAt6pG9kJIhqKH0EWgeqASR34C13DJH+L4SJVUij5mprUbvyiUT136Bx3G1dIX@lists.infradead.org
X-Gm-Message-State: APuU4Z+OT0FZ474cCh1qMFtG6N65wQCO3YqKqegJtsU6jejFSx8gH9ZC
	Wyou3EBbpj9EeoVsiiLOM2pnwRr/hZBe78QJyJ0+CmlscsJQWKzl/VO191GoldWnlZk=
X-Gm-Gg: AYBFou3fO2OxQiO1+2BGFWZ3ogMqvVSFYdZYk/aNBadSSA6jfgAsRX1dUBWK7TCVDLC
	bANZ7CAY881pPHcTJpSJ8WlR4yhO4eN6QMmDO8upmuQz1IPI2krtsjZ2dWj/FIbH/soSsbPyQZp
	84AeltA58QEyMhBiHS1OR+IhkXPJRxEG280khot8+mcv94o4tzuzJVXd9Lyij8wQ7ui+sUZSBpt
	KfPA7R1Hjoeiw7+w6+lpoyowquFHjQhjIr25fJVSIj5JZII8vD0wW5WP5G8Ue5TcEIHb4HqDq+k
	lumMBgPnryzkO5ueaimfxG5Q1jR07CUdYBw0KUBKtMPp1oAsxek1VNzG2ZQtDSnZDkW650BU44G
	dO2n+in+joWZ8TyGP+tmxKY5yf22h0L2RtDJGvWTqzHoghiPrQVlzEzhXocMdwvuewJVr1j7F3Q
	7XNdmyit46jSIqmI+xRQh55pwIS2wtP+g6+t7xQzvLwamO3BAPJogdP+p+NuixHExZPJDLHGyO4
	HD8pfJ4xd9xBbL1lLAswAdBQSiil12gtg27Rhw8BrPVfCeNvZYGxbo50T5p4kbYjSWvOS+ZH6rm
	Zw9VogGXU5nWu+97OocvtlQB4XVw0zminGLNhaKWc/bVtlZgXgmn9+moRioDEH4FNmPoXgJYVg+
	GXJwqupd7BUW1OYGEFEKJm86LGAVM8FT8UGFyHtcn9iH2QU2jkvLGEM981Ed69UZV57DtnKO2aQ
	rnplo=
X-Received: by 2002:a05:600c:3e0a:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4b94d7634e9mr71704465e9.2.1794231391656;
        Mon, 09 Nov 2026 05:36:31 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:30 -0800 (PST)
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
Subject: [PATCH v2 5/6] hwmon: sparx5: register LAN969x fan as a cooling device
Date: Mon,  9 Nov 2026 14:35:09 +0100
Message-ID: <20261109133609.810876-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053634_687260_39FDADC9 
X-CRM114-Status: GOOD (  24.31  )
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

Allow the LAN969x hardware fan controller to be used by thermal-zone
cooling maps when cooling-levels are provided on the fan child node.

Translate cooling states to PWM duty-cycle values and keep the cooling
state synchronized with direct pwm1 writes. Register the cooling device
against the fan child so thermal references resolve to the correct node.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Use hwmon_lock() for cooling callbacks instead of a private mutex.

 Documentation/hwmon/sparx5-temp.rst |  14 +++
 drivers/hwmon/sparx5-temp.c         | 145 ++++++++++++++++++++++++++--
 2 files changed, 150 insertions(+), 9 deletions(-)

diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/sparx5-temp.rst
index edb12f890172c..522707ed5a5f5 100644
--- a/Documentation/hwmon/sparx5-temp.rst
+++ b/Documentation/hwmon/sparx5-temp.rst
@@ -49,3 +49,17 @@ PWM consumers. The pwm1 value describes the logical duty cycle independently
 of the output polarity. Frequency requests are rounded to the nearest
 hardware divider value; requests outside the divider range are rejected.
 pwm1_freq reports the resulting frequency.
+
+Thermal cooling
+---------------
+
+With device-tree thermal support enabled, the LAN969x fan can also act as a
+thermal cooling device. The fan child's cooling-levels property maps cooling
+states to PWM values from 0 to 255, in ascending order. When cooling levels
+are provided, the driver initially selects the highest level.
+
+Manual pwm1 writes remain available and update the reported cooling state
+to the highest state whose PWM value does not exceed the requested value,
+or state zero if the value is below the first level. Subsequent thermal
+cooling requests can override manual PWM settings. Each cooling request
+programs the exact PWM value associated with the requested state.
diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index bdf08931f5b93..caa3fad367684 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/thermal.h>
 
 #include <dt-bindings/pwm/pwm.h>
 
@@ -47,10 +48,14 @@ struct s5_hwmon {
 	void __iomem *base;
 	void __iomem *fan;
 	struct clk *clk;
+	struct device *hwmon_dev;
 	unsigned long clk_rate;
 	u32 pulses_per_revolution;
 	u32 pwm_period;
 	bool pwm_inverted;
+	u32 *cooling_levels;
+	unsigned long cooling_state;
+	unsigned long max_cooling_state;
 };
 
 static void s5_temp_enable(struct s5_hwmon *hwmon)
@@ -124,6 +129,20 @@ static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
 	return 0;
 }
 
+static void s5_update_cooling_state(struct s5_hwmon *hwmon, u32 pwm)
+{
+	unsigned long state;
+
+	if (!hwmon->cooling_levels)
+		return;
+
+	for (state = 0; state < hwmon->max_cooling_state; state++)
+		if (pwm < hwmon->cooling_levels[state + 1])
+			break;
+
+	hwmon->cooling_state = state;
+}
+
 static int s5_read_pwm(struct s5_hwmon *hwmon, long *val)
 {
 	u32 data;
@@ -183,17 +202,23 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 	return -EOPNOTSUPP;
 }
 
-static int s5_write_pwm(struct s5_hwmon *hwmon, long val)
+static void s5_set_pwm(struct s5_hwmon *hwmon, u32 pwm)
 {
 	u32 data;
 
-	if (val < 0 || val > 255)
-		return -EINVAL;
-
 	data = readl_relaxed(hwmon->fan + FAN_CFG);
 	data &= ~FAN_CFG_DUTY_CYCLE;
-	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, val);
+	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, pwm);
 	writel_relaxed(data, hwmon->fan + FAN_CFG);
+}
+
+static int s5_write_pwm(struct s5_hwmon *hwmon, long val)
+{
+	if (val < 0 || val > 255)
+		return -EINVAL;
+
+	s5_set_pwm(hwmon, val);
+	s5_update_cooling_state(hwmon, val);
 
 	return 0;
 }
@@ -313,6 +338,89 @@ static const struct hwmon_chip_info s5_fan_chip_info = {
 	.info = s5_fan_info,
 };
 
+static int s5_cooling_get_max_state(struct thermal_cooling_device *cdev,
+				    unsigned long *state)
+{
+	struct s5_hwmon *hwmon = cdev->devdata;
+
+	*state = hwmon->max_cooling_state;
+
+	return 0;
+}
+
+static int s5_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long *state)
+{
+	struct s5_hwmon *hwmon = cdev->devdata;
+
+	hwmon_lock(hwmon->hwmon_dev);
+	*state = hwmon->cooling_state;
+	hwmon_unlock(hwmon->hwmon_dev);
+
+	return 0;
+}
+
+static int s5_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long state)
+{
+	struct s5_hwmon *hwmon = cdev->devdata;
+
+	if (state > hwmon->max_cooling_state)
+		return -EINVAL;
+
+	hwmon_lock(hwmon->hwmon_dev);
+	s5_set_pwm(hwmon, hwmon->cooling_levels[state]);
+	hwmon->cooling_state = state;
+	hwmon_unlock(hwmon->hwmon_dev);
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops s5_cooling_ops = {
+	.get_max_state = s5_cooling_get_max_state,
+	.get_cur_state = s5_cooling_get_cur_state,
+	.set_cur_state = s5_cooling_set_cur_state,
+};
+
+static int s5_get_cooling_data(struct device *dev, struct device_node *fan_np,
+			       struct s5_hwmon *hwmon)
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
+	hwmon->cooling_levels = levels;
+
+	ret = of_property_read_u32_array(fan_np, "cooling-levels",
+					 hwmon->cooling_levels, count);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read cooling-levels\n");
+
+	for (i = 0; i < count; i++) {
+		if (hwmon->cooling_levels[i] > 255)
+			return dev_err_probe(dev, -EINVAL,
+					     "cooling level %d exceeds 255\n", i);
+		if (i && hwmon->cooling_levels[i] < hwmon->cooling_levels[i - 1])
+			return dev_err_probe(dev, -EINVAL,
+					     "cooling levels must be ascending\n");
+	}
+
+	hwmon->max_cooling_state = count - 1;
+
+	return 0;
+}
+
 static int s5_get_fan_data(struct device *dev, struct device_node *fan_np,
 			   struct s5_hwmon *hwmon)
 {
@@ -346,18 +454,19 @@ static int s5_get_fan_data(struct device *dev, struct device_node *fan_np,
 		return dev_err_probe(dev, -EINVAL,
 				     "invalid pulses-per-revolution\n");
 
-	return 0;
+	return s5_get_cooling_data(dev, fan_np, hwmon);
 }
 
 static int s5_temp_probe(struct platform_device *pdev)
 {
 	const struct s5_match_data *match_data;
+	struct thermal_cooling_device *cdev;
 	struct device *dev = &pdev->dev;
-	struct device *hwmon_dev;
 	struct s5_hwmon *hwmon;
 	struct device_node *fan_np __free(device_node) = NULL;
 	void __iomem *base;
 	bool is_fan;
+	u32 initial_pwm;
 	int ret;
 
 	match_data = device_get_match_data(dev);
@@ -397,16 +506,34 @@ static int s5_temp_probe(struct platform_device *pdev)
 						     "invalid fan PWM period\n");
 		}
 		s5_fan_enable(hwmon);
+
+		if (hwmon->cooling_levels) {
+			initial_pwm = hwmon->cooling_levels[hwmon->max_cooling_state];
+			ret = s5_write_pwm(hwmon, initial_pwm);
+			if (ret)
+				return ret;
+		}
 	} else {
 		s5_temp_enable(hwmon);
 	}
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev,
+	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
 					is_fan ? "lan969x_fan" : "s5_temp", hwmon,
 					is_fan ? &s5_fan_chip_info :
 						 &s5_temp_chip_info, NULL);
+	if (IS_ERR(hwmon->hwmon_dev))
+		return PTR_ERR(hwmon->hwmon_dev);
+
+	if (IS_ENABLED(CONFIG_THERMAL_OF) && hwmon->cooling_levels) {
+		cdev = devm_thermal_of_child_cooling_device_register(dev, fan_np,
+								     "lan969x-fan", hwmon,
+								     &s5_cooling_ops);
+		if (IS_ERR(cdev))
+			return dev_err_probe(dev, PTR_ERR(cdev),
+					     "failed to register cooling device\n");
+	}
 
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	return 0;
 }
 
 static const struct s5_match_data lan969x_fan_match_data = {
-- 
2.56.0


