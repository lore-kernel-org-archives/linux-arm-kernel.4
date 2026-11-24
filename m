Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65C9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hDx23pIX;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Owlrg3ny
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kT+xuhaSl/fUoT3wmVVtDAie9WoGC5vXXYFsJEveQVY=; b=hDx23pIXnmJhdRze+VHyzn/fGp
	MG7dVQNS4Mjlafmy+cm41Dav5MzSH+6Q1IrFKMxe0KT6mFD+q9MK3DbO2R2IgthfGBMnl410qMk0P
	QOkkLq82KJEDavOoghyZne142KokuHiIdABPcVh35UrqxlJ7jG1dKa0N2p5y19ekzUab43l06p517
	AOP4Kd2c0IkFcXyMzrEXoM4H1dExssLcgtEwFYflVAV/YTxY60fQTohWoSGOBrIdsmFnJBsETkGDA
	IYdFO0lS7NXZpmh55Mxm92bk5Z8vhbhnLkk5kuqXxIpVg0B0U8t7EZ8/XS+5lCVNHZ8tpAwdqp9fj
	SnYPc6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyUI-00000007waS-1ISp;
	Tue, 24 Nov 2026 21:55:42 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyUC-00000007wYU-1xct
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:55:41 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-93f22a8515eso441410085a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795557335; x=1796162135; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kT+xuhaSl/fUoT3wmVVtDAie9WoGC5vXXYFsJEveQVY=;
        b=Owlrg3nyEIdalPBnadfw2ULbKhhpzVLG3NjIHVZbR0VgPsON9i/rXEDnTWF7iUM6z1
         WugP0HSlr6gGgDWsMsEcknVzWelHNnF1ndJhElV9aXXSe54mbxDKZntCXa32vLbTe7N1
         ZA2E4yeoONLOSVcgVfgXNOyvspAV1CvGk7sFZuDRgzbR8pcy+xYH10gmAllN3xiu3dHx
         tqEt+6z0FzEKARLm1WaB6EzgqC5ZOisYCo2PSVgmjZAf0l7f8Rd7f79386IvDH4oQMdy
         tOpppN/rSYGV1+OgyZdnmgHCDWLq+/0GfoW+Roby6GlzKnvthbF0Bj/ezLVNETLzDXQM
         e7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557335; x=1796162135;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kT+xuhaSl/fUoT3wmVVtDAie9WoGC5vXXYFsJEveQVY=;
        b=2WQTFXY9Wtwgy8bwjSXfXLuHCI20Xh9ofK4nr2HSFYqYgfGvgkz2Q3Eld4IHwmfGJz
         jgm2UDB4+JK9VciRJP9QLC0YU5SQjXw2Z4Q3+HDmuzJTHNdHk736JOfSrV0WfhxLGgwS
         OQbrHf81R+xKuoVVmMsl+r+gkjAmqpjxoj4ieACJxRUNIL7IpjLDc3GuZ9glbpV6NEJU
         5RoI/pz/cTOyYFn/isxgRsLZUrc0ey00q9AkGp+lL5UrGSXbVkO2Orz4rzVtpRBEu0Wd
         1+p76o160VdhGNcLNMj3K3U7XzsTS7isia7S0wwozf2Xk6Zavd+vddrhhybCrf78lHsn
         BqiQ==
X-Forwarded-Encrypted: i=1; AL+hErGAcWNzM/tXSEuMRN9rey7Fh/of5p0GlB58QPAQAb05mCYJQ2EuCepQGkjqJax1oBX7PN3vkEtyzIDp0AqdenRe@lists.infradead.org
X-Gm-Message-State: APuU4Z+vhZXr3Udk2P1cYzpbu89nIHRv/72cffF5iE4mijnVZIBb1B4y
	KrQH53BNr+EOK4l7pz2C1RslH6DMEMiGdAp1njWaUk9aBiS0Dq4qFXT2JLeZQdcZKn+rgk34GmG
	mhQtH
X-Gm-Gg: AZFdTZclCnYhRMAPu9hUB62agK3hWYg76NhFX4fORh7Lk5v1CzLxyx9kGNKJ96hLd+s
	C8FZc32WB1OW4pzkP7oQXd9YRUd7EzA025dB4NUf7zIrcuVz+SCFxCCWoEXBqRvAfxNwbbLC90m
	SMcWz2Dk3UzaM2L0W8Wkqf3dZgIJd5yrmjJBw6vQwxxZMV2IRYntZgEEtyrwaeXfV5TIJ3VJTpU
	KNeKHhNMTsormKhqeWLrQmH1EzNFP/jeI5SgPHkuEPuENN5cKESn3T6F+9yph025HGMzLbebbli
	JmPBopfNgMNOfeY3uc1BijT1GiNcEGF/596AxCPAj6cmbSAzp/x2wbZL4znh6r7jgZQahsIecJh
	iOLnyHPUBhrmTStKsFyqm3YwO4kHo88XDxe0YFKvM9qA3RFs8o/jzcuUGrCNr9StPCkZx0zCxdj
	uBHb+cDtspMjZVTJckPro1Vd5MW8M7kRzbNvQV4QO/8q05qDVtc63G/YrRinPsOXDNyBcoWRMx1
	7Lk7XXP4hOql+iCKVnJ+g0arKIf2WpO4ISuF1+HIhr6U/PX0G24R3rNMTt2IsPVahzqr4VhT58t
	cwj34SUWCFlatIDIfJ7dHy0ENGdzvMcAz3yxXQ0OVzKQGRn3bGrRmJo=
X-Received: by 2002:a05:620a:1305:b0:949:74d8:46fb with SMTP id af79cd13be357-949ba9b385cmr2910405585a.41.1795557335002;
        Tue, 24 Nov 2026 13:55:35 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3ba04bsm1169083785a.24.2026.11.24.13.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:55:34 -0800 (PST)
Message-ID: <c592bdd6b31c6e6580876c5fb7a37591b0355157.camel@ndufresne.ca>
Subject: Re: [PATCH v3 02/17] media: v4l2: Add P210 pixel format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau
	 <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Tue, 24 Nov 2026 16:55:33 -0500
In-Reply-To: <20261020-avd-v3-2-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-2-85cbaa2125d8@icloud.com>
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
	protocol="application/pgp-signature"; boundary="=-CAwZvlptZ/R7neJeECDI"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_135538_968871_B200B37C 
X-CRM114-Status: GOOD (  20.23  )
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

--=-CAwZvlptZ/R7neJeECDI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> P210 is a YUV format with 10-bits per component with interleaved UV.
>=20
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst          | 14 ++++++++=
++++--
>  drivers/media/v4l2-core/v4l2-common.c                      |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c                       |  1 +
>  include/uapi/linux/videodev2.h                             |  1 +
>  4 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 0631919bd667..f2d2e79698fa 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -138,6 +138,13 @@ All components are stored with the same number of bi=
ts per component.
>        - Cb, Cr
>        - No
>        - Linear
> +    * - V4L2_PIX_FMT_P210
> +      - 'P210'
> +      - 10
> +      - 4:2:2
> +      - Cb, Cr
> +      - Yes
> +      - Linear
>      * - V4L2_PIX_FMT_NV15
>        - 'NV15'
>        - 10
> @@ -834,12 +841,15 @@ number of lines as the luma plane.
> =20
>  .. _V4L2_PIX_FMT_P010:
>  .. _V4L2-PIX-FMT-P010-4L4:
> +.. _V4L2-PIX-FMT-P210:
> =20
> -P010 and tiled P010
> --------------------
> +P010, tiled P010 and P210
> +-------------------------
> =20
>  P010 is like NV12 with 10 bits per component, expanded to 16 bits.
>  Data in the 10 high bits, zeros in the 6 low bits, arranged in little en=
dian order.
> +P210 is the same as P010 but the chroma plane is only subsampled by 2 in=
 the
> +horizontal direction.
> =20
>  .. flat-table:: Sample 4x4 P010 Image
>      :header-rows:  0
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 11ab684024c5..43ef12d073a3 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -325,6 +325,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  =09=09{ .format =3D V4L2_PIX_FMT_NV42,    .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  =09=09{ .format =3D V4L2_PIX_FMT_P010,    .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
>  =09=09{ .format =3D V4L2_PIX_FMT_P012,    .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> +=09=09{ .format =3D V4L2_PIX_FMT_P210,    .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> =20
>  =09=09{ .format =3D V4L2_PIX_FMT_YUV410,  .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 4, .vdiv =3D 4 },
>  =09=09{ .format =3D V4L2_PIX_FMT_YVU410,  .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 4, .vdiv =3D 4 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 17ba1ae70735..1f2519ffeb2b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1369,6 +1369,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  =09case V4L2_PIX_FMT_NV42:=09=09descr =3D "Y/VU 4:4:4"; break;
>  =09case V4L2_PIX_FMT_P010:=09=09descr =3D "10-bit Y/UV 4:2:0"; break;
>  =09case V4L2_PIX_FMT_P012:=09=09descr =3D "12-bit Y/UV 4:2:0"; break;
> +=09case V4L2_PIX_FMT_P210:=09=09descr =3D "10-bit Y/UV 4:2:2"; break;
>  =09case V4L2_PIX_FMT_NV12_4L4:=09descr =3D "Y/UV 4:2:0 (4x4 Linear)"; br=
eak;
>  =09case V4L2_PIX_FMT_NV12_16L16:=09descr =3D "Y/UV 4:2:0 (16x16 Linear)"=
; break;
>  =09case V4L2_PIX_FMT_NV12_32L32:   descr =3D "Y/UV 4:2:0 (32x32 Linear)"=
; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 5373dba640fa..5472e433ed06 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -659,6 +659,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/Cr=
Cb 4:4:4  */
>  #define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 24  Y/Cb=
Cr 4:2:0 10-bit per component */
>  #define V4L2_PIX_FMT_P012    v4l2_fourcc('P', '0', '1', '2') /* 24  Y/Cb=
Cr 4:2:0 12-bit per component */
> +#define V4L2_PIX_FMT_P210    v4l2_fourcc('P', '2', '1', '0') /* 32  Y/Cb=
Cr 4:2:2 10-bit per component */
> =20
>  /* two non contiguous planes - one Y, one Cr + Cb interleaved  */
>  #define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/Cb=
Cr 4:2:0  */

--=-CAwZvlptZ/R7neJeECDI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYH1QAKCRDZQZRRKWBy
9Hi5APwNsO/NocrcIJcIll1SPJxbqsKHJGgTqWhDD76gjdf7EQEAs6EtAl483env
blqRUPQrAHH8q7BIoKoBtSv+UXwi4ww=
=6io4
-----END PGP SIGNATURE-----

--=-CAwZvlptZ/R7neJeECDI--

