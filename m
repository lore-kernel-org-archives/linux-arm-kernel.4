Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877FD606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VBy10UT1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8WWcBab
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HiPw/vO6fj89ZTfYmyeZnIAu27qYcwnBAOmXn+WneYM=; b=VBy10UT1xdYUEXZmYN4ZjDSNz6
	WnB70vD5s2LrwkSd8Op5LmTxVbGtbVOxdwpCZDXZZk1+gfF+f2ycwkpv4pmsfbk9uT057hM9HguWk
	Os4XyRxWyZSi3se4Z3fpWSvmPtrrz/ZSM/8vU6BozZki6DSBMqszHWhPKv4p21Dmxmp5QjcfQcV/h
	SsOJO6rT2HzUlENF3GtFtaFAv82yifjQp4MbskeaOHYptYbdawFdXOJX2peVlNgHSa36yQ7EmPy5z
	1BvbUf99Lp3KfGUAyfB5d34esIB2xQWDfpR8ZSmoel3TB8gdPM6Z9f5BMW0w2s9XbKaKiVyDaV5WQ
	wUdfbXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSfy-00000009cjC-1lSA;
	Thu, 12 Nov 2026 11:09:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSfc-00000009cdh-2Vk7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:08:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B125543E6E;
	Thu, 12 Nov 2026 11:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AEA1F00A05;
	Thu, 12 Nov 2026 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481723;
	bh=HiPw/vO6fj89ZTfYmyeZnIAu27qYcwnBAOmXn+WneYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T8WWcBabyiIZJt9o4CRWXCXqWprHnqX/iN3JpjVXQksv65oEatvA7TfzcUnPKz8mz
	 NTsKi80nGYIxl1a0wZnUAxfimcMlBPQq8SQ33l/rCDZ86XFhxtH04Bdcgth7iEhGXO
	 0xc/P9YLJNHE1ST277DK0pA4o7DQyBn8YWKtBkKaxY91DpvQ6xjT2p9tyYMVsZ90/d
	 M5m6LK4NLX9pyxOUJME4ljdvcr/FU6We7PrcibPjgBRP4vOV3ISuQ7pV1DM+duznMc
	 UIHCOy9NwJj133zfvBo6x6sPosW7OkrqjunUcezd3iKhqGycpYUO85/g9MbjSazy9q
	 fd47LzyUQzGgw==
Date: Thu, 12 Nov 2026 12:08:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pufan Jin <cyan2254650260@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development
 board
Message-ID: <20261112-mottled-formidable-galago-eb933b@quoll>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
 <20261111162917.97532-3-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111162917.97532-3-cyan2254650260@gmail.com>
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

On Wed, Nov 11, 2026 at 11:29:17AM -0500, Pufan Jin wrote:
> Add devicetree support for the ALINX AX7Z020B development board.
> The board is built around the ALINX AC7Z020 system on module with a
> Zynq-7000 (XC7Z020-2CLG400I) SoC, 1 GB DDR3 SDRAM and 32 MB QSPI
> flash, and provides Gigabit Ethernet (JLSemi JL2121 PHY), USB 2.0
> host, MicroSD slot, dual CAN buses (SN65HVD232 transceivers on
> MIO 10-13), I2C RTC/EEPROM/LM75 and the serial console on UART1.
> DevCFG FPGA manager is also enabled.
> 
> The two SMA AD inputs and the spare differential pair are wired to
> XADC aux channels VAUX1, VAUX9 and VAUX12. The XADC hard macro is
> always accessible from the PS, so expose these channels via the
> driver's xlnx,channels property.
> 
> Link: https://www.alinx.com/

Drop link. We do not advertise websites, unless it brings some value.

> Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
> ---
>  arch/arm/boot/dts/xilinx/Makefile             |   1 +
>  .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  70 +++++++++
>  .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 142 ++++++++++++++++++
>  3 files changed, 213 insertions(+)
>  create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
>  create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

...

> diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
> new file mode 100644
> index 0000000000..472d9fcaaf
> --- /dev/null
> +++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DTS for ALINX AX7Z020B Development Board
> + *
> + * Copyright (C) 2026 Pufan Jin <cyan2254650260@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include "zynq-alinx-ac7z020.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "ALINX AX7Z020B Development Board";
> +	compatible = "alinx,ax7z020b", "alinx,ac7z020", "xlnx,zynq-7000";
> +
> +	aliases {
> +		ethernet0 = &gem0;
> +		serial0 = &uart1;
> +		serial1 = &uart0;
> +		mmc0 = &sdhci0;
> +		spi0 = &qspi;
> +		i2c0 = &i2c0;
> +	};
> +
> +	chosen {
> +		bootargs = "";

Drop bootargs, why do you need empty ones anyway?


> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	usb_phy0: phy0 {

just "phy" or is there phy-1?

Best regards,
Krzysztof


