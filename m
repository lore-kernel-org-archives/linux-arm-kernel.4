Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C17606E444
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IM0HKye+;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QuWfU2iq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hDU5mrwQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RHav9j+1EqD2/433Q1hpPIUKH2bJxUn00Cekmi4atDI=; b=IM0HKye+IZz37l
	TAOQ1R7EEnGsQYHG7QpJi2lPcVOrsivofkPWYtKnuBgpQwV3cfM1VDqxIv/VtmbwECRRFnEYXMe1d
	2kCbD/YyqSESTHsdPfMWUhtiRIEz4ar6YOZa00PdbhiCAmxN6dWBchfgvwlsjrx7Gu3axTlh8mCPw
	tYsjZLccsCuvldWFU4EX8NBteGOfdR0Ur4Nx8TdgTnHKjw7s0qp/ouXwSthD0rbl5lOVQ49uxJ/Xu
	jsGssl1Ilnal50B0081fn4QEKPrvR/3XdSFkrIAUGwKLk3xEVip0vZimCxjQ1GfsKFl5knefx6Bbv
	cJeYK1ZROemzvD3ib+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlSm-00000003wi0-2ZLU;
	Tue, 10 Nov 2026 13:00:36 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlSi-00000003wew-2nOU;
	Tue, 10 Nov 2026 13:00:35 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794315628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHav9j+1EqD2/433Q1hpPIUKH2bJxUn00Cekmi4atDI=;
	b=QuWfU2iq5Ppfgd8fEeXGP9sI/Jn6hkFlN4XgDAvZxjadQB3ukU3WSOOiKmERG4qwssHKqI
	Brz3JLJsp1nRcYfZx152gQhZG36YvpVyz9ZZXKPvE2oxHu8nGqOG2jkdywnW1WQvTUTAOl
	jotkaxL2ZhpICj9ntii2nWvzgny08ij4Nu66SUx7GxbdUAgwvpGiF2YerQZdwp4wiSruJu
	dix3zYNDqFYkPw+TiwR6lBPYr6y+4vEE7cRNhqf/4PL2eepsXDcCy5yXAd3tFs8HMug4yw
	xy598KmsbAqmXQzUCTiwNalzJ1KQYGkDJlZ3N5GVAqhkm0WzYClGaScvGZoDew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794315628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHav9j+1EqD2/433Q1hpPIUKH2bJxUn00Cekmi4atDI=;
	b=hDU5mrwQr6Ly3ALllA8c8nfA7zScnAWiCv7/RUoasepkbZCOzALFIuFKCHNyZUX8vezvu/
	gpbg8vyGui2GqHAA==
Date: Tue, 10 Nov 2026 14:00:11 +0100
Subject: [PATCH v6 1/5] firmware: raspberrypi: reorder
 rpi_firmware_property_tag enum
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-rpi-tryboot-v6-1-56f680ef4734@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794315627; l=4711;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=/uVtf3kszhzLO1BlweCr+n2EDaewhQfZuSguFQqGLwA=;
 b=XNnWbHZw/+WI+W5Hz6wnQIkMmDd9LOLkq6r5gekbzuINmmpYQZ1obXzxJy8I3/Q48xzsgeSdT
 vy1ctsdmWrcCAj3L0DATk6tPv0PkKmii+XHULjIca0rhucZCUCAijzY
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_050032_868111_46E5D322 
X-CRM114-Status: UNSURE (   8.28  )
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


