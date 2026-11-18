Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34151606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VQKkBk3J;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P+LqYcQo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zmXjV3iawTS0v0ZQvsd7944Tri/Bv2s1a3To2GaIC2Q=; b=VQKkBk3JTgNQUr
	6DesHwbHlJwfrVVLq+P2Qt/2qj8PjNQqxEYxG1lswTe28l+d8BrnHShBTIeUnNJoi7LccA4KnL3tj
	32k1PGGwKkCBPfLoQ14Y8pryGBU5jW7N30aFYNwMHAZhKkY8KZF3IyXkr+jXQV2BrKLkofcisGbAw
	r5N/HjYfOGwN10DaKgAmapZdhYISKn9r6iql2yUoTUA5uBIID+Z1r8OGFD1vaejFA9varAwp4NGtq
	idQtY5mQeGjW4Wn5XKyGCy9FxbQY1ueCedRHd0tS1IR/SmmTM1mlIGw0NzczEk0mq3Mdf+HCQ88aI
	0MxDYVnAdEXjCcpgJDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdgy-00000008hP2-2gpV;
	Wed, 18 Nov 2026 11:19:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdgw-00000008hOP-1XZ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:19:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBA2E1596;
	Wed, 18 Nov 2026 03:19:01 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC1723F673;
	Wed, 18 Nov 2026 03:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795000744; bh=ctVycx8CAE9HKS7xZ8rpaNfM80sKn1OMLQroGjvCHV4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P+LqYcQodHIrsRQtwJwhcavH4FJ2SP66b1oUrhYo/E21Jk+GpJS2V6Y99CfcIYwt2
	 s+5XGDeJy8eS+y2JFHg3wrEBJHgh59qQriN5/QpDPs6YzoyPawbpqKMUcfSWHCQFxh
	 mLxiZETSRm6rt0Tb769phP/EHvdi1Jmj1XH/DERA=
Message-ID: <aa1d651d-8ace-40c2-97c1-7ef68fa0f44f@arm.com>
Date: Wed, 18 Nov 2026 12:19:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: allwinner: orangepi-zero2: Read the SPI NOR
 over two lines
To: aiyengar1990@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261118-zero2-spi-nor-dual-read-v1-1-bcdcbf785be0@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261118-zero2-spi-nor-dual-read-v1-1-bcdcbf785be0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_031906_491344_845C1C1E 
X-CRM114-Status: GOOD (  23.93  )
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

On 11/18/26 04:55, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> WP# and HOLD# are tied to VCC (schematic v1.3), so read over two lines.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Needs the spi-sun6i H616 dual read series v2 (prerequisite below).

I don't think it does, and this dependency wouldn't be legal anyway: the 
DT and Linux driver code are independent, even though they live in the 
same repository.
So as it stands: if you specify a 2 bit wide bus, but the driver doesn't 
support this (older kernels), the driver will just ignore this, though 
you get a message:
[    4.226908] spi spi0.0: setup: ignoring unsupported mode bits 400

So there is not hard dependency, functionality-wise, though it will be 
faster only if you have both the driver and the DT changes.

> Tested on an Orange Pi Zero2 with it: 1-1-2 reads (opcode 0x3b), 2 MiB in
> 0.28 s instead of 0.52 s, identical data.
> 
> Developed with Claude (Anthropic), which wrote the commit message. I
> reviewed it.
> ---
>   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index 90c25e12e189..fb117116002e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -150,6 +150,7 @@ &pio {
>   
>   &spi0 {
>   	flash@0 {

This double reference looks odd. Why not just add a label to the flash 
node, and skip the spi0 reference altogether? Should have been done on 
the patch adding the supply (which has been already merged), but maybe 
we can still rectify this.

> +		spi-rx-bus-width = <2>;

Please note that this is true for the OrangePi Zero3 as well, so this 
property should be moved into sun50i-h616-orangepi-zero.dtsi.
Tested this on my Zero3 board, it works and reads the entire 16MB flash 
in 1.8 instead of 3.5 seconds.

Cheers,
Andre

>   		vcc-supply = <&reg_aldo1>;
>   	};
>   };
> 
> ---
> base-commit: a203a4bac3316451a3036653657c8b250dea2055
> change-id: 20261115-zero2-spi-nor-dual-read-645a6de25e81
> prerequisite-message-id: <20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com>
> prerequisite-patch-id: 28b145097d0f859e5bd27bcc5028d0915f3ba4bd
> prerequisite-patch-id: fb47570beb53613acb42c518fd1999e05e0c54fb
> 
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>


