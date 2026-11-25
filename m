Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929ED606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qjOuJrMP;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=OSr/PIGl;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tbJWeage
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fqmyTamj/9dbh6JDDHhPH2OGj8ho3WHvjuwZrgDskzs=; b=qjOuJrMPXIEDeD/X4RRsUmbH9x
	tcJx5ICtYQ55IVjBYo5qlJjeUOv1xTELYPQXuvxa48caitxmLO+fg7j1wcD5Rv+/wqXZyAez8xAU/
	Yt0jHYhC+SaRykDPxWSnNDimmIHNM07fFYfnuJ4VkzhbB0cklkIMMKTK5yti0UQ/D4dNVUo4q7D8D
	DnCCum0Rmk0wcbBCOEvxY5RXp1RmLj3wsyAWQPEq3R44jD/3iBLOO1EbIqJXsojIgKScWldrwa+ir
	XGZLA/AkknSizchetMDeOKygDNW5XI6zsQxhMRCqh4DRKIR4G+JQxhrN0NMbzp8y6gkDSpkUQLPLz
	Fo+7/dRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAQa-00000009Unr-1bhi;
	Wed, 25 Nov 2026 10:40:40 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAQX-00000009Ulo-2lUK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:40:39 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 156EEEC0BE8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:40:33 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 05:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1795603231; x=1795689631; bh=fq
	myTamj/9dbh6JDDHhPH2OGj8ho3WHvjuwZrgDskzs=; b=OSr/PIGlUWYwTUbL70
	UlTGEn2AIwteGk3qkY2muNYV3fn27J4AjK+0d7eOSJ/c/llHodA+eaFV2gflp61/
	FcaG9VrHC9urF+0XGLAPUfRZZ01EturyKbUrIOLjwAIx9oZ4F1dsURkuCNjqex26
	tV5w6XDsqehu+OB96SDdW1vpzNM7dSHEJ7DGoOYOl0UgoaJIOvkyKTv3XYJTVqKJ
	7wvfgBcohFBukpzSIAqcSBMHhHnbBWNSCUpP0cM2Xmx5lRVA6jCqlXVg7h5JQqqg
	eBJh3SxFO3N17g7EO/+l7ji44+lzBu5tivENlZAAlpHb3l6HolnzF24Nwswdhyq0
	s5BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1795603231; x=1795689631; bh=fqmyTamj/9dbh6JDDHhPH2OGj8ho
	3WHvjuwZrgDskzs=; b=tbJWeageAkHOii7fe+uMCknVNpGnyTn3eum9+3eyK9lO
	+qynlF4G/x3yMQoSWLP22G0VGQNV8E6Lhkya9fIny4DMEQ04OUi3wpx/1YFnn36e
	uxLrg4JFdvDGWLBGDG/W70cm7+0fqbSlKXpZBi5QgE+4fzAwX9ZkHkgdrAiKQ5RZ
	d7RUGQ2JgJo4wdUqUQF0Esq1P4Sve6PywcPMV9S6Za6oeQFqxNUZnzP0frUqCuAT
	jCUZjwjuFlYGFOQRQC014F/KLeVQkTQnDNmWkXD+GTi/qXFcWWGJ8KUQRRQzaP3b
	6FfAUNi2HtvFBcssRXpHTZiIAySxXTk0RacW6abIqA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795603231; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm3:rsa-sha256:HAF7/xlqVC74gHkBXGfDYFrdKzAJk3hc18Rkvz1MYyMdVBR
	u/JfJ7MD4KUYqUrVdhI92xqcjaMRTCRYkCzX7ucztJvAEl6CZ/X54jisqw7BmvAP
	xFL0KwiUSKNQukeaBMhPSAvO4Ctgd/MzSuk6RMIT2iRfyhYAmIEn41og4zY1eS0u
	xUU4IUdS3dHh20Rps8GT4givBU/hpd2/dfNmwnqCRQyBQIEOSMKUptF7rL04rdjE
	V7IKPHa28VrD15O6qy89Kdhy/5qgxIHQQR67Icj1XH6X1TggmdiBaufXD1dfjIj0
	rH28vgGj72RmTfdLEyu3cD6JTwx6zrtd6ZdN0Ug==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:IbO2G+UXx6r8Y3u+1YqV0mlkYNU3pyWFEuZyDRr8VQI=:yXJ5AJvKZGxYyhTM5H9MBV2KI8HyqbPWu9/lIp5SAmE=;
X-ME-Sender: <xms:HbsGa-SOs_SGWZWFXsBk-j6xnwcgcz8dkKCQykBYEkcP2hI1HXj4Wg>
    <xme:HbsGa-mCk9DOvNsyypDUqKMJoJ7QUcPYDQkztrRFErLKsmb-7U3qpJlqcEU3QvHlB
    55g1slmXr67oDsrlz12auT0dYhrpz2CaqOXamNvhiqq45Y5MbUoduQr>
X-ME-Proxy-Cause: dmFkZTGG7pEf92M/k8EnbFR/QDWdwgdoMT9W5oAR3eTtYQQkuLhLHoq7ZlzRQi3hgni6MA
    1c2R28TkvSpXAKG5guJgmteKSN1CbczPrgDQ1JVscGgM6a4NF42On/jBq+yRSINrbizSms
    HLqJiaWDfglaRcY5nkKSqspcsqyBOf6OiicrBEStbS3b/0PY7W/LAPRaWiSLOlG8broeda
    JKQ4Y0Lot/3hyoM8QybumokZ7Y4UEwx37GDLhXuBCntCGcbs7yFdmX5nVRT+I+jlmG1R3H
    vOUoWJMdCG9mhBjdUfW6UeLr4/oM5vPjBnxbG4MxzUbRsME90k0hY/2E699ZKfzv+zjFrs
    QTz39rgiYCs8UoUJxyLLIxhlfJzWjAG/oxNrvIMZj7WPkhafeW5Zs8JOleF5C7B5A8F1ZS
    FT5sBvCih1RtcwMxNTmnJxuAxj9QbSC7KnLz69f3fLexVXxM8+ukWyY03cnhM7CVaIqD2K
    ttxt5rBDLKwI/FUUvI7tU9CTaAs/B9GoqhpcVu01mjZ87FS43p+zCWrd1BOb0mYu/w6LQw
    BRSOBEjwlTzdjOjBJV3zu6DI60GdA7gRLQ+lstTsFHHoocf0I0KmoXgKSLgeaBOBBywFly
    AaFoOfVK5MK+1Au2UiAw8uatLMDTifnL/MqYJgsSbtBl7ACkfV54S1swlIxA
X-ME-Proxy: <xmx:HrsGa3_rAIZGE7KVk4owgjGe6b444PL5OTmnJTtscIencqCOyZ5JMA>
    <xmx:HrsGa6lFOTint0KexQim_qLI9UAx3Z2J-HQuw1wN1DUv-66L9gweHw>
    <xmx:HrsGa9UR180LLEGQyfXkyNdPdV2Zq-fxeR1_WQIpHaLhkH5fG7lNhw>
    <xmx:HrsGa_EflYozTrpwcjovLg-vbw_GQD-mtsmRsurwBxU_r6rosiBAaw>
    <xmx:H7sGa_3AMbmXhCyyFvHysQHhElbj-nbIMNkL0f6-3hbt-74L1ADztV1O>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9147832A0099; Wed, 25 Nov 2026 05:40:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 11:40:08 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <53b178d5-27b2-4718-8630-16f83a736227@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 7.4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_024037_780070_C3DAF7F7 
X-CRM114-Status: GOOD (  16.81  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:

  Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-7.4

for you to fetch changes up to 30275e284469c6f8bb2e1bf7a666b065a81b46c9:

  Merge tag 'stm32-dt-for-v7.4-fixes-1' of git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into arm/fixes (2026-11-24 17:25:45 +0100)

----------------------------------------------------------------
soc: fixes for 7.4

There are once more lots of individual device driver fixes across
several subsystems, and most of them look like they were found with
the help of LLM services looking more closely at corner cases that
had been missed before:

 - Multiple SCMI firmware fixes for probing device nodes and mailboxes

 - Notifications on Arm FFA firmware with hash conflicts

 - Out-of-bounds access to i.MX SCMI firmware data from userspace

 - Several error handling and probe fixes for reset controllers,
   along with a circular locking problem and one NULL pointer
   dereference

 - Multiple error handling fixes for memory controller drivers

 - A probe order fix for Raspberry Pi firmware

For the devicetree source files, there are relatively few fixes
so far, mainly for Samsung and ST SoC based machines, and mainly
covering broken functionality.

 - Suspend issues across ST SoCs

 - Boot time panic on one ST based board from accessing firmware
   memory

 - One revert for a regression caused by enabling IOMMU for
   USB on an i.MX8 based board.

 - Corrections for harmless mismatches to the actual boards
   from Arm and ST.

 - Broken Bluetooth and/or Wi-Fi on older Samsung Exynos based
   products

----------------------------------------------------------------
Arnd Bergmann (9):
      Merge tag 'arm-fw-fixes-7.4' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'renesas-fixes-for-v7.4-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into arm/fixes
      Merge tag 'samsung-fixes-7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/fixes
      Merge tag 'imx-fixes-7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into arm/fixes
      Merge tag 'arm-soc/for-7.4/maintainers-fixes' of https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'memory-controller-drv-fixes-7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into arm/fixes
      Merge tag 'arm-soc/for-7.4/drivers-fixes' of https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'reset-fixes-for-v7.4' of git://git.kernel.org/pub/scm/linux/kernel/git/pza/linux into arm/fixes
      Merge tag 'stm32-dt-for-v7.4-fixes-1' of git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into arm/fixes

Artem Utkin (1):
      ARM: dts: samsung: exynos4412-p4note: allow powering off the wifi card

Dario Binacchi (1):
      arm64: dts: st: add firmware reserved memory to Engicam MicroGEA-STM32MP257

David Cemin (1):
      firmware: arm_ffa: Compare notify_id when looking up notifier callbacks

Frank Li (1):
      Revert "arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information"

Geert Uytterhoeven (3):
      firmware: arm_scmi: Update ARM_SCMI_HAVE_TRANSPORT rationale
      firmware: arm_scmi: Fix grammar s/thing/things/
      perf/renesas: Remove remaining RISCV_ALTERNATIVE references

Hung-Chun Tseng (1):
      reset: spacemit: Fix the RCPU2 PWM reset registers

Jiri Slaby (1):
      MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com

Julian Braha (2):
      firmware: smccc: Provide stubs for HAVE_ARM_SMCCC_DISCOVERY=n
      irqchip/gic-v3: Select HAVE_ARM_SMCCC_DISCOVERY only on arm64

Krzysztof Kozlowski (2):
      memory: atmel-ebi: Disable SMC clock on probe failure
      memory: fsl_ifc: Clear fsl_ifc_ctrl_dev on probe failure and removal

Kunihiko Hayashi (1):
      reset: scmi: Set the device for the reset controller

Marek Szyprowski (2):
      ARM: dts: samsung: exynos4210-universal_c210: fix BCM4330 Bluetooth GPIOs
      ARM: dts: samsung: exynos4210-trats: fix BCM4330 Bluetooth GPIOs

Marek Vasut (3):
      arm64: dts: st: Move Bluetooth to USART2 on STM32MP23xx DHCOS SoM
      arm64: dts: st: Update gpio-line-names on STM32MP23xx DHCOS SoM
      ARM: dts: stm32: Fix STM32MP15xx DHCOM SoM PicoITX overlay application

Martin Wetterwald (1):
      platform/raspberrypi: vchiq: register bus at subsys_initcall

Myeonghun Pak (1):
      memory: tegra: Shut down Tegra210 EMC timers before teardown

Patrick Delaunay (3):
      arm64: dts: st: add PSCI idle state to STM32MP25 CPU domains
      arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains
      arm64: dts: st: mark STM32MP23 timer as stopping in suspend

Rob Herring (Arm) (1):
      arm64: dts: arm: corstone1000-a320: Fix GIC redistributor region size

Runyu Xiao (1):
      memory: fsl_ifc: guard optional NAND IRQ cleanup

Sasha Levin (1):
      memory: fsl_ifc: Do not dereference the unset global pointer in probe

Selby Mashiki (1):
      memory: tegra: fix device_node leak in tegra186_mc_probe_device()

Sudeep Holla (10):
      firmware: arm_scmi: Avoid protocol devices in exclusive raw mode
      firmware: arm_scmi: Skip requests for standard protocol devices
      pinctrl: imx: Match the standard SCMI pinctrl device
      firmware: arm_scmi: Skip unused performance-domain devices
      firmware: arm_scmi: Drop redundant ACPI configuration guard
      firmware: arm_scmi: imx: Track copied syslog words
      firmware: arm_scmi: imx: Validate MISC control response size
      firmware: arm_scmi: Unregister notifier on enable failure
      firmware: arm_scmi: Free mailbox state on mapping failure
      Merge branches 'for-next/smccc/fixes', 'for-next/scmi/fixes', 'for-next/ffa/fixes' and 'for-next/juno/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux

Tzung-Bi Shih (2):
      reset: Fix reset_control leak when put after controller unregister
      reset: Fix circular locking dependency in reset_controller_unregister()

Yang Siyuan (1):
      reset: core: honour optional resets when the GPIO fallback returns -ENOENT

 MAINTAINERS                                        |  10 +-
 arch/arm/boot/dts/samsung/exynos4210-trats.dts     |  11 ++-
 .../boot/dts/samsung/exynos4210-universal_c210.dts |  13 ++-
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi   |   1 +
 arch/arm/boot/dts/st/Makefile                      |   4 +-
 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi     |   2 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  |   4 -
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |  16 ++-
 arch/arm64/boot/dts/st/stm32mp233.dtsi             |   1 +
 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi  |  70 +++++++++++--
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  14 +++
 arch/arm64/boot/dts/st/stm32mp253.dtsi             |   1 +
 .../boot/dts/st/stm32mp257-engicam-microgea.dtsi   |  12 +++
 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi  |  47 +++++++++
 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi  |  45 ---------
 drivers/firmware/arm_ffa/driver.c                  |  11 ++-
 drivers/firmware/arm_scmi/Kconfig                  |   2 +-
 drivers/firmware/arm_scmi/bus.c                    | 110 ++++++++++++---------
 drivers/firmware/arm_scmi/driver.c                 |   4 -
 drivers/firmware/arm_scmi/notify.c                 |   4 +-
 drivers/firmware/arm_scmi/transports/Kconfig       |   2 +-
 drivers/firmware/arm_scmi/transports/mailbox.c     |   7 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  18 +++-
 drivers/irqchip/Kconfig                            |   2 +-
 drivers/memory/atmel-ebi.c                         |  27 +++--
 drivers/memory/fsl_ifc.c                           | 106 ++++++++++++--------
 drivers/memory/tegra/tegra186.c                    |   1 +
 drivers/memory/tegra/tegra210-emc-core.c           |  16 +--
 drivers/perf/Kconfig                               |   2 +-
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       |   2 +-
 .../raspberrypi/vchiq-interface/vchiq_arm.c        |   2 +-
 drivers/reset/core.c                               |  71 +++++++++----
 drivers/reset/reset-scmi.c                         |   1 +
 drivers/reset/spacemit/reset-spacemit-k1.c         |  18 ++--
 drivers/soc/renesas/Kconfig                        |   1 -
 include/linux/arm-smccc.h                          |   7 ++
 include/linux/firmware/imx/sm.h                    |   6 ++
 37 files changed, 455 insertions(+), 216 deletions(-)

