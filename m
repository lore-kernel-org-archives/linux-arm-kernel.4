Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B39606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nT3yZFtS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XK9EVq1v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EDoGPKELBrjjXmAt5YhWl1KjRqEHm9HW5lJDRGwefDk=; b=nT3yZFtSefTNdbsomIe0GWZ3hI
	pUpUICLgCBQN/2wUCdaU/6a90wfa3tjLbQVfBELLv8I/AUi9as9Wzz4rXohEzxn+9xp7LFMqiVUKh
	7mVH/8Pi+y5FX4tx6WMw7BBHvWcGz5h4V3hoSQjRyv5+cshobk+m1nadCRPgQ5oFHjVI8kM6ZSdH7
	wjD68SEeQWKPGr5Z2JqI0rfzScg6j6nIXndmFQgRA0YmVcFNktMPkLxPZLiBaABL7V3LouKWWAphJ
	SC96UndmAh0G94EO3cZsb5TR2JMXVnCHIHmIdZFbtM29n453Qq5voyMqGMtGAshD+6lH4WoiG/yhw
	PzwcqQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsyF-0000000FZIz-0tDk;
	Fri, 27 Nov 2026 10:14:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsxs-0000000FZ4e-0JNc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:14:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1A2A4045E;
	Fri, 27 Nov 2026 10:13:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795774439;
	b=ZIg1sXXBztA7BHyhBylVMJwxpJqrvbyBctmclzAUq4MCrVwFGSd3jRbr5LILCMll5qQ/
	 bpwo9oOAz/Ce/nUtOQq1fOchqn0oFqaQiy753c3FhnCcXHFdD6FBUJERc56azVahjcmkD
	 M21rLwLJUqgAiFmA+4INnUJnJXTk+Nzlh11WKfwac6O8rlLy61ONLm1CPUqLy3GQoM0n7
	 pj1/bWd1fyoYbmMFGyd2J/SUWlWVjLkC3PozdNwnBddzxvsBTTAjtV8jfNhYv0WTU2MWZ
	 d1CE5Y16sLCrFBydlvw/MZTlVm2smjedcqkVgWjZDxWNZXIcOz+a5eWuPfbGTh+K28A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795774439;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EDoGPKELBrjjXmAt5YhWl1KjRqEHm9HW5lJDRGwefDk=;
	b=yYBj8HOBhaf2DQOOZyQiB3Lcrv9QtKHq09p7uhRrGKOc4YUPBUR4rlVaXh5eLUJpLPUr
	 +8qGrOlQtW/vNtwAg5Z3vm34ercqu8PRn8jDM7/5K7dKlSQfNSWq90Z8ywq4UMA4rAg98
	 23XDDZ3ywPTZvtD7qDa8vPC8pe5owy5GKIkPLrJBlGRbOtJMsN6y56BNi9211wuO70ym6
	 msKdx6Cd6hKiHlmtZsIikI3yUtakvB3N+dVaGa+a3jrVr+z7mr5VIlx4MSdDqr5zsu5A2
	 xXXBrIls/OhTh8yT/1WCzr09+PptOCE3I1UHAL6gy13HKjDc/8ZzonmcK/1BUO3g/sg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A89251F02EF3;
	Fri, 27 Nov 2026 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774439;
	bh=EDoGPKELBrjjXmAt5YhWl1KjRqEHm9HW5lJDRGwefDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XK9EVq1vHr5wfU5TBdymL+yGdkPGK8pCHzmWWmxJCpfBlwaRKcRsg+LRx3YTX1BAx
	 tg6+CWwSmYY6IyASX+1NeCqmAoUza8gip1ujGaYH00Tdz4AjIJWfWHF00t8swNSs7a
	 yfPs8/UAP1O8/sa/fqFZO+sZburwz53WPqElNdGxe9S150xbSegXBkJFKmzkluL493
	 0RzedI/cvi5P0x2RinvQGk3VM/GUOo4bWHD81OsaUq/0lBM7vWPfrYOE4mAZgIFysr
	 U/7nc3i9Xh0C/LFyz6t6QYPv6bRRkUcGGQbqY0lqL9oBw/N46kaH9YhHVZ8NOM2Dj5
	 j2ESg5V6HrLig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 752204B71F;
	Fri, 27 Nov 2026 10:13:23 +0000 (UTC)
From: Yuugo Yoneda via B4 Relay <devnull+yogo.0917.sabu.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 19:13:14 +0900
Subject: [PATCH RFC v3 13/13] ARM: configs: add at550_defconfig
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-at550-rfc-v1-v3-13-f2221008912b@gmail.com>
References: <20261127-at550-rfc-v1-v3-0-f2221008912b@gmail.com>
In-Reply-To: <20261127-at550-rfc-v1-v3-0-f2221008912b@gmail.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, soc@lists.linux.dev, 
 Yuugo Yoneda <yogo.0917.sabu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795774399; l=2043;
 i=yogo.0917.sabu@gmail.com; s=ypl514-20261117; h=from:subject:message-id;
 bh=pMke0imoJchV0ULfBw7Dw5Vuko1MgRapuxPRcWPCC48=;
 b=zMJwS0lv8mcBI7AYpmpaqrquKzjeAZI3uguikK975Yp28PPKDhaomZuGnisdZ+dwqg7z4AD5J
 0vLozBuiDxxCoxOKuFIGEUQD3bJg0yAnV9JXxQZhZVCKb1kL9dvuycl
X-Developer-Key: i=yogo.0917.sabu@gmail.com; a=ed25519;
 pk=TIQ8Tk4xQrxyn8rmk3GI2f5qg/kO6g2KZm7YOOyBHeg=
X-Endpoint-Received: by B4 Relay for
 yogo.0917.sabu@gmail.com/ypl514-20261117 with auth_id=1550
X-Original-From: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: yogo.0917.sabu@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yuugo Yoneda <yogo.0917.sabu@gmail.com>

Add a minimal defconfig for the SiRF AT550 / YPL514si enabling
ARCH_MULTI_V6, ARCH_AT550, FB_SIMPLE, TOUCHSCREEN_AT550,
MMC_SDHCI_AT550, and VFAT/initramfs support while disabling
ARCH_MULTI_V7 and unvalidated SUSPEND.

Signed-off-by: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
---
 MAINTAINERS                      |  1 +
 arch/arm/configs/at550_defconfig | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c6f0f3fb6..d5a7e78ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25857,6 +25857,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/sirf,at550-intc.yaml
 F:	Documentation/devicetree/bindings/mmc/sirf,at550-sdhci.yaml
 F:	Documentation/devicetree/bindings/timer/sirf,at550-timer.yaml
 F:	arch/arm/boot/dts/sirf/at550*
+F:	arch/arm/configs/at550_defconfig
 F:	arch/arm/mach-at550/
 F:	drivers/clocksource/timer-at550.c
 F:	drivers/input/touchscreen/at550-ts.c
diff --git a/arch/arm/configs/at550_defconfig b/arch/arm/configs/at550_defconfig
new file mode 100644
index 000000000..95d32f2c9
--- /dev/null
+++ b/arch/arm/configs/at550_defconfig
@@ -0,0 +1,35 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_ARCH_MULTI_V6=y
+# CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_AT550=y
+# CONFIG_SUSPEND is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_AT550=y
+CONFIG_FB=y
+CONFIG_FB_SIMPLE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_AT550=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y

-- 
2.56.1



