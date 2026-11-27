Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD37606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hG7Mt6/I;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=cAj0ii6n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7pO5JbwHDSPKvg0uHKowrZmDSkanYpZpNWtrBN/cyzY=; b=hG7Mt6/IW6uAry
	YyuNcvcnHdpWOTRlfh/uX0UuVNbiBmtSC5SpsBCXeGViiCnB2tJEkHbmJg31z/owncWlaOgoX5hl9
	Nq9hMBUvov9J+V5uDtKuR3+TK7ftadOZAX9d3g9BsGIEN7bdQDJzBrSVxdYHlz73jVmgpYd81wrEf
	TFGhwli9CyYfZyz2qHYkFDKbjp8ndahQbHhpZwt69TBm1Ykhr6uH/z6v2nSuNLO3tBwcvHJ//APkH
	kV2BviiyxlgMBSmlg+DsqPHkN7/X9Vsb/Fkt6iLHAhmXDPYzrFmZP24vavNLAAQKBCcTpS5oQ+ztJ
	hjl3s/tPLDQeMQRQprAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu5Z-0000000FnFj-3GXV;
	Fri, 27 Nov 2026 11:26:01 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu5N-0000000FnC4-40ML
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:25:52 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 592A64C98D;
	Fri, 27 Nov 2026 22:25:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795778745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pO5JbwHDSPKvg0uHKowrZmDSkanYpZpNWtrBN/cyzY=;
	b=cAj0ii6nHEBU9SYpE4YrrcRDdw7CUbah0N6sbLMd/3Z0iLupU5UmicpNGgrnJdSBgDxr6O
	Hhoo5xAte0KXuQQqgvQ3MKqtYzO1LI+hXszKjZTBTV0jBfB7ir995LFso1YocGCUEkqVNd
	vhsn1MDdLv6iq48eY6UjHOfzacp2T3dFrTx+WOEwCN1+vQS2bH6gLgzajZmGf+ERBnYP2y
	VKJAP1buQi1Y+rdcIh6pQmEE5SZuiYgdSZvuXc/YjjIFFSBYTGfOQt/sUWKVHKPNcCtrmu
	/d57PIJTCud6/BPkzH/moKBbGc/eS0jvV7Om3vJc6FLG8q0ODYQYqRFe3f6Sqg==
From: Alastair D'Silva <alastair@d-silva.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH RESEND v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Fri, 27 Nov 2026 22:25:45 +1100
Message-ID: <20261127112545.2584201-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-3-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com> <20261124215048.42074-3-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_032550_395247_4087F6B2 
X-CRM114-Status: GOOD (  14.09  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 21:50:47 +0000, Pablo Mazzini <pmazzini@gmail.com> wrote:
> The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
> implemented, and the driver no longer counts it. Go back to one
> interrupt, and one debounce period, per implemented bank: 10 for both.
>
> This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
> increase IRQ banks number").
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> index d7d0ba32ced4..c04b04acf6e4 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> @@ -36,7 +36,7 @@ properties:
>  
>    interrupts:
>      minItems: 2
> -    maxItems: 11
> +    maxItems: 10
>      description:
>        One interrupt per external interrupt bank supported on the
>        controller, sorted by bank number ascending order.
> @@ -63,7 +63,7 @@ properties:
>        bank found in the controller
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      minItems: 2
> -    maxItems: 11
> +    maxItems: 10
>  
>  patternProperties:
>    # It's pretty scary, but the basic idea is that:
> @@ -133,8 +133,8 @@ allOf:
>      then:
>        properties:
>          interrupts:
> -          minItems: 11
> -          maxItems: 11
> +          minItems: 10
> +          maxItems: 10
>  
>    - if:
>        properties:
> -- 
> 2.52.1
>

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>

