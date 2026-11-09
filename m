Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B5C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 19:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IxrBC6Jk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IYUVVpaQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PvK1FBUlQu92e+3qOO46yvXvWJ6xY3Ch9e+qtHZ8ifM=; b=IxrBC6JkO6sWNemY+9sndeSqZq
	2f93sdEwwjpsTNEgkUP4pn50ITUE/d41U+tyl8SGLB9Jyby4DCWTqfVT7Pj8zLvRrIl6AusFq2Yu8
	JyCUIiIbz8l+HCSE1IIL5pwj92lcrvEL7nwxPa8cPg5UxQJGXQ5IrAdfL0d/vVDrlmMEwfMINRlhA
	PduXwAbtMsSvNEWgjTvuvzeN8nvpnsp9i0pMzMmppVryf1kFeD7sXPRz4yVHFgxZ0HJrMBjtPGAL5
	qBvVTMCUpUykio4vLnX3LiaAobyida/+5PvxL4zZDoPDS4ee6E88XSfj60LV+ebIDq5VFQchjBaDG
	8lhO1mag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQV2l-00000001XyK-3TxQ;
	Mon, 09 Nov 2026 19:28:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQV2k-00000001XyE-1N4W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 19:28:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B79260F4A;
	Mon,  9 Nov 2026 19:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A741F008A2;
	Mon,  9 Nov 2026 19:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794252517;
	bh=PvK1FBUlQu92e+3qOO46yvXvWJ6xY3Ch9e+qtHZ8ifM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IYUVVpaQejpurCnmiYSSdzB7QEEI0r4B85C8K76h9yFnNJIPW8dxlBgo8Gf4RbywF
	 912hcLYLrkWoewMKDW5nvpzv1yqTIW7T1NnukrfgH/RGFu6tU7g49C/aBzA1eoOU2+
	 Xco6d23rGLqJTWskOkobA8dwadTfpbw96TxH97fHifLyMitYEsxHmuiVhiazCf2XGq
	 tvK1Tu9Yy3MzftA4rdouKVLkIgY13lIQdoTva7UujOM3xVVABeA1nHBEtYJelTnwZE
	 m2SKA95aBi7aBeiElZpEqK6RW3yOxjRmRh0thPi4BYk2+J0Xe+HNRJeyQXbyck8mT2
	 a6f6ciRegoZLg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 54E2F2FC6B1B; Mon, 09 Nov 2026 19:28:14 +0000 (GMT)
Date: Mon, 9 Nov 2026 19:28:14 +0000
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
Message-ID: <2d13fbb7-b5b4-446e-8709-5b43349ff19a@sirena.org.uk>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-22-aa6c4d9603bc@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/fHNA9/ObvvJyqoU"
Content-Disposition: inline
In-Reply-To: <20261109-kpkeys-v10-22-aa6c4d9603bc@arm.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--/fHNA9/ObvvJyqoU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2026 at 03:58:47PM +0000, Kevin Brodsky wrote:

> ---
>  mm/Makefile                               |   1 +
>  mm/tests/kpkeys_hardened_pgtables_kunit.c | 200 ++++++++++++++++++++++++++++++
>  security/Kconfig.hardening                |  12 ++
>  3 files changed, 213 insertions(+)

> +config KPKEYS_HARDENED_PGTABLES_KUNIT_TEST
> +	bool "KUnit tests for kpkeys_hardened_pgtables" if !KUNIT_ALL_TESTS
> +	depends on KPKEYS_HARDENED_PGTABLES
> +	depends on KUNIT=y
> +	default KUNIT_ALL_TESTS

I'd also expect to see this added to one of the KUnit config fragments
somewhere so it gets run as standard, though that's a little awkward
given that KPKEYS_HARDENED_PGTABLES isn't universally available.

--/fHNA9/ObvvJyqoU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavIezQAKCRAv73Ows9A4
ibK2AQCrJzPayeKs4GAc3zkVW3UwqtkA+D8a/edVfuY3OR/2bwD3XTl245dfPaNz
6bNpvbbPF3MhEBTENHBe9r4fl/a7Bw==
=iCAm
-----END PGP SIGNATURE-----

--/fHNA9/ObvvJyqoU--

