Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7280606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NfMkUaw/;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=afDIj2Rv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VpcqBZLqN/HeuRlLjFgGKqVL/4WFgrZfbDvk+IxriQ0=; b=NfMkUaw/nG5K6S
	0zrHpGXWrnyXD7NDcnXiS7Nq0FO9YVEvPV6eI55HxxhngyWii+yUuQpQlVtU8XIg9MjxqpdvUsjtI
	2sATnuMie/IEiUFd2IOdfb70qY9Xd4qp/EnMPvjnTH8ZcfZWcydPJfXEViZa7NDF09ml/VeLU1P9L
	NK0hlLVmCxlXvxE7XPSDc1GY06lluvSQdkuIN0vEhsL6J0mEk+0Jxc8tKWUoyTnIU6BSFBR3Zc/un
	3I7XXgkMEJWXQ97LgvUKN0RU6HjFVgmLX9JkW9eN8Sfc/lqRZZrvxCZ3euMmiNIAwexBshDNlY/td
	VW1BfLFrelJ+Zd8KkpTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxSb-0000000GgUj-2Fns;
	Fri, 27 Nov 2026 15:02:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxSU-0000000GgUF-2K3i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:02:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE051169E;
	Fri, 27 Nov 2026 07:01:50 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 379C23F86C;
	Fri, 27 Nov 2026 07:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795791713; bh=GBuVEdT6Zk0TtC4GdX7BeaJsy82EnhV3Za6uLt8WTuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=afDIj2Rv/AZ2ZhaedD+aQ7/sM6pMctKhmHlqaThdPXbkWWLZ4rcX8AcTCYZk6jJXG
	 HGrxsvcAwyS8kWygKXkQ3GHFJl9XcSI9+TEGxkyufaA5nodgFsxPh6y3xsf6KQ9SC9
	 yhvFJbx2UnmuEj5FjgywnCf1EwU86QSEsgs2Jwlc=
Message-ID: <49872d49-ddcb-4cd9-b4a5-ae6ab95e115f@arm.com>
Date: Fri, 27 Nov 2026 15:01:49 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/3] dt-bindings: pinctrl: sun55i-a523: one
 interrupt per implemented bank
To: Pablo Mazzini <pmazzini@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20261124215048.42074-1-pmazzini@gmail.com>
 <20261124215048.42074-3-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261124215048.42074-3-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_070154_689616_B7E1BD75 
X-CRM114-Status: GOOD (  18.34  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/24/26 22:50, Pablo Mazzini wrote:
> The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
> implemented, and the driver no longer counts it. Go back to one

                    ^^^^^^^^^^

Just for the records: some Linux driver implementation is not relevant 
for a binding. This (or rather the changed, but undocumented semantic on 
how to count the IRQs) is a breaking change, unfortunately (and it's me 
to blame), but I think it's the more sustainable solution than the 
existing one. And since this is a revert, it's somewhat confined, and we 
can backport the Linux changes to mitigate the problems. The A523 IRQs 
were broken from the beginning, and my original change just somewhat 
papered over the problem.

> interrupt, and one debounce period, per implemented bank: 10 for both.
> 
> This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
> increase IRQ banks number").
> 

I wonder if we should have a Fixes: tag here? Pointing to the revert? 
It's somewhat debatable if that makes sense for a binding patch, though.


The actual change is fine:

> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> index d7d0ba32ced4..c04b04acf6e4 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> @@ -36,7 +36,7 @@ properties:
>   
>     interrupts:
>       minItems: 2
> -    maxItems: 11
> +    maxItems: 10
>       description:
>         One interrupt per external interrupt bank supported on the
>         controller, sorted by bank number ascending order.
> @@ -63,7 +63,7 @@ properties:
>         bank found in the controller
>       $ref: /schemas/types.yaml#/definitions/uint32-array
>       minItems: 2
> -    maxItems: 11
> +    maxItems: 10
>   
>   patternProperties:
>     # It's pretty scary, but the basic idea is that:
> @@ -133,8 +133,8 @@ allOf:
>       then:
>         properties:
>           interrupts:
> -          minItems: 11
> -          maxItems: 11
> +          minItems: 10
> +          maxItems: 10
>   
>     - if:
>         properties:


