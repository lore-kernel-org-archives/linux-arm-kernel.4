Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22778606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q8I25qhw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IKjykBdQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fxf+nipH1Cr8jDUljHcHSs5CO02bX7aKJ8t0CkTEBBU=; b=Q8I25qhwfsTRJs3d1zN905/Mwj
	zU4ks2vJmoX4YrhykE53/jyzXmSME2Yx1inahmcPuA97HctGlgPE/N4PmUT1TYDmHEXyE8efI2G6E
	NzKY+iL22JWEv+KZm1Bzd+uLsoM0SyY5atqjuG1AwlbEvrnVl3eHWNGIjtdcQrpQrff4JKRWNnqBY
	qaiKJJPLtK1/omvIjD/AXzZQ+rh8pG5HxwEx5vMbyKqjJBmYDTPu+fNmYr8SKB8vF/hHOsoRGJPAr
	NtaGlwzZEdtywpdCgVA/86jxQov+09Vzklj+7UvagIMkoOXn24GCX+n67QvEXMnJawsjLt21pdRQg
	NlKdY4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSNs-0000000Fgov-2SGI;
	Fri, 20 Nov 2026 17:26:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSNq-0000000Fgnh-0NO9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:26:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8874D62E51;
	Fri, 20 Nov 2026 17:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E69E1F000C6;
	Fri, 20 Nov 2026 17:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195604;
	bh=fxf+nipH1Cr8jDUljHcHSs5CO02bX7aKJ8t0CkTEBBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IKjykBdQKK6UW+SjhXzoKfCs3ox84evesRjlgzUkRt6YulvgkWsuJ7oWEVj3R4cv6
	 Fftdt/yPrrRSZUjOA9mkOAUBImSavMj2Dy6TuqPKpPUrulY4kci8BvV1clqgYYORo0
	 bQnnB7toxNM/1VekBdnBdO5GsKR4cy9Mc3ZM7i/IMuPOy5hr3JmsfymyfkU5WkCn2N
	 lB8b9+78K9kTag+XccBAZpKZq8NCcrmvZ0STC89Q4c0FGcFr9AF5/f+QkN07cB0XbA
	 Emr1tzs/OkXsPtIdltSMHc+eDGheLG67tntbcdN2m9XB32B3myFkLcjXLcO4WKUAZh
	 G1zd1xci164Ng==
Date: Fri, 20 Nov 2026 17:26:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	stefandoesinger@gmail.com, krzk@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/24] dt-bindings: spi: Add ZTE ZX family SPI flash
 controller binding
Message-ID: <20261120-unrivaled-prong-1e95735fe087@spud>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-20-ghahramani.navid@gmail.com>
 <179518848943.6016.16140133614242447239.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rjrmWXXpDlSqC1UG"
Content-Disposition: inline
In-Reply-To: <179518848943.6016.16140133614242447239.b4-review@b4>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--rjrmWXXpDlSqC1UG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 03:28:09PM +0000, Mark Brown wrote:
> > Add Device Tree binding for the ZTE ZX family SPI flash controller,
> > supporting both ZX29 and ZX279128S SoCs.
>=20
>=20
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.
>=20
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - zte,zx29-qspi
>=20
> This looks like a wildcard binding which we don't normally allow.

I figure by wildcard you mean that the compatible is covering the whole
family, rather than the x being a wildcard character. If so, I agree
that it should not be allowed. I don't really know why it is here, no
other patch in the series that I looked at seems to do anything of the
sort, it's all device-specific ones for the xz279128s.


--rjrmWXXpDlSqC1UG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawCCzwAKCRB4tDGHoIJi
0laKAQDRGnEKIBosOkTgcH+zt5RiPxDTs6KvjxZOxByJ94lB1wD/RN9YSoRwzHfG
KwRcBXW7isi8mBE1p07Uf0zJ4hunvwc=
=RCwU
-----END PGP SIGNATURE-----

--rjrmWXXpDlSqC1UG--

