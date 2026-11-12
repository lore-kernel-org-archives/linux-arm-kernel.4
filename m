Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352E460A262E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xSmyap/s;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhHNOE5H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p3/q9baVarjH5p8c4QmSR6WdUwezO7jqcS3keXwu9c4=; b=xSmyap/skKg4Z/AflrJioQNOgf
	ZPv+U1lUcZUfwbhi9p7V0w21kwkqBlZAfhyA1DSzCE21dTzPcwRuHtdIUMWZu5KTV3rHB+HWXqF5n
	A60/AdcggPxzmTXNtovpNBpzvxkTdvgOh+kZRlA0rod0bVtFlfcUTwStTM4sh1+90ofQRM+p0Uauv
	bUc8UvxM0532Mdyacu6VmhMIZaXwS2s5S7PjsUMxzlOldbLeONbty4MFtldU65N3SKEtOzTcwfiJ7
	+aAQJryyrg63Qd20vB5S7UchCNFu+ViGnoDCjuv0iVvBaRhygGezrjEIRYIwQcj/gukQY+CGCWck9
	8LPQXHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR23-00000009M8g-0jXG;
	Thu, 12 Nov 2026 09:23:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR21-00000009M7O-3gzp;
	Thu, 12 Nov 2026 09:23:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5273A63874;
	Thu, 12 Nov 2026 09:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073F11F00A05;
	Thu, 12 Nov 2026 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475425;
	bh=p3/q9baVarjH5p8c4QmSR6WdUwezO7jqcS3keXwu9c4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dhHNOE5HJlI8/HZF95GSqvbXlSXOQPBaAfqlsslRFWBOsuCJ1cc49EeQo6a0GhP+J
	 XzC4TmZF4fo5QqA4i5DfSg8io7p+GbY8BzJcT/aExqxZc4rUVpHe8zN/utOXn7zoJk
	 7Wj6/VXk42pstkDZfPZ7gLAeWWDUNiiYyTwkB8Af1AaxvnIzehd0crik/tglyPIkpl
	 gT26cZHHHdQRnpWYcZde/AZfiSPFw4GjBFJ1Rj2wGpwC9LfF9c10MlAUDlo9Ce/HQ3
	 VLlo7ZwLGvrRmxfSUbVvjSxZVJn2kn/JBsieOBFiX117GB986z9aJky/m7/OHe3Wqo
	 HyfwwuyESt7KA==
Date: Thu, 12 Nov 2026 10:23:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, cylee12@realtek.com, 
	afaerber@suse.com, jyanchou@realtek.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v16 1/9] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Message-ID: <20261112-screeching-marvellous-crocodile-f7bc0b@quoll>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-2-eleanor.lin@realtek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112052544.555563-2-eleanor.lin@realtek.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 01:25:36PM +0800, Yu-Chun Lin wrote:
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External 27 MHz oscillator
> +            - description: CRT SYS clock input
> +            - description: CRT SYSH clock input
> +            - description: CRT DDSA divide-by-four clock input
> +            - description: CRT miscellaneous gate clock input
> +
> +        clock-names:
> +          items:
> +            - const: osc27m
> +            - const: clk_sys
> +            - const: clk_sysh
> +            - const: clk_ddsa_div4
> +            - const: clk_en_misc

Put the list in the top level with minItems: 1, then here you only set
minItems: 5 or maxItems: 1.

> +
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External 27 MHz oscillator
> +
> +        clock-names:
> +          items:
> +            - const: osc27m

Best regards,
Krzysztof


