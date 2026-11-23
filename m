Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC40606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QGdP07wL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PXULo1uE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g90/0bhbxPIHkU4mFDJWsNmnCkTgmCZxPuEg8GPDaE4=; b=QGdP07wLn07dOMJ5msibCpkFsa
	4KSkBpscvLFextEZaxIEDsTyaN5Rqd3zmGpacppR5kGuWSqHPG7ev2XJQRnOKa+cnHh6G/0+de5CB
	LCTMC97UKfsuCddkjMkcAjp5N0xXfTPoAhhYKbitxIfIFePjplm+FoJrP8mbJ9WTzjaLox56przpi
	GtOdISmLOCghZWzSjx0vm/e1udGO9C4Eu+vbd/Yf7MsB/Q0pc2FWGKXk2do/2D+rA9LcEHxBRfDuK
	VKBExRKtCgRAviiNZUo8oKxVnQVtEsnfDqK1X97wJgjw3VCSvFykab6HtP0UmxW6kyGeKxD8IYBol
	RFWara1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPRM-00000002ZYj-18fk;
	Mon, 23 Nov 2026 08:30:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPRH-00000002ZXy-31rq;
	Mon, 23 Nov 2026 08:30:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 675DA419E0;
	Mon, 23 Nov 2026 08:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841501F000CA;
	Mon, 23 Nov 2026 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795422615;
	bh=g90/0bhbxPIHkU4mFDJWsNmnCkTgmCZxPuEg8GPDaE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PXULo1uEs5gqu1IV55GH6XzrlAMnkg7aML82UaJ7P0OLCy2GmoAv5mYdxL9hUIV7u
	 jEnaL7Mzr0zmJzdlrh1FTVQpNNcU4E0e9whuo8ZLAWP27aVJY8zIIQxBhRVIW5qtV8
	 ITHTFckdHDzXFIroyGvBmKet6tLcxgecDClkheY54A8wnhpZm6X3t/G8TpbUd6M28h
	 FEdGAcxU0Q/gFfgk4219uGFxeYvN//XCAyraN1ZjPfgQ/ifzbksu4GKAmqWV6zm29M
	 xNB603K1JIdFM5wvMVEheM3ybmTvHLcB1sTMJHQ1a0xvq3I/76jYcSCd8ArO5DHA1I
	 SqCYOEVQW60QA==
Date: Mon, 23 Nov 2026 09:30:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Wu <david.wu@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, Shawn Lin <shawn.lin@rock-chips.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 3/9] dt-bindings: soc: rockchip: grf: Allow a clock for
 the RK3588 PHP GRF
Message-ID: <20261123-wealthy-luminous-skunk-cb5dbb@quoll>
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
 <20261113-mmu600-php-v1-3-231196049a3b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113-mmu600-php-v1-3-231196049a3b@gmail.com>
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

On Fri, Nov 13, 2026 at 04:38:49PM +0000, Arun Iyengar wrote:
> The RK3588 PHP GRF is clocked from pclk_php_root, which is gated when
> no PHP peripheral holds it. Allow the clock, so the syscon regmap
> enables it.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index e94c83d7c138..2525eb51f13b 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -321,8 +321,16 @@ allOf:
>          - clocks
>  
>      else:
> -      properties:
> -        clocks: false
> +      if:
> +        not:
> +          properties:
> +            compatible:
> +              contains:
> +                const: rockchip,rk3588-php-grf
> +

This is not understandable - two nested ifs, one even with negation.

If binding is too complex, it could be split.

Best regards,
Krzysztof


