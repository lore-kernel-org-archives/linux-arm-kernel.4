Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54019606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cHUY3B2A;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJ6RVn2h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v71XpPF6azQMZJDYxnu4wkyjgWByHd4xKZAt+IzoWgk=; b=cHUY3B2AJ75phpQB6RAffkj/C2
	XlcZwg3mp7L3gvADVGYGYH5FKaxKkmym/qn/gEFzVTGu9SAEKiqilmgRu5MYfhKGOBgbDpZ/1rTJq
	T110qI0hFGuphNZeKpJQdWN8BelFgHPbCvTrjJxYetLCH6XLgYnm71JgeL3DM3KaOvwXzy23NjofY
	lR7O7ZUhWcL2YljzZTNwt5LUYiqEAAg8EcWShWzkKvs0k651YYmbpRr0kUuCKMJ46CFDhsXTiu34a
	Ni78Z/5Xh6y7r73wJESqRyL0IUnRviRcrTbbabHOByi/2p9C5szhVmGD+VUQpDVIdClKKPT98C+1e
	3WZGjGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8l5-00000006t6G-1dft;
	Wed, 11 Nov 2026 13:53:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8l4-00000006t5z-0CAF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:53:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2837561ED9;
	Wed, 11 Nov 2026 13:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CCA1F00A08;
	Wed, 11 Nov 2026 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794405180;
	bh=v71XpPF6azQMZJDYxnu4wkyjgWByHd4xKZAt+IzoWgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IJ6RVn2h3nqYDMQiJqYV4ZnYg/Du0eAeh/tG6f83XZr8a7BWuCSH+3o1eue839hUY
	 MipkFHnxxuaI4SPZLDqzobq7U+vRxaTavj+YhPYnwVPsGlRsTuNgzwrypRWZXdlCxe
	 7WNYdxMtkl8aseObBDDybWR4x+2nZS6B1ROjZO/nxF19Pj3BBQILbcpmCYpi1RdhWQ
	 6JlKbsDtFsgNUx60wqnEQiEB9y2irok/cA1AHmKkPoF8sEzo7aQ3mWCjiNgYl2H+7U
	 RaRjWpT9eJyte4ILaqI5RTIBWsqSvXB3HgxM6xcH7NnmPAV5h2iOYgokgSyW25KmsJ
	 r8xSysKjIM/Lw==
Date: Wed, 11 Nov 2026 13:52:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: suspend: Save POR_EL0 over suspend
Message-ID: <55361015-8054-482a-8c90-b440282c3cdb@sirena.org.uk>
References: <20261105-arm64-fix-sysreg-suspend-v1-0-f4d9a99fec46@kernel.org>
 <20261105-arm64-fix-sysreg-suspend-v1-1-f4d9a99fec46@kernel.org>
 <3479391a-ec0f-46a8-9384-ec084017d344@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bn/aNT600hJIxnxl"
Content-Disposition: inline
In-Reply-To: <3479391a-ec0f-46a8-9384-ec084017d344@arm.com>
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


--bn/aNT600hJIxnxl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 11, 2026 at 01:33:27PM +0000, Vladimir Murzin wrote:
> On 11/5/26 16:05, Mark Brown wrote:

> > This increases the size of struct cpu_suspend_ctx.

> This seems to be implied since we need storage to keep register value, no?

Yeah, it's just noting that we're not fitting in the existing padding
which prior commits seemed to be keeping track of for reasons I'm not
100% specifically clear on.

--bn/aNT600hJIxnxl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr0czcACgkQJNaLcl1U
h9ByEgf/dlknCiYa8K6jEoFx94FY49Bto/TdB0IVuxUu9buCHBQYp5yBrhNsjlfl
xAfEG1OP3A8AYZZUfRza7DknYjhfzbXt3SchXLFpQg9WyXZgGKXPmAcS6l3ajCyH
8MyLesNjC//8hUZtYV8x/dvg3kv+jRFnJ8kdmm4DPZnUyOeuU6SUtpaZhAUpBd1I
RT+bjMfmm+I8V3RbaRsEUU8kduItDSy6m4NpxktIAMTJsond93MzljcbFX7j2BWl
NuwsHFg7S/qet1RdiL73qiNJ2xfokAZ0kendcGDIi3YsBSLZ1UjLoskDHM+E5Qar
O8BbYGd52yrFOThElsqCOfiqTdP78A==
=hmBE
-----END PGP SIGNATURE-----

--bn/aNT600hJIxnxl--

