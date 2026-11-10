Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C2A60A383E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O4WX5L8U;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TSJs0Dw0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bt4p16M4Hn7px1KF+H5JB36BxwFxJbfBsjU1XaPYy7I=; b=O4WX5L8UddH8ZvjHVcH0hMxCnL
	6PHv09UHaYfbuzjqkCXV3EBde2W0DmyHPQjaSd6UZk2ld8QxNIaWi0/fOY3Qc2BP/tDjmj9pqFPVo
	E5VcsUodsUidT99/GMh+tyBNkZvduCIaiDT6LPRFI2QmM7PzEnkhBHSeiEympOtBS0kq0O1i46tno
	Zd9XLgQmJ9W5hT/WWIoeTzXZ7w5O/8sBhdRULZfNEmzZrY9WYgQ0mHffJF/srypPvQwd0kt5FfK67
	i8fg+mA8bp7abQNYe24MO3gaVCAyx6aiKfYEfdlKnKkIddad+WbuM5NbvofEHs/4COoyxRLYGWMYP
	IMMJPoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnmk-00000004N4e-0Rlx;
	Tue, 10 Nov 2026 15:29:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnmi-00000004N4F-3ug1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:29:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6013443BD7;
	Tue, 10 Nov 2026 15:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F8D1F00900;
	Tue, 10 Nov 2026 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794324560;
	bh=Bt4p16M4Hn7px1KF+H5JB36BxwFxJbfBsjU1XaPYy7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TSJs0Dw0xyOaRnZl088l0F3yIjGw4rU/H2At2c8xdDHdp8SerI4hF6PCuWS3HEruj
	 fQCx/eJIQmjee38K0kl88oaP09m8oPFuWfb0SN2hdJzERKh8HBENPPbNq39MNh2UPZ
	 6LUEoOgWA4i1YTnY9oJO82udks6VcVjN25+VrrtAMglfx6zUadZkKlzvwnivvOYNaB
	 65uMmDKxwsnbXEjB0BONIyAxG3GTaI7iSmzK/z4wlqJSwCXkSd0psBWDyBjr1GYhQD
	 0+xb/kDbfockIG1X6kXknznczMF7Drsf/dASORnmaQY6SbL3ZRlz28lUCakAsVrTFc
	 ordjZse33Ca5g==
Date: Tue, 10 Nov 2026 15:29:10 +0000
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
Subject: Re: [PATCH RFC v10 06/22] arm64: Disable EL2 trapping of POR_EL1
Message-ID: <3500936b-4177-4ba0-a9df-7eb9d9d75b0a@sirena.org.uk>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-6-aa6c4d9603bc@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nrZdJCOCfevRaauL"
Content-Disposition: inline
In-Reply-To: <20261109-kpkeys-v10-6-aa6c4d9603bc@arm.com>
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


--nrZdJCOCfevRaauL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2026 at 03:58:31PM +0000, Kevin Brodsky wrote:

> Make sure EL2 doesn't trap kernel accesses to POR_EL1 by setting the
> nPOR_EL1 bit in HFGRT{R,W}_EL2.

This wants a matching update in booting.rst as well for when the kernel
is booted at EL1.

--nrZdJCOCfevRaauL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzOEUACgkQJNaLcl1U
h9Ag0gf/f9f5XP+mPu/qkq9MsiAddVfTPO5cBvZan8qUxzXzuilhA54mF0WCZWl8
+Fmzl+Q0J4gwxCKcr+yCLoOyMvLGiUCFQVnPcJT7wMBqrZ5DA5f/OW6YWx6uMZyT
ExUsefodnzmOczU+s41SARPFGFuRuJsT756diQQYF/IlO8wq0GJ8mWoBGKf6H3OR
BKFwnc4Cda3sUrlQ5UU1Y5DRXoHpQJe2+dz013uXt14vDmtxE8P0840PIRU+Y/F2
zhXRtj08uReTLuyfCpkD2RuiPx2DKigEDjHND7yPRfuiA/qskHTAtBBtxtRcXoNc
7EjgnbeiJeosuSBYcCi5CS+h/Sh4Jw==
=osnL
-----END PGP SIGNATURE-----

--nrZdJCOCfevRaauL--

