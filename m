Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D092606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Voh+DRou;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmwvKXdM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y6fbqcobCahuBm1XBPjTDEf+ag8w3TcHGc1/4po/nHM=; b=Voh+DRouIktkmbuVU5FNi9WLk5
	WCsmZulSbswhQUlluaN4vsTZnUuqqqhN24NDQO1oZk+kQcCNRmf+VZe4pVUIilGdq+Ykq2hZJuHzg
	+vICzUjSx+P8E/A13CGY+XxqjWY3doK8eou8XH5uK1k6/XM35gMedR+0tEVSO9gPZPgpnBSYCWs7Y
	kj3GKHh33eMt1mRNzxuUKDjq0ClupdJQo3e3dOGlVWlO+ra01CZfu84vyB7nGwTwTbetN/XFb0U+J
	g+WBg3sUArh912Hdt0KYUa0btFLeauYpw1xEyS5899UWep+Iihx7rUvI7FxqeSrNciJ5cfD0XgqSd
	s7arGBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqAc-00000004kc9-45Ba;
	Tue, 10 Nov 2026 18:02:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqAb-00000004kbx-3TCD;
	Tue, 10 Nov 2026 18:02:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 40D73405FE;
	Tue, 10 Nov 2026 18:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84F41F008BD;
	Tue, 10 Nov 2026 18:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333729;
	bh=y6fbqcobCahuBm1XBPjTDEf+ag8w3TcHGc1/4po/nHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JmwvKXdMQq2NZIpNHAlm7z7TzpeSQ5L2ONEUAW9u641hXSuo0FN1b3QEqSW0N0Ud2
	 Z1JFdfZ2ynyqLUSM0BsThP0LpHl3q9jrnUHWPGLN8N31rCaeJy3g+/BaN1TGnIMHVT
	 WWX/IAs3fFqBac3F5kIGGrdlwz3yO05wr0WJHNWjTbfXB06/wkNCWrag5WJ30ufIUE
	 L68y4NKtYnp0p2LgjchURDzV5PZ28mCQkz655wPbIb8xoGGPVqN2b2RybGAwc8eIaW
	 QUKqJeiD+/WyN8r8WGaq9jApWSW3nPDiUv+yqYJxe5/rhcNji15ZwCC/tAontg/Ba2
	 /QuovHZVxxxsQ==
Date: Tue, 10 Nov 2026 12:02:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Guochun Huang <hero.huang@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v6 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
Message-ID: <179433372468.928467.11546944638798684027.robh@kernel.org>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-2-d681ba20b36a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-dcphy-rx-v1-v6-2-d681ba20b36a@gmail.com>
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


On Tue, 10 Nov 2026 16:18:05 +0800, Jason Yang wrote:
> The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
> for DSI and a receiver for CSI-2, and the DSI host and the CSI-2 host
> can use the transmitter and the receiver at the same time. The single
> cell of this binding selects the mode and refers to the transmitter, so
> the receiver cannot be described.
> 
> Change the cell to select the transmitter or the receiver. The
> transmitter and the receiver cannot operate in different modes [1], so
> the optional phy-type property of the PHY node sets the mode for the
> whole block, D-PHY by default:
> 
> 	/* the MIPI DSI host, driving the transmitter */
> 	phys = <&mipidcphy0 PHY_DIRECTION_TX>;
> 
> 	/* the MIPI CSI-2 host, driving the receiver */
> 	phys = <&mipidcphy0 PHY_DIRECTION_RX>;
> 
> For C-PHY the consumers stay the same and the PHY node gets:
> 
> 	phy-type = <PHY_TYPE_CPHY>;
> 
> Existing DTs on a newer kernel: PHY_TYPE_DPHY and PHY_TYPE_CPHY remain
> valid as deprecated values. They select the transmitter and imply
> phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY> respectively, so nothing
> changes for them.
> 
> New DTs on an older kernel: an ABI break. The older kernel ignores
> phy-type and takes any cell value as the mode of the block. A DSI node
> with PHY_DIRECTION_TX therefore gets no display, and a CSI-2 node with
> PHY_DIRECTION_RX gets no camera.
> 
> [1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
>     operate in the same PHY mode."
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Link: https://lore.kernel.org/r/94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>  .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml       | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


