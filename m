Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE32606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GZvM5ORh;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EyEMYem5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GGgxWdsm93oOtNMk87CKDJ/BAFYtLSNmS1bccCNzaVk=; b=GZvM5ORh4pSfR4ZtHpKy3jvQle
	mb2Sfemul4drIVHC1aU98mc++JF5SCPHKhGidW611sSGx1PgB+e24Nl4vbYYxrEpssmk6d/Cku+mK
	GWoA9Hnpsu6HbPdw+l7068ITH0ps1fYquSp0AM52/3q4NjGRq84x8FkDgjAFOQF9qdicy2s2AJBnW
	7RTRjzQ38OiVggHQcsbKDVZbEWvr2lFpiPCf70Nab2sJl2Mn1n3SJAYLpBFDJS6FnICLQ8j/HHFm5
	StHzyHm8APeR4DKsE6O1DZorqVaB875s+N2T/6OLtMU5OE/Zbw5CEkr0MfkpuvEOZrnH5xDJlPikd
	i0bIASKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoM0-0000000CKUe-1LIo;
	Fri, 13 Nov 2026 10:17:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoLz-0000000CKU9-07O3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:17:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8736C4668E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74291F000C7;
	Fri, 13 Nov 2026 10:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565074;
	bh=GGgxWdsm93oOtNMk87CKDJ/BAFYtLSNmS1bccCNzaVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EyEMYem5OQwfLEDudOU/czDVpOeZtcMY8XF+TmxL/ln6bhl5jo5U3MKMeYMOp1bZU
	 /CeTF5BnUKsXFfcmaMf0tEoGzkpNFwCs+ZN2IKVikeLpSRdIL8fkp9doIP1uGS0oKM
	 82BLxNcwHYVEmqVEwxDmJX+0LJZ4ecZI/dmlXUekSeTuzdmCEuiJ9ELRU8A32VLKCI
	 yjdc2FbX9ZBJucQE4T05/TORhbYTHpk3i1PndM67+i4VvFGTOpZPBuHjk/+z9uU1Jx
	 V3bqKNq5mlg1hjJ+9UjKr4yHDBQ3OlSUGGShKw6elvWbWrF4POM5VCPHE9nqputC0z
	 UwVogOc20F4uA==
Date: Fri, 13 Nov 2026 11:17:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: gpio: nomadik: Describe DB8500 and GPIO hogs
Message-ID: <20261113-antique-ninja-serpent-ac4f09@quoll>
References: <20261107-ux500-gpio-hogs-v1-1-123fb308fe90@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261107-ux500-gpio-hogs-v1-1-123fb308fe90@kernel.org>
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

On Sat, Nov 07, 2026 at 09:35:00AM +0100, Linus Walleij wrote:
>    "#interrupt-cells":
> @@ -60,6 +68,11 @@ properties:
>    resets:
>      maxItems: 1
>  
> +patternProperties:
> +  "-hog$":
> +    type: object
> +    $ref: /schemas/gpio/gpio-hog.yaml#

Instead for the name and schema:
https://elixir.bootlin.com/linux/v6.11-rc5/source/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml#L72

Best regards,
Krzysztof


