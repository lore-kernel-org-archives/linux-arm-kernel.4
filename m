Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3B5606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 23:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=idpW2YmJ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rzh4Lff2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8NxAE3+c3JxlQlCfVJwT21XRRYTfIctD+MgnFE8VU2k=; b=idpW2YmJJwArSW
	eSthKqi+0F0utrvJrK83accq/SdMPw5/wGv5Wi0VwywLA0dNDYPtu+SKUJAcwJLLlsSSrHUxl44GK
	0w3lwNMZIjHOYtt5iVCU92YKHdoBKjWsmZTvWH1Non+mz0sQ/KbsUyk2iZFd3De//HYnVKVzQYoMt
	ul9kZcltP7xjQIpRgmpVGD3L/aMon6Jx4/77SyNQe8dvx0UjfRO90OZ8UgdrYJu2Y0BRQFfthJ7dp
	lXesAXUkUXSUEioTlZnrlxahCre98jvbNzjj5KIvJE7FKhtX7usjl7JrU2F3m66BDKhN30npVVmeN
	TcJpJJU7Ml+jY47ZG/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUugw-00000000V2V-2sWU;
	Sat, 21 Nov 2026 23:40:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUugr-00000000V0s-2UoV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 23:40:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF2BE1575;
	Sat, 21 Nov 2026 15:40:13 -0800 (PST)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09EE23F632;
	Sat, 21 Nov 2026 15:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304416; bh=MS/cMo4fI6BQdz263DNnQ8KCQa+XHYfXkBL6vxm6U/k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rzh4Lff25WJs47n8mtXqRDU8MUwCkX3BneKVyx/HzUQEz56KWker44aSrTToyg95e
	 i5XNGOqvDFe2JR2ZrXbJXjf4bBdcOLc3mKIW/5sU5VnfqVVlaudUvalJVwBrQh9MS4
	 nFFvv1hpZsni26KMjgtVKuhU5EvCcsUGd5hMxMHw=
Date: Sun, 22 Nov 2026 00:40:08 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime
 Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome
 Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius
 Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin
 <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid
 <lukas.schmid@netcube.li>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie
 A7S
Message-ID: <20261122004008.0ee8e16d@ryzen.lan>
In-Reply-To: <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
 <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_154020_363812_1E84FF73 
X-CRM114-Status: GOOD (  13.48  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 13:09:17 -0500
Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

> Document the Radxa Cubie A7S board and Allwinner A733 SoC compatibles
> for the accompanying initial board device tree, so it can be identified
> and validated.
> 
> Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 7da84e2de748..d32689b7113d 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -857,6 +857,11 @@ properties:
>            - const: radxa,cubie-a5e
>            - const: allwinner,sun55i-a527
>  
> +      - description: Radxa Cubie A7S
> +        items:
> +          - const: radxa,cubie-a7s
> +          - const: allwinner,sun60i-a733
> +

Can you please add the A7A and name as well? I will send the .dts
patch shortly, but having the name ready would reduce the churn and
avoid conflicts.

Cheers,
Andre

>        - description: Remix Mini PC
>          items:
>            - const: jide,remix-mini-pc
> 


