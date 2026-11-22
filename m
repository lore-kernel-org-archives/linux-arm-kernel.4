Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5403A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LMhmdRB6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXHnsUQz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5KT/akQqJfPobK/Gnh5/Clx5Z1xrij4GwAcSxJvS7Gg=; b=LMhmdRB6ILekWEWu1uCIhYHtk/
	AQ/pqtza8MjNrwg3V3LAutx/L6j8z8Z0o8QQR4W8xQ/HpS6TTavrYdW88EAzCIg/xaxdEys3LZare
	ezJQirSEHOFb1siLHde9scI7XyDVvWH5L3Isq7e+S1f7vwXDJzvaqBcVXHYIxVypO6PcNqX5afXl5
	0RrauxOMFh/MfS+f3GtfZPRdZvZKajQOG2UKeAyCceOerup31OmJWCLnFj+J2b/bq7bo/WGFeiQJj
	uJQ/utd+FbciNYgqKZRrWrzugeDxNjQiDczCBxwcJSNYj2RHhUbw6ZsTeUeTHJ2RU6C5H/VDiVl/e
	mW+rMydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAu5-00000001Ogc-4048;
	Sun, 22 Nov 2026 16:59:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAu4-00000001OgW-3JkU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:59:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E71E61120;
	Sun, 22 Nov 2026 16:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC811F000CA;
	Sun, 22 Nov 2026 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795366739;
	bh=5KT/akQqJfPobK/Gnh5/Clx5Z1xrij4GwAcSxJvS7Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FXHnsUQz4t7cbWldltOLuYKWx2ib4DEnDlS0X1/37hYfx67vp4xhRzJ4D///TI44H
	 IoITN0O0k81L9PzfpD1mHulb/0ZdkWyAHIj0zb/UUSFmwiBvL/K7NZZr1KGk911T4T
	 +rcJsMkmweKZULlb4Tpu7u8clHRH1mUk29bZvQkat/3xJ671m6Br76/+Hl4XjugTli
	 4G1tsk3tVoSqtFwN/+5cxVaqf+qhz0ROZ532Rt0jtQSBRUyRxlvTML9rPEOBM+/AjD
	 x/hCivPUnUzK6IRZ1CChBXzeUdJojejhtY9W641lkeEMl7fFzA9XrZ7s8GevVL7Hfp
	 fK2l+w1y/3QMQ==
Date: Sun, 22 Nov 2026 17:58:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cunyuan Liu <cunyuan.liu@cixtech.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com, 
	liviu.dudau@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gary.yang@cixtech.com, fugang.duan@cixtech.com, daniel.almeida@collabora.com, 
	aliceryhl@google.com, p.zabel@pengutronix.de, daniel@fooishbar.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
	robin.wang@cixtech.com
Subject: Re: [PATCH v3 3/7] dt-bindings: gpu: arm,mali-valhall-csf: Add
 system-cache policies
Message-ID: <20261122-greedy-cuddly-hog-06c4ac@quoll>
References: <20261119123850.2994625-1-cunyuan.liu@cixtech.com>
 <20261119123850.2994625-4-cunyuan.liu@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119123850.2994625-4-cunyuan.liu@cixtech.com>
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

On Thu, Nov 19, 2026 at 08:38:46PM +0800, Cunyuan Liu wrote:
> Describe system-cache allocation policies for Mali GPUs with SYSC_ALLOC
> registers. The policy depends on how the GPU is integrated with the rest
> of the system and belongs in DT rather than a platform table in the driver.

Explain why.


> 
> Use entries containing a source ID and separate read and write policies.
> When the property is present, omitted sources use L2 allocation. Without
> the property, the driver leaves the register settings unchanged.
> 
> Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index 8eccd4338a2b..4d50427edd87 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -97,6 +97,30 @@ properties:
>  
>    dma-coherent: true
>  
> +  arm,sysc-alloc:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    minItems: 1
> +    maxItems: 32
> +    items:
> +      items:
> +        - description: GPU internal source ID
> +          minimum: 0
> +          maximum: 31
> +        - description: Read allocation policy
> +          enum: [0, 2, 3, 4, 5]
> +        - description: Write allocation policy
> +          enum: [0, 2, 3, 4, 5]
> +    description:
> +      System-cache allocation policies for GPU architecture 11.0.3 and later.
> +      Each entry contains a source ID, a read policy and a write policy.
> +      Source IDs must be unique. Reserved source IDs and access directions
> +      not supported by the GPU must use zero policies. Policy values are
> +      0 for L2 allocation, 2 for never allocate, 3 for always allocate,
> +      4 for partial allocation and 5 for L2 partial allocation. When present,
> +      all source policies start at zero and the listed entries override them.
> +      Omitted sources therefore use L2 allocation. If absent, the register
> +      defaults are preserved.

Looks like integration specific, so implied by the compatible.

Best regards,
Krzysztof


