Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DF3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FId+Jot2;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=WCGc5w2x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=elK6mDMEKfMlZvs1P5YKG6wAktFva3W0qwlwydywoP8=; b=FId+Jot2lw+6LJ
	Y4q8pz0xipZntTxUd2lsSVztzchqfm1pFa110ePC0gb09f0WWB8YEDIf2Px4wdSzpp4lxd3zmEhvG
	6/JSIKSOZlLMKN9mP/fpVfzC71HVgMkbAA2MU/pnBlNA8FAvpztfdIA++CVVmHX2DvBKUCEHqV5Bx
	lATo2j95baUdOV+8Aguw2ChZies+52+UHvm56vjil5Y0SQJ1uIkANiOc2pD3D5lAJ2XSR0pz9IP6N
	siEbLmUfd4aOyy6wZbgSgKyvMmj3hAYPUxjPzu8wVmEmf+eZeYpslaPB8Ks7EIEkwSdxvhznX0GQO
	bu3/QWkRoKXjEp4s3nYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfEZ-00000002dG0-1ym3;
	Tue, 10 Nov 2026 06:21:31 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfEW-00000002dFZ-2zMV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=elK6mDMEKfMlZvs1P5YKG6wAktFva3W0qwlwydywoP8=; t=1794291688; x=1795501288; 
	b=WCGc5w2x2nO3gLD0D19s8t9hmT/KnzVObkzYPclcnExoC8azSnVtMZ7hvoglFZPJcTK9bo90A5P
	iPG2WvtV7Vqn4DeOA8A4ZiiEMYTLicCIb0dIwi3dqGHY8T5JWkhvvtIg05TdRibFM/SAKr7mfHUMB
	fJ87eWKPybpW/eUfgDQ0eXAiZlxQarZ6cQBtSCU8A/X7aAXZFIfExe8W9+uQX5NZiqgG74FbYK1dR
	uylwsSxjiDuf8YLljZaA62yVTNn+QoKn60P/zZ1QH7XB2SO0qRkykPY7z2pp5sQpsXiWWs2F00eqo
	TsckaL1/DQsRY99pyUg1WkejDvQdb7T3voxQ==;
Date: Tue, 10 Nov 2026 07:21:18 +0100
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
Subject: Re: [PATCH v3 4/9] ARM: dts: omap: dm816x: refactor and align MMC
 node
Message-ID: <20261110072118.1f1d5148@kemnade.info>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-4-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
	<20261102-patch-ektor5-dm8168-dts-v3-4-9bd6d1d128f2@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_222128_756924_C21186AA 
X-CRM114-Status: GOOD (  16.63  )
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

On Mon, 02 Nov 2026 20:52:50 +0100
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> From: Andrew Goodbody <andrew.goodbody@linaro.org>
> 
> Update the MMC node in the TI Sitara DM816x device tree to align with
> the structure used in other similar SoCs. The changes include
> refactoring the node to better describe the target module and its
> sub-nodes. Also removing deprecated MMC `ti,hwmods` property in favour of
> ti-sysc implementation.
> 
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

> ---
>  arch/arm/boot/dts/ti/omap/dm816x.dtsi | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> index fc124f9ecfa1..1e8d225dfb2c 100644
> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> @@ -423,13 +423,33 @@ &edma 20 0 &edma 21 0
>  				    "tx2", "rx2", "tx3", "rx3";
>  		};
>  
> -		mmc1: mmc@48060000 {
> -			compatible = "ti,omap4-hsmmc";
> -			reg = <0x48060000 0x11000>;
> -			ti,hwmods = "mmc1";
> -			interrupts = <64>;
> -			dmas = <&edma 24 0 &edma 25 0>;
> -			dma-names = "tx", "rx";
> +		mmc1_target: target-module@48060000 {
> +			compatible = "ti,sysc-omap2", "ti,sysc";
> +			reg = <0x48060000 0x4>,
> +			      <0x48060110 0x4>,
> +			      <0x48060114 0x4>;
> +			reg-names = "rev", "sysc", "syss";
> +			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
> +					 SYSC_OMAP2_ENAWAKEUP |
> +					 SYSC_OMAP2_SOFTRESET |
> +					 SYSC_OMAP2_AUTOIDLE)>;
> +			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			ti,syss-mask = <1>;
> +			clocks = <&alwon_clkctrl DM816_MMC1_CLKCTRL 0>;
> +			clock-names = "fck";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x48060000 0x11000>;
> +
> +			mmc1: mmc@0 {
> +				compatible = "ti,omap4-hsmmc";
> +				reg = <0x0 0x11000>;
> +				interrupts = <64>;
> +				dmas = <&edma 24 0 &edma 25 0>;
> +				dma-names = "tx", "rx";
> +			};
>  		};
>  
>  		timer1_target: target-module@4802e000 {
> 


