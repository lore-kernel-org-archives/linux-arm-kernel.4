Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F354606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 04:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BqyZxkL7;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Vj8u7L60
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iXPJfQL37+lFuWrPBpgG/yJPGWXB8XjhyfXUrG6mrgA=; b=BqyZxkL7TZD9qMLNxzQaRojeFC
	AjJ2k5Y226JwXFTizySiSLiPGVxym604lZrlrjI2LNM8WSwHxL9JDOmPIhwdayJKSSF6IIlSwoqFa
	X2nOIeZ1sMJVbvpn/AIrNaYTGlvOIQST0WMs2/BlrvE1338Dbs5xc4mmvgiIm2jxOZoF5B0QSYFf0
	dSNShgJkT82wTsliM6Fx0iMbQOx6q27wOz0GGJxXlJi9Qo7fB8oAb93dUvCQtQKGSHtfFRsSGABe+
	bbdWuHes8v2qre0TUYN8HMCzZ0FDuPYOabf4NaBpQCS4BMcKCF1x3R/j2plLH2gG4wQkErxi/7i71
	wAQnf5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhSR-00000005Snk-1xZb;
	Tue, 24 Nov 2026 03:44:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhSO-00000005Sn7-1lJq;
	Tue, 24 Nov 2026 03:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795491873;
	bh=nMy8A8dspKyD4GQcj7I09F4uoZ54ej+K/KIoy3ZgamU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Vj8u7L60X2/fSBAqE7B8mTW5UwhE4nXuBjHrS8KCtkpKKcbMtxLHf4wtXLUaVvID4
	 pL2YYg6FYFXWqafhzHVqx3wEoROA0OzKyGXOexhXeT1YfB9BK9+x06jILxkqXEzFok
	 NYEbNoCeVMkFwW6aoqdiurnfGZ2A2sYgnjha9qYs72W13Io8qqFJoQdAT+P5LRB7WT
	 XpiNaevNeVpLmZ0TOCcr5FYzIlxd1B0n5rjfvKvCEhsCkQyyrTh+Qs86hBhkqX27+f
	 //D06V3rLOEYC21jgh9OzfR8iP32p6RmMLO64ixjChwNE5t+xBtF1vLm2vYH/zP/Zx
	 aDBhywIK6GAog==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D4F517E0CD7;
	Tue, 24 Nov 2026 04:44:32 +0100 (CET)
Message-ID: <1e59911003612aa645607efcd502c010f1972a5e.camel@collabora.com>
Subject: Re: [PATCH v7 2/3] media: verisilicon: AV1: Fix luma size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 22:44:31 -0500
In-Reply-To: <3dfe5ae59107fa77075676fc226ac818bc2700f9.camel@collabora.com>
References: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
		 <20261120143135.71134-3-benjamin.gaignard@collabora.com>
	 <3dfe5ae59107fa77075676fc226ac818bc2700f9.camel@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-VHcejEzEPR4GHlk6YEht"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_194437_368417_58643E96 
X-CRM114-Status: GOOD (  15.59  )
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

--=-VHcejEzEPR4GHlk6YEht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since you need a v8 ...

Le lundi 23 novembre 2026 =C3=A0 22:30 -0500, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Le vendredi 20 novembre 2026 =C3=A0 15:31 +0100, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> > Use the values computed by v4l2 helpers to get luma size.
> > Unlile before this will also take care of padding.

    Unlike

> >=20
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")

Fixes goes before Signed-off-by, does this need to be cc to stable?

>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> > ---
> >  drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_=
dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > index 5da59104a966..5e0cd5268f22 100644
> > --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > @@ -221,7 +221,7 @@ static void rockchip_vpu981_av1_dec_clean_refs(stru=
ct hantro_ctx *ctx)
> > =20
> >  static size_t rockchip_vpu981_av1_dec_luma_size(struct hantro_ctx *ctx=
)
> >  {
> > -=09return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / =
8;
> > +=09return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.height=
;
> >  }
> > =20
> >  static size_t rockchip_vpu981_av1_dec_chroma_size(struct hantro_ctx *c=
tx)

--=-VHcejEzEPR4GHlk6YEht
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawUIHwAKCRDZQZRRKWBy
9AgzAQCYcZQsQXxWhzBG+rQkqaUoWlXfLw76Ec7suNYc7L3DYgD/WVROKXt7doP/
gd9qyH1wa0gnWIXTtyOoUMoj8l+1TQY=
=hkrb
-----END PGP SIGNATURE-----

--=-VHcejEzEPR4GHlk6YEht--

