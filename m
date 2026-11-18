Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2723606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VXpVMIMd;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ehFSdTb7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tb4WIW6lqZ5+Z3GQF5djG9Xnbu4tg/4H1vvuQxWHZEg=; b=VXpVMIMdlSFjuL
	JLN0/Q8K+MtKZ9wx/NqugPPv1jNEzsPFojxw5tsr21FGCNlv8lkgraoITklf0NW6n8rYsxw/UltTf
	aFqclBhPGz6en2aYIVh2VB4oO3pTZ3L1OsNOYOdMoim7rOmDikZO12suA58s7u7+Ws0qJ5ygAlOlr
	UCSzsloTCBwH3JUwFC0+iF7+RvWiGegtYUrEldfRL7ARTEnf3lNWiZD49X8ZyEbjipds8zt3jTPFt
	eu8FLr9YvzhsT645omQBVCgX79LnPUDCX80fGMfBEt6SEUSoMGFRwJX8dDhlPfMeqYoKUeMJiRxBH
	hPIAG6sq1KTtmb6YhOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaUi-000000084V2-1LFe;
	Wed, 18 Nov 2026 07:54:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaUf-000000084UO-3Nn2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 07:54:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E20AC1A16A7;
	Wed, 18 Nov 2026 07:54:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B37195FE9B;
	Wed, 18 Nov 2026 07:54:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 433CB11BC05A5;
	Wed, 18 Nov 2026 08:54:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794988450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tb4WIW6lqZ5+Z3GQF5djG9Xnbu4tg/4H1vvuQxWHZEg=;
	b=ehFSdTb7uzrE6rWYmg35Q80WHEhS+LYoh5/jgxjMBUtq3YOPIPQRNGsHszTdpZDhC0eM+h
	+Z3t9bGej6AxdCqgXoUS40XFXxMHaFCkeB5XmXEtEBOfc8UIa4zUko7flR9Yj2eRi2ARIl
	zmRXEpcBIlSf3oPeCV1DeD9lc+W+zOztiZJFW4hGoTy5pixgPuCVFuqH4mg9euuq4OMoOR
	c3YH3rjGHsxXELQXYqWaG/m0ycwKUr6t8xa2wkIde2j+85OG04m696IEyDZ3LZ7kLRsAV5
	EPKg1J4Vp4wedu0QFepN1tbPB+blaLolM0E2FQTvOZRk6tvDmSCRossHxazw8w==
Message-ID: <26aa0b74-e3f8-4405-ab87-743f5f8ef197@bootlin.com>
Date: Wed, 18 Nov 2026 08:54:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] arm64: add Synaptics SL2610 SoCs and RDK boards
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261115102401.3520-1-jszhang@kernel.org>
 <avrx2EhgZ10ED40P@xhacker>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <avrx2EhgZ10ED40P@xhacker>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_235414_157671_941D152D 
X-CRM114-Status: GOOD (  19.10  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Le 16/11/2026 à 13:06, Jisheng Zhang a écrit :
> On Sun, Nov 15, 2026 at 06:23:39PM +0800, Jisheng Zhang wrote:
>> Add initial support for the Synaptics SL261X SoCs and corresponding
>> RDK boards.
>>
>> The SL261X SoCs include five pin-to-pin compatible SoCs: SL2611, SL2613,
>> SL2615, SL2617, and SL2619.
>>
>> Only reset, pinctrl, clk/pll, uart, gpio, i2c, spi, i3c are included in
>> this series. The support for Ethernet, USB, SDHCI, CAN, DMAC, XSPI will
>> be submitted after this series is merged.
>>
>> since v1:
>>   - rebase on latest rcN
>>   - drop some patches which have been merged
>>   - let the "gbl" node export pinctrl/reset/clk devices with
>>     MFD_CELL_NAME()
>>   - use <linux/platform_device.h> instead of <linux/mod_devicetable.h>
>>   - adopt some coding suggestions from Uwe
>>   - Use 0 and 1 to select normal and strong pull-up on 10-bit pads
> 
> Other SoCs doesn't use this defintion for pull up or strong pull up.
> After consulting our HW people, the strong pull up isn't used at
> all, so I will remove strong pull up support in newer version. We can
> add back its support when it's really needed in the future, nothing
> breaks.
I've found a similar definition here:
https://elixir.bootlin.com/linux/v7.3.1/source/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml#L73-L78
But also a plain new property here:
https://elixir.bootlin.com/linux/v7.3.1/source/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml#L153-L155
And another with the real strong pull-up value:
https://elixir.bootlin.com/linux/v7.3.1/source/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml#L94-L99
As you said, if it's not used, we can skip it and add a property in
the future (or the real value if we have it).

But we won't be able to use 1 for strong and 0 for normal.

Regards,
Richard
> 
>>   - collect Acked-by tag
>>
>> Jisheng Zhang (13):
>>    arm64: kconfig: let ARCH_BERLIN cover Synaptics arm64 SoCs
>>    pinctrl: berlin: use u16 instead of u8 for the offset
>>    pinctrl: berlin: enable module build support
>>    pinctrl: berlin: add optional pinconf support
>>    dt-bindings: soc: synaptics: add SL2610 system controllers
>>    soc: synaptics: add SL2610 system controller support
>>    reset: add Synaptics SL2610 reset controller support
>>    pinctrl: berlin: add Synaptics SL2610 pin controller support
>>    clk: berlin: add Synaptics clock controller helpers
>>    clk: berlin: add Synaptics SL2610 clocks and PLLs
>>    dt-bindings: arm: berlin: add Synaptics SL2610 SoCs and RDK boards
>>    arm64: dts: synaptics: add SL2610 family SoCs
>>    arm64: dts: synaptics: add SL2610 family RDK boards
>>
>>   .../bindings/arm/marvell,berlin.yaml          |  20 +
>>   .../soc/synaptics/syna,sl2610-soc-syscon.yaml | 178 ++++
>>   MAINTAINERS                                   |   8 +
>>   arch/arm64/Kconfig.platforms                  |   4 +-
>>   arch/arm64/boot/dts/synaptics/Makefile        |   5 +
>>   arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +
>>   arch/arm64/boot/dts/synaptics/sl2611.dtsi     | 457 +++++++++++
>>   arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +
>>   arch/arm64/boot/dts/synaptics/sl2613.dtsi     |  12 +
>>   arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +
>>   arch/arm64/boot/dts/synaptics/sl2615.dtsi     |  46 ++
>>   arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +
>>   arch/arm64/boot/dts/synaptics/sl2617.dtsi     |  46 ++
>>   arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +
>>   arch/arm64/boot/dts/synaptics/sl2619.dtsi     |  44 +
>>   .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++
>>   drivers/clk/Kconfig                           |   1 +
>>   drivers/clk/berlin/Kconfig                    |  34 +
>>   drivers/clk/berlin/Makefile                   |   4 +
>>   drivers/clk/berlin/clk-sl2610.c               | 360 +++++++++
>>   drivers/clk/berlin/sl-clk.c                   | 279 +++++++
>>   drivers/clk/berlin/sl-clk.h                   |  31 +
>>   drivers/clk/berlin/sl-sysmgr-clk.c            | 241 ++++++
>>   drivers/clk/berlin/sl-sysmgr-clk.h            |  44 +
>>   drivers/clk/berlin/sl2610-pll.c               | 145 ++++
>>   drivers/clk/berlin/sl2610-pll.h               |  14 +
>>   drivers/pinctrl/berlin/Kconfig                |  16 +
>>   drivers/pinctrl/berlin/Makefile               |   1 +
>>   drivers/pinctrl/berlin/berlin.c               | 259 +++++-
>>   drivers/pinctrl/berlin/berlin.h               |  17 +-
>>   drivers/pinctrl/berlin/pinctrl-sl2610.c       | 759 ++++++++++++++++++
>>   drivers/reset/Kconfig                         |  13 +
>>   drivers/reset/Makefile                        |   1 +
>>   drivers/reset/reset-sl2610.c                  | 224 ++++++
>>   drivers/soc/Kconfig                           |   1 +
>>   drivers/soc/Makefile                          |   1 +
>>   drivers/soc/synaptics/Kconfig                 |  14 +
>>   drivers/soc/synaptics/Makefile                |   2 +
>>   drivers/soc/synaptics/sl2610-syscon.c         |  84 ++
>>   include/dt-bindings/clock/syna,sl2610.h       | 131 +++
>>   include/dt-bindings/reset/syna,sl2610-reset.h |  80 ++
>>   41 files changed, 3771 insertions(+), 20 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
>>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
>>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2611.dtsi
>>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
>>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2613.dtsi
>>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
>>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2615.dtsi
>>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
>>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2617.dtsi
>>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
>>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2619.dtsi
>>   create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
>>   create mode 100644 drivers/clk/berlin/Kconfig
>>   create mode 100644 drivers/clk/berlin/clk-sl2610.c
>>   create mode 100644 drivers/clk/berlin/sl-clk.c
>>   create mode 100644 drivers/clk/berlin/sl-clk.h
>>   create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.c
>>   create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.h
>>   create mode 100644 drivers/clk/berlin/sl2610-pll.c
>>   create mode 100644 drivers/clk/berlin/sl2610-pll.h
>>   create mode 100644 drivers/pinctrl/berlin/pinctrl-sl2610.c
>>   create mode 100644 drivers/reset/reset-sl2610.c
>>   create mode 100644 drivers/soc/synaptics/Kconfig
>>   create mode 100644 drivers/soc/synaptics/Makefile
>>   create mode 100644 drivers/soc/synaptics/sl2610-syscon.c
>>   create mode 100644 include/dt-bindings/clock/syna,sl2610.h
>>   create mode 100644 include/dt-bindings/reset/syna,sl2610-reset.h
>>
>> -- 
>> 2.55.0
>>
>>
> 


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

