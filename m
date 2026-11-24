Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DBA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gRY6Vkjz;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PqRwvsNa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GAeuGjA0ohrbKm/YKYQMvDRAMTyL5dqBXRmsdS2B1bw=; b=gRY6Vkjz9h0ZSArwgFEvJ8+u/e
	wF0DxAbuxcMPTvvlJY7Fjs5YRbyRXgrSba51EcKFfpgYVpBoEqhHk1Rg1yPspl8moBbd5x5Yp92s3
	Ck1XX6QiJJTRNMpgFVP8bGt85w/944FwTCRssi2Z4wDIwq0ZyQHAiSVAHNFUuKTWfFEfekIiicXQd
	ChQdaHNWtNB/T9QgJqmVtTF3eWLcr0ddJUUy1aoCXbF7UQ8aBRKVwP/9k1k0jLId26PhVjVdGOaIJ
	tzu4vsVSDyJ2v3El1oWEmzDJrOINxkG8/XGpw71G/xfh8M++E0rh8LV68m0edurcF8YjwQRSQu+AD
	OmVW8i2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxPH-00000007l07-3vG0;
	Tue, 24 Nov 2026 20:46:27 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxPE-00000007kyW-3AKU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:46:27 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-93f269e335eso589780085a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795553183; x=1796157983; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GAeuGjA0ohrbKm/YKYQMvDRAMTyL5dqBXRmsdS2B1bw=;
        b=PqRwvsNaXCUwNZW+sLfLiPbJhbFpgjILBI9TlXSxF0RsATNqaG4Xn3M4CDHZqlm7MG
         NOiGI4kMO2FQmds6qcmybgR3KLdOU6+hXLdeouK/M9+28g+TUqGD1fND/OBM+l+dzQWQ
         Mk6LDwLwSWOq7IzI0zUjFmnuZl8iGaq/vejmkeNfxCF8NZiSX28wBo8DXEpzcvdRCfZo
         1UakwshsMuISBNmbEAtqJfxo22QidvuJZHTl3pSF9/qLETO5py6vcEk1k7ZHn5OV3BDv
         Y5cR5EYx1QD9A5I1iY4ej19L/x381kpc04+HkMxSFoTp4/SNH71IxrRmtBfO7j/arAaJ
         dSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553183; x=1796157983;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAeuGjA0ohrbKm/YKYQMvDRAMTyL5dqBXRmsdS2B1bw=;
        b=ip8kJxTYrHdi+OAygPmcaG/5uqYJkPaq+J1A+O8vA7TbfBBN5PHFIIlCd8aB06jSMZ
         BqPaFXfSvkqh1+no+p59g5J4ewrKx6JwdX4cn1eLZYfBWXEmmZ5BBw/Lygck4kaA0sJj
         GHyBkzQ8cLYYB8OJZRdba0sWB0F8ShoiX96IM4m+CMnIoWoR8FmK1YU2KWM13gnRl5xR
         CxlOrwLNzmlP15UliLaQiKc6lRB6o397UEajjDGjLnaalQBpLZ/NmJHIXnq4+OUFJYFS
         1iARwY6wuM/lbYZmg+v59bWadys6gsMOW0+arhextIueuNxA2d3SAl0wo8WIYXyPo3B/
         blyw==
X-Forwarded-Encrypted: i=1; AL+hErGbPvGR6DDVixLFE8Iu8RRnYd4P3c+Vl4aQL9zWkZX4LIADHvr1Qfu0b2Yp7dYVVMkHI/Bya6BUP8R7SrC00G32@lists.infradead.org
X-Gm-Message-State: APuU4Z+8oq10JkuZPtrYtt1fW72LOgJE68BulFZGZv+Ih9iSlzPp5q3z
	TKc0hu2YqRYWBBQj9iBCDktdwM8HiqPAZEiEFudf8jf7UHeFYmPRa5txuuB20sC2jOQ=
X-Gm-Gg: AZFdTZeBIBXYBXDvVI6X4ro24DixffUvFF2cZLWVmoxfnN9dsnOhlBpAsgr5nWjulU5
	fG9or05RiksGSvA5L3fFoFKZ67b5/zgudHDY9Ysp9zp9QP413//CJyb7gnZTDGEDwTPAae/6Ixu
	rVrb4TD7vU/D5CVTL7VYVW7Tkw3zIdANwXkd5rOo56lzu07lzxjWHW/Rr0KonsvOylVTZzx5mf6
	i4hTOS49gslsjneBUKnl325jhrKpg+7chNazopC03T+Omdidpww5RpjfvjYUzQfZXxVKXbBxWnS
	o2UKCWP7AlVwqtbcYeCV6vOUIuBNce/KkQoSgtjehRSJG2+iOhe96RiTrAPyEJSJOGf45+lknXc
	VJRED33EL8Ini7tieT5LIzdMLroh2gizfMNa3ZY2RMKHckGBrMoAQUz2RPwHDwNcH8HwrcoyU32
	880HHCSo/nrArZ+QBx+DAraL5P1i9mEEH2lC2zDc4cvY+pemb3/We39XW9fFOUS3mW8yhmYh3IZ
	Bz3LnPtdC4CwFiHaS3xQ7X1kN/5P4rToN+PPGvipsWvz/YdUaIBZn8UyTsfkxqpQV1TvNZnEGH8
	OiXOhU3q+AJx1qE7h0Ls3VgGQreHPKvoWlBLAVhMqVcwYa8o+cn6big=
X-Received: by 2002:a05:620a:2605:b0:949:9f1e:d8b with SMTP id af79cd13be357-949ba99cb12mr2707807885a.16.1795553183318;
        Tue, 24 Nov 2026 12:46:23 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb35005dsm1135466685a.11.2026.11.24.12.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:46:22 -0800 (PST)
Message-ID: <6e1ea0410e9a1ff6a811914a0718117e18763374.camel@ndufresne.ca>
Subject: Re: [PATCH v2 03/17] media: rockchip: rga: move early return into
 if condition in vidioc_enum_fmt
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
Date: Tue, 24 Nov 2026 15:46:21 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-3-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-3-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-Kr3UTuiIQsdfzM6RH7S6"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_124626_216616_447E39D1 
X-CRM114-Status: GOOD (  18.67  )
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

--=-Kr3UTuiIQsdfzM6RH7S6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Instead of a doing an early return when we don't have a capture device,
> merge the condition with the following if condition. This improves
> readability, as the condition now explicitly contains a check for a
> capture device instead of returning when we don't have a capture device.
>=20
> Also use the V4L2_TYPE_IS_CAPTURE helper and improve the comment.
>=20
> The early return if was copied from the vivid drivers
> vivid_enum_fmt_vid function.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index efe5541078214..8c03422d669cf 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -372,12 +372,14 @@ static int vidioc_enum_fmt(struct file *file, void =
*priv, struct v4l2_fmtdesc *f
>  =09if (ret !=3D 0)
>  =09=09return ret;
> =20
> -=09if (f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> -=09    f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> -=09=09return 0;
> -
> -=09/* allow changing the quantization and xfer func for YUV formats */
> -=09if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
> +=09/*
> +=09 * Allow changing the quantization and ycbcr_enc func for YUV formats
> +=09 * on the capture side for RGB -> YUV conversions.
> +=09 *
> +=09 * These flags are only relevant for capture devices.
> +=09 */
> +=09if (V4L2_TYPE_IS_CAPTURE(f->type) &&
> +=09    v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
>  =09=09f->flags |=3D V4L2_FMT_FLAG_CSC_QUANTIZATION |
>  =09=09=09    V4L2_FMT_FLAG_CSC_YCBCR_ENC;
> =20

--=-Kr3UTuiIQsdfzM6RH7S6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX3nQAKCRDZQZRRKWBy
9EPvAP9qmu6NjbxJIVrwPbtNCb2o5iC32gRQgn1s5lFgDIFY+QD9GU/Itmf98PeY
254GJzxL0n7DdfgEkaSI/if1tyvWuwE=
=f1zz
-----END PGP SIGNATURE-----

--=-Kr3UTuiIQsdfzM6RH7S6--

