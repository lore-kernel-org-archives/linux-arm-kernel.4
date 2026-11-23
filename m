Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8245A606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uclasVfk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Va6ZtEvD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i3MzbPidfDG/rjrcBIfelpXh/DBIpMthv6i7dnSWlog=; b=uclasVfkFq8v7hnHDSDb5e2u6s
	oayOvZ4W2tlcL6JUsAUe36Bh7PKG3EXAUhMl/IJknkE07If7CcJlD1MApvrzjfQOYZH8VgCxFvtOZ
	s408iKRvAqNli4q+uy6P4WfWwrG7+KfR0S0BLMXzFz36SeKYIbSz1BtV+YnwM2rXYdhi+6el60HtN
	FCMqNBIdEc87xZSjSyoWoSw6KspK/6qrg6nwAooFekocgKNvDKVWoobQW/suhmZmzo+nhNkxjMtaI
	aaP81uuImBnREaNjHGP/QQOacwpNNH5ZeJ1sH2nusUPM8/xC0JCKZlLQ4toiZLLYBgqDfIT8UyFeY
	+HOuWVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVROF-00000002yFC-1wYJ;
	Mon, 23 Nov 2026 10:35:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVROD-00000002yEW-3ZIg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:35:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F4BB41932;
	Mon, 23 Nov 2026 10:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBC31F000C6;
	Mon, 23 Nov 2026 10:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430111;
	bh=i3MzbPidfDG/rjrcBIfelpXh/DBIpMthv6i7dnSWlog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Va6ZtEvDlTvYtjj1YNjK7xNoTVJVh0Y/RAsRQEpFFiOZKLvESai/4iNhDf4+R7V9C
	 ELYYIOeKUslx/uevHFFmUOa+ybosLAf+klOjQN8sm0qH7fwENosPMkhrPRxd0pV430
	 lUSDBrs4KPK1M5IyXIpxo34u1B+liENE6ktgyHWx8fEdKkSm7rto093fWZF7vE7ZVI
	 NFA/DIX2Hm1pKuPfXNo5reMBGK8bOkLUqfsZR1GSzQnxZvEpa49TE2CyXUQr6R4oah
	 GRLbZvHgBKMP2EvVGv1CwqZl22nKepg49hWbuhAvt9b62pptvhFFfKIHiTT9AhetqS
	 tGewm1yhT/fxw==
Date: Mon, 23 Nov 2026 11:35:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 12/13] arm64: dts: synaptics: add SL2610 family SoCs
Message-ID: <20261123-petite-oarfish-of-merriment-dd7e79@quoll>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-13-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115102401.3520-13-jszhang@kernel.org>
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 06:23:51PM +0800, Jisheng Zhang wrote:
> Describe the CPUs, interrupt controller, system controllers and supported
> serial, I2C, I3C, SPI and GPIO peripherals for the SL2610 family.
> 
> Use the SL2610 peripheral compatibles already documented in the upstream
> bindings and share clock, reset and pin configuration providers through
> the system controller nodes.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/arm64/boot/dts/synaptics/sl2611.dtsi | 457 ++++++++++++++++++++++
>  arch/arm64/boot/dts/synaptics/sl2613.dtsi |  12 +
>  arch/arm64/boot/dts/synaptics/sl2615.dtsi |  46 +++
>  arch/arm64/boot/dts/synaptics/sl2617.dtsi |  46 +++
>  arch/arm64/boot/dts/synaptics/sl2619.dtsi |  44 +++
>  5 files changed, 605 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2611.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2613.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2615.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2617.dtsi
>  create mode 100644 arch/arm64/boot/dts/synaptics/sl2619.dtsi
> 
> diff --git a/arch/arm64/boot/dts/synaptics/sl2611.dtsi b/arch/arm64/boot/dts/synaptics/sl2611.dtsi
> new file mode 100644
> index 000000000000..663fe6034ba0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2611.dtsi
> @@ -0,0 +1,457 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include <dt-bindings/clock/syna,sl2610.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/syna,sl2610-reset.h>
> +
> +/ {
> +	compatible = "syna,sl2611";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	optee {
> +		compatible = "linaro,optee-tz";
> +		method = "smc";
> +	};
> +
> +	cpus {

Messed order of nodes. Please run dt-check-style.


> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&L2_0>;
> +
> +			L2_0: l2-cache {

Labels should be lowercase rather.

> +				compatible = "cache";
> +				cache-size = <65536>;
> +				cache-line-size = <64>;
> +				cache-sets = <256>;
> +				cache-level = <2>;
> +				cache-unified;
> +				next-level-cache = <&L3>;
> +			};
> +		};
> +
> +		L3: l3-cache0 {
> +			compatible = "cache";
> +			cache-level = <3>;
> +			cache-unified;
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <256>;
> +		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +			CPU_SLEEP_0: cpu-sleep-0 {
> +				compatible = "arm,idle-state";
> +				local-timer-stop;
> +				arm,psci-suspend-param = <0x0010000>;
> +				entry-latency-us = <75>;
> +				exit-latency-us = <155>;
> +				min-residency-us = <50000>;
> +			};
> +		};
> +	};
> +
> +	osc: osc {

Please use name for all fixed clocks which matches current format
recommendation: 'clock-<freq>' (see also the pattern in the binding for
any other options).
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +	};
> +

...

> +		cpuclk: cpu_wrap: syscon@f7e30000 {
> +			compatible = "syna,sl2610-cpu-syscon", "syscon";
> +			reg = <0xf7e30000 0x4000>;
> +			#clock-cells = <1>;
> +			clocks = <&osc>;
> +			syna,gbl-syscon = <&chip>;
> +		};
> +
> +		gic: interrupt-controller@f7e59000 {
> +			compatible = "arm,gic-400";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			reg = <0xf7e59000 0x1000>,
> +			      <0xf7e5a000 0x2000>,
> +			      <0xf7e5c000 0x2000>,
> +			      <0xf7e5e000 0x2000>;

Please follow DTS coding style in ordering properties.

> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;

...

> +		soc_spi0: spi@f7f04000 {
> +			compatible = "syna,sl2610-spi", "snps,dw-apb-ssi";
> +			reg = <0xf7f04000 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			num-cs = <4>;
> +			clocks = <&clk CLK_APBSPI0>;
> +			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		soc_i2c0: i2c@f7f05000 {
> +			compatible = "syna,sl2610-i2c", "snps,designware-i2c";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0xf7f05000 0x100>;
> +			clocks = <&clk CLK_APBI2C0>;
> +			i2c-sda-hold-time-ns = <449>;
> +			i2c-sda-falling-time-ns = <425>;
> +			i2c-scl-falling-time-ns = <205>;

If these are here, then they are implied by compatible, no?

Best regards,
Krzysztof


