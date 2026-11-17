Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C4960A260D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xl4iI71k;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DB31nbrg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+KzEQNGHNyX+d3v3aVcwTAOvdhg7OdW27uOcL3lFZr8=; b=Xl4iI71kSLiv95C+GecoPwgGgY
	4aXfa33Kr3FeYelkTvPczLQhhpASfPI0z0yIP2WWdXdVO0Niv32PLgM7IXkweCYXYhMdGvWDIFma2
	3sq4OHR6CLUnURAC/GX+zCrz1Jn66XxpHCWhFGgZvu7MriSfxRZy3riNFJKdCIIVWwd7Gic0oa1cd
	mO4+MpOX0Ute4+1laoBkGz6/EtY/S/nfvrOjALsxrWpp1EQJRZInCgomoGxPkbPRgist9ebH/b152
	F756Xsl9i0V0OypihGFYEGaDFG+e9q8NvKUbyOGgSv2V6Q0ym5QKiq0za8uLcSJh62Btg14NvUFxe
	JQ1NRnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5N-00000006apl-2Gv8;
	Tue, 17 Nov 2026 17:35:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5L-00000006apX-3Rp9;
	Tue, 17 Nov 2026 17:35:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DB23605ED;
	Tue, 17 Nov 2026 17:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8297B1F000C4;
	Tue, 17 Nov 2026 17:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936910;
	bh=+KzEQNGHNyX+d3v3aVcwTAOvdhg7OdW27uOcL3lFZr8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DB31nbrgHw4cb5wk09Uoa3sTa0f48KHnVB0If14yyoePPs2K870d/2jEQ5MCJTxk7
	 0HbKP/tiPgmXoOHfj2InyasAd47uGI8E/6iSoGTJhOzM8dvbDWG7HZPRHc1peUVljb
	 bpK0ef6TRTVaBEeQgE1lXV+qAr6GbTkVpd+c0RE4ulHrao45SJHUPegpUWrKFnclEo
	 FQCp6PuFn/QNCouwAXCJuSg2lpyRKy7uDDr02088M4XQa+eLK4f+LEVvyBEA+6Nq0M
	 nYXgyZYAq/AsgoC+Rn+TdaHymUq0WvnTsk/kCX4Ps8PLhsT1M+7GNk3Jc4PC38jZgV
	 TkXzr9kfqXCiA==
Subject: Re: [PATCH 1/9] dt-bindings: net: rockchip-dwmac: Allow iommus
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, david.wu@rock-chips.com,
 dlemoal@kernel.org, cassel@kernel.org, fancer.lancer@gmail.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, praan@google.com,
 will@kernel.org, robin.murphy@arm.com, iommu@lists.linux.dev,
 shawn.lin@rock-chips.com, sebastian.reichel@collabora.com
Date: Tue, 17 Nov 2026 17:35:09 +0000
Message-ID: <179493690908.3136.827247860672592948@kernel.org>
In-Reply-To: <20261113-mmu600-php-v1-1-231196049a3b@gmail.com>
References: <20261113-mmu600-php-v1-1-231196049a3b@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch ("dt-bindings: net: rockchip-dwmac: Allow iommus")
  adds `iommus: maxItems: 1` to the top-level `properties:` map of…

--

dt-bindings: net: rockchip-dwmac: Allow iommus

This commit adds an iommus property, limited to one entry, to the
Rockchip DWMAC binding. The commit message says the RK3588 GMACs sit
behind the PHP SMMU.

> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index e8dda1961ab31..2a0cd56fb4fe9 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> @@ -87,6 +87,9 @@ properties:
>  
>    dma-coherent: true
>  
> +  iommus:
> +    maxItems: 1
> +

[Severity: Low]
The commit message only gives a reason for RK3588, but iommus is added to
the top-level properties without any compatible-based condition. Was it
intended to allow iommus on every Rockchip GMAC compatible (px30, rk3128,
rk3228, rk3288, rk3308, rk3328, rk3366, rk3368, rk3399, rk3506, rk3528,
rk3568, rk3576, rv1108, rv1126)?

In the in-tree DTS, the only SMMU a GMAC could reference appears to be
mmu600_php in rk3588-base.dtsi:

arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:
	mmu600_php: iommu@fcb00000 {

The same binding already restricts the PHP-specific rockchip,php-grf
property to the SoCs that have it:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - rockchip,rk3576-gmac
              - rockchip,rk3588-gmac
    then:
      required:
        - rockchip,php-grf
    else:
      properties:
        rockchip,php-grf: false

As written, a GMAC node for a non-RK3588 SoC that carries an iommus
phandle (for example, one copied from an RK3588 node) would pass
dtbs_check without a warning.

Could iommus be scoped in a similar conditional, with iommus: false for
the compatibles other than rockchip,rk3588-gmac? If allowing it on all
variants is intentional, could the commit message say so?

>    clock_in_out:
>      description:
>        For RGMII, it must be "input", means main clock(125MHz)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-mmu600-php-v1-0-231196049a3b%40gmail.com

