Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCA8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1W4zqn3T;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abqq1O6B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uZZNoJoa75OyEypHvSPVxgZosKqnB322rXpj6FnAOr8=; b=1W4zqn3TNbnKlK
	QRAHF7JrZPHDnanhHXxOjMpHrm0YPtujs0Sdp9Al+ljo96OaeUppdXYT7Qd/k0093K+ZWz6Qyol7a
	En0nXBAwjcmVe8F9/voD9/gnEo47Bft1IjnFkeUol/83L8Jl5xhwuIPsgSBP+x4/T67yysImHSppu
	6e4Smna8KYSJoes5C4oWi3pbqLrXN6oIdZ0yFq3UyGBQeR4td6p/oCeFD2Ljp0mJNbI4lmX2yfKp2
	9b37Gid8Ctglr68UolP331EnM+vwFzzX7g6iHQhd5t8g4PJDQHOQ0xZmkyIFdzBBDWQ2yBuOAadL3
	UgJWhBmYmC1eG6/9ex4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Xb-00000009LoV-0RI6;
	Wed, 25 Nov 2026 09:43:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9XV-00000009Lo6-1B6I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:43:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 926A441FD2;
	Wed, 25 Nov 2026 09:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2D81F000C0;
	Wed, 25 Nov 2026 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599824;
	bh=uZZNoJoa75OyEypHvSPVxgZosKqnB322rXpj6FnAOr8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=abqq1O6BzrQH1InvD84cVjyVuJbeMXOmL4i0A072ZjT3LUN3eVc5cmQ3NLtd6kw5a
	 Nr21VNjmb5R5nvTKQo4tCCQdYkB5BsZBXWqrRfAEy+UCxpzmX/+GBV8RoBoF6HZ8od
	 KuN50Qg3orVjpxi1JLw6yWGb0czNk+eKrjKE29gH69aE2WicuVZF96M1zbiNX8wolL
	 YPgEe0UvoY4rgfT0W9AMfuHm4m/FPQWx5ik4LcEQOaVJCaOkJRTlWXkcdSzvbWGDgV
	 qIxn7Ickm3T3dSBmVB2BaTqOM2oo72bb5BZMvogj0lj36LBD3ze+Acvdu4+3un3AWC
	 p+OvtrWCXUNgQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/6] dt-bindings: opp: h6: Add A133 operating points
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rajan Yadav <rajanyadav0307@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Alexander Sverdlin <alex@sverdlin.org>, 
 Cody Eksal <masterr3c0rd@epochal.quest>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261118-a133-series-v2-1-8bcec9c9aadf@gmail.com>
References: <20261118-a133-series-v2-0-8bcec9c9aadf@gmail.com>
 <20261118-a133-series-v2-1-8bcec9c9aadf@gmail.com>
Date: Wed, 25 Nov 2026 10:43:40 +0100
Message-Id: <179559982029.14607.15822077755327463867.b4-reply@b4>
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

On 2026-11-18 04:52 -0600, Rajan Yadav wrote:
> The vendor BSP for the A100/A133 family (sun50iw10) selects the CPU
> speed grade from four efuse fields and the die revision: the speed bin
> (SID offset 0x1c, which also holds the ICPU current), the chip marking
> ID (0x00), a value programmed at production that the BSP calls PCPU
> (0x20) and a bin extension bit (0x28). It knows 11 grades, a0-a6 and
> b0-b3. The A100 operating points describe only three speed bins, taken
> from 0x1c.
> 
> Add allwinner,sun50i-a133-operating-points for this. In its tables the
> N of opp-microvolt-speedN is the vendor grade: 0-5 are a0-a5 (a6 has
> the same OPPs and voltages as a5) and 6-9 are b0-b3. The four cells are
> named, with the speed bin first. The meaning of the PCPU field is not
> documented; the name follows the vendor BSP.
> 
> Indices 0-2 are the vendor grades a0-a2, which have the voltages of the
> three A100 speed bins. So allwinner,sun50i-a100-operating-points is a
> valid fallback: software that knows only the A100 compatible reads the
> first cell, selects one of speed0-2 with the A100 rule and gets the
> OPPs and voltages of the A100 table today, with 1008 instead of
> 1080 MHz. That is the A100 selection, not the vendor's; the new
> compatible adds the vendor's. The binding requires indices 0-2 to stay
> usable this way.
> 
> The new compatible is SoC specific, like the root compatible
> allwinner,sun50i-a133; the A100 compatible stays as it is for existing
> DTBs. The schema now also limits the other compatibles to the single
> unnamed cell that all in-tree users have.

Why are you pasting here LLM explanations what the patch is doing?
Don't.

> 
> Claude Code (Anthropic) drafted this change and its message from the

Message? AI CANNOT write messages. It means you understood here nothing,
so we should not waste time on reviewing it.

> vendor BSP sources (field layout and numbers only, no code copied); I
> reviewed it and checked it with dt_binding_check and dtbs_check.

Drop, not suitable for commit msg

> 
> Tested-by: Alexander Sverdlin <alex@sverdlin.org>

Drop, did not happen here.

> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
> ---
>  .../opp/allwinner,sun50i-h6-operating-points.yaml  | 94 ++++++++++++++++++++--
>  1 file changed, 86 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> index 75ab552f6ec..5fa6a1074da 100644
> --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> @@ -16,24 +16,70 @@ description: |
>    Voltage Scaling Tables define the voltage and frequency values based
>    on the speedbin blown in the efuse combination.
>  
> +  With allwinner,sun50i-a133-operating-points, the speed bin index N of
> +  opp-microvolt-speedN and opp-supported-hw is the speed grade of the
> +  Allwinner BSP: 0-5 are a0-a5 (a6 uses the a5 values) and 6-9 are b0-b3.
> +  Indices 0-2 must be usable as the A100 speed bins 0-2, because software
> +  using the A100 fallback compatible selects only these.
> +
>  allOf:
>    - $ref: opp-v2-base.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun50i-a133-operating-points
> +    then:
> +      properties:
> +        nvmem-cells:
> +          minItems: 4
> +      required:
> +        - nvmem-cell-names
> +    else:
> +      properties:
> +        nvmem-cells:
> +          maxItems: 1
> +        nvmem-cell-names: false

Entire allof goes to the bottom, before additionalprops. Claude should
tell you that. Use proper model for Claude.

I finished here, since you just paste Claude stuff.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

