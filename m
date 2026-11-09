Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D7B606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z/7MFJcP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ua+abBe8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=N2keICUbCE9LxNGMu98kwwmZ1JbmLwrSlbYRImcv3Tw=; b=z/7MFJcPiyTb6wN3s+dEE/GIu+
	DmsT0nSKfN/SGjKAQtEamzBdBzblZ0YzEn7uspNEZ8iUYmcE+kvDK5gTUV/9bknf47LNp00ibwnyd
	ydyTg9+12LLJxbybr0CFJ9lbc+HC2OD99/oDocZlPYFk00ZpiqDxs1ta46vchTAFyeRUEZ1aO2MdQ
	RGrb2KyBjcEN8qg0q4bd9ZrNH3wtK4Va0bQljyqnNbSMPb/nTyZqXB0S9c2xz+yZDD7+FBA9gBH/k
	z9h7o9laWhIXajw6HBSP12REWEhEkllPSn3iukkuFAWEYm4SiGZq/0mA+Wb5q3XzGzPaJW0SjwbWl
	wH/JpnZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKRs-000000001l1-2iED;
	Mon, 09 Nov 2026 08:09:52 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKRq-000000001k7-0kzW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:09:51 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-3704d30b84fso747689eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 00:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211789; x=1794816589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2keICUbCE9LxNGMu98kwwmZ1JbmLwrSlbYRImcv3Tw=;
        b=Ua+abBe8l6WFTYmLE/tVpQAz3tfyBdoskLzwL6vhRCGM2Wor7/4SymfzLXZg9o0465
         EsRoAAKmTGZkUHvREi5MLaARPLqAXEMJSejYiY0tyC9cYCNidDb8iYKan9uNOWvfS/iX
         TSKtZbWPC6OkwiG9yuAZrrvZleaih1wjwBjIhcXhCFCdE/j3qrdrdC7nBe+w8jZOTmdm
         7z3FRmjohXFX3qfdTEOy4eQ95IahfPsO3oR406254EAFxG2TwM6iOsUYybzduuO9ne6T
         XWb7XvpQoyF7fV/S1/IKCRwVwDQG5yyOG/npQ49Z04L7ryjry49ltju8e/fMZSLw+t6G
         g0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211789; x=1794816589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2keICUbCE9LxNGMu98kwwmZ1JbmLwrSlbYRImcv3Tw=;
        b=w+vaHqAytBe+ntf9cvI9U+Z7hTZ8HIteyGt6lJtslbCcBh7WH41AnwbFuCYhI3s0rc
         +3wFZwIHTT8PNh/HKaiAzwSLZ77s//i1E7Vm/ANvBXLtwzO5wdAJ4J1Q8EeViBkWg9vY
         vo5m3SzveAG+d/ctxaaVVf3t1B7okdnpeJGYnDt0/UKUhQ+XQzD9KL0/nGtd/oBQAwsK
         g6GACTT/1HOs0It8DGO2S9VcZsGM2iRgbGeJN+0drA7G5lQk9BwVLglpk2PN606dZZsP
         Fu/0p8txTT2hbCsexbH0IUKZIwpnNXjSi3tuBiax0TvBXejXhRZjHJpQn0APPrG0Bt/X
         xCSw==
X-Forwarded-Encrypted: i=1; AL+hErEqyEclwRLHmaMIRFcwDLtFi9WJDvX4SgqPdtGrrgIDMSzdEJyPBjlS0OdG047TFBxcmmD0+KcY6SPDMuxyY6BQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8U7e4qXz2y0H7gdpa3xpsQWI/pOB4Z0BTzoWD4Y/R0YL3RoM05
	2AgNXxROHgql38VrNZ/638fzVf2M0cbGFVFUXbLzu9bmUrLZy6Ow5HzS
X-Gm-Gg: AYBFou2ks+yKzeBxJkh8DlDgReHOJbeJRMqDRwgZIvd6f4IasnbZKZbkmf5tBUEwnKK
	fhkK7zjdYhuLSI2BbPiCRXRiDvtiaXZXnoXLC+QIUlXDYAi8ctdAPyuxZVevnl2FMpsLypOMIz0
	1I0giDehvfnzVdRT6W0JTZjL9LSzj41MZZxVrz8y0OQG2Qg7lpGGs9+j91u0yDp1LfQYbstbk2f
	CQofg2Bm1sekV/aLy7UxZevjr/VnxAAOy1p8ktmxwgRB8rywsj5mvcBIR+fZp9pUEf6eyr4tZKs
	6tf3Uc1EJBl0r0n8dJFweAfs049DmLzLmBYI0D3Ax/CkJzkH20DCkqfTtCrnFUQPq3G64MfkyNk
	nE12y36g0DcUGyF9ly5996Jv6bRW7AfkppE/vRiFinRIpLDo7ie3V3v6s+gcmAbTH36i/oDae8g
	Oj19fDMnep3wdpC1iseu/+6QPsmImQIoZIRJ2z+0D96b111J8WzvBWBjUVX91XPtu1XmiUBYaTs
	xHrpUZCg2aHWcSTO49PyBq708Rbav78LmJS3jqjA6IA9kPlrOEone9yIVPAlcSxcor8rgC/y5WC
	eXVFtiIB7W3mBlWr2WRGLZbrrGpv4ivvOinUbTPTnGhxDYkky/8URUADhVwxoS3AfWOASZRMvJu
	b9LzhM14lOvTSmrsWrMKPTWeGpPnE6l21kLYIIA==
X-Received: by 2002:a05:7301:e0a:b0:373:d25b:8cf0 with SMTP id 5a478bee46e88-373d25b9033mr3417937eec.29.1794211788472;
        Mon, 09 Nov 2026 00:09:48 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d2826sm12000389eec.29.2026.11.09.00.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:09:47 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Daniel Mack <daniel@zonque.org>,
	Russell King <linux@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: apm-power - remove driver
Date: Mon,  9 Nov 2026 00:09:44 -0800
Message-ID: <20261109080944.3802916-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_000950_231413_0F0E9BAA 
X-CRM114-Status: GOOD (  20.56  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The apm-power input handler solely listens for EV_PWR KEY_SUSPEND
events to queue APM_USER_SUSPEND via legacy APM emulation. The only
in-tree platforms generating those events are legacy Sharp Zaurus ARM
machines (spitz/borzoi/akita and collie), none of which were converted
to Device Tree. Both mach-pxa board files and mach-sa1100 were marked
deprecated in v7.3 by commit cc7852314abd ("ARM: PXA: mark remaining
board files as deprecated") and commit 7d92e50ceacd ("ARM: mark
mach-sa1100 as deprecated"), and are queued for removal in v7.5. None
of the remaining ARM platforms or other APM_EMULATION targets
(MIPS_ALCHEMY, PMAC_APM_EMU, and SH_HP6XX) emit EV_PWR input events or
enable CONFIG_INPUT_APMPOWER, and arch/arm/configs/pxa_defconfig
already dropped CONFIG_PXA_SHARPSL at the same time, leaving its
CONFIG_INPUT_APMPOWER=m entry inert.

Normalizing dashes and underscores in scripts/modules-check.sh for v7.5
exposes a module name collision (apm_power) between
drivers/input/apm-power.ko and drivers/power/supply/apm_power.ko.
Remove this obsolete input bridge to resolve the collision rather than
renaming a module whose last target platforms are going away in the
same cycle.

Reported-by: Sasha Levin <sashal@kernel.org>
Closes: https://lore.kernel.org/r/20261108225808.1809266-1-sashal@kernel.org
Link: https://lore.kernel.org/r/20261109-apm-power-input-rename-v1-1-0609e7b91825@kernel.org
Link: https://lore.kernel.org/r/e4da2f9d-d3b9-4267-9b64-b0f2cb43402a@app.fastmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/configs/pxa_defconfig |   1 -
 drivers/input/Kconfig          |  12 ----
 drivers/input/Makefile         |   2 -
 drivers/input/apm-power.c      | 122 ---------------------------------
 4 files changed, 137 deletions(-)
 delete mode 100644 drivers/input/apm-power.c

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index e7a7ed2b7ef7..e70d2789d1f6 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -224,7 +224,6 @@ CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
 CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
 CONFIG_INPUT_JOYDEV=m
 CONFIG_INPUT_EVDEV=m
-CONFIG_INPUT_APMPOWER=m
 CONFIG_KEYBOARD_ATKBD=m
 CONFIG_KEYBOARD_QT1070=m
 CONFIG_KEYBOARD_GPIO=m
diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
index 88ecdf5218ee..064beedf5558 100644
--- a/drivers/input/Kconfig
+++ b/drivers/input/Kconfig
@@ -162,18 +162,6 @@ config INPUT_KUNIT_TEST
 
 	  If in doubt, say "N".
 
-config INPUT_APMPOWER
-	tristate "Input Power Event -> APM Bridge" if EXPERT
-	depends on INPUT && APM_EMULATION
-	help
-	  Say Y here if you want suspend key events to trigger a user
-	  requested suspend through APM. This is useful on embedded
-	  systems where such behaviour is desired without userspace
-	  interaction. If unsure, say N.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called apm-power.
-
 comment "Input Device Drivers"
 
 source "drivers/input/keyboard/Kconfig"
diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index 2cd6e1c9a778..7d2af8dfd17e 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -27,6 +27,4 @@ obj-$(CONFIG_INPUT_TOUCHSCREEN)	+= touchscreen/
 obj-$(CONFIG_INPUT_MISC)	+= misc/
 obj-$(CONFIG_INPUT_KUNIT_TEST)	+= tests/
 
-obj-$(CONFIG_INPUT_APMPOWER)	+= apm-power.o
-
 obj-$(CONFIG_RMI4_CORE)		+= rmi4/
diff --git a/drivers/input/apm-power.c b/drivers/input/apm-power.c
deleted file mode 100644
index 028fcaf4c142..000000000000
--- a/drivers/input/apm-power.c
+++ /dev/null
@@ -1,122 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Input Power Event -> APM Bridge
- *
- *  Copyright (c) 2007 Richard Purdie
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/module.h>
-#include <linux/input.h>
-#include <linux/slab.h>
-#include <linux/init.h>
-#include <linux/tty.h>
-#include <linux/delay.h>
-#include <linux/pm.h>
-#include <linux/apm-emulation.h>
-
-static void system_power_event(unsigned int keycode)
-{
-	switch (keycode) {
-	case KEY_SUSPEND:
-		apm_queue_event(APM_USER_SUSPEND);
-		pr_info("Requesting system suspend...\n");
-		break;
-	default:
-		break;
-	}
-}
-
-static void apmpower_event(struct input_handle *handle, unsigned int type,
-			   unsigned int code, int value)
-{
-	/* only react on key down events */
-	if (value != 1)
-		return;
-
-	switch (type) {
-	case EV_PWR:
-		system_power_event(code);
-		break;
-
-	default:
-		break;
-	}
-}
-
-static int apmpower_connect(struct input_handler *handler,
-					  struct input_dev *dev,
-					  const struct input_device_id *id)
-{
-	struct input_handle *handle;
-	int error;
-
-	handle = kzalloc_obj(struct input_handle);
-	if (!handle)
-		return -ENOMEM;
-
-	handle->dev = dev;
-	handle->handler = handler;
-	handle->name = "apm-power";
-
-	error = input_register_handle(handle);
-	if (error) {
-		pr_err("Failed to register input power handler, error %d\n",
-		       error);
-		kfree(handle);
-		return error;
-	}
-
-	error = input_open_device(handle);
-	if (error) {
-		pr_err("Failed to open input power device, error %d\n", error);
-		input_unregister_handle(handle);
-		kfree(handle);
-		return error;
-	}
-
-	return 0;
-}
-
-static void apmpower_disconnect(struct input_handle *handle)
-{
-	input_close_device(handle);
-	input_unregister_handle(handle);
-	kfree(handle);
-}
-
-static const struct input_device_id apmpower_ids[] = {
-	{
-		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
-		.evbit = { BIT_MASK(EV_PWR) },
-	},
-	{ },
-};
-
-MODULE_DEVICE_TABLE(input, apmpower_ids);
-
-static struct input_handler apmpower_handler = {
-	.event =	apmpower_event,
-	.connect =	apmpower_connect,
-	.disconnect =	apmpower_disconnect,
-	.name =		"apm-power",
-	.id_table =	apmpower_ids,
-};
-
-static int __init apmpower_init(void)
-{
-	return input_register_handler(&apmpower_handler);
-}
-
-static void __exit apmpower_exit(void)
-{
-	input_unregister_handler(&apmpower_handler);
-}
-
-module_init(apmpower_init);
-module_exit(apmpower_exit);
-
-MODULE_AUTHOR("Richard Purdie <rpurdie@rpsys.net>");
-MODULE_DESCRIPTION("Input Power Event -> APM Bridge");
-MODULE_LICENSE("GPL");
-- 
2.56.0.506.g506a7eabc5-goog


