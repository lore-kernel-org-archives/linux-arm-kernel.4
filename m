Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FF460A2613
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DS8owWMy;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EENM8nu1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qZvIy9Hq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VMVsIg9meqQ62t0+CY5CMduv42wKWJXNSJQ6i89MUtU=; b=DS8owWMy1K3Y27PArbQSrYFvXO
	d86vWCO4PoEcpZr0XutwTVmj31YOv2e+fIkgD3jem5fbGd7kuKgGJ2x0bgi7PhlDz3IkPZYCoQ4IT
	Q5tlxs7aMxbK/W/uQAhtZxPvBtksbk4Bon8faqBW91YxVySJHPZvKfU0wPVflAM8uMFrxnjvSKFD0
	JuO327hmWRrUrsUkPQ8kxuE/yLSoCrVMwgiTWGodIyh1NMA5te0Wx6xW33kTaLTJCbj0DjOInr2tz
	aXTzGbO823DpHifAmKLobSSZTKzaj0IqFMUWF2eLgNNYPu09eEEhHL24SFCkJtEqTXk6Vs6u6bamF
	DlBgxKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQody-00000004Vnz-409R;
	Tue, 10 Nov 2026 16:24:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQodv-00000004VlA-31cP;
	Tue, 10 Nov 2026 16:24:21 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794327857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VMVsIg9meqQ62t0+CY5CMduv42wKWJXNSJQ6i89MUtU=;
	b=EENM8nu1gPjUplzI0LyqYGDYDX8ydEIilY2kjl2L4RJM3e8Zgf0G7mP7B96tI6B+vMgdaT
	2u5+ES4kgbgdRK3MmNArmOuQe1pvBz+jr/6bhDcm0b/zJoB9OAFoE7dWT7dcvYUYBTKRZK
	3Wc67DDXgJ8/LnYUc8jFGzbgUcibwaVigomk992mb2zK6xJsXCkfh1qXr7Y2safpN8ss0I
	L6LuAO6s9CIB9Y3gpn5PLm6IwwMiPrSeAqtmZjVAlOH7Ioi3Y45BwQazlZlrdhBvfp7Bcv
	4uUYy4y3GeeaYj0cl+FLvrKZmRNgZ+HisihcwVby16knSiQaoef2uu1dHOtd/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794327857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VMVsIg9meqQ62t0+CY5CMduv42wKWJXNSJQ6i89MUtU=;
	b=qZvIy9HqzdP4cmxki1IfCUc3zcjfH8nAuG9BO2d3g8Ig0zYDMXzkTbk/y6I3uP/mop1xVg
	yMwKWeViyNHeTECg==
Subject: [PATCH v7 00/11] nvmem: Add Raspberry Pi OTP nvmem driver
Date: Tue, 10 Nov 2026 17:24:01 +0100
Message-Id: <20261110-rpi-otp-driver-v7-0-2345d0ee65f0@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACFF82oC/3XQzU7DMAwH8FeZcibIcZsvTrwH4rAmDgtCbZV01
 dDUdycZByqlHP+y/bPsO8uUImX2crqzRGvMcRpL0E8n5i7n8YN49CUzBFTQg+FpjnxaZu5TXCl
 xLYMj4V0I2rMyNCcK8fYA395/c74On+SWqtSOS8zLlL4fG1dR+/7FV8GBE6AXfiAFYF6/4nhd0
 jTG27MnVhes+EdIkA2BlbBCK3IaTaePiG5PqIboCoG2V6WuOmXlEdHvifaQvhAuGK9RemNQHBF
 yRyA0hCzEgIqkBUN0dkeE2hPYEKoSUGat9qLH5p3btv0ATWr5tRECAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794327856; l=3710;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=nOC1D+FzrtqhciV4vMD0rRrY6gGMlplEHYuBvs/KV+4=;
 b=HjfrNLCGJwvmuPU54O2NOIyR8TehJe80KJDwMAsf2C1JBqXCQ8+9TTtwi3JjD6c02kW6BzKlV
 EtDgHACOrCdB4WVB1kNI5jmu28zsggtdIhsVZJMaF7ckweXexiMi7OU
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_082419_924564_F9348AD8 
X-CRM114-Status: GOOD (  13.12  )
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
Gregor Herburger (11):
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
 include/soc/bcm2835/raspberrypi-firmware.h         |  17 ++-
 11 files changed, 246 insertions(+), 16 deletions(-)
---
base-commit: c9ea4adf1af3e26c64c45ab8005295c420a5703b
change-id: 20260408-rpi-otp-driver-75fce1dcff7d

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


