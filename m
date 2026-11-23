Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F76606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cJZGw4OA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ve62QMcv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bsIdwJux2CDGy94qqQRvPfHr2bHaEifh/4QwhpwKeB0=; b=cJZGw4OAu1U/SDafXQtB6Ovsnh
	0fCCOrFx5rG4b6rMzojPxNlE8kZpOt8lnl5w/RCcHUQZgvFbnsJ2N/xAfP0YbCrZpwK+BD+duBQm1
	xhHkWUTAcRMkaT5USBWoMOND5J/LDv9QGzAnwNwNQx6luRInI18QObNHpSVu4u6tN2KkupcrC63Kt
	twfpwqbRCXsEtbOo6aqXLvFLy9DZ9RWLO0Vo1vmxQQ9bMmARExI7SmwFeE0bSxNtDhTa3bPQZyL7x
	CNNZJ69tmlrfgyehV1Sgs0CY32B/0JHDk/weRNs0GkC9bU/iyYoxqs31FgDOvo76spSS4ibNteZs/
	7Fk6WJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTh-00000003qQV-2OEb;
	Mon, 23 Nov 2026 14:57:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVSn-00000003prz-3gj7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:56:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 86CFF4086F;
	Mon, 23 Nov 2026 14:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83C71F000ED;
	Mon, 23 Nov 2026 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445773;
	bh=bsIdwJux2CDGy94qqQRvPfHr2bHaEifh/4QwhpwKeB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ve62QMcvcNmW5IsBQgXp91N5mwMjRF3jwkTeKlNmvt7G5Um9s5dLPxxhlEXuusPjh
	 anrqq/3r3PXatcQRXWerLCUiYHURpfTqmNkr2BHMAyae/bI8xKlFKRrTXEsaB4bSOr
	 jKyFwuGPrpeLV4S9D5+N6VrBmeDegCfu+RwFQY766mT/idByxySmvGd03DlO6YX3hi
	 3++kVjs0j2A9UWq3lWBAaE44znY9C9h7P0Y4zQBtZQ8iX5Yog6wYkgp7ZjIwp86brU
	 BAy6eTPi9c4Wta0tKY/1HWaiGHzlOtbdvVxnsqYbZOFQ7dotUUeLsiqsePNnKg//lK
	 hzRjb+q14p6Gw==
Date: Mon, 23 Nov 2026 14:56:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 2/9] arm64: sysreg: Remove the dead range check from
 parse_bitdef()
Message-ID: <55bbb1f2-3211-46c5-b9ac-29085dbde2c9@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-3-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EhbfqxCr+9y4XgGl"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-3-fuad.tabba@linux.dev>
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


--EhbfqxCr+9y4XgGl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 07:52:12AM +0000, Fuad Tabba wrote:
> parse_bitdef() ends by testing "low > high", but the script doesn't
> assign either variable, so the test compares two empty values and never
> fires. The "msb < lsb" test just above it already rejects an inverted
> range.
>=20
> Remove the dead test.

Reviewed-by: Mark Brown <broonie@kernel.org>

--EhbfqxCr+9y4XgGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEVAcACgkQJNaLcl1U
h9Cw4gf/Yz7m38uN5HVSvq6TBArXkcKn+Q2/NXRuRsHMAQoVzIHkI64+wlMyz5N0
Tywqoee/LnGccW2jfrqIyg6ZHyutd+tB0HlzoRo8hiSuZq5fJKsZNlq+oOiuKwvC
kueuipZvy5isobvlRYus+os2HZY4iSB38+Xqb/tr1sTCeXh0pJNtLIKACHek9if0
yR+0QB18uY2NKwWfpn1UfQS0K8m9bxBZSBAp8kqpTPwhc9Lmarw4gk/Si9RS2VDD
AmMfEjapxKbz6SSW0gOzaSdbt+R6g1dcl3xsIvlQuRLevdl75s/psvqvVfN0p+JA
88csfKhJDkCHCpzo+rVF7qZxt9lnzA==
=UN5H
-----END PGP SIGNATURE-----

--EhbfqxCr+9y4XgGl--

