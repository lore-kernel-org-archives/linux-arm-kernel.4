Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7DE606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y3Nu34HN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SnzyokXF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UXvFu+Wn1ESA3yGz4gkc3wR7DuZbJgWGF7pWZKVFO4w=; b=y3Nu34HNZFKrKnzTgt1d8kUwAN
	z+iOyDZIRR+505yIv/q+zg9NMbComlvH2OyWK2PxihJ+2jSnN0rUMRHJUMwqHS5Uf2O9XIgfJxkFN
	fkGXw82Syd1/MbR7PMF91Cnwr8UvwZF1UTPRQFazq+mfooLX/l82WB65KC6NU4vRZHXYzpWORMQ2L
	H4mDz986w8E4TlDgrNWMm/f2OXdtbs9x2L5ibp//+RhfCBpnpLmJj0K16RuQSQlyx/XUW/NlMuaj6
	W7jo6RLFGb6oPLBNmwOtn8JcMdWcxtOIg2TeduhXw83evefNjM2267lfWbARZ72ky4IlODEtTJ/5m
	oe+AwDag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmYQ-0000000C102-3QCF;
	Fri, 13 Nov 2026 08:22:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmYO-0000000C0zX-2U1s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:22:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D3F1625BA;
	Fri, 13 Nov 2026 08:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528591F000C5;
	Fri, 13 Nov 2026 08:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794558155;
	bh=UXvFu+Wn1ESA3yGz4gkc3wR7DuZbJgWGF7pWZKVFO4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SnzyokXFuhEVSMurbyoM4lz70Pmp7QX1+Vry1yBy9/1gqKkwg/B3Ao5+tQQuQghZo
	 12IIuHadRtw9ptiOib143gO88XOQ4esR1jwITNxwt56TEMUGH1W3+UKSCmoFPRmFQa
	 BL633Sz6dAuGseT1ze7jSWShyfPUGbt5xuilY49Io5l0VTGQFDMdclwWlVa2Rapiq/
	 gSlXbqNpnd0wnMCYTfWdqh2MCQoHratcRN4ZasaXyu9nw+J7WiIwulblIvFpzUT0aF
	 E4YJUXGHhw4T++mqHxVzF7Ujyn1GrVV+U3qeQYxvZuo5lsgUgQe7EgDP/CO8lbkbm3
	 QGiKHn4NgYqZQ==
Date: Fri, 13 Nov 2026 09:22:31 +0100
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
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Add STM32MP25 SYSCFG clock
 controller
Message-ID: <20261113-charming-admirable-pronghorn-bdc26c@quoll>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-1-624559bb8ec7@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-1-624559bb8ec7@foss.st.com>
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

On Tue, Nov 10, 2026 at 02:10:21PM +0100, Gabriel Fernandez wrote:
> The SYSCFG of the STM32MP23x and STM32MP25x SoCs selects the LTDC pixel
> clock among the LTDC kernel clock, the LVDS PHY pixel clock and the DSI
> PHY byte lane clock.
> 
> Add the binding for this clock controller, described as a
> clock-controller sub-node of the SYSCFG node, along with the header
> defining the identifiers of the provided clocks.
> 
> A sub-node is needed since the inputs of the mux can't be described by
> the "clocks" property of the SYSCFG node: the SYSCFG is a syscon, whose
> first clock is taken as the clock of its registers and enabled around
> each register access.
> 
> The inputs are listed in the "ltdc", "lvds", "dsi" order so that the
> ones missing on a SoC (no LVDS nor DSI on STM32MP231/233 and
> STM32MP251/253) can be omitted at the end of the list. "#clock-cells"
> is 1 so that the other clocks of the SYSCFG can be added later without
> changing the binding.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp25-syscfg-clk.yaml    | 61 ++++++++++++++++++++++
>  .../dt-bindings/clock/st,stm32mp25-syscfg-clk.h    | 12 +++++
>  2 files changed, 73 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml
> new file mode 100644
> index 000000000000..027d14f28b0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/st,stm32mp25-syscfg-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32MP2 SYSCFG clock controller
> +
> +maintainers:
> +  - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> +
> +description: |
> +  The SYSCFG of the STM32MP23x and STM32MP25x SoCs provides clocks, described
> +  by a clock controller sub-node of the SYSCFG node.
> +
> +  The provided clocks are identified by the macros defined in
> +  include/dt-bindings/clock/st,stm32mp25-syscfg-clk.h:
> +    - CK_SYSCFG_PIX_LTDC: LTDC pixel clock, selected in the DISPLAYCLKCR
> +      register among the LTDC kernel clock, used by the RGB parallel output,
> +      the LVDS PHY pixel clock and the DSI PHY byte lane clock.
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-syscfg-clk
> +
> +  "#clock-cells":
> +    const: 1

So you have 1 clock, thus drop the header and here you have cells=0.
> +
> +  clocks:
> +    minItems: 1

Why is this flexible? Device either has or has not these inputs.

> +    items:
> +      - description: LTDC kernel clock
> +      - description: LVDS PHY pixel clock
> +      - description: DSI PHY byte lane clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: ltdc
> +      - const: lvds
> +      - const: dsi
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names

Best regards,
Krzysztof


