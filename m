Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2024E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gnVu6XPh;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D9fIoGGS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k5OVr/LE9EGGJL7rLRP9VR5d8J1PKZ3ozrJ6azZxZTc=; b=gnVu6XPhXCuXjjsMm88SsS15yA
	kfFKhJYqE2U3hXUlW9MmScYmoIqEnBgonEOV/FnEL9wCJK8919rzqhCAKc9VAca7+SC5dML4Rz/g1
	rPWlkG7LQ1kqlbZ37I4emCoAQnf3Tciqh3eZMK5eSwTlDDuzNJ+hzlq6BzpTbkWLN1U/J0kYG3o4l
	nVxUhpD3oIaSHFPSRlDoqBSPU6YXIX1AueEmqXlwQOAj9sVSLZ1JxPY3y4pW2uUrvW4HdG89vnIFX
	F24Eal0Kr2QolmzKSVtj8dKUxJAZOPJMOZEcweEO1IIcQ4NkneBDgSJzaoNlUFVGQjFC6B4ejIVM0
	oEnevH7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVFW-00000003m4d-2FX8;
	Mon, 23 Nov 2026 14:42:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVFV-00000003m4G-3Gti
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:42:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C24141AB7;
	Mon, 23 Nov 2026 14:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440961F000C0;
	Mon, 23 Nov 2026 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444949;
	bh=k5OVr/LE9EGGJL7rLRP9VR5d8J1PKZ3ozrJ6azZxZTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D9fIoGGSDIjpaWuyBUBVwNSF8+STi1eIryarFKELGbsAdKbkqXmQEhmkTlyihkiKC
	 1flHmOhQGRQZzJd3a7Q59NwOLqpgPKqmAWXUeXZWxdpIt5Jkw0EQpFo1NY5rCjU31Y
	 bKAn9b0KGJ43OAsrlSErTqFOfaSPrZbtTeXwgZgyI6pHLlefRKZ/Mb6b/8nBJmE9Kp
	 phHqItmBc06/MOKx3TDETC7X89+qAr220hfOe9Tzreb4KZFCwSxImEaRdpCzgq9YNK
	 Xnte78UT69CTH46Myp9YYwMBaJ5TXZOE1iuNJ7thUtbY9nE8dIdKYCPyYI6i9P+w9M
	 BWJwYwXUxn6kA==
Date: Mon, 23 Nov 2026 14:42:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 1/9] arm64: sysreg: Map MPAM1_EL12 to MPAM1_EL1
Message-ID: <805ccf2d-025f-4ed2-85b8-f738bb931829@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-2-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6xGYnJC2xPj9LFYw"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-2-fuad.tabba@linux.dev>
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


--6xGYnJC2xPj9LFYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2026 at 07:52:11AM +0000, Fuad Tabba wrote:
> MPAM1_EL12 is the EL12 alias of MPAM1_EL1, but its entry in the sysreg
> file is "Fields MPAM1_ELx", and the file doesn't have an MPAM1_ELx
> block. Since commit 6ae7fab7d9d33 ("arm64: sysreg: Emit RESx/UNKN values
> for Mapping/Fields definitions"), the generator's MPAM1_EL12_RES0, _RES1
> and _UNKN expand to MPAM1_ELx_RES0 and the like, which aren't defined.
> They aren't used yet, but the first user would fail to build.

Reviewed-by: Mark Brown <broonie@kernel.org>

--6xGYnJC2xPj9LFYw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEUM8ACgkQJNaLcl1U
h9BRtAf/YDbNlEmdb6Yb5HPsoptakOfDJesH7NhOB17CeEIDEkdFHlhLGtA63raw
26ZzTiIICz7W3KF6hD8iKjrlyMwLv7HCHQr2jVInZW1AOEZWADDIZaqMJYm9erc0
QkX8RexdgTUMVSBLvUV9Zcua0CIoR+fHqPj8M+x4wkxdNChK5b7mTfRN5OWoYobW
hKkz4ZLtGXVq7ISQRqdFzlI3aIUoh07iceQeZX0HBGhJDEH3Eot9pwIuKX4NgpqX
T4WQwoTqSxH6VyVQ9YUn2WoTbMOh50vuQClFnfI9xwzrqoSHc4fn4NjwER5zk4aS
3IXq8pcjbrrWK3ci5a9ZYeIwGMvElw==
=bs+f
-----END PGP SIGNATURE-----

--6xGYnJC2xPj9LFYw--

