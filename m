Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFF060A2602
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=06fwZzS2;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cndOLz/W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HoeW7YwGvvuI/NADDycrfel2s95vBScbfUbzR4K0kTw=; b=06fwZzS2YpACt1
	xF3iRoSiQx6gA85LRKjS3BI8ykams32p1Zr9au+Txk73Sfl+8qiDC10yYqMoACEmb15ZSj/HgH/zk
	vMjgUuNtRV38udbRrHwuGKFJzHCMaSYp2b5GJfjd47lPe2pAPUqJfGl4wMh8la5FL/jcZ0oU27S0N
	SMVkby9fzC/MLZPjS7uki2B5sLstzbgZf32ZKpv2a9bF6JS6DI+9223BkQUqnpADPO4zxR25RKEyN
	DJnieMgXd79HAKSI+h0lIjjw7N1pGlHKtvw2bv2SSI0/83dPrVc4zN0rQlaxF+V/ukHvw2LW3gkuA
	8Uoclf+BbNc9sk56XJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURtg-0000000FbML-1dBL;
	Fri, 20 Nov 2026 16:55:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURtS-0000000FbJh-0bY8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:55:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B271575;
	Fri, 20 Nov 2026 08:55:15 -0800 (PST)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E126C3F882;
	Fri, 20 Nov 2026 08:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795193718; bh=V/yBk9sLgKSP1wHaS8QVLRxQxyNAzJkrH+caPcA+9eY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cndOLz/WaXAMes9S6rn2jY028kub89buY56y4U0qnV+l5egb7076ovfU+6pk5PzbD
	 Psre7u02JqvWLAU5cTyCLCZOlR+qf7UVMs/GifBZwy/4p5NWiHlIHaOpmKFFkZMufJ
	 /vG2mYs4wJUvlWLYWBX05y4PL19Gh5npSDYiK1Mw=
Date: Fri, 20 Nov 2026 17:55:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Cc: rajanyadav0307@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul
 Kocialkowski <paulk@sys-base.io>
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: a100: Add I2C3 pins on
 PH12/PH13
Message-ID: <20261120175511.70ec8a36@ryzen.lan>
In-Reply-To: <20261120-k5c-dt-v1-v1-3-d9681df67bc0@gmail.com>
References: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
	<20261120-k5c-dt-v1-v1-3-d9681df67bc0@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_085522_365991_5C34C698 
X-CRM114-Status: GOOD (  17.87  )
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

On Fri, 20 Nov 2026 01:22:15 -0600
Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
wrote:

> From: Rajan Yadav <rajanyadav0307@gmail.com>
> 
> The I2C3 controller can use PH12 (SCK) and PH13 (SDA). The KickPi K5C
> connects its HYM8563 RTC there.
> 
> Add a pin group for them, marked /omit-if-no-ref/ like mmc1_pins, so
> it is only kept in the boards that use it.
> 
> Claude Code (Anthropic) drafted this change and its message; I
> reviewed it and tested it on a KickPi K5C.
> 

Checked against the manual, and the pinctrl driver (to map the function
number to the pin mux):

> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index fce91dc2c28..3b53d64f25e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -215,6 +215,12 @@ pio: pinctrl@300b000 {
>  			interrupt-controller;
>  			#interrupt-cells = <3>;
>  
> +			/omit-if-no-ref/
> +			i2c3_ph_pins: i2c3-ph-pins {
> +				pins = "PH12", "PH13";
> +				function = "i2c3";
> +			};
> +
>  			mmc0_pins: mmc0-pins {
>  				pins = "PF0", "PF1", "PF2", "PF3",
>  				       "PF4", "PF5";
> 


