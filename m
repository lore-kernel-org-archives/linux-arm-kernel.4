Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20461606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=opJ/pdHY;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Ch5vTT/u;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=HCEJlHhP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ezFqtxLTIBFIG8G1txYl6cMQ0D5n/RwqQ2a2PuxKgEk=; b=opJ/pdHYBloXDh
	Bfb4LfqSTr72UXu1L5HNquUMv2LPHnm2pt3fT81eNCVNvYBgAPR968FiNnHW+4IgYR6+GvVYh3xqE
	bAGAX9hTYBV9Au06PVAfWe7DHpFzZxULA9lOLQJdqiWZfKUiqlVLsrt9DP/faRUKKpFlIVSr2Jq7w
	OBJR7rLk0RISqJYD+SFUWhZYAxWGonlkuQi71DCPHOWZ9wHodZ7axWBg/ztEZD1QfLT3OhY8lDnyP
	5OcSbb2ORpxvOGkBdtv2cKe5hGAIym8GqciapSPvKsok190eSiuyBbofjmXV3ARmFgAJSlObjn5aK
	fmWIcDMJYrfs2lUXRDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQonu-00000004YAZ-1nND;
	Tue, 10 Nov 2026 16:34:38 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQonW-00000004XsS-3wnF;
	Tue, 10 Nov 2026 16:34:17 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794328452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ezFqtxLTIBFIG8G1txYl6cMQ0D5n/RwqQ2a2PuxKgEk=;
	b=Ch5vTT/uTjXS6fKeBKAyB9GTRNylD45HtylRUgIp6rQKffOctXpsmrrz72RP423hxSD4x6
	oezWGNZwp2pmDxJEjcwuDkkPj26Ft4+/mqRBgdMMybneeSsBSR/au21Sv3YfGu3W7iM/o2
	y2rALEPyEqgNWv6DNQtT8u3jcxbJYURNn7cUVDSB/HM7EXzmO62Fs6c9WoyIPkWtNYDClj
	u2fSOXORH+MythTq3Ld8wXhbRDHqVCNCEr+x3h9nVLLbFXt3HehKoOPr/emwBEO5UR2wKm
	T2sg4kXaqqb9GlLCr1YYgal4pJmvufz4qpXttDMoms7YGpk07J1Lty6yeHj0kw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794328452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ezFqtxLTIBFIG8G1txYl6cMQ0D5n/RwqQ2a2PuxKgEk=;
	b=HCEJlHhPpQTAGHD6WkVj+lDw3hO9CxUdGYdOjfrv6dtOAtvA79fwN+/Ua43sgoCc7PKyls
	Ms6gwrRawoq+hdCg==
Date: Tue, 10 Nov 2026 17:34:05 +0100
Subject: [PATCH v8 06/12] firmware: raspberrypi: register nvmem driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261110-rpi-otp-driver-v8-6-797e0577d414@linutronix.de>
References: <20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de>
In-Reply-To: <20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794328449; l=4414;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=YNBRPkvZhndKwpMu8ZxY1514Y/y9TgfpND27yu3L9nU=;
 b=1YfsA55wvA2OA6t6hrf4vINCmJQbnvn/VtYTSvGg7g/rkpeCxmRvHozYpgipk/h0usLkITR5s
 Ylsqwqjv8p6DjgP5cNiIXqD8e6Nr3LD7BPE+xfgMAGpwopdwpB8huPW
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_083415_134277_2ED8DC71 
X-CRM114-Status: GOOD (  15.59  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Raspberry Pi firmware exposes two regions with otp registers. The
first region called "customer otp" is available on all Raspberry Pi
models. The second is only available on the Raspberry Pi 5 (bcm2712).

Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 drivers/firmware/raspberrypi.c             | 59 +++++++++++++++++++++++++++++-
 include/soc/bcm2835/raspberrypi-firmware.h |  5 +++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 443459c8c90fa..755f845754c1c 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -25,12 +25,15 @@
 static struct platform_device *rpi_hwmon;
 static struct platform_device *rpi_clk;
 static struct platform_device *rpi_rtc;
+static struct platform_device *rpi_otp_customer;
+static struct platform_device *rpi_otp_private;
 
 struct rpi_firmware {
 	struct mbox_client cl;
 	struct mbox_chan *chan; /* The property channel. */
 	struct completion c;
 	u32 enabled;
+	enum rpi_firmware_soc soc;
 
 	struct kref consumers;
 };
@@ -252,6 +255,47 @@ static void rpi_register_rtc_driver(struct device *dev)
 	rpi_rtc = pdev;
 }
 
+static const struct rpi_otp_driver_data rpi_otp_customer_data = {
+	.name = "rpi-otp-customer",
+	.read_tag = RPI_FIRMWARE_GET_CUSTOMER_OTP,
+	.write_tag = RPI_FIRMWARE_SET_CUSTOMER_OTP,
+	.size = 32,
+	.root_only = false,
+};
+
+static const struct rpi_otp_driver_data rpi_otp_private_data = {
+	.name = "rpi-otp-private",
+	.read_tag = RPI_FIRMWARE_GET_PRIVATE_OTP,
+	.write_tag = RPI_FIRMWARE_SET_PRIVATE_OTP,
+	.size = 32,
+	.root_only = true,
+};
+
+static void rpi_register_otp_driver(struct device *dev)
+{
+	struct rpi_firmware *fw = dev_get_drvdata(dev);
+
+	rpi_otp_customer = platform_device_register_data(dev, "raspberrypi-otp",
+							 PLATFORM_DEVID_AUTO,
+							 &rpi_otp_customer_data,
+							 sizeof(rpi_otp_customer_data));
+
+	if (IS_ERR(rpi_otp_customer))
+		dev_err(dev, "Failed to register customer OTP device: %pe\n",
+			rpi_otp_customer);
+
+	if (fw->soc == RPI_FIRMWARE_SOC_BCM2712) {
+		rpi_otp_private = platform_device_register_data(dev, "raspberrypi-otp",
+								PLATFORM_DEVID_AUTO,
+								&rpi_otp_private_data,
+								sizeof(rpi_otp_private_data));
+
+		if (IS_ERR(rpi_otp_private))
+			dev_err(dev, "Failed to register private OTP device: %pe\n",
+				rpi_otp_private);
+	}
+}
+
 unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
 {
 	struct rpi_firmware_clk_rate_request msg =
@@ -320,6 +364,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	init_completion(&fw->c);
 	kref_init(&fw->consumers);
+	fw->soc = (uintptr_t)device_get_match_data(dev);
 
 	platform_set_drvdata(pdev, fw);
 
@@ -327,6 +372,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev);
 	rpi_register_rtc_driver(dev);
+	rpi_register_otp_driver(dev);
 
 	return 0;
 }
@@ -351,12 +397,23 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	rpi_clk = NULL;
 	platform_device_unregister(rpi_rtc);
 	rpi_rtc = NULL;
+	platform_device_unregister(rpi_otp_customer);
+	rpi_otp_customer = NULL;
+	platform_device_unregister(rpi_otp_private);
+	rpi_otp_private = NULL;
 
 	rpi_firmware_put(fw);
 }
 
 static const struct of_device_id rpi_firmware_of_match[] = {
-	{ .compatible = "raspberrypi,bcm2835-firmware", },
+	{
+		.compatible = "raspberrypi,bcm2835-firmware",
+		.data = (void *)RPI_FIRMWARE_SOC_BCM2835,
+	},
+	{
+		.compatible = "raspberrypi,bcm2712-firmware",
+		.data = (void *)RPI_FIRMWARE_SOC_BCM2712,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, rpi_firmware_of_match);
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 96ddf886d579e..2fb1ef2a33141 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -9,6 +9,11 @@
 #include <linux/types.h>
 #include <linux/of_device.h>
 
+enum rpi_firmware_soc {
+	RPI_FIRMWARE_SOC_BCM2835,
+	RPI_FIRMWARE_SOC_BCM2712,
+};
+
 struct rpi_firmware;
 
 enum rpi_firmware_property_status {

-- 
2.47.3


