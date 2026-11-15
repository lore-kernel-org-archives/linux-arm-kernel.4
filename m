Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B6A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1xgwFO5E;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oi1NyMa1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GT9juIqv0pzA+7++xLfOlfDk3lBSzfT0CueDtSl1TI4=; b=1xgwFO5ERLvyyKkyT+14rK8Uur
	tzmQbT5I/FizlP9XlgnrPgKFfm+LsuaiudwMoug3a/QMbzMd3oyI/nTScs+eb8waU+HhS6OT8yPCL
	LN0voAYidyt8ehkmgoot24UTb7+sscYwHL7scfs1Dx5BlYBxuPlmu0GXrr2CWmQQAmlTGER9gfQos
	8xtJdatS+PN9ZblD9iZd6WIYGejJxE6K4+NCrM6CRK3LQ/0xUQgYPM/tTWughQejHsTJuU2nNa9oB
	eHEAd9ehqIbBarUtxV9pX5imK38lG39BXM9PEJ6cAxwPFM3I2jm+o+HAHA6zWS8NSqE4Hhr/Gtq0J
	AXU6eAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSa6j-0000000HY0J-24wV;
	Sun, 15 Nov 2026 13:17:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSa6i-0000000HXzt-1q0M
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 13:17:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 95ECB6120D;
	Sun, 15 Nov 2026 13:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3801F000C4;
	Sun, 15 Nov 2026 13:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794748639;
	bh=GT9juIqv0pzA+7++xLfOlfDk3lBSzfT0CueDtSl1TI4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Oi1NyMa1ImCkzjV/KowU5IExRVeANozsA7ovlygQTlijUpDhp7poK3rGM7PjJTtnb
	 6dNa/p9OHbOD8VPUbnoOQWJ0v1dbxBJdcC5jRST7EqzaVSMqCE5gb6dP7QXfm2NY4U
	 UWqYfNj+5pvAq2Z3HPwzGaVwLSoBtLCbDI26uXtLiMfABamHsTF65Cwije3keGcOil
	 pEuCvTMyfz5G9t+NZ5VOpd3J9HQ4Cm4vxWH3aGKxNnvkxnPunmgG45Z6CD0JTZoVby
	 HRp6pfsL3BimXqQnzN9SbNm4WdBSr3Io58a68ehXuabQv6WRV74qeytJuCj1T1QnOm
	 ttdiLRYFUXFyg==
Subject: Re: [PATCH v7 2/2] arm64: dts: imx95: Add support for Data Modul
 i.MX95 eDM SBC
From: netdev-bot+sashiko@kernel.org
To: marex@nabladev.com
Cc: linux-arm-kernel@lists.infradead.org, a-govindraju@ti.com,
 conor+dt@kernel.org, festevam@gmail.com, Frank.Li@nxp.com, krzk+dt@kernel.org,
 mkl@pengutronix.de, robh@kernel.org, vkoul@kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org
Date: Sun, 15 Nov 2026 13:17:18 +0000
Message-ID: <179474863800.488853.15317058153273620821@kernel.org>
In-Reply-To: <20261114001844.30606-2-marex@nabladev.com>
References: <20261114001844.30606-2-marex@nabladev.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] All three PCAL6524 expanders, U12 (gpio@20), U14 (gpio@21) and
  U13 (gpio@22), share the IO_XPNDR_INT_1V8 line on gpio5 11 and each…
- [Medium] Both KSZ9131 PHYs (ethphy0 at line 493, ethphy1 at line 503)
  take their interrupt from `<&gpio1 10 IRQ_TYPE_LEVEL_LOW>`.
- [Medium] The &usdhc3 (M.2 Key-E SDIO) node is enabled, but the slot's
  power enable VDD_3V3_M2-E_EN (U12 pin 5) and its reset M2-E_SDIO_RESET…
- [Low] The new board puts PERST# and slot power on the host-bridge nodes
  (`&pcie0 { reset-gpios = <&gpio5 13 ...>; vpcie-supply = <&reg_pcie0>;…
- [Low] The comment on &lpuart8 says "M7 Debug", but the node is `status
  = "okay"` with `uart-has-rtscts` and RTS/CTS pins muxed, so Linux owns…
- [Low] The V6 changelog says "Remove backlight supply nodes", but the
  `pinctrl_panel_backlight_lvds: backlightlvdsgrp` group…
- [Low] The commit message says "Currently supported are serial console,
  ethernet, eMMC, SD, SPI NOR, USB host and PCIe".

--

arm64: dts: imx95: Add support for Data Modul i.MX95 eDM SBC

This commit adds a device tree for the Data Modul i.MX95 eDM SBC, an
evaluation board for custom display units. It also adds the new dtb to
the freescale Makefile.

> Add support for Data Modul i.MX95 eDM SBC board. This is an
> evaluation board for various custom display units. Currently
> supported are serial console, ethernet, eMMC, SD, SPI NOR,
> USB host and PCIe.

[Severity: Low]
This isn't a bug, but the list above covers less than the DTS enables.

Beyond the listed items, the DTS also enables:

  - FlexCAN3/FlexCAN5 with ATA6563 PHYs
  - three sound cards (BT-SCO on SAI5, MICFIL, TAS2552 on SAI3)
  - SAI4
  - an EMC2301 fan controller and a TMP110 sensor
  - PMIC thermal zones, including a 140C passive trip on pf53arm that
    throttles all six A55 cores
  - GPIO LEDs, I3C2 and TPM3/TPM4
  - wdog3 with fsl,ext-reset-output

Could the commit message mention these too?

> diff --git a/arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dts
> new file mode 100644
> index 0000000000000..5ca26c6ab665f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dts
> @@ -0,0 +1,1079 @@

[ ... ]

> +&lpi2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c2>;
> +	status = "okay";
> +
> +	i2c2_gpio_expander_20: gpio@20 {	/* U12 */
> +		compatible = "nxp,pcal6524";
> +		reg = <0x20>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupts-extended = <&gpio5 11 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Medium]
Is IRQ_TYPE_LEVEL_HIGH the right polarity for the shared
IO_XPNDR_INT_1V8 line?

All three PCAL6524 expanders (U12 gpio@20, U14 gpio@21 and U13 gpio@22)
share gpio5 11, and all three use IRQ_TYPE_LEVEL_HIGH. The other in-tree
PCAL6524 users (imx91-11x11-evk, imx91-11x11-frdm, imx91-9x9-qsb and
imx93-11x11-evk-common) use active-low, for example:

arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi:
	interrupts = <27 IRQ_TYPE_LEVEL_LOW>;

In pinctrl_hog, the pad for this line has the same setting as the
open-drain, pulled-up LPI2C pads, so the line idles high:

	IMX95_PAD_XSPI1_SS1_B__GPIO5_IO_BIT11			0x40000b9e

pca953x_irq_setup() in drivers/gpio/gpio-pca953x.c requests the parent
IRQ at probe without overriding the trigger:

	ret = devm_request_threaded_irq(dev, client->irq, NULL, pca953x_irq_handler,
					IRQF_ONESHOT | IRQF_SHARED, dev_name(dev),
					chip);

So gpio5 is programmed with the LEVEL_HIGH type from DT.

With the line idling high, would this IRQ fire nonstop, with each
handler returning IRQ_NONE, until the spurious IRQ detector disables
gpio5 11? After that, no expander interrupt (V_12V0_PG, USB2_PWR_OC#,
TOUCH_INT, WDOG_IRQ#, TPM_IRQ, FAN_ALERT, ...) would be delivered.

This happens on every boot with CONFIG_GPIO_PCA953X_IRQ, even with no
consumers, because interrupt-controller and interrupts-extended are
present.

LEVEL_HIGH is only correct if the 3.3V to 1.8V translation on this line
inverts the signal. Does the board have an inverting stage there? If
so, could a comment say so?

> +		vcc-supply = <&reg_3p3v>;

[ ... ]

> +&lpuart2 {	/* M33 Debug */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	status = "reserved";
> +};

[ ... ]

> +&lpuart8 {	/* M7 Debug */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart8>;
> +	uart-has-rtscts;
> +	status = "okay";
> +};

[Severity: Low]
The comment says this is the M7 debug port, but Linux owns the node:
it is enabled with uart-has-rtscts and the RTS/CTS pins are muxed. The
M33 debug port (&lpuart2 above) uses status = "reserved".

Expander U12 also names "UART8_RS232-485_MODE0/1",
"UART8_RS232-485_Term_TX/RX" and "UART8_RS232-485_EN". That looks like
a user RS232/RS485 port.

Is the comment stale? Or should this node be status = "reserved", so
that Linux and the M7 firmware don't both drive LPUART8?

[ ... ]

> +&netc_emdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_emdio>;
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@1 {	/* KSZ9131RNXI U20 */
> +		compatible = "ethernet-phy-id0022.1640";
> +		reg = <1>;
> +		interrupts-extended = <&gpio1 10 IRQ_TYPE_LEVEL_LOW>;

[ ... ]

> +	ethphy1: ethernet-phy@2 {	/* KSZ9131RNXI U22 */
> +		compatible = "ethernet-phy-id0022.1640";
> +		reg = <2>;
> +		interrupts-extended = <&gpio1 10 IRQ_TYPE_LEVEL_LOW>;

[Severity: Medium]
Is the GPIO1_IO10 pad muxed to GPIO anywhere?

GPIO1_IO10 is ALT5 on the PDM_BIT_STREAM1 pad; ALT0 there is
PDM_BIT_STREAM_BIT1. From imx95-pinfunc.h:

#define IMX95_PAD_PDM_BIT_STREAM1__AONMIX_TOP_GPIO1_IO_BIT10          0x01E8 0x03EC 0x0000 0x05 0x00

None of the fsl,pins entries in this file select that function:

  - pinctrl_hog muxes the neighbouring GPIO1_IO11 (BOOT_MODE2) but not
    GPIO1_IO10.
  - The ethphy nodes have no pinctrl of their own.
  - pinctrl_pdm uses GPIO_IO05/06, not this pad.

Unless the System Manager or bootloader happens to set this pad to
ALT5, does the KSZ9131 INT_N signal ever reach gpio1? An IRQ is
declared, so phylib won't poll. Link up/down changes on both ENETC ports
could then go unnoticed.

The pad also gets no pull-up, which a shared active-low IRQ line would
need.

Every other GPIO this board uses (LEDs, SPI CS, SD CD, PCIe PERST#,
expander INT/RST, PEWAKE) is muxed explicitly in this file.

[ ... ]

> +&pcie0 {	/* M.2 Key-B */
> +	pinctrl-0 = <&pinctrl_pcie0>;
> +	pinctrl-names = "default";
> +	reset-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
> +	vpcie-supply = <&reg_pcie0>;
> +	status = "okay";
> +};
> +
> +&pcie1 {	/* M.2 Key-M */
> +	pinctrl-0 = <&pinctrl_pcie1>;
> +	pinctrl-names = "default";
> +	reset-gpios = <&gpio5 16 GPIO_ACTIVE_LOW>;
> +	vpcie-supply = <&reg_pcie1>;
> +	status = "okay";
> +};

[Severity: Low]
This isn't a bug, but should PERST# and the slot supply go on the root
port nodes instead of the host bridge?

imx95.dtsi provides pcie0_port0 and pcie1_port0 (pcie@0,
"pciclass,0604"). fsl,imx6q-pcie.yaml says:

  This property is deprecated, instead of referencing this property from the
  host bridge node, use the reset-gpios property from the root port node.

In pci-imx6.c, imx_pcie_host_init() parses the host-level reset only as
a fallback:

	/* Fall back to legacy binding for DT backwards compatibility */
	if (!imx_pcie_perst_found(bridge)) {
		ret = imx_pcie_parse_legacy_binding(imx_pcie);

The vpcie supply is also handled under "Legacy regulator handling for
DT backward compatibility".

The other i.MX95 boards (imx95-15x15-evk, imx95-15x15-frdm,
imx95-19x19-evk, imx95-19x19-frdm-pro) use this form instead:

	&pcie0_port0 {
		reset-gpios = <...>;
		vpcie3v3-supply = <...>;
	};

[ ... ]

> +&usdhc3 {	/* M.2 Key-E */
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc3>;
> +	bus-width = <4>;
> +	status = "okay";
> +};

[Severity: Medium]
How does the M.2 Key-E slot get powered and released from reset?

The slot's power enable and SDIO reset are U12 pins, but they appear
only in gpio-line-names:

	"UART8_RS232-485_EN", "VDD_3V3_M2-E_EN",
	...
	"M2-E_SDIO_RESET", "CAN3_STBY",

&usdhc3 has no vmmc-supply, mmc-pwrseq, non-removable or cd-gpios.

The Key-B and Key-M slots are different: their VDD_3V3_M2-x_EN pins are
wrapped in reg_pcie0 and reg_pcie1. Nothing references VDD_3V3_M2-E_EN
or M2-E_SDIO_RESET.

After the expander comes out of reset with all pins as inputs, Linux
never drives these two pins. Does the Key-E 3.3V rail and SDIO reset
then depend only on pull resistors or bootloader setup? It also seems
the MMC core could not power-cycle or reset the module during
suspend/resume or error recovery.

Boards such as imx91-11x11-evk and imx91-11x11-frdm describe this kind
of slot with a reg_usdhc3_vmmc regulator on an expander GPIO, plus
mmc-pwrseq-simple with reset-gpios. Would something similar work here?

[ ... ]

> +	pinctrl_panel_backlight_lvds: backlightlvdsgrp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO27__GPIO2_IO_BIT27			0x31e
> +		>;
> +	};

[Severity: Low]
This isn't a bug, but the v6 changelog says "Remove backlight supply
nodes", and this group is still defined with nothing referencing it.
Can it be dropped?

Similarly, &sai4 is enabled with pinctrl and assigned audio PLL clocks,
but no sound card uses it. sound-bt-sco uses &sai5, sound-micfil uses
&micfil and sound-tas2552 uses &sai3. Is &sai4 meant to be in this
patch?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114001844.30606-1-marex%40nabladev.com

