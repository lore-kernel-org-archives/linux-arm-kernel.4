Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A430606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mgKdyYUD;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nen37E9n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BCrbRJEI3FmidgytAkajQBd7EJHV6pZe27NxHm/eDQo=; b=mgKdyYUDQRRD6J
	SEK/mX1dSrs7Bes3A+5GVPNQ+7NZd1+oj2VJV5Y60zuGxqkEO42Ted/g1JTVBWDPl+4JKDOU2ssFG
	H7hvu0893g04aDoPlCRef+O6XXbbgBq/3Cdhrc1w1Hk9fcnWcTP46zRRKAm2Fbj/g9nWAJVlJMHHe
	BV3F6NV/LgnTgVqo97LUYhLQkVnPtB7R4/yfe4id1ardZ4MfVWfRJ88SI+R4pxjB5acJZ37mSEq90
	VwDESpxEeYHNeHHAAl71SKUptCWm0SdNtKkbZ/4i3qTBTuC8hNrdhnPKepW9YBiGI9MNOEGqR1PDG
	gEzm200iFbpb698HzVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUS7w-0000000FdIe-3tIM;
	Fri, 20 Nov 2026 17:10:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUS7t-0000000FdIC-3ggo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:10:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF95D1575;
	Fri, 20 Nov 2026 09:10:13 -0800 (PST)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 762C03F632;
	Fri, 20 Nov 2026 09:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795194616; bh=hqSsN2fuakU0TLaUzJxfRCMFwMgrGLnW5FmVIoMUQ0I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nen37E9n7YXZkwtkpHbNCVzwW552IlNclcRDZRADm0xR79n2+SJbOjitS0/NbEMvf
	 HIWhV208u8iIWQi0STJcU5s1JxGbKH1TISA+UcslQxdMqAdKpTY3QPiqyuwNI5YjbD
	 yfLdzZ0UY5kPXm3ekPCB/PGPtF2OxeFdbiPU2PCI=
Date: Fri, 20 Nov 2026 18:10:10 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Cc: aiyengar1990@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: allwinner: orangepi-zero2/zero3: Set
 the SPI NOR supply by label
Message-ID: <20261120181010.59d5f7c0@ryzen.lan>
In-Reply-To: <20261120-zero2-spi-nor-dual-read-v3-1-1cbb0caaed91@gmail.com>
References: <20261120-zero2-spi-nor-dual-read-v3-0-1cbb0caaed91@gmail.com>
	<20261120-zero2-spi-nor-dual-read-v3-1-1cbb0caaed91@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_091018_131814_8CA80714 
X-CRM114-Status: GOOD (  17.70  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 06:30:08 +0000
Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
wrote:

Hi Arun,

> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> Label the flash node in the shared dtsi, so each board sets its supply
> through the label. The Zero2 keeps reg_aldo1. On the Zero3 the flash VDD
> is on the 3.3V rail from the AXP313A DLDO1 pin (schematic v1.2), so it
> gets reg_dldo1.
> 
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>

> ---
> Andre: reg_dldo1 instead of reg_aldo1 on the Zero3. Schematic v1.2
> sheet 4 labels the 3.3V net "ALDO1", but it comes from AXP313A pin 12
> (DLDO1, VCC33-DLDO); pin 15 (ALDO1) is the 1.8V VCC18-ALDO. The flash
> VDD (U61 pin 8, net DCDCE) is on that 3.3V net. Not tested, no Zero3
> here.

Ah yeah, indeed, the schematic is super confusing in this respect. The
flash chip uses DCDCE(!) as the supply label, which then goes on to
connect to some unused label "ALDO1", but also to VCC33-DLDO, which is
the actual PMIC connection. And the chip needs definitely more than
2.3V for its operation, according to its datasheet, so 3.3V is the right
voltage.

So my bad, and thanks for checking this thoroughly.

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 6 ++----
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 4 ++++
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> index 0d3e761f6466..cd1f67ad7c2b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> @@ -104,7 +104,7 @@ &spi0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
>  
> -	flash@0 {
> +	spi_flash: flash@0 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		compatible = "jedec,spi-nor";
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index 90c25e12e189..2f8a16d1c9aa 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -148,8 +148,6 @@ &pio {
>  	vcc-pi-supply = <&reg_aldo1>;
>  };
>  
> -&spi0 {
> -	flash@0 {
> -		vcc-supply = <&reg_aldo1>;
> -	};
> +&spi_flash {
> +	vcc-supply = <&reg_aldo1>;
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> index c51d4d9120de..afa753dead30 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> @@ -103,3 +103,7 @@ &pio {
>  	vcc-ph-supply = <&reg_dldo1>;
>  	vcc-pi-supply = <&reg_dldo1>;
>  };
> +
> +&spi_flash {
> +	vcc-supply = <&reg_dldo1>;
> +};
> 


