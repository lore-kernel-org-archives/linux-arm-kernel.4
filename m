Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268D7606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bHsVNvwG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j4jzbgWa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0IqovOd9URrKDHXk95vcUIuqoZpYiAQrlc8XsAFYJlE=; b=bHsVNvwGXIaZfw
	1cu+C7t6Dk94sf6cRs7bCAVj35gy8Maw15LDWZx1IfVQRliICQH6kfd+rH4SbcJ0V5Cc9K0b2A7To
	66CHeIQ3NGgL3n/BgV+v4Wr+bXDEiowmuRpxcan5gdY2XRQIfMYVhNHe/FbWyNnFaylpr6cbDIhjo
	ATjBY7jNLcfhMmwnJY+4k6uyz22vLx9cgVRfA/rjnOSadFgIxlCXARY+aFqsLFXGpy/rGvodN9UB/
	ZAsX6/VEDlaGA3Rk0aAE7fWDzv6MGkHVwHwVZ4tPraRqGYYZI3FJOL4YD93X2+/JK/gamr4+dEKA+
	dSGB9GEHxGga/JZ7+2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBNN-0000000GoQa-3yPy;
	Sun, 08 Nov 2026 22:28:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBNI-0000000GoNm-2bg9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 22:28:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A52140727;
	Sun,  8 Nov 2026 22:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A490A1F0089F;
	Sun,  8 Nov 2026 22:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794176912;
	bh=0IqovOd9URrKDHXk95vcUIuqoZpYiAQrlc8XsAFYJlE=;
	h=From:Date:Subject:References:In-Reply-To:To;
	b=j4jzbgWa34iEFsRm+CgsK4SLkpAO8YQfYMHcKd6zQeTz0bIMDD1hPDhjvTI8Gy9RY
	 1ZK3olkFZDhiuuKW7fzOvNSMUzKiz3mO3/tLVAabLZCNM1gb2ef2T6TRAFRI3D845C
	 gf8kjVYCDUZ5a3pOzHNKNUYQnMBehMh8YRIU6sp9qOKNGV2gkhXXlNhy7lUO5GmYrJ
	 YMld4oiBu88+1uKPQcv2T4u4KeNLLOqLcdzqcvo43ugtfS+bFHoEfmusTunpyD/Yag
	 XQKvOXKqFBjr2Xh9Bfg1xN+7j1xCiD9RRKYgdhqRfK66EVpg3n+YiqrO2Fu347XR1F
	 tGFpC/4JQXwnQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 23:28:27 +0100
Subject: [PATCH 4/4] ARM: gemini: Update USB support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-b4-gemini-defconfig-update-v1-4-59a3ca5d8e55@kernel.org>
References: <20261108-b4-gemini-defconfig-update-v1-0-59a3ca5d8e55@kernel.org>
In-Reply-To: <20261108-b4-gemini-defconfig-update-v1-0-59a3ca5d8e55@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 linux-arm-kernel@lists.infradead.org
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drop UHCI host controller support, which is not needed on Gemini. The
SoC USB controllers are handled by FOTG210.

The DNS-313 device tree enables a FOTG210 port in peripheral mode and
describes its GPIO VBUS sensing connector. Enable the peripheral
controller and GPIO VBUS PHY driver to support this port.

Enable configfs gadget support with the generic serial function, which
uses bulk transfers supported by FOTG210. Userspace can configure and
bind the desired gadget through configfs. Build the support in, as the
defconfig does not enable modules.
---
 arch/arm/configs/gemini_defconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/gemini_defconfig b/arch/arm/configs/gemini_defconfig
index 72c9594b0e74..3a054890c273 100644
--- a/arch/arm/configs/gemini_defconfig
+++ b/arch/arm/configs/gemini_defconfig
@@ -81,9 +81,13 @@ CONFIG_LOGO=y
 CONFIG_USB=y
 CONFIG_USB_MON=y
 CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_UHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_FOTG210_HCD=y
+CONFIG_USB_FOTG210_UDC=y
+CONFIG_USB_GPIO_VBUS=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_CONFIGFS=y
+CONFIG_USB_CONFIGFS_SERIAL=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y

-- 
2.56.0


