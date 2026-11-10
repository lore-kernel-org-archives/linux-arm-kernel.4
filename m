Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DnkY1C3M;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=f4iSLxER
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iydFZJoGqhyO/k/DLJ8mL411l6d6tNvyIk7ou9fRBkI=; b=DnkY1C3Mf5shFyZUv7khBK341b
	Gjqyd9YLDuUcXLPYKjRz/R+mKhYZFjZcV9JhgVaGL5Weqx8ALBZJRaIqH9KZMbptLfbQu+KztoS4+
	kS0frhNRkDqXZWmV0BlijOqneJPaKdkJAYa7yLSqzEo7TAhygHjUufXUscePCxJhvrUiJnXZjGeeC
	yNg+kLD8AmGyCPaYaiQST/FhiU04IJSCeKnfaPpnWbvXXMX3YfOgAtMg+ISHYNLTo2AuX7YDkye7K
	24sUuyK7f2S6yC7/WniZLmvYitZPmGQ4GiRnXlB345f/p6cp43kcWwCNp8fsWd+5areTKJUVJylnW
	ZDmEclpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlar-00000003ybp-396A;
	Tue, 10 Nov 2026 13:08:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlao-00000003yaQ-0PuD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iydFZJoGqhyO/k/DLJ8mL411l6d6tNvyIk7ou9fRBkI=; b=f4iSLxERH0pNwm+hI1lQTI1UQ9
	N/Uh8yEXcREuDUlIvJHBy+0fT4o40Wzo8LyNt8l9q2zzqkJFhf7gxBqS/bCKLIncCFyhYRi3akAUD
	UV9WrTxAqAfnFp5pKwZYZGwJ0PN2P7LNXb1T1op3Sm/iRaG9UDDQBb8yENLVp1KxX+xI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xQlaO-00FTqg-Go; Tue, 10 Nov 2026 14:08:28 +0100
Date: Tue, 10 Nov 2026 14:08:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Michal Simek <michal.simek@amd.com>,
	Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 3/5] dt-bindings: net: dp83867: make
 exclusivity explicit
Message-ID: <dd8bc868-06e1-4f9b-9e1d-70eb0bcd8f0d@lunn.ch>
References: <20261106-v7-2-topic-dp83867-v3-0-45e1d3adf1bf@pengutronix.de>
 <20261106-v7-2-topic-dp83867-v3-3-45e1d3adf1bf@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-v7-2-topic-dp83867-v3-3-45e1d3adf1bf@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_050854_139454_E2EF14BB 
X-CRM114-Status: GOOD (  21.54  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 08:47:27AM +0100, Steffen Trumtrar wrote:
> The io_impedance_ctrl nvmem cell and the properties
> ti,{min,max}-output-impedance are mutually exclusive, as noted in the
> ti,max-output-impedance description.
> 
> As this is only stated in the description and not made explicit in the
> schema, the binding checker will not catch if this condition is ignored.
> 
> Make it explicit in the schema that only one of them can be used. With
> that, drop the note, which also described a precedence for device trees
> that the schema now rejects.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/net/ti,dp83867.yaml | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> index 2cd8311ece5e..833540743bdf 100644
> --- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> @@ -7,9 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: TI DP83867 ethernet PHY
>  
> -allOf:
> -  - $ref: ethernet-phy.yaml#
> -
>  # only the PHY ID, not every PHY with the c22 fallback
>  select:
>    properties:
> @@ -67,11 +64,6 @@ properties:
>      description: |
>        MAC Interface Impedance control to set the programmable output impedance
>        to a maximum value (70 ohms).
> -      Note: Specifying an io_impedance_ctrl nvmem cell or one of the
> -        ti,min-output-impedance, ti,max-output-impedance properties
> -        are mutually exclusive. If more than one is present, an nvmem
> -        cell takes precedence over ti,max-output-impedance, which in
> -        turn takes precedence over ti,min-output-impedance.
>  
>    tx-fifo-depth:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -133,6 +125,15 @@ properties:
>        Transmitt FIFO depth- see dt-bindings/net/ti-dp83867.h for applicable
>        values.
>  
> +allOf:
> +  - $ref: ethernet-phy.yaml#
> +  - not:
> +      required: [nvmem-cells, "ti,min-output-impedance"]
> +  - not:
> +      required: [nvmem-cells, "ti,max-output-impedance"]
> +  - not:
> +      required: ["ti,min-output-impedance", "ti,max-output-impedance"]

This is not very readable or obvious. So i suggest keeping the text,
and moving it here.

    Andrew

