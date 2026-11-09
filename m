Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4597E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 05:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wJCgZyLw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HoqLc8Y9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=soBIZqxQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=; b=wJCgZyLwvozPdD
	LC2Or87Ytt/OsxAO6GFI2vZ2dCq4WvJUnbfxoBnGuUs/LGu3lgV0GLkXFnjtzV+OmGK00GGI4dkXD
	d+S9jNVQ36q0iCExynEOUvSxCEspV7vf5mXvC+H8EJdXKI3LA1aS/r3+dx5f9KiiwR4L2DyxkfkDe
	Ej7peGaJ3qjzxV9RodZ+gsHHmuFGNcpt8iuPu71mM7K4rppjOS4ruQw3kPu6B1MVGyPS6mFJsdilE
	9SM8yxr4f+c8fOX4PnAyoJItvmIHa3xv0BpvLV44Ttt0hmnWGn+PbiKhZ4aVVbprBHuYcxZVwFHbX
	EfmgYWzWurfoRkgQhggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQI0V-0000000HQQu-3OUE;
	Mon, 09 Nov 2026 05:33:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQI0S-0000000HQPS-0PKi
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 05:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=; b=HoqLc8Y9+2BFo7u+zoga2Lgtpa
	DMzqk4A+0/rmNRHW1HdN9hfZELjPp6anjMT3rhdwmwLpnUHLOgeN72QHpjmCRa0m5HLupnbrEWbal
	RPFGNSxJtQy9LuEuBsS++QufRg3TduektxDwuselc0o43pooBtY27pdSLuesQWgvBTyXpv04F+140
	8GURQlS6vYTyjyE9hvdzsKmYSAvSD+AHREYfUTxqPa74pUdlzOZNoahmXuzRgyeR5XwukVH3+0475
	Azjnw0Tk0m4y20b+REJIU5EQtsWNHfYUhh1EBgV2m89TVE1YlMg3cZruaPGxGpVjmBEb9AlkLrAAl
	up2Ccavg==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQI0N-00000006KYY-0kss
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 05:33:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c4697404c2bso59569166b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 21:33:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794202396; cv=none;
        d=google.com; s=arc-20260327;
        b=J0T5IWIOe5ZSOfkZLtgMKt06MPnXdqseKjhtSOfPJeVYYFiMaukIlr/8pa90DwR69B
         vgK0gcg3C12H0NOvFKqk8yDbtFzaP0ByNWjigZO0inDJTROlvdls9ERiAViGf2oqTego
         qGFqhgSut32+Yxv1D/Ws7EgLUILgfrmY91MlOO1JkhXmM9/zf0KMi83/V4OTVKtJwvCE
         APqV9yYDhccJj55HldP0h8jwHMfotZ/ncjCWa/rSVOk3v3TY6rdxxtcAzRA796kf50wk
         guJTJlotp/kC4wwxsBaV8jIOIpF1iS/7Wqq7q5QkfedyCT4ycF1ikrYDTimbgXlsFQ76
         Sudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=;
        fh=F61GCSCDzJDRZ3IaN2SF+ndNzUd41gF0eaKIeZ8iaI0=;
        b=cYXuULNydBomFoAU76KKlRBJX9LXbO7k5+Nna8PSk1jnuq0g1gRpBP1YKuZmI9KlVd
         zmEbfSvzzU/OyEwgbCa9EwvTAmS9Fj9MRWkEMpu7MDb3W/yF3/AARxGK7A2n8neOyfuo
         ggjQazaQKAqt98Cf6wo4hP1gTR8hQ45yFXyEzGYSfRBc3eCSZk7DPwhBZbrrEnuzx//y
         pyaxpSQNtxmZgW986MZMif7HBUTZxS1P/ZtX7Uq9IMi0stwXwnBmx+QF8u76TQSFwZWk
         KjCrMqLZ1oPZiKoInUCD3/Zztm0w5sY5aTvCFVj+tBxs5iatrye12jrYONxT6CdPwa3j
         aYbA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202396; x=1794807196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=;
        b=soBIZqxQK9URR0BG4wO49DqN/kzAM2zkSgEWF3cUKgZOjwKlRFUWBbOuaNr3/aUHiH
         ZQrmoKrnQUlx+ZWh/q1ZMxDwNTDY9Ipg6+Qy0NBw1sDGAk5eY2ftNDmeQYGH75vX6t9/
         Xl1PVH9tsl34t/8xQiAvTqSlEZ8kkr7VifCvFkoF0dlcoLIu+rHy9tj6xIoJYh3biNB9
         UBVEgErN5Ck8egsxJt36xbwY+lsQsJ7zGj53NJEw/+eaw/vg3shuIXpRUDoNc+oVOLCH
         F13Bj2LKPG8rL2oTVoTu1M4E20cwefP1xg3KcVshH3Y3nOwHksBhbXCSiHwLtM9eIUkX
         ZyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202396; x=1794807196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=;
        b=WnTEe7wuHejvKYm1gdxs+g7fuPTW/4ZutsoXLwIu8AjO/u4j22Of8bCpCGnNKJBZK8
         4UzVASYMdsQkf9ipqMF31I1pnGYuQnxe9h7XMMLicXphPUOA5r980lV+x0gZpLo6pm7s
         HbcvIRxql6SM+iHwcetEUICtUdU3BPVWjFizW4mIMdQOyWAAsyjmaAAup8GeEQnmcyR2
         ySgALgXA/fURuOiPeIR65snbCdvWv5LwtJdgnlwUeb5/YHtaDRI8nffOt+kZj7CgkM2H
         eCnznj+kOz1X1x1+2YqEzBBX6F/RUAUzayzvgYo6X19Di7rvJQsBZQqwrXeZLy5uyyJn
         E1Eg==
X-Forwarded-Encrypted: i=1; AL+hErGzwQpznZu8X0jTF4D9qqJxiMWoqeECrHpcR+hNWkcI9oiZXedi6RjTDrojBQAT990B1bLxVzDTcgMCXZ8IMSRl@lists.infradead.org
X-Gm-Message-State: APuU4Z/BCdzn+Nt8oO4F6+HkIST+Rsq2V7PwjFFAyZ71FjFYqVmgrdYk
	KqQa4i5OQYWAe8qfTVuNt5j+SwOO6fXY3klRvW8Rv1714LXUqD+nNjlTHW0wUN5OsQuo8dSpnO3
	nIQQckAwjLv6OhvtbIWmZCm30bFuQawE=
X-Gm-Gg: AYBFou0lcFrYiXByiHXc54/5aiyGYp63ka+rBHke8p5AoSxqhmKepBEKC7Mg2IYMmZ8
	v1AW0+60Fk+S3mT8F2kL1YRmDQUWdEMp4ksEE1vd3X+nK1aK8p9aLSvYu/N50AkCxB4EgmilHUY
	WYsymFh8tVn736jhEawUYgs31RhiS9cgcrPkDK3Wat+UbSBo8CKTYM1t260D9V375SvnDrWH5DJ
	PsILcHTwgg1RpQqym6+MNZjiNJcw3Fm4Y9cEnSWaP4mGjwwU3Pwi0iSrde5O2lK1Ydo1E85UG6M
	3A91dIuxnWokw+Ac4XW69teURVmyTfJL701XpEiWG/WFkTTQDTYlMzsY5mUmotCwuwWMd50OhrM
	TDHkPBbZi4A8ZhKB8pts5X343fyWg+etKuotC5VzeGoA10r9QYkt+YfdAHEsjjKS0jZdKcN1w/m
	xggUXCrSaeVqMQ
X-Received: by 2002:a17:907:6d07:b0:c40:4965:72cb with SMTP id
 a640c23a62f3a-c4d6db36f84mr196935166b.21.1794202396398; Sun, 08 Nov 2026
 21:33:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102104642.925-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261102104642.925-1-laixiangwu@cmss.chinamobile.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 14:32:39 +0900
X-Gm-Features: AclHuK81e7ha_bd7N8D98DCzYoOYBA4JG5Pa3ARfHZchUTi79ZwM-36h02cCqWc
Message-ID: <CAAQKjZPOqEYe+iabUsdyfoxQyRRWUnX3Fe3eqEN8Uw-NU7vSFw@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: scaler: Fix runtime PM reference leak in scaler_commit
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053319_477386_06897647 
X-CRM114-Status: GOOD (  21.56  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

2026=EB=85=84 11=EC=9B=94 2=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 7:48, X=
iangwu Lai <laixiangwu@cmss.chinamobile.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> scaler_commit() calls pm_runtime_resume_and_get(), but when the
> scaler_reset() soft reset does not complete it returns -EIO directly
> without dropping the reference.  On the success path the reference is
> only dropped from the frame-end interrupt handler, and scaler->task
> is not yet assigned on the error path, so the interrupt handler will
> not drop it either.
>
> Each failed scaler commit therefore leaks one runtime PM reference and
> the scaler can never runtime suspend afterwards.
>
> This restores the pm_runtime_put() call that was already present in
> the error path before the conversion to
> pm_runtime_resume_and_get().
>
> Fixes: 445d3bed75de ("drm/exynos: use pm_runtime_resume_and_get()")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Merged.

Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm=
/exynos/exynos_drm_scaler.c
> index c8a1b6b0a..dc8189685 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -372,8 +372,10 @@ static int scaler_commit(struct exynos_drm_ipp *ipp,
>         if (ret < 0)
>                 return ret;
>
> -       if (scaler_reset(scaler))
> +       if (scaler_reset(scaler)) {
> +               pm_runtime_put(scaler->dev);
>                 return -EIO;
> +       }
>
>         scaler->task =3D task;
>
>
>
>

