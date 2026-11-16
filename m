Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3F5606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=giYoVuiQ;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kKQ06HKN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Tf9Ymynv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RHav9j+1EqD2/433Q1hpPIUKH2bJxUn00Cekmi4atDI=; b=giYoVuiQju7JYI
	WKL9a4J6QgbPQb3sbnJ4IcyE9nJwykQSU9D6jZkKUkSc+ZMOslHKGExp8000g4sZbYvOl9wUUBY6G
	ZRXaQN6+l3TLpX2ezQD9Q5fg/Q5ICpjH3T50e/gO1zvd8ctFzw4SOrgtwv4XAdZgw3nW7/HKNoyQr
	JbGHY5Vcs6pKF0NyXiv3MPY1KyHJYGlxpig12frV30TBXfZoR/PD4knjHQXXK+zJRwPMEpMkAA1yS
	jqPBksM7Me6R5fXQRrpoi1GJiaGRgsny3wr8AwHsCrpKehbekusje8KcZk9kr8zx2YTv0AvrhtoVb
	6yN6RrYxL+2dWSNve3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStfu-00000001u9R-1VmJ;
	Mon, 16 Nov 2026 10:11:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStfr-00000001u5p-1FE3;
	Mon, 16 Nov 2026 10:10:56 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794823850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHav9j+1EqD2/433Q1hpPIUKH2bJxUn00Cekmi4atDI=;
	b=kKQ06HKN4X7Lbo7FJtE1fBApGRDo/wSHWAYGuWr2TZ/MwditnjUXLr6MZKlNaxFC3l18yO
	SYmfgv1PvXD9+A8/kDE4cC4p17xsixDGYua8fcTn8uoU8z5kkftFHR9cuejfoyf3f+4OBO
	hUL/D3QcBFZWRVeXK/37fzirG1u2oVyJIGyJOPVlJI0sZ3E7yUSKj3gPHziZSEwLBEBXIa
	CEUE4t+GtGVkwM2QcTQP4baaPSh3JqtkirOro3uzJAK8xW5FMq3ucRzVZpZfzNA6JeEPfz
	FWSFxq2YVuZ59j4aRGUXd7JEPbpm0LhF9URxFVsJ7R8s6SZJPEXNhFMm+4+uDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794823850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHav9j+1EqD2/433Q1hpPIUKH2bJxUn00Cekmi4atDI=;
	b=Tf9Ymynv8ykD+wMIEvRax1nLCINaJrzHT4F+DuVqtaT1gzXKBgy7KHtCH+q501dUsMq8U0
	tJ72YPx8lNAMZaCA==
Date: Mon, 16 Nov 2026 11:10:25 +0100
Subject: [PATCH v10 01/12] firmware: raspberrypi: reorder
 rpi_firmware_property_tag enum
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-rpi-otp-driver-v10-1-15302dcfd5e1@linutronix.de>
References: <20261116-rpi-otp-driver-v10-0-15302dcfd5e1@linutronix.de>
In-Reply-To: <20261116-rpi-otp-driver-v10-0-15302dcfd5e1@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794823848; l=4711;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=/uVtf3kszhzLO1BlweCr+n2EDaewhQfZuSguFQqGLwA=;
 b=ACXQD5qWjiXA7C2mcDCfZgdMeB8QiKDdbSL5EYxGLXVgNuznrjDHCswXrd1gOkXpSx53KwPf8
 8sVvxCUj18sBx7+91/ubGtBPn3ykWEym+leQpI18AdYIhPYGRuDbLsC
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_021055_491813_58ADB8C4 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The enum was once ordered by tag values. The later added tags were added
in a different order. Reorder the tags again.

No functional change intended.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 8c3d43977a031..5a0cbb18d0b6c 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -72,9 +72,16 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_EDID_BLOCK =                         0x00030020,
 	RPI_FIRMWARE_GET_CUSTOMER_OTP =                       0x00030021,
 	RPI_FIRMWARE_GET_DOMAIN_STATE =                       0x00030030,
+	RPI_FIRMWARE_GET_GPIO_STATE =                         0x00030041,
+	RPI_FIRMWARE_GET_GPIO_CONFIG =                        0x00030043,
+	RPI_FIRMWARE_GET_PERIPH_REG =                         0x00030045,
 	RPI_FIRMWARE_GET_THROTTLED =                          0x00030046,
 	RPI_FIRMWARE_GET_CLOCK_MEASURED =                     0x00030047,
 	RPI_FIRMWARE_NOTIFY_REBOOT =                          0x00030048,
+	RPI_FIRMWARE_GET_POE_HAT_VAL =                        0x00030049,
+	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
+	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
+	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
@@ -82,17 +89,10 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_SET_TURBO =                              0x00038009,
 	RPI_FIRMWARE_SET_CUSTOMER_OTP =                       0x00038021,
 	RPI_FIRMWARE_SET_DOMAIN_STATE =                       0x00038030,
-	RPI_FIRMWARE_GET_GPIO_STATE =                         0x00030041,
 	RPI_FIRMWARE_SET_GPIO_STATE =                         0x00038041,
 	RPI_FIRMWARE_SET_SDHOST_CLOCK =                       0x00038042,
-	RPI_FIRMWARE_GET_GPIO_CONFIG =                        0x00030043,
 	RPI_FIRMWARE_SET_GPIO_CONFIG =                        0x00038043,
-	RPI_FIRMWARE_GET_PERIPH_REG =                         0x00030045,
 	RPI_FIRMWARE_SET_PERIPH_REG =                         0x00038045,
-	RPI_FIRMWARE_GET_POE_HAT_VAL =                        0x00030049,
-	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
-	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
-	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_SET_RTC_REG =                            0x00038087,
 
 	/* Dispmanx TAGS */
@@ -109,7 +109,6 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_FRAMEBUFFER_GET_PALETTE =                0x0004000b,
 	RPI_FIRMWARE_FRAMEBUFFER_GET_TOUCHBUF =               0x0004000f,
 	RPI_FIRMWARE_FRAMEBUFFER_GET_GPIOVIRTBUF =            0x00040010,
-	RPI_FIRMWARE_FRAMEBUFFER_RELEASE =                    0x00048001,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_PHYSICAL_WIDTH_HEIGHT = 0x00044003,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_VIRTUAL_WIDTH_HEIGHT =  0x00044004,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_DEPTH =                 0x00044005,
@@ -119,6 +118,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_OVERSCAN =              0x0004400a,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_PALETTE =               0x0004400b,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_VSYNC =                 0x0004400e,
+	RPI_FIRMWARE_FRAMEBUFFER_RELEASE =                    0x00048001,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_PHYSICAL_WIDTH_HEIGHT =  0x00048003,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_VIRTUAL_WIDTH_HEIGHT =   0x00048004,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_DEPTH =                  0x00048005,
@@ -127,10 +127,10 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_FRAMEBUFFER_SET_VIRTUAL_OFFSET =         0x00048009,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_OVERSCAN =               0x0004800a,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_PALETTE =                0x0004800b,
-	RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF =               0x0004801f,
-	RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF =            0x00048020,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_VSYNC =                  0x0004800e,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_BACKLIGHT =              0x0004800f,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF =               0x0004801f,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF =            0x00048020,
 
 	RPI_FIRMWARE_VCHIQ_INIT =                             0x00048010,
 

-- 
2.47.3


