Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACA5606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wTUNHmyG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MPQoeOCa;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YXsRLXET
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m2xibGYCW99ZvwUe/lKayob3iHv2iOk1v6WVsVu9rhE=; b=wTUNHmyG4+Razo
	Si070UThpLFGlG4cf54psJHWUJ1XZhYbSAc92trluda+48k+vqvu+T+wAx5u9/8TDHIvG/QJZ070u
	a3OLGjDq8j8lp0fbeCqUvrqyIqGNKGrlRteV7c/vvmG2I+P6KrNIisgA81Isgrp359f/6bRUJ4HRy
	wpswCJdVLHAJWwHTTLzZ3GUY9MesRDMpcVUbSErowjaaPF5JJ64yxABaFQpVzQGAoCpzzYKX26a6f
	zz7pcDldqqqZjUvU+vwq9zgixPg/YcHMa6vIsRv5K4NKYQScOxXqzYQkQuPvT44sgxkwTX8VBIQN1
	B+eeRaXMY55N0p6glOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuOf-00000007NMW-060g;
	Tue, 24 Nov 2026 17:33:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuOE-00000007NAy-1wNL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 17:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=m2xibGYCW99ZvwUe/lKayob3iHv2iOk1v6WVsVu9rhE=; b=MPQoeOCah+creJWWmM+JiwziYo
	SM9/vBrl0mpBv9cbhdlQBvvdaKjiCVQSPd3gyEhV+t3iTtbp7Y1KvJSIQ88CRN4yQANgo/vRBAMRL
	8bURiqmFjWyCDbK2JtiggP/GVPm/m8Mf6/aZWUeuzDmlnVgtB79SQIr5m9OS/wrR//i52ePKGjRe+
	8B2aomhKf1k/ArtFkvbwVXT/7b7gVxEt0RNCf43bVtR2h0WVC4wjaxFvfngbXYDJPeYz3Vwy6tL1X
	aJA+n/pmEcfVsZl+Z1uzb7ui/tPeWJYliLApHwvENixvh4h6REnzL/U9/KIHm/dzbmf1iiqwPMX6P
	nSMMwyAw==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuO9-00000004PjQ-3m9m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:33:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so62556585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541584; x=1796146384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2xibGYCW99ZvwUe/lKayob3iHv2iOk1v6WVsVu9rhE=;
        b=YXsRLXETB2J8CdEyb/CBU9Ua9u4RObSst8QzwbljdpPtBWH3LUZ8LhTVVDus/Kjb9b
         BqD3QYlIpLJrfdyocMa37LBrN0Na1RqLHq6ElQGi8SpQWYdgufRMOI+gVxzA8Z3Pojkn
         +poMg2FfBbFsuu1s6ANOb+IClPaAuROPN9ZiUk9ulzWf7ODF4CTcUjzmqdAypqWhlMcp
         9+NidNp17lF3B+PkrZMxwLRmEf+aTWWcxH62/SJCWfJBG6DYKmcbea/x+gstACYDHvhp
         R23zcW4+IGOaliaBK9XXM1PyTe5mz7GH7xvQeTFemUQvj4kcME2sCz27BIlC62BZzK+9
         9Q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541584; x=1796146384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2xibGYCW99ZvwUe/lKayob3iHv2iOk1v6WVsVu9rhE=;
        b=fW5nnkQk1NTpp3xfv/TRhuZWu/WCKIDEFYpzjxSvICSD+dakOSaB2hON08kf7VpUo1
         1AI5Rr4ojuqJES5022SYu5v5tmnrU9FbQ9oZPxmc3y7UfSSmNSPlfHj/xuTUsY+RZaly
         0Y9Gaz3D2j6wy/7fEauvMZAUD+8Nj/bh1gyo0ozUHWJLosy0v2BbBOUinJk2bZQqDtz/
         +NE4dXoSjujBUQ+DoQcSqObB4jIDM1Atm86wkJp45pudU2F7++f5xY3658/d13R/Nm4o
         XRUOqNQNDYcFgIJTzY54dLDJese7zh3wtdcpbUflQpXcbJIpQ0A1IfSoVNi7ZefreyAn
         ciKA==
X-Forwarded-Encrypted: i=1; AL+hErHo+nnzdzdiNqkNJuIPetpckC57gOzEJPhCT+vb5CBjDUNhvBR7gkfuPdRJSShkT0UBJzrAyzG+bDFzpR5jexcB@lists.infradead.org
X-Gm-Message-State: APuU4Z+gAYe3hUFK0P5xPhQqiPRuhVpKpJGSgYUG0x7WImSiHmDTYdgT
	mKYQ7Sqrll0v0bmuHAbkmYCixfptLNhIsL9nIxO4xzIsVyoKcK6AF+BFP9Cd0VZApIY=
X-Gm-Gg: AZFdTZeh0gAi2K8df/77hv3BngnenuvXVTaus5MHNS1v6PAPWXix0ZuaBwv0i7afPj7
	oxQ0I+VMVtesAWoWWonA5v+7WoGsBZV8l3HSTJTOIkqQgpaxeh5S1QaMzQy41XE2HhGFIXIF+yF
	UioIZtgM3QUhJQAWt6LIZUFMHBam1tX7xcxH47ULko98HWimMV2gyOF3Z5+SbGvweu8dMSXwZ4e
	RMg8IEFV6HS1y2Y6usfsse35frJ0TcCK63lmpsTRTG5lEKNXtA8YgovkCnLlN1to6ODjHVv9k9e
	z/yADKPHNeB+JV5Pi65paHcFnEU+L0C9GX6wDBxW9wm9T2fI7EYsmPk8dJncAyKnGo9VcoSxFyi
	0uXypa4Pq8kjO2Oy3gdYUF1vhSsCqnLGTcvlTqTbsBFdZ0lHzYwT2CBnoCkwvbfn75m6WMCnmPd
	Da47Vc0Wf7A9YcgsSMgsTJ5mpO39bASki/XzkiJR4I6fMsld1ai74Oq902vegQZ0GRY/QrVo93S
	Es5RiUE0or4oOAks9sfyLMKt43WG9ASn3CHqK3OkkhUDenMf+dCjMPSWo0MqlkwdzeutJo14+Dl
	sRmGtAaqgKtAFU+lzisLe4wjHSA=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr297420805e9.9.1795541583997;
        Tue, 24 Nov 2026 09:33:03 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm832341115e9.4.2026.11.24.09.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:03 -0800 (PST)
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
Subject: [PATCH v13 3/3] pwm: rp1: Register auxiliary device for the fan tachometer
Date: Tue, 24 Nov 2026 18:36:57 +0100
Message-ID: <20261124173658.31030-4-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261124173658.31030-1-andrea.porta@suse.com>
References: <20261124173658.31030-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_173305_941237_9A1C5F4B 
X-CRM114-Status: GOOD (  35.19  )
X-Spam-Score: -0.2 (/)
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
index 69ce0db4e9aa..f7443b9f9fa1 100644
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


