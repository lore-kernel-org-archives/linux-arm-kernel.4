Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A52606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XUjILNLy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R4Mm4EH5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fQpynz/U/r8Ihf0QA0gj96/iqALNmMISQ/47HnazT0s=; b=XUjILNLykFbvh2vyfTk7u69SLQ
	0ekB9f2zC0sGDjPHrp3LuAOQ6Rc2+E5slxpCo9VWig/MgpMa/l+Anmny2SD7qz7aWMPFYBGUNlPoa
	z1YinRKYH7gFd8Hd3nZAn2IoahcgY1E3pP9sBobftiTAdmDikKwXCDimb7yZVkyH5KUFJFqASzlA6
	pXE/bhAW9F5JGxmBrfJCEr89UDiXwBAm+zdtmcy3uwFSVwBR0SqckvuxfMied4To4QFSrONY7CREV
	hWyejMPv985Rw7nRPluCDCsLP4r9z+5M6LyrqVfnHSPH06gddeVA4MRW4M1l50wF8G2VtjTxkd1zl
	aj7IyoFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4JM-000000067yW-2ceX;
	Wed, 11 Nov 2026 09:08:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4JL-000000067yM-1VAj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:08:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 01CD343B81;
	Wed, 11 Nov 2026 09:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B581F00A05;
	Wed, 11 Nov 2026 09:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794388086;
	bh=fQpynz/U/r8Ihf0QA0gj96/iqALNmMISQ/47HnazT0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R4Mm4EH5tpBex6GKVUdMpA85tYm1jIVj+193GxnPLC540MbymgL/mRceafbmGbGTk
	 zQo611f6N9cZ19+rcXFgQyOrDTykpDCmMpL7a4oeFj1beqOfmd1vDRZsugnTNntMgU
	 Qos7Jf9/sw1cCiEhNdJgDnhMeqMkW42ojBaMvnqAgaAdNqsA4zDKg/lMFRQKeSQuaB
	 ikWFL/jrqPO6uPYcR+UYXYk0RQw8eDKtVE2wr4oqVltF07gQrmq9E91Oykgh99AToW
	 aGZbbNWVradI7nqyeEZZofi0QOUYHvBUXD9mJc2RpngdFPthyISSaCr6bAePR9kjTk
	 GisNLwuoAYqxg==
Date: Wed, 11 Nov 2026 10:08:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, devicetree@vger.kernel.org, Frank.Li@kernel.org, 
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS
 DMA IRQ controller
Message-ID: <20261111-victorious-persimmon-chimera-de9e4e@quoll>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
 <20261106013520.1134450-2-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106013520.1134450-2-Jelly.Jia@cixtech.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 09:35:16AM +0800, Jelly Jia wrote:
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Combined DMA-350 channel interrupt after the CRU gates.
> +
>    clocks:
>      items:
>        - description: I2S parent clock for sampling rates multiple of 8kHz.
> @@ -75,18 +93,33 @@ required:
>    - power-domains
>    - resets
>  
> +allOf:
> +  - if:
> +      required:
> +        - interrupt-controller
> +    then:
> +      required:
> +        - '#interrupt-cells'

This one you can drop

> +        - interrupts

And everything could be simplified with:

dependentRequired:
  interrupt-controller: [ interrupts ]

> +
>  additionalProperties: false

Best regards,
Krzysztof


