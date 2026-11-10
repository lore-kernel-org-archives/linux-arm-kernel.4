Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D2B60A2601
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xRqx/aPA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dRDbb0vQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v2xg6hOG8tJYsiUIo+rhQhOmRkcdSZdLofEQMTd+hPQ=; b=xRqx/aPAPvTVbvkib2DLp73gQT
	+HCkI4bWQcdFu/NfdD1+RdtZelB5kk8RAJuPBddW3vQ3qwcsMfLi2YTNmdV4BQWHWoDrjjg8bEgCw
	wYj0e9x7OVOrq4ZSgWlBTEGyP1aTiqAh1FQyEabWrXjHMSHveSyclbhnHCvTnauzsX9k/G/aTAVh6
	vyaxqLhUl0qopLfm3uDMhUukmqAI7rmP1rA3G7y1Ueoi/g9k9IMQ69XRpY4+RAy02OmGTuKBUOzR5
	WW1CiC438CF0GcgapxrbbOqFAIv7W81gUVzFnxvENJSdVh4RD/7Y/E0qa1ewn31nGVKLWiSnfOfYi
	MnIVVl+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj6a-00000003Sak-01b3;
	Tue, 10 Nov 2026 10:29:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj6Y-00000003Sad-2q3b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:29:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 194DD437A6;
	Tue, 10 Nov 2026 10:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F74D1F0089F;
	Tue, 10 Nov 2026 10:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794306570;
	bh=v2xg6hOG8tJYsiUIo+rhQhOmRkcdSZdLofEQMTd+hPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dRDbb0vQ8jSYjC/bRQf5405AJBZL/knalNcpL9AkFq7HXcvXtq4nkKhO35Gs4hbY5
	 3yos0alKhziqWixpucq823yVO0RzTwVZBZGU3jiaQLIiIoOy7j3Tjy2CXrsr4xSP9G
	 BX1h41irrZGGIYJH1TQl1ttMvIvpkS4OFMf0lVuscQMFR4Y2pQHZxmaEEnxJddMX+3
	 vxptwezsMREU31A22+c2g22+J00h3AfRub4F7RNuZICQ+k8vSC76EEjvJkRK9BMH8w
	 I2GjP3kDUPBTYTHzAK1HMqhBBL0M4RgIgZUh+F/iE81fapMH5EmohVwystsgplRTf3
	 ZaYQGiosXqrug==
Date: Tue, 10 Nov 2026 11:29:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Michal Simek <michal.simek@amd.com>, 
	Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 3/5] dt-bindings: net: dp83867: make
 exclusivity explicit
Message-ID: <20261110-ecstatic-affable-mackerel-db9cb7@quoll>
References: <20261106-v7-2-topic-dp83867-v3-0-45e1d3adf1bf@pengutronix.de>
 <20261106-v7-2-topic-dp83867-v3-3-45e1d3adf1bf@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106-v7-2-topic-dp83867-v3-3-45e1d3adf1bf@pengutronix.de>
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

On Fri, Nov 06, 2026 at 08:47:27AM +0100, Steffen Trumtrar wrote:
> The io_impedance_ctrl nvmem cell and the properties
> ti,{min,max}-output-impedance are mutually exclusive, as noted in the
> ti,max-output-impedance description.

But it also said it is allowed and one will be chosen over other, if
both present.

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

You just added it, so instead place it at the end in previous patch.

Best regards,
Krzysztof


