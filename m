Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30678606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rwGne9OC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DUFKC5k3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z6pS0ch2CwFHPRRjJX7/z7pWv4eyopkIkegoRahrCwo=; b=rwGne9OCX3WHQlFmdoa7Bf0w4q
	sIT+x4JJNKhpeSnB0dObYak+T9RPSEgY0XM1Q6MRP+bQ1lQzkBdGuD7BAEV7Jb4BFWWhW6gWZgMmE
	2dugZosmJhilt4G6JQ//WUce9LqWSB7aTitHJUSNyKO54L6ez2jaCFvzd3rT1WrhmnWK5ddgJmxAF
	UkxHc8IywJi0x7Lk8P74tfXUE0RzuLwnS4Vi6RALr1l0dk8lMbOlA+uIAB4/rRELb7dqtVNSUmVF9
	59TlwiJoWXUpm0tHSzIsV4Z3J8h9UNsAfvTozaw5Jhbemde6WVzbNzqM+gMdwZmH+pUXLd7wy4a1R
	c9ueyDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrCq-00000004sRA-0wUQ;
	Tue, 10 Nov 2026 19:08:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrCp-00000004sQs-1FqC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 19:08:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CBB54690B;
	Tue, 10 Nov 2026 19:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B871F0089F;
	Tue, 10 Nov 2026 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794337710;
	bh=Z6pS0ch2CwFHPRRjJX7/z7pWv4eyopkIkegoRahrCwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DUFKC5k33lGxs951RApJ8qlUjrgqKsXofFFAM8hutRwdx5PHD6pzfNSZD8OnDd2Sl
	 PBKgPByVdl/Mj0TaSzI5LmCgcmQueELQHX89qeDcYPDijMw1Rc0YuD0gsDpTjyqYDy
	 7ue5FpAlufjswMLX7fswVWUgux2W460gJU6/kHPN1Z0IdLRdcI0uNTQindAUxy1wzo
	 OA7QKoARBYa8JmW1lP168Q41vt8pf/X0uCvNwnCCXStnLbjgIVXVDfazoa/YL5Ol80
	 8T9AXVMNVl00H2ThsrmOGmQFt4uC0qqp0vy4TsWyARecs/wN9I4sPXzXvzqHXfcoKl
	 wx/CaW2Rw0f9g==
Date: Tue, 10 Nov 2026 13:08:27 -0600
From: Rob Herring <robh@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: jic23@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Message-ID: <20261110190827.GA1322356-robh@kernel.org>
References: <20261104091136.151269-1-cwweng.linux@gmail.com>
 <20261104091136.151269-2-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104091136.151269-2-cwweng.linux@gmail.com>
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

On Wed, Nov 04, 2026 at 05:11:35PM +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> Add a binding for the Enhanced Analog-to-Digital Converter found on
> Nuvoton MA35D1 SoCs.
> 
> The controller has eight external analog inputs. They can be used as
> single-ended inputs or as the four fixed differential pairs 0-4, 1-5,
> 2-6 and 3-7.
> 
> Use the common ADC channel properties to describe the physical input
> independently of the logical channel index.
> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
> ---
>  .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> new file mode 100644
> index 000000000000..85b0feac0236
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
> +
> +maintainers:
> +  - Chi-Wen Weng <cwweng@nuvoton.com>
> +
> +description: |
> +  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
> +  12-bit successive approximation converter with eight external analog
> +  inputs and one internally connected VBAT input.
> +
> +  The external inputs can be used as eight single-ended channels or as
> +  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
> +  connected VBAT input is not described by a channel child node.
> +
> +  The controller provides four interrupt outputs, ADINT0 through ADINT3.
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-eadc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: ADINT0
> +      - description: ADINT1
> +      - description: ADINT2
> +      - description: ADINT3
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  vref-supply:
> +    description:
> +      Optional external reference voltage connected to the VREF pin. If this
> +      supply is absent, the controller uses its internal 1.6 V reference.
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    const: rx
> +
> +  '#io-channel-cells':
> +    const: 1
> +    description:
> +      The cell selects the logical EADC channel identified by the reg value
> +      of the corresponding channel child node.
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^channel@[0-7]$':
> +    type: object
> +    $ref: /schemas/iio/adc/adc.yaml#
> +    description: |
> +      External EADC channel description. The reg property identifies the
> +      logical IIO channel index.
> +
> +      A single-ended channel may use single-channel to select an external
> +      analog input independently of reg. If single-channel and diff-channels
> +      are both absent, the external analog input is selected by reg.
> +
> +      A differential channel uses diff-channels to select one of the fixed
> +      hardware input pairs: 0-4, 1-5, 2-6 or 3-7. Each single-ended input
> +      and each differential input pair may be described at most once.
> +
> +    properties:
> +      reg:
> +        maximum: 7
> +
> +      single-channel:
> +        maximum: 7
> +
> +      diff-channels:
> +        oneOf:
> +          - items:
> +              - const: 0
> +              - const: 4
> +          - items:
> +              - const: 1
> +              - const: 5
> +          - items:
> +              - const: 2
> +              - const: 6
> +          - items:
> +              - const: 3
> +              - const: 7
> +
> +    allOf:
> +      - not:
> +          required:
> +            - single-channel
> +            - diff-channels
> +
> +    required:
> +      - reg

The allOf and required are effectively covered by adc.yaml already.

Rob

