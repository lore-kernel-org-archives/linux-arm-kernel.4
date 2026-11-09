Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339D4606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 19:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OQR75/8G;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BmO+o8Yw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tk69RCXJ4JaOIbMK3KeZoLSVjm+8nLQpAcW55aQTGbE=; b=OQR75/8G/leMujzsGlyEZ4xDDY
	V/c3vSZvHwK5FNBc24Ha5XmjvImVgcj6EtPkfvaOyORMWm+Wbj1jNi/H6WuLyI4WM2yCn+p3i1ZgY
	5Q3mep5Ny3kV7smLPHbbqBH4PBjunLcZCSEMhv9GOdNHXWMFS+4uDMtLslXq4EKD2EMzYqv9NaJyn
	/B1JFQ+/zyd8hDrx51JQWGYmZgfwWpIfy33mHZgX0qh/t+dE2QU/KUAKGfsgldvm8RvtH+c7jDF+V
	l5St5DQ/QqwJZUKLgbkqZJJXWDJl3/1kQoZNBA1VQ7argGrdwvQSs9mfFd9TqZGJO0S3V+uI0FnZr
	1VNlYl/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUpf-00000001WsF-0M9C;
	Mon, 09 Nov 2026 19:15:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUpc-00000001WrT-0K40
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 19:15:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07E3D41319;
	Mon,  9 Nov 2026 19:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB741F0089F;
	Mon,  9 Nov 2026 19:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251701;
	bh=tk69RCXJ4JaOIbMK3KeZoLSVjm+8nLQpAcW55aQTGbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BmO+o8YwkI0wgHfluo94vzjDl1/lACoFl7J1+cZVRoTZ2t3eq1K5HPcRVPQG5NSpr
	 440VPz4hgTM02ogqp6/fXZ8G47CE//97+WD9iP1DsTUKTVTBqpnuYUqQSPCferbBAh
	 shuKHOA2c3PWGHU/tIHmznrV14UTkOGBcJOc8mXAtwSpihXaWZ/pqdfqLK4gEX7Mvm
	 ibKQGIqavJyjNUApGqRADjTUPSel5maFQ0wlqMTT3gnsiq+DgRxMSyIZNSoVDwOAJ3
	 t2J6ICUt71rKyHKlBVuZJHdHtLuith+tKyRXtDMhK9SJA7aFt8YjTQQyUMO+OoC9i7
	 EKTsNBgsNCt5A==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 09BB72FC67E3; Mon, 09 Nov 2026 19:14:34 +0000 (GMT)
Date: Mon, 9 Nov 2026 19:14:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] spi: convert to subsys_platform_driver()
Message-ID: <e86963ef-6080-4aa2-ac80-e06d16d9b092@sirena.org.uk>
References: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tIbwpgXee1lY1kQF"
Content-Disposition: inline
In-Reply-To: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
X-Cookie: Whoever dies with the most toys wins.
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


--tIbwpgXee1lY1kQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2026 at 07:33:07PM -0500, Brian Masney wrote:
> Reduce boilerplate code in these drivers and convert them over to use
> the macro subsys_platform_driver().

This doesn't apply against current code, please check and resend.

--tIbwpgXee1lY1kQF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavIbmQAKCRAv73Ows9A4
iX5jAQC/EiR/1ajwM8H0n9zTYy99v3sEUpJFUk/08dJ5uBXvUQD+P2OZE/0s0rfp
7m7LZ5cuHXzq8dxBrlv8+sHYg7dliQE=
=oXE+
-----END PGP SIGNATURE-----

--tIbwpgXee1lY1kQF--

