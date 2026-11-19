Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB0D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=44fiderJ;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=On3g1GPJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HjlB70ziaFFzKVojaweJGR9z0Hpe0lR9xVGQfY7mO5c=; b=44fiderJU7z+8S1wrD+h2ZPyIl
	SEfqCbGm0/vxzErd5aVO0ZybdGFoN2LnyBXFOgr1GxSeDjcj+42Aa0sVax1l+kESRxAwkuF6cdJZf
	+Frpmuo2rcUH+icGmax8xWYjYIeHHtgyidxqJuHlcp5/VtXNULlPbf0pnorGxyqpz1GXvPtc1jo30
	zVW7vOHyskyMH51pI07ccm7UaQyhm3Adq58GHQMQ+FAe+Mfx3eoBjQwDiEBitMdxh2yiwnEnFlYe6
	5hl9rEWohLB6uEUKvVWgsMChaOY5b8136puSzB3C9XerhtwpDVgRnnggxyyuEijmv4wfRD6hGSmry
	bxB94ywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU63x-0000000CrPs-0zOz;
	Thu, 19 Nov 2026 17:36:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU63t-0000000CrO5-3tXq;
	Thu, 19 Nov 2026 17:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795109799;
	bh=70HVZUPGqXMKV09Pe1d4tr5mwBcytmv3D4PnTjpYVnQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=On3g1GPJlxtQfX+Jx57i+sm3y4dKIBmJa1fgolsQzyPI0gJWeEOYBVspwIFTUnBO+
	 WiWbq8yLJmn7dkVoH3ZwjdUccAyNVtTP9GRuSkVH40PvmlIxI0OUqrZ/I7b82k3aWw
	 uU2EKz2sfBTQ08XJbt8yCvRW5GliZuz3nHp/jPTwneaeFBLZetxZAvTvCfYR7tFA8T
	 QPhNeWzuA8+ZucVPIlc11qKTLm5ikTood3Kwt62yQXfi4dBnEQv2aRamv3Fy9OHTeM
	 MKigir+Kt6//kFNwN4EPtZ24AicR9pkkq3DvnC3UjrtoO3mreeE9mv4pdjq0akWc30
	 jGpeGsCOEDT5g==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EB6917E0406;
	Thu, 19 Nov 2026 18:36:37 +0100 (CET)
Message-ID: <d3eccd8c04656a46287a221b3b4f22427b21a74c.camel@collabora.com>
Subject: Re: [PATCH v2 3/5] v4l2: export v4l2_m2m_set_max_parallel_jobs
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, 
	kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Nov 2026 12:36:36 -0500
In-Reply-To: <20260810-rkvdec-multicore-v2-3-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
	 <20260810-rkvdec-multicore-v2-3-986f89d22cdc@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-HbCW1HCFzZ2LrR708RNR"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_093642_139418_556F8D3A 
X-CRM114-Status: GOOD (  11.88  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-HbCW1HCFzZ2LrR708RNR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 10 ao=C3=BBt 2026 =C3=A0 11:22 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:

I know, its straightforward, but its not even signed off.

Nicolas

> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
> index 14ac9c85803d..f6f8864f23d2 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -128,6 +128,7 @@ void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_d=
ev *m2m_dev,
>  {
>  =09m2m_dev->max_parallel_jobs =3D max_parallel_jobs;
>  }
> +EXPORT_SYMBOL(v4l2_m2m_set_max_parallel_jobs);
> =20
>  struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
>  =09=09=09=09       enum v4l2_buf_type type)

--=-HbCW1HCFzZ2LrR708RNR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav8zpQAKCRDZQZRRKWBy
9GK9AP98G/5cb5mSz5u+GfGt5pvGOBzzHSnYuGWZ68fzUnYjYgD5ASll1cl3d4qB
A0xqVBk1WEGNmWwBqXyfwlPLaxtdzA4=
=/Xbu
-----END PGP SIGNATURE-----

--=-HbCW1HCFzZ2LrR708RNR--

