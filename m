Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C500606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xm5qRiJM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIu5xo20
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nAo3k7IN6MFlua5noogKuUzTuJs2qKHfA/Yw66Nd6Ng=; b=xm5qRiJMkq86bs
	UOBUMrFGI3191Y6BrGlpMnAG6Bp5x2vTTqD2OXIRI2Hldj1KXYiWAf89ulSEFb4W/W7Q+Q4SBr9tS
	rZnV4kFTNd2uwBu8WNAXM5lL/2zKCdxGc7oe7de4sIvOhjq4GKmeh0b0EHlLA3uCGI2dypeXVllYX
	3M5DQgb8GhAl8DVypilF5fnl7PQGgt898crkMSRmjo0Ank+JNcOtsPr9wWTiuxnHbqOZP+4CyY69U
	LKGtT9+1kHpGfKOOpGUKpljJlfd582n/UqJuhXDfr8V0o6NPpCMmmE1yitV43hC/WhiKRI+QcwzgO
	iqd7o4tHqFXtEZ+GZ/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8jY-00000009B3B-1MLU;
	Wed, 25 Nov 2026 08:52:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8jS-00000009B0u-001z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:52:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A670744283;
	Wed, 25 Nov 2026 08:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDA21F000C6;
	Wed, 25 Nov 2026 08:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795596721;
	bh=nAo3k7IN6MFlua5noogKuUzTuJs2qKHfA/Yw66Nd6Ng=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WIu5xo20Zcvt/DHS9FcFcsBfvdprdo1bbZDD05a7A5V9ZkHSt9VJ7u0UlRr+4OnwU
	 Uxebq7l1HxT/jCJqiR3vj7qilZS/AAoqVdLhxozKb3Vi+kqHWORNF7Wj6qBjh+VFEO
	 HhbnVBsnFblLNY8qUc7rf72vT28J0s9tLlozBT2De1MNmfHgZNH6LAqIaXSFDK73gE
	 SNAu9yAnaeKzhDcoAV+44FwfoKy57EHNyFs+3ltXknRqGENcTQVWrb1t2ZBe8d1ve8
	 s70GmeHR38PnIVMbjBALc+a5S4eUliwLI9cvhq5zcIDeDWnZLjGlzP8mSIAaIvRt3z
	 nuyqvTYKZRThg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 02/24] dt-bindings: media: Add bindings for Arm
 Mali-C720
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anthony McGivern <anthony.mcgivern@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
Date: Wed, 25 Nov 2026 09:51:57 +0100
Message-Id: <179559671799.14607.10622707622371448283.b4-reply@b4>
X-Mailer: b4 0.17-dev
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-24 17:07 +0000, Anthony McGivern wrote:
> From: Anthony McGivern <Anthony.McGivern@arm.com>
> 
> Add the device tree binding for the Arm Mali-C720 Image Signal
> Processor.
> 

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
> ---
>  .../devicetree/bindings/media/arm,mali-c720.yaml   | 134 +++++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c720.yaml b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3bd261bcefbe371b7b4610afdde8e556b2a2ae22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/arm,mali-c720.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali-C720 Image Signal Processor
> +
> +maintainers:
> +  - Anthony McGivern <anthony.mcgivern@arm.com>
> +
> +properties:
> +  compatible:
> +    const: arm,mali-c720
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1

Why is this flexible?

> +    items:
> +      - description: ISP main interrupt
> +      - description: ISP fault interrupt
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: isp
> +      - const: fault
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 3

Same question. List items with description instead.

> +
> +  clocks:
> +    items:
> +      - description: ISP main processing clock
> +
> +  clock-names:
> +    items:
> +      - const: vclk
> +
> +  resets:
> +    items:
> +      - description: ISP main processing clock domain reset
> +
> +  reset-names:
> +    items:
> +      - const: reset

Drop names

> +
> +  memory-region:
> +    maxItems: 1
> +    description: Reserved memory pool for ISP DMA allocations.
> +
> +  power-domains:
> +    description: Power domain containing the ISP.

Drop description

> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: Parallel video input ports.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port 0
> +
> +        properties:
> +          reg:
> +            const: 0

Drop properties, should not be needed, same in places below.

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port 1
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port 2
> +
> +        properties:
> +          reg:
> +            const: 2
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port 3
> +
> +        properties:
> +          reg:
> +            const: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mali_c720: isp@400000 {

Drop unused label

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

