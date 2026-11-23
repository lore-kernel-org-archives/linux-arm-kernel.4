Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40368606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QqJKBUsk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WBD0V4de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hzS4w5tk+gpP4Q2NMUst51stis15Ur5c4oCHLdwtSy4=; b=QqJKBUskQlj7djncaxyiG4lyhA
	HJbtZHrujRLg4FKGqCOC12nxZIl2sxz5US8ItK5FAvU4NprMDyCrIigvkBFam6qJ4e8zb8k/tOndq
	+XqvWPPB268De8j4RncWch7Nm6oxHxIC/NzyDgVj2cKw/lszHKnI53rPgTpDpxlJp/NRgZ/JJ06b0
	MYQ/oF8TzgQQHnvTUZTYEwJ7JvE/DeBNg5b+NckQAK+jSAjunVN1Vi91kdkZlvJAiB+NHDECzbCfH
	9TmDsbFXV3W3ogfUDxZ92/Ylw5ib7ECHaVx5XcbOg7eVCpdqYBke3lLsWqjQTHQboyH0Dx16JB4Yz
	mh1Vdz9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZm2-00000004ftI-3Ogp;
	Mon, 23 Nov 2026 19:32:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZlz-00000004fsZ-1FXb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:32:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2BA545781;
	Mon, 23 Nov 2026 19:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11111F000CF;
	Mon, 23 Nov 2026 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795462338;
	bh=hzS4w5tk+gpP4Q2NMUst51stis15Ur5c4oCHLdwtSy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WBD0V4de2ZrcPyEqpVzkAi14634UyyIv5EMHRvL9lIK0/CfDYBMQlaSY90wT9AoSg
	 5rpIN0/DUwuT47Mjfmc9OfGDumAa/xdtRzcuXHKd37GsC4BYjPqoqPN3bDEoStN35S
	 OCF0KvBDt1y1Z931+Er+8YxwJKbzJTiXFdgkJZm1DnEqRlYysJp84VdKLH5V8Wrc+B
	 wBuCP+7hv8KCKF7JQldFDy/8SxIDYfPZ/ZDm5E/JIbee4pI2rG2BKF23H+jWIsApk8
	 JxILWIhaE/JxDpr+gbC1aD7I26Tl1X9CWkmWfDIk2Z4Er+eJdXK1z7Wbb7YvFuOZQV
	 Wiun38xScKdcQ==
Date: Mon, 23 Nov 2026 19:32:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 8/9] arm64: sysreg: Reject an out-of-range register
 encoding
Message-ID: <3f72896f-9da9-4408-ac66-21ec1dc0e8aa@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-9-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D+tECgGGNOmnrsxN"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-9-fuad.tabba@linux.dev>
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


--D+tECgGGNOmnrsxN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 07:52:18AM +0000, Fuad Tabba wrote:
> The generator copies a register's op0, op1, CRn, CRm and op2 into
> SYS_<reg> without checking them. sys_reg() shifts each into place
> without masking it, so a value too wide for its field spills into the
> next one. SYS_<reg> then names a different register's encoding, and the
> build doesn't report it.
>=20
> Require each of the five to be a decimal number that fits its field (two
> bits for op0, three for op1 and op2, four for CRn and CRm). Reject a
> leading zero too, since C reads such a value as octal.

Reviewed-by: Mark Brown <broonie@kernel.org>

--D+tECgGGNOmnrsxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsElL0ACgkQJNaLcl1U
h9Digwf+Ob/6mMq0Hs0/SGUQMSBkiDCsJJu1H852n/og/5QQQhniSNYJ7kltLSEe
bx9qAXYwDHfrZ+XL8RHVjiOUMywCunYGBC/ZUVpf8oKFnRTTrGOpvqTStnFdbJsd
yaSSFwEb0Kp2zc59oop/Gtje2gpjtjAGFtvrM0WBRzPqAqPy1oDLEhdy1TjWyEVr
7dy/tHvXXSfleRpp4uJ/UHz9pQozGIfi0pvVO4Hr/QwJfjuT/MsWFRlaLHJxC4Fc
1Iwbf3KQnJNc7KVh+WNe4+eVWJcy3W8wJ7/qVmwQvspUWrJmw+ZyBti7LX0mckWI
NpuL5XhVH1D9nQHY2EMYBDDsjntd2w==
=p0Z2
-----END PGP SIGNATURE-----

--D+tECgGGNOmnrsxN--

