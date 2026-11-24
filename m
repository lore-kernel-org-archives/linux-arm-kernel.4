Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D588606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2GfyppEp;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iqVqhHVF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RvU1ESTYysczxCSetKI0TL55rpMf6chQXLmsCQQ9a7E=; b=2GfyppEp7QMXqtqDmOmS90PNxE
	QixuJdqO0mAM5HCFxMdACzVUkV1wTrEVYD0ctauh89+0qLUm4mIjn2ktpEIOeZOPC9IpNv+1CZX/f
	8dOj3szD23HeLd8xTPTZjbklefaazN05XpL19/vGbMuuwvh0GNRIGaI8EWbIimKcr5lhdDwnTLsLQ
	IMjgySGNkFJTz6TMrxmIYXMQtWVcFj8LC6aBNg+4hIgmp+s0F0F5wJ+TrePlylVjtcPGRWz77L8nv
	iUvC8RBra8vHTyEXI68pJi3qZL0rOHEoO+DTW/FSuS3e3WoPXSVCKiL4NjsIAKMv8bGU3FriFy4hy
	DumgOl4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxUV-00000007n3m-1mCE;
	Tue, 24 Nov 2026 20:51:51 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxUR-00000007n2h-3BAZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:51:49 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-55d6deecef6so50254111cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795553506; x=1796158306; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RvU1ESTYysczxCSetKI0TL55rpMf6chQXLmsCQQ9a7E=;
        b=iqVqhHVFdb3+12owJtCfydsYyoECMDKgV0iaD9GdQDh48Wy56QaEgqPxBymOKqdqKf
         8HMI3GtEFf1jyCnxTdefpKEuJHwWBRC9bs4DIwo0O3xZYwzOAsRL8HUZ3OgIY+pOSIn5
         72osiXHFgZ1aTqM8Xvx9bTZzaTy0yKCxbKtTEiLVQc5OKODxfhgY/c6lockegVtkJ/w5
         O4rcVhDZqt+aMXknn0ttAxUuNHsT7DiV07zZwqcpLz12dcwBbV10w8VTmultQ1HN23P+
         n/JrB8tfrpAoVPR8t1NFs6CMf9FsaXRnoRRLtgWPEMDAnx3XxMxxs7KMhGvWoTv0zx4v
         Ig6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553506; x=1796158306;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvU1ESTYysczxCSetKI0TL55rpMf6chQXLmsCQQ9a7E=;
        b=uKx16cCGXBPBM1f3T9JrF2fdsrFoZAmKpgwh/vcF6zjPazScdF+7buvUzTT01eUhFy
         5wOaT/adhtI1Wyq2oWOAy1NXTz0iuGfXRDa0fAElWtW03vVI2Co/h8nxmQK1waTCJs6W
         sIy4yOD/N3s/T8aCk5FqXMYQB08AJuaDEGS2SH6SOR4SB1PbMfVulXlgp+1DmRTAdvvP
         q8IXgIzpuIrM1a0NqkOVXCKR9eW4N337F4Lg5pcP5/Y4UCzqtGDCJwQDij7x+Wg4Wg1l
         oA04OjbmlDndvOoXozfLcyAqYHjGmRW+o1exk3ztB0tB8CF19oT4XP7gic3oBhlI5sUN
         IUzQ==
X-Forwarded-Encrypted: i=1; AL+hErFZ+4F3tCJ2KucmB8DJ1GXPRDwGCXtC8NWs1bgNXtHhNC0xUKOH4TMLkA4vzCO8gsE3oeJjSSwgw6PTgQdpPLEU@lists.infradead.org
X-Gm-Message-State: APuU4Z9bQdiqPMmNkzSDSIYmj0NfoR/smPD91da7uXtV7wGyqNT1UKSe
	U5/2bDNO5W4qrYSWIyg7n+fyuvLbmDc8OAhMPvRNXx8aIlupFjA7k63wNJBugaABXlQ=
X-Gm-Gg: AZFdTZdAeeLfJJvzw8t1Yf1V0ULtX672vvmbW3EYuyYaykLFgewRn3l71KjWsXG1US9
	UlZOwSkDcI0LJVGmstHh4vipHOrpiG5MfkzcL36yVLEM5DacbpSo8RokHSnBurIauZJ9JcVVK/D
	qGh0yM2ZE3j3Rtyyx+kMILrrv6jmpB41ujJhB97dvFtnqLyDiJAqs7nc8PxhW1qLCm4WsnIJF1O
	acB8H6NVtRv5eXq+mLT8YBeQoadiU1cHNdkjHAheI8YeJecxwt7oB6sgofG8yjKDvbHN1opu65i
	0XkY11ZRqSjHiNwxdM0VczzUUwT41Bs1X3dht02+MaxbuUmztfoKdEjCY6qTaslZgGMtuXJlMjj
	DhprX1Etvx1Nn6PCQ2YPFcqXzRxsxfVcuq3Ijrobd20X/gJJYHIXSrITKjE176+fURw7Vdo1vXb
	mfHqJ0vMLghSJLzqF+Hx/OjFfiG/toRuZIvHTUlnl5RVl5yPYIRd6kPTzPM77jGJLyqdB+obEEK
	2WWN6E/vdS7EVYd2kj18PO0iHoxrRJBKiVxHi46ymdtpGDdGwBNZ770JyjIjOLoPBLMRZ1HwK76
	Gjj9wJlVS0wormXmSo98heIB8QmfdHA3af3+MUlABsF/6LQSlW8Ad6UtLJvuryo6dLLyfcVUeiR
	q
X-Received: by 2002:a05:622a:613:b0:55d:3254:6253 with SMTP id d75a77b69052e-55d76a518bamr289760521cf.42.1795553506144;
        Tue, 24 Nov 2026 12:51:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134796288sm142427246d6.6.2026.11.24.12.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:51:45 -0800 (PST)
Message-ID: <89a387a88aff111fde71f00474776d1462b3594b.camel@ndufresne.ca>
Subject: Re: [PATCH v2 05/17] media: rockchip: rga: use devres version of
 pm_runtime_enable
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, Guangshuo Li
 <lgs201920130244@gmail.com>
Date: Tue, 24 Nov 2026 15:51:44 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-5-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-5-23aa2cb74e61@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+FFLPuXOIBC694qENGcJ"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_125147_818804_D80EFFA4 
X-CRM114-Status: GOOD (  20.29  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-+FFLPuXOIBC694qENGcJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Use the devres version of pm_runtime_enable named
> devm_pm_runtime_enable to ease up the cleanup handling. Also it avoids
> having a mixed cleanup order due to the following
> devm_platform_ioremap_resource being cleaned up anyways after the probe
> function has returned.
>=20
> This also changes some dev_err calls to dev_err_probe for convenient
> returning. This may not print these messages in the error case, as
> dev_err_probe may handle them differently based on the error (e.g.
> ENOMEM won't be printed).
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2
> - added
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 34 +++++++++++--------------=
------
>  1 file changed, 12 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 8c03422d669cf..d7f0712177b70 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -797,37 +797,31 @@ static int rga_probe(struct platform_device *pdev)
>  =09if (ret)
>  =09=09return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n")=
;
> =20
> -=09pm_runtime_enable(rga->dev);
> +=09ret =3D devm_pm_runtime_enable(rga->dev);
> +=09if (ret)
> +=09=09return ret;
> =20
>  =09rga->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -=09if (IS_ERR(rga->regs)) {
> -=09=09ret =3D PTR_ERR(rga->regs);
> -=09=09goto err_put_clk;
> -=09}
> +=09if (IS_ERR(rga->regs))
> +=09=09return PTR_ERR(rga->regs);
> =20
>  =09irq =3D platform_get_irq(pdev, 0);
> -=09if (irq < 0) {
> -=09=09ret =3D irq;
> -=09=09goto err_put_clk;
> -=09}
> +=09if (irq < 0)
> +=09=09return irq;
> =20
>  =09ret =3D devm_request_irq(rga->dev, irq, rga_isr,
>  =09=09=09       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
>  =09=09=09       dev_name(rga->dev), rga);
> -=09if (ret < 0) {
> -=09=09dev_err(rga->dev, "failed to request irq\n");
> -=09=09goto err_put_clk;
> -=09}
> +=09if (ret < 0)
> +=09=09return dev_err_probe(rga->dev, ret, "failed to request irq\n");
> =20
>  =09ret =3D dma_set_mask_and_coherent(rga->dev, DMA_BIT_MASK(32));
> -=09if (ret) {
> -=09=09dev_err(rga->dev, "32-bit DMA not supported");
> -=09=09goto err_put_clk;
> -=09}
> +=09if (ret)
> +=09=09dev_err_probe(rga->dev, ret, "32-bit DMA not supported");

Did you mean ?
=09=09return dev_err_probe(rga->dev, ret, "32-bit DMA not
supported");

With this fixed:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =20
>  =09ret =3D v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
>  =09if (ret)
> -=09=09goto err_put_clk;
> +=09=09return ret;
>  =09vfd =3D video_device_alloc();
>  =09if (!vfd) {
>  =09=09v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
> @@ -877,8 +871,6 @@ static int rga_probe(struct platform_device *pdev)
>  =09video_device_release(vfd);
>  unreg_v4l2_dev:
>  =09v4l2_device_unregister(&rga->v4l2_dev);
> -err_put_clk:
> -=09pm_runtime_disable(rga->dev);
> =20
>  =09return ret;
>  }
> @@ -892,8 +884,6 @@ static void rga_remove(struct platform_device *pdev)
>  =09v4l2_m2m_release(rga->m2m_dev);
>  =09video_unregister_device(rga->vfd);
>  =09v4l2_device_unregister(&rga->v4l2_dev);
> -
> -=09pm_runtime_disable(rga->dev);
>  }
> =20
>  static int __maybe_unused rga_runtime_suspend(struct device *dev)

--=-+FFLPuXOIBC694qENGcJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX44AAKCRDZQZRRKWBy
9FD0AP4s49BNgvZ0n2v4ASohGrNveTzQ0wXrIkR5ZrY0fdkokQEAwD1oRUFwpDXl
d3x9ZgE+KkJELoR8Uvzc7O0MwUniOAQ=
=goRl
-----END PGP SIGNATURE-----

--=-+FFLPuXOIBC694qENGcJ--

