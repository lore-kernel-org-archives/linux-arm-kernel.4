Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFAD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=caPlal5D;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTb1u+Nm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8tlyN40+7Qkubt+Fz9S4uHt3fLqvkl8zPBbV6YJWTAo=; b=caPlal5DZlI0sUi/V1tl96eDwm
	upYgF/vVjrnSuNqoRlH4EcafGTxM81w/R0le3gL2MzhqURnvu3cFPkQ/BkZFEIlZs2w12PBE/0EPm
	j0zPkJHINPx1nCqTg1jvONLgypS92SNp8Ttl/z1fUtYIBgaqBfW9X9/YkALACk9k8FXy7HHHLNW3t
	TFp+MXu03E4VdxwlIH+2FPm9IZfMYtmF3HAsf3SR24qfwlQ8ZPTpMe+qCod/+A4BEe+kTqoW6b6MJ
	Q5XAX8rrZzA4CjAqCG4KLHIwUafVrxFPjvWC+LoVRwCbB8C+JXMXWUlNxHQ4lddrWqa7VbLN/VlEs
	F2atqUhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWQC-0000000467H-1QPn;
	Mon, 23 Nov 2026 15:57:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWQB-00000004677-01Eu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:57:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF01E41B71;
	Mon, 23 Nov 2026 15:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0071F008B2;
	Mon, 23 Nov 2026 15:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449454;
	bh=8tlyN40+7Qkubt+Fz9S4uHt3fLqvkl8zPBbV6YJWTAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UTb1u+Nmrdi5Yh8tOqyRuQfy/U1vNrfIzK093DF4CmwWZJYfM4yTJ5E3GRnlpArCG
	 UKGrU9Sbmep1TMn93hhi180d9nH+DFlUR4cLaBE2fY2MNUgK8Q500JD1B5QuACTVV6
	 7Lh3+zv8IndoNEYYahvhuzjlOuowvTjpF1pPz+zsby+eyC32UQm9R5sjwnrFwULFwo
	 FHg1q1SjCXwJ38lzD51LpLBizCTi3PH0kBmqRz0WTxV4hHwME9r2anHp4zeqjGGETh
	 I+5hy9LtJWP514Fq1HNg+yBa+gCq9osa+Ll1nXBq8TW+BX1N2q91OX3n6GWL/CEeG0
	 2BC5bzQ9XFNIQ==
Date: Mon, 23 Nov 2026 15:57:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 6/9] arm64: sysreg: Reject an enum value not written at
 its field's width
Message-ID: <aabfdc59-8f37-4573-9956-14f077274d3f@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-7-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7/fkz7ZJG6AWevJ1"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-7-fuad.tabba@linux.dev>
X-Cookie: Truth is free, but information costs.
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--7/fkz7ZJG6AWevJ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 07:52:16AM +0000, Fuad Tabba wrote:
> The generator emits each enum value as written and doesn't check it
> against the width of its field, so a value wider than the field defines
> a constant the field can't hold. The duplicate value check compares the
> strings as written, so 0b01 and 0b001 in the same field pass as distinct
> values, and the rule's pattern, an unanchored /0b[01]+/, accepts 0b12
> too.
>=20
> Require each value to be 0b followed by exactly as many binary digits as
> its field has bits. The one enum written otherwise is TS, a two-bit
> field of TRFCR_EL1 and TRFCR_EL2 whose values have four digits. Write
> them with two digits, which leaves the numbers unchanged.
>=20
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Mark Brown <broonie@kernel.org>

--7/fkz7ZJG6AWevJ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEYmgACgkQJNaLcl1U
h9CNFwf/YNeLN46QZ/8fTDBpDox7PAhAxy/YFSdH0aX5xpsxry/XZ3zcL4wXBwk4
4yz10kSaD4fxpPK4sSLhtF2JIJs9k8HllEjxbbsu3SHnxbgH6nQyO2zI9sooeL3a
3C7PFlpifQ1pMj+NWN7ecK+a+Nwj/oqILFcRHBEeBNDRpK2ueRvCBdA5LjDIxWEe
ddRIQnMKZe3AaZ/hOW69CW6rZ/MFZMJyXkoVV5t2UBgubA1kVh5+WK5cZds9xEB4
WHEFGiuo1N42Mbjk3KrGN+NFXZBzqjSVNiek4XWAOfFX1081bzJGY+Xp9dKN0rSx
fO5SsapAeGWrnohmXacu6LdpJJHjug==
=YhFc
-----END PGP SIGNATURE-----

--7/fkz7ZJG6AWevJ1--

