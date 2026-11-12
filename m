Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619B7606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z1/gOPx+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GsBDW7jk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bav+dbiKMPv2EGpsaUAhorWs7PAXLzQQGUUajdSwRU8=; b=z1/gOPx+UVTYQsokACEykMl8ij
	J1y8duXUA8JTgfX29NJ0RnHjwbu+A9UkW+9YL5Ll8Wl/+Ge71kF6n8uiBxdkBEzgFxodXjOFCLHgt
	EyLXMD3TiTyNaHaB2vVATmvVZQoDjIyuwVhyhcGTylQIONhHngPS/cWwr8F0HSTlq+bUM8hXrk8aL
	TjPBX8AA+PCcVuoWQ5AB+2rbiZz59CD1/H+6ZSvvyFVDVPjH4LPJ6FF7TdQFf/Q6mUC1FG585N4Xe
	EBLmjjUKsQvjcHkZ9crXjCuwK4Lm6Beuu6MwIRjnjtfjvVt5l/7pdSmdXYGGAwYJZIlKxzVmEN8wd
	PVCZTB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVUT-0000000ACJV-0UCU;
	Thu, 12 Nov 2026 14:09:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVUR-0000000ACJ9-1zKW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:09:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5C6362D1D;
	Thu, 12 Nov 2026 14:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193031F00A06;
	Thu, 12 Nov 2026 14:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492562;
	bh=Bav+dbiKMPv2EGpsaUAhorWs7PAXLzQQGUUajdSwRU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GsBDW7jkZwGolei5OwviUP8YfwzZAxvq7dLne75yiI+QNaAhKCVLTXjTeGCmLawTS
	 A4BuUY4qYFLZc2UIeSe8ZibVZ3raDK3EiWH0ycSOieOQTKZd30GUVthpaI/jPpKmXE
	 Wgdc472S+8VsrgWtji6ZeAe/RPaxWsIfJC1/82UEevEwPBEUaYMPTiEiW5p8w08tj2
	 diQPmi5mPkydDsKrDYWdqNWZDO7b/pxth0rRA8iVyDuFGcZrrKai3IajCA/yKybHQE
	 h7ADR80unMaw3b73T/FJVgDl0hFOgO/3OgxibHF0Y6GLz2r/F3ctMavaZesf2EYRqR
	 mKlHk5hT9HB9w==
Date: Thu, 12 Nov 2026 14:09:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-hardening@vger.kernel.org,
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
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH RFC v10 07/22] arm64: Initialize POR_EL1 register on
 cpu_resume()
Message-ID: <0d12b173-ba74-4d5d-b1d9-bd441033ba6d@sirena.org.uk>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-7-aa6c4d9603bc@arm.com>
 <be361be8-c5ad-4ff7-a6db-7b0815bfe1d0@sirena.org.uk>
 <avNH_AdvK9AqvfF7@e129823.arm.com>
 <7b92f7c8-1543-447e-8ef3-aba608141699@arm.com>
 <6808f3a6-1c12-4cb2-a109-30704d812490@sirena.org.uk>
 <avW7mVh-s90SdUYN@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ORVk8nI4MBGvkiv/"
Content-Disposition: inline
In-Reply-To: <avW7mVh-s90SdUYN@e129823.arm.com>
X-Cookie: Baby On Board.
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


--ORVk8nI4MBGvkiv/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2026 at 01:14:01PM +0000, Yeoreum Yun wrote:
> On Thu, Nov 12, 2026 at 01:02:16PM +0000, Mark Brown wrote:

> > Possibly just have one before writing TCR2_EL1 rather than for each of
> > the indvididual features, that's harder to mess up?

> I'm not sure that's necessarily better, as we'd end up executing an isb()
> even when POE or other features aren't enabled.
> Wouldn't it be better to execute an isb() only when needed?

OTOH it seemed like we'd repeatedly omitted them where we needed them,
and we'd end up issuing multiple barriers this way.  But Kevin pointed
out that the second one needs to be where it is anyway so it doesn't
matter.

--ORVk8nI4MBGvkiv/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr1yIgACgkQJNaLcl1U
h9AwXwf+NHY6AAbg8csFjXrZMuDQdUMboaJkVfC+Hn1q5Gsm/gt8SqmjIwUM0/R3
MBiR8arflazFuvWDuOyqikdvaaggIetDiefUXzhSqBmVdUZSP5znX/cGchB3ATHU
r9jz5IaIKvtxnWr+m3uCzKwQgjqCSsq5uDNirluS7voueb/fqJG9Ff99KsgujR99
ush3ACE4LSyOZc7fOAr2h73OsMxJE9HG2pT4Qn45Bngd3yW4+kKaB4q8oWwin8nj
Pc2uX+vfLnh8hRLAbDxc1EOt5vLd+ws+QGxlneaX8NBf56pZWPWra4vvfJIVIqID
Fv8s1/jFofx3Fe/o4LjSia4hffneCg==
=1AlE
-----END PGP SIGNATURE-----

--ORVk8nI4MBGvkiv/--

