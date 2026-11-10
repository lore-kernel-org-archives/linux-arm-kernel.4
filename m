Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7DA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oNO8Q5yW;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=AmiHZ/Ea
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pJFFAlvHvpv/DNb0ovxFiTKs4dBdzL3exBW92NJume8=; b=oNO8Q5yWWTHB9J
	NtIe/JfktkOoCsJtk/CxLOQ2HdXQLp+fsxe7fjob5Fkw8BkzdUNcLpxNzwvHuZEIEqfXtioWBuqkB
	avQ2ZXVN6XXUr90jSN5GevRv+nKkC9H/kQ6MTeiDhbcrFZNFV6kmYrgz3L4kIni/+ETVMdihj8tD1
	FP8nRgEs7ftpffEwM7+8+Asxk15qg1ZmA9XaEI8VTBPu0gpnjf9iceFLlCBDc+eODTObCKHAKn8iA
	empIIxRWES2LXkZb/8tls17QXVReFVBIFCtN95oS+Lob9jDoXL87BgaGqF5LV2F+E9jyttUHHOKZw
	fYkkQ3AGZFViIzC9Yf7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfOL-00000002ekq-3P6p;
	Tue, 10 Nov 2026 06:31:37 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfOJ-00000002ek1-0RkA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=pJFFAlvHvpv/DNb0ovxFiTKs4dBdzL3exBW92NJume8=; t=1794292295; x=1795501895; 
	b=AmiHZ/EajHUOVhXbdOoI1i9OScRz/aNoRa3dONKCzClsiuqJqICZttwG1xM+bV1R88qQDrbgshC
	hS7A9Elk5iw48nnD5Z8b1FYdgD7aUGhOuMlN1nXa6le0zbCIz1oomUiQq+X0ltLcuVFKdr9uwNQG3
	txusvXTl/q40PNuWSuvUZEwA2S6Gz3yS/ZYXk+Sp46kVis7W4WeXiLUwXGGnjOVcPKat+/CgOu3EH
	3Rop7MywSO7u0/ecsIK/vle7m+Knbc6XFGD9oF5iDZKvEuLFHGguJ11SIkmDazGL0Rvjv/K5GvqaD
	/8QV1DzrZzJcDR/Cg89MPp+E8cl9mTYy02iQ==;
Date: Tue, 10 Nov 2026 07:31:26 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christopher
 Obbard <chris.obbard@oss.qualcomm.com>, Andrew Goodbody
 <andrew.goodbody@linaro.org>, Paul Walmsley <paul@pwsan.com>, Russell King
 <linux@armlinux.org.uk>, Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 6/9] ARM: dts: omap: dm816x: Update USB node
Message-ID: <20261110073126.5c434695@kemnade.info>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-6-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
	<20261102-patch-ektor5-dm8168-dts-v3-6-9bd6d1d128f2@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_223135_151163_98A3620C 
X-CRM114-Status: GOOD (  17.58  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 20:52:52 +0100
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> From: Andrew Goodbody <andrew.goodbody@linaro.org>
> 
> USB node was not working correctly with DMA enabled as the supporting
> code had been updated without updating this SoC's device tree. Bring the
> device tree more up to date so that it works with DMA enabled.
> Removing deprecated usb_otg_hs `ti,hwmods` property in DT node in favour
> of ti-sysc implementation.
> 
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/boot/dts/ti/omap/dm816x.dtsi | 40 +++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> index 1e8d225dfb2c..314e5e580c8b 100644
> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> @@ -573,18 +573,26 @@ uart3: serial@48024000 {
>  		};
>  
>  		/* NOTE: USB needs a transceiver driver for phys to work */
> -		usb: usb_otg_hs@47401000 {
> -			compatible = "ti,am33xx-usb";
> -			reg = <0x47401000 0x400000>;
> -			ranges;
> +		usb: target-module@47400000 {
> +			compatible = "ti,sysc-omap4", "ti,sysc";
> +			reg = <0x47400000 0x4>,
> +			      <0x47400010 0x4>;
> +			reg-names = "rev", "sysc";
> +			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
> +			ti,sysc-midle = <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_SMART>;
> +			ti,sysc-sidle = <SYSC_IDLE_SMART>;
> +			ti,sysc-delay-us = <2>;
> +			clocks = <&default_clkctrl DM816_USB_OTG_HS_CLKCTRL 0>;
> +			clock-names = "fck";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -			ti,hwmods = "usb_otg_hs";
> +			ranges = <0x0 0x47400000 0x8000>;
>  
> -			usb0: usb@47401000 {
> +			usb0: usb@1400 {
>  				compatible = "ti,musb-dm816";
> -				reg = <0x47401400 0x400
> -				       0x47401000 0x200>;
> +				reg = <0x1400 0x400>,
> +				      <0x1000 0x200>;
>  				reg-names = "mc", "control";
>  				interrupts = <18>;
>  				interrupt-names = "mc";
> @@ -621,10 +629,10 @@ &cppi41dma 11 1 &cppi41dma 12 1
>  					"tx14", "tx15";
>  			};
>  
> -			usb1: usb@47401800 {
> +			usb1: usb@1c00 {
>  				compatible = "ti,musb-dm816";
> -				reg = <0x47401c00 0x400
> -				       0x47401800 0x200>;
> +				reg = <0x1c00 0x400>,
> +				      <0x1800 0x200>;
>  				reg-names = "mc", "control";
>  				interrupts = <19>;
>  				interrupt-names = "mc";
> @@ -661,12 +669,12 @@ &cppi41dma 26 1 &cppi41dma 27 1
>  					"tx14", "tx15";
>  			};
>  
> -			cppi41dma: dma-controller@47402000 {
> +			cppi41dma: dma-controller@2000 {
>  				compatible = "ti,am3359-cppi41";
> -				reg = <0x47400000 0x1000>,
> -				      <0x47402000 0x1000>,
> -				      <0x47403000 0x1000>,
> -				      <0x47404000 0x4000>;
> +				reg =  <0x0000 0x1000>,
> +				       <0x2000 0x1000>,
> +				       <0x3000 0x1000>,
> +				       <0x4000 0x4000>;
>  				reg-names = "glue", "controller", "scheduler", "queuemgr";
>  				interrupts = <17>;
>  				interrupt-names = "glue";
> 


