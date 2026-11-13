Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BC5606A8A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ftq1wIxS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqCUiSpG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6eOjhLOcX7Bv8sWhvREEGpmTmpCGHPEaE+aEgOt23XQ=; b=ftq1wIxSJ9kV6uDWDzWSRPNebU
	0tNLZsPbgw1zdL0032FAkClUBWzrueqRtpX2KNKXD3BzKKMEv6QP9OzAKKyOUxiAgLhsdfdaEV/JB
	keqkWNOtMKIcjh5BvtyWjKIj1i1Iul0BP3eBSRnTK3A/RfMb6friTk1WewDqrVmSK9Q5GaDEDYoYv
	0cKLmjJk3if4e9vcMz7zraQubQqUPKwToEZFK/b8j+G8wyYfqDuC0qMvZNW5dOxl4QO2ZKZrFg0ro
	E+aAyvGmv5X5wKEaQGuTFBx8eMgjTtpgbgcyc1Sc/J0GCvMnblZNrghi3Aljx8M5HBW2+ApWlgH0+
	JA/RU75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyXC-0000000EXsn-2xQ3;
	Fri, 13 Nov 2026 21:10:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyWm-0000000EXbb-1jLe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 21:09:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 039C144F20;
	Fri, 13 Nov 2026 21:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3F01F01833;
	Fri, 13 Nov 2026 21:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794604183;
	bh=6eOjhLOcX7Bv8sWhvREEGpmTmpCGHPEaE+aEgOt23XQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nqCUiSpGxbHUSiczAUVv8s3WBnLLog8MtDYzaia8VJOSPs1A20eO0lDDUfbsw3AWG
	 KYEgBs9ckxGaA2r7wdDrMlBeVrPq8X8eh3mkfs61wG9T01TUoB8IML3HaAfUPu/U3k
	 FAnrErQXGEBL8xkVlROZnlvFQkdYChMO41TcTGCMHCPHq/fKU1H1xlL8Kmxb4eEHkl
	 HdSlvnmJaAj5OVt6WG+k7bT0SUy4aaoGKXjQYww28Fyt5LaPslx+2mwZf8mctiUuT/
	 SP9S9l9MPqo+fwbwwFoE+fjjMrnx9H+vPpkXv+JvcuDU1OrJIhMHq3nyhqfC2Qg7h2
	 aKhgWMZc0M+qg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id D62E031BCD1C; Fri, 13 Nov 2026 21:09:38 +0000 (GMT)
Date: Fri, 13 Nov 2026 21:09:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	stefandoesinger@gmail.com, krzk@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/24] dt-bindings: spi: Add ZTE ZX family SPI flash
 controller binding
Message-ID: <d21858d5-70c3-4c5c-afa5-ff0bd3e6afac@sirena.org.uk>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-20-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RhwkDzC4iL2Rric6"
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-20-ghahramani.navid@gmail.com>
X-Cookie: When in doubt, lead trump.
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


--RhwkDzC4iL2Rric6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 08:20:59AM +0100, Navid Ghahremani wrote:
> Add Device Tree binding for the ZTE ZX family SPI flash controller,
> supporting both ZX29 and ZX279128S SoCs.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

When submitting support for a new platform please make the base series
for the platform a *minimal* series, then send additional drivers for
the platform as separate serieses.  This makes things much easier to
track, avoids confusion about how things will get merged and avoids
DoSing people's inboxes.

--RhwkDzC4iL2Rric6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavd8kgAKCRAv73Ows9A4
icX4AQDW7X4GJZGS91gcQnmi5cktf3ChuG4n1WJrZdXPKnjMNgEAls22Dv2oXK1s
xI0aJ5KhbZkYCNWWpw3IctuvFu6a/gI=
=eTNj
-----END PGP SIGNATURE-----

--RhwkDzC4iL2Rric6--

