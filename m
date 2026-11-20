Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2FB606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GYG9asDE;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lwIbnNya
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eJ5BpJRw2McaWgy6GPAJWhZZHCtWtK9atUe2DqC0wZY=; b=GYG9asDEsPtzzn8rQImBpNel+c
	PPg12nLpr896HqxZ71ermVW35AS1f/I24JuIp4l8TsHxSG1NIh8VML+q7KkSAlhjSrY6fZaWw2nUU
	dmu8joBqs+l603WOznyjRb3DMwX1iMMv43SqmzMgL7Oujb1YHYJGTgB4F+62if0qte4MROErTZkAv
	AgxC1SncMA1FR9FEI8DUvnMUMpIHhxvvCUrFKZnGUBgcTG9j2pkRwo4YwvrA7LLCQMd3E+/78Yf2w
	4NxIyj9zXWs/2toUdGNYBei76a8FSQwr85ONhJ5XUJ6swPyXzi1GNwJ7FGinljwvXmDhEyRcZZcEV
	fXJvQxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXff-0000000GNH2-2jIe;
	Fri, 20 Nov 2026 23:05:31 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXfZ-0000000GNGE-425H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 23:05:27 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-55d360ca878so12355001cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795215924; x=1795820724; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJ5BpJRw2McaWgy6GPAJWhZZHCtWtK9atUe2DqC0wZY=;
        b=lwIbnNyafnK5JoBLxIAEol0o1rSKEacYyM23h9fgndG0ujy0ZMFpTs9XkYg7Hej+qk
         UAtVa0KYVjui7sWZRl/8yoQTMQG6+1SEYHio9XZskmHmSnfn8nZeUc5/Tf44rKB0JYg+
         wytgFpmAhZZv0ECZdMB58WfffJ746TQ/AydBAQXDCco+pXw58F1GGvCQQZ4vwpK/q2gi
         ZEODFtCwSrtWgvUxtRpW473e10XC/wSo0gqR2rUdkaB+hZ7/9OR0RnAGUd/Kp70EgYgm
         luUjjGSc8vaEEpfRC2GwVBQzkT3IVvEMMbnu2QpWPlQfnxx1p52aWgvy9pbH+cQFTGd1
         uJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215924; x=1795820724;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJ5BpJRw2McaWgy6GPAJWhZZHCtWtK9atUe2DqC0wZY=;
        b=FksvoKlEX92iZ8/xXwADHlLzSSYjG1EsXVYkYeKNKSq5rb2QvCO0UK96FlHKEe23n8
         eUXtJc339diBNWXHK4l984oJVm37jScNXWg3/u2Qdg2Xkbk3V62VCpVK0MtOlxwvb6bn
         yZ+JnkJ32Mo24RP2pPmt426QxdHHekBCYT57HHhUVRDWcLJhwsJHgg/n+wv6FpUoqCFQ
         wY7AxFINWymUVG5xy1B6X7HJXSai2W38XzKughp5XZAq5OaKpHZHiX79laA8EXOzPf3P
         5AlSAFHukBVrzgaPdlwFbBKyQ0W1hS30k5otq71qGGAslz6vQOf98GeEifuINtgGZRmE
         Thpg==
X-Forwarded-Encrypted: i=1; AL+hErG3WcXtqbCINDIL9KumvhBse/R1fxfhlQFg0p+dJDKU3k4asAZyDk3UVQvRfxq4HlsPSEiDWwnrRboFrco06YHW@lists.infradead.org
X-Gm-Message-State: APuU4Z+FSTZvnH1c3CnuO93qyLD6kMVw3J7l/gCa7MfWMbVa40qoKP6H
	AlAdfNj7nF1arvcbqdPBDefYLt3MDYVoCb0Vl1cFbYLqlQyBcVMaWLCzlcIA8Hh/GBw=
X-Gm-Gg: AYBFou0AI1IuV5NP0zk2A6Ycd/j243K6d3DzV4iuQNv2qsOYdP/G+XhRbt4dYQcSD4y
	wORZiGDU9/50wW2WbcYut454RffxoQ1xDprMJsb8oGX9GN5xBtRmNlQWIZXrP7DHV/ltprWKlhm
	A2DDFeGdkco5haJdbvUIQ1ue5800qPRL3tvpiAxgv0Wf1BDcxKf/Lork+gSupEwWdGs+QQaiM1Z
	XaC9WWvlJWdlYdPhrbPfxDdiQfZ1tckeMcG4oGznXqHSvNORVX3tXJirY0ooZeoHSSy7WbEXMu2
	5CsY0BzySPKrsLeA/j6KLqO5kC5hrxyjYutSuAStB4oA5ABrzLCeQw5LNbCfuuOQ6vk6UmQjyOX
	Ug0BUz3OCuldGjWBR7Qq4BmBge8i7qtCQ3M1KevGtJckmyl/S4/1djqekF7Uqv9KiKoXA/K4lZq
	3ixmu+tva0wpEcCksq5qKf/L8dn8bp4ZluBCyCf5XwN1IdEVXAHh+WuhWW1D0aEMUFvrRxCUSX6
	w6kQwnmWCOXtulT5wkWjgnlU476BxhMtYNTWXLa3Auys2/r6lGa/mlYp6vPYExe8VevxbijCZJV
	PGcFdbb0V4r1B0RaE372KNhquXAEOC0zliSQlExeSkIg8Nbiov0yMIA=
X-Received: by 2002:ac8:5cc9:0:b0:55d:36cb:d2f6 with SMTP id d75a77b69052e-55d76994ab8mr78951971cf.8.1795215923589;
        Fri, 20 Nov 2026 15:05:23 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882bf70sm35229321cf.11.2026.11.20.15.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:05:22 -0800 (PST)
Message-ID: <c328eb172979255e0998fd126db313651a471d7a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkvdec: Use dma_map_resource() to map RCB SRAM
 buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Lukas Splavec <lukas.splavec@puresig.cz>, detlev.casanova@collabora.com,
 	ezequiel@vanguardiasur.com.ar, mchehab@kernel.org
Cc: heiko@sntech.de, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 18:05:20 -0500
In-Reply-To: <20261114094916.28744-1-lukas.splavec@puresig.cz>
References: <20261114094916.28744-1-lukas.splavec@puresig.cz>
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
	protocol="application/pgp-signature"; boundary="=-mVFMrjNK4prCvdK9IMd/"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_150526_020222_3E278014 
X-CRM114-Status: GOOD (  12.93  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-mVFMrjNK4prCvdK9IMd/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 14 novembre 2026 =C3=A0 09:49 +0000, Lukas Splavec a =C3=A9crit=
=C2=A0:
> rkvdec_allocate_rcb() uses the CPU virtual address of the SRAM buffer
> as the decoder's IOVA and writes it into the IOMMU page table directly
> with iommu_map(), bypassing the DMA API. Only the low 32 bits of that
> address are used, which falls inside the IOVA range managed by the
> allocator. The IOVA allocator does not know about this range and
> considers it free. Under load it hands out the same IOVA to another
> buffer, e.g. a capture buffer, whose mapping then fails:
>=20
>   [   66.930512] iova: 0x0000000082100000 already mapped to 0x00000000ff0=
01000 cannot remap to phys: 0x0000000168231000 prot: 0x3
>   [   66.930674] rkvdec fdc38100.video-codec: dma alloc of size 16588800 =
failed
>=20
> and decoding cannot start.
>=20
> Map the SRAM buffer with dma_map_resource() instead, so the IOVA is
> allocated by the IOVA allocator and the mapping is created by the DMA
> API, and release it with dma_unmap_resource(). Without an IOMMU,
> dma_map_resource() returns the physical address, so the separate
> no-IOMMU path is no longer needed.
>=20
> Fixes: e5640dbb991c ("media: rkvdec: Add RCB and SRAM support")
> Signed-off-by: Lukas Splavec <lukas.splavec@puresig.cz>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-mVFMrjNK4prCvdK9IMd/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawDSMAAKCRDZQZRRKWBy
9PMfAPwOi/tB/Jf87fecrO+PluXuT7royZvxIrCNZmOHBSuEegEAlBEB69ZnNtbu
KA2zhN0q8/7t1JDmNdzQt64epCy1WgE=
=cLZV
-----END PGP SIGNATURE-----

--=-mVFMrjNK4prCvdK9IMd/--

