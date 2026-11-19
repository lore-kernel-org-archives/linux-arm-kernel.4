Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE1C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kDgWDiNS;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=foNL6Lik
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KfDm1ombW4h++zCNnSHkepgC1bowgwnhqlH8xoC2Q4M=; b=kDgWDiNSK+OqsfT6VrhPS1sf+4
	sQLWcYe8ZwAOl+nxi13yFaF+MOSNJ2AmbfzZVJIYEj2qM7FXQMehdza4hRwWWO2JcWmWtLwipKKsh
	4Ge6eOUOW+nunh3qZaUScFe0u1Km7aFUmySTZT0T/ES4pJWYMliT7MYlzvPKuFiif3M/yw+zGS8eI
	aDyeoII+LgDqYz6ZuqMOmX9pkvGF+nZ6NLKUAXXWJi86wI/KuybiJr43yXgiNuoC3+92zNMHAoY+4
	uyquqs5F5lUMfjOoIoXnrbtrHtnrh36HLuTr8uFdhxuetkmJW8XfiIYgu6JkXkBF8NYjWIpuDYs+V
	UivVlW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4ZS-0000000CZHm-3izd;
	Thu, 19 Nov 2026 16:01:10 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4ZP-0000000CZG3-32lH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:01:09 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c4d28f75d62so414314366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 08:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795104065; x=1795708865; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KfDm1ombW4h++zCNnSHkepgC1bowgwnhqlH8xoC2Q4M=;
        b=foNL6Liky63WmgynSmeK2resB3WR93fzYet+vaUB1Ketbhj3jgpBF7545tKNkEEyCT
         5Y+bekrQobhN6vb7ZZ/pLXAXes/M2t9FT6wd3dqYjheP/VmnQs4Fdcw0FPTS5/2DLgIw
         Otj0YpLd0SxsjKUpuKDyEmshrR5Xvt+I4aL9kb/U/xCQ6ind/cThe4S7VWyW+ooy7gBT
         KTHIMhkG+ZLsmBp6ezYtPSkl8o8PNVzBXzxr7WuXDfxnpFav7NrI+Qj2f7BTkbyJ0k22
         kY3Zw3LEbUXo42/0ItsTyBJa7dMWbD7+W344qO85vkdbmI0EnG17ZZpsQdNo1g/X0gij
         qgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104065; x=1795708865;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfDm1ombW4h++zCNnSHkepgC1bowgwnhqlH8xoC2Q4M=;
        b=VVhiMV+0SIr8nMn64uhnpWt77njUUc8keGyGw72NdzCk0cmPBB9HbBSg5VNcqnvLvx
         IlNn1bhmc3O8jadNkVyEKU+IoyaJq0s2KTCcESgPPSt2WpqSlBGGl4SNE7xuaS3tPh1C
         n0PiBfILaitxLgRDwZRlINhlAsVXjwMoxQ0pwzrykswx0HM7/J6cIsbqpOQBBOVRDQU8
         OnBmQz03VkQIQCBCeIVfoN6qIV+sgAr5mIMC2OMbMBzgp7TLNxXcYd6hdMjRzKz53uD6
         pWfNTpDl29ovFhx0KXLoqgpimNYQfxH/0eeD/K1HpJ7hl77+VqXJEH/Hh+uUZpfDMT5L
         49jg==
X-Forwarded-Encrypted: i=1; AL+hErFxvzOYos3Ybj/atjvUt49E1KGV8Msi2IvFDGMbsPQU5dDvMef5umIGRgz+TwyUQonIBojFjNLHZjSS89/0FIKi@lists.infradead.org
X-Gm-Message-State: APuU4Z/e9Tcx3CxhxyK/11Aqf88/LBxRY65ywrZqZ5RLHIgtMamCRX55
	5gk1t89P3o+Id+85oCzCfl00Lqbayf6/It+uIp5ej0xIIkSja8MQwwQqedhqnrNQx0w=
X-Gm-Gg: AYBFou32RhQXgoa5/zvr2LKU+zgIxQS5JbTDEgz4HSB5Ry7RCEyVJAA8ODIYgUIrQyo
	f9GO+nvNgckkpO72v4P7JvFKysDgvM13Oy9spRxcjbVSliqoYmJ7sdxPuHOdpIgL0DYY5EcPuEj
	iwS5kXzMx1/+KvfyBh/Zpxv2j4zCy9z4xzD8sAKSvi0jImHo1zNLklDp3umcblxkjQUnFuF7NZ5
	3Jyr4+/Kq1XjWg6+P3c1/fI+hAr4eg28RPQ0mpwFgJV3eDLTWad/LubmpnE8cVWO/TFeStUTwhh
	IFlmVR4Uj1/FadgninzQPsTUdi0YyrOHRgrQE1SElPmjhDNTlDun+d497n0UmINpTNpv5g7JwR5
	iyKvCTu0sDxQ/QPEGjU1tpwCL/rNvYr4tYUO870Pr05DUHs7mssojgHwxg00y/tE4Mo/lSPYGF6
	fcInX7rMxP65jZmOQqx+i1LeY2dobkZy5L7728jc8v9otkhtFcJnNifxS1jW7nduC5BUfqksj7g
	SR96orMyIPcTJGPlN+HyyUTgZP7ryU7K8Ut4yXLtmDHMOHI4Qjv2B+gLqt7Sryy4l/c5RHtyZw+
	d6640RBubnJq7SVHYqSHai64UWlf5a6gP1GCtUSvV+KmTN9ai58oinI=
X-Received: by 2002:a17:907:a4cb:b0:c4c:ddd1:cffa with SMTP id a640c23a62f3a-c513ab48b7emr32560666b.29.1795104064176;
        Thu, 19 Nov 2026 08:01:04 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee81sm9308166b.66.2026.11.19.08.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:03 -0800 (PST)
Message-ID: <41e428a6fcdcf3d0c10cada8743231797b3dd5f4.camel@ndufresne.ca>
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sascha Hauer <s.hauer@pengutronix.de>, Sergei Khomenkov
	 <shomenkow@gmail.com>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
	 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 11:00:59 -0500
In-Reply-To: <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
	 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
	 <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
	 <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-sAMgqgjjNcbq4UuGGMyk"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_080107_945075_F2F0C09F 
X-CRM114-Status: GOOD (  16.16  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-sAMgqgjjNcbq4UuGGMyk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 18 novembre 2026 =C3=A0 14:27 +0000, Sascha Hauer a =C3=A9crit=
=C2=A0:
> > Would 3 bytes per pixel be acceptable as the default, and as a floor
> > for smaller requests, like the 2 bytes per pixel floor in 6/7 of your
> > hantro-based v1? 4:4:4 at quality 100 would still not fit, but the
> > subsampling is not known before the header is parsed.
>=20
> I haven't been affected by this issue lately, but saw it when the series
> was still based on the hantro driver. Yes, I'll change to 3 bytes per
> pixel next round and make that the floor of sizeimage. Would be nice to
> have a proper solution for this rather than either wasting tons of
> memory or risk having too small buffers.

The hantro HW can run in ring buffer mode, that forces us to copy, but I th=
ink
you can then perform decode without actually having the entire image in RAM=
.
Would need some experimentation. We probably don't want copy to mmap + copy=
 to
ring buffer (double copy), and V4L2 read/write are deprecated. Note sure wh=
at to
propose really.

Nicolas

--=-sAMgqgjjNcbq4UuGGMyk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav8dOwAKCRDZQZRRKWBy
9HpfAP91JjxhDbtoQ02FbQ9AFuc/QS5L4xa8oYqNcrceAeaDzAEAtc4iVSLgSAv/
fkehBAsK40dvdlTFZHBgCbrfEIFuTQ0=
=0Ehx
-----END PGP SIGNATURE-----

--=-sAMgqgjjNcbq4UuGGMyk--

