Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384E5606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KhVekKrL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ouJEUTrk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3gDVC+PkPS9X3q0oyoOkeRyuEm0dYcRgyU69QFoIjMY=; b=KhVekKrLieHwiB
	+M9C3HBW3NBN8tk8NK1DDMhYIC3fJvpJxrZga++yhpLdrLKbUjStitSeJr9lAeeEPS9xUID8SZUvS
	1F/QjJ5sKhXDLCbFvRU3p9FZECT4zIOFp5tRTGVXW7JRrldNgJ0qGsuryuaaPnL+sgft8S50ZnjbP
	WHl8jfFfShial5zrIfm1RvpGqIjxS2ZKibzk2YdxOVt3N0AviNhVwdi7w5C8HVK/P8qKmt8FBkJEf
	pmUSSl8wUUt7Xkvma9og87+M9KHg+hrSZHvRuRpqqBNGIHTRcqEKaYbEOgfzZqPLtCCHDSyRgRufQ
	i+6CPqNXJNOmu+WXMsag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ah-0000000GLGg-0veD;
	Sun, 08 Nov 2026 15:51:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ac-0000000GLEz-1JxO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA0C542215;
	Sun,  8 Nov 2026 15:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE061F0089F;
	Sun,  8 Nov 2026 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153061;
	bh=3gDVC+PkPS9X3q0oyoOkeRyuEm0dYcRgyU69QFoIjMY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ouJEUTrk7+JSf8EQeNWu7yNp5HffK96uqQP0DTApECeVxbk579SNPFEa7D1/2hH1n
	 BTPyZBdwKCyFwNQNdyQOwj8mT3drl30H3za2iOSoXbkp5skNArCIbEmHkPdSDH1nHF
	 rq6NTBv2JyWaU12Oxroaxe9Mch2xQfWhgjCnFxz3R/czZfcp3lOZ1H//qTJNsGoSFR
	 4ywcN2SgrL8hFtpyS7rkqN++fdYQ4uFkxMTfc8MvlzFketKEfq9r3rsaCktJ8/fCk1
	 kNtfpxjeUwnoIFYb1gLPfKxawaCWSiMRz8c7FSzLog6k06ZobG4Ndfxb3GPUyphKXU
	 +JGRpRQ9ROCeA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:50:57 +0100
Subject: [PATCH v2 01/15] ARM: configs: Refresh U8500 defconfig
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-1-13b701e66cbd@kernel.org>
References: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
In-Reply-To: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Regenerate the U8500 defconfig against v7.4-rc1 to account for Kconfig
changes and remove options which no longer exist.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 2fe25f5eb9a5..0614445fdfe4 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -56,7 +56,6 @@ CONFIG_CW1200_WLAN_SDIO=y
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
 CONFIG_KEYBOARD_GPIO=y
-CONFIG_KEYBOARD_NOMADIK=y
 CONFIG_KEYBOARD_STMPE=y
 CONFIG_KEYBOARD_TC3589X=y
 CONFIG_KEYBOARD_TM2_TOUCHKEY=y
@@ -91,7 +90,6 @@ CONFIG_BATTERY_SAMSUNG_SDI=y
 CONFIG_AB8500_BM=y
 CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_NTC_THERMISTOR=y
-CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_MFD_STMPE=y
@@ -100,9 +98,10 @@ CONFIG_REGULATOR_AB8500=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_CAMERA_SUPPORT=y
-CONFIG_VIDEO_V4L2_SUBDEV_API=y
 CONFIG_V4L2_FLASH_LED_CLASS=y
 CONFIG_DRM=y
+CONFIG_DRM_LIMA=y
+CONFIG_DRM_MCDE=y
 CONFIG_DRM_PANEL_NOVATEK_NT35510=y
 CONFIG_DRM_PANEL_NOVATEK_NT35560=y
 CONFIG_DRM_PANEL_SAMSUNG_DB7430=y
@@ -111,8 +110,6 @@ CONFIG_DRM_PANEL_SAMSUNG_S6D27A1=y
 CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=y
 CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI=y
 CONFIG_DRM_PANEL_WIDECHIPS_WS2401=y
-CONFIG_DRM_LIMA=y
-CONFIG_DRM_MCDE=y
 CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_KTD253=y
@@ -122,7 +119,6 @@ CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_UX500=y
-CONFIG_SND_SOC_UX500_MACH_MOP500=y
 CONFIG_USB_MUSB_HDRC=y
 CONFIG_USB_MUSB_UX500=y
 CONFIG_MUSB_PIO_ONLY=y
@@ -136,8 +132,6 @@ CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_FLASH=y
 CONFIG_LEDS_LM3530=y
 CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_LP55XX_COMMON=y
-CONFIG_LEDS_LP5521=y
 CONFIG_LEDS_REGULATOR=y
 CONFIG_LEDS_RT8515=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
@@ -188,7 +182,6 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
 CONFIG_DEBUG_USER=y
 CONFIG_CORESIGHT=y

-- 
2.56.0


