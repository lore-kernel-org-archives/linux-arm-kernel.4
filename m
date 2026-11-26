Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CC9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 22:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cayG68UD;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=M9qESV1T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qHZSQgp+ZGSrefrl/qFSuVdRUTJkF4L772VuAEgGZS0=; b=cayG68UDR+jQ6HaV64xX1W6HpL
	5RDvkWcnioEKaVhK5/78HNPTh6+i9yOM3V8wytnB+ez5Oo7qsVLuTEdLFSE1jR72DrvVMJpvE66FL
	4vzCmKirXt9XTKqOedVnpBbQLaNn69y6R+NlF6bZrCVRhP69coPBsxV3L14/h7blD7FVej/y6sQ5E
	fNJ6FE3eKbWDZigK7ggwaK5hpzLhG1uzbpaq1BB87DH3K+5I8JZqs/B3CFQZAsNOjLbUXTyBT9Pdw
	iCUnoowaArk5Wpr2K0dSRDbgD5RWFgIy7ZYsZ4P4Vqcz+yC120yozJN+LF4WopbyAXWLtoMtVWv5/
	VmL8P8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWi8V-0000000EduE-33gw;
	Thu, 26 Nov 2026 22:40:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWi8D-0000000EdrC-0SVn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 22:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795732794;
	bh=LvFMCCC7vYA0WRTmw7yaSVoqNSLrrtzP/zmD039djFY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=M9qESV1TneP491akknSQldHyUKeqsmvePtINaq8qZulgUEXUaTh60cVqC/540GeXA
	 MhPTiKP8qCot8MrOz1li1DMaMhfxozFWL2avyWLKp/yvkmq9sN2kd9zOeWDDAlZvYd
	 Kt8elf40RubUyYmUlrjgY5DedjUjyHGdKeCZ7YK5doXXR5qj7XngdnjSBUS53oXPjC
	 qwNbAs0nO+VtqAFcOhLxnlXfc44KAkjbT74lSTTcdqk6HDfBcZ8w2f/qq0dP/vH9Ka
	 sYmh2lsCqlvEzYBtd0gYnJCRFI/Phk/brDKTF9qJSLpfe9Dxya4vOenoqYlQx1VFpC
	 VjsMwk8vU+exA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E4F517E0DCD;
	Thu, 26 Nov 2026 23:39:53 +0100 (CET)
Message-ID: <bf4467491ed1fefd634911530bf19b5e428a300f.camel@collabora.com>
Subject: Re: [PATCH v2 10/11] staging: media: cedrus: h264: clear the DRAM
 buffer sizes on start
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:39:52 -0500
In-Reply-To: <20261109175016.42061-11-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
	 <20261109175016.42061-11-jernej.skrabec@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-DIoTfJOE3v4BowFGg5IO"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_143957_305179_D7F1C011 
X-CRM114-Status: GOOD (  17.36  )
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

--=-DIoTfJOE3v4BowFGg5IO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 09 novembre 2026 =C3=A0 18:50 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> Above 2048 pixels, the H.264 decoder puts its deblocking and intra
> prediction buffers into DRAM, and stop() frees them when their sizes
> are not zero. start() only sets the sizes for wide pictures and nothing
> clears them, so a narrow stream after a wide one on the same file
> handle frees the buffers of the wide one again. The codec data is also
> shared with the other codecs, whose data can end up in the sizes.
>=20
> Clear the sizes at the start of start().
>=20
> Fixes: 03e612e701a6 ("media: cedrus: Fix H264 4k support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index 97958ceee8d1..e7a3bfbc3531 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -573,6 +573,14 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
>  =09unsigned int pic_info_size;
>  =09int ret;
> =20
> +=09/*
> +=09 * The sizes tell stop() whether the DRAM buffers below were
> +=09 * allocated. Clear them, as they are only set for wide pictures and
> +=09 * the codec data is shared with the other codecs.
> +=09 */
> +=09ctx->codec.h264.deblk_buf_size =3D 0;
> +=09ctx->codec.h264.intra_pred_buf_size =3D 0;
> +
>  =09/*
>  =09 * NOTE: All buffers allocated here are only used by HW, so we
>  =09 * can add DMA_ATTR_NO_KERNEL_MAPPING flag when allocating them.

--=-DIoTfJOE3v4BowFGg5IO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawi1OAAKCRDZQZRRKWBy
9JLDAQCY9nvwXakP5rK1ZSCdsq/tton1rjmCPvOqGBQwxsAkJgEApQCaKxATUqDr
oi4UrAEljUMab2bf+2jLF918X/Q1aAs=
=s/wX
-----END PGP SIGNATURE-----

--=-DIoTfJOE3v4BowFGg5IO--

