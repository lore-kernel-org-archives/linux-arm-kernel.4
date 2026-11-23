Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D81606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PSq910Ag;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kslaK79l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wxk7B7PFuan5joq/yVQKmCCEtznZSJrtGIEWSRbzgrc=; b=PSq910AgE9K6AXW8ICc7nvlukd
	m3MIMQ/BNbkZLED/EzxPC+psfC5w79J7OVu29QGY1zv8bOio2jg0yR7AUXH/ZtbHppX3lEviiCXEL
	maKBGP4Bg38nQSanKXIbqudVF2AqOBNnlyEUPeHZvJHz/chnVaWK1ednl/AaZXbr4/81ZGsdvedOI
	TUN43oTfFdJ1eXEgWxThXTKg03gCsknjociOduyUy/uSdYQhEi6lffP0n/JAUdkj14ZbO1U9yiP+b
	4b/l4UT5HfkXFYfjK29pZyIC1HU7DcSpVVdb816QblNxavUj7LTC+mr+MWoosyurXrhmD9H0noArz
	ivOwlpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVid-00000003vNI-0qpj;
	Mon, 23 Nov 2026 15:12:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVia-00000003vMc-1Krt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:12:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C17EF613AD;
	Mon, 23 Nov 2026 15:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA871F000E0;
	Mon, 23 Nov 2026 15:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446751;
	bh=Wxk7B7PFuan5joq/yVQKmCCEtznZSJrtGIEWSRbzgrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kslaK79l57T0qR5vGV7ELtGq37tF20pxUagzw41djQ0Ns4Doukv9rpls7mqt8RkOF
	 AAOIuDnrCCcxMLZn7lvfYNuKrN89O9Ezpz2BKjmq2TfMFQ+Lh374tpQkA8ibwKw/+z
	 rcufgsz3av5cTyJZAuLhqPrnN9sVIp/ixb/57Bsc4rdUFl/B5MIOzBCQjTpl7L/MPh
	 o6aekkUgQoL8UMiXKHb7kW36d200Hg+oDPyTViKe9jk4n/fjq4Jk7mv+QiT81s7Iff
	 rVK8w2e+cWQsaDP1bAzD4Gp08Q2bRv44fkRxYcqOT0gYCAkdus4gQEji1b4MNlj18B
	 rE8qNgRssmHuw==
Date: Mon, 23 Nov 2026 15:12:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 3/9] arm64: sysreg: Reject a Sysreg and a SysregFields
 with the same name
Message-ID: <9738c9a6-8e40-4fd1-900d-f348f84aa33c@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-4-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mZltvRBnIGYBvbfX"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-4-fuad.tabba@linux.dev>
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


--mZltvRBnIGYBvbfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 07:52:13AM +0000, Fuad Tabba wrote:
> The generator rejects two Sysreg blocks, or two SysregFields blocks,
> with the same name, but tracks the two kinds separately. Both kinds name
> their macros for the block, so a Sysreg FOO and a SysregFields FOO that
> each have a field A both define FOO_A, as well as FOO_RES0 and the other
> masks, and the compiler warns only where the definitions differ.
>=20
> Track both kinds of name in defined_regs, so that a block is rejected
> when either kind already has its name, and leave the kind out of the
> error.

Reviewed-by: Mark Brown <broonie@kernel.org>

--mZltvRBnIGYBvbfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEV9kACgkQJNaLcl1U
h9BFjwf/a+uTWOL2w2fGAih4ZFxCdRmDPI0lORk1uRY/EwUS4pTT6T95X55ZZsiq
DrfywqDojL9Rvq4UdT68snDIJYWp8atheiuYld4aYw9JSg473hbnG8Jpe2D+zgwG
FVWA1rZaYLwM7esW8BAYA99oTQOtyHsfNVWldygU1xWXMo6b2We++DTVshtSVab8
VeSzxcR8dTVVENeE6fA2lCfkYJLQmv67fkD/MRVP4qfbkMi2p2hTOnKsERENSWfa
UOG504rltECx6G1/OD2r6zEcoFG2OrhrR90nlXwmCYHmSQZ8Z0/zIv86aWHvqyE9
mluJtY5ZmxOBmBJZgBsa7ipz5uIYhw==
=m9OD
-----END PGP SIGNATURE-----

--mZltvRBnIGYBvbfX--

