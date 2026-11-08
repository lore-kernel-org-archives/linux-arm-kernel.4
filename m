Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058AC606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 03:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1NP5LWMF;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=P8WiBGr9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lM3R06lN5RqvDRl/k2tH4ahMeiHYdM12iCHEJrgC6wk=; b=1NP5LWMFT0xf6V
	re4hSJLGav6z0VuuFe19Q2isf0ykqabiOK7/+A3KFpMI47V1UAEumT60NeG11QnTRvokdGb0d6uPY
	gNZRZMho/SlEAMHOuD2boNW4dolc/Rwlfi2QK6TagaDW1VdW0on730vT+1stJHJ5Ry+Apz2hziTsf
	WqQN9ebuTk1PwVNQ/GlzM49tXzC2FLdfpgmq50Eh0A2ka9NDpQpdrDP6ya8IgnAjIxjA4vbSG5r+I
	mjifgZ+fjKlcFC3huDX2XCHhoY3EDrnOtLISE3N7IJrwkc4mfGoWDRof2zAvM/T75nXS4WpT67dyG
	2Q9G3iv6B25jWhoFqSPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPtNK-0000000FdMW-3veD;
	Sun, 08 Nov 2026 03:15:22 +0000
Received: from mail-m160236537.xmail.ntesmail.com ([160.236.53.7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPtNF-0000000FdLv-39x9;
	Sun, 08 Nov 2026 03:15:21 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53e05798d;
	Sun, 8 Nov 2026 11:15:11 +0800 (GMT+08:00)
Message-ID: <f066ac3f-1720-479b-a2e9-198a96d03dd6@rock-chips.com>
Date: Sun, 8 Nov 2026 11:15:09 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <20261106-rk3588-evb1-dt-updates-v1-4-bdbe16223589@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-4-bdbe16223589@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1b9271f9d03a7kunm71851a523ae3dc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCS0kYVh9OTxlIH0sYQh9PQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=P8WiBGr9wnTcvHB2H8l9sl8SKmN0k54UNOfHgSTjHwSZ13FvJWN3ot57OepT4gft0OATr3R288gLEOJE989yutl2wuvTLvA/8KHdc8pKGoQAx1kCBPrutFigfI0NXpdxjVjHQ9W/6CAj1AxtbWZIuYDnRia5x6m/+/Ghp15zQxk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=lM3R06lN5RqvDRl/k2tH4ahMeiHYdM12iCHEJrgC6wk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_191518_970979_E752C5F6 
X-CRM114-Status: GOOD (  14.20  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sebastian,

On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
> The RK3588 EVB1 comes with a W552793DBA-V10 Touchscreen/Display
> combination. It contains a Wanchanglong W552793BAA panel and a
> Goodix GT1158 touchscreen. This adds the DT description of it.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 90 ++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> index 6a95a8bb6fb8..327ca13b60f0 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> @@ -204,6 +204,15 @@ vcc12v_dcin: regulator-vcc12v-dcin {
>  		regulator-max-microvolt = <12000000>;
>  	};
>  

I seem unable to apply the patch to the latest linux-next tree.

So I tried to resolve the conflict manually, but the actual
test screen did not display. I will look into this further.


> +	vcc3v3_lcd_mipi: regulator-vcc3v3-lcd-mipi {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_lcd_mipi";
> +		regulator-boot-on;
> +		enable-active-high;
> +		gpio = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&vcc_3v3_s0>;
> +	};
> +
>  	vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc3v3_pcie30";
> @@ -338,6 +347,43 @@ &cpu_l3 {
>  	cpu-supply = <&vdd_cpu_lit_s0>;
>  };
>  
> +&dsi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "wanchanglong,w552793baa", "raydium,rm67200";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lcd_rst_gpio>;
> +		vdd-supply = <&vcc3v3_lcd_mipi>;
> +		iovcc-supply = <&vcc3v3_lcd_mipi>;
> +		vsp-supply = <&vcc5v0_sys>;
> +		vsn-supply = <&vcc5v0_sys>;
> +		reset-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			mipi_panel_in: endpoint {
> +				remote-endpoint = <&dsi0_out_panel>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi0_in {
> +	dsi0_in_vp3: endpoint {
> +		remote-endpoint = <&vp3_out_dsi0>;
> +	};
> +};
> +
> +&dsi0_out {
> +	dsi0_out_panel: endpoint {
> +		remote-endpoint = <&mipi_panel_in>;
> +	};
> +};
> +
>  &gmac0 {
>  	clock_in_out = "output";
>  	phy-handle = <&rgmii_phy>;
> @@ -495,6 +541,22 @@ hym8563: rtc@51 {
>  	};
>  };
>  
> +&i2c6 {
> +	status = "okay";
> +
> +	gt1x: touchscreen@14 {
> +		compatible = "goodix,gt1158";
> +		reg = <0x14>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touchscreen_pins>;
> +		reset-gpios = <&gpio0 RK_PD2 GPIO_ACTIVE_HIGH>;
> +		AVDD28-supply = <&vcc3v3_lcd_mipi>;
> +		VDDIO-supply = <&vcc3v3_lcd_mipi>;
> +	};
> +};
> +
>  &i2c7 {
>  	status = "okay";
>  
> @@ -543,6 +605,10 @@ rgmii_phy: ethernet-phy@1 {
>  	};
>  };
>  
> +&mipidcphy0 {
> +	status = "okay";
> +};
> +
>  &pcie2x1l0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pcie2_0_rst>, <&pcie2_0_wake>, <&pcie2_0_clkreq>, <&wifi_host_wake_irq>;
> @@ -664,6 +730,12 @@ hym8563_int: hym8563-int {
>  		};
>  	};
>  
> +	mipi_dsi {
> +		lcd_rst_gpio: lcd-rst {
> +			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
>  	pcie2 {
>  		pcie2_0_rst: pcie2-0-rst {
>  			rockchip,pins = <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
> @@ -692,6 +764,14 @@ vcc3v3_pcie30_en: vcc3v3-pcie30-en {
>  		};
>  	};
>  
> +	touchscreen {
> +		touchscreen_pins: touchscreen-pins {
> +			rockchip,pins =
> +				<0 RK_PD2 RK_FUNC_GPIO &pcfg_pull_up>,
> +				<0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
>  	usb {
>  		vcc5v0_host_en: vcc5v0-host-en {
>  			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> @@ -1534,3 +1614,13 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
>  		remote-endpoint = <&hdmi1_in_vp1>;
>  	};
>  };
> +
> +&vp3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	vp3_out_dsi0: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
> +		reg = <ROCKCHIP_VOP2_EP_MIPI0>;
> +		remote-endpoint = <&dsi0_in_vp3>;
> +	};
> +};
> 

-- 
Best, 
Chaoyi


