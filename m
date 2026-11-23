Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3206606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2hafpl9J;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJ3fE9Ck
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rWt4jkvX+aDqne3RPrhkEcisiXzoZeGXKrtROR1UN4Y=; b=2hafpl9JhMafWffu06n4snLEbl
	7I+O47UKPZ9/Rqih/gzc72JQTZhhfWuWg4012aaYJstvhtferbqZneoial84GTbL+lCtPVeeObgXQ
	rPEm7fugjbrm6DRcwj74xpRdqyps10dWTZm4UN8cVpIcF6uniw2I8Te9PS+HQaAYXDKjrQc4ICJer
	r0XEs99x8eZr3s/qCNBZEausSDyIJzH1uLQYwf9nZApuqQcwefrMrQetNRie4sd6xNMvL6P3o+xXe
	brTgttUAliIOHKmglwmkBavERe5g6MPWglseUDStd97L2wj8+CUN89lKhmWCkKW7Xsx7u4URHdjAb
	sacps58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZtx-00000004iPQ-2WXS;
	Mon, 23 Nov 2026 19:40:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZtp-00000004iGj-11yV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:40:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 703726149C;
	Mon, 23 Nov 2026 19:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82641F0093E;
	Mon, 23 Nov 2026 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795462823;
	bh=rWt4jkvX+aDqne3RPrhkEcisiXzoZeGXKrtROR1UN4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fJ3fE9CkrXPKFuoKH/Bi76N4hh0MjlZDcgzkP4Y5L+4Ktwnyx4ASX6iATbBzc8Kau
	 mV0EHo+7wAETspFf9Bzb/JfApxJj5SBh0Y0FtoMijGIgUClpj3OVAOKGLQyaCKGs50
	 RWkod1zJS35j1mlAFFeobfKYAC0sYylIUW9LvC+eZBVwNp6USOu4kzVyF0sYzxnHhV
	 eD+oZRp81HBHTi+IznMVqwYZBQsiGMxtXrsiL6N2ZmWwp3MhCv++cyKEPoyhWHXcu+
	 wib3c8x+WopDTbchB1Xfids4V8+e536q9OXfaTGuzSF2cwi54f6bfQHD27v+fUM5gN
	 Oa7x3mYsQUoZw==
Date: Mon, 23 Nov 2026 19:40:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 5/9] arm64: sysreg: Reject a Fields or Mapping line with
 an undefined target
Message-ID: <5f2e0fbd-95f9-4349-8db9-079ac02adb25@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-6-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u4GOULcsuVh2ieqU"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-6-fuad.tabba@linux.dev>
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


--u4GOULcsuVh2ieqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 07:52:15AM +0000, Fuad Tabba wrote:
> A Sysreg block can use another block's layout. "Fields X" names a
> SysregFields block and "Mapping X" another Sysreg. The generator emits
> the register's RESx and UNKN masks as X_RES0, X_RES1 and X_UNKN, but it
> doesn't check that X exists. A misspelt or missing X gives macros that
> expand to undefined names, and the build fails only once something uses
> them. MPAM1_EL12 had such a line.
>=20
> Check every Fields and Mapping target once the whole file is read, since
> a target may be defined after the register that names it (MPAM1_EL1
> follows MPAM1_EL12). Either kind of block defines the masks, so the
> check accepts either kind as the target of a Fields or a Mapping line.
> Give fatal() an optional line number, so that the error is reported at
> the Fields or Mapping line.

Reviewed-by: Mark Brown <broonie@kernel.org>

--u4GOULcsuVh2ieqU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsElqIACgkQJNaLcl1U
h9Cv6gf+LopeoyCZ/hE1CKI7NNJOTF/QI2dwVp7OmYRtHEp9e6D8bT1muSASYpuB
Xyc6Qt7DnUw5tqjcEfFVyuPYMx2kGckLoJi6oH1VpyF0gNU8av46tjcSYecEo+2E
/u7sQtH6IZ0eSKGrvSEvKk4VtIpHHtjU1BLeNPL/n00yaGADVZsjfANnZSqk/Q4/
UqQYkGT01RxzMUkuGYZxDBkfos1zQ3P+Qp5zU9+9M9mU04EKdj1nntMRJzhkUC0Z
5m2u+I24zfI51GjeKNq+mOxd1xNjHIJZBMeABeNjmYseO4Z2xqgMKGLUsVcxLMv6
Ggar/2fQxkzrh7Np2HKRhF/bhPwqMw==
=d5xF
-----END PGP SIGNATURE-----

--u4GOULcsuVh2ieqU--

