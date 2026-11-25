Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0125E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qO5Y65iD;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=W0hGX2hh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0s6fmlzONGCK6lmJzVfynVtJ2jjFF8VyCT3dCxeu9Vc=; b=qO5Y65iDVeNqN+
	WsLfaAJY4nGYnk8TgEuqLKKFZOEoBkaBARv/HFLGo2yvUUYt86WTC6RfsjsfBQn4bmQfiJgNVylpZ
	VLDbZ9ak8h10oBr4DTG2ISBjeJLfJA2m4cYjGr4Q1lgcenZ6LmvC8i/sph+j6m+jhuRBVO8MaKU3a
	Vvji6fxehnxc2MQVILszROpsuskPBrbHGQxmsCdCB0eCKNWqoxvLT8CcTyGpeqfX10YT5iVY+TxBH
	yWvI+N2ouiNt7vVG23e4uhyaQqbDowc8hfczlaZgxMgyPOjfxau1fj0UE6pLak0NfD/MylfMiZM/X
	q6M7M5T3BBDt/ociv/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFkL-0000000AXNP-3MlP;
	Wed, 25 Nov 2026 16:21:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFjw-0000000AX7y-1ktU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:21:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so46644645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 08:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795623658; x=1796228458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0s6fmlzONGCK6lmJzVfynVtJ2jjFF8VyCT3dCxeu9Vc=;
        b=W0hGX2hhfXtEcTMz6ytOH3o73taDyNQbcu2eaB9JGg2TwXAuPA+9yG0doo6+8E6J2u
         RpkD4TO+EjK1O97qmcPUjObOW2NwDfDxfLcSgHSkgD/56Vxx+ng93D/i6ZFEmR1LvjQu
         xeQB06Bjo3Okf+jVI81P3XEdqlLai/ueRChez1XBX7pWwsEpCJU8kbfxBfUQ8p9IlTJX
         KS+Bdn2vCAYutPUGJ04G5vFivzxRE3dgMxBqqlHeqlHsV4vAzdvG3ZXpFr8wujpdHzdV
         mJlM+ojtvEZ5W4A5LvyCDRTSFrrSf7jpDxh7UErwI023eqajeyhIRfd9YHsinxFRI77w
         dsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623658; x=1796228458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0s6fmlzONGCK6lmJzVfynVtJ2jjFF8VyCT3dCxeu9Vc=;
        b=zdNUI2lZu8TWsgTbqBP3PsxPFJ86G3p54Ut+GLdv3iOhOlWXHDdtSXL9Aug+N1H5Hd
         UxdJf0c1g9NJRG8ivSzePyd/tVf0YfAdpzeadlSIfN9kLxnh+gS2nxgBPNiSArK1Nr6B
         ysvsq/mSCm1VzZAAT4yYf7P7wiOz0pqzp0BeI6gIbESW8iFwxlvDw8R0O2dzn0C0qLrf
         ZzQz06B2EAQd7ioRkJAtJyy2+fu7DcpGtXHuW7VDv1PkEN/3pBst7CoANFKCjgtcTbmY
         FYIUWlx0Xki/yblwiH8WGqnhjfhft13eZ95ShUwR1n6Y8DcSCcOB45EJth35daFPbh+h
         s+IA==
X-Forwarded-Encrypted: i=1; AL+hErEOuX8ladONdSYJDzAtRA3n1ieTBy+zdxlLP4mCbdE6aledsDtezRkxAhSvJRJlvHQJ0rVrAYV4N+oiG6RHxtRG@lists.infradead.org
X-Gm-Message-State: APuU4Z+oAaQvf5Hp1FKCF3t9O1xvoT+7qkxoLuvPGVpZiGCfcZ2yJRE5
	zd7FC7J2ktGxMjayQ4AqtlQIQLTUSd0POHIe2M3xU/FfgbG/LkLluhWXR2wN8OTN1U0=
X-Gm-Gg: AZFdTZepxjtmm2fg2ADfw89az0K6vbamMyTi/ohNQm34dZIbBym3pW40na625A2dZF3
	V0bGmaGgKPcqnROmgY7a0xFarSaprsYC39ARBGpco7yMvAVgy8/D/ekQUX7goTjDeGR/3OGnXMr
	yJ93CCvcLosWxLF7hIh8yjQshuh3oHVXrbYNYxg24tITrZFbNuKMmLtEn8kU4TrCRrmzGiGW7+b
	EEESfFDC693HizMzwoOX5SSf1mINM5nRTS6I23UosvdkDtB8Jvzd3r0WL0CSFTBg5nbtAribmMT
	xlOUdbGjZnhECYXhn2764p0dlxLedU3NfVLVSwUcB/rQ9vnpZ88vDJhSXPHC0dHVEM/vQQSF2cj
	9feYVcub7iB/RSdWnQcCFlYGj+7zyKy/xPFWfeTFXU1tbjN2SaaLIAaFaclvpyzMfIcjABfk3Xv
	eJdySNEAn2AGIr559nO5EQfjkiZ0EVN8Y8t/LUf9YckjizPcZW92xbZyEXzv10+Mip/4hkttXWp
	TdmXJPaNHk/JlWJP/lofAzrfzDoHzjFVXZvfkaHkoQeP6Z26OAdj1qKXx0uo/7YWqpXzqiqbAjq
	f6R51LXk6TrctgINp/gvLkUwZcLJ/oyPWc+HjVziKD8K8RqkXw==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb8881d4damr384617425e9.28.1795623658289;
        Wed, 25 Nov 2026 08:20:58 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm515826755e9.15.2026.11.25.08.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:20:58 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v14 3/3] pwm: rp1: Register auxiliary device for the fan tachometer
Date: Wed, 25 Nov 2026 17:24:52 +0100
Message-ID: <20261125162453.23573-4-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125162453.23573-1-andrea.porta@suse.com>
References: <20261125162453.23573-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_082100_572039_15AB1FB2 
X-CRM114-Status: GOOD (  34.33  )
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

On the Raspberry Pi 5, the firmware running on the RP1 Cortex-M core
measures the fan tachometer pulses and periodically writes the computed
RPM value into the phase register of PWM channel 2, inside the RP1 PWM
controller register block.

The Linux PWM framework has no abstraction to report such a value, and
the reading belongs to the hwmon subsystem. Following the auxiliary bus
model, let the PWM driver instantiate a "fan" auxiliary device
(pwm_rp1.fan.<id>) to which the hwmon driver can bind, without needing
any additional DT node.

The way the tachometer value is obtained (the register is shared with
the channel phase control) is an implementation detail of the PWM
driver, so provide rp1_pwm_read_tachometer(), exported in the 'RP1_PWM'
symbol namespace, for the auxiliary driver to use, as documented in
Documentation/driver-api/auxiliary_bus.rst.

The auxiliary device is destroyed first in .remove(), so that the hwmon
driver is unbound before the PWM controller resources are released.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS                               |  1 +
 drivers/pwm/Kconfig                       |  5 +++
 drivers/pwm/pwm-rp1.c                     | 49 +++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h | 12 ++++++
 4 files changed, 67 insertions(+)
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c7b280a2bdb..26f8520c02ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23382,6 +23382,7 @@ L:	linux-pwm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 F:	drivers/pwm/pwm-rp1.c
+F:	include/soc/bcm2835/raspberrypi-pwm-rp1.h
 
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 523789e82355..7b271a16a483 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -641,9 +641,14 @@ config PWM_RASPBERRYPI_RP1
 	tristate "RP1 PWM support"
 	depends on MISC_RP1 || COMPILE_TEST
 	depends on HAS_IOMEM
+	select AUXILIARY_BUS
 	help
 	  PWM framework driver for Raspberry Pi RP1 controller.
 
+	  The driver also registers an auxiliary device that allows the
+	  companion hwmon driver (SENSORS_RP1_FAN) to report the fan speed
+	  measured by the RP1 firmware.
+
 config PWM_SAMSUNG
 	tristate "Samsung PWM support"
 	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
index 30ab06b4cb75..9afe3706e624 100644
--- a/drivers/pwm/pwm-rp1.c
+++ b/drivers/pwm/pwm-rp1.c
@@ -38,6 +38,7 @@
  *   channel. As a result, phase control will be ignored for now.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk.h>
@@ -49,6 +50,7 @@
 #include <linux/pwm.h>
 #include <linux/units.h>
 #include <linux/spinlock.h>
+#include <soc/bcm2835/raspberrypi-pwm-rp1.h>
 
 #define RP1_PWM_GLB_CTRL			0x000
 #define RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(chan)	BIT(chan)
@@ -79,12 +81,16 @@ enum rp1_pwm_ctrl_mode {
 
 #define RP1_PWM_NUM_PWMS			4
 
+/* Channel whose phase register is used by the firmware to report the fan RPM */
+#define RP1_PWM_FAN_TACH_CHAN			2
+
 struct rp1_pwm {
 	void __iomem *base;
 	struct clk *clk;
 	unsigned long clk_rate;
 	bool clk_enabled;
 	spinlock_t lock; /* sync for RP1_PWM_GLB_CTRL RMW access */
+	struct auxiliary_device *fan_adev;
 };
 
 struct rp1_pwm_waveform {
@@ -286,6 +292,32 @@ static const struct pwm_ops rp1_pwm_ops = {
 	.write_waveform = rp1_pwm_write_waveform,
 };
 
+/**
+ * rp1_pwm_read_tachometer() - read the fan speed reported by the RP1 firmware
+ * @adev: the "fan" auxiliary device registered by this driver
+ * @rpm: where to store the fan speed, in RPM
+ *
+ * Meant to be called only by the driver bound to the auxiliary device
+ * created by rp1_pwm_probe(), which carries the controller private data as
+ * platform data. The auxiliary device is unregistered before the PWM
+ * controller resources are released, so that data is guaranteed to be
+ * valid for as long as the auxiliary driver is bound.
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+int rp1_pwm_read_tachometer(struct auxiliary_device *adev, u32 *rpm)
+{
+	struct rp1_pwm *rp1 = dev_get_platdata(&adev->dev);
+
+	if (!rp1->clk_enabled)
+		return -EBUSY;
+
+	*rpm = readl(rp1->base + RP1_PWM_PHASE(RP1_PWM_FAN_TACH_CHAN));
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(rp1_pwm_read_tachometer, "RP1_PWM");
+
 static int rp1_pwm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -347,8 +379,23 @@ static int rp1_pwm_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
+	/*
+	 * The fan tachometer is exposed to the hwmon subsystem through an
+	 * auxiliary device. The chip id is unique, so it is used to avoid
+	 * name clashes if more than one RP1 PWM controller is enabled.
+	 */
+	rp1->fan_adev = auxiliary_device_create(dev, KBUILD_MODNAME, "fan",
+						rp1, chip->id);
+	if (!rp1->fan_adev) {
+		ret = dev_err_probe(dev, -ENODEV,
+				    "Failed to register fan auxiliary device\n");
+		goto err_remove_chip;
+	}
+
 	return 0;
 
+err_remove_chip:
+	pwmchip_remove(chip);
 err_disable_clk:
 	clk_disable_unprepare(rp1->clk);
 
@@ -360,6 +407,8 @@ static void rp1_pwm_remove(struct platform_device *pdev)
 	struct pwm_chip *chip = platform_get_drvdata(pdev);
 	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
 
+	/* Unbind the fan driver before tearing down the PWM controller */
+	auxiliary_device_destroy(rp1->fan_adev);
 	pwmchip_remove(chip);
 
 	if (rp1->clk_enabled) {
diff --git a/include/soc/bcm2835/raspberrypi-pwm-rp1.h b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
new file mode 100644
index 000000000000..290a052480bc
--- /dev/null
+++ b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SOC_RASPBERRY_PWM_RP1_H__
+#define __SOC_RASPBERRY_PWM_RP1_H__
+
+#include <linux/types.h>
+
+struct auxiliary_device;
+
+int rp1_pwm_read_tachometer(struct auxiliary_device *adev, u32 *rpm);
+
+#endif /* __SOC_RASPBERRY_PWM_RP1_H__ */
-- 
2.51.0


