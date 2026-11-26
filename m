Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E37D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 23:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NjTH4WQz;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ouwWjCaY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WuZ27z0xovqUdABOavKvYadEvNB5Oq4EByhTvKg8Q7A=; b=NjTH4WQz3s1033
	cTrrpEmOEVTQKmIpDe8CFsU2qy3V7CmXXQH50BsAUv/FZlAWR2ZfKgJfud8BhCMMDbNZTtumNm87m
	aFTrXDcsdBUh8cHj13JX0+uq757/E7TKvdoi3sWAsFrFB84Zgcr3hqy/8WoLCCvURQmedBhyJBQmu
	uQjf2BnoH/EJVDuuKpRUIBNq3Dro/+caEeoOHX3aZgEh8WzuYUYWLk3KSt42q3YnQUOVXH8/Kk3mU
	AdT01ESvkKdz6ARWiPMBP45j19Yayw/T8HkhVjpIEQmAJ1lJJvSFf1m+yLSVZBgEHj1jLL7eA9r/a
	UNFaMn1BqApqwa42ZGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWihh-0000000Ef12-1MwW;
	Thu, 26 Nov 2026 23:16:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWihd-0000000Ef06-3Sg5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 23:16:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16FE01A2D;
	Thu, 26 Nov 2026 15:16:28 -0800 (PST)
Received: from [10.43.3.73] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDB783F632;
	Thu, 26 Nov 2026 15:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795734990; bh=CYKtMaEtkCcjimtyMBfEwa8SM8OpN01EJ3Gl7DRXMis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ouwWjCaYfGWDpbcqfFTeIwlm3DfC6T694qEKiNs8bdsaHqD4MbGy6MvdDm7UNCO3I
	 NU15zQok5gZ45ugb2Qv4Ii6FofEOxC9hdpbkUk3aPSp+YkgX+t2hhkp8h3r8giZyPf
	 l7OxqwwcfFo4ZI85tbV5ac0aIE0CYonlKtE7rQzg=
Message-ID: <b47222b9-4362-441a-a885-703aa8d3dd6a@arm.com>
Date: Thu, 26 Nov 2026 23:16:24 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: arm: sunxi: document Radxa Cubie A7A,
 A7S and A7Z
To: Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>,
 Norman Herms <dockseed@proton.me>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-1@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_151634_040241_9DB05ADA 
X-CRM114-Status: GOOD (  15.21  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/26/26 21:35, Enzo Adriano wrote:
> Document the Radxa Cubie A7A, A7S and A7Z with their Allwinner A733
> SoC compatible.
 > The initial device trees for all three boards are> ready to use these 
entries.

Not sure what this sentence is supposed to mean. Please look at other 
commit messages for that file to see what should be in here.

> Radxa's Linux 5.15 A7A DTS already uses the same compatible pair.

That's irrelevant, please drop.

> Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9

Please no links to dodgy vendor patches.

> Link: https://lore.kernel.org/r/20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com
> Co-developed-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>

The patch itself looks fine, thanks for putting them all together.
With the commit message fixed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> Changes since v5:
> - Fold in the A7Z compatible from Vinicius's binding patch.
> - Drop Alexander's Reviewed-by, which covered the A7S entry alone.
>    Krzysztof acked the A7S and A7Z entries separately. Leave the Acked-by
>    off the combined patch since it also includes the A7A entry.
> 
>   Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 7da84e2de748..7a7f96f21f57 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -857,6 +857,21 @@ properties:
>             - const: radxa,cubie-a5e
>             - const: allwinner,sun55i-a527
>   
> +      - description: Radxa Cubie A7A
> +        items:
> +          - const: radxa,cubie-a7a
> +          - const: allwinner,sun60i-a733
> +
> +      - description: Radxa Cubie A7S
> +        items:
> +          - const: radxa,cubie-a7s
> +          - const: allwinner,sun60i-a733
> +
> +      - description: Radxa Cubie A7Z
> +        items:
> +          - const: radxa,cubie-a7z
> +          - const: allwinner,sun60i-a733
> +
>         - description: Remix Mini PC
>           items:
>             - const: jide,remix-mini-pc


