Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B09E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MhTaPXja;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ByP1oebK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9U0WlMShIYKKlzPKQhi2qdhsqtxGv+hAPAPG9hLfSaw=; b=MhTaPXjaK/j0ypiWP6xZ5FKca3
	6KOW9PnRBcO4R7R4YbvZ9hflMmXnU7M5Dqj+t6wS9Qt3QCxy4PtLFIqIpeWgjowMSi0uQfV/XfEgw
	pkcph8kilNTZ2spnJJkEY7XJgWh9ehFoiczRTTja29Ry0jolbDh//2lN0HnL4w6xeN9S5Yo6sfK4E
	griilGUUNwBAEf2SorKuKRfQ2GR0+DrSjQ2SdHrb4Q4xYK0G/b6hZE1WfyFfAGwlPalwdS6mJ/l0W
	pBqbuqyl8uz9SYrzG7F+ybrXt0hATMdMfr7SIYNf6TIfK6/cQpBqwcFG5VPywzTuU3qJv0flNhWTK
	YEwsaO7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvuQ-00000002NFX-1yd6;
	Mon, 16 Nov 2026 12:34:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvuP-00000002NEz-0fvv;
	Mon, 16 Nov 2026 12:34:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7461C60DC5;
	Mon, 16 Nov 2026 12:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DDC1F000C4;
	Mon, 16 Nov 2026 12:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832444;
	bh=9U0WlMShIYKKlzPKQhi2qdhsqtxGv+hAPAPG9hLfSaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ByP1oebKP4sWQdGyIjrHAhZZnFHfL+yKqoygPmUrSTYpZgJvdvduPy/BH5G3Ya3TG
	 ggqcbGP0mrgQicg5x2MdWKqfWiVJs0g3i95+Jf8/y6qBR7cQs/x2R3vSpaYneFf/JQ
	 bmsbswWQz73unP+B6OR4mbAH1EAS5YFQMZTW43tzKXllUYQ5UYKuCtoIoOGVP6zCQK
	 VITvKaK91xHDsyPQKoPWk7A9ymLP85sVaGvOj0ZbeiJAWmipyT2ILu9aVhVFw29KR1
	 8WWwS8IrOqqxKtQi2417WrEkpY2lVFZ0g/7pHCAirP8A/I3eofRdSuh7YmkiZQ1Y0v
	 bgsHmVeKDTQfg==
Date: Mon, 16 Nov 2026 13:33:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: Add Rockchip IEP2 deinterlacer
Message-ID: <20261116-resilient-eagle-of-brotherhood-6be3df@quoll>
References: <20261115-iep2-v2-0-3d8798cd9a55@gmail.com>
 <20261115-iep2-v2-1-3d8798cd9a55@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115-iep2-v2-1-3d8798cd9a55@gmail.com>
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

On Sun, Nov 15, 2026 at 08:47:42AM +0000, Arun Iyengar wrote:
> Add a binding for the IEP2 deinterlacer of the RK3568 and RK3588 SoCs.
> It is a different block from the IEP of RK3228/RK3288/RK3328/RK3399,
> hence "iep2". The RK3588 block falls back to the RK3568 compatible:
> the vendor kernel drives both with one compatible ("rockchip,iep-v2")
> and one driver.

Honestly, last sentence is redundant. Vendor kernels do all sorts of
odd things. Qualcomm vendor kernel has 100 properties per device nodes,
each defining single piece of hardware or driver. Shall we ever mention
it?  No, it's downstream choice, not relevant to here. If Rockchip
vendor kernel managed 100 devices with single compatible would that ever
mean anything to us? No.

> 
> Clock and reset names follow the RGA binding. The resets are optional:
> the block has its own soft reset.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  .../bindings/media/rockchip,rk3568-iep2.yaml       | 95 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 102 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
> new file mode 100644
> index 000000000000..0c7666de19f8
> --- /dev/null
 
...

> +      deinterlace@fdbb0000 {
> +        compatible = "rockchip,rk3588-iep2", "rockchip,rk3568-iep2";
> +        reg = <0x0 0xfdbb0000 0x0 0x500>;
> +        interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cru ACLK_IEP2P0>, <&cru HCLK_IEP2P0>,
> +                 <&cru CLK_IEP2P0_CORE>;
> +        clock-names = "aclk", "hclk", "sclk";
> +        resets = <&cru SRST_A_IEP2P0>, <&cru SRST_H_IEP2P0>,
> +                 <&cru SRST_IEP2P0_CORE>;
> +        reset-names = "axi", "ahb", "core";
> +        power-domains = <&power RK3588_PD_VDPU>;
> +        iommus = <&iep_mmu>;
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f4456f4589a1..b32b7eeb0a9e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24285,6 +24285,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
>  F:	sound/soc/rockchip/rockchip_i2s_tdm.*
>  
> +ROCKCHIP IEP2 DEINTERLACER DRIVER
> +M:	Arun Iyengar <aiyengar1990@gmail.com>
> +L:	linux-media@vger.kernel.org

You can drop the media, subsystem defines it. No need to grow more than
necessary.

> +L:	linux-rockchip@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


