Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877F0606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 05:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z2sGchp3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnppbrOT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GaHnyYDJUGL+w/bA52PUwEBtFj3m3UWp7S/56d6GX2s=; b=Z2sGchp33DSl2f
	b1WIrzwumQ+FEn9vSaz8nxrIH6mPVMMF2aFZh27paslmCDzVU7AobDikfctzJUbdttpIt30k1oraD
	7EL1BUGPiY1/gVmsSAyE01Ge/8T2QOVDFwwxqdZmmg4tqDqzBxopqE3sESChgCEc62j9PB/RUsgR+
	YNBiR0UaiimpH4eAw0Kf1pzKegbMaOAK/J5oN695LWBH0rpL9mo4IS+fiFNZuJlqWlENEkODQLfdS
	/WQ2cVsgk8yUE1arbsrdQOmOwOLS6p1RnVrf2Q96ZLxTFxx+jbLdO6TKFA1pFnwlDJKEVnWmVpCik
	nP9zVnxIJo4ZuAohflcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIB1-0000000HRaG-1b3y;
	Mon, 09 Nov 2026 05:44:19 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIAy-0000000HRYN-07Nj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 05:44:18 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so514842a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 21:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794203054; cv=none;
        d=google.com; s=arc-20260327;
        b=ll8cNUK75WM1SiBJ7B+W7lGwLQQVkBGWQYmXIACca4M89rpNPzzj44x3TXL5ZoEfn9
         N9i+Hl11pt4qi8p/KaSB3MqIlsZFBEg23qewCPuf9SvpvG0jR6WZPkSaDt8t/5K7oqRD
         zTHzS9h7koXB8cV8G44YrjMkEcp4PG3SiJ2K1OrQdvkKZxldQgX8poyRrF0QTzljgVNj
         Lp8jgU53qiWQI2dsM750YE0YFTtwtAY41Mrab2GG9NAXjyWr6BBf5Nset22C5k+AWG5S
         m1rZw5PsaLs2IV6Ie2UzPFTjQdgpY63S2cQlIinCzpqBbqnaAy0uRfCVoT17e2oPhXw3
         JLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GaHnyYDJUGL+w/bA52PUwEBtFj3m3UWp7S/56d6GX2s=;
        fh=PJR+5oZIIW3TrOAMi4LhhUazetbdyRbM09s9kpXyc7I=;
        b=BPSC9eezhwNkOKo2uDn/mhUeZcSSeR5FxJUs46605C41TwpIy6cFB4+QX79WiNCVZY
         NScDRO43DQo78xlXYGBRvY21Cfeo4CnIyuxn/Yqh6A76XPc5d++uVEZGkyebTEVtO01w
         C6qFhrhLAodA4/007lyAT6H2b1b28aFRpQXPyGojcfPRCWuIQw5bOeS8TONsI8Ok/aAk
         acE8qeUOWWy9Z0Oi+ZsuqLp7xr3qyqcbQqEDYXANm3RaZteU/HM2sN61gc9HcULypKwh
         Zlp/Rw4lz8ZFHzo+Zp35ncT6Pw6HPeFyDp4cYKaAA/KHpDiox6ZHydzujiUoNX3oNh5L
         B6tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203054; x=1794807854; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GaHnyYDJUGL+w/bA52PUwEBtFj3m3UWp7S/56d6GX2s=;
        b=BnppbrOTU6n4VROK9YVrzegfCNrL2mGYecxcxbm61EkbfaBCFQaajqwRtCjPVTru36
         xF3pLWsmmeUduOQVV8/ejs1AcmxDCDfcgfHSIoRYEihrGYRaB8dF93bm5hDnnkfUNegf
         RFdqtd6T3c5ed8phFSZB0zfVgz9Hc1GHJS6mf/zJ01WvaaWZKPDRDBCWVoITaINrjtZ4
         lGhWgj+TDZS8WZXKMiAkw1JMPTbHcONG0PrS7C9l08OHVBuRDMiw7TWCYEjVukzBe8tS
         1p+cR5tTI0NfmGQ4pGHtarYo6CF8d3FJOW+vQ0tNHR83vio9d33rqk31w9wxMRD/Syms
         d3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203054; x=1794807854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaHnyYDJUGL+w/bA52PUwEBtFj3m3UWp7S/56d6GX2s=;
        b=Ittl7KwluwwoomLtRAz+sk66L5oZSrOue62AnK7gYJVjS1YnCZksQIfC7WJNFgzWuc
         SKnw1MygzNCMNTdt+KfaeWH1IAQrwrrQZlldMCEBCacmEP4l39mUrF6U+xPgatZCR7IH
         xPCH7hL0LV+Avt5vG4LSl2oi53Bwes/vHhkf6Aqxsalwyyy7mkW7l/wzFfFl+eWSuTYo
         3u1l2VhZ8ycyukzxOfS/Rr76KYQ02ApQDKc+deWKECRr7TOwBm77rwsuciLhe4ecAY4e
         rRbQpTbi5+gMCzKdP5KJiUZ7xcaF1kWGzmd7gcQmvEtg8jppc2r9cfhVYkQf40PE9p2Q
         l5TQ==
X-Forwarded-Encrypted: i=1; AL+hErEoA4URgtEUBeqPCR6z2v1DmffEa0EfLTVzwTevWBus8ZXXKKZEyJf/QnR5bWCn2JV6UlfgNX6Pl6G7K1ZYKWz6@lists.infradead.org
X-Gm-Message-State: APuU4Z8BfxjQGOiDeTevhqM8pezn/cV4Yr5f2CVDUqde2DpZ7DP+IYz/
	OpAjKlJ5Q9dxWrE12Qr5LZe6YQI1JUpjQQNkj9KQ+/BnZM35lIdW9xB8miCLm20LFs1UanXT7wD
	odnE72Zo+srJ6o54zueJt1Rev5NUKTFX4srFcGJjEgQ==
X-Gm-Gg: AYBFou2EZKK4DhhBObFBSF40I3VePQLjYN/1L5T/EqSQKAHhrua2CXCmfw1S2AcGiRd
	bEltp3jglVNNyMc7Z2gBesxzJzTiW18wI0zfBYl2i7eAbNJu/D/A9YxAr4IwptOdxR+7TnnYbUt
	lq0pMAXkwvuCW1NsjeSgjD9OcAuuydZGVcVnYn1Z6z8FIxDFw0Gtlk039Zxm9tW9eI+x7lEelbB
	4Xo2wvKB/krjUcFgwMUSOiNu7EXJOvSn1E5C1SkXCttBGVjbMaKYFeioq2DTqePcP0tAYK3unXS
	InFaKluuzukvHjg434lWbitMrFSshWBE2hLOz1d+XuiDcShPx4yHCS8dIK66v0jy9+FZda2dEWF
	yPkxkA3RP/laXtADgGqhNmhboL+9TgBlYnN+kepo3iKzFLnnDESQvKSx02Ub7cz6ioZqlhp/THP
	sTRw/06+8z6uW8
X-Received: by 2002:a05:6402:1950:b0:6b6:ef7f:600d with SMTP id
 4fb4d7f45d1cf-6b722450928mr1861820a12.21.1794203053889; Sun, 08 Nov 2026
 21:44:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260916072012.1967169-1-vulab@iscas.ac.cn> <rc-review-20261105-14-00955ac4adbd@gmail.com>
In-Reply-To: <rc-review-20261105-14-00955ac4adbd@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 14:43:36 +0900
X-Gm-Features: AclHuK-P9ELAlBzpu3kDklHAW6kBOMQIDNRsiWYypfDAoEI-hiru14eAfArO-Rw
Message-ID: <CAAQKjZP_djWPUxr+B8jH_m_=MAPFcWmxst7fR727uNbP59xagw@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: dpi: release the node after looking up the panel
To: Yige Jiang <yigejiang86@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_214416_137711_505D4CA8 
X-CRM114-Status: GOOD (  18.25  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

2026=EB=85=84 11=EC=9B=94 5=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 5:07, Y=
ige Jiang <yigejiang86@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> exynos_dpi_parse_dt() acquires the remote panel node. The posted
> display-timings fix releases it on that branch, but the panel lookup
> path still retains it on success and failure, including deferred
> probe. of_drm_find_panel() does not consume the node reference.
>
> Put the node immediately after the lookup and clear the unused
> pointer. This covers both lookup outcomes while leaving the
> separate panel reference and its existing remove-time put unchanged.
>
> Fixes: 14b6873a0198 ("drm/exynos: restore parallel output interface suppo=
rt")
> Link: https://patchwork.kernel.org/series/1166158/
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
> Based on linux-next next-20261102 (2637bdec0535).
> Compile-tested: arm64, GCC 14.2.0, W=3D1, CONFIG_OF_DYNAMIC=3Dy.
> COMPILE_TEST=3Dy.
> Baseline and patched target objects built from this exact base.
> No full kernel/module-link, hardware or runtime test was performed.
> AI assistance was used for analysis and patch preparation.
>
> This is an incremental patch based on the following posted fixes:
>   [PATCH 10/20] drm/exynos: dpi: Fix OF node leak in exynos_dpi_parse_dt(=
)
>   <20260916072012.1967169-1-vulab@iscas.ac.cn>
>
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dpi.c
> index 92e8bbe9d35b..e98a9be0a705 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> @@ -243,6 +243,8 @@ struct drm_encoder *exynos_dpi_probe(struct device *d=
ev)
>
>         if (ctx->panel_node) {
>                 ctx->panel =3D of_drm_find_panel(ctx->panel_node);
> +               of_node_put(ctx->panel_node);
> +               ctx->panel_node =3D NULL;


A patch covering this same of_node_put() change in exynos_dpi_probe()
was posted earlier by Wentao Liang[1].

[1] https://lore-kernel.gnuweeb.org/linux-arm-kernel/a46a7710-0c2f-4fd3-911=
6-7678adca9390@kernel.org/T/

Thanks,
Inki Dae

>                 if (IS_ERR(ctx->panel))
>                         return ERR_CAST(ctx->panel);
>         }
>
> base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
> prerequisite-patch-id: 8f90819fd9f71f55560dc3af57c5a0bad07bc568
>

