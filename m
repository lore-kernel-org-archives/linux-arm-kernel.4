Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C66606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P2ST1I2f;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Z16DWDlL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o3FMb8ryd6gP75/KeztAsFpnqyQieu41p7TDBbzyE+w=; b=P2ST1I2fe1a+vflNHarf9popd9
	18fbPjjgyehI3023LIjiX70eMbzd2TBNElNIMNsEY9TVdSB7o2s+LdIF+JmOsl2YGc5ZSKlSevI9r
	ITQCvTlRjMg/t53QsOeZtgfxTnk20l0tULrFQAl+r5R4bG4lfGmnXCrw7kKEDecjY0+ON6A2NbIa0
	eyYJuAXVrMfomYPOkQ+Nwr8mg6j1npQVdyfrILqQg0jQLPFQr60ab7gnAyFE1R8bnvwrWz34zWIk/
	qA3/pbn3Lb+gam6r66o9vr2mt5W984yZrruZ3QcxCzd2M7ManNpmly2bAmfE4oz23dr5bRjluZrAC
	ZIGpzXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtyW-0000000Fllf-2Sn3;
	Fri, 27 Nov 2026 11:18:44 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtyS-0000000FllC-3Bhs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:18:43 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c50e26763a4so355748466b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 03:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795778319; x=1796383119; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3FMb8ryd6gP75/KeztAsFpnqyQieu41p7TDBbzyE+w=;
        b=Z16DWDlLDmYavCy8pHYyalTVgXi8PObz/PDNILdrxuteRArE8ylh1v/AZg+Ml82ji6
         7RBaILTlCwZKc2/5vGlrysWMd9BxTB8KXwENMFLO3CDtdmsWUSo9FdBOUykoGO8khJOR
         7laXPbOYpmKwOmE6LgxLbq57UWiNEfomY9yZvGgCPx22SWrcQJYO9E12iR7R5ZYbBMBt
         Vo0ukxOR25Tae31cyVDU7xWp8JJY9tGEzFZzs4yRtjbvHgZrgDAygzu4NsU2IGXJ5AHX
         Z7hqitlAHU9GyVYRJ6uVijbHb1ZySwsdK0beAuUE25gNThxkt/7Zgakzh6hlKOi6eOkM
         FAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778319; x=1796383119;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o3FMb8ryd6gP75/KeztAsFpnqyQieu41p7TDBbzyE+w=;
        b=mGI7qYyy5YZx484YPtRr6BXvWWWnxC1bJE63wAa9pFWm0gk/SjjwYFppPk0pMCCPbJ
         MxU2wmrpL12+bj+NLZBethKitKDuvkEJjvr+bVlnskWqyTBJcikIquykxVs5G2L4NJ9x
         H1RTSchonzFJVvnQKe4kywpF6h2AikjSNg4ztwMlHJewNlpVfSjBIh6+FUWpTTskGXU/
         8MXkzug1jTrEz/cXpaCW/dVP2lAJOWOPdP+/UYSudfwA2b1TZ+YGsCUxGnJIYcR9BtS8
         7h+EK38ycLWlVyJbHL1IGKpTmDrJSVSez5OB9e+J8dwAiiU52Mm6KxOrzXanwdRx11hw
         Sp7Q==
X-Forwarded-Encrypted: i=1; AL+hErFqMqRbQaKlO/M/El/rJZumQTEdNvyO6PoHYWTSfZ/cA5eps9wCXek41MOte+Ao2wZvRW0xIdFSjG73X8lZqdLE@lists.infradead.org
X-Gm-Message-State: APuU4Z8drfPk8t7Xu4Oul3FpCvYsmiestUsVg0g/+57dL2grnfOQIRyZ
	g24KT84+FD9a5BK3VvKFhMen+ZsapcyluFkPgI0h+p4HB8AYsChQ6/ll16MaPNBv68E=
X-Gm-Gg: AZFdTZdJqQ4M+1LTYH3BR6uZ/sTqvdUevZoicxElDNcULW2+DrgORmLIE+VheYTk8dE
	vQF55Dy9e1YlQQ1dcqftiivD0Zem+BsgjAB0oqZ3Js0GYkrPYOzuoDFpc0LlbK8DNvVHwLXz65v
	4VgnaX+Q+nvN1UKGJcZFIB9kUkyAe6aZ0EY78GSyXPEdjkFiJpb1V3uiFTcaFU3Snisz/eDKDKy
	/0MJDRr5n7PY10vpdeqeEh3wniwF/0LqeAv0MM6udZZNxqst5KRXKYVtohWE3eBjzbJoxUa3ZYn
	0eblQzKEnsjg1cnizIyx26N3HZu4b3FVziHncfa5VUQ9MfSFXu01efXabSi7zIACzxBa/mtxGeo
	2ip2sdPF5L5m1JLNv9EsmyFQPUhq6aoDsOxDfWg4mxXgWMgu14qg2bt8AMXKbLq6hnyj5JkMrpK
	sYm2QKwF8nMwl2X3l38BeVqMrRQHnymSRgl3T5GV/VBSYb4ncCI9FiWs8jJXSzpCG9xpEX/o/6l
	bwKMcF/4TUvn4jUrGsE/7HxGLOPfSkY/+uyhAtwlyTytkl1GkR3wSLc216aV1TBJdqpmrfsRIwV
	n9p27XIB+XPnN10DyEXlCY+Y9xrizt0OtQCn7gaWLyD3I4FR8kWU8LQdzRFFndWaU+soKQ==
X-Received: by 2002:a17:907:c13:b0:c4c:c997:8711 with SMTP id a640c23a62f3a-c513ac67123mr1910412666b.38.1795778318679;
        Fri, 27 Nov 2026 03:18:38 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68788sm857588666b.29.2026.11.27.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:18:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>, andre.przywara@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo
 Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa
 <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin
 <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid
 <lukas.schmid@netcube.li>, Cristian Filipescu
 <filipescu.cristian@gmail.com>, Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
Date: Fri, 27 Nov 2026 12:18:37 +0100
Message-ID: <1jpkvqldyq.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_031840_978240_E6B2197C 
X-CRM114-Status: GOOD (  18.09  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On jeu. 26 nov. 2026 at 15:35, Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

> The Allwinner A733 combines six Cortex-A55 and two Cortex-A76 cores.
> Add the common device tree for the first Cubie A7A, A7S and A7Z board
> DTS files. Describe the CPUs, PSCI, architectural timers, GIC, RTC,
> main and always-on clock/reset and pin controllers, UART, I2C and
> MMC. The preceding revision booted on the A7S and A7Z.
>
> The A7S schematic, sheets 7 and 16, shows the EEPROM wired to I2C0
> on PG8/PG9. Use mux 6 as documented in the A733 Datasheet v1.00,
> section 4.2.6, table 4-36. The A7A schematic shows the external RTC
> on S_TWI1. Add its R-I2C1 pin group on PL12/PL13, mux 3.
>
> The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
> the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
> and noncoherent attributes follow Andre Przywara's A733 reference
> and the A523 precedent. The CPUX interconnect diagram in section
> 5.1.2 supports the noncoherency inference. Leave the ITS disabled
> pending clock/reset and MSI integration.
>
> Describe the single DynamIQ unit and shared L3 shown in section
> 5.1.2, figure 5-1. Partition PPI 7 (section 12.2.3, table 12-1)
> between the Cortex-A55 and Cortex-A76 PMUs so each probes its own
> core type. Defer capacity-dmips-mhz until it is measured on A733.
>
> Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b352986b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
> Link: https://lore.kernel.org/r/20261126172253.1097838-2-andre.przywara@arm.com
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z V1.11
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
>
>  .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 671 ++++++++++++++++++
>  1 file changed, 671 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
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
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	interrupt-parent = <&gic>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +
> +				core4 {
> +					cpu = <&cpu4>;
> +				};
> +
> +				core5 {
> +					cpu = <&cpu5>;
> +				};
> +
> +				core6 {
> +					cpu = <&cpu6>;
> +				};
> +
> +				core7 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu1: cpu@100 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x100>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu2: cpu@200 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x200>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu3: cpu@300 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x300>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu4: cpu@400 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x400>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu5: cpu@500 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x500>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu6: cpu@600 {
> +			compatible = "arm,cortex-a76";
> +			device_type = "cpu";
> +			reg = <0x600>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu7: cpu@700 {
> +			compatible = "arm,cortex-a76";
> +			device_type = "cpu";
> +			reg = <0x700>;
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	hosc: clock-hosc {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +	};
> +
> +	pmu-a55 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_a55>;
> +	};
> +
> +	pmu-a76 {
> +		compatible = "arm,cortex-a76-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_a76>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
> +		arm,no-tick-in-suspend;
> +	};
> +
> +	soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x40000000>;
> +
> +		pio: pinctrl@2000000 {
> +			compatible = "allwinner,sun60i-a733-pinctrl";
> +			reg = <0x02000000 0x800>;
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_APB1>, <&hosc>, <&rtc CLK_OSC32K>;
> +			clock-names = "apb", "hosc", "losc";
> +			gpio-controller;
> +			#gpio-cells = <3>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +
> +			/omit-if-no-ref/
> +			i2c0_pg_pins: i2c0-pg-pins {
> +				pins = "PG8", "PG9";
> +				function = "i2c0";
> +				allwinner,pinmux = <6>;
> +			};
> +
> +			mmc0_pins: mmc0-pins {
> +				pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> +				function = "mmc0";
> +				allwinner,pinmux = <2>;
> +				drive-strength = <30>;
> +				bias-pull-up;
> +			};
> +
> +			mmc1_pins: mmc1-pins {
> +				pins = "PG0", "PG1", "PG2", "PG3", "PG4", "PG5";
> +				function = "mmc1";
> +				allwinner,pinmux = <2>;
> +				drive-strength = <30>;
> +				bias-pull-up;
> +			};
> +
> +			mmc2_pins: mmc2-pins {
> +				pins = "PC5", "PC6", "PC8", "PC9", "PC10", "PC11",
> +				       "PC13", "PC14", "PC15", "PC16";
> +				function = "mmc2";
> +				allwinner,pinmux = <3>;
> +				drive-strength = <30>;
> +				bias-pull-up;
> +			};
> +
> +			uart0_pb_pins: uart0-pb-pins {
> +				pins = "PB9", "PB10";
> +				function = "uart0";
> +				allwinner,pinmux = <2>;
> +			};
> +		};
> +
> +		ccu: clock-controller@2002000 {
> +			compatible = "allwinner,sun60i-a733-ccu";
> +			reg = <0x02002000 0x2000>;
> +			clocks = <&hosc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
> +				 <&rtc CLK_OSC32K_FANOUT>;
> +			clock-names = "hosc", "losc", "iosc", "losc-fanout";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		uart0: serial@2500000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02500000 0x400>;
> +			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART0>;
> +			resets = <&ccu RST_BUS_UART0>;
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@2501000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02501000 0x400>;
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART1>;
> +			resets = <&ccu RST_BUS_UART1>;
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@2502000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02502000 0x400>;
> +			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART2>;
> +			resets = <&ccu RST_BUS_UART2>;
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@2503000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02503000 0x400>;
> +			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART3>;
> +			resets = <&ccu RST_BUS_UART3>;
> +			status = "disabled";
> +		};
> +
> +		uart4: serial@2504000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02504000 0x400>;
> +			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART4>;
> +			resets = <&ccu RST_BUS_UART4>;
> +			status = "disabled";
> +		};
> +
> +		uart5: serial@2505000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02505000 0x400>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART5>;
> +			resets = <&ccu RST_BUS_UART5>;
> +			status = "disabled";
> +		};
> +
> +		uart6: serial@2506000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02506000 0x400>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART6>;
> +			resets = <&ccu RST_BUS_UART6>;
> +			status = "disabled";
> +		};
> +
> +		i2c0: i2c@2510000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02510000 0x400>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C0>;
> +			resets = <&ccu RST_BUS_I2C0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@2511000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02511000 0x400>;
> +			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C1>;
> +			resets = <&ccu RST_BUS_I2C1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@2512000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02512000 0x400>;
> +			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C2>;
> +			resets = <&ccu RST_BUS_I2C2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c3: i2c@2513000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02513000 0x400>;
> +			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C3>;
> +			resets = <&ccu RST_BUS_I2C3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@2514000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02514000 0x400>;
> +			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C4>;
> +			resets = <&ccu RST_BUS_I2C4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c5: i2c@2515000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02515000 0x400>;
> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C5>;
> +			resets = <&ccu RST_BUS_I2C5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c6: i2c@2516000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02516000 0x400>;
> +			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C6>;
> +			resets = <&ccu RST_BUS_I2C6>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c7: i2c@2517000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02517000 0x400>;
> +			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C7>;
> +			resets = <&ccu RST_BUS_I2C7>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c8: i2c@2518000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02518000 0x400>;
> +			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C8>;
> +			resets = <&ccu RST_BUS_I2C8>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c9: i2c@2519000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02519000 0x400>;
> +			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C9>;
> +			resets = <&ccu RST_BUS_I2C9>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c10: i2c@251a000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x0251a000 0x400>;
> +			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C10>;
> +			resets = <&ccu RST_BUS_I2C10>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c11: i2c@251b000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x0251b000 0x400>;
> +			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C11>;
> +			resets = <&ccu RST_BUS_I2C11>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c12: i2c@251c000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x0251c000 0x400>;
> +			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C12>;
> +			resets = <&ccu RST_BUS_I2C12>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		gic: interrupt-controller@3400000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x03400000 0x10000>, <0x03460000 0x100000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +			dma-noncoherent;
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			its: msi-controller@3440000 {
> +				compatible = "arm,gic-v3-its";
> +				reg = <0x03440000 0x20000>;
> +				msi-controller;
> +				#msi-cells = <1>;
> +				dma-noncoherent;
> +				status = "disabled";
> +			};
> +
> +			ppi-partitions {
> +				ppi_a55: interrupt-partition-0 {
> +					affinity = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
> +				};
> +
> +				ppi_a76: interrupt-partition-1 {
> +					affinity = <&cpu6 &cpu7>;
> +				};
> +			};
> +		};
> +
> +		mmc0: mmc@4020000 {
> +			compatible = "allwinner,sun60i-a733-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04020000 0x1000>;
> +			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC0>;
> +			reset-names = "ahb";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc0_pins>;

Even if pins are usually the same board to board, do you really want to
set this in the SoC dtsi ?

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		mmc1: mmc@4021000 {
> +			compatible = "allwinner,sun60i-a733-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04021000 0x1000>;
> +			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC1>;
> +			reset-names = "ahb";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc1_pins>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		mmc2: mmc@4022000 {
> +			compatible = "allwinner,sun60i-a733-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04022000 0x1000>;
> +			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC2>;
> +			reset-names = "ahb";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc2_pins>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		r_ccu: clock-controller@7010000 {
> +			compatible = "allwinner,sun60i-a733-r-ccu";
> +			reg = <0x07010000 0x250>;
> +			clocks = <&hosc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
> +				 <&ccu CLK_SYS_24M>, <&ccu CLK_PLL_PERIPH0_200M>,
> +				 <&ccu CLK_PLL_PERIPH0_300M>,
> +				 <&ccu CLK_PLL_PERIPH1_300M>;
> +			clock-names = "hosc", "losc", "iosc", "sys-24m",
> +				      "pll-periph0-200m", "pll-periph0-300m",
> +				      "pll-periph1-300m";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		nmi_intc: interrupt-controller@7010320 {
> +			compatible = "allwinner,sun60i-a733-nmi",
> +				     "allwinner,sun55i-a523-nmi";
> +			reg = <0x07010320 0xc>;
> +			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		r_pio: pinctrl@7025000 {
> +			compatible = "allwinner,sun60i-a733-r-pinctrl";
> +			reg = <0x07025000 0x800>;
> +			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&r_ccu CLK_R_APB0>, <&hosc>, <&rtc CLK_OSC32K>;
> +			clock-names = "apb", "hosc", "losc";
> +			gpio-controller;
> +			#gpio-cells = <3>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +
> +			r_i2c0_pl_pins: r-i2c0-pl-pins {
> +				pins = "PL0", "PL1";
> +				function = "r_i2c0";
> +				allwinner,pinmux = <2>;
> +			};
> +
> +			/omit-if-no-ref/
> +			r_i2c1_pl_pins: r-i2c1-pl-pins {
> +				pins = "PL12", "PL13";
> +				function = "r_i2c1";
> +				allwinner,pinmux = <3>;
> +			};
> +		};
> +
> +		r_uart0: serial@7080000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x07080000 0x400>;
> +			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&r_ccu CLK_BUS_R_UART0>;
> +			resets = <&r_ccu RST_BUS_R_UART0>;
> +			status = "disabled";
> +		};
> +
> +		r_uart1: serial@7081000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x07081000 0x400>;
> +			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&r_ccu CLK_BUS_R_UART1>;
> +			resets = <&r_ccu RST_BUS_R_UART1>;
> +			status = "disabled";
> +		};
> +
> +		r_i2c0: i2c@7083000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x07083000 0x400>;
> +			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&r_ccu CLK_BUS_R_I2C0>;
> +			resets = <&r_ccu RST_BUS_R_I2C0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		r_i2c1: i2c@7084000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x07084000 0x400>;
> +			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&r_ccu CLK_BUS_R_I2C1>;
> +			resets = <&r_ccu RST_BUS_R_I2C1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		r_i2c2: i2c@7085000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x07085000 0x400>;
> +			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&r_ccu CLK_BUS_R_I2C2>;
> +			resets = <&r_ccu RST_BUS_R_I2C2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		rtc: rtc@7090000 {
> +			compatible = "allwinner,sun60i-a733-rtc",
> +				     "allwinner,sun50i-r329-rtc";
> +			reg = <0x07090000 0x400>;
> +			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&r_ccu CLK_BUS_R_RTC>, <&hosc>, <&r_ccu CLK_R_AHB>;
> +			clock-names = "bus", "hosc", "ahb";
> +			#clock-cells = <1>;
> +		};
> +	};
> +};
>

-- 
Jerome

