Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFDF606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HLBgQjF8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S35aIuAu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FGbd/iu2bJV8eXi7tvqHXFX25ugqVjT7gk/mtRxAUdY=; b=HLBgQjF8jRm/8BSd9GdugeZWzz
	H8SLpl0hmg1Bwi7t+fASsCKyzAVw9p/+jYrzk1umtHNJOWkmSz+mhfTbiuDWMlprNpB+tX/qVh6cV
	5pq5KtfCWcqX3gvHJUSiEHUfGFhTeoKi3oFxDFZk+65RnDWfpeNHZTF2abc2mKj6qAUZjVDm9VZTt
	caF3Los6SdPq7RVDpAAyiPYOAGsuwoZhp4eFV0ew4W/Z5dwuCNRK5DzrDtoyk6qoZBQh99KvM1eWN
	ERrnFAnXRWQp+lryXFKePBef7jkzTAOVBO/OwMbBsZ/OJxA4NM1tfl6uOROJk/gkgj2LyzhQHn0nL
	s0UQmALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmbo-0000000C2Pl-0VKt;
	Fri, 13 Nov 2026 08:26:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmbe-0000000C2NP-3kCx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:25:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A28D74639F;
	Fri, 13 Nov 2026 08:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BB61F000C4;
	Fri, 13 Nov 2026 08:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794558358;
	bh=FGbd/iu2bJV8eXi7tvqHXFX25ugqVjT7gk/mtRxAUdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S35aIuAu1fbIotDQ7NLNQELFhwzIYjYRBbiXmfpAugW8LbxOBgrJhraxGTYQ3EJLk
	 15yXnxv0eNYTfOQnQW1TARXkZrEpSMMuBD4wSNc/0NddaTsDWuvh0oAMb7P0FNS+Pr
	 kVGFwIrmxWiECrg5SLBCYSifL0rkmM7egttM5X9jCAgvWcoJ11rVKovC3CtX+t2JsI
	 msf/5IWKsQeW6MtoSa1q4BFK0lgJHeX6ubLx2KdZLQAeb7vxWyAq82HTfKla10YZ3m
	 XJaWJAOlScUKZinJuR7P4lj6yyD9EU4kwnFAhMs8nuXpTtKeNK+ARSknELYXztMnB5
	 /NMA0Y2N+kAOQ==
Date: Fri, 13 Nov 2026 09:25:55 +0100
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
Subject: Re: [PATCH v2 5/5] arm64: dts: st: add LTDC pixel clock controller
 on stm32mp25
Message-ID: <20261113-mottled-maroon-marmot-b45b14@quoll>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-5-624559bb8ec7@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-5-624559bb8ec7@foss.st.com>
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

On Tue, Nov 10, 2026 at 02:10:25PM +0100, Gabriel Fernandez wrote:
> Describe the LTDC pixel clock multiplexer of the SYSCFG as a
> clock-controller sub-node and use it as the LTDC "ref" clock instead of
> the SYSCFG node itself, whose deprecated "#clock-cells" property is
> removed.
> 
> Only the LTDC kernel clock is available as parent on STM32MP251; the
> LVDS and DSI clocks are added on STM32MP255.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/stm32mp251.dtsi | 9 ++++++++-
>  arch/arm64/boot/dts/st/stm32mp255.dtsi | 8 +++++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index dac3d2d23ff0..8d644153dbcb 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -4,6 +4,7 @@
>   * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
>   */
>  #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +#include <dt-bindings/clock/st,stm32mp25-syscfg-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/st,stm32mp25-rcc.h>
>  #include <dt-bindings/regulator/st,stm32mp25-regulator.h>
> @@ -2076,10 +2077,16 @@ exti1: interrupt-controller@44220000 {
>  		syscfg: syscon@44230000 {
>  			compatible = "st,stm32mp25-syscfg", "syscon";
>  			reg = <0x44230000 0x10000>;
> -			#clock-cells = <0>;

DTS with this was already released for a year, so you really should not
break its users for no reason.

Best regards,
Krzysztof


