Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8693F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uTO4Eghv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZWIygTuW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gtytf2wOlGKlE0TlreFVP+6q1oQ0wXhrbpcwMFr2kqE=; b=uTO4EghvlvvsO1vhnuc+7Fr9Ae
	Hk/muOH7CEaLrCgjTZt6gcpeJ4oRzCG0f2xhRxRbat0G1cIeNYaRQtX7BB6JxyjK7EkAioUkleXoM
	6QHTXfvb1hLB3MzcGfOtLpvBroBj94Hn5FvjkjGr6rNgm8gdffRicJx5nSw4oPz4+b6qgfkT8iAAz
	J+SFn2IuUvvb/UQt9dznC0OgXHHr4CZJRSGwB1FzeUp708vXalJDD6PT3VWnUXqvDqlCAFstXBiNl
	wor8VrJ5nPd/8CTuk3tt9XUm1GtvL5ZM0+1KGU2mmo2209qFHW+vK45qtsEJVEmWKDldq5T1lwKYC
	ud7E1y1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjxu-00000003cVd-2BSp;
	Tue, 10 Nov 2026 11:24:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjxt-00000003cVK-1Ph6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:24:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC78941B63;
	Tue, 10 Nov 2026 11:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADD91F008A3;
	Tue, 10 Nov 2026 11:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794309876;
	bh=gtytf2wOlGKlE0TlreFVP+6q1oQ0wXhrbpcwMFr2kqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZWIygTuWyMwrCCyWkgY7RsSrCDlQmRHjE9kDJJY9fgSKkW2X7Pzbdk/3g7E0JGGJj
	 mqde4QNo0dOhsy/Gn071pmagJMcFwkMHNEXlNvvPDwwp10eksS4IhEBAyNpcUUHNdg
	 03xRBW6p5vKfHW+VjaiwWf0yMYhOG5dztiwt7IvW67IkhnjAYpK1fJnR6QatxQkKpc
	 Z9tzO6sREiDZhnO+fEx9KNcU9tT1MGR+831DZvlJFymsBcBH7mSmiB/bkiRKz0KB+8
	 QOgrK4FV4ntU7mrjA9MLzJxXq9gTVW21ij/97aJSimoh+G1ihBNJeSIJ5pl1uTAFQi
	 BezOJm2/uzfMg==
Date: Tue, 10 Nov 2026 11:24:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb+git@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	=?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH RFC v10 22/22] mm: Add basic tests for
 kpkeys_hardened_pgtables
Message-ID: <717cccfe-81d6-4e09-a466-5361ae27776f@sirena.org.uk>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-22-aa6c4d9603bc@arm.com>
 <2d13fbb7-b5b4-446e-8709-5b43349ff19a@sirena.org.uk>
 <9e59fd71-97e7-422c-a7dd-bc23c6e6a852@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qb3IpGrfHJvhxTh/"
Content-Disposition: inline
In-Reply-To: <9e59fd71-97e7-422c-a7dd-bc23c6e6a852@arm.com>
X-Cookie: You can't take damsel here now.
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


--qb3IpGrfHJvhxTh/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2026 at 10:01:36AM +0100, Kevin Brodsky wrote:

> Do you mean adding the dependency KPKEYS_HARDENED_PGTABLES=y to
> tools/testing/kunit/configs/all_tests.config? Indeed that would only be
> meaningful on arm64 (for now). That said it wouldn't hurt other
> architectures, so happy to add it there if you think that's worth it.

Yes, or something like that - unfortunately KUnit checks to see if the
config options appear in the configuration so something that vanishes on
other architectures causes issues.  Perhaps the default for the config
option ought to depend on KUNIT_ALL_TESTS?

--qb3IpGrfHJvhxTh/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmry/tcACgkQJNaLcl1U
h9AxJgf9HO+bESqmb7Zyf8xVpU39o1ESgrk4qSe8omR1YVn15bXCLHubG4BA7k39
BBRjIUd0oKzcXxtFkuIyZLiQ194uaRe6MuOfoI+Ruzd2qjgzTlq18s/CUQYd23um
xjtw1Rb5Vj5ruXGAwkuBosPG2vqzM/kA0ruLkQQ1lknx0wrk4buAsFjcNPjsddup
ZjuRO6lSuXkDYGYG8l64ReC2hWfMTDKifeFbf0EMisifvHZ0dEmDf5Y+uJiG8l0v
fQU+vj+TzA5V1SPmj9DpyTfm2wWwqpbBgxyuE1eOOj5Cj7wZ4Pz+fHhnfcmklIiL
arkt18G1049QM3sfXwdWCKF3B89YVw==
=yf2T
-----END PGP SIGNATURE-----

--qb3IpGrfHJvhxTh/--

