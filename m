Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB8E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ADUv0m84;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8ZgRc0d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XY2rmJ8885nktXMitJAyrE5uwC457rZep4K4ylZxzgo=; b=ADUv0m84Taie/8w9MU+dAWBwaq
	4gW4EOwrgMGmDhXGh3A3fJVv+2RRg5erw6lIzPskTNDSQ5flzb8/bCD0pT5c4bC9dtHX4evXJqkfh
	wJSxY034fy1q2II7KyA5rulHzlk9l/AeDDUgZUVQLxzwquTlRo4D3CFaVhQplU2dcwMvb0CGTaxwh
	W6NfKwLbqcUo4L8/fX/Fh/dDkvIrXV99KACqluIEjkNVWlKm249t6ZcTV2EDlCiTP5j7hrp0DnogM
	E0MsLC7C3Czl+Qvn74g1zXxQj1JeJzE8NzhbsqxtsJtx3bNjoAN6tnk8dMbG2og8J4LrMc8uCWbEB
	7BjZomoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStiJ-00000001vP5-3LjH;
	Mon, 16 Nov 2026 10:13:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStiI-00000001vOX-2v8u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:13:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE88D60E23;
	Mon, 16 Nov 2026 10:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F561F000C4;
	Mon, 16 Nov 2026 10:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824005;
	bh=XY2rmJ8885nktXMitJAyrE5uwC457rZep4K4ylZxzgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V8ZgRc0dKkYGKJB28RMQ5keuZd5FDYeRsqoYI8P9/++ykBfxePEIlCurHc3/Q12Hx
	 qntbB8bxSFLpfDyTP3ZaiInUffBjwl6AFUc8kDQPhMvd/uaRucvEekW2imOwI9WAjS
	 WYdy1qhrjMBbjHGB9VBUQgo+4DGtboec1lYRGlsjsM+hSQlpdot1uTkezb4vRgaL7a
	 Lo/+Q+zI6rtpVtjn83pqQkOVFDxMequOJ1WfagioxAk8ye5398D75YA0ZR48C1Huuv
	 nSAXMz5qOe2uYuLFAY+RWPYDC7+I5WWb/jfmlxB8LifNOZGKopnbgiapFlcjUkWxuw
	 qk/f5mOHYUVOA==
Date: Mon, 16 Nov 2026 11:13:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Gary Yang <Gary.Yang@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v8 1/2] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Message-ID: <20261116-hypersonic-purring-shoebill-5bbfa9@quoll>
References: <20261112022141.4136099-1-hongliang.yang@cixtech.com>
 <20261112022141.4136099-2-hongliang.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112022141.4136099-2-hongliang.yang@cixtech.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 10:21:40AM +0800, Hongliang Yang wrote:
> +required:
> +  - compatible
> +  - reg
> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - cix,usb-syscon
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    $ref: cdns,usb3.yaml#

Please move patternProperties before "required:" block.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cix,sky1.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        usb@91c0314 {
> +            compatible = "cix,sky1-usbssp";
> +            reg = <0x00 0x91c0314 0x00 0x100>;
> +            ranges;
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +
> +            clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
> +                     <&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
> +                     <&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
> +                     <&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
> +            clock-names = "sof", "axi", "lpm", "apb";
> +            resets = <&src SKY1_USBC_SS2_PRST_N>,
> +                     <&src SKY1_USBC_SS2_RST_N>;
> +            reset-names = "apb", "core";
> +            cix,usb-syscon = <&src 0x424 8>;
> +
> +            usb@91d0000 {
> +                compatible = "cdns,usb3";
> +                reg = <0x00 0x91d0000 0x00 0x4000>,
> +                      <0x00 0x91d8000 0x00 0x8000>,
> +                      <0x00 0x91d4000 0x00 0x4000>;
> +                reg-names = "otg", "xhci", "dev";
> +                dr_mode = "otg";
> +
> +                interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-names = "host", "peripheral", "otg", "wakeup";
> +                maximum-speed = "super-speed-plus";
> +
> +                phys = <&usb3_phy4>, <&usb2_phy4>;
> +                phy-names = "cdns3,usb3-phy", "cdns3,usb2-phy";
> +            };
> +        };
> +
> +        usb2_phy4: usb-phy {
> +            compatible = "usb-nop-xceiv";
> +            #phy-cells = <0>;
> +        };

And drop usb-phy

With these two:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


