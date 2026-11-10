Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF34606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ng0uEgYK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSgH+nQG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4qaBcoJhuip85HNRKTiRsc6cXmbUnKal0wM/bMhZ1/4=; b=Ng0uEgYKPbm4u3mly1eLo4rwuF
	vC/i1aqVM+fUInLjHThZS1ArKSoWEnxuOGhO9Gh6GKdR4En9gHIV2F8RLAA/tiFNGaohrMFgHsFwN
	kdckvrxuTHLzPiYG9b4/MhilyFlOJO6U0W07rndE4xtkHvNIzoPFQvd9H/+q0vYcTU5032T9R/k2h
	OZC9sKpFH5Ve99h5UyRao4Njy/N6D53lHcCI8cBORNA4XpUTpghAv7bOnlwfF11dFWq8B8cAsZ9fj
	nIoMMIkkL1N1vtDaNLOwwdY7nky/jfZdZGJjII+z245tueRb81+ezBoNpBajEW7772e8a0s71WRoj
	bo7BBurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoAJ-00000004S8H-2UZB;
	Tue, 10 Nov 2026 15:53:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoAH-00000004S81-2lNM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:53:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FFC8605D1;
	Tue, 10 Nov 2026 15:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B92A1F008A3;
	Tue, 10 Nov 2026 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794326020;
	bh=4qaBcoJhuip85HNRKTiRsc6cXmbUnKal0wM/bMhZ1/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kSgH+nQGYPhpecDT9RjX6A/Px+LoAnOuAhiSotnuroSbtWAmzKYW4psaCtAgm3HTu
	 Ud6V+EHkVE3/ElaMQwFldGXubSt6xnnZ/H3lgzIXO1EM8FVi1btcbv6Q58NdTqn5kX
	 VSwm6LEMTkaplsK5V9TVhOGb77Pc7h/AvO0sKyFHmtojeCKTH7meWA2i2lB3xJQORv
	 LLCXQjH6SckaZOufXYpZi4+dMGxI7LRSKGENk099kRFe/hVqBoPU2XdsQ5DcgYensD
	 /N1jMWwlSmjxHjQj70tuBOg1mUKeFDv3uHaSqSd+3wj7rolN0iCh/5JK3PXXFiZxS4
	 +LKdNCB+uEhVw==
Date: Tue, 10 Nov 2026 15:53:30 +0000
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
Subject: Re: [PATCH RFC v10 07/22] arm64: Initialize POR_EL1 register on
 cpu_resume()
Message-ID: <be361be8-c5ad-4ff7-a6db-7b0815bfe1d0@sirena.org.uk>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-7-aa6c4d9603bc@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y6i2pjiKjCxCKcN0"
Content-Disposition: inline
In-Reply-To: <20261109-kpkeys-v10-7-aa6c4d9603bc@arm.com>
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


--y6i2pjiKjCxCKcN0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2026 at 03:58:32PM +0000, Kevin Brodsky wrote:
> From: Yeoreum Yun <yeoreum.yun@arm.com>
>=20
> The POR_EL1 register is reset to an unknown value after cpu_suspend().
> Since POR_EL1 always holds POR_EL1_INIT when entering cpu_suspend(),
> initialize POR_EL1 with POR_EL1_INIT before cpu_do_resume().

> +#ifdef CONFIG_ARM64_POE
> +alternative_if_not ARM64_HAS_S1POE
> +	b	.Lskip_por_set
> +alternative_else_nop_endif
> +	mov_q	x2, POR_EL1_INIT
> +	msr_s	SYS_POR_EL1, x2
> +	/* isb can be skipped since cpu_do_resume() will do it. */
> +.Lskip_por_set:
> +#endif /* CONFIG_ARM64_POE */

cpu_do_resume() will update TCR2_EL1 to enable POE again, a sufficiently
unhelpful implementation could potentially decide to do that before this
POR_EL1 value takes effect AFAICT given that there's no barriers.

--y6i2pjiKjCxCKcN0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzPfoACgkQJNaLcl1U
h9CfMQf+KE7tK9rhq506LXhS8qhdHDevtfZx2qtai6oaI8ROe6CSxZZ/PYZX/AxQ
RB6TsZs/ebSJ8cn//ARFNZTWaspOHI13wG87Laj48QjwPVZuyBAE0MV4dlqlxM8S
SUaN2cQ+xL/+x75htSgmDnA6NBZi/NXn8Ln2hpoiO8FO2oPSFY4l4xT9lMCvlol/
4g9degQsFMatI+eteIErPUBMjUrTr+jpSK6zC65gIHerzlhXvpQmwro7KV4njpMZ
zD2uA/+8YKidz8WAbiX8M9XETgaqWCGaTex5RrzWMqls1c0DvV4mFFlewowBTtEl
CC0tUcjeb2jQhyVBZSQ3m48X0DCWPw==
=ZUNG
-----END PGP SIGNATURE-----

--y6i2pjiKjCxCKcN0--

