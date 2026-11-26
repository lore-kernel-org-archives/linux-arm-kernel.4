Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E7B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TK/wBb0s;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JH/+eCCL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N/cEzKcepYsGi3Rr32SGnZ2whiJRMg9YAJGcOs7d3pE=; b=TK/wBb0sM4hPo9
	qyQroPBz6LW5atgNKy6hzFf6bFaiDhGo8HCK/pA8C03jAJsGWxfWaILcaAmznxLvG2djqFBqgNzrD
	YPcYly1kVFlgxZgwDL8w6QbYnj4z9KBgAnztcSv5UTFIzpEX9+q65jGd6gpOH+p3sNuwr3NDtMhlZ
	KqG2kEz6yYEItGy3mdZefAwFV/3DxZGdLmFqso6wkFzEy6NPw9g5vlZqMW+Tg1jmeUiAA2DCD7YhV
	fwRL5B7laJiOWXK6WjNngzubM8iz1ZBngQ4xeYnEGBuSqpYCs0IFGpyYrxz84GKg9z1nzJz/XmhXg
	Meid/rp/PasGuf3ctuWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUfB-0000000CMjD-4AI2;
	Thu, 26 Nov 2026 08:17:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUf1-0000000CMfv-2vJw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:17:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 68BCE4E41789;
	Thu, 26 Nov 2026 08:16:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3441C60237;
	Thu, 26 Nov 2026 08:16:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D29F111E6835E;
	Thu, 26 Nov 2026 09:16:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795681011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=N/cEzKcepYsGi3Rr32SGnZ2whiJRMg9YAJGcOs7d3pE=;
	b=JH/+eCCLMcYtMAzvglxXXC+fGv/9T9mHlOPKeKUNwFxSdqCzdn78ULd5UpxXkrp4JbZC8l
	OEKf0NHTs/7KFL4j5HsL3fB5AMLKfg9TeHoEKWr8m/83+F0IP+vHXJGZIDhaiJeopJ78Rn
	NEsxpoTA1C5SXccCLA55tSlyRvuaK5iuc8alnQlZYJ47hKhobKCSYKYq0YpZRq+mvd0SyV
	UF7vC6+x/OcRtAitIZEQ7UVMlhatVc7llFU1I+DqKLkKFREOFdmmnF98FCH2J6DlxQMVvt
	XtHQelZwZbqh/5ZwnsZOTEsC9RUg7s6i1tQtwb/Ma1UFKmPL+ZyoWCayhJzJdg==
Message-ID: <0828126f-54fd-43af-94ee-35d1047378db@bootlin.com>
Date: Thu, 26 Nov 2026 09:16:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arm64: dts: synaptics: add SL2610 family RDK
 boards
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
 <20261115102401.3520-14-jszhang@kernel.org>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <20261115102401.3520-14-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_001656_039803_F8030FFA 
X-CRM114-Status: GOOD (  17.02  )
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

Le 15/11/2026 à 11:23, Jisheng Zhang a écrit :
> Add device trees for the SL2611, SL2613, SL2615, SL2617 and SL2619
> reference development kits. Share their common console, memory, pin
> configuration and regulator descriptions and enable the populated
> peripherals.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/arm64/boot/dts/synaptics/Makefile        |   5 +
>   arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +++
>   arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +++
>   arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +++
>   arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +++
>   arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +++
>   .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++++++++++++++++
>   7 files changed, 220 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> 
> diff --git a/arch/arm64/boot/dts/synaptics/Makefile b/arch/arm64/boot/dts/synaptics/Makefile
> index de71ddda6835..810d0d08c2de 100644
> --- a/arch/arm64/boot/dts/synaptics/Makefile
> +++ b/arch/arm64/boot/dts/synaptics/Makefile
> @@ -2,3 +2,8 @@
>   # Berlin SoC Family
>   dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-dmp.dtb
>   dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-stb.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2611-rdk.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2613-rdk.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2615-rdk.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2617-rdk.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2619-rdk.dtb
> diff --git a/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
> new file mode 100644
> index 000000000000..585872307834
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2611.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2611 RDK";
> +	compatible = "syna,sl2611-rdk", "syna,sl2611";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
> new file mode 100644
> index 000000000000..de75c9fab6a2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2613.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2613 RDK";
> +	compatible = "syna,sl2613-rdk", "syna,sl2613";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
> new file mode 100644
> index 000000000000..ae03638a3a53
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2615.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2615 RDK";
> +	compatible = "syna,sl2615-rdk", "syna,sl2615";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
> new file mode 100644
> index 000000000000..ba4ea21ac505
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2617.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2617 RDK";
> +	compatible = "syna,sl2617-rdk", "syna,sl2617";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
> new file mode 100644
> index 000000000000..58901ac2a050
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2619.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2619 RDK";
> +	compatible = "syna,sl2619-rdk", "syna,sl2619";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> new file mode 100644
> index 000000000000..78a9b28fdf99
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +
> +/ {
> +	aliases {
> +		serial0 = &sm_uart0;
> +		serial1 = &sm_uart1;
> +		serial2 = &sm_uart2;
> +		serial3 = &sm_uart3;
> +		serial4 = &soc_uart0;
> +		serial5 = &soc_uart1;
> +		serial6 = &soc_uart2;
> +		serial7 = &soc_uart3;
> +		i2c0 = &sm_i2c0;
> +		i2c1 = &sm_i2c1;
> +		i2c2 = &soc_i2c0;
> +		i2c3 = &soc_i2c1;
> +		spi1 = &sm_spi1;
> +		spi2 = &soc_spi0;
> +		spi3 = &soc_spi1;
> +		spi4 = &soc_spi2;
> +		spi5 = &soc_spi3;
> +	};
> +
> +	cpus {
> +		cpu@0 {
> +			cpu0-supply = <&vcore>;
> +		};
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		bootargs = "earlycon";
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x00000000 0x0 0x80000000>;
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&pinctrl {
> +	soc_i2c0_pmux: soc_i2c0-pmux {
> +		groups = "GPIO23", "GPIO24";
> +		function = "tw2";
> +		drive-strength = <7>;
> +	};
> +};
> +
> +&sm_pinctrl {
> +	sm_i2c0_pmux: i2c0-pmux {
> +		groups = "SM_GPIO12", "SM_GPIO13";
> +		function = "tw0";
> +		drive-strength = <7>;
> +	};
> +
> +	sm_i2c1_pmux: i2c1-pmux {
> +		groups = "SM_GPIO3", "SM_GPIO4";
> +		function = "tw1";
> +		drive-strength = <7>;
> +	};
> +
> +	vcore_gpio_pmux: vcore-gpio-pmux {
> +		groups = "SM_GPIO5";
> +		function = "gpio";
> +	};
> +};
> +
> +&sm_uart0 {
> +	status = "okay";
This will be needed at early boot, so please add:
	bootph-all;

 > +};
 > +

And also:
&sm_clk {
	bootph-all;
};

Regards,
Richard

> +&sm_i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sm_i2c0_pmux>;
> +	clock-frequency = <100000>;
> +
> +	expander0: gpio@43 {
> +		compatible = "fcs,fxl6408";
> +		reg = <0x43>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	expander1: gpio@44 {
> +		compatible = "fcs,fxl6408";
> +		reg = <0x44>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +};
> +
> +&sm_i2c1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sm_i2c1_pmux>;
> +	clock-frequency = <100000>;
> +
> +	vcore: regulator@60 {
> +		compatible = "silergy,sy8827n";
> +		reg = <0x60>;
> +		regulator-name = "vcore";
> +		regulator-min-microvolt = <700000>;
> +		regulator-max-microvolt = <987500>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-active-discharge = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcore_gpio_pmux>;
> +		enable-gpios = <&portc 5 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&soc_i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&soc_i2c0_pmux>;
> +	clock-frequency = <100000>;
> +};
> +
> +&sm_uart1 {
> +	status = "okay";
> +};

