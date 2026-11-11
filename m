Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE921606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ShBQBwil;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=H6mAiZT7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G1EXoC3/dM52h/5QzlqeiUrYzrsPXmSPQc5+mcQk2xc=; b=ShBQBwilmG6DTm
	9q0DvfwhIR3DyVFlxOY7mjXAAkyZFt4S2rqryS4c6vbLxxlr93patF/IHptPHTWhrnFXI92legJhJ
	TPi6VgBoL/itYHRkIMzgsn+gMLRGG+BcLz2lmvJU+MCh9+9TH+e+qKRBfqF8cO8iIETvLy0L96zva
	TG9K4nlN9o1WRLBZZ+BVxFnX57eSe0BHqnEC67xcT1LPSppJOwp2WQQ1g4j9sa6CCAxO8MsBRuelM
	pXfzIrCgPNs9lABJ5By6wZMOtZJaRXC8CMvdjo5Yg2FQuyq6gO4+MCcGXTAZ4jqWAv00SQ0Of18ry
	gJxGfOtVDMyHO3lix4Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5dr-00000006M8l-0nO7;
	Wed, 11 Nov 2026 10:33:23 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5dl-00000006M6I-03YM;
	Wed, 11 Nov 2026 10:33:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794393192; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ln3+MFTmgrY81TE+bPWkWr5RPd/pjVPHi8lldolx9J1XltKclcA7jrhT609/qKAbVLDlKGrsXWCn0+qDo6+H5UHebzOyWZaIJA5loQq/bktxqCHasXAhQQIPJzuGd7V4Jy+b0wP1JQRSgulhlWgU5aaT9RA5SK9wXN1yDclWsTQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794393192; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G1EXoC3/dM52h/5QzlqeiUrYzrsPXmSPQc5+mcQk2xc=; 
	b=Munz0+RA3TA1qI+b+Yrp70TG4bnomruSFG7YEZzKHsRyRFOPF2AeqptssDlqVXd3xx/38NH5y/6+mOUyFIoD+nGR1+sBwsoGpHJfCz9N9Km8Cr2hsLN2N4jO5xTNVGq+NZjkt+ru9yl4xfqfMpoJk9a1qLMuaAI3QFhWoUN+36I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=H6mAiZT7/x5F6sAPwzjNIY7bBA3ULr8+Xsuxz6UEYd5DdGP3jgG70Vm/qlxF4PS+tB/MumWO8XVIW00P3ro/vpZjNlwb0+nM9jTJMWMi8j8LblISi/csKJkMKH9YlfUjB4Ca4Kfio1BoCWfwdMupwgohbDcepG1bMu+BbJ4+AOk=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=G1EXoC3/dM52h/5QzlqeiUrYzrsPXmSPQc5+mcQk2xc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794393191115893.3755015868243;
	Wed, 11 Nov 2026 02:33:11 -0800 (PST)
Message-ID: <d2d48b72-839a-4f6f-829e-e18f6fa819f6@collabora.com>
Date: Wed, 11 Nov 2026 11:33:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-2-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-2-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_023317_085693_C8275EF5 
X-CRM114-Status: GOOD (  19.87  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason,

Thanks for the patch.

On 11/10/26 09:18, Jason Yang wrote:
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

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml       | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> index c8ff5ba22a86..1ea21ab203ba 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> @@ -22,11 +22,23 @@ properties:
>    "#phy-cells":
>      const: 1
>      description: |
> -      Argument is mode to operate in. Supported modes are:
> -        - PHY_TYPE_DPHY
> -        - PHY_TYPE_CPHY
> +      Argument defines whether receiver or transmitter PHY is used.
> +        - PHY_DIRECTION_TX
> +        - PHY_DIRECTION_RX
> +
> +      PHY_TYPE_DPHY and PHY_TYPE_CPHY are deprecated. They select the
> +      transmitter and imply phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY>
> +      respectively. Use PHY_DIRECTION_TX and phy-type instead.
> +
>        See include/dt-bindings/phy/phy.h for constants.
>  
> +  phy-type:
> +    description: D-PHY (default) or C-PHY mode
> +    enum:
> +      - 10 # PHY_TYPE_DPHY
> +      - 11 # PHY_TYPE_CPHY
> +    default: 10
> +
>    clocks:
>      maxItems: 2
>  
> 


