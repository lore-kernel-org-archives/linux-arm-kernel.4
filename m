Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EC6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vAc+hGt7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFJiTkr5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sDb3YBsZt3PeUijZoHvx7wyb02CrjviLOfxg4rIAk+M=; b=vAc+hGt7Cd4M248zTRSOQgqIjq
	ln6O1EPRh3ythNH00F/GASdRYfVt7odQzCxErDMhKWNsiyuBQwxW3p9b2uU6H5vJNpUiqK44zP7/K
	HZzSUPn3NzKYZ/xq8/q2ydoaQNOCBMKKr4eVkHzDgmJd/Z+hIsDMkCe6VYqmU5rjg6nQZbOXacIU2
	Pxb+j2ZVVyduaPy4idBeVIBq7ObRMBg2N3fSHcPfAokmFF8bOF4iHDk4lSOcNuMaFWkcyOvuUnPJy
	N7mhH/DpMcnohnrNo3I+qxg58OP+BxJrlb+gs9HtatclBSZJs+5IjJs7aGAGJ/T5WJy9QhmerCoOF
	X92HbWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRURh-00000009wss-1iFw;
	Thu, 12 Nov 2026 13:02:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRURf-00000009wsY-3Qxs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:02:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9F1E406D9;
	Thu, 12 Nov 2026 13:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B481F00A05;
	Thu, 12 Nov 2026 13:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794488546;
	bh=sDb3YBsZt3PeUijZoHvx7wyb02CrjviLOfxg4rIAk+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oFJiTkr5drh1BtvY5o2xG9SbtFrLSayp52k7g32cCv+YRR0CLSNTOytMe5y6YJZnD
	 A3Ec3SnjYHkRM/LfaaukZbYC7tXR29Arwqny4tsBwitscyYNqHj6soAludR/zpNRif
	 DTiz3inDd+WROyNFUdmA5E/uaYVc7VwJDdOuLDXmIQ3H7eDF1lgEJrN96CaOYBGel9
	 EYjdlzRxDQUVciApvre1figz9FCSbNB8aMk3jNw/oilISn8V4z0fPwZwbhNFzYVovW
	 GME7WFgessJHRG2CJVDzRzDQ0wA4ZPHRpyzgBPxy5p72SUEQMcte6E2VW0TR3s7QLu
	 Lo3ciWbsVJivw==
Date: Thu, 12 Nov 2026 13:02:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-hardening@vger.kernel.org,
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
Message-ID: <6808f3a6-1c12-4cb2-a109-30704d812490@sirena.org.uk>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-7-aa6c4d9603bc@arm.com>
 <be361be8-c5ad-4ff7-a6db-7b0815bfe1d0@sirena.org.uk>
 <avNH_AdvK9AqvfF7@e129823.arm.com>
 <7b92f7c8-1543-447e-8ef3-aba608141699@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SwoWk60SP+6OH4EA"
Content-Disposition: inline
In-Reply-To: <7b92f7c8-1543-447e-8ef3-aba608141699@arm.com>
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


--SwoWk60SP+6OH4EA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2026 at 01:38:13PM +0100, Kevin Brodsky wrote:
> On 10/11/2026 17:36, Yeoreum Yun wrote:

> > Thanks. seems required to isb() after initialising SYS_POR_EL1.

> Agreed (as Sashiko reported as well). Presumably that means we also need
> an ISB after writing to POR_EL1 in cpu_enable_poe(), as that's basically
> the same situation.

Possibly just have one before writing TCR2_EL1 rather than for each of
the indvididual features, that's harder to mess up?

--SwoWk60SP+6OH4EA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr1uNgACgkQJNaLcl1U
h9CFagf/dbYYRxn1/SN8z0WGZlRKk0wplm+k3WdNb1XSdkf94D/1Qwvea+KXPDBW
GBfJo6UQx6bw0YLzuPp5KpPUHoNAS+NeabpCnFuiRKzWyRx26u7UtnSL5YTrQTXm
vcLPYfriMKpV2LSRfnOUqXjGkqN6ZmYDMiKn7oiklsMj4ajpPzU8/UJwjLd9DCTn
T6Wjdg7dHsxFLQ1CD5JY1aR6yFcEAwaSmbHWfAvqPAVAt0xPZPz4Jik4lFDjIkPD
vWG8oBS/TsJX7GhichxRZvfHllePuI7Q/4Ys/hf72gAofgR8K5Poy/9URdY/ctF5
2pyEuJxKkykegWsIvwnCxKgzSjEJAA==
=PoHK
-----END PGP SIGNATURE-----

--SwoWk60SP+6OH4EA--

