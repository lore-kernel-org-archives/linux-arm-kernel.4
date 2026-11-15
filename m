Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E756606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 10:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AQ5dJCiK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGI1V7Zz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=K0usV5S3jHEW4yC1LWJVliW0T4AnD3cjicXTLsZKRec=; b=AQ5dJCiKHR3vvqGApS5XBN123j
	hcmpHH1xYgmrtgChnvP1IbVnDMNN5WNhyjhwTkgWZ0pptcZfZQfqqG3z4V0yIDYZ41jJHFyZD2MMg
	sOjJDK9G02O/9NFPHd8Gi83xPc3bMSglbAG2AawFd/IKgaHZVMNCfL/NvxDm553WaNpPFz5T+F+cS
	L+ewdzBgozgDDF4F9gjL+KlHa6ihfan/ipN9Ic2bYiwo8psxCL48/2j+h/UFgHC5+qszCUwb0rtLw
	1YwT4JGb3MhP+N0jtrGXM/VWXcLBWpjpNaVlHzeY5CXhBhVNkqJK3c7n/eq3TcJbT2tPPsbaxrR/l
	BQbLjZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXig-0000000HO3S-1XEc;
	Sun, 15 Nov 2026 10:44:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXie-0000000HO32-3t7H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 10:44:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43A6544737;
	Sun, 15 Nov 2026 10:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478141F000C4;
	Sun, 15 Nov 2026 10:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739460;
	bh=K0usV5S3jHEW4yC1LWJVliW0T4AnD3cjicXTLsZKRec=;
	h=From:To:Cc:Subject:Date;
	b=JGI1V7Zzd8yb3ZbfyVFj8g3xuja8R+tcIZwsWKaI5nHgHBQCEgMsI13pn7As7+1c2
	 pQ0NRP1FKWRt4FOIHsyH6L0iEZXB+YTTdqqO2dXUG0whw3SlJ9jeSYgtDRsyfBOkkD
	 0praGMeiXJ/4Fp0zSplJFa/mAZ4oM1Zu8q1j4Z8Tjn+RoL6GQ794C9klpN+4TcRGs+
	 0jlO5/PNw+YYqATXiI7691pjXEnR1D0YklfYFW+QTOP16IB/0kcdzSwDeo8CAkDc2u
	 8DUeWW9oqQfHUhzjz2nXG4G2k4Gs9NB2XNkuzWAWuOrwzByuRgC6YJO5gTiLLzOlRw
	 DDr7ZNTtfLTPw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 00/13] arm64: add Synaptics SL2610 SoCs and RDK boards
Date: Sun, 15 Nov 2026 18:23:39 +0800
Message-ID: <20261115102401.3520-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add initial support for the Synaptics SL261X SoCs and corresponding
RDK boards.

The SL261X SoCs include five pin-to-pin compatible SoCs: SL2611, SL2613,
SL2615, SL2617, and SL2619.

Only reset, pinctrl, clk/pll, uart, gpio, i2c, spi, i3c are included in
this series. The support for Ethernet, USB, SDHCI, CAN, DMAC, XSPI will
be submitted after this series is merged.

since v1:
 - rebase on latest rcN
 - drop some patches which have been merged
 - let the "gbl" node export pinctrl/reset/clk devices with
   MFD_CELL_NAME()
 - use <linux/platform_device.h> instead of <linux/mod_devicetable.h>
 - adopt some coding suggestions from Uwe
 - Use 0 and 1 to select normal and strong pull-up on 10-bit pads 
 - collect Acked-by tag

Jisheng Zhang (13):
  arm64: kconfig: let ARCH_BERLIN cover Synaptics arm64 SoCs
  pinctrl: berlin: use u16 instead of u8 for the offset
  pinctrl: berlin: enable module build support
  pinctrl: berlin: add optional pinconf support
  dt-bindings: soc: synaptics: add SL2610 system controllers
  soc: synaptics: add SL2610 system controller support
  reset: add Synaptics SL2610 reset controller support
  pinctrl: berlin: add Synaptics SL2610 pin controller support
  clk: berlin: add Synaptics clock controller helpers
  clk: berlin: add Synaptics SL2610 clocks and PLLs
  dt-bindings: arm: berlin: add Synaptics SL2610 SoCs and RDK boards
  arm64: dts: synaptics: add SL2610 family SoCs
  arm64: dts: synaptics: add SL2610 family RDK boards

 .../bindings/arm/marvell,berlin.yaml          |  20 +
 .../soc/synaptics/syna,sl2610-soc-syscon.yaml | 178 ++++
 MAINTAINERS                                   |   8 +
 arch/arm64/Kconfig.platforms                  |   4 +-
 arch/arm64/boot/dts/synaptics/Makefile        |   5 +
 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2611.dtsi     | 457 +++++++++++
 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2613.dtsi     |  12 +
 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2615.dtsi     |  46 ++
 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2617.dtsi     |  46 ++
 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2619.dtsi     |  44 +
 .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/berlin/Kconfig                    |  34 +
 drivers/clk/berlin/Makefile                   |   4 +
 drivers/clk/berlin/clk-sl2610.c               | 360 +++++++++
 drivers/clk/berlin/sl-clk.c                   | 279 +++++++
 drivers/clk/berlin/sl-clk.h                   |  31 +
 drivers/clk/berlin/sl-sysmgr-clk.c            | 241 ++++++
 drivers/clk/berlin/sl-sysmgr-clk.h            |  44 +
 drivers/clk/berlin/sl2610-pll.c               | 145 ++++
 drivers/clk/berlin/sl2610-pll.h               |  14 +
 drivers/pinctrl/berlin/Kconfig                |  16 +
 drivers/pinctrl/berlin/Makefile               |   1 +
 drivers/pinctrl/berlin/berlin.c               | 259 +++++-
 drivers/pinctrl/berlin/berlin.h               |  17 +-
 drivers/pinctrl/berlin/pinctrl-sl2610.c       | 759 ++++++++++++++++++
 drivers/reset/Kconfig                         |  13 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-sl2610.c                  | 224 ++++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/synaptics/Kconfig                 |  14 +
 drivers/soc/synaptics/Makefile                |   2 +
 drivers/soc/synaptics/sl2610-syscon.c         |  84 ++
 include/dt-bindings/clock/syna,sl2610.h       | 131 +++
 include/dt-bindings/reset/syna,sl2610-reset.h |  80 ++
 41 files changed, 3771 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2611.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2613.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2615.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2617.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2619.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
 create mode 100644 drivers/clk/berlin/Kconfig
 create mode 100644 drivers/clk/berlin/clk-sl2610.c
 create mode 100644 drivers/clk/berlin/sl-clk.c
 create mode 100644 drivers/clk/berlin/sl-clk.h
 create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.c
 create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.h
 create mode 100644 drivers/clk/berlin/sl2610-pll.c
 create mode 100644 drivers/clk/berlin/sl2610-pll.h
 create mode 100644 drivers/pinctrl/berlin/pinctrl-sl2610.c
 create mode 100644 drivers/reset/reset-sl2610.c
 create mode 100644 drivers/soc/synaptics/Kconfig
 create mode 100644 drivers/soc/synaptics/Makefile
 create mode 100644 drivers/soc/synaptics/sl2610-syscon.c
 create mode 100644 include/dt-bindings/clock/syna,sl2610.h
 create mode 100644 include/dt-bindings/reset/syna,sl2610-reset.h

-- 
2.55.0


