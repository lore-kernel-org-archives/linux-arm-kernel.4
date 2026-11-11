Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105A9606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cLdCG7gA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXRFtoMu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6VIZ3PtCdrmMEOv2W4/v/h0FEesRkpl7sdLewNtxWW4=; b=cLdCG7gADPcuvidtsdC6IiTMh+
	/oZGoZpLuSn4ckEAb3HJ5hL7queXOMOaj+oQ/8/0dqrIsMBsatXPttOiecmJH6ar7dKU03M9X5AeL
	mcvBH1nsPE8J3w3scXmeTzukilJm7FuLG2TdlswvPNcQaenFfZfx+4rcEpLeE/O1ORBGbF8l2JsEz
	QEH6mY5A90CFYhnOgrN+OXWXopnqxwzdoOZ3zk5OwrqPvKb+mYOVcVU2WmhsRSYVn8Y46r6R8xiXT
	6RVMpjRAxZHwySqhhv9TsVGKWxtAkV4n0sRDgfy8Fk5OAPj4nW3kQ+FqB571RBlvTleARfxgnTq+7
	lnXX/pMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAz6-000000079ar-3By1;
	Wed, 11 Nov 2026 16:15:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAz5-000000079aN-2sWD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:15:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DBAC863E0D;
	Wed, 11 Nov 2026 16:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE261F00A05;
	Wed, 11 Nov 2026 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794413738;
	bh=6VIZ3PtCdrmMEOv2W4/v/h0FEesRkpl7sdLewNtxWW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MXRFtoMupiT3qJYgXy2sB5augkLgLy01qRPMNW45hSF9TkcmcmWYGEuV1Vz8rWyW6
	 0ooJ3PmsQeytlwlshiRdctOVUiFAzHmpWyxKu9nbUHJdynm5l0dpxSF3+fMGPvTAtl
	 h5Wrl2+XF/DcnC0+tpUiX1ybjfuL2oM7cFwCwZpi+3ORaDY+l4Ad0P+yIjIazHFrIA
	 YKx6+GKltenDm8orj9uCHBo4Wv2y5lbssOY/NWJ+aLstSRAD6AtSBoYHk9V08IH3J8
	 /HJ0P69c8aNYZzrVMV0lGp4+KJ7N/z8bUp+urrmmHsLr3Ll0KkVI476EDVM0DHH0/9
	 +L8aD2xMGC3+A==
Date: Wed, 11 Nov 2026 16:15:28 +0000
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
Message-ID: <9deffbb1-75fd-407e-90cc-59bf4c2fa1a6@sirena.org.uk>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-22-aa6c4d9603bc@arm.com>
 <2d13fbb7-b5b4-446e-8709-5b43349ff19a@sirena.org.uk>
 <9e59fd71-97e7-422c-a7dd-bc23c6e6a852@arm.com>
 <717cccfe-81d6-4e09-a466-5361ae27776f@sirena.org.uk>
 <0b29393f-bb84-4df1-a699-f7afcb50f2e8@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OedQK9JKFipfKU6l"
Content-Disposition: inline
In-Reply-To: <0b29393f-bb84-4df1-a699-f7afcb50f2e8@arm.com>
X-Cookie: Do not pick the flowers.
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


--OedQK9JKFipfKU6l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 11, 2026 at 04:29:02PM +0100, Kevin Brodsky wrote:
> On 10/11/2026 12:24, Mark Brown wrote:
> > On Tue, Nov 10, 2026 at 10:01:36AM +0100, Kevin Brodsky wrote:

> >> Do you mean adding the dependency KPKEYS_HARDENED_PGTABLES=y to

> > Yes, or something like that - unfortunately KUnit checks to see if the
> > config options appear in the configuration so something that vanishes on
> > other architectures causes issues.

> Alright, I guess there's not much we can do then, short of creating
> arch-specific fragments.

Or my suggestion below, or come up with some generic option that could
always be there and would in turn select hardening things.  There's
probably a case for having something given that the hardening features
will tend to catch some kinds of test error but that feels more config
fragment like.  Another idea would be to teach KUnit about the idea that
it should try turning on some config options but not worry if they're
not selected.

> > Perhaps the default for the config
> > option ought to depend on KUNIT_ALL_TESTS?

> Not sure I'm following, the config already has default KUNIT_ALL_TESTS?

The config for the test does, but KPKEYS_HARDENED_PGTABLES which the
test depends on does not so unless the underlying defconfig turns that
on the test won't be enabled.  I was suggesting also adding a default
for testing.

--OedQK9JKFipfKU6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr0lJ8ACgkQJNaLcl1U
h9Dq7gf/ZN2+f02DNQ9bdbwTMYXtyyu+7wCmjXUlHCsNgO5GlbWut9+uS4GmuCc9
WunBOQc+J/oUb1xLrMkgaxOW8h2KAztK6MPg8BzPufhwZctxuJ0HsBbUgTgnmHpc
uoZtu7URTziUz+kLkGEIB4+6a34aEQiW4SYdu5Z22jWqmT4vxb9JIQDA0e5V/Roc
hg2/qulDP5GDSotg3oHcwqqbXrxt4zvb6Z2fKdAZUJz3zc8gon/WHyqUXgJHRVOn
bFcpqtPEyz0j7rRAyFagwJ42Sq2SRDsU/qjaHb8Hne1OK9cK0DSMMlCJ3Lf/+sx3
Dk0E+Do8vqDs8wBZ0lCJuKqAtRjyng==
=+B7J
-----END PGP SIGNATURE-----

--OedQK9JKFipfKU6l--

