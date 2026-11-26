Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p3eot7iz;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N6/cYmSL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qRpQAEjbRWH0r5g7MXwq/UpiaEON6BpLBkYKni8ayh0=; b=p3eot7izihHVTV
	AvloAJFMAT1/6CDqjpJDvw2MYjSiDMMQdHX6fFNdzQAmJ8ThtClAnwqpQBm3Wlj2XQrpcAvar4tEG
	GZcdIGsfxGf0S/k9x1MLzyM1D8IXXKc8cR0+l2MwippC4lGX9bpWwuB1evoLuxL1T7drQd0VI6b3h
	HVd7zY2v9cZVSCkCVuAF6Ery/wIT93uHBUhgVxqNmNRyRUSfyINcFxcr0aXv0EIO/2zCLvZXodYRa
	BC5PuXURo5HvrlJsLayMQ62QrMNe+QTxVFhGyEkBZ5/GfA5dTgvG/ly4rXgT2ZKiAYoL9s2DybzyU
	SF7u9acFGk3G0+hVu9Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNvc-0000000BkkN-06OL;
	Thu, 26 Nov 2026 01:05:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNvY-0000000BkjU-3lRe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 01:05:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9813E1596;
	Wed, 25 Nov 2026 17:05:28 -0800 (PST)
Received: from [10.43.3.73] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1607E3F632;
	Wed, 25 Nov 2026 17:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795655131; bh=c+M9C5R7IaV7aTw3Nf4cb/CDqUlPqYRMkhd7EMv4HRE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N6/cYmSLbhG8aliXW5w93tk/mDSePs79g3T6DAWxzmaBtF1T9+ukEJ9KcOKSjFFAp
	 wqBqXz98NcEPqU/u38jc3cAr5Vi78JmQxnJr88UpJH8Ek1S46gl98t4jNIjLsuIqwO
	 ocCXR0LLLC3UISJ111FRB67rAB5HOWvaPfnjtpUY=
Message-ID: <0750993c-1f37-46e1-884d-a4d2cffc76f7@arm.com>
Date: Thu, 26 Nov 2026 01:05:26 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: a133: Add KickPi K5C
To: rajanyadav0307@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Paul Kocialkowski <paulk@sys-base.io>
References: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
 <20261120-k5c-dt-v1-v1-4-d9681df67bc0@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261120-k5c-dt-v1-v1-4-d9681df67bc0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_170533_109310_C13406B4 
X-CRM114-Status: GOOD (  30.77  )
X-Spam-Score: -4.4 (----)
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

Hi,

On 11/20/26 08:22, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
> 
> The KickPi K5C is a single board computer with an Allwinner A133 SoC.
> Mainline Linux has no support for it yet; its factory firmware runs a
> vendor Linux 4.9 kernel. Add a device tree for PCB version V1.3, which
> has:
> - 2 GB DDR3 DRAM, 8-bit eMMC (HS200) and a micro SD card slot
> - an X-Powers AXP707 PMIC, which drives VDD-CPU from DCDC2 and DCDC3
>    in dual phase mode
> - a HYM8563 RTC on I2C3 (PH12/PH13)
> - power input through a 12 V DC jack or the USB-C port (5 V)
> - two USB-A ports behind an on-board USB hub on USB1, whose power
>    switch is enabled by PL8
> - a blue status LED on PL10
> - the debug UART on PB9/PB10
> 
> The regulator assignment and the pins come from the board schematic
> (V1.3) and were checked against the vendor's device tree and on the
> board. The pin bank supplies are the same as on the Baijie HelperBoard
> A133. All tests were done with the board powered through the USB-C
> port.
> 
> Mainline has no binding for the AXP707. Its chip ID register reads 0x51,
> which U-Boot's AXP803 code accepts, it works with the AXP803 driver, and
> the vendor device tree also describes it as an AXP803, so the PMIC node
> uses the AXP803 compatible.

... as on every other A133 board, so please drop the lengthy explanation.

> Not described yet:
> - Ethernet: the board has a Maxio MAE0621A PHY, which needs a driver
>    that is not in mainline yet

Is that so? In the v1.3 schematic that I am looking at, it shows a 
Realtek RTL 8211F, and also the board pictures on the KickPi website 
clearly show a Realtek logo on the chip next to the magnetics and the 
Ethernet socket.
So what is going on here?

And besides, even if you have a Maxio PHY: how is this clocked? Does it 
have an external crystal oscillator? Or is it clocked via some PWM / 
clock fanout pin from the SoC? Only in the latter case you need the PHY 
driver, with a crystal it should work with the generic clause22 
compatible string. Once we get a driver, the code will auto-detect the 
PHY ID and use that driver, for a potentially improved feature set.

Cheers,
Andre



> - the Wi-Fi/BT module (VS6621S40, Seekwave SWT6621S) on MMC1: there is
>    no mainline driver for it, and in my tests its SDIO card did not come
>    up after a cold boot, so the slot is left out until that is understood
> - USB data on the USB-C port (USB0): the vendor's firmware uses it as
>    a peripheral port, but I could not test that yet
> - the RTC alarm interrupt on PB8: first tests pass, and it will follow
>    in a separate patch after more testing
> - display, camera, audio, the IR receiver, the fan header and the
>    battery connector
> 
> The CPU uses the A100 OPP table, like the other A133 boards today.
> 
> Claude Code (Anthropic) drafted this device tree and its message from
> the schematic, KickPi's documentation, the vendor device tree (as a
> reference for values only) and my board measurements; I reviewed it
> and tested it on a KickPi K5C.
> 
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Link: https://lore.kernel.org/all/d4d89cf9-884d-424b-927d-5b6692f50327@arm.com/
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
> ---
>   arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>   .../boot/dts/allwinner/sun50i-a133-kickpi-k5c.dts  | 228 +++++++++++++++++++++
>   2 files changed, 229 insertions(+)
> 

