Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CF9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KJD5lHVe;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MRHf3VfY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uFaqDWnXCL7lbQ1m2ghG3uVd4/zClsBm+zuG3VSwDIE=; b=KJD5lHVereevqxcBtR74TdNVw6
	An8HMVBu6UgXywjAJyNnYf7H5O3TTYKiz0Ff44T+vA5O9IwtSmDCPLyd/LyzLSTa748Px5KlU476l
	Wi8YjL7XDgYHcIE3EhOnCB/E9yikU5FOUD1Ykq4mb4zVyn7fidJCuAWaGaqUFKA9293aD36zH69j6
	INtHpMjj++ydY28DPIdAIO3HCIDUHaH8lNIkxTetQfOgbrT7uFzsYToZoTdjGtoqk7Ob+H06nfXoX
	lZLZ0leHmLo6SOlpACRp+fXlGRGd2JlHZsoTcBb3VOLlCMXrmiE4SwXXljMgG3Ob1fihwvAFpxSIN
	YITHy2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVnx-00000003w3P-3hHY;
	Mon, 23 Nov 2026 15:18:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVnx-00000003w38-0dvB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:18:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1FBD40910;
	Mon, 23 Nov 2026 15:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F22C1F000CF;
	Mon, 23 Nov 2026 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447083;
	bh=uFaqDWnXCL7lbQ1m2ghG3uVd4/zClsBm+zuG3VSwDIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MRHf3VfYBvEPDsKAPvDiY8ZjheWE2cSY5CeATGae+eyO5iKwmpXKtC+Ix5fnadJoW
	 jfm9jk1+9IZRq7qerCsJhej2YBn8+a3RV7C6L8LctiWXjg0t80vgm6RaB5BuJv6MwT
	 jhFgvNDEC/8yWcYdv8f/R82Ktyh/RZl+oFQlo3rWqD6NTmswUFExjksM1nUBRbetiJ
	 kur7Z3vyRXJ2+6yRGTvKLuELeKZ+nwTw5SZalQbYKzYbpDiLOiHou+nJh0VaPFG/30
	 /FzQ6wQMmNhe/KQXq0oEbhw7hd/FVt7Jpp5d1EBcgcsjcjNXnOkEGaHSwD/Jtzp06/
	 jrHj3+xK4rwsQ==
Date: Mon, 23 Nov 2026 15:17:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 4/9] arm64: sysreg: Don't run the end-of-file checks
 after an error
Message-ID: <7bd3a3fd-1978-4b17-bd88-310dac170281@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-5-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zUTPHxRisGs7H7TG"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-5-fuad.tabba@linux.dev>
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


--zUTPHxRisGs7H7TG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 07:52:14AM +0000, Fuad Tabba wrote:
> fatal() ends the run with exit, but awk still runs the END rule after
> it, and END checks the file as though it had been read to the end. An
> error inside a block leaves that block open, so the error is followed by
> a second, bogus one about a missing terminator.
>=20
> Skip the END checks once fatal() has run.

Reviewed-by: Mark Brown <broonie@kernel.org>

--zUTPHxRisGs7H7TG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEWSYACgkQJNaLcl1U
h9BadQf+NSmuypEBCVXyJeln/ZFYlxuxoAKR1U8vOo3yLyl/pboC826kJkApVWUP
e+OlBlq2rlTva7asUusYgIAAVvtxiIBEwYyL4tEq3PZbt3vepDPMV069+1tnvgrX
3CwT131wBNV/oplZAtLCGT5SJF2zRBy2IpGm6xEwBu6YhlyDzrDik5Gx8ker7z9u
0OMC9yar5PPLHveMsSvN+EEAK0NDQO0QdmBAftqphxZGQRQ0fIbl7WYij3qRoDZk
4l0TqjIdnuoiieav0rGZJQeePM8oSu8jDi15X0kIo86XYiJ8IsihxbQSijY/S3Xo
SDMZVOpCxx9HP/ZfzW01vTGFCG8JNg==
=vUIK
-----END PGP SIGNATURE-----

--zUTPHxRisGs7H7TG--

