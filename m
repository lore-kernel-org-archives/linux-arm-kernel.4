Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B153D606A881
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fVzO5RQ7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3qoJLPo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bbH2TQquUOC97ViKb2aXVBiUQChWmb/RmAEnkXSiyRU=; b=fVzO5RQ7r4U4zGohx4fZ9mAUdt
	YxJyHWHbTDATZSno1kyFzWmwVkhFetcsL0oHf+DCVERdt++DVVM/OQ7+EstV6eCOIIhu6rYSvPz9v
	+wpsvaAfyR6CM6SGB5Jt+sBseT/cRf4KFca9RNbPKsXzv7DkU6gGvUjIsvxAxk3PX1C0RZB1Fll8a
	A3sUi1NPxSn3tTAE2xbZYv3fWZ3epDjzHGeRa6EKnhRTHuS5r0AJYeuIJyxgCA1XgtAtV5pSSaOvn
	lD8CFQ+P0gf0a3CemTIvhN4c3VpPeYevLV0U83dBTyL3kJg/ZxezrgNR2093ecyPOKQNNQvKIuoiH
	otkBPPag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmaN-0000000C1vc-27mO;
	Fri, 13 Nov 2026 08:24:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmZv-0000000C1VC-1NnC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:24:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5BFB40866;
	Fri, 13 Nov 2026 08:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3121F000C4;
	Fri, 13 Nov 2026 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794558250;
	bh=bbH2TQquUOC97ViKb2aXVBiUQChWmb/RmAEnkXSiyRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n3qoJLPokG9v/YVuZSy+ta4GdPuE7rbzBOsn35dVoa98Z5Y31TGZbBOMf8vmyWOP1
	 SZD7LXx9RELvy+anExj/i6b4iRZxX810CPDblBGUjHOQ/gt5PYwrnBwDSRnuI5j60w
	 4DN92OXxwxXfYCijCvMu60zgg7W9NleojlekfX8jHJ6kqY85VibE3X/KIKpVxbki/m
	 YsKDTtDfQ+P9ELxR4hIFAUmhFbFvdApxgw3i3585K9wRlo+uS0MCXNPJq6soK+l42d
	 2aGdkNQLPUwJLADCVP8H/EqvyvvZ6EANHyiTK6jZrFGNzURME72vlqYQPceqFDt/qe
	 JPKVjzNddZ3FA==
Date: Fri, 13 Nov 2026 09:24:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: stm32: Add clock-controller
 sub-node to STM32MP2 SYSCFG
Message-ID: <20261113-honorable-competent-lynx-b1d5b8@quoll>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-2-624559bb8ec7@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-2-624559bb8ec7@foss.st.com>
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

On Tue, Nov 10, 2026 at 02:10:22PM +0100, Gabriel Fernandez wrote:
> The SYSCFG of the STM32MP23x and STM32MP25x SoCs is described as the
> provider of the LTDC pixel clock, but the inputs of this mux (LTDC
> kernel clock, LVDS PHY pixel clock and DSI PHY byte lane clock) can't
> be described by the "clocks" property of the SYSCFG node: the SYSCFG is

Not true, you can.

> a syscon, whose first clock is taken as the clock of its registers and
> enabled around each register access.

That's a driver problem, fix drivers.

> 
> Add a clock-controller sub-node to describe the mux with its own clock
> inputs. It is required on STM32MP23x and STM32MP25x and not allowed on
> the other SoCs.
> 
> Deprecate the '#clock-cells' property of the SYSCFG node, which is no
> longer required. No driver ever registered a clock on the SYSCFG node,
> so this doesn't change anything for existing devicetrees.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml        | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index a559f8b03b84..13c02844a91f 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -38,6 +38,10 @@ properties:
>  
>    "#clock-cells":
>      const: 0
> +    deprecated: true
> +    description:
> +      The LTDC pixel clock multiplexer is described by the clock-controller
> +      sub-node.
>  
>    "#address-cells":
>      const: 1
> @@ -45,6 +49,10 @@ properties:
>    "#size-cells":
>      const: 1
>  
> +  clock-controller:
> +    type: object
> +    $ref: /schemas/clock/st,stm32mp25-syscfg-clk.yaml#
> +
>  patternProperties:
>    "^phy@2[48]00$":

As you can easily see, each child needs addressing. This is one more
argument why this is a fake device split, done only to match your driver
limitation. Please fix your drivers.

Best regards,
Krzysztof


