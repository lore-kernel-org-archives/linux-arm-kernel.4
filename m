Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97CC606BAEC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hrvelHfU;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Ub1Xd1n1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MQ6FO7P1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cn0BdA4QwRI+wAMV3VT1tmGeO7T5eUmgMyrjpKHpgNU=; b=hrvelHfUCqTz+GWaKFJJbYNIJ0
	zVjMbWklpz8flwjBKJHTbTSv7Jld7VhrUMBA7vRn0rKYw66haWG6XX8cie7yvGTun3oEIbq4ulgky
	jb3byrMYukT2fgg2x9bwZ9kgmH66/+IGacHM3W5Ma3aiS/nYTsf0cxx4shtkL+gzCYr6W70xmXH7M
	6udSF0gpsElADs6fzUUiNsYmTEK+EzHEEdzgk1daoR7fwB4WhMY63IOwJ+JCiWZU20Dl+skDx2gRG
	yE05tIWzLO0zfXfixaGsbOeUJeCWW68JP56BmiJknC2JecvEb6ATRBYKF72LY0a8tBcloSWb8humS
	sR9rskDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQona-00000004XwF-11wE;
	Tue, 10 Nov 2026 16:34:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQonT-00000004Xr9-3zmG;
	Tue, 10 Nov 2026 16:34:13 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794328449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cn0BdA4QwRI+wAMV3VT1tmGeO7T5eUmgMyrjpKHpgNU=;
	b=Ub1Xd1n1BykZRgQgsVRN7hcsYKNbREp/3Mp7weStgIuWed09K+b/eXWs2DOMa4a+3OVGxq
	5MCy8ucB3tyKRVyLx4UG1K+ZuC63NBUjcdAXO14a/K1qvyM91XSm9IUtFsT+dcF/wuxcoZ
	FtHv3AEZ7fP1JirNVp/wlVdmmjIRP/FnO0C75iZY8j+bVVLZUuhuRWnUKk/iSS5uecEte3
	4xEe6nKZfFbaQ7x2Ng6VG1qnJfACMOkDY87jQSE9BwMhIZ4hgxn/Xk7RQyAlnhcoAOAG5w
	qANMKunn2LY4y+6pzm8tVhlroyJyM1TYImvKq2pAODlGTCSfJ/u/qMLourQe8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794328449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cn0BdA4QwRI+wAMV3VT1tmGeO7T5eUmgMyrjpKHpgNU=;
	b=MQ6FO7P1JI5boa+BWQ7EoGtqjHoS4pqpawkc9YikG2uo5+KM31lKNWSA+iKVox7Ygs1izt
	vmR3/a3OzeshYmAw==
Subject: [PATCH v8 00/12] nvmem: Add Raspberry Pi OTP nvmem driver
Date: Tue, 10 Nov 2026 17:33:59 +0100
Message-Id: <20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdH82oC/3XQzU7DMAwH8FeZcibIcfNVTrwH4rAmDgtCbZV21
 aap775kSFCRcvwr9s+xb2yiFGliL4cbS7TEKQ59DvbpwNzp2H8Qjz5nhoAaJFiexsiHeeQ+xYU
 SNyo4Et6FYDzLTWOiEC8P8O39O0/n7pPcXJRScYrTPKTrY+IiSt2/+CI4cAL0wnekAezrV+zPc
 xr6eHn2xMqABX8JBaoisBCtMJqcQduYPaLZEroimkxgK3V+141u1R4ht0S9iMyEC9YbVN5aFHu
 E2hAIFaEy0aEm1YIlOro9Qm8JrAhdCMi9rfFC4u45zQ8hhKh/YcotGqk8EGkV4C+xrusda0SOX
 1QCAAA=
X-Change-ID: 20260408-rpi-otp-driver-75fce1dcff7d
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
 Gregor Herburger <gregor.herburger@linutronix.de>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794328449; l=3982;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=zD9OPPfWsuFphY9987/zJvbIrH9lBT4nVkjcQK0UEPU=;
 b=EqpGc8gtmoS72N46bKO4GbzqPi5CSvnuYo4/EiOfE5/rji/43Hfa8q1O5RLbakiwlRI1hm9cu
 Wn3323JH9eFAqGceNDsd5mE5OsmfalYlaxjjBG/hXXNacacqRN93Zco
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_083412_295976_D28B67B6 
X-CRM114-Status: GOOD (  13.45  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series adds support for the Raspberry Pis OTP registers. The
Raspberry Pi has one or more OTP regions. These registers are accessible
through the firmware. Add a driver for it and add updates the devicetree
for the Raspberry Pi 5.

---
Changes in v8:
- Really rebase to v7.4-rc2
- Add a patch to reorder rpi_firmware_property_tag enum
- Link to v7: https://patch.msgid.link/20261110-rpi-otp-driver-v7-0-2345d0ee65f0@linutronix.de

Changes in v7:
- Rebase to v7.4-rc2
- Added Patch to register rtc driver by soc enum from drvdata
- Link to v6: https://patch.msgid.link/20260522-rpi-otp-driver-v6-0-b0eac97d1428@linutronix.de

Changes in v6:
- Use %pe in dev_err
- Include <linux/slab.h> to fix build on arm
- Add arm defconfigs: multi_v7_defconfig and bcm2835_defconfig
- Reword commit messages
- Link to v5: https://patch.msgid.link/20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de

Changes in v5:
- Move alignment check to nvmem core
- Use IS_REACHABLE to simplify Kconfig
- use root_only for private driver
- Add driver as module to arch64 defconfig
- Use MODULE_DEVICE_TABLE
- Remove some unused attributes, fix typos, minor fixups
- Link to v4: https://patch.msgid.link/20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de

Changes in v4:
- Additional patch to drop unnecessary select schema
- fix dt-bindings
- use __counted_by_le
- additional alignment check in read/write callbacks
- Link to v3: https://patch.msgid.link/20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de

Changes in v3:
- dts: add "raspberrypi,bcm2835-firmware" as fallback and fix dt-bindings
- Fix Kconfig depends
- Changed firmware data fields to __le32
- Add MODULE_ALIAS
- Link to v2: https://patch.msgid.link/20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de

Changes in v2:
- register nvmem driver from firmware driver and drop firmware sub nodes
- Use struct_size and __counted_by for dynamic array
- Drop unneeded comment in Kconfig
- Use NVMEM_DEVID_NONE
- Use kzalloc
- Update module description
- Link to v1: https://patch.msgid.link/20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de

---
Gregor Herburger (12):
      firmware: raspberrypi: reorder rpi_firmware_property_tag enum
      soc: bcm2835: Use IS_REACHABLE for function declaration
      nvmem: core: Enforce stride and alignment checks for nvmem_device functions
      dt-bindings: raspberrypi,bcm2835-firmware: Add bcm2712-firmware compatible
      nvmem: Add the Raspberry Pi OTP driver
      firmware: raspberrypi: register nvmem driver
      arm64: dts: broadcom: bcm2712: add raspberrypi,bcm2712-firmware compatible
      dt-bindings: raspberrypi,bcm2835-firmware: Drop unnecessary select
      arm64: defconfig: Enable the raspberrypi otp driver as module
      ARM: bcm2835_defconfig: Enable the raspberrypi otp driver as module
      ARM: multi_v7_defconfig: Enable the raspberrypi otp driver as module
      firmware: raspberrypi: use drvdata to register rtc driver

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  20 ++--
 arch/arm/configs/bcm2835_defconfig                 |   2 +
 arch/arm/configs/multi_v7_defconfig                |   1 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   4 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/firmware/raspberrypi.c                     |  62 +++++++++-
 drivers/nvmem/Kconfig                              |  11 ++
 drivers/nvmem/Makefile                             |   1 +
 drivers/nvmem/core.c                               |  12 ++
 drivers/nvmem/raspberrypi-otp.c                    | 131 +++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h         |  37 ++++--
 11 files changed, 256 insertions(+), 26 deletions(-)
---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20260408-rpi-otp-driver-75fce1dcff7d

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


