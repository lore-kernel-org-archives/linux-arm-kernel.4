Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C962A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XS0cHC7D;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4Z48lEf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SBxkDNXNuYodrKJLEyjfUFDeq77Q5w3VUGlkFkAzqI8=; b=XS0cHC7D0QhpgI
	TwS3SYzGIARTs7u1N4ovCpn3SZn9Zp9Oj3bNzm35LXNeGe7Y3HxwhTK11zyCD/5TrmgUDrZSa6X+1
	byWmTi+Wry6/bhJ4FS7v/t7+IDPCZzS/n9Zc750c8n3duoR0ZlnnvRhNeD36p591Z0Zv0ZuxlSUiC
	10X97oOgvUVkHMN+Qh6kH1kiAvvAlAY5MLUms0Kx6Q4dX/EWRimZC2/TBvfgWOA4O7ufYYqWmttWN
	btxa7MJ13LmozvN/pIaojtZ+/MDWqV/NReBjIBCZ1lWYMOk9HmwZjIQ0ITYLSj6mtLLgqjkrHUoVY
	K2l4kidnIO54PW4AeTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAyJ-00000009YzD-3iAY;
	Wed, 25 Nov 2026 11:15:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAxK-00000009Ye4-0hRY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:14:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E33F625EC;
	Wed, 25 Nov 2026 11:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE321F000D2;
	Wed, 25 Nov 2026 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605268;
	bh=SBxkDNXNuYodrKJLEyjfUFDeq77Q5w3VUGlkFkAzqI8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=G4Z48lEf9cZhUGntAjKt720l8jpsIX6ms8JPyGAoGH23mV+PAb/r9oWKU3rOsKYjK
	 DXQeOgRJ525YNRqCxmQ/YbnaqgPsF6QA/SlxbuGj0s/mL6Rxja6NpmLE+UWw1vEIUd
	 R2l9Fl8ZaXbFASoClpO3spjNbz9VEojCj/bWCWRbpbhvYYYK1YYj7dyYHjf2yqsnkc
	 W96kylHnLqBZ33+g8775+NRM40fmAj8/GYr63W5MXt7vijwEJBIlgsD/lRX/PBTQcE
	 kWmbr8JtgSb8Hp5sZJiWt4HJ7AWf2exlA0jSwp3PwhVe5GIHtjdo9B7ZjjX/r3TIvs
	 yHjZXtJoAX21w==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add
 Exynos7885 support
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Virag <virag.david003@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20261123092244.1792040-3-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
 <20261123092244.1792040-3-virag.david003@gmail.com>
Date: Wed, 25 Nov 2026 12:14:23 +0100
Message-Id: <179560526391.84329.2026344704407829230.b4-review@b4>
X-Mailer: b4 0.17-dev
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

> Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
> existing Exynos glue layer. It is also compatible with the Exynos850
> variant. Document Exynos7885 compatible.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>

Just FYI, tested-by tag does not apply here.


> ---
> Changes in v2:
>  - Use samsung,exynos850-dwusb3 fallback compatible
> 
>  Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> index 8af0143c3e47..f62e3ed82257 100644
> --- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> @@ -24,6 +24,9 @@ properties:
>        - items:
>            - const: samsung,exynos8890-dwusb3
>            - const: samsung,exynos7-dwusb3
> +      - items:
> +          - const: samsung,exynos7885-dwusb3

Why isn't this enum with the other entry?

> +          - const: samsung,exynos850-dwusb3
>        - items:
>            - const: samsung,exynos990-dwusb3
>            - const: samsung,exynos850-dwusb3


Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

