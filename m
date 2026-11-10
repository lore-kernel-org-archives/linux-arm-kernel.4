Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD95606A7C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S+4/kFpW;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Y/dHatnd;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sCe4OyFB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ay6vWD2zi4p8jnzpFR5chjGsTnlEvy9gzBG4rU0Nmg4=; b=S+4/kFpW2L0uU3
	M1h03PuepMQkfOQ5NiFiWpE8tdGAJ7M6gYo38KQ6yyAJxjvjr7vyure94Bz1ESNkUOYuf6oMB7oVP
	YxPeakPCak+MT2uHyFBKwykahAHC+Z7iZpr9wD+MPj4Yc1OwmayElvzhPUlhzc2sGIfOXtHWEzjjj
	LXc0ziBYPpHTktFhwduOQKVB0wyZCrzMXfEk6/YUerymqvjnLS71b/cGf3W010u/JHlY/G6xOnISE
	Bv/9LhmC0/k6dIGWaWFqT/nDH5M4KrM8d14oj/czf2UGfcew+vsLmyclh6v2EOmMSRUmag6hnJjLQ
	JpTvtrgqGpHQnQA68IOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlT0-00000003woe-2VBF;
	Tue, 10 Nov 2026 13:00:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlSj-00000003wf0-1W80;
	Tue, 10 Nov 2026 13:00:35 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794315629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ay6vWD2zi4p8jnzpFR5chjGsTnlEvy9gzBG4rU0Nmg4=;
	b=Y/dHatndVjSbJm/Noc3Zm00xavqcA28/4CKm8ffJuh6goUUcA740bS0OmrjVXs8jEzUe6z
	llw+I2WKNE9djAoquSdNbHYvdwnxSI4ZDY8m9OLc6M3eMoymdCyEDKsJacsfyk1ZkY7pC5
	ZcuLOy1ZyHlItTsqnIZ5gbM7ZyzA3NNi68W2ueU7DrnRwKP4bE5l2kxrOPBCn/06O3TD25
	GYG6nRlUstd+yG3SsMlZtzHzm5Y0VFZGTf5BaoafHHT9KUEDJ/7neOsB6/LnMbVGvtC2Uw
	VVRDJjxGfA26H3u/Ci1gsJxEuKDAeCWT7SvZTHvoNcFi6F+HEf8wx4HrDigeFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794315629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ay6vWD2zi4p8jnzpFR5chjGsTnlEvy9gzBG4rU0Nmg4=;
	b=sCe4OyFBiyazCLSMjY6teq5w1zJbD5PGQFWH4Y26Lbcna2gbBAkG1lxVEekDFzxcUXBScn
	Qxen0VNYrxeIYaBA==
Date: Tue, 10 Nov 2026 14:00:13 +0100
Subject: [PATCH v6 3/5] firmware: raspberrypi: Add reboot mode support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-rpi-tryboot-v6-3-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de>
In-Reply-To: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794315627; l=5746;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=aDdenUs6EBEfCsBy5QHSM4GJtsSkWM/+EmSTHKmep9E=;
 b=eCLDJ2Td63ug2/ZweV7k1t8v+BD5OaGVlaobAXvfFUqmSsx0LXgGEWzxNSLqUxoaNG1Jrknxa
 /EGzYyTJQ19AoZyEBma/fvVOzJXKb11tfHURkh0W4v32xZAMimMqW29
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_050033_561613_A519E66E 
X-CRM114-Status: GOOD (  20.45  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Raspberry Pi firmware has a tryboot mode where it tries to boot from
another partition. This can be used to create a A/B update scheme.

To enable this on the next boot, the RPI_FIRMWARE_SET_REBOOT_FLAGS
message must be sent to the firmware. Add support for this by
registering a reboot mode driver.

Furthermore, safely registering the reboot mode requires adjusting the
teardown sequence. Replace the manually called rpi_firmware_put() with a
devres-managed called (devm_add_action_or_reset). Without this, the
cleanup function of devm_reboot_mode_register() would trigger a
use-after-free error by attempting to access the firmware context after
it had already been freed by rpi_firmware_remove().

Tested-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 drivers/firmware/Kconfig                   |  2 ++
 drivers/firmware/raspberrypi.c             | 40 ++++++++++++++++++++++++++----
 include/soc/bcm2835/raspberrypi-firmware.h |  2 ++
 3 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 43e2e2a645945..0de884adf0b66 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -142,6 +142,8 @@ config RASPBERRYPI_FIRMWARE
 	depends on ARM || ARM64
 	depends on MAILBOX
 	default ARCH_BCM2835
+	select POWER_RESET
+	select REBOOT_MODE
 	help
 	  This option enables support for communicating with the firmware on the
 	  Raspberry Pi.
diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 443459c8c90fa..95eb3183ce37d 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/reboot-mode.h>
 #include <linux/slab.h>
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
@@ -30,6 +31,7 @@ struct rpi_firmware {
 	struct mbox_client cl;
 	struct mbox_chan *chan; /* The property channel. */
 	struct completion c;
+	struct reboot_mode_driver reboot_mode;
 	u32 enabled;
 
 	struct kref consumers;
@@ -294,10 +296,37 @@ static void devm_rpi_firmware_put(void *data)
 	rpi_firmware_put(fw);
 }
 
+static int rpi_firmware_reboot_mode_write(struct reboot_mode_driver *reboot,
+					  unsigned int magic)
+{
+	struct rpi_firmware *fw = container_of(reboot, struct rpi_firmware,
+					       reboot_mode);
+	__le32 fw_magic = cpu_to_le32(magic);
+
+	if (!magic)
+		return 0;
+
+	return rpi_firmware_property(fw, RPI_FIRMWARE_SET_REBOOT_FLAGS,
+				     &fw_magic, sizeof(fw_magic));
+}
+
+static void rpi_register_reboot_mode(struct device *dev, struct rpi_firmware *fw)
+{
+	int ret;
+
+	fw->reboot_mode.dev = dev;
+	fw->reboot_mode.write = rpi_firmware_reboot_mode_write;
+	ret = devm_reboot_mode_register(dev, &fw->reboot_mode);
+	if (ret)
+		dev_err(dev, "Failed to register reboot mode: %d\n", ret);
+
+}
+
 static int rpi_firmware_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpi_firmware *fw;
+	int ret;
 
 	/*
 	 * Memory will be freed by rpi_firmware_delete() once all users have
@@ -313,7 +342,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	fw->chan = mbox_request_channel(&fw->cl, 0);
 	if (IS_ERR(fw->chan)) {
-		int ret = PTR_ERR(fw->chan);
+		ret = PTR_ERR(fw->chan);
 		kfree(fw);
 		return dev_err_probe(dev, ret, "Failed to get mbox channel\n");
 	}
@@ -321,12 +350,17 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	init_completion(&fw->c);
 	kref_init(&fw->consumers);
 
+	ret = devm_add_action_or_reset(dev, devm_rpi_firmware_put, fw);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, fw);
 
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev);
 	rpi_register_rtc_driver(dev);
+	rpi_register_reboot_mode(dev, fw);
 
 	return 0;
 }
@@ -343,16 +377,12 @@ static void rpi_firmware_shutdown(struct platform_device *pdev)
 
 static void rpi_firmware_remove(struct platform_device *pdev)
 {
-	struct rpi_firmware *fw = platform_get_drvdata(pdev);
-
 	platform_device_unregister(rpi_hwmon);
 	rpi_hwmon = NULL;
 	platform_device_unregister(rpi_clk);
 	rpi_clk = NULL;
 	platform_device_unregister(rpi_rtc);
 	rpi_rtc = NULL;
-
-	rpi_firmware_put(fw);
 }
 
 static const struct of_device_id rpi_firmware_of_match[] = {
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 5a0cbb18d0b6c..20141eb2cb678 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -81,6 +81,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_POE_HAT_VAL =                        0x00030049,
 	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
 	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
+	RPI_FIRMWARE_GET_REBOOT_FLAGS =                       0x00030064,
 	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
@@ -93,6 +94,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_SET_SDHOST_CLOCK =                       0x00038042,
 	RPI_FIRMWARE_SET_GPIO_CONFIG =                        0x00038043,
 	RPI_FIRMWARE_SET_PERIPH_REG =                         0x00038045,
+	RPI_FIRMWARE_SET_REBOOT_FLAGS =                       0x00038064,
 	RPI_FIRMWARE_SET_RTC_REG =                            0x00038087,
 
 	/* Dispmanx TAGS */

-- 
2.47.3


