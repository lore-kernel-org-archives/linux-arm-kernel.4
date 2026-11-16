Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABB7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OJS6wYC2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JsH4mFLy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dnDC8kwE7249tTFrvzPYMbaxuX3Yw02/TxaNtz8codw=; b=OJS6wYC27VdLHtJGUpT4p/zW9O
	BwaPWVPtevZX6pB5eseBskn1xVPyu+ZVWvH4NZV7qINx2uEBOUaPpsfK/CynCP8LqBJWCBw5a0fsK
	oEXB4ENKwJe4cssYO/W5Lucwc6vNDWTm5Xu178O6S3+dGGSLDI+3gnK4ZkyPCx0iJQ1TkJbo97W74
	Bgk1hXYuokXvlDrwV0mL/1S3qjR3IKnfgy8zbTZuKWz5OVZEBQvK5GCvqLbb797V8K2jlxTl9NgZW
	6Z5UeDZCBmtJ2HXCy6dkgdHMNgJ1oSnzubrXLC3tCR3oUJKAOp+5F9n+53h8VLW9n6TtwkxfUXl8y
	UBK4eXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvne-00000002LKH-3X3R;
	Mon, 16 Nov 2026 12:27:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvnd-00000002LJj-1Rma
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:27:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B33D2629EF;
	Mon, 16 Nov 2026 12:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6041F000C5;
	Mon, 16 Nov 2026 12:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832024;
	bh=dnDC8kwE7249tTFrvzPYMbaxuX3Yw02/TxaNtz8codw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JsH4mFLyhjbwt935HUxFSnSGaThutUlYFl27mkdSbELFBjMksm+AGEioTf0gfmrIV
	 YXmBIWgkpIB9TgVMDX3IAcAFB8vb2JJewrMXpQEiFybwtGnfCjmwgC9+NeUJpJQ12W
	 haEGxO45ej2LQOaHaA5n2vbx0BgurCFs732yVjIaGw8BdHh/fdibB7nroBgDX4Zar5
	 isek0VL+Uv1T1uSC1W/lqC3zarCjaLiTniIxwxkQ2JYLh5ESU57ipBmrlchdU5+xZy
	 JDPFRpgcsBbD7VeOYGLhb9bak80v1Usu0xhkc4qCcfo9w/MkTAaIeGl2evIWYAgNrD
	 2encfW80TtAzQ==
Date: Mon, 16 Nov 2026 20:06:48 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 00/13] arm64: add Synaptics SL2610 SoCs and RDK boards
Message-ID: <avrx2EhgZ10ED40P@xhacker>
References: <20261115102401.3520-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
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

On Sun, Nov 15, 2026 at 06:23:39PM +0800, Jisheng Zhang wrote:
> Add initial support for the Synaptics SL261X SoCs and corresponding
> RDK boards.
> 
> The SL261X SoCs include five pin-to-pin compatible SoCs: SL2611, SL2613,
> SL2615, SL2617, and SL2619.
> 
> Only reset, pinctrl, clk/pll, uart, gpio, i2c, spi, i3c are included in
> this series. The support for Ethernet, USB, SDHCI, CAN, DMAC, XSPI will
> be submitted after this series is merged.
> 
> since v1:
>  - rebase on latest rcN
>  - drop some patches which have been merged
>  - let the "gbl" node export pinctrl/reset/clk devices with
>    MFD_CELL_NAME()
>  - use <linux/platform_device.h> instead of <linux/mod_devicetable.h>
>  - adopt some coding suggestions from Uwe
>  - Use 0 and 1 to select normal and strong pull-up on 10-bit pads 

Other SoCs doesn't use this defintion for pull up or strong pull up.
After consulting our HW people, the strong pull up isn't used at
all, so I will remove strong pull up support in newer version. We can
add back its support when it's really needed in the future, nothing
breaks.

>  - collect Acked-by tag
> 
> Jisheng Zhang (13):
>   arm64: kconfig: let ARCH_BERLIN cover Synaptics arm64 SoCs
>   pinctrl: berlin: use u16 instead of u8 for the offset
>   pinctrl: berlin: enable module build support
>   pinctrl: berlin: add optional pinconf support
>   dt-bindings: soc: synaptics: add SL2610 system controllers
>   soc: synaptics: add SL2610 system controller support
>   reset: add Synaptics SL2610 reset controller support
>   pinctrl: berlin: add Synaptics SL2610 pin controller support
>   clk: berlin: add Synaptics clock controller helpers
>   clk: berlin: add Synaptics SL2610 clocks and PLLs
>   dt-bindings: arm: berlin: add Synaptics SL2610 SoCs and RDK boards
>   arm64: dts: synaptics: add SL2610 family SoCs
>   arm64: dts: synaptics: add SL2610 family RDK boards
> 
>  .../bindings/arm/marvell,berlin.yaml          |  20 +
>  .../soc/synaptics/syna,sl2610-soc-syscon.yaml | 178 ++++
>  MAINTAINERS                                   |   8 +
>  arch/arm64/Kconfig.platforms                  |   4 +-
>  arch/arm64/boot/dts/synaptics/Makefile        |   5 +
>  arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +
>  arch/arm64/boot/dts/synaptics/sl2611.dtsi     | 457 +++++++++++
>  arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +
>  arch/arm64/boot/dts/synaptics/sl2613.dtsi     |  12 +
>  arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +
>  arch/arm64/boot/dts/synaptics/sl2615.dtsi     |  46 ++
>  arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +
>  arch/arm64/boot/dts/synaptics/sl2617.dtsi     |  46 ++
>  arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +
>  arch/arm64/boot/dts/synaptics/sl2619.dtsi     |  44 +
>  .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++
>  drivers/clk/Kconfig                           |   1 +
>  drivers/clk/berlin/Kconfig                    |  34 +
>  drivers/clk/berlin/Makefile                   |   4 +
>  drivers/clk/berlin/clk-sl2610.c               | 360 +++++++++
>  drivers/clk/berlin/sl-clk.c                   | 279 +++++++
>  drivers/clk/berlin/sl-clk.h                   |  31 +
>  drivers/clk/berlin/sl-sysmgr-clk.c            | 241 ++++++
>  drivers/clk/berlin/sl-sysmgr-clk.h            |  44 +
>  drivers/clk/berlin/sl2610-pll.c               | 145 ++++
>  drivers/clk/berlin/sl2610-pll.h               |  14 +
>  drivers/pinctrl/berlin/Kconfig                |  16 +
>  drivers/pinctrl/berlin/Makefile               |   1 +
>  drivers/pinctrl/berlin/berlin.c               | 259 +++++-
>  drivers/pinctrl/berlin/berlin.h               |  17 +-
>  drivers/pinctrl/berlin/pinctrl-sl2610.c       | 759 ++++++++++++++++++
>  drivers/reset/Kconfig                         |  13 +
>  drivers/reset/Makefile                        |   1 +
>  drivers/reset/reset-sl2610.c                  | 224 ++++++
>  drivers/soc/Kconfig                           |   1 +
>  drivers/soc/Makefile                          |   1 +
>  drivers/soc/synaptics/Kconfig                 |  14 +
>  drivers/soc/synaptics/Makefile                |   2 +
>  drivers/soc/synaptics/sl2610-syscon.c         |  84 ++
>  include/dt-bindings/clock/syna,sl2610.h       | 131 +++
>  include/dt-bindings/reset/syna,sl2610-reset.h |  80 ++
>  41 files changed, 3771 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2611.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2613.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2615.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2617.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2619.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
>  create mode 100644 drivers/clk/berlin/Kconfig
>  create mode 100644 drivers/clk/berlin/clk-sl2610.c
>  create mode 100644 drivers/clk/berlin/sl-clk.c
>  create mode 100644 drivers/clk/berlin/sl-clk.h
>  create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.c
>  create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.h
>  create mode 100644 drivers/clk/berlin/sl2610-pll.c
>  create mode 100644 drivers/clk/berlin/sl2610-pll.h
>  create mode 100644 drivers/pinctrl/berlin/pinctrl-sl2610.c
>  create mode 100644 drivers/reset/reset-sl2610.c
>  create mode 100644 drivers/soc/synaptics/Kconfig
>  create mode 100644 drivers/soc/synaptics/Makefile
>  create mode 100644 drivers/soc/synaptics/sl2610-syscon.c
>  create mode 100644 include/dt-bindings/clock/syna,sl2610.h
>  create mode 100644 include/dt-bindings/reset/syna,sl2610-reset.h
> 
> -- 
> 2.55.0
> 
> 

