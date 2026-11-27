Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B32F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ye6JteV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NZ51zRzk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OSXNuJngjAfGQOefMXneF5zx7XVLNh9rSZuUglCkjUg=; b=1ye6JteV50YwfV9z5A5h5xsVvi
	+IyRix/9FmkUdypUXKfWoqbES6QNWJkY7Q28CSEhLPxcd9BnyyL5YBgJiiDBTyL/WtMA7wJFUjzcx
	0vXgFFl4CiYwOjMk9VDfjxUW97O/8nCKENdfen/Pq+4fuhW7tR1Sz9q0wVNYdMnZcLuHO0HgCiUMc
	Obvn1S5yaCHkbsK0azUMmAIuxlMkigITugiNFV2hOUDvl9pgJ25durBySXbJUwYyFnEnCSz4mmlmJ
	EEdEjXQzdcYQAk+9pSBYgsHVvtCfpaCmXBqU5jJ1jwFIv03PRqQhNNihafME6dr1IPkE76OYrfM2Q
	XEut9qyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsxa-0000000FYrt-1vXQ;
	Fri, 27 Nov 2026 10:13:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsxW-0000000FYpy-0f6o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:13:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C48062738;
	Fri, 27 Nov 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795774416;
	b=crOSf1WoTEvpHgLyfCBGfVrvrTUEhQSCBwaz0Y9f9tCdMEikHowGJx6TME7/XUwGXuO3
	 F1H6+fZcSYcCv+nZwGpCVYXnqsb2RpcIx2DZ6wwCE2+XWHpNgu4kIfpW1cP1qCBTQFwAf
	 ZDhPEdSd7VsYw3UAUMwr+U1hut72kkF713zYzsG45C3RsgYlMuvzz2+B/agN7s4612lDK
	 UDf4Mcd14k9LSflRh+ynjlUwQsWMyiaWOaHJK39VOKCRxFNhoSIrFZ9BHispLIwXdW9tI
	 lCc2L10KY4+2YCCNv5o+1wkBs0JnUfc7XKgycdZANYwmw/NVW6i2rTeAISmJ2QBATbw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795774416;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=OSXNuJngjAfGQOefMXneF5zx7XVLNh9rSZuUglCkjUg=;
	b=jy2BkdduFJAcVBtQno1Xt9vYa3ofPZk2aYQ5y3a/ocDVDITTnLvXXhZrlv8+cXhgJAto
	 xoMTdgFZwaoZ+tAtAFE0KgBXemEOjJ47DgbCYTdxcHF5SQsXDoJKoYFukNa0KxvynJcKA
	 rTGqC5V8zOn8eOpPgxFh3czhT6Fc6oKNU9YW8zBcLHtw9rlEnGQ9+Q/9EOkOSelFcvrfa
	 ikublZsMvZyb7KmiHWyynfYl59Zg4I7QLTWpf9JLcFgTOojrc9ZxOt95AJ+w66e/M3VIe
	 cU9F6/NmR81w5qxVoAA+kNVLdiez5AwFN3r90XvD8m2pvyz6mBEc2YDXV11v53+3XwQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27E8E1F0089C;
	Fri, 27 Nov 2026 10:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774416;
	bh=OSXNuJngjAfGQOefMXneF5zx7XVLNh9rSZuUglCkjUg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=NZ51zRzkxB6lEZMcnJTbBW3NtRpJOoMxp3LOycv63SDP9ImsC0QG33TTd6grkGtZW
	 xPQbvpv1tfOslCOXeea3ysr730QwZbwT4Sm4AEdCM18bI2XlMc7gS8mcQMVreNM/Mi
	 Bq+fXtsxPtzJi7lF9+HqlHwNX+oTY1dgbl3Vip9FDX/PiLjSeWOYOLNZe6zltPLB1V
	 DZq2cYZkwl7y3fx4J+aXW19Rpkj2N2Fw1RCoU5biOa/fWrO5y9Zx+i7tKFQQqkIclw
	 NXSuotJHL03VJCaLCKE1ZiEAbTnNqqptHJLq+0zVyZhrth4SlhCAzRkqN3aAR4JZGE
	 lzWNXXbd9jO4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9CD234B6EF;
	Fri, 27 Nov 2026 10:13:21 +0000 (UTC)
From: Yuugo Yoneda via B4 Relay <devnull+yogo.0917.sabu.gmail.com@kernel.org>
Subject: [PATCH RFC v3 00/13] SiRF AT550 / YPL514si initial RAM-boot
 platform support
Date: Fri, 27 Nov 2026 19:13:01 +0900
Message-Id: <20261127-at550-rfc-v1-v3-0-f2221008912b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22N0QrCIBSGX2V4naFnmNpVEPQA3UYX6txmtC10S
 TH27jm7GRGcm//n/74zoWC9swHtiwl5G11wQ59CuSmQaVXfWOyqlBEQ2FFKOVYjYwT72uBIMTB
 JqWAKaitQQh7e1u6VdRd0Ph3R9VuGp75ZMy6iZda6MA7+nZ9Gmsf//ekIZoJLxkujBbBD0yl33
 5qhy+oIKxjoDwwJ1qQksiJcSA1reJ7nD5QDfwL8AAAA
X-Change-ID: 20261117-at550-rfc-v1-2591185a2fe8
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, soc@lists.linux.dev, 
 Yuugo Yoneda <yogo.0917.sabu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795774399; l=7683;
 i=yogo.0917.sabu@gmail.com; s=ypl514-20261117; h=from:subject:message-id;
 bh=tZ6hUjWMoeRL0jPauUl8TFF9B2/YqXtWXqzyQ/e73IE=;
 b=FzAf0nI87xQxM2Yierirv10tNcvJVsO1tSaMPlV9P9AU0WjWX9uazWfeocWRKiqikE37kSMJE
 Vzrj0b766DuBUEYPksiUsPnot4WbG3Wmepv0U48QyQKIjf4pQ11MA0R
X-Developer-Key: i=yogo.0917.sabu@gmail.com; a=ed25519;
 pk=TIQ8Tk4xQrxyn8rmk3GI2f5qg/kO6g2KZm7YOOyBHeg=
X-Endpoint-Received: by B4 Relay for
 yogo.0917.sabu@gmail.com/ypl514-20261117 with auth_id=1550
X-Original-From: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
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

This RFC adds initial platform support for the SiRF AT550 SoC
(ARM1136 r1p5, MIDR 0x4117b365) and the Yupiteru YPL514si portable
navigation device on top of 7.4-rc3.

The platform boots from RAM via a Windows CE bootloader trampoline using
standard IRQCHIP_DECLARE, TIMER_OF_DECLARE, common clock, polled input,
SDHCI PIO, and simplefb paths. Firmware initializes SDRAM, peripheral
clocks, pin multiplexing, and the LCD before handoff. The bootloader
supplies the Linux-owned RAM range in memory@c0000000 and the
post-divider counter rate in clock-counter, reserves the framebuffer
via a no-map reserved-memory node, and enables only handed-over
peripherals.

Validation status:
- Hardware: I booted both v1 and v2 on the YPL514si (the v2 CE handoff
  log confirmed a 32 MiB Linux allocation at 0xc1e00000, 8192 PFNs,
  124805090 Hz measured counter clock, and all three gated peripherals
  enabled). v3 only drops two redundant <linux/mod_devicetable.h>
  includes and reorders DT binding schema properties with no object-code
  or DTB changes.
- Local builds/checks for v3: at550_defconfig Image and DTB build
  (W=1), leaf drivers built in-kernel and as modules (W=1),
  multiplatform CONFIG_SMP=y + CONFIG_ARCH_AT550=y object builds (W=1),
  dt_binding_check, scoped dtbs_check, dt-check-style --mode strict,
  and b4 prep --check.
  (QEMU ARM1136 bring-up tests were run on v1 using GIC/SP804/PL181 and
  synthetic uinput rather than physical AT550 hardware, and ARM32
  bootloader DT fixup tests for 16/24/32 MiB were run on v2.)

Initial limits:
- Peripheral clock tree control, pinctrl, cold boot, SDHCI DMA
  translation, and suspend/resume are not implemented yet.
- The board DTS restricts SD to 25 MHz PIO, 3.3 V only, no MMC, and no
  SDIO; SD writes and card removal are untested.
- Register layouts were cross-checked against a third-party AT551 draft
  datasheet and observed CE mappings, which is not a complete AT550
  hardware specification.

I would appreciate early feedback on the overall platform split and the
firmware/DT handoff contract before extending clock, pinctrl, or DMA
support.

Signed-off-by: Yuugo Yoneda <yogo.0917.sabu@gmail.com>
---
Changes in v3:
- Drop redundant <linux/mod_devicetable.h> includes from at550-ts.c and
  sdhci-at550.c, as <linux/platform_device.h> already provides struct
  of_device_id (Uwe Kleine-König).
- List clocks before interrupts in sirf,at550-timer.yaml (properties,
  required, and example), sirf,at550-ts.yaml, and
  sirf,at550-sdhci.yaml to follow canonical DT schema property order.
- Link to v2: https://patch.msgid.link/20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com

Changes in v2:
- Use my real name (Yuugo Yoneda) in author headers, MAINTAINERS, DT
  binding maintainers, and Signed-off-by trailers.
- Split the monolithic bindings and platform patches into 13 commits
  following subsystem and SoC conventions, and rewrite commit logs and
  cover letter directly.
- Select CPU_ARM1136R1 instead of CPU_V6 in arch/arm/mach-at550/Kconfig
  (also avoiding !SMP conflicts in multiplatform builds), and disable
  CONFIG_ARCH_MULTI_V7 in at550_defconfig.
- Replace /memreserve/ with a /reserved-memory node using no-map in
  at550-ypl514si.dts so simplefb ioremap_wc() does not alias the ARM
  linear mapping.
- Update DT schemas to describe hardware instead of driver/firmware
  limits (allow optional interrupts/clocks in sirf,at550-ts.yaml and
  optional clocks in sirf,at550-sdhci.yaml, drop no-1-8-v from required
  in sirf,at550-sdhci.yaml, allow 1..6 match interrupts and maxItems: 1
  clock in sirf,at550-timer.yaml, and revise schema descriptions).
- Set IRQ_LEVEL on mapped level interrupts in irq-at550.c.
- Enable the timer clock before MMIO reads, disable the timer before
  reading/updating MATCH0, clear STATUS after writing MATCH0, and
  implement set_state_oneshot_stopped in timer-at550.c.
- Explicitly stop acquisition in at550_ts_close(), clear interrupts
  after mode changes, include mod_devicetable.h and bits.h (dropping
  unused bitfield.h), follow Input error-handling conventions, and fix
  coding style in at550-ts.c.
- Drop redundant ops/remove wrappers and premature caps/version checks,
  and include mod_devicetable.h in sdhci-at550.c.
- Sort subdir-y += sirf alphabetically with a trailing newline in
  arch/arm/boot/dts/Makefile, and fix strict dt-check-style node/property
  ordering and blank lines in at550.dtsi and at550-ypl514si.dts.
- Link to v1: https://patch.msgid.link/20261117-at550-rfc-v1-v1-0-5879573cb825@gmail.com

---
Yuugo Yoneda (13):
      dt-bindings: vendor-prefixes: add Yupiteru
      dt-bindings: arm: add SiRF AT550 and Yupiteru YPL514si
      dt-bindings: interrupt-controller: add SiRF AT550 interrupt controller
      irqchip: add SiRF AT550 interrupt controller driver
      dt-bindings: timer: add SiRF AT550 system timer
      clocksource/drivers/timer-at550: add SiRF AT550 counter and match timer
      dt-bindings: input: touchscreen: add SiRF AT550 touchscreen
      Input: add polled SiRF AT550 resistive touchscreen driver
      dt-bindings: mmc: add SiRF AT550 SDHCI host controller
      mmc: sdhci-at550: add SiRF AT550 programmed-I/O host driver
      ARM: at550: add SiRF AT550 platform support
      ARM: dts: sirf: add SiRF AT550 SoC and Yupiteru YPL514si board
      ARM: configs: add at550_defconfig

 Documentation/arch/arm/at550.rst                   |  56 +++++++++
 Documentation/arch/arm/index.rst                   |   1 +
 .../devicetree/bindings/arm/sirf,at550.yaml        |  22 ++++
 .../bindings/input/touchscreen/sirf,at550-ts.yaml  |  40 ++++++
 .../interrupt-controller/sirf,at550-intc.yaml      |  46 +++++++
 .../devicetree/bindings/mmc/sirf,at550-sdhci.yaml  |  50 ++++++++
 .../bindings/timer/sirf,at550-timer.yaml           |  51 ++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  17 +++
 arch/arm/Kconfig                                   |   1 +
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/sirf/Makefile                    |   2 +
 arch/arm/boot/dts/sirf/at550-ypl514si.dts          |  63 ++++++++++
 arch/arm/boot/dts/sirf/at550.dtsi                  |  69 +++++++++++
 arch/arm/configs/at550_defconfig                   |  35 ++++++
 arch/arm/mach-at550/Kconfig                        |  13 ++
 arch/arm/mach-at550/Makefile                       |   2 +
 arch/arm/mach-at550/at550.c                        |  11 ++
 drivers/clocksource/Kconfig                        |   6 +
 drivers/clocksource/Makefile                       |   2 +
 drivers/clocksource/timer-at550.c                  | 136 +++++++++++++++++++++
 drivers/input/touchscreen/Kconfig                  |  10 ++
 drivers/input/touchscreen/Makefile                 |   2 +
 drivers/input/touchscreen/at550-ts.c               | 123 +++++++++++++++++++
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   2 +
 drivers/irqchip/irq-at550.c                        | 111 +++++++++++++++++
 drivers/mmc/host/Kconfig                           |  10 ++
 drivers/mmc/host/Makefile                          |   2 +
 drivers/mmc/host/sdhci-at550.c                     |  50 ++++++++
 31 files changed, 942 insertions(+)
---
base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
change-id: 20261117-at550-rfc-v1-2591185a2fe8

Best regards,
--  
Yuugo Yoneda <yogo.0917.sabu@gmail.com>



