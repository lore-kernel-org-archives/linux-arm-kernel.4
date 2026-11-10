Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D9606C685
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 17:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Baj0k5He;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LsJWDnyt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DVguc/JEfu5tg9eL/EvmKXFDpXmh7ZbHiCLJmkzT58A=; b=Baj0k5HeVcHuWKBRNix5cw+Lg9
	plBF5C4gC4tjO7XYL+cXFlgbPP+UGceCtCZGiNq50SEEJ44AaGBV6PlnOsrubB4OWZ/Mrt0LgLhmc
	hOaALTXxhS1m1KOktbnj/9scRULR1NVyzUZU0lZ1uAyx4D4enbwSxZppWJj/uX/WHYUmhIhfxhbkv
	uirDmEfMnFmAyOh+uMq8evs9yWgxsoWbWQ/a30WP0iqJIQDT3K28cZQh8IkrKOgkMSHhRe9CLaf/4
	UNyXraj7qaW0u65bDf4vLsorhl9O2IGk4O9mY+K1fpUU5g858xDH5riNRJgN15iXjUMvcGOJuXy16
	rdYGQ1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3c-00000004jMo-3yAq;
	Tue, 10 Nov 2026 17:54:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3b-00000004jLQ-2G7D;
	Tue, 10 Nov 2026 17:54:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EFCA64728B;
	Tue, 10 Nov 2026 17:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11381F0089F;
	Tue, 10 Nov 2026 17:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333294;
	bh=DVguc/JEfu5tg9eL/EvmKXFDpXmh7ZbHiCLJmkzT58A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LsJWDnytPzC4b4TwtpmQ2p6dTKAVt+LKt+JO+6Vmzd9NizDFA0CIHwNQQ6AIuX4/s
	 SsGTjIMoGEYGYylrqoqSC+7pD6ePrIPrGXJ/520xx80j0Ql7SBWVpDJf3DtsxqizKW
	 bReRmSA5r6Wl8lV7mPGzizz1wCU2+osYEV2X8hfHa7RUOSOehY5aQt99e9AubhQEU4
	 VJEKYSweUPlLKcytgU8QsynZnIPhbJAk3JLb7GZ2+2LoHy4k2kZbtJi9wK35oUAk1X
	 2Ok7oUtnc927IbYmHbFNH+FFFIGb7CkRnghD9SonhReAdd5Z5TGgUonzhSXXx7Nt2W
	 Rvs0IAMzNsUEg==
Date: Tue, 10 Nov 2026 11:54:51 -0600
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
Message-ID: <20261110175451.GA833369-robh@kernel.org>
References: <20261105100322.37816-1-tanure@linux.com>
 <20261105100322.37816-3-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105100322.37816-3-tanure@linux.com>
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

On Thu, Nov 05, 2026 at 10:03:17AM +0000, Lucas Tanure wrote:
> The T7 has the same ethernet glue as the G12A but needs two clocks of
> its own. The controller reaches memory through a pipeline stage with
> its own gate; nothing else claims it, so it is switched off as unused
> and transfers never finish. The glue registers sit in a block clocked
> together with the MDIO multiplexer, which probes after the controller
> has programmed them: the writes are lost and the port keeps the
> bootloader's delays.
> 
> So the T7 gets its own clock list, without the timing adjustment clock
> it never uses. Its delays follow ethernet-controller.yaml: the PHY adds
> the 2ns, and only the receive delay line offers fine tuning, so only
> rx-internal-delay-ps is valid here.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../bindings/net/amlogic,meson-dwmac.yaml     | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)

I tend to agree with the sashiko comment, but am fine either way. Once 
the if/then schemas are longer than the main schema, it's a sign to 
split.

> 
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index e769c9bb70d8..ff5e50f65114 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -23,6 +23,7 @@ select:
>            - amlogic,meson-gxbb-dwmac
>            - amlogic,meson-axg-dwmac
>            - amlogic,meson-g12a-dwmac
> +          - amlogic,t7-dwmac
>    required:
>      - compatible
>  
> @@ -84,6 +85,49 @@ allOf:
>          rx-internal-delay-ps:
>            default: 0
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,t7-dwmac
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GMAC main clock
> +            - description: First parent clock of the internal mux
> +            - description: Second parent clock of the internal mux
> +            - description:
> +                clock of the pipeline stage inserted in the bus path between
> +                the controller and the DRAM. Without it, the controller cannot
> +                complete DMA transfers.
> +            - description:
> +                clock of the register block holding PRG_ETH0 and PRG_ETH1.
> +                Without it, the block reads as zero and ignores writes.
> +
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: clkin0
> +            - const: clkin1
> +            - const: pipeline
> +            - const: pclk
> +
> +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.yaml.
> +        # The RX delay line of this glue is fine tuning in 200ps steps,

Sounds like constraints:

maximum: 2000
multipleOf: 200

> +        # added on top of what phy-mode describes. The TX side has no fine
> +        # tuning: its only step is a quarter of the clock period, the full
> +        # 2ns at 1Gbit/s, so the TX property is not accepted.

Move this to tx-internal-delay-ps. You can (kind of ackwardly) do:

tx-internal-delay-ps:
  description: ...
  not: {}

(or "not: true")

> +        rx-internal-delay-ps:
> +          default: 0
> +
> +        tx-internal-delay-ps: false
> +
> +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> +        # properties instead.
> +        amlogic,tx-delay-ns: false
> +        amlogic,rx-delay-ns: false
> +
>    - if:
>        properties:
>          compatible:
> @@ -106,6 +150,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,meson-g12a-dwmac
> +              - amlogic,t7-dwmac
>      then:
>        properties:
>          rx-internal-delay-ps:
> @@ -142,6 +187,10 @@ properties:
>        - items:
>            - const: amlogic,meson6-dwmac
>            - const: snps,dwmac
> +      - items:
> +          - const: amlogic,t7-dwmac
> +          - const: snps,dwmac-5.10a
> +          - const: snps,dwmac

I would drop either both or at least 'snps,dwmac'. They provide no value 
because there is nothing to use them. IOW, there's not s/w that works 
which only understands the last 2 and not amlogic,t7-dwmac. Correct me 
if I'm wrong. Maybe a bootloader with simple needs.

Rob

