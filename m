Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E51D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 06:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uAKzYqGx;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=j/Qeg7lB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tZbehCCVWAQp16KYzP4ZlOLAW7PdEXUmB6Gq4qGN56g=; b=uAKzYqGxpkpY6rTZskblqjmZvG
	UHpFjTxW1bvZh4DgFf9k4/TcGmfc/lczYxutUiydGOW4icTxu4dQcRoQwJ0sbd8gKLJlEuem1NDSC
	8WA9LCuxr/FAE9B8KEKk90Ng/bnf8PeXdfyKv3ZFRyzUxup+6CCq7V3lWvBs1X9fWHmuURSgdIYPo
	rf5DQL0OKc2tCcVh/hse5/iuF9Hz+63tqoj2AoPOjsestyI+vgcSL4JfOmrsFUpydQ3ql4n+KK1xf
	IDxQCIlUTnMaqYU+fZ7HT6604mgso6NQJMMpfcjI0nlt7mBwYiyjCc6mIm0J+f/pBYj6/Ng0Pg9Mj
	iiNv0FEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIoX-0000000HUjs-30V3;
	Mon, 09 Nov 2026 06:25:09 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIoU-0000000HUiz-2dEo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 06:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794205498;
	bh=tZbehCCVWAQp16KYzP4ZlOLAW7PdEXUmB6Gq4qGN56g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j/Qeg7lBnFx7MbZ6d/nyR6LaZF2TIRCIpbxGcpl0PX8fkVaAsg7NcArOWgfjqkf/l
	 jZHZ3uUOoRovxymn8fAFzr1DKUb/nh74Db/6/CD4Dsvh1Z5n1wK/j573XzdTwmt+Or
	 8mBbbRN2fvHYSmvi+QoGOBfa8A4IoEjpVWnxICnollgS2EKc5rFti4jUZRW+AIsXlX
	 ceobV1fOOQaUYe/aKAySXOFMr/7kJ+5Vqd75QnaFh+bR+GtqcXAO9QW8LTXkBBQXpJ
	 reECfD7fz+hT/ZRrAxh0ExM9NmXYb1xMlCs0Ns2Q51K1jT+628vrrlGjFgbH8zUyzL
	 xScxue7q7aEYw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 54B956E9E9;
	Mon,  9 Nov 2026 14:24:57 +0800 (AWST)
Message-ID: <91edc3ed1d65a6765530895c6574714bfd76b8d0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Huang <jackyhuang@nvidia.com>, Joel Stanley <joel@jms.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Billy Tsai	 <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Mon, 09 Nov 2026 16:54:56 +1030
In-Reply-To: <70b7dd4c538ce72a2caf3b4420af3889e9b2dab7.1793705210.git.jackyhuang@nvidia.com>
References: <cover.1793705210.git.jackyhuang@nvidia.com>
	 <70b7dd4c538ce72a2caf3b4420af3889e9b2dab7.1793705210.git.jackyhuang@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_222506_897986_AE58E049 
X-CRM114-Status: GOOD (  16.57  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-03 at 20:47 +0900, Jacky Huang wrote:
> Add support for the NVIDIA MGX Vera C2 BMC based on the
> ASPEED AST2600 SoC.

Can you please expand the description of the platform? Why was it
designed and built? What's its purpose?

>=20
> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> ---
> Changes in v2:
> - Specify the console and baud rate in stdout-path and drop bootargs.
> - Use generic GPIO expander, fan controller and regulator node names.
> - Fix gpio-line-names indentation and GPIO bank comment formatting.
> - Remove duplicate GPIO line names.
>=20
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0.../aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts=C2=A0=C2=A0=C2=A0 | 1275=
 +++++++++++++++++
> =C2=A02 files changed, 1276 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2=
-bmc.dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index 6874b621d..e5c44d423 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -66,6 +66,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	aspeed-bmc-microsoft-olympus.dtb \
> =C2=A0	aspeed-bmc-nvidia-gb200nvl-bmc.dtb \
> =C2=A0	aspeed-bmc-nvidia-msx4-bmc.dtb \
> +	aspeed-bmc-nvidia-vr-c2-bmc.dtb \
> =C2=A0	aspeed-bmc-opp-lanyang.dtb \
> =C2=A0	aspeed-bmc-opp-mowgli.dtb \
> =C2=A0	aspeed-bmc-opp-nicole.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts
> new file mode 100644
> index 000000000..a044dfa00
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts
> @@ -0,0 +1,1275 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model =3D "AST2600 MGX Vera C2 BMC";
> +	compatible =3D "nvidia,vr-c2-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		i2c16 =3D &i2c_usbhub;
> +		i2c17 =3D &i2c_tpm;
> +		i2c18 =3D &i2c_dp;
> +		i2c19 =3D &i2c_rtc;
> +		i2c20 =3D &i2c_fan_ctrl0;
> +		i2c21 =3D &i2c_fan_ctrl1;
> +		i2c22 =3D &i2c_fan_iox;
> +		i2c23 =3D &i2c_fan_hsc;
> +		i2c30 =3D &i2c_mcio_c0c1_north0;
> +		i2c31 =3D &i2c_mcio_c0c1_north1;
> +		i2c32 =3D &i2c_mcio_c0c1_north2;
> +		i2c33 =3D &i2c_mcio_c0c1_north3;
> +		i2c34 =3D &i2c_mcio_c0c1_north4;
> +		i2c35 =3D &i2c_mcio_c0c1_north5;
> +		i2c36 =3D &i2c_mcio_c0c1_north6;
> +		i2c37 =3D &i2c_mcio_c0c1_north7;
> +		i2c40 =3D &i2c_mcio_c0_south0;
> +		i2c41 =3D &i2c_mcio_c0_south1;
> +		i2c42 =3D &i2c_mcio_c0_south2;
> +		i2c43 =3D &i2c_mcio_c0_south3;
> +		i2c44 =3D &i2c_mcio_c0_south4;
> +		i2c45 =3D &i2c_mcio_c0_south5;
> +		i2c46 =3D &i2c_mcio_c0_south6;
> +		i2c47 =3D &i2c_mcio_c0_south7;
> +		i2c50 =3D &i2c_mcio_c1_south0;
> +		i2c51 =3D &i2c_mcio_c1_south1;
> +		i2c52 =3D &i2c_mcio_c1_south2;
> +		i2c53 =3D &i2c_mcio_c1_south3;
> +		i2c54 =3D &i2c_mcio_c1_south4;
> +		i2c55 =3D &i2c_mcio_c1_south5;
> +		i2c56 =3D &i2c_mcio_c1_south6;
> +		i2c57 =3D &i2c_mcio_c1_south7;
> +		serial2 =3D &uart3;
> +		serial4 =3D &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial4:115200n8";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		fault-led {
> +			gpios =3D <&exp7 12 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		power-led {
> +			gpios =3D <&exp7 8 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		uid-led {
> +			gpios =3D <&exp7 10 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x80000000 0x80000000>;
> +	};
> +
> +	standby_power_regulator: regulator-standby-power {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio0 ASPEED_GPIO(M, 3) GPIO_ACTIVE_HIGH>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-name =3D "standby_power";
> +	};
> +
> +	reserved-memory {
> +		ranges;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +
> +		framebuffer@9f000000 {
> +			reg =3D <0x9f000000 0x01000000>;
> +			no-map;
> +		};
> +
> +		ramoops@a0000000 {
> +			compatible =3D "ramoops";
> +			reg =3D <0xa0000000 0x100000>;
> +			max-reason =3D <2>;
> +			record-size =3D <0x10000>;
> +		};
> +
> +		framebuffer {
> +			compatible =3D "shared-dma-pool";
> +			alignment =3D <0x01000000>;
> +			reusable;
> +			size =3D <0x01000000>;
> +		};
> +
> +		video_engine_memory: jpegbuffer {
> +			compatible =3D "shared-dma-pool";
> +			alignment =3D <0x01000000>;
> +			reusable;
> +			size =3D <0x02000000>;
> +		};
> +	};
> +};
> +
> +/*
> + * NVIDIA multi-interface MCU enumerates as hid-generic by default
> + * and binds to hid-cp2112 at runtime
> + */
> +&ehci1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	status =3D "okay";
> +
> +	hub@1 {
> +		compatible =3D "usb424,2514";
> +		reg =3D <1>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		hub@2 {
> +			compatible =3D "usb424,2422";
> +			reg =3D <2>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			hub@1 {
> +				compatible =3D "usb424,2514";
> +				reg =3D <1>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				device@1 {
> +					compatible =3D "usb955,cf11";
> +					reg =3D <1>;
> +					#address-cells =3D <2>;
> +					#size-cells =3D <0>;
> +
> +					cp2112: interface@1 {
> +						compatible =3D "usbif955,cf11.config1.1";
> +						reg =3D <1 1>;
> +						#gpio-cells =3D <2>;
> +						gpio-controller;
> +						#interrupt-cells =3D <2>;
> +						interrupt-controller;
> +
> +						i2c {
> +							#address-cells =3D <1>;
> +							#size-cells =3D <0>;
> +
> +							/* CPU0 IROT/thermal/SOCAMM/JTAG */
> +							gpio@50 {
> +								compatible =3D "nxp,pca9555";
> +								reg =3D <0x50>;
> +								gpio-controller;
> +								#gpio-cells =3D <2>;
> +								interrupt-controller;
> +								#interrupt-cells =3D <2>;
> +								interrupt-parent =3D <&cp2112>;
> +								interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +								gpio-line-names =3D
> +									"CPU0_IROT_RECOVERY_L_3V3-I",
> +									"CPU0_IROT_FATAL_ERR_L_3V3-I",
> +									"CPU0_OVERT_L-I",
> +									"C0_THERM_WARN_N-I",
> +									"C0_S0_THERM_OVERT_N-I",
> +									"CPU0_CHIPTHROT_L-I",
> +									"C0_SOCAMM_0_ID_PRSNT_N_1V8-I",
> +									"C0_SOCAMM_1_ID_PRSNT_N-I",
> +									"C0_SOCAMM_2_ID_PRSNT_N-I",
> +									"C0_SOCAMM_3_ID_PRSNT_N-I",
> +									"C0_SOCAMM_4_ID_PRSNT_N-I",
> +									"C0_SOCAMM_5_ID_PRSNT_N-I",
> +									"C0_SOCAMM_6_ID_PRSNT_N-I",
> +									"C0_SOCAMM_7_ID_PRSNT_N-I",
> +									"MCU_JTAG_BYPASS_CPU0_S-O",
> +									"MCU_JTAG_BYPASS_CPU0-O";

I assume the -{I,O} suffixes refer to input or output. Are they
necessary?

Andrew

