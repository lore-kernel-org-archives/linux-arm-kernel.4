Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86BA606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=07iilFdr;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2nxCh3ph;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KsUmiqsp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L5OI5FX7JL+kgNYLtItHyl+SG6enyYh3fOM8vlFTvoY=; b=07iilFdrQyL+V/
	WXgGRkPtop0ezMJ6dSDci/LhKnkrMOHgZ2PyvvzgPA8UCjdDB+6vaCiM3sWUa2aGo3J13j5xesF4A
	Gf2KGDrTEFZnG5DMvFp0qLvNo0jcvv3wDHL0tsP+DCIlbvI7Vd0zoot6ZbcdllC3qRbV+A4hQV1XP
	TFMMbQa+SteVZa1gG98HTumxjQ2IFWD86aau22pjnVFuaJcnfBZqMLExOF1yjhXinv1rNITX4cHli
	hRhPovaz6rNUyJUsHbJe7up5QEd0jhqCyR6zxOSdY0KL4pmSDaXWUdJlp8LzDW0digEINM0rcS5WJ
	c+Jix1C74YznkSqsJ7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2gs-00000005t8U-37EJ;
	Wed, 11 Nov 2026 07:24:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2gF-00000005sek-2yDd;
	Wed, 11 Nov 2026 07:23:42 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794381817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L5OI5FX7JL+kgNYLtItHyl+SG6enyYh3fOM8vlFTvoY=;
	b=2nxCh3phL4Gg4uDcPZIkS1kWtEnMnINCjLa5gU5dXpK/Kb2ZdEeygFHY/ZFhpr8QdtuH5y
	NSEwLtWf3uznIQQFgzTohEZ7qH2tFh8/jWnN9VO22W5cWkK9vnFXEfwkKvlRJGhYXbeEgb
	nz+Ok/GQI3J1U4Ibr9u8EVjiotfzDlloplCDpIYXspLmBjn0/32VNH0n/7X8wL+jkAJpuC
	onKt1NKpz/BNNhxl/2BdPU8JQWV6HG45OqLtjhPhFaDXXhK8sKeV4ZGtTUtSGI3VYrsmbB
	W/pk6zGaN6Y5malVHzdiSHB0Bj4QTxm1FMVrebvcAnDDQArIYDGJ9SARdATJRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794381817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L5OI5FX7JL+kgNYLtItHyl+SG6enyYh3fOM8vlFTvoY=;
	b=KsUmiqsp3VOneiMdPSGwZ1ubier6tfKk3lPwNNWIj3cqghr7/xeuqbD8pFRw02SEe3paE2
	BwJshBrusEgLF6DQ==
Date: Wed, 11 Nov 2026 08:23:33 +0100
Subject: [PATCH v9 11/12] ARM: multi_v7_defconfig: Enable the raspberrypi
 otp driver as module
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-rpi-otp-driver-v9-11-0a7292a7a5b4@linutronix.de>
References: <20261111-rpi-otp-driver-v9-0-0a7292a7a5b4@linutronix.de>
In-Reply-To: <20261111-rpi-otp-driver-v9-0-0a7292a7a5b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794381812; l=921;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=nV4q/fY0ggdL9jLjY9jN7SpLOC/gVRnDvW9cn+372lk=;
 b=1tCk9pFjsIbMMI28Q7yk7ySbUAskKjCxomAVr8yQZxqzJEEUokn2EUalvHHHtrnPDvavNPGYO
 LplfVhCe9/pBKXPvkwF6x3/YfNcSomA7ApAXBgimXI43ABuVG4O/GkW
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_232339_922890_E5B66937 
X-CRM114-Status: UNSURE (   8.95  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable the newly added Raspberry Pi OTP driver as module to allow access
to the otp registers. This driver provides access to the OTP registers
present on all Raspberry Pi boards.

Enabling this in the multi_v7_defconfg allows standard upstream kernels
to use these registers out of the box.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f01cb..e9720a22a7c44 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1262,6 +1262,7 @@ CONFIG_NVMEM_ROCKCHIP_EFUSE=m
 CONFIG_NVMEM_STM32_ROMEM=m
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_NVMEM_VF610_OCOTP=y
+CONFIG_NVMEM_RASPBERRYPI_OTP=m
 CONFIG_FSI=m
 CONFIG_FSI_MASTER_GPIO=m
 CONFIG_FSI_MASTER_HUB=m

-- 
2.47.3


