Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C5460A382C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z/4sGYP3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KusGYfdX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HVEE3Tcbne75iVGjTL3VoYX5NV8IDX+fOPLq54L1FA0=; b=Z/4sGYP3ykRBOt/etFhVJJ11bR
	g/cTW4XRhDtLY9Kw1ITfFUznVrLQb+3TyqMLY3BpR9u0MCwtEroP+7mL8nWj5ZFcmomaj3A4rznmz
	8ha2kRQ1qAdcdRLGH+9EwH9HlV7cZM31r+aU8ShEltKGQdpmsepY2m65zLJbu/mT4d2ehumoHk/T0
	9aqOXn65+QQU4aRPyx2aIEN85V0WXys5B6N3OL5r6I3MGHGmkfJe89T7r4iZJQl7iFcwr9AzdFEtt
	9OKOXO0yuMz1xz3ec/aG9OrRbP5O2Ke6ryawk+BzkNTw1Wqn+XRccXkmrhz3cTVBa90pqG6w33AjS
	t0E0dYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTItp-00000005pOj-3cXv;
	Tue, 17 Nov 2026 13:07:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIto-00000005pOI-1n1X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:07:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC139413F2;
	Tue, 17 Nov 2026 13:06:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794920819;
	b=0r9uRdivsCoewUCIvlrK4zMxlXevmaH6yWMBF+nT7p7HRRZwZyZ5PsWuYdrw6719GIgp
	 dFzSInt/f9S19cPSXf2QiPx6zOnJIt3+RZNMSK03yqEl6juUkILnEQ+af5h32WmT9jiEJ
	 h1S7UhkxbfJ79ZDOFZX+X9217yluSyE41q6v6R9Kv70ghOK10WTY2TmQRE8QIe13dX8ca
	 auTwZmNEMwep+/oh4QxP5y8AkSnXfHaXo2ZJXoptZBW2jdjzXpBVB81OrmmhKVKmVviQg
	 BHR76q/vVpWLF1ZvB6eCxWagW7rBasBykwESyrQPGlTVtUOnBsxpqE0H1zeBizIGPQQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794920819;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=HVEE3Tcbne75iVGjTL3VoYX5NV8IDX+fOPLq54L1FA0=;
	b=QuwfeivrjGypZTmqkpMEujYkm3IHy0bLqL7n4tt0kO118sRj+oTPiPYVck0QOVqfFGux
	 a9wjEalkmDuqeBoewJMa9AD2qTRJtDA6rMGCoiNpBWu7G+6BP7UWl8AjbeSt79XGjBOtF
	 D04LgHeMNB1sHrdOp0HAyuCL02AjCusuOIIU60BFm+siaFYycxAog+ycZO98rI0IFUkvo
	 Xq3GhLBWqdJzPPRfxf4CZ/UFcQFHDLs/qUcOGFYjBH/Ki0fmUlMb7LUt/ZZs/q73vrcPs
	 oAV38JDwbXSBdVUn0S8QGhPTyS94qbPM33HsjgbqpNf5NLPPMdN0CsFm5MYaTRxWuUg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22FEB1F000C5;
	Tue, 17 Nov 2026 13:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920819;
	bh=HVEE3Tcbne75iVGjTL3VoYX5NV8IDX+fOPLq54L1FA0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=KusGYfdXQi2wznXRCzHL7Aq4lwcI8FtpRcxI+2rN3pyAUNIB3woFzVIh3AutC1hgi
	 fYAFXsw46f1BdQHReX7Dbig8Rgg55iTaNTfyUm2CO1fz/iWIJGZL1B08w/Of9Zey3G
	 kv7GV2YQFIgFqLSwMzDgWD9Xtl4nCR13o6Qz4+igw1oTdUZ64qW7tg/RwNpryK0SrX
	 TW5wiftGS8u73LDaPHWh52KpWh48T3vEK5iEPkQG8kUXW6EstME8pCEE5iXBG+3I2i
	 sxegNTHNEumVyHqKukHUZrw5YAPhSYI7tZPVfFPH/DIpBc8nOgI6UITtZmwaDtGZnQ
	 X7LKRPH5JMZ0Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 934E14A97F;
	Tue, 17 Nov 2026 13:06:58 +0000 (UTC)
From: yy-Local-LLM via B4 Relay <devnull+yogo.0917.sabu.gmail.com@kernel.org>
Subject: [PATCH RFC 0/6] SiRF AT550 / YPL514si initial RAM-boot platform
 support
Date: Tue, 17 Nov 2026 22:06:50 +0900
Message-Id: <20261117-at550-rfc-v1-v1-0-5879573cb825@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nz3cQSU1MD3aK0ZN0yQ10jU0tDQwvTRKO0VAsloJaCotS0zAqwcdF
 KQW7OSrEQweLSpKzU5BKQQUq1tQBphOzAdQAAAA==
X-Change-ID: 20261117-at550-rfc-v1-2591185a2fe8
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Ulf Hansson <ulfh@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, soc@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794920817; l=5303;
 i=yogo.0917.sabu@gmail.com; s=ypl514-20261117; h=from:subject:message-id;
 bh=2VJuHtWvJ/6kBBAKkOQqaxVnf8LunGjT3BvQbOpAQfM=;
 b=TqlrSuhkixWIR2lMSrU1nGDY+ADJU4gjIR3CMH3zWTCgohhAVNsc4WHccWXgrO6bUMFtL6UWE
 irl8pnb2GR4D1jPLdZS1FC97ZoM/BZRsaNtgzdRlcZRgSrzz+BDGTh1
X-Developer-Key: i=yogo.0917.sabu@gmail.com; a=ed25519;
 pk=TIQ8Tk4xQrxyn8rmk3GI2f5qg/kO6g2KZm7YOOyBHeg=
X-Endpoint-Received: by B4 Relay for
 yogo.0917.sabu@gmail.com/ypl514-20261117 with auth_id=1550
X-Original-From: yy-Local-LLM <yogo.0917.sabu@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: yogo.0917.sabu@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This RFC adds initial SiRF AT550 support for the ARM1136-based Yupiteru
YPL514si navigation device. It splits the working 6.12.60 bring-up into
normal kernel subsystems and ports it to the 7.4-rc3 development tree.

The device owner has now booted this 7.4-rc3 candidate on the YPL514si
through the JWM desktop, with the console and screen keyboard. The CE
handoff record confirms a 32 MiB Linux-owned allocation, all 8192 PFNs,
and a counter rate of 124387750 Hz. The deployed EXE/DLL hashes match the
prepared kit. The WM result is reported by the device owner, rather than
being inferred from the CE pre-handoff log.

The kernel uses standard IRQCHIP_DECLARE, TIMER_OF_DECLARE, common clock,
input polling, SDHCI PIO and simplefb paths. Generic ARM head.S, init/main.c,
MMU and RealView execution code are unchanged. The CE RAM allocator,
page-table checks, handoff bridge, DT fixups and GUI software are not part
of this kernel series.

Firmware must initialize SDRAM, peripheral clocks, pin multiplexing and
the LCD. The bootloader supplies the actual usable RAM and post-divider
counter rate in the DT, and enables only peripherals handed to Linux.
Memory/clock zero values in the source DTS are explicit fixup placeholders.
The timer driver preserves the divider and rejects a running watchdog.

Validation:
- AT550-only defconfig Image/DTB build, plus built-in/module leaf drivers.
- W=1 on the new drivers, dt_binding_check with examples/yamllint, scoped
  dtbs_check, and ARM32 tests of the actual loader DT fixups.
- ARM1136 QEMU at 16/24/32 MiB through JWM, five-point calibration,
  screen-keyboard input into rxvt/PTY/ash and a readonly SD fixture.
- Physical YPL514si boot through WM, reported by the device owner.
QEMU uses GIC/SP804/PL181 and synthetic touch, so it is not being presented
as validation of the physical AT550 controllers. The no-VFP defconfig also
produces an existing unused-variable W=1 warning in unmodified signal.c;
there are no reported new-driver warnings.

Initial limits: firmware clock/pin setup is inherited; cold initialization,
clock-tree control, DMA translation and board suspend are not implemented.
The board DT limits SD to 25 MHz, no 1.8 V, no MMC and no SDIO. SD writes,
card removal and suspend/resume have not been separately validated. The
AT551 draft was cross-checked with AT550 CE mappings and prior hardware
behavior; it is not claimed to be a complete AT550 specification.

I would appreciate early feedback on the initial platform scope and the
firmware/DT handoff contract before extending clock, pinctrl or DMA support.

Signed-off-by: yy-Local-LLM <yogo.0917.sabu@gmail.com>

---
yy-Local-LLM (6):
      dt-bindings: add SiRF AT550 and Yupiteru YPL514si descriptions
      irqchip: add the SiRF AT550 interrupt controller
      clocksource: add the SiRF AT550 counter and match timer
      Input: add polled SiRF AT550 resistive touch support
      mmc: sdhci: add SiRF AT550 programmed-I/O support
      ARM: add the SiRF AT550 platform and YPL514si board

 Documentation/arch/arm/at550.rst                   |  55 +++++++++
 Documentation/arch/arm/index.rst                   |   1 +
 .../devicetree/bindings/arm/sirf,at550.yaml        |  22 ++++
 .../bindings/input/touchscreen/sirf,at550-ts.yaml  |  36 ++++++
 .../interrupt-controller/sirf,at550-intc.yaml      |  46 +++++++
 .../devicetree/bindings/mmc/sirf,at550-sdhci.yaml  |  51 ++++++++
 .../bindings/timer/sirf,at550-timer.yaml           |  47 ++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  17 +++
 arch/arm/Kconfig                                   |   1 +
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/sirf/Makefile                    |   2 +
 arch/arm/boot/dts/sirf/at550-ypl514si.dts          |  52 ++++++++
 arch/arm/boot/dts/sirf/at550.dtsi                  |  66 ++++++++++
 arch/arm/configs/at550_defconfig                   |  34 ++++++
 arch/arm/mach-at550/Kconfig                        |  13 ++
 arch/arm/mach-at550/Makefile                       |   2 +
 arch/arm/mach-at550/at550.c                        |  11 ++
 drivers/clocksource/Kconfig                        |   6 +
 drivers/clocksource/Makefile                       |   2 +
 drivers/clocksource/timer-at550.c                  | 134 +++++++++++++++++++++
 drivers/input/touchscreen/Kconfig                  |  10 ++
 drivers/input/touchscreen/Makefile                 |   2 +
 drivers/input/touchscreen/at550-ts.c               | 108 +++++++++++++++++
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   2 +
 drivers/irqchip/irq-at550.c                        | 110 +++++++++++++++++
 drivers/mmc/host/Kconfig                           |  10 ++
 drivers/mmc/host/Makefile                          |   2 +
 drivers/mmc/host/sdhci-at550.c                     |  62 ++++++++++
 31 files changed, 914 insertions(+)
---
base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
change-id: 20261117-at550-rfc-v1-2591185a2fe8

Best regards,
--  
yy-Local-LLM <yogo.0917.sabu@gmail.com>



