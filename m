Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B90606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 03:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SQSNqdVC;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=knpsskBk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=; b=SQSNqdVCL/hU//OXv6w7k+6Q5B
	tg9pDNr39ITYbqoSs7n5LZDv0PWMVZEOBiJorzZGtsxKbu5SSw8P6kOsPtR1btregClNHONKE3KGf
	fiWBENbxs3Xd7yVdhpQrYyuTdDKrRleyutP5XnqKfbqsB8tq/Z8voQ1msCWI7YTF6R78/1eydyLH2
	1zLLsAbNHtfEDmoJNFkw55zp3E+balnWOdFO/JWBddRNkhGF7SY06AyxTdxQlhpiezL7dw/u3BIwe
	9M0Otw8IS5Uc43Vb+/oOHlLbZ4/N5j93rCBoheseR7/vA4z3RX3BwePPHnN+qYGxJhoRSlwMDZzyA
	uDYWUmpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmPh-0000000EqAz-0u9b;
	Fri, 27 Nov 2026 03:14:17 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmPe-0000000EqA4-10cL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 03:14:15 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-9495d543b91so456842385a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 19:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795749253; x=1796354053; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
        b=knpsskBk64asn793J8lY7sNKtHYQ6M9Fs9hLh5X53z/kY8oEaNzav5rrbGNy+UyKGO
         JbyiLZjN1NxFebsrqwJXyg9efwKJJwnuSARI3qDsHicak/Ucc5QrrpP80e5d4UbwfM/F
         5R4SHgha1Sk0kBybe+JfpyolZIiDtkLzpR0HxSKSdtWbph0PK3LFoLdhLtrTS9K5KKyb
         448YPD3TqysPD98/t/BWb9b2ZW+toext6bTfvWf+Bv73N/SRbk8OQGy+NTyxRQS7F3Wb
         Rq66BJx3GnhwPYxxP7jbgapRvZKFUJdVROJhZX1JpPfxeVhFERAWcQl50NxkcXp6mHWt
         r91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749253; x=1796354053;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
        b=fV8YDEOZ049JuBSBOijI9k6dmn4W2DU1kGTCNToTDO2zC1lkGdRTOqJrH9DvhNZXSq
         Aha3AYBPpbftult3D20wGS6kQ2gi7pe6XKWK/hPpcxaEHEeUjKjgcUQrHr7ggeqj4NjE
         v199uO5FyDbNvYQGTM9Cl+IV1W+A8XiK6ZCorGogecsKtk8dlnILHuqUfEbwNuyqlCNu
         Y9352yHdlvI+kVAzokKS/IpA5YrX8cg7qdfw+9SUP2umo8SOMGgVJ5i55j0DgdK+YVun
         T5Y6zJbzCUCuXLCaNGDDycPXwu2gsAhqr2tGr+mqq8Wrt7Hi5Su82APRSZACDcE4jniQ
         z49Q==
X-Forwarded-Encrypted: i=1; AL+hErHZ1kpwLpVWsSCk4yhRSzUpvBFm9WIzQS9sycugRcaSNu7YlLHXQ4IRWp1NidIDrgXBusenUvGEzVQmkxFxoMCr@lists.infradead.org
X-Gm-Message-State: APuU4Z9oc+heh1CPGDMYqU0kAkVwfmtXYGOuennrq/SNPyxW0ucqh0Ru
	OlhGmZYi14ltamt+lq6jiIZpJ9SQIIVPaN/3cBa1rnTdsY2v1c8H8YSwiE8CcNJ2dK4=
X-Gm-Gg: AZFdTZdq0PjxD9jq8GkRLyrfasw59RUUW1508A2en/4k1SFYRANwShfDI7xR6d70MYO
	3PKeGvAWP0MpRFxMST1cDiVI43i5CYHIhOdqF6v3oyExit17u0V/z1liEON06GK2L3DDGutOzEb
	xMLMNgpkX2p8i1qEUowgGUkCgJzGgxmk3SEaqPsgfvXg8G2aHZkA5CNZ7MzkhNKEYAHkPajLifs
	BriqCqXoBlbcNo2VJRamlNDOh51uh7KUgyJsK14pXVKwQ1FFv5yDqHXtwQkjTucEAtE8XE7nEtp
	CPgHvqLBdCiXRt68cU1fIdM69JnIKWKLrA8uYnG0E2+EPgUOKG0ttLz9WdpCJj3JnXo3u5UN8Fh
	cdNBSsy9aVmAtgaG8ywd9oCvfWAdVKgDJdfki9YmfBusEMSVsdPxfop2f6thIIqvGVX3UscueMI
	ohCW/YI5UeV6TLKkzvdR1Y9T3JgiBWl7DIAw2rEX/AmwBSMsywCpjWrrnV4H/rsaxBxShq17cuK
	Pqp4/g1Ty4Gi+Q4VgIvrBotM6i9mDxUQJwLJtGT+FDTzAEdXmz1C4KoyzCSZUaQeLjVHn3ZbbAz
	/UPVxN63lSvvaT2GP7pAchkkXdNXwubwCdRNuRRGYas++ThbqDFOVcQ=
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr3894266285a.8.1795749252644;
        Thu, 26 Nov 2026 19:14:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::5ac? ([2606:6d00:11:8ec9::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm1733363985a.5.2026.11.26.19.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:14:11 -0800 (PST)
Message-ID: <1f649c8c2c08c31f1f6ff7d7a17ea02301d89579.camel@ndufresne.ca>
Subject: Re: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa	
 <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko
 Stuebner	 <heiko@sntech.de>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Date: Thu, 26 Nov 2026 22:14:10 -0500
In-Reply-To: <awanusdfmrjYpdHT@m3>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
	 <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
	 <awanusdfmrjYpdHT@m3>
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
	protocol="application/pgp-signature"; boundary="=-KBWr4qryrDMK+mhbuy3u"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_191414_294091_19BF2908 
X-CRM114-Status: GOOD (  18.55  )
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

--=-KBWr4qryrDMK+mhbuy3u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 novembre 2026 =C3=A0 10:17 +0100, Sofus Forstreuter a =C3=A9=
crit=C2=A0:
> On Tue, Nov 24, 2026 at 05:16:47PM -0500, Nicolas Dufresne wrote:
> > Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9=
crit=C2=A0:
> > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-core.c
> > > index 922cf74c4eb8..384ff77771ea 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > @@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *fr=
ame)
> > >  =09 * According to the spec, tile_cols_log2 shall be less than or eq=
ual
> > >  =09 * to 6.
> > >  =09 */
> > > -=09if (frame->tile_cols_log2 > 6)
> > > +=09if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)
> >=20
> > Shouldn't this be 6 too? (log2(64)).
> >=20
>=20
> The max for tile_rows_log2 is derived from the spec (6.2.13 Tile info syn=
tax):
>=20
> tile_rows_log2 =3D f(1)
> if (tile_rows_log2 =3D=3D 1)
>   tile_rows_log2 +=3D f(1)
>=20
> This is also what eg. gstreamer does. I will add that to the commit messa=
ge.

Thanks, note that I was also confusing AV1, my fault for hopping codecs tha=
t are
similar but different.

Nicolas

--=-KBWr4qryrDMK+mhbuy3u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawj1ggAKCRDZQZRRKWBy
9DsUAP9PRVkjRHpiRiSLgzM8l9UhjnS0sDzgmwo4BJV1vzvvAgD9FAmOhu7fqhJ0
E9UOn92W7ZLiKmduKFmpzDXkPI9rEQE=
=QqIL
-----END PGP SIGNATURE-----

--=-KBWr4qryrDMK+mhbuy3u--

