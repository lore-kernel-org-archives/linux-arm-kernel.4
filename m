Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F04606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i5Lt7jB4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=BsPCX8dr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I8O79LLuixI7Ncv80qos0WzCUNLLnHjxMOr/9odIaMc=; b=i5Lt7jB4Liquao+VFvr6XiAxW0
	TB+FsyJL4H3xNJu2Uk361VNfSnut5zDDg8+kDeUiBJ07PyzyrQW1igC53QwnGYfkWrTx2fplT/um4
	XfIPn5ZpFD3Jsb22DCVg8MUf7PwlLBEGqwX/tkjhTVbp0LFbUAWr4XToTyaOUb+tgXWN1H8fHH4bm
	Yf+4eP3aErI2PyHCTy9/SUnved8by2b7dfQgeqKK+fv6R1fmWQvR45REz4OT618tzWj2l8n/3BozN
	5im8pCwp3llOh9Ov14eOClaO+/x1l1eqZaziV8muNEtOI+d6kyevone+gaNjibAcm74naynaJWqZt
	7cy6jH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCF6-00000001WTg-1rYz;
	Sun, 22 Nov 2026 18:24:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCF3-00000001WSq-3Ouj;
	Sun, 22 Nov 2026 18:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=I8O79LLuixI7Ncv80qos0WzCUNLLnHjxMOr/9odIaMc=; b=BsPCX8drszWkyXNyHqAHkJDoyN
	6Z5KhKiCoIFTdy5cIoJRNHjbVJSqC9oMjYIAlfVpdYwfhjWGcmhpamxw35+z16Bq+xaF5I65ALA1N
	kq8G/V3/CzkaBkYCaW0PsYmWhIuTSOmHcVHPHyvbMjlb27hsmcQU+uqElL4N0GcRwNPk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVCEs-000bMR-9t; Sun, 22 Nov 2026 19:24:34 +0100
Date: Sun, 22 Nov 2026 19:24:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/8] ARM: dts: rockchip: Add support for RK3506
Message-ID: <cacdc706-3fef-491b-bb3a-96728347a17e@lunn.ch>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-3-jonas@kwiboo.se>
 <86007bdd-6c10-46ba-aac6-197939934c73@lunn.ch>
 <5cf52e28-110a-4fc2-acfb-eb264e8c31e2@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cf52e28-110a-4fc2-acfb-eb264e8c31e2@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_102445_852488_B9BC059C 
X-CRM114-Status: GOOD (  17.28  )
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

On Sun, Nov 22, 2026 at 05:01:08PM +0100, Jonas Karlman wrote:
> Hi Andrew,
> 
> On 11/22/2026 4:46 PM, Andrew Lunn wrote:
> >> diff --git a/arch/arm/boot/dts/rockchip/rk3506.dtsi b/arch/arm/boot/dts/rockchip/rk3506.dtsi
> > 
> >> +		gmac0: ethernet@ff4c8000 {
> >> +			compatible = "rockchip,rk3506-gmac", "snps,dwmac-4.20a";
> >> +			reg = <0xff4c8000 0x2000>;
> >> +			clocks = <&cru CLK_MAC0>, <&cru CLK_MAC0_PTP>,
> >> +				 <&cru PCLK_MAC0>, <&cru ACLK_MAC0>;
> >> +			clock-names = "stmmaceth", "ptp_ref",
> >> +				      "pclk_mac", "aclk_mac";
> >> +			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-names = "macirq", "eth_wake_irq";
> >> +			phy-mode = "rmii";
> > 
> > Sorry, missed this on the first pass of the patchset.
> > 
> > phy-mode is generally a board/PCB property, not a SoC property. It
> > would only be a SoC property when the SoC cannot do anything other
> > than RMII. But given this is snps,dwmac, i expect it can do other phy
> > modes.
> 
> This SoC only support RMII mode, so I put the phy-mode at SoC level.
> 
> Datasheet for this SoC lists following:
> 
>   RMII 10/100 Ethernet Controller
>   - Support two Ethernet Controllers
>   - Supports 10/100-Mbps data transfer rates with the RMII interfaces
>   - Supports both full-duplex and half-duplex operation
> 
> The Technical Reference Manual also only mention RMII:
> 
>   38.2 Block Diagram
>   ...
>   The MAC only supports the PHY interfaces of reduced MII (RMII).
>   ...
>   MAC Supports 10/100-Mbps data transfer rates with the RMII interfaces.

That is unusual, but O.K.

For the Ethernet node only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

