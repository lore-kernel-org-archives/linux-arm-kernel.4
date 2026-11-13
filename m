Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA50606A8B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V+U2r10C;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WSgozyBJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=; b=V+U2r10Cx16Lj6Fj/BvkZHomwE
	3qmFdVsqr7NBr2Ybvmk86sxUY1g02VE6X433TsU7BZBfo9l3ml0jNzP59q1UYVQkhUmqRjDBMjuHH
	brb+Pemb7mfOqsqsGxU/3p9P9v0pVefQn1cvB85UY//7ViK2QSr2DGyS2SvT4LWR3O6Y+/LR56MjG
	X9cx4dp7WenrE0Wmvn/U59c7/I3vp2X1PVnCUF7p3+em3RMOWgYbobpO7mdwRFszsc8xkf3q8QPiU
	ht8Eu2Qw7AF84xNlx+Qlv3xV25mE4pVe8O7jBgIuRjmvmkGBZo937HbR/heKX77hn3v3fDXn9AjNT
	njRyCHSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp4P-0000000CSKE-2oM6;
	Fri, 13 Nov 2026 11:03:49 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp4N-0000000CSJ4-1X4i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:03:48 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso1546823a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:03:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567825; cv=none;
        d=google.com; s=arc-20260327;
        b=PM3/ZFx2T8mJEOlftZG8XokKoW3I9rukbOasUo5W/2oZa4/GX957TIz9gH2rKWLjjE
         xvi+50BshhfOlwuhnnhPwD3lqBigaHkdG6kdv8r11CyZGMMNV0zcBxwpX74SCUi7G5qx
         Ei6HSlar/pdP3XOzfaStHksvVqiAkJfavHxwuwni/75PUpvvuhrhwkxT20jZ9Fi5vtdS
         z76E/gFCS5BNYsY1oCv86Ds8WmRpZ4dbCRj7ar68mlF/5z/71zPq1sVr8aJnv660UtTy
         1OjtGFvbEfYpfxLlbXuPX3X/A5SY50gdXLvFhFAgKsTrb6ZXgYQgscjgvW/YGcS4j6hO
         VUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        fh=q9KegA4AcHEsG3Yw5S+i/se1EyLiKK+x0UqvLH0Y750=;
        b=CjoGHJknxPaY8jQMIY6lwXYKDTYE5MWZlhghy7XSa4IKp/HQlRu+ye54Yv3nG/R+7M
         zGay8mhRA8tHggpy21I/msGFSG5tAZiMZ7pxalsW8/fgYO6GEkZ6t0Eege2G7VH6JXC9
         t4svAoPouq81PUtGnUntrSHyOZ2GrQL6xRPXRMNtnlbHym+i0GklPp/iW5L0tBCfyere
         oLSE6mVWrnneCBudsJUzQrjv9I02nSsrfLfFl5rV8qFtuzxC2SmR/Pw1jQiasur6CIdA
         3V9znumJHm5yps+UbAsDeHf2VKt7voETy8j4xckOaFg9xnZXvFKpkwfnLbAQ+GerwSoV
         c0EQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567825; x=1795172625; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        b=WSgozyBJHKBf3sqt90dkH+9Rcu9ons+hlJeGSlxpmILT/dUCPdvITWjkn2sd5GCEoe
         CikBD8mbaZ1nCl/mYK2Hlq+YqKRTnyK7607w8nrtma12VFlBhbvCwVpTI80RLdlioiWb
         +xM8gHtcCOnMbKShxnmDLWF5jGskO1JO3JrlGNc5TRH2J3USPbzLXjndHAcmfGzAdhFi
         IU1wKGCyoQBAWarZ42vlEjilbj7YM/045NOxFLcU4eWL6eL2itpTXby4MaYEnYqaYw5Q
         UiLdJNjSYx0pzCxd1cwEtvgUSN2tdiStEGDbU97CrnaJpuFBOjt8zbujAo1qTLXUEA32
         BXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567825; x=1795172625;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        b=glULUnaY92FK7+3eRcdl6Gs9nhymhTo2xV4oedF06dxL9YMxq4CRZBiDRC5p2Pnk7h
         9vbXyIMX5FpLbkqrVJ8Edk0unu/Yb+GbLBS4dpObwtmlb3S7f67nJ0jW3Y4CGrFXe3VD
         MyeIY65fhlrb6tX3QiSIg9rByNGRkXCr8p1TtEP13fnQulmcjfXlVsTWcXnp3O4nUAFP
         IMnXcjNeLsCnQEO4y07ytjTEnuUpwQjp/xCbVFni4XfsXB81/t1ZxolGXffA6ocE/0uv
         GdWi4bSLUKkj6THjC1xuYrcuV8JLbmGffgb/GccfIYnNyrukziTZlJeP7grVfaUufSqU
         jefw==
X-Forwarded-Encrypted: i=1; AL+hErFHPcJoy3yAUkY+XxEaw4O3AalmvM3+0LQkxvrgJJ7oICQcOGTmWVzhXs6RXVNmwWv8ndx9mhH4x7bd+Si9wdtn@lists.infradead.org
X-Gm-Message-State: APuU4Z+PrwtfzGPrTkpSrBPoUVxU+PK8ZI4/JRDV9DwFbuSSN4A83Vee
	WI2Y91e7f4FRM6ZHGkBVo+8g+xBLrlpF4VcgIa6j/id4SxXhsRGKTG/Ityyg8o+5unGhkJyLCqE
	7rha39LmCBwlqOW0A2XYllHJCGNtvQPnG1lg5ngkQUQ==
X-Gm-Gg: AYBFou1Fd+K3/puewjbiar9PPeUntm6ARW6d3oRciVecH5gGxKyoQJxVLsu6rNu7QQV
	OuBLMkhSUOaK1xdOybf5KuGsI0uS3+lD32pI02HMJfQhP/NBMy9yj4GBr0Si+J8TPkzUDn0czyQ
	Ohw9FrPQGC8Hrcas1XMNHJsXFAzijoYemoXPezWtjqSpqNT6sFOZWfVKoLjsPn4oYF7ouRDi1BA
	55R+Ypjtr6PkBG94cjkUmIPHTUnEB57E+t8pyJFTQOQN/AxKh8OgNRhzxT/KgtYKaOWNQXXnu33
	SusoA2g8qq75YxR80xQ1QUvm0nlvVvenrB4RJn29t0TsPxbObavgCrKoWkWJuheP0oNJFkWBgzk
	skJcPtaja5rlvuJrWD2SfiUnkpzdpDg8MTHMJwJhu7ZvKJkiV4Vdfz/dJ1hpGcF8kydbLCQ==
X-Received: by 2002:a05:6402:42cb:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6b7c088fadfmr1814259a12.3.1794567825002; Fri, 13 Nov 2026
 03:03:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104844epcas5p4c1cb0c31de8b5b445f7f0060f81cf753@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <927327686.61794567483016.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <927327686.61794567483016.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:03:32 +0000
X-Gm-Features: AclHuK-nQAzdHNmzELAlgOYeQ9PIbGnRzQK2xJ_UxA7DGsqbyIcTqa_Es6uaAxk
Message-ID: <CADrjBPpUSot+jCUBKb4S4A8C5HazvqQbB-+wDvjJtjB5XGCytw@mail.gmail.com>
Subject: Re: [PATCH v3 05/14 RESEND] dt-bindings: clock: exynos8855: add usb
 clock definitions
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030347_432800_AB53DDF3 
X-CRM114-Status: GOOD (  13.60  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 at 10:58, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add device tree clock binding definitions for CMU_USB
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> index 21928235d131..c68a64eb35c5 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> @@ -32,6 +32,7 @@ properties:
>        - samsung,exynos8855-cmu-peric
>        - samsung,exynos8855-cmu-peris
>        - samsung,exynos8855-cmu-top
> +      - samsung,exynos8855-cmu-usb
>
>    clocks:
>      minItems: 1
> @@ -143,6 +144,26 @@ allOf:
>        required:
>          - samsung,sysreg
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-usb
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_USB NOC clock (from CMU_TOP)
> +            - description: CMU_USB USB20DRD clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: usb20drd
> +
>  required:
>    - compatible
>    - "#clock-cells"
> diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
> index 67cd97d8fab8..f4261956ab4a 100644
> --- a/include/dt-bindings/clock/samsung,exynos8855.h
> +++ b/include/dt-bindings/clock/samsung,exynos8855.h
> @@ -222,4 +222,12 @@
>  #define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
>  #define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
>
> +/* CMU_USB */
> +#define CLK_MOUT_USB_NOC_USER              1
> +#define CLK_MOUT_USB_USB20DRD              2
> +#define CLK_MOUT_USB_USB20DRD_USER         3
> +#define CLK_DOUT_USB_NOC_DIV3              4
> +#define CLK_GOUT_CMU_USB                   5
> +#define CLK_GOUT_SYSREG_USB                6
> +
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
> --
> 2.34.1
>
>

