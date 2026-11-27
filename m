Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CD4606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 04:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Wb1PPX6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrWIm/fE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GCWB8FuEhHVOfDpGcddmAsTtaa85coe0yJXmYchM8Pk=; b=4Wb1PPX6ZhE0OZOVX06AqZeYtH
	YM4F+0/JHV+2NPhaZ6EYqcP2ppX4sAodvqHVlCLN3GxNrjbMRZxtB4p/Qhu/Ycl3K8SXvv0hZQ6wB
	O7PhVMTsNqqDpZ+kdwIizES/2Rj6PZbjgvBvMir0ojrVYMqxGjz7Qv3ouLw0OtGYnRJAyUsSRB3U8
	+GJeEE4l+tZWT5qGtx9Ec3ScNuOnnlPeHT+UbN0T1rA4oq55wUXkQj02I/mdsmcosOPsC/jG+VqX/
	EEZO5IGG/8syfmKu7hOTYQz08IFquNCwJACARZsfGarRk2kf6E80wmYmPcoYc4W+7I9EcgeCAhxSK
	DzwxTY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWnas-0000000EuHy-1G9Y;
	Fri, 27 Nov 2026 04:29:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWnan-0000000EuH9-3MQu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 04:29:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso54781165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 20:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753788; x=1796358588; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GCWB8FuEhHVOfDpGcddmAsTtaa85coe0yJXmYchM8Pk=;
        b=lrWIm/fEUQHhFCWkEhTkF4grGxGJ2Thn+sM0SzO4WARy+n+VxAbAKXKxv5IqRxQZuD
         Uk8CgYdMVnbaL/qKYw/03iBjFpGbIi8P11OLlZBicdK6kTOymzFjdCtB4jVaDap7BzKK
         h6kxx+vwTTPFcIwg/Ebx1VDqxso2ZUv2KeC3x9NM8igAtYRvphOmaWtgTwjTLQEJcfiA
         LTOZOCTw14YlLCSTkyc5UCly9+6LckdZGdkMuQhhZnQw6dhQ7jsegH3HQ8CIp+eEXzAY
         4vJNqdnggY2nWtgfS3hhWUfzR90nNu2n1fTvrYHro5ATaShI8CrP+LO85bwawt+K0juf
         2pzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753788; x=1796358588;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCWB8FuEhHVOfDpGcddmAsTtaa85coe0yJXmYchM8Pk=;
        b=e4iENVBKNof+HXcdsqzzKKyKLc3n6r8aEP8zIU2xNjAOkJjoi2UwAsEE9MvlwMw5fs
         cAppz4zRB+d50EffH0mVD48i8mTEUZ0YfqiaCclyvy2VS0l7wBNiRzm7ae0ABptmNKuA
         pwCkPYcgF28tt1zn3qY1S4u/zMDWUkJJDaUSg+NJHV+4aLwFSzQ6clj4it/kQ2cs2ire
         bA6LJfEOLS+fM6dpjabGfkiKMaGa7WqrzPLUIBhXDBiXG061MjmAU0QW+CJ7I7FV/QC2
         hgdXPIBemt+c73YMrue3l2rHh3SeG1FJnW06ur+RhEWRBWU1jkA4RkGsEAfesEB06lu9
         Ee7w==
X-Forwarded-Encrypted: i=1; AL+hErHCmPZbOI2kaUWck8m26dWOO7oxCuuzb0X7X8A3HMfneV519IvuEue/fMxhthLkjQAclIQuuGWZ0ukEdtkQvQcJ@lists.infradead.org
X-Gm-Message-State: APuU4Z8pxy4kpyEpR/krfM1Rvd/GF28RdVWqGh8l3BqGCjlxuc8hcgJX
	LGlORklY/8WpvRHjhuBQZgfpzNW+O/36i/q6cOinO9AldqRh52SII4TC
X-Gm-Gg: AZFdTZcuKn900fRVfQYCfCO0lcUh865wsorCNFk6sW376Iu9fxbwW9g589VglU/skP3
	lFVudwpqccYaowaZDz2IUQc5xd9V7xJth5h7S+8PbTGjxyyG3mogO2UcGfibNOZczxE/2OPgMqS
	u4T4nCDHffNtPOa2Yp1dbAz1BHmnF7fp5R6JTVnLeG08MFso6bldW1rj55zFaAIaUSSXYVqKwKI
	mgi7roPBGMec/p7k6hl7NT6Kc1rwHqnAamtbruGuR2xmed8055Pb5ErpL9k4q2HsYefiwamoKLU
	iqmlPfMlRfyyScV2QH7ojibEhooQM2ARYsjPpM+Tl536mnfZMLf/mMcbuAzIvGCGjZwi2mdc2cj
	va5Qx5THoossdCGPAullDdB5TD9GW3399kRRmEedKHzZDOD1Qc6Guhf+FNtHfeTYqgF2LpxA0eu
	9ziD02x9sZYcXtks2zODYY/peJcARlGJwnXeBIXOkFP1csnZmLyawCzc9VQY53kxGlFb/b0yo2j
	xgmU4ca6QBuvkDhMZBlAmPddlVfpUYpEEwTj1CgnPslWw+GMnOH9IgmAWGvMr5fWt/LN1N5fx+u
	WVXICrvjdHlHyqVBz2zK6QNu1iA7D6RZDI9WgbPiZZ3CVnPDNwYwzm8Qa/X9sMZAEJ2AfKx6XpS
	2P+6aL8Dzi8SlaNgsuTEFmhR4d4JPbU6Wzq5V2it1YxODeusU1c41zNRY8RwBkPRkh/dipgUiWx
	VNBSqHuENGhbSeTmScrNbBK/q2cWEBDXIw+v2lwY0S1UQMZ8qoKD1f8W4sAptSpAM4VvG0zGj6v
	mXxkRoX1ggU1NA6gkhpPDNytD7YCVKMU3NNXJtxwnpiU+L7BXsmL+BJJ12QokE=
X-Received: by 2002:a05:600c:3113:b0:4bb:693e:4c8e with SMTP id 5b1f17b1804b1-4bb88816a53mr491770365e9.21.1795753787328;
        Thu, 26 Nov 2026 20:29:47 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm913769445e9.13.2026.11.26.20.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:29:46 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, wens@kernel.org, samuel@sholland.org,
 Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>,
 Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Date: Fri, 27 Nov 2026 05:29:44 +0100
Message-ID: <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_202950_785687_258350DA 
X-CRM114-Status: GOOD (  17.48  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne =C4=8Detrtek, 26. november 2026 ob 21:35:40 Srednjeevropski standardni =
=C4=8Das je Enzo Adriano napisal(a):
> The Allwinner A733 combines six Cortex-A55 and two Cortex-A76 cores.
> Add the common device tree for the first Cubie A7A, A7S and A7Z board
> DTS files. Describe the CPUs, PSCI, architectural timers, GIC, RTC,
> main and always-on clock/reset and pin controllers, UART, I2C and
> MMC. The preceding revision booted on the A7S and A7Z.
>=20
> The A7S schematic, sheets 7 and 16, shows the EEPROM wired to I2C0
> on PG8/PG9. Use mux 6 as documented in the A733 Datasheet v1.00,
> section 4.2.6, table 4-36. The A7A schematic shows the external RTC
> on S_TWI1. Add its R-I2C1 pin group on PL12/PL13, mux 3.
>=20
> The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
> the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
> and noncoherent attributes follow Andre Przywara's A733 reference
> and the A523 precedent. The CPUX interconnect diagram in section
> 5.1.2 supports the noncoherency inference. Leave the ITS disabled
> pending clock/reset and MSI integration.
>=20
> Describe the single DynamIQ unit and shared L3 shown in section
> 5.1.2, figure 5-1. Partition PPI 7 (section 12.2.3, table 12-1)
> between the Cortex-A55 and Cortex-A76 PMUs so each probes its own
> core type. Defer capacity-dmips-mhz until it is measured on A733.
>=20
> Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b3529=
86b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
> Link: https://lore.kernel.org/r/20261126172253.1097838-2-andre.przywara@a=
rm.com
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa =
Cubie A7Z V1.11
> Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)
> Co-developed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
> Changes since v5:
> - Mark the I2C0 PG8/PG9 group /omit-if-no-ref/, as requested. This
>   satisfies Andre's review condition.
> - Move the RTC clock include after the A733 clock headers and cite
>   the A733 datasheet and A7S schematic for the I2C0 pins.
> - Fold in Andre's R-I2C1 pin group for A7A. A7S and A7Z leave
>   it unused. A7S still references the I2C0 group.
> - Vinicius tested the v5 DTSI with his A7Z v1.11 board DT. Norman
>   tested the v5 series on A7S. Their tags here cover the SoC DTSI.
>=20
>  .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 671 ++++++++++++++++++
>  1 file changed, 671 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/=
boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> index 000000000000..e062b08006da
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> @@ -0,0 +1,671 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +#include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
> +#include <dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h>
> +#include <dt-bindings/clock/sun6i-rtc.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
> +#include <dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h>
> +
> +/ {
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +	interrupt-parent =3D <&gic>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu =3D <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu =3D <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu =3D <&cpu2>;
> +				};
> +
> +				core3 {
> +					cpu =3D <&cpu3>;
> +				};
> +
> +				core4 {
> +					cpu =3D <&cpu4>;
> +				};
> +
> +				core5 {
> +					cpu =3D <&cpu5>;
> +				};
> +
> +				core6 {
> +					cpu =3D <&cpu6>;
> +				};
> +
> +				core7 {
> +					cpu =3D <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x0>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu1: cpu@100 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x100>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu2: cpu@200 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x200>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu3: cpu@300 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x300>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu4: cpu@400 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x400>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu5: cpu@500 {
> +			compatible =3D "arm,cortex-a55";
> +			device_type =3D "cpu";
> +			reg =3D <0x500>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu6: cpu@600 {
> +			compatible =3D "arm,cortex-a76";
> +			device_type =3D "cpu";
> +			reg =3D <0x600>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu7: cpu@700 {
> +			compatible =3D "arm,cortex-a76";
> +			device_type =3D "cpu";
> +			reg =3D <0x700>;
> +			enable-method =3D "psci";
> +		};
> +	};
> +
> +	hosc: clock-hosc {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +	};
> +
> +	pmu-a55 {
> +		compatible =3D "arm,cortex-a55-pmu";
> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_a55>;
> +	};
> +
> +	pmu-a76 {
> +		compatible =3D "arm,cortex-a76-pmu";
> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_a76>;
> +	};
> +
> +	psci {
> +		compatible =3D "arm,psci-0.2";
> +		method =3D "smc";
> +	};
> +
> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
> +		arm,no-tick-in-suspend;
> +	};
> +
> +	soc@0 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0x0 0x0 0x0 0x40000000>;
> +
> +		pio: pinctrl@2000000 {
> +			compatible =3D "allwinner,sun60i-a733-pinctrl";
> +			reg =3D <0x02000000 0x800>;
> +			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_APB1>, <&hosc>, <&rtc CLK_OSC32K>;
> +			clock-names =3D "apb", "hosc", "losc";
> +			gpio-controller;
> +			#gpio-cells =3D <3>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +
> +			/omit-if-no-ref/
> +			i2c0_pg_pins: i2c0-pg-pins {
> +				pins =3D "PG8", "PG9";
> +				function =3D "i2c0";
> +				allwinner,pinmux =3D <6>;
> +			};
> +
> +			mmc0_pins: mmc0-pins {
> +				pins =3D "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> +				function =3D "mmc0";
> +				allwinner,pinmux =3D <2>;
> +				drive-strength =3D <30>;
> +				bias-pull-up;
> +			};
> +
> +			mmc1_pins: mmc1-pins {
> +				pins =3D "PG0", "PG1", "PG2", "PG3", "PG4", "PG5";
> +				function =3D "mmc1";
> +				allwinner,pinmux =3D <2>;
> +				drive-strength =3D <30>;
> +				bias-pull-up;
> +			};
> +
> +			mmc2_pins: mmc2-pins {
> +				pins =3D "PC5", "PC6", "PC8", "PC9", "PC10", "PC11",
> +				       "PC13", "PC14", "PC15", "PC16";
> +				function =3D "mmc2";
> +				allwinner,pinmux =3D <3>;
> +				drive-strength =3D <30>;
> +				bias-pull-up;
> +			};
> +
> +			uart0_pb_pins: uart0-pb-pins {
> +				pins =3D "PB9", "PB10";
> +				function =3D "uart0";
> +				allwinner,pinmux =3D <2>;
> +			};
> +		};
> +
> +		ccu: clock-controller@2002000 {
> +			compatible =3D "allwinner,sun60i-a733-ccu";
> +			reg =3D <0x02002000 0x2000>;
> +			clocks =3D <&hosc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
> +				 <&rtc CLK_OSC32K_FANOUT>;
> +			clock-names =3D "hosc", "losc", "iosc", "losc-fanout";
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};
> +
> +		uart0: serial@2500000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg =3D <0x02500000 0x400>;
> +			interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART0>;
> +			resets =3D <&ccu RST_BUS_UART0>;
> +			status =3D "disabled";
> +		};
> +
> +		uart1: serial@2501000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg =3D <0x02501000 0x400>;
> +			interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART1>;
> +			resets =3D <&ccu RST_BUS_UART1>;
> +			status =3D "disabled";
> +		};
> +
> +		uart2: serial@2502000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg =3D <0x02502000 0x400>;
> +			interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART2>;
> +			resets =3D <&ccu RST_BUS_UART2>;
> +			status =3D "disabled";
> +		};
> +
> +		uart3: serial@2503000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg =3D <0x02503000 0x400>;
> +			interrupts =3D <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART3>;
> +			resets =3D <&ccu RST_BUS_UART3>;
> +			status =3D "disabled";
> +		};
> +
> +		uart4: serial@2504000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg =3D <0x02504000 0x400>;
> +			interrupts =3D <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART4>;
> +			resets =3D <&ccu RST_BUS_UART4>;
> +			status =3D "disabled";
> +		};
> +
> +		uart5: serial@2505000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg =3D <0x02505000 0x400>;
> +			interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART5>;
> +			resets =3D <&ccu RST_BUS_UART5>;
> +			status =3D "disabled";
> +		};
> +
> +		uart6: serial@2506000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg =3D <0x02506000 0x400>;
> +			interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART6>;
> +			resets =3D <&ccu RST_BUS_UART6>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c0: i2c@2510000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x02510000 0x400>;
> +			interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C0>;
> +			resets =3D <&ccu RST_BUS_I2C0>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c1: i2c@2511000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x02511000 0x400>;
> +			interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C1>;
> +			resets =3D <&ccu RST_BUS_I2C1>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c2: i2c@2512000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x02512000 0x400>;
> +			interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C2>;
> +			resets =3D <&ccu RST_BUS_I2C2>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c3: i2c@2513000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x02513000 0x400>;
> +			interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C3>;
> +			resets =3D <&ccu RST_BUS_I2C3>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c4: i2c@2514000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x02514000 0x400>;
> +			interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C4>;
> +			resets =3D <&ccu RST_BUS_I2C4>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c5: i2c@2515000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x02515000 0x400>;
> +			interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C5>;
> +			resets =3D <&ccu RST_BUS_I2C5>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c6: i2c@2516000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x02516000 0x400>;
> +			interrupts =3D <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C6>;
> +			resets =3D <&ccu RST_BUS_I2C6>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c7: i2c@2517000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x02517000 0x400>;
> +			interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C7>;
> +			resets =3D <&ccu RST_BUS_I2C7>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c8: i2c@2518000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x02518000 0x400>;
> +			interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C8>;
> +			resets =3D <&ccu RST_BUS_I2C8>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c9: i2c@2519000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x02519000 0x400>;
> +			interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C9>;
> +			resets =3D <&ccu RST_BUS_I2C9>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c10: i2c@251a000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x0251a000 0x400>;
> +			interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C10>;
> +			resets =3D <&ccu RST_BUS_I2C10>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c11: i2c@251b000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x0251b000 0x400>;
> +			interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C11>;
> +			resets =3D <&ccu RST_BUS_I2C11>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c12: i2c@251c000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x0251c000 0x400>;
> +			interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_I2C12>;
> +			resets =3D <&ccu RST_BUS_I2C12>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		gic: interrupt-controller@3400000 {
> +			compatible =3D "arm,gic-v3";
> +			reg =3D <0x03400000 0x10000>, <0x03460000 0x100000>;
> +			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +			dma-noncoherent;
> +			interrupt-controller;
> +			#interrupt-cells =3D <4>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges;
> +
> +			its: msi-controller@3440000 {
> +				compatible =3D "arm,gic-v3-its";
> +				reg =3D <0x03440000 0x20000>;
> +				msi-controller;
> +				#msi-cells =3D <1>;
> +				dma-noncoherent;
> +				status =3D "disabled";
> +			};
> +
> +			ppi-partitions {
> +				ppi_a55: interrupt-partition-0 {
> +					affinity =3D <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
> +				};
> +
> +				ppi_a76: interrupt-partition-1 {
> +					affinity =3D <&cpu6 &cpu7>;
> +				};
> +			};
> +		};
> +
> +		mmc0: mmc@4020000 {
> +			compatible =3D "allwinner,sun60i-a733-mmc",
> +				     "allwinner,sun20i-d1-mmc";

That's not really the case, is it? A733 emmc has support for voltage switch=
ing,
so regulator should be added here for voltage switching.

I suggest that you drop this node until proper adjustment is made.

Best regards,
Jernej

> +			reg =3D <0x04020000 0x1000>;
> +			interrupts =3D <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> +			clock-names =3D "ahb", "mmc";
> +			resets =3D <&ccu RST_BUS_MMC0>;
> +			reset-names =3D "ahb";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&mmc0_pins>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		mmc1: mmc@4021000 {
> +			compatible =3D "allwinner,sun60i-a733-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg =3D <0x04021000 0x1000>;
> +			interrupts =3D <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
> +			clock-names =3D "ahb", "mmc";
> +			resets =3D <&ccu RST_BUS_MMC1>;
> +			reset-names =3D "ahb";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&mmc1_pins>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		mmc2: mmc@4022000 {
> +			compatible =3D "allwinner,sun60i-a733-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg =3D <0x04022000 0x1000>;
> +			interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
> +			clock-names =3D "ahb", "mmc";
> +			resets =3D <&ccu RST_BUS_MMC2>;
> +			reset-names =3D "ahb";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&mmc2_pins>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		r_ccu: clock-controller@7010000 {
> +			compatible =3D "allwinner,sun60i-a733-r-ccu";
> +			reg =3D <0x07010000 0x250>;
> +			clocks =3D <&hosc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
> +				 <&ccu CLK_SYS_24M>, <&ccu CLK_PLL_PERIPH0_200M>,
> +				 <&ccu CLK_PLL_PERIPH0_300M>,
> +				 <&ccu CLK_PLL_PERIPH1_300M>;
> +			clock-names =3D "hosc", "losc", "iosc", "sys-24m",
> +				      "pll-periph0-200m", "pll-periph0-300m",
> +				      "pll-periph1-300m";
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};
> +
> +		nmi_intc: interrupt-controller@7010320 {
> +			compatible =3D "allwinner,sun60i-a733-nmi",
> +				     "allwinner,sun55i-a523-nmi";
> +			reg =3D <0x07010320 0xc>;
> +			interrupts =3D <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +		};
> +
> +		r_pio: pinctrl@7025000 {
> +			compatible =3D "allwinner,sun60i-a733-r-pinctrl";
> +			reg =3D <0x07025000 0x800>;
> +			interrupts =3D <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&r_ccu CLK_R_APB0>, <&hosc>, <&rtc CLK_OSC32K>;
> +			clock-names =3D "apb", "hosc", "losc";
> +			gpio-controller;
> +			#gpio-cells =3D <3>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +
> +			r_i2c0_pl_pins: r-i2c0-pl-pins {
> +				pins =3D "PL0", "PL1";
> +				function =3D "r_i2c0";
> +				allwinner,pinmux =3D <2>;
> +			};
> +
> +			/omit-if-no-ref/
> +			r_i2c1_pl_pins: r-i2c1-pl-pins {
> +				pins =3D "PL12", "PL13";
> +				function =3D "r_i2c1";
> +				allwinner,pinmux =3D <3>;
> +			};
> +		};
> +
> +		r_uart0: serial@7080000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg =3D <0x07080000 0x400>;
> +			interrupts =3D <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&r_ccu CLK_BUS_R_UART0>;
> +			resets =3D <&r_ccu RST_BUS_R_UART0>;
> +			status =3D "disabled";
> +		};
> +
> +		r_uart1: serial@7081000 {
> +			compatible =3D "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg =3D <0x07081000 0x400>;
> +			interrupts =3D <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&r_ccu CLK_BUS_R_UART1>;
> +			resets =3D <&r_ccu RST_BUS_R_UART1>;
> +			status =3D "disabled";
> +		};
> +
> +		r_i2c0: i2c@7083000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x07083000 0x400>;
> +			interrupts =3D <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&r_ccu CLK_BUS_R_I2C0>;
> +			resets =3D <&r_ccu RST_BUS_R_I2C0>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		r_i2c1: i2c@7084000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x07084000 0x400>;
> +			interrupts =3D <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&r_ccu CLK_BUS_R_I2C1>;
> +			resets =3D <&r_ccu RST_BUS_R_I2C1>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		r_i2c2: i2c@7085000 {
> +			compatible =3D "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x07085000 0x400>;
> +			interrupts =3D <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&r_ccu CLK_BUS_R_I2C2>;
> +			resets =3D <&r_ccu RST_BUS_R_I2C2>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		rtc: rtc@7090000 {
> +			compatible =3D "allwinner,sun60i-a733-rtc",
> +				     "allwinner,sun50i-r329-rtc";
> +			reg =3D <0x07090000 0x400>;
> +			interrupts =3D <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&r_ccu CLK_BUS_R_RTC>, <&hosc>, <&r_ccu CLK_R_AHB>;
> +			clock-names =3D "bus", "hosc", "ahb";
> +			#clock-cells =3D <1>;
> +		};
> +	};
> +};
>=20
>=20





