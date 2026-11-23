Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4536A606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qJVdUbl/;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=iIuRicmn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iU6rzMjlZZ/6evyHzJSTTcNTO9uaDTKmEVyBRrt0lq8=; b=qJVdUbl/LwcwZQ
	3uE8x5clnsUWyzOg5L6JR2rNljL5xb3M/tyNbh6BjbQhYGXBn3qYZyQ+MpM+dnwcGahXgjJw8mUI8
	ClHMsb1llCQy2ZV9AnaALCxws2jZmKj27k07ftFQr21T7Bxgaizd4mmlEq//10sZ6dq8Il7yKmIiP
	ZA1spmQ72eAHM0r6p4HVX+ytS0BFkWdFGVMobnTr++ZUvnbI4TC8P4ENw1pEU9o5Xk9j9LBgLcNp5
	CF2+eSjYZDp551HH/NtSHHNEPLJY33upZ8CJ2wtUTcaccUgnLJXeJ007ChlG96QRCkjts0Dp1aGDR
	TD+aVtk8ph1Nkx5bDPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYB0-00000004QMs-0n2v;
	Mon, 23 Nov 2026 17:50:02 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYAx-00000004QLS-2NX4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:50:01 +0000
DKIM2-Signature: i=1; m=1; t=1795456196;
 mf=PHdhaHJlbnN0QGdteC5uZXQ+;
 rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
 d=gmx.net;
 s=s31663417:rsa-sha256:ttyzeDed1dqOS70+AcP+9vCZpZrh
   5O7D2JWyPPj7l+bipy2Th6MGQ8Ys52WLtVfpU5LOULZttmRytH5hTJ/UwagmGOrh0BNnUiYOF+C
   7En6fIpXAdSur5aA+dbjVp22fR6f8YLHnE9xw4FIIVNQUXhnodxKx6pUf5O2Xz5q+pneQwpqM6U
   GfkGjEl0+y7MOtnCRUB58iCe6U53IoeXk+TjyBoaRfZFB8xjt1JAeAm+dm9TOBLDsdDEJTNCaCG
   Y6rUe7kfSZpyQFYgbcl/ZYc6b5CT+u5C7ZIH8xqdhIoywOOggO9LesnXMk8FFiChF5M2N4jUyBw
   Wl0lNf12MfIoSA==;
Message-Instance: m=1;
 h=sha256:
   9s8Nmb5wKMzYEe2e4p5jxeHgO+zRU1zOOqUHvDTYPyY=:
   aiIt4Haad1lnJ81rUFmYYTEhIeowiN0Y7tV3JSz9CqQ=,
  sha512:
   bWIMzwo9g/89N0eXjCCQhs1WZYVLVlv1qh1WmKRHrmqYID4q7zRzqTPpitCrdJy3TnFoQKDuQjizhSRAIj3Q/Q==:
   pd+MqFc9B4jDHYNrgcoRAl6e3fl0cIQqrMsSI4t2W+1SyPst/qgw2IWT07Une3qTE89m3F1wv8tfxHgYt1wW1A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1795456195; x=1796060995; i=wahrenst@gmx.net;
	bh=iU6rzMjlZZ/6evyHzJSTTcNTO9uaDTKmEVyBRrt0lq8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=iIuRicmnRmC0Rqqh20QTkoexEkIC99auUrnKIa/mqzLLwR8XicBBlFNLZaKTyArZ
	 E2asLGUiupf2YsCX3faoi/XnmS6V1SpBnAKONKesbCKO4QIa2YVqrfgOEcaYf5+7n
	 nXAv22zwF/jThE0+CaW76LlLw09Ue8xM/X4N/zSDX6vgAubSaQttelwy55orf0Kem
	 iTnltIByCIfASc4tvBndkXrhadjPoputr1Jjz6NWWB4R3vVL5gDT7Psr+zyha9LWf
	 DHlB6vWVpRsbTK/LRtOq6KNKylWP/5CqXvz3Yjhl4bx5pwUA2Vw18r5RCtf1ne2Av
	 4oJlp11OcDgWr0vUiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwwdl-1yTohk2SlP-00qvzx; Mon, 23
 Nov 2026 18:49:55 +0100
Message-ID: <e2d27b2e-db69-4fac-b7f3-28961a9e094c@gmx.net>
Date: Mon, 23 Nov 2026 18:49:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document
 dma-channel-mask and DREQ flags
To: Andrea della Porta <andrea.porta@suse.com>, Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-7-andrea.porta@suse.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20261123145728.29082-7-andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VDs/r8qhg8b+xtSRn9/h+E02zE62cEY4Zn/kO/Uu3cmI5l4Byk7
 vldh/P3QVG7RCafaaScOafkS1OG8MetosoWdQY3XmegAK3OPzc8+Wv1bx9FXAGHFlAeifgI
 88vaR+qpnVnXORT5U7egfSmuK93nsDpfhxG7PsrjnZwfo+wDBmp11itG5+smxKTk8sir0JJ
 0WNRXPWjh8tvGJN3ei+tQ==
UI-OutboundReport: notjunk:1;M01:P0:SANts62qHQI=;ePsWpiisXDwVjtlIlR5n+MSIcA5 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 E9PH7kAB0K4W6TUsxhnJ3mZLMijPIs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_094959_905014_3696A35E 
X-CRM114-Status: GOOD (  20.86  )
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrea,

Am 23.11.26 um 15:56 schrieb Andrea della Porta:
> The available channels are currently described by the vendor specific
> brcm,dma-channel-mask property, while the generic dma-channel-mask
> property from dma-common.yaml carries exactly the same information.
> Allow the generic property and mark the vendor one as deprecated,
> requiring at least one of them, so that device trees can provide both
> for compatibility with older kernels.
>
> The single specifier cell is also not limited to the DREQ number: the
> driver interprets some of the upper bits as per-channel flags (AXI
> priorities, wide accesses, burst and write-response handling). Document
> the meaning of those bits.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
this patch should before the bcm2835-dma patches which modify the=20
dma-cell behavior.
> ---
>   .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
>   1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml=
 b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> index c9b9a5490826..f619e395cf0d 100644
> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> @@ -37,15 +37,30 @@ properties:
>       maxItems: 16
>  =20
>     '#dma-cells':
> -    description: The single cell represents the DREQ number.
> +    description: |
> +      The single cell contains the DREQ number in bits 0-4, optionally
> +      combined with the following per-channel flags:
> +        bits 16-19: AXI priority
> +        bits 20-23: AXI panic priority
> +        bit 24: use wide (128-bit) source reads
> +        bit 25: use wide (128-bit) destination writes
> +        bit 27: do not wait for AXI write responses
> +        bit 28: wait for outstanding writes before signalling completio=
n
> +        bit 29: do not pause the channel when the debug signal is asser=
ted
> +        bit 30: use multi-beat bursts
No strong opinion, but mixing DREQ number with per-channel flags is ugly
>       const: 1
>  =20
> +  dma-channel-mask:
> +    maxItems: 1
> +
I think, the dma-channel-mask stuff should be a separate change.

Best regards
>     brcm,dma-channel-mask:
>       $ref: /schemas/types.yaml#/definitions/uint32
> +    deprecated: true
>       description:
>         Bitmask of available DMA channels in ascending order that are
>         not reserved by firmware and are available to the
>         kernel. i.e. first channel corresponds to LSB.
> +      Use the generic dma-channel-mask property instead.
>  =20
>   unevaluatedProperties: false
>  =20
> @@ -54,7 +69,12 @@ required:
>     - reg
>     - interrupts
>     - "#dma-cells"
> -  - brcm,dma-channel-mask
> +
> +anyOf:
> +  - required:
> +      - dma-channel-mask
> +  - required:
> +      - brcm,dma-channel-mask
>  =20
>   examples:
>     - |
> @@ -96,7 +116,7 @@ examples:
>                           "dma14",
>                           "dma-shared-all";
>           #dma-cells =3D <1>;
> -        brcm,dma-channel-mask =3D <0x7f35>;
> +        dma-channel-mask =3D <0x7f35>;
>       };
>  =20
>   ...


