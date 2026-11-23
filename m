Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F84C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QCza9OeM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TMGgafaP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KZfX+ZF6d3jxSf9WpYrXx6unSUfJtLVOGgikrC1kH6U=; b=QCza9OeMdc9/P+HZuICBYbXrrN
	sce29DSosvCn3+0E7ui9iv/fd3/gmdTReROYUAq6HmHKTR5TG1xsLG9DG/dnR2Nx9cSyaQKmAbWxr
	EO3u4y6JbVaJGhZttsfHqZL7zKp0qQUDVaJOciZF1ih0NYqN8mspc6U4K69G8hsmsRRufEZZ4qVrr
	6clPUTSXEqDL0xkEGB7xOZyylIxAufhc3EfF7gEk4Z2cs0qoyT/Zi59pJy3ct31AITDLgJkXd6im2
	gTnsoBARQ3xtNDebr+iC0c/KigIlpGRQNBQQT9Rf1NQprdxdW+QGZW7iVjNoJXHAY3k4mtefi1ytv
	nTmKM3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTzh-00000003YLp-1WYM;
	Mon, 23 Nov 2026 13:22:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTzg-00000003YLh-0dqQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:22:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C0334364B;
	Mon, 23 Nov 2026 13:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D687A1F000C0;
	Mon, 23 Nov 2026 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795440123;
	bh=KZfX+ZF6d3jxSf9WpYrXx6unSUfJtLVOGgikrC1kH6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TMGgafaPHDfKrZrodW+958mBFtGiFovNSmKRRX3mzyYR+/UORFpEttx/f+kDZn2xd
	 QjD8bvURHYb75aSBEz3uIb23mWlLOwfcBOnObmFKGvzQMYHVmBG00LBl4CgM/7+z80
	 Ec//Y1Z4SzUEKwmzZ3zWebqjccK8P++vImIEz8kTys/hyjl86N/SWsE3vvW/A52swj
	 +dLefTXln+SHLtCt1Oe/jvYTP9poeKBS8aEUz6JHxc3ikl5TgfOdM1R398BjxG7EKx
	 s1nn8g+AQB5aQo1KEAfEociw01ShjHDkYOiWTZoAaquGWYwqyQ5vzAjJjbpVvYYObu
	 CEXOexUivKJGw==
Date: Mon, 23 Nov 2026 21:01:37 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Richard GENOUD <richard.genoud@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 00/13] arm64: add Synaptics SL2610 SoCs and RDK boards
Message-ID: <awQ5MYARkTBxQpjC@xhacker>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <avrx2EhgZ10ED40P@xhacker>
 <26aa0b74-e3f8-4405-ab87-743f5f8ef197@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26aa0b74-e3f8-4405-ab87-743f5f8ef197@bootlin.com>
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

On Wed, Nov 18, 2026 at 08:54:05AM +0100, Richard GENOUD wrote:
> Le 16/11/2026 à 13:06, Jisheng Zhang a écrit :
> > On Sun, Nov 15, 2026 at 06:23:39PM +0800, Jisheng Zhang wrote:
> > > Add initial support for the Synaptics SL261X SoCs and corresponding
> > > RDK boards.
> > > 
> > > The SL261X SoCs include five pin-to-pin compatible SoCs: SL2611, SL2613,
> > > SL2615, SL2617, and SL2619.
> > > 
> > > Only reset, pinctrl, clk/pll, uart, gpio, i2c, spi, i3c are included in
> > > this series. The support for Ethernet, USB, SDHCI, CAN, DMAC, XSPI will
> > > be submitted after this series is merged.
> > > 
> > > since v1:
> > >   - rebase on latest rcN
> > >   - drop some patches which have been merged
> > >   - let the "gbl" node export pinctrl/reset/clk devices with
> > >     MFD_CELL_NAME()
> > >   - use <linux/platform_device.h> instead of <linux/mod_devicetable.h>
> > >   - adopt some coding suggestions from Uwe
> > >   - Use 0 and 1 to select normal and strong pull-up on 10-bit pads
> > 
> > Other SoCs doesn't use this defintion for pull up or strong pull up.
> > After consulting our HW people, the strong pull up isn't used at
> > all, so I will remove strong pull up support in newer version. We can
> > add back its support when it's really needed in the future, nothing
> > breaks.
> I've found a similar definition here:
> https://elixir.bootlin.com/linux/v7.3.1/source/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml#L73-L78

This one looks strange, and changes the meaning of bias-pull-up, I.E
if adding "bias-pull-up" to any pin node, then it means strong pull up
because the pinctrl subsys framework adds 1 by default. To use normal
pull up, this binding needs "bias-pull-up = <0>;", which looks ugly
IMHO.

> But also a plain new property here:
> https://elixir.bootlin.com/linux/v7.3.1/source/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml#L153-L155

I like this. But I'm not sure whether it's accepted or not.

> And another with the real strong pull-up value:
> https://elixir.bootlin.com/linux/v7.3.1/source/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml#L94-L99

This is standard solution.

> As you said, if it's not used, we can skip it and add a property in
> the future (or the real value if we have it).

skipping it makes sense now.

> 
> But we won't be able to use 1 for strong and 0 for normal.
> 
> Regards,
> Richard
> > 
> > >   - collect Acked-by tag
> > > 
> > > Jisheng Zhang (13):
> > >    arm64: kconfig: let ARCH_BERLIN cover Synaptics arm64 SoCs
> > >    pinctrl: berlin: use u16 instead of u8 for the offset
> > >    pinctrl: berlin: enable module build support
> > >    pinctrl: berlin: add optional pinconf support
> > >    dt-bindings: soc: synaptics: add SL2610 system controllers
> > >    soc: synaptics: add SL2610 system controller support
> > >    reset: add Synaptics SL2610 reset controller support
> > >    pinctrl: berlin: add Synaptics SL2610 pin controller support
> > >    clk: berlin: add Synaptics clock controller helpers
> > >    clk: berlin: add Synaptics SL2610 clocks and PLLs
> > >    dt-bindings: arm: berlin: add Synaptics SL2610 SoCs and RDK boards
> > >    arm64: dts: synaptics: add SL2610 family SoCs
> > >    arm64: dts: synaptics: add SL2610 family RDK boards
> > > 
> > >   .../bindings/arm/marvell,berlin.yaml          |  20 +
> > >   .../soc/synaptics/syna,sl2610-soc-syscon.yaml | 178 ++++
> > >   MAINTAINERS                                   |   8 +
> > >   arch/arm64/Kconfig.platforms                  |   4 +-
> > >   arch/arm64/boot/dts/synaptics/Makefile        |   5 +
> > >   arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +
> > >   arch/arm64/boot/dts/synaptics/sl2611.dtsi     | 457 +++++++++++
> > >   arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +
> > >   arch/arm64/boot/dts/synaptics/sl2613.dtsi     |  12 +
> > >   arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +
> > >   arch/arm64/boot/dts/synaptics/sl2615.dtsi     |  46 ++
> > >   arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +
> > >   arch/arm64/boot/dts/synaptics/sl2617.dtsi     |  46 ++
> > >   arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +
> > >   arch/arm64/boot/dts/synaptics/sl2619.dtsi     |  44 +
> > >   .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++
> > >   drivers/clk/Kconfig                           |   1 +
> > >   drivers/clk/berlin/Kconfig                    |  34 +
> > >   drivers/clk/berlin/Makefile                   |   4 +
> > >   drivers/clk/berlin/clk-sl2610.c               | 360 +++++++++
> > >   drivers/clk/berlin/sl-clk.c                   | 279 +++++++
> > >   drivers/clk/berlin/sl-clk.h                   |  31 +
> > >   drivers/clk/berlin/sl-sysmgr-clk.c            | 241 ++++++
> > >   drivers/clk/berlin/sl-sysmgr-clk.h            |  44 +
> > >   drivers/clk/berlin/sl2610-pll.c               | 145 ++++
> > >   drivers/clk/berlin/sl2610-pll.h               |  14 +
> > >   drivers/pinctrl/berlin/Kconfig                |  16 +
> > >   drivers/pinctrl/berlin/Makefile               |   1 +
> > >   drivers/pinctrl/berlin/berlin.c               | 259 +++++-
> > >   drivers/pinctrl/berlin/berlin.h               |  17 +-
> > >   drivers/pinctrl/berlin/pinctrl-sl2610.c       | 759 ++++++++++++++++++
> > >   drivers/reset/Kconfig                         |  13 +
> > >   drivers/reset/Makefile                        |   1 +
> > >   drivers/reset/reset-sl2610.c                  | 224 ++++++
> > >   drivers/soc/Kconfig                           |   1 +
> > >   drivers/soc/Makefile                          |   1 +
> > >   drivers/soc/synaptics/Kconfig                 |  14 +
> > >   drivers/soc/synaptics/Makefile                |   2 +
> > >   drivers/soc/synaptics/sl2610-syscon.c         |  84 ++
> > >   include/dt-bindings/clock/syna,sl2610.h       | 131 +++
> > >   include/dt-bindings/reset/syna,sl2610-reset.h |  80 ++
> > >   41 files changed, 3771 insertions(+), 20 deletions(-)
> > >   create mode 100644 Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2611.dtsi
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2613.dtsi
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2615.dtsi
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2617.dtsi
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2619.dtsi
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> > >   create mode 100644 drivers/clk/berlin/Kconfig
> > >   create mode 100644 drivers/clk/berlin/clk-sl2610.c
> > >   create mode 100644 drivers/clk/berlin/sl-clk.c
> > >   create mode 100644 drivers/clk/berlin/sl-clk.h
> > >   create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.c
> > >   create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.h
> > >   create mode 100644 drivers/clk/berlin/sl2610-pll.c
> > >   create mode 100644 drivers/clk/berlin/sl2610-pll.h
> > >   create mode 100644 drivers/pinctrl/berlin/pinctrl-sl2610.c
> > >   create mode 100644 drivers/reset/reset-sl2610.c
> > >   create mode 100644 drivers/soc/synaptics/Kconfig
> > >   create mode 100644 drivers/soc/synaptics/Makefile
> > >   create mode 100644 drivers/soc/synaptics/sl2610-syscon.c
> > >   create mode 100644 include/dt-bindings/clock/syna,sl2610.h
> > >   create mode 100644 include/dt-bindings/reset/syna,sl2610-reset.h
> > > 
> > > -- 
> > > 2.55.0
> > > 
> > > 
> > 
> 
> 
> -- 
> Richard Genoud, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

