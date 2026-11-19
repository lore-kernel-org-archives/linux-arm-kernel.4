Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D10606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1EO9dulO;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O0D+63dh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0KsnA1sc2ZPNx4wFgHWHhB+NH0HS9lIKRKe68U1iMk4=; b=1EO9dulOVdHesb
	0sGBPxCpX8t04P7D9tCjJVZsstjhfZIaFhtKGpkLmqkGZVTVERekEuYjoyFwOcV+0Gh9sSz47N23U
	hoyApiOYynbEnsLR73HTlBZSWFKYFIcjpuUWUoIsMJGVAle4jNhBhGDt7PDyvNVDr9E9ssr3DGRyl
	12JPHJGQApkBpq+OJ2nFJm+AK0l5OIKYkGGyUkrYcNFCJYfLz5dkD/tTzRC5wk0Bq3/R8BZxM0cWf
	/Q1EOeO2nCeJqFDkeI/FYyQgmFMxzRo8kBAh0N6e/kdJ8L4/s+VZfATfaKsW3U0cvLlrJlZLZAJcC
	GKLv8J7z1gzksQnocCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0Au-0000000BgSp-3KUC;
	Thu, 19 Nov 2026 11:19:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0Ar-0000000BgSP-2khG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:19:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A42B1575;
	Thu, 19 Nov 2026 03:19:22 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84B133F882;
	Thu, 19 Nov 2026 03:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795087165; bh=wni50JqD/rgfdfFKe6pPfOFoW/LymRi2FWik5KqVhC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O0D+63dhCQU6szFikY+uimE6GKtFQmiJYlRYi+L1o5lauP7FUnaLfkZJw6m6AJoAk
	 MIOkKY3VaBwMmJO2HpVgxBB+Hs4sYtlmLQ3C7rxYx5mEuWldQ7r57yTy9j8Obb+ByJ
	 n4/eImI2DTDYhlfYrB0FrLcibzGivAP0/k1eOiAM=
Message-ID: <e5c405ce-0847-41c5-a936-0d8809f90ae0@arm.com>
Date: Thu, 19 Nov 2026 12:19:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: allwinner: orangepi-zero2: Reference
 the SPI NOR by label
To: aiyengar1990@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
 <20261119-zero2-spi-nor-dual-read-v2-1-185c87065e39@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261119-zero2-spi-nor-dual-read-v2-1-185c87065e39@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_031929_808136_BDA1D7B6 
X-CRM114-Status: GOOD (  16.97  )
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

Hi Arun,

thanks for the changes and the respin!

On 11/19/26 06:29, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> Andre Przywara suggested labelling the flash node, so the Zero2 sets its
> supply through the label instead of nesting flash@0 in &spi0.
> 
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi |  2 +-
>   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 10 ++++------
>   2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> index 0d3e761f6466..646d92e0f724 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> @@ -104,7 +104,7 @@ &spi0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
>   
> -	flash@0 {
> +	flash: flash@0 {

I feel like "spi_flash" would be a better, more specific label to use, 
"flash" is a bit generic.

>   		#address-cells = <1>;
>   		#size-cells = <1>;
>   		compatible = "jedec,spi-nor";
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index 90c25e12e189..59bbb09bcdbf 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -24,6 +24,10 @@ &emac0 {
>   	phy-supply = <&reg_dcdce>;
>   };
>   
> +&flash {
> +	vcc-supply = <&reg_aldo1>;
> +};
> +

Could you do me a favour and add the OrangePi Zero3 regulator as well, 
to sun50i-h618-orangepi-zero3.dts? It's also reg_aldo1, although that's 
a different PMIC, so actually a different regulator, and so should stay 
in the board specific .dts (even though the lines look the same).
That saves me from sending a follow-up patch with a dependency.

Otherwise the patch looks alright!

Thanks,
Andre.

>   &gpu {
>   	mali-supply = <&reg_dcdcc>;
>   };
> @@ -147,9 +151,3 @@ &pio {
>   	vcc-ph-supply = <&reg_aldo1>;
>   	vcc-pi-supply = <&reg_aldo1>;
>   };
> -
> -&spi0 {
> -	flash@0 {
> -		vcc-supply = <&reg_aldo1>;
> -	};
> -};
> 


