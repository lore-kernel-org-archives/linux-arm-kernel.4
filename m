Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174CD606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WExiAqj3;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=j/zB6lL1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=; b=WExiAqj3/8uYAhe8KdfuTC7XUb
	FqNaDgPIGz9pAJTaFdvJIro6cskdWwofoII/on77+pWs9rye7JxQmw/KN/ueGm0DoILjFCDqBdR/w
	BsHCPirD8WJNqZYPqDuHK3WykDqJvWhFoo94kM47+HtcDlHMt2EX4AJ+SN4Ny2rkEBYll3yBwuN32
	RdbQjk1WUWunbVoudhEMJ9DwGtZyj8hJ7QrqZAITAYdqyeovGRD33CsaUqfl1ACPLw6oDrQvkIwuK
	B7P98fTi65ZD64Lh0Nred5UeqMWG2koLfFfCqV/EW5O6lRz2eZ7NMiy7rxaEAYYTLFwUuDV5DO5XY
	IfPSrAWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRs82-0000000D7Qc-1mYP;
	Fri, 13 Nov 2026 14:19:46 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRs7z-0000000D7Pf-0XDB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:19:44 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b596569640so2653926a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 06:19:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794579581; cv=none;
        d=google.com; s=arc-20260327;
        b=km9eqPOdq1pweMaqS9y/JNGLMdsy7isftmyFZzu8PzopZfRU0CTX9N15W/Sz+qMBgv
         nXBoTaQMVbMYOTa+1Sih4V5DqIpN6gEFE3Xo4vmLL1+m44Nt55Nj8d3LIgN7iTz7Fy0x
         pZ968HO1Ja34bwSUsQbH9BoTJHwdXdB/TNbJgiDW3lZPBRDbJO/iE0lvleN0poKnk0Yu
         hjx8urwNgPAFPrlobq1LOYq649s31JCmUAg6L+0rIK4aAU3kh663zgNMnf9KwvqM/fu0
         ywepBRYygVWyYjwvaTZi9y/bHQRSIPI7ibJWcd7LQ7CT07zlE0hJv6SgB3PInUP8f/oz
         FeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        fh=TCxmQYkwiD0KwP/Qrs7CvJbT1/bGJ9z8SnFIjtccsWc=;
        b=surewmA2eE74u2nsFXqvfvoSjXmqUZD3j6PoRSTspYyEP1PANNfCDmKke+UqjVnnBX
         NJPuAIIso0upbmityDvplePDv54wZBWehTIxq4PTJWey9jGqBt+Gx9zT5StEjqLbpeHd
         KWEx7jn4gPrR/qQ0pox7zOLo5LFWzI1gohImRtZCLLYA6I6Aht51UocKkaSqyAL5M9dX
         j7DkZzrIzwNEDoRaxLB9kHgho/AaySJWHri8p9FP+4Xl0V3ORGSkcaZb568weM5VO5Hk
         BJQZo+hLvl4zUjXlsBAXZoGyeY+glxyduc/SpkQ2p9kh/RZhq4xCSugBjpuCPJoL+5h5
         AU1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794579581; x=1795184381; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        b=j/zB6lL1G4K0MWo76q1RVCIwC84D0H0QTdhKcpuiv2NkH3KlDVkVcAG+EeXMdqjMaN
         pD54gkzEYAppNYXnwKFNncJ4+IZE2txUpSbzaxy4dkn/ugkzWKjCv0vUWC+h113CGWR2
         TlWAI100XYmoaL1mZSLZOSrLsr9nen0k8sDoDUZyjjhGv89V3BW/sZQJb/Fh0EYbZhNe
         jP2qdc5LNLScNLXBvFqKF8LDlhGUqiL/KztIZ2BrKMg4lMRYTIvHiewNijLBhN6gUYhJ
         loShaac235BOIC+D+uxiYc80bcHIgZUiOh68kOOkRqUwP51Usz2Qvnm8HbR+oeREkGNT
         K7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794579581; x=1795184381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        b=CNdyPOb9rwWLprnxNZaoxjt2dxgDpNJr2mQNVCx1BtR9kU/zLkLDD3vNWLvWwznHQT
         tOxOA3xpJYwzfun2kzejFuKGnmQqP1Vf9IPPq1Cjq/DsW0Q+EN1bhhdkbcQhHAdUTwsz
         vq0P4ehv/T0Cx1051bwWfaC9qksp5S3z7w6QmCO0fn6QdeK1hXau6daWxfvdWbpkvXJy
         +X1MyTdVEna9F1jEsXLdnOEcrzp7pLA/AgCZdcQQReDIxY4mmueY8BlluN1ZndU4/VYA
         TOf0QcCh+L3fJPqVMAan9Zhxz54Var/gBGqXmmP5Yku5nba5Pz/PeuDeWMnY1d8niFEB
         2hHQ==
X-Forwarded-Encrypted: i=1; AL+hErFwk41AWQVAv0ki+99ytSvKONOtEl0opgWEMJO9UjUOStkqeDg5A53TjMrHJSEc36uRUUrWHJgPetJ3fJkezIoy@lists.infradead.org
X-Gm-Message-State: APuU4Z/9B2BnMBXMSONFdpnpLHsFar3GH3/8+hNuNwn46fvWXr/UcIKT
	/HglIhqlxS53Toofwut7hrN9NZgpr4seRcbH6cm9Qy6n24CUem9cDrBTpdHDU8kewLxb1coLyHC
	Mwi2S+FUZuFAu29pPqHgiGuoubUlCE+ZTRPJH2vwOog==
X-Gm-Gg: AYBFou1Li3LzD3XwVuF71uOz3sDJr/DzVlA5uuzGE5J/sIeUZ4VBMV/BvlmCVekEP7/
	jn6a1YimOqgSsfXgZa/W9/luzpScZXDWutsqJ1sqZXCmU1CizIAtQIF6StGlPweds+Gjta8nDVL
	rztZSOwuP2+6hv897/BBXQKcgR47l1c0CyTLTItMFE06nfJsOXsKkmhGyvr1EPzV3JhiEo0pW25
	W9Bv8LkAHsVzicvA3VWv0Ol+CgJxu3N6WFpj535mThYwaLis3G1o5AqIiNC7RwGztwxP0h2JQqv
	dBA0E+HSmiTRP012YFUONWYE5gzsIm0IddnQsaqoGVli9mfmgWmHEkLFh1esqGe8Hc60iuATF7S
	9O4ApXTNQaLb8CTlwZ9aHx5t4c/L6Cqy8wz8/bRd7GeU4s0L3KdDg0Y8WTpUIgxKCXWi5+Q==
X-Received: by 2002:a05:6402:a6cb:20b0:6b7:aca7:2264 with SMTP id
 4fb4d7f45d1cf-6b7c0be4e2amr1723925a12.9.1794579581264; Fri, 13 Nov 2026
 06:19:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96@epcas5p3.samsung.com>
 <20261105121401.1661711-1-selvarasu.g@samsung.com> <20261105121401.1661711-3-selvarasu.g@samsung.com>
In-Reply-To: <20261105121401.1661711-3-selvarasu.g@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 14:19:29 +0000
X-Gm-Features: AclHuK9BtJmzcgRQKlrlAtXVpG8_cOgWPWRM5bnocNCGOV2wnBohhrKZoowVukc
Message-ID: <CADrjBPruky8SZYpX=MgsMjiKGUJhOhVu9j3Z+9JgJbizmcxSjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] usb: dwc3: Add Exynos8855 to the generic platform driver
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, Thinh.Nguyen@synopsys.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com, 
	dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com, 
	eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com, 
	thiagu.r@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_061943_189662_1ED90257 
X-CRM114-Status: GOOD (  14.83  )
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

On Thu, 5 Nov 2026 at 12:14, Selvarasu Ganesan <selvarasu.g@samsung.com> wrote:
>
> Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
> so the Exynos8855 DWC3 controller can probe through the generic DWC3
> platform glue.
>
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index ca69ac0eb07c..069b265c9808 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -236,6 +236,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
>         { .compatible = "spacemit,k3-dwc3", },
>         { .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>         { .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
> +       { .compatible = "samsung,exynos8855-dwc3", },
>         { .compatible = "starfive,jhb100-dwc3", },
>         { /* sentinel */ }
>  };
> --
> 2.17.1
>

