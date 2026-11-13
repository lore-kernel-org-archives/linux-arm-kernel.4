Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA79E606E0E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VI0GUBe0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpi3rK7v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dUJYjdN1mbViyPCa9Ii5oLF+ArhVXAoKywBoKaNLkG8=; b=VI0GUBe08tOWD3YYF4TxQThw1e
	F2fmoQcqFNKZcY3czcs9Oh8vxl4pKUjE0dmeCfCTq3mzAGHv9MPHp/lwP2TfuPlOKbny5Y1oLW8Ci
	IhYaqzAsKa17w17utnNrlQJvV4lCykZUODKXNVoOt1KqF/Tu227j26zSVH8NOCDiZPhjqgHZHS8sI
	AmT+MbqPOk1Afal7PTv1TxAYY48K8y1hMSS8hGd2SiHHUVIjcaWZv0DpNFu1diVifobFe+YMREJdd
	OW8sDrMlYdZrVsEIYResjM+oRMqOntBt3SHYNTYPdtyK201KgTpI/I2lpNRYgEgwjniO74mcKjOk0
	7rTmzEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmak-0000000C28l-33R5;
	Fri, 13 Nov 2026 08:25:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmae-0000000C26b-2k0n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:24:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B9B1625EA;
	Fri, 13 Nov 2026 08:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095351F000C5;
	Fri, 13 Nov 2026 08:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794558295;
	bh=dUJYjdN1mbViyPCa9Ii5oLF+ArhVXAoKywBoKaNLkG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fpi3rK7vqXLZnf+x3lbCmQPmVELMx4JG82zA5/Hdy2qRkz7G25g8TetmxTnp0J+g5
	 J5fggYQBkJ2J7YtpJD+0slSLVc9jhp/3f5+3W0L/kfnG1EsCd//PkUDNV+rrDmv8fV
	 dMVHLqwNS6LVC/h/eKhTtcAFRbI2XzA3IXVB4PDlsAf5LZ+L5EqPiF40ZGLQb6VGVA
	 TNjm5lmBTBZih6Mjqj2GOjBWolMOfqQYW07yEGIxHnLuG6O9ekezESLSQ7vtWW6lju
	 QX5U4BZVKKdi2+zo3BDtXXPjjP4MRGr+M1BYI+BNDg2ces8+9/eyPhRECki3AQswUx
	 d660E13XTDiZw==
Date: Fri, 13 Nov 2026 09:24:52 +0100
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
Subject: Re: [PATCH v2 4/5] arm64: dts: st: add LTDC pixel clock controller
 on stm32mp23
Message-ID: <20261113-ape-of-inevitable-research-df4777@quoll>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-4-624559bb8ec7@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-4-624559bb8ec7@foss.st.com>
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

On Tue, Nov 10, 2026 at 02:10:24PM +0100, Gabriel Fernandez wrote:
> Describe the LTDC pixel clock multiplexer of the SYSCFG as a
> clock-controller sub-node and use it as the LTDC "ref" clock instead of
> the SYSCFG node itself, whose deprecated "#clock-cells" property is
> removed.
> 
> Only the LTDC kernel clock is available as parent on STM32MP231; the
> LVDS and DSI clocks are added on STM32MP235.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/stm32mp231.dtsi | 9 ++++++++-
>  arch/arm64/boot/dts/st/stm32mp235.dtsi | 8 +++++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> index fefbf6f4f153..df446f0c1539 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -4,6 +4,7 @@
>   * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
>   */
>  #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +#include <dt-bindings/clock/st,stm32mp25-syscfg-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/regulator/st,stm32mp25-regulator.h>
>  #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> @@ -1121,10 +1122,16 @@ exti1: interrupt-controller@44220000 {
>  		syscfg: syscon@44230000 {
>  			compatible = "st,stm32mp23-syscfg", "syscon";
>  			reg = <0x44230000 0x10000>;
> -			#clock-cells = <0>;

This breaks users.

Best regards,
Krzysztof


