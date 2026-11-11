Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD45C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4LxYgOrB;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UeLkaWmA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fycGytev8DUZq55l3Le/OWa258btyHNUHhMF9gTnXX8=; b=4LxYgOrBKsLq5soKYCWL0btA7g
	Auo9Jp68iz+GbXDdJSTstJC2qpRKvUp4dB4L5wxQBD8JzSX/R4fVzlSIXm2wn79qBoiqCpDMwCrR6
	SUrV+XvP2LlO0oRXpkat0gFeDOqF0W59FwMx5eUzdICccxZP0550RTyhTeiDCNPxtx27Pa2FAIy3B
	Na7TVA0dr6RN2bQBDm5OvKlAPT0DSPnCoIbNFS0HjFvUcnkX2vRK6gNJeWrJFYwswiYOYCMLM4raB
	wm9Y5nf0cXpTpaQp3Po3IWHq8BmmihzM8Qxmysw04pglmOLdI072W/EjP42grEkY/n6iHzDXZuFDG
	fpHp0ERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tq-00000006YXF-2Ptt;
	Wed, 11 Nov 2026 11:53:58 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tW-00000006YFN-3tuG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:53:41 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4afef353dd2so30819565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398016; x=1795002816; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fycGytev8DUZq55l3Le/OWa258btyHNUHhMF9gTnXX8=;
        b=UeLkaWmA1k6h8NS4gEEufE5YbXUhI5EuOw5OZtZ4ijY/f7DCsmvq7qpTJ174dr41a4
         38uZAbiRO9ZVtYqnB5GTyhwQzlhsd5kkbNi2JS7O1B8VQuF5hAq71MzhmqFxhzZfkSmQ
         qsy1xJfrVxiBggeOgAvbvgAc0vRN5PjzaDRRcWapIi91aSn6fr5x0ZpN1uBEAtxRu2XA
         Rh0c+YCTaXpPJQAyPTn44BxIwnXzogOp7ZbaN1HyZ4INi7Q8eQ6EtcViKAtxFCMKbx2Q
         pquJCZ/2LBcbaw7U5ZeVco+7iZGZj32SwiTXmwiBaqY5JAy795KQZ77ihMN4nWR3T53v
         Uk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398016; x=1795002816;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fycGytev8DUZq55l3Le/OWa258btyHNUHhMF9gTnXX8=;
        b=xD4h/i/dHintSfEQ9Z1EFfERYWDiltR66Yl/petodw91oyOfIandy+fQtmcV/a12PH
         dKkCalf8wsB45iTXMyWY1DjFSyBtz9IKs8+TNrjJdf4vtXiucgmqQwokfpge947xrXK0
         jzblz0vgPR+/ZcnkbEqNCwHvFnbdt28w85V0saWOfVPTudcgwbqP8m9IaQcPGsUkc1wG
         zn0nTwXyqnXeESL2okKx7P6DQOd96Lk+zdhpJDT/VGEeA9Zo1OcGB2z0BeofNsnyU+4l
         gOb+mnGvC57Q5DmuchsWgRwpa1hWFj1ViLnMbBqKREv4Nj1LeECcYSsim18u6X7uF9es
         kJ0Q==
X-Gm-Message-State: APuU4Z/R6myzKxRGpZhr5/+Rri+WeyJTLfNyKebZ+Y6kKOKQoH0XHle+
	4QUR4m7OyxwAXw25kBPnLvk7iKC9FtzrdPq9UiJtVdGbevq8tCNDc8qx2oocrg+fBHJWnnIMZgI
	xqtaARUIWng18hrFpy3g/EEIqrQS2yQ+BIZYM7+CNe5eDYB7Co8vP3w9XtjM2ByrTXDtTH8836x
	dvxEnJGb+yp7olymPG67wVDbE9fVtkvZtBAq5RtsPkmLNq
X-Received: from wrvq9.prod.google.com ([2002:a5d:61c9:0:b0:493:1d71:a33b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b34:b0:4ba:e7:ef3d
 with SMTP id 5b1f17b1804b1-4ba09321cbemr38474725e9.1.1794398015487; Wed, 11
 Nov 2026 03:53:35 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:11 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=7732; i=ardb@kernel.org;
 h=from:subject; bh=vEifE26AS3zu1sQi6+/6WGu/UJ+KC2fGJ9uVGFo84ZI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuKbCb+Urpn0qaffu+mosOnJklqrE90sHzud855rQd
 7WYuzmno5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEyEu4mRYVV5XEhBl1JpvUX9
 jfC7k31OLly60+uwvz4fw619f2N/7GL4ZxXcFiI6V9Xkb5QQX8DNLUrX1c0TA5q+L+2887f91Le T/AA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-16-ardb+git@google.com>
Subject: [PATCH 7/7] platform: arm64: lenovo-yoga-c630: Expose the keyboard
 backlight as an LED
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_035339_065471_D06C8686 
X-CRM114-Status: GOOD (  23.02  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

The EC turns the keyboard backlight on and off as Fn+Space is pressed,
cycling through two brightness levels, which the EC registers do not
seem to reflect. However, bit 0 of EC register 0x03 reflects whether
the backlight is on, and setting or clearing it, using the EC's register
write command (0xb1, as used by the DSDT's ECNW method), turns the
backlight on at the selected brightness level, or off.

Expose this as a platform::kbd_backlight LED with a maximum brightness
of 1, so that userspace can turn off the keyboard backlight, e.g., when
the system is idle. Whenever the EC raises an event, check whether the
backlight was turned on or off, and report any such change through
brightness_hw_changed, in case the EC raises an event when Fn+Space is
pressed.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/platform/arm64/Kconfig            |   4 +-
 drivers/platform/arm64/lenovo-yoga-c630.c | 121 +++++++++++++++++++-
 2 files changed, 120 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 2a84775a13a9..44d5a749f764 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -75,10 +75,12 @@ config EC_LENOVO_YOGA_C630
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on I2C
 	select AUXILIARY_BUS
+	select LEDS_CLASS
+	select NEW_LEDS
 	help
 	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
 	  Lenovo Yoga C630, which provides battery and power adapter
-	  information.
+	  information, and access to the keyboard backlight.
 
 	  This driver provides battery and AC status support for the mentioned
 	  laptop where this information is not properly exposed via the
diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index 2776063bfb58..7f49067ec6b7 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -6,12 +6,14 @@
  *    Dmitry Baryshkov
  */
 #include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/leds.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -27,14 +29,20 @@
 #define LENOVO_EC_UCSI_READ		0x21
 
 #define LENOVO_EC_READ_REG		0xb0
+#define LENOVO_EC_WRITE_REG		0xb1
 #define LENOVO_EC_REQUEST_NEXT_EVENT	0x84
 
 #define LENOVO_EC_UCSI_VERSION		0x20
 
+#define LENOVO_EC_KBD_BACKLIGHT_REG	0x03
+#define LENOVO_EC_KBD_BACKLIGHT_ON	BIT(0)
+
 struct yoga_c630_ec {
 	struct i2c_client *client;
 	struct mutex lock;
 	struct blocking_notifier_head notifier_list;
+	struct led_classdev kbd_backlight;
+	enum led_brightness kbd_backlight_brightness;
 };
 
 static int yoga_c630_ec_request(struct yoga_c630_ec *ec, u8 *req, size_t req_len,
@@ -53,21 +61,27 @@ static int yoga_c630_ec_request(struct yoga_c630_ec *ec, u8 *req, size_t req_len
 					     resp_len, resp);
 }
 
-int yoga_c630_ec_read8(struct yoga_c630_ec *ec, u8 addr)
+static int __yoga_c630_ec_read8(struct yoga_c630_ec *ec, u8 addr)
 {
-	u8 req[2] = { LENOVO_EC_READ_REG, };
+	u8 req[2] = { LENOVO_EC_READ_REG, addr };
 	int ret;
 	u8 val;
 
-	guard(mutex)(&ec->lock);
+	lockdep_assert_held(&ec->lock);
 
-	req[1] = addr;
 	ret = yoga_c630_ec_request(ec, req, sizeof(req), &val, 1);
 	if (ret < 0)
 		return ret;
 
 	return val;
 }
+
+int yoga_c630_ec_read8(struct yoga_c630_ec *ec, u8 addr)
+{
+	guard(mutex)(&ec->lock);
+
+	return __yoga_c630_ec_read8(ec, addr);
+}
 EXPORT_SYMBOL_GPL(yoga_c630_ec_read8);
 
 int yoga_c630_ec_read16(struct yoga_c630_ec *ec, u8 addr)
@@ -97,6 +111,31 @@ int yoga_c630_ec_read16(struct yoga_c630_ec *ec, u8 addr)
 }
 EXPORT_SYMBOL_GPL(yoga_c630_ec_read16);
 
+/*
+ * Update the bits in @mask of EC register @addr to those in @val. Return the
+ * previous value of the register, or a negative error code.
+ */
+static int yoga_c630_ec_update_bits(struct yoga_c630_ec *ec, u8 addr, u8 mask,
+				    u8 val)
+{
+	u8 req[3] = { LENOVO_EC_WRITE_REG, addr, };
+	int old, ret;
+
+	guard(mutex)(&ec->lock);
+
+	old = __yoga_c630_ec_read8(ec, addr);
+	if (old < 0 || (old & mask) == (val & mask))
+		return old;
+
+	req[2] = (old & ~mask) | (val & mask);
+	ret = i2c_smbus_write_i2c_block_data(ec->client, LENOVO_EC_REQUEST_REG,
+					     sizeof(req), req);
+	if (ret < 0)
+		return ret;
+
+	return old;
+}
+
 u16 yoga_c630_ec_ucsi_get_version(struct yoga_c630_ec *ec)
 {
 	u8 req[3] = { 0xb3, 0xf2, };
@@ -148,6 +187,73 @@ int yoga_c630_ec_ucsi_read(struct yoga_c630_ec *ec,
 }
 EXPORT_SYMBOL_GPL(yoga_c630_ec_ucsi_read);
 
+static enum led_brightness
+yoga_c630_ec_kbd_backlight_get(struct led_classdev *led_cdev)
+{
+	struct yoga_c630_ec *ec = container_of(led_cdev, struct yoga_c630_ec,
+					       kbd_backlight);
+	int val;
+
+	val = yoga_c630_ec_read8(ec, LENOVO_EC_KBD_BACKLIGHT_REG);
+	if (val < 0)
+		return val;
+
+	return val & LENOVO_EC_KBD_BACKLIGHT_ON ? LED_ON : LED_OFF;
+}
+
+static int yoga_c630_ec_kbd_backlight_set(struct led_classdev *led_cdev,
+					  enum led_brightness brightness)
+{
+	struct yoga_c630_ec *ec = container_of(led_cdev, struct yoga_c630_ec,
+					       kbd_backlight);
+	int old;
+
+	old = yoga_c630_ec_update_bits(ec, LENOVO_EC_KBD_BACKLIGHT_REG,
+				       LENOVO_EC_KBD_BACKLIGHT_ON,
+				       brightness ? LENOVO_EC_KBD_BACKLIGHT_ON : 0);
+	if (old < 0)
+		return old;
+
+	WRITE_ONCE(ec->kbd_backlight_brightness, brightness ? LED_ON : LED_OFF);
+
+	return 0;
+}
+
+/* Report changes made by the EC itself, i.e., when Fn+Space is pressed */
+static void yoga_c630_ec_kbd_backlight_update(struct yoga_c630_ec *ec)
+{
+	int brightness;
+
+	brightness = yoga_c630_ec_kbd_backlight_get(&ec->kbd_backlight);
+	if (brightness < 0 ||
+	    brightness == READ_ONCE(ec->kbd_backlight_brightness))
+		return;
+
+	WRITE_ONCE(ec->kbd_backlight_brightness, brightness);
+	led_classdev_notify_brightness_hw_changed(&ec->kbd_backlight,
+						  brightness);
+}
+
+static int yoga_c630_ec_kbd_backlight_init(struct yoga_c630_ec *ec)
+{
+	struct led_classdev *led_cdev = &ec->kbd_backlight;
+	int brightness;
+
+	brightness = yoga_c630_ec_kbd_backlight_get(led_cdev);
+	if (brightness < 0)
+		return brightness;
+
+	ec->kbd_backlight_brightness = brightness;
+
+	led_cdev->name = "platform::kbd_backlight";
+	led_cdev->flags = LED_BRIGHT_HW_CHANGED;
+	led_cdev->max_brightness = LED_ON;
+	led_cdev->brightness_get = yoga_c630_ec_kbd_backlight_get;
+	led_cdev->brightness_set_blocking = yoga_c630_ec_kbd_backlight_set;
+
+	return devm_led_classdev_register(&ec->client->dev, led_cdev);
+}
+
 static irqreturn_t yoga_c630_ec_thread_intr(int irq, void *data)
 {
 	u8 req[] = { LENOVO_EC_REQUEST_NEXT_EVENT };
@@ -163,6 +269,8 @@ static irqreturn_t yoga_c630_ec_thread_intr(int irq, void *data)
 
 	blocking_notifier_call_chain(&ec->notifier_list, event, ec);
 
+	yoga_c630_ec_kbd_backlight_update(ec);
+
 	return IRQ_HANDLED;
 }
 
@@ -220,6 +328,11 @@ static int yoga_c630_ec_probe(struct i2c_client *client)
 	BLOCKING_INIT_NOTIFIER_HEAD(&ec->notifier_list);
 	i2c_set_clientdata(client, ec);
 
+	ret = yoga_c630_ec_kbd_backlight_init(ec);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register keyboard backlight\n");
+
 	ret = devm_request_threaded_irq(dev, client->irq,
 					NULL, yoga_c630_ec_thread_intr,
 					IRQF_ONESHOT, "yoga_c630_ec", ec);
-- 
2.56.0.611.g1030f0b940-goog


