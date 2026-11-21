Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E46606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F++/6X2D;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jAdCwet4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ViW+J37vlQnKvGYExQxk1bMlBbVAMGgbVTcmrc54d/s=; b=F++/6X2DXBdWFCxzpboi40m09u
	cDefCx6p34HQkAcsYucxQWI44I8PgBnlRe6Gm8tsdNKSJQ1sV3m3VqbHXNyX2BkLEEAl4MQdsCodo
	9B898NC3KzOub0iv9+hAW2bOy4L28Ssf24UiEDBTjl8yuoDvp3wy0+thcmB3MFzHn+dSiZTjC3ltV
	n4oraxYqFw1ugxnfsJbyeAMqkG0oDQI+79CxRqYMs561iHjyKJ9djS+r4S80jdBR2KfnBhYPqhIBj
	tXEYdGamyywzomvd2behkta+2BTIcBgRFKG4LrP1LJpU080B9rH9vwPq2IzZubuS6cm8wNdRieryo
	0luXVYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsEG-00000000IcY-42ey;
	Sat, 21 Nov 2026 21:02:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsDu-00000000IQm-44ib
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:02:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B7204459C4;
	Sat, 21 Nov 2026 21:02:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795294934;
	b=JSVEPPk2GIiOYJ5H2W7NWCjuVxL19COba6cQbytFQh1KZpmgAq0F5tSMc200cL8ehw3V
	 vwsnvlh7/yEo4d8AijB8dvLMZhMNsL8UKBgtMrv7ZXBFoBTerbHStMWeixN9CR7c4thEz
	 eu49ZpQTnpk/LDxDGOEGIfxNHz30+oUKhXmmKZOvVjhJlBfAkyRmUS3NaIJGLmP2t1PM0
	 M8irHCbCktJd44zM0BNOSX/22PHZk47PiifUncV0Soyy0tVdg/HpFWT0497b8Ul+NIi8O
	 0v4JV1Q/57CQ0SB1PkSXFZn6Ss0v7TshChCNb4xJEXqnkB4i/Bfj+NPKm96ucIrJotg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795294934;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ViW+J37vlQnKvGYExQxk1bMlBbVAMGgbVTcmrc54d/s=;
	b=cdqBcD5AaANGrJH4/zG3C+a/oC0SB3WZ3XPcDKZF4GCCBcwqbZPMX6mlWatmAhXfaR+f
	 i7pjv8gYBG9gCiFzyLIqWbidQFJYaYqdcwrjYkNv+970V1iYq7TqHM6AZLK9Wl2YJfhfW
	 H7N6y06nbmWnIL5HQTMaVNSWFqVEr5ZUtgEsuMMSn+wWsRCWlpQgyPfUlULOHkstqpuKo
	 qnhSxnfvKkrLXsYZvwL/XbGp8k5gY9J+iW+SRCGVcl1nWXC/ptd9ze5qBGbWyGvJRyb2Y
	 J1ruK/d6IAplFZxx9TrfFRFP5nFOBQ/VSCehl1xMGpGTq+ht7925iaY6N70/OdfIxMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A8011F000C6;
	Sat, 21 Nov 2026 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294934;
	bh=ViW+J37vlQnKvGYExQxk1bMlBbVAMGgbVTcmrc54d/s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jAdCwet4/UBRMo9paX937MzlBOZ/qaRuBqLm1SQWo6mN8z+pdJjtkLgAedta7cC18
	 Sh+BU+VFibMQMXAmX6f43nlC3gcI37lciuORpPC46DhUiOxPYJJjUjVGQ9Ma3NE6BT
	 iFAERkbVcIH6S/0bSMAEMjqEDgEFiaFBCVdY2ysKUPLncZegkI/AgtUcQCB8kyXc5c
	 PcyY7rcPCgdSxo1W1GDZ5up4CBVVOFWxbOEabJIvOdffHuRU0MlHj5bz0wilNKSAIp
	 0u4brHIjCnFwNA4mC1thLmFR1TikW5eFyhnBOKPUxs4glcUvmNOnju9Q3NubVAmHrk
	 LTuhsgjU2yGVg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AE5484BDB6;
	Sat, 21 Nov 2026 21:02:11 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:01:50 +0300
Subject: [PATCH v8 05/10] ARM: debug: Add Cortina Systems CS75xx UART0
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-cs75xx-v8-5-5f971b0dc69c@gmail.com>
References: <20261122-b4-cs75xx-v8-0-5f971b0dc69c@gmail.com>
In-Reply-To: <20261122-b4-cs75xx-v8-0-5f971b0dc69c@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795294929; l=4419;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=XANVvquwZ46csK0xa+Qk9KFcex+6JNnk+DkCsDkUuAQ=;
 b=0KeA9Q3W/jNj9F9hQiFiuW5PCS/9bqyQnr0M6KgVfP93aykNf2q3kuy68jksAKHlYEgIr6+I1
 yaKGX5Ne+uIDeqp8YSWSDo9bXRP745f8tresjZ3leHsCvm9xbR6nqPt
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Add low-level debug output through UART0 of the Cortina Systems CS75xx
SoCs. The UART is mapped at a fixed virtual address by the generic
debug_ll_io_init(), so no platform map_io is needed.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm/Kconfig.debug          | 16 ++++++++++++++--
 arch/arm/include/debug/cs75xx.S | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index abcf14f10..c43fe288b 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -308,6 +308,15 @@ choice
 		  Say Y here if you want the debug print routines to direct
 		  their output to the second serial port on these devices.
 
+	config DEBUG_CS75XX_UART0
+		bool "Kernel low-level debugging messages via CS75xx UART0"
+		depends on ARCH_CORTINA_ACCESS
+		help
+		  Say Y here if you want the debug print routines to direct
+		  their output to UART0 of Cortina Systems CS75xx SoCs. This
+		  is the console port on the Securifi Almond+. The UART is
+		  expected to be set up by the bootloader.
+
 	config DEBUG_DAVINCI_DA8XX_UART1
 		bool "Kernel low-level debugging on DaVinci DA8XX using UART1"
 		depends on ARCH_DAVINCI_DA8XX
@@ -1531,6 +1540,7 @@ config DEBUG_LL_INCLUDE
 	default "debug/vt8500.S" if DEBUG_VT8500_UART0
 	default "debug/zynq.S" if DEBUG_ZYNQ_UART0 || DEBUG_ZYNQ_UART1
 	default "debug/bcm63xx.S" if DEBUG_BCM63XX_UART || DEBUG_BCMBCA
+	default "debug/cs75xx.S" if DEBUG_CS75XX_UART0
 	default "debug/digicolor.S" if DEBUG_DIGICOLOR_UA0
 	default "debug/brcmstb.S" if DEBUG_BRCMSTB_UART
 	default "mach/debug-macro.S"
@@ -1632,6 +1642,7 @@ config DEBUG_UART_PHYS
 	default 0xe8008000 if DEBUG_R7S72100_SCIF2 || DEBUG_R7S9210_SCIF2
 	default 0xe8009000 if DEBUG_R7S9210_SCIF4
 	default 0xf0000000 if DEBUG_DIGICOLOR_UA0
+	default 0xf0070110 if DEBUG_CS75XX_UART0
 	default 0xf1012000 if DEBUG_MVEBU_UART0_ALTERNATE
 	default 0xf1012100 if DEBUG_MVEBU_UART1_ALTERNATE
 	default 0xf7fc9000 if DEBUG_BERLIN_UART
@@ -1670,7 +1681,7 @@ config DEBUG_UART_PHYS
 		DEBUG_RMOBILE_SCIFA4 || \
 		DEBUG_S3C64XX_UART || \
 		DEBUG_BCM63XX_UART || DEBUG_BCMBCA || DEBUG_ASM9260_UART || \
-		DEBUG_DIGICOLOR_UA0 || \
+		DEBUG_CS75XX_UART0 || DEBUG_DIGICOLOR_UA0 || \
 		DEBUG_AT91_UART || DEBUG_STM32_UART || \
 		DEBUG_STIH41X_ASC2 || DEBUG_STIH41X_SBC_ASC1 || \
 		DEBUG_STIH418_SBC_ASC0
@@ -1708,6 +1719,7 @@ config DEBUG_UART_VIRT
 	default 0xf7000800 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART2
 	default 0xf7000c00 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART3
 	default 0xf7020000 if DEBUG_AT91_SAMA5D2_UART1
+	default 0xf7070110 if DEBUG_CS75XX_UART0
 	default 0xf7fc9000 if DEBUG_BERLIN_UART
 	default 0xf8007000 if DEBUG_HIP04_UART
 	default 0xf8009000 if DEBUG_VEXPRESS_UART0_CA9
@@ -1772,7 +1784,7 @@ config DEBUG_UART_VIRT
 		DEBUG_QCOM_UARTDM || \
 		DEBUG_S3C64XX_UART || \
 		DEBUG_BCM63XX_UART || DEBUG_BCMBCA || DEBUG_ASM9260_UART || \
-		DEBUG_DIGICOLOR_UA0 || \
+		DEBUG_CS75XX_UART0 || DEBUG_DIGICOLOR_UA0 || \
 		DEBUG_AT91_UART || DEBUG_STM32_UART || \
 		DEBUG_STIH41X_ASC2 || DEBUG_STIH41X_SBC_ASC1 || \
 		DEBUG_STIH418_SBC_ASC0
diff --git a/arch/arm/include/debug/cs75xx.S b/arch/arm/include/debug/cs75xx.S
new file mode 100644
index 000000000..967821add
--- /dev/null
+++ b/arch/arm/include/debug/cs75xx.S
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Debugging macro include header for the Cortina Systems CS75xx UART
+ */
+
+#define CS75XX_UART_TXDAT		0x10
+#define CS75XX_UART_INFO		0x18
+#define CS75XX_UART_INFO_TX_FULL	(1 << 2)
+#define CS75XX_UART_INFO_TX_EMPTY	(1 << 3)
+
+		.macro	addruart, rp, rv, tmp
+		ldr	\rp, =CONFIG_DEBUG_UART_PHYS
+		ldr	\rv, =CONFIG_DEBUG_UART_VIRT
+		.endm
+
+		.macro	senduart, rd, rx
+		ARM_BE8(rev \rd, \rd)
+		str	\rd, [\rx, #CS75XX_UART_TXDAT]
+		ARM_BE8(rev \rd, \rd)
+		.endm
+
+		.macro	waituartcts, rd, rx
+		.endm
+
+		.macro	waituarttxrdy, rd, rx
+1001:		ldr	\rd, [\rx, #CS75XX_UART_INFO]
+		ARM_BE8(rev \rd, \rd)
+		tst	\rd, #CS75XX_UART_INFO_TX_FULL
+		bne	1001b
+		.endm
+
+		.macro	busyuart, rd, rx
+1002:		ldr	\rd, [\rx, #CS75XX_UART_INFO]
+		ARM_BE8(rev \rd, \rd)
+		tst	\rd, #CS75XX_UART_INFO_TX_EMPTY
+		beq	1002b
+		.endm

-- 
2.53.0



