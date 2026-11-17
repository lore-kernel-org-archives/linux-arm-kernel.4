Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ADB606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kw1EDsmL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m+OoLnyK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nB6Yq8d6ULrFd8IzeuoWmxpqPH/+v/zha4BrdYeZUfE=; b=Kw1EDsmLyKT4zWpb1J5jFQlZZC
	CYPuGrL2QsMrQM+/9bhe3H5l9oYeW3nDc11EAr3FHgWhqml6MzJWWgM93mEsqtnNewX6jqZ35nro4
	i6eIOb6iY2kG006DJbdlGfTHAk4yBRmRF5leYpLMZdlQMHzLWYVPOs1fhnOwLs8s9hjK5Aw3nZOAQ
	jQdD71HAFo8rt77WkynlTbixstsjYxYoXb2lg76fki2sCTHUa5kVfjBsLmRFU0myeT1aZMr+0Rn7K
	F0zDTVf61/wXvQ0mrBM6cND2MoDBc1VQPVip7o3vZIF+SPeUK1z/3/SHEbDHWwI4gkg3AUdCgySgK
	aAI3wm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5W-00000006aum-30iU;
	Tue, 17 Nov 2026 17:35:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5N-00000006apm-3k7P;
	Tue, 17 Nov 2026 17:35:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A60860F8E;
	Tue, 17 Nov 2026 17:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DABF1F000CA;
	Tue, 17 Nov 2026 17:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936912;
	bh=nB6Yq8d6ULrFd8IzeuoWmxpqPH/+v/zha4BrdYeZUfE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=m+OoLnyKEqRzuR8W24SKYyqeH6WL7WtYTv9Yk+iWroEVoyZLBNbO3Y34RvRRI3Li6
	 /dqFOQJYNXfrnUueeuBIWz/Pq55xJASipZl83hyCmOTvWei+1Qp2rFUZsB73vFGKtm
	 35NfflWKQng5deftSY4vK2xDDXYheYikiiyUb5Q0Kcbktk7ZGkEdfKE9+8qnPoZ3qN
	 haR1l3Sym7RSui+tJMYRXzDxK5wtrwbpjr72i54Gv/hCOuiF69sGojba3BwyK8pw83
	 v2XOdBeqx0jm8zY6gQyw7yR8rBSPJgHHM4BG5gHI15d5XFldxiAdymXaSy7s7+hiPY
	 xYZp9hwEuww5Q==
Subject: Re: [PATCH 2/9] dt-bindings: ata: rockchip,dwc-ahci: Allow iommus
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
Date: Tue, 17 Nov 2026 17:35:10 +0000
Message-ID: <179493691098.3136.12498888747300831285@kernel.org>
In-Reply-To: <20261113-mmu600-php-v1-2-231196049a3b@gmail.com>
References: <20261113-mmu600-php-v1-2-231196049a3b@gmail.com>
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

- [Low] The patch adds `iommus: maxItems: 1` at the top level of
  `Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml` (lines…

--

dt-bindings: ata: rockchip,dwc-ahci: Allow iommus

This adds an iommus property, limited to one item, to the Rockchip DWC
AHCI binding. The commit message says the RK3588 SATA controllers sit
behind the PHP SMMU.

> diff --git a/Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml b/Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
> index b5ecaabfe2e25..e33e8b5591ee5 100644
> --- a/Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
> +++ b/Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
> @@ -34,6 +34,9 @@ properties:
>            - rockchip,rk3588-dwc-ahci
>        - const: snps,dwc-ahci
>  
> +  iommus:
> +    maxItems: 1
> +

[Severity: Low]
Should iommus be limited to rockchip,rk3588-dwc-ahci?

As added, the property is unconditional. That makes it valid for all
three compatibles in the select block: rockchip,rk3568-dwc-ahci,
rockchip,rk3576-dwc-ahci and rockchip,rk3588-dwc-ahci.

The commit message only gives a hardware reason for RK3588:

  The RK3588 SATA controllers are behind the PHP SMMU.

The in-tree SoC descriptions match that. mmu600_php: iommu@fcb00000
(arm,smmu-v3) exists only in rk3588-base.dtsi. In rk356x-base.dtsi and
rk3576.dtsi, the only IOMMUs are for media blocks (vdpu, vepu, vicap,
vop, vdec), and none of them sit in front of the SATA nodes.

The binding already has a separate allOf entry for the older SoCs:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - rockchip,rk3568-dwc-ahci
              - rockchip,rk3576-dwc-ahci
    then:
      properties:
        clocks:
          maxItems: 3

With this patch, dtbs_check would no longer flag an iommus property
added by mistake to an RK3568 or RK3576 SATA node.

One option is to add iommus: false to the rk3568/rk3576 then: branch.
Another is to allow iommus only in the rk3588 branch.

snps,dwc-ahci.yaml, which the commit message cites, does allow iommus
unconditionally. This binding is per-SoC, though, and already has
per-compatible constraints.

>    ports-implemented:
>      const: 1
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-mmu600-php-v1-0-231196049a3b%40gmail.com

