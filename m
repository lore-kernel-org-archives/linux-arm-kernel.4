Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A20606A6FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 20:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jqhAxErS;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=n0gTJq9f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2kPsIjv/RvpekBzoe/Xg8vqw6hjpXdYepUw3c9M02WQ=; b=jqhAxErStqSZcq
	5uu2DHfETl8cbB52W8tcBhakThXr1OKlqbxvGUxTjtIVXiZbNEyND+OHGhrDBA6mWI4Nn2Llk4LVe
	1YadSXC7WC3pLOXiMRUBPV4gyf10dKhR6jP5FOaY3J5JzE2j+kZ53Z3167PJCwiAgP5h7fhM+n0T/
	sTAejfMG3txtSO7ibSrGWM9MwiSDk3UPmbA5rxf4MTcm35zOe4byL2/sA14FRUUxiIlUV6kFvIloU
	iYGW7GlZz3w0xQsDn6pksKLOZCS1a9UicG2ml5wW8jqg8KA2/xP3CUiBiHbk2JQNy8TQhq0ZMNtb7
	WbPpDCRBFypDaOT/rnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUV57-0000000GDkk-1OoU;
	Fri, 20 Nov 2026 20:19:37 +0000
Received: from out-193.mta1.migadu.com ([95.215.58.193] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUV51-0000000GDji-071v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 20:19:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zkzIxeEYCYyeYf0+e7mpu+EI1QXzBX9Ee3zgM17C3no=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795205968; v=1; x=1795810768;
 b=n0gTJq9f1yUnKtLkNxNxxzNeWh3ieqx3IDhS1X9ZA05l9QsNKqAMhHbQtcMZhC2T0yiWjPH0
 fmxCXhKC5W50jL9eCjBRTDBQP+LMHYoQdeOcGpfs6aO9TcjUtfow7gjpoIuHd5+vtvM2fsVdcpJ
 NJjiCtasvUaY1sZSQpzvlc+DKdyh9EoFIKEkVImLgSmgiJfGHNWKwF64MJRSXWdd9x2PEyzeWW0
 3PTJpf5ecg/Y6RmrctwuSEFTOpjwAzi00fLta0JcLlwPJjtG3ZT36U2M/0p8VR4nDPI2RabcuWs
 gzj9srGSU9bdXnrbloG3VshVN/1ZW+L1jaFnidlfSbmsw==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 36e14be50d0ddf71;
	Fri, 20 Nov 2026 20:19:28 +0000
X-Mizu-Trace-ID: 36e14be50d0ddf71
X-Migadu-Flow: FLOW_OUT
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 21:19:24 +0100
Message-Id: <DN0BEIZ5BE77.AML9IJ2SIR9G@cknow-tech.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Ezequiel Garcia"
 <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>, "Shawn Lin" <shawn.lin@rock-chips.com>,
 "Michael Riesch" <michael.riesch@collabora.com>, "David Heidelberg"
 <david@ixit.cz>, "Christian Hewitt" <christianshewitt@gmail.com>, "Marc
 Zyngier" <maz@kernel.org>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Cc: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>, "Diederik
 de Haas" <diederik@cknow-tech.com>, "Dang Huynh"
 <dang.huynh@mainlining.org>, "Piotr Oniszczuk" <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v5 1/5] media: dt-bindings: rockchip: Add RK3568 Video
 Decoder bindings
From: "Diederik de Haas" <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-31-g5c1c510d2b65
References: <cover.1795191822.git.daniel@makrotopia.org>
 <70b950c4b4fefbe07fe081f780ff359ed697d37f.1795191822.git.daniel@makrotopia.org>
In-Reply-To: <70b950c4b4fefbe07fe081f780ff359ed697d37f.1795191822.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_121931_228899_0C428B3B 
X-CRM114-Status: GOOD (  13.73  )
X-Spam-Score: -2.8 (--)
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

On Fri Nov 20, 2026 at 6:40 PM CET, Daniel Golle wrote:
> From: Christian Hewitt <christianshewitt@gmail.com>
>
> The video decoder in RK356X (vdpu346) is described in the same way as
> the one in RK3588 (vdpu381). A new compatible is added as the decoder
> capabilities are a subset of the vdpu381 capabilities.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com> # PineTab2, Quartz6=
4-A, NanoPi R5S
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v5: no changes
> v4: add Tested-by from Diederik de Haas

I don't think a Tested-by tag is appropriate for a DT binding patch?

>
> ---
>  Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b=
/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 4f38a0ef29d84..ea5386e84f17e 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - const: rockchip,rk3288-vdec
>        - const: rockchip,rk3399-vdec
> +      - const: rockchip,rk3568-vdec
>        - const: rockchip,rk3576-vdec
>        - const: rockchip,rk3588-vdec
>        - items:
> @@ -110,6 +111,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - rockchip,rk3568-vdec
>                - rockchip,rk3576-vdec
>                - rockchip,rk3588-vdec
>      then:



