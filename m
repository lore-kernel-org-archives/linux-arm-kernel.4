Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4B3606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CXy8DNAP;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=hTwkZitU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C2cuMUzfqAtJpLaC4vioo9E+wmpwXHi1Jc/gRzevf2A=; b=CXy8DNAPUB1W1l
	Y591pZQhCjTacx2JHVRuc6vbXXLGArZbCWQMUtM6yeeveyOo8zUF8G9vqD95IYkep+S4wQR9le3mK
	EuneFJ1WDA2ozFvlStt95jbo3GMrvHADd1aPh4vvixOpIU3g/AT6uIL8COlSX60fNjzNp7t/HV49M
	OIayprlKH5k+ZrSluLSQq7WufdGiy3KZ/Uvkj/iXhAgwwssCRp/sS9L23Co81+9uoZ78JwV1l2n4l
	ezEVvEfPg2DvGY6N+SWaLkIV0BQE0Mb4XOWzVypHrARkvGhFwToL/RefETJdjJynLxzutzkg5r/gF
	hlWLERdkGJLsMtcamZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4fz-00000006C0W-2yK7;
	Wed, 11 Nov 2026 09:31:31 +0000
Received: from mail-m10146.netease.com ([154.81.10.146])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4fv-00000006Byv-0BCU;
	Wed, 11 Nov 2026 09:31:29 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 544c1233e;
	Wed, 11 Nov 2026 17:31:21 +0800 (GMT+08:00)
Message-ID: <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com>
Date: Wed, 11 Nov 2026 17:31:15 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576
 EVB1
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1c9f2996d03a7kunm04e86817850c70
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSEseVk0fGE1PHhlMTEkeT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hTwkZitUQQ0AbxuUDmb0AWUloKZZxsb8SuK/b3HEWHcV0LS/5b3NeJOa/zsz0bJvUSFbwvwY59ldiD5vsQ4ibLdox5bJQ/9+xbqdwywCalBxMSl0HS1QyEmzxpzzmygHPTL+fJQTjhuYup8dCYeQnv3QvwF8m+/i4magR2fDWg8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=C2cuMUzfqAtJpLaC4vioo9E+wmpwXHi1Jc/gRzevf2A=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_013127_940199_0063E00C 
X-CRM114-Status: GOOD (  19.81  )
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

Hi Alexey,

On 11/7/2026 1:52 AM, Alexey Charkov wrote:
> RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
> controller and a fixed-voltage VBUS supply.
> 
> Describe it in the device tree, including the wiring for both the USB and
> the DP side.
> 
> This makes the data roles follow the Type-C port's negotiation, so the
> port stops being host only. It also leaves the VBUS regulator to be
> managed by TCPM instead of being hardwired via the tangentially related
> phy-supply on a USB controller. DP lanes are also muxed dynamically by
> the USBDP PHY based on the Type-C port's negotiation, so the hacky fixed
> lane muxing also goes away.
>

Have you tested this? As far as I know, dw-dp driver does not support
Type-C HPD yet.

> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 150 ++++++++++++++++++++++-
>  1 file changed, 147 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> index f83d129f96f1..a9b27cdb2dfa 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>  #include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
>  #include "rk3576.dtsi"
>  
>  / {
> @@ -334,6 +335,22 @@ &combphy1_psu {
>  	status = "okay";
>  };
>  
> +&dp {
> +	status = "okay";
> +};
> +
> +&dp0_in {
> +	dp0_in_vp1: endpoint {
> +		remote-endpoint = <&vp1_out_dp>;
> +	};
> +};
> +
> +&dp0_out {
> +	dp0_out_con: endpoint {
> +		remote-endpoint = <&usbdp_phy_dp_in>;
> +	};
> +};
> +
>  &gmac0 {
>  	clock_in_out = "output";
>  	phy-mode = "rgmii-rxid";
> @@ -772,6 +789,58 @@ regulator-state-mem {
>  &i2c2 {
>  	status = "okay";
>  
> +	usbc0: typec-portc@4e {
> +		compatible = "hynetek,husb311", "richtek,rt1711h";
> +		reg = <0x4e>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usbc0_int>;
> +		vbus-supply = <&vbus5v0_typec>;
> +
> +		connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "source";
> +			source-pdos = <PDO_FIXED(5000, 2000,
> +						 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
> +
> +			altmodes {
> +				displayport {
> +					svid = /bits/ 16 <0xff01>;
> +					vdo = <0x00001c46>;
> +				};
> +			};
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					usbc0_hs: endpoint {
> +						remote-endpoint = <&usb_drd0_hs_ep>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					usbc0_ss: endpoint {
> +						remote-endpoint = <&usbdp_phy_ss_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					usbc0_sbu: endpoint {
> +						remote-endpoint = <&usbdp_phy_dp_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  	hym8563: rtc@51 {
>  		compatible = "haoyu,hym8563";
>  		reg = <0x51>;
> @@ -944,6 +1013,14 @@ usb_otg0_pwren: usb-otg0-pwren {
>  		usbc0_int: usbc0-int {
>  			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
>  		};
> +
> +		usbc0_sbu1: usbc0-sbu1 {
> +			rockchip,pins = <2 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		usbc0_sbu2: usbc0-sbu2 {
> +			rockchip,pins = <2 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
>  	};
>  
>  	wifi {
> @@ -1008,7 +1085,6 @@ &u2phy0 {
>  };
>  
>  &u2phy0_otg {
> -	phy-supply = <&vbus5v0_typec>;
>  	status = "okay";
>  };
>  
> @@ -1051,13 +1127,74 @@ &ufshc {
>  };
>  
>  &usbdp_phy {
> -	rockchip,dp-lane-mux = <2 3>;
> +	mode-switch;
> +	orientation-switch;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usbc0_sbu1 &usbc0_sbu2>;
> +	sbu1-dc-gpios = <&gpio2 RK_PA6 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios = <&gpio2 RK_PA7 GPIO_ACTIVE_HIGH>;
>  	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			usbdp_phy_ss_out: endpoint {
> +				remote-endpoint = <&usbc0_ss>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			usbdp_phy_ss_in: endpoint {
> +				remote-endpoint = <&usb_drd0_ss_ep>;
> +			};
> +		};
> +
> +		port@2 {
> +			reg = <2>;
> +
> +			usbdp_phy_dp_in: endpoint {
> +				remote-endpoint = <&dp0_out_con>;
> +			};
> +		};
> +
> +		port@3 {
> +			reg = <3>;
> +
> +			usbdp_phy_dp_out: endpoint {
> +				remote-endpoint = <&usbc0_sbu>;
> +			};
> +		};
> +	};
>  };
>  
>  &usb_drd0_dwc3 {
> -	dr_mode = "host";
> +	usb-role-switch;
>  	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			usb_drd0_hs_ep: endpoint {
> +				remote-endpoint = <&usbc0_hs>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			usb_drd0_ss_ep: endpoint {
> +				remote-endpoint = <&usbdp_phy_ss_in>;
> +			};
> +		};
> +	};
>  };
>  
>  &usb_drd1_dwc3 {
> @@ -1079,3 +1216,10 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>  		remote-endpoint = <&hdmi_in_vp0>;
>  	};
>  };
> +
> +&vp1 {
> +	vp1_out_dp: endpoint@a {
> +		reg = <ROCKCHIP_VOP2_EP_DP0>;
> +		remote-endpoint = <&dp0_in_vp1>;
> +	};
> +};
> 
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> change-id: 20261106-rk3576-evb1-husb311-00efcff4a808
> 
> Best regards,
> --  
> Alexey Charkov <alchark@flipper.net>

-- 
Best, 
Chaoyi

