Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5496606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Iwdnvif3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f7NPDiJT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q1YJg/vei7zCrlO//VlRUUzgKSLvS/mC1B/OVWMNfm8=; b=Iwdnvif3koQ8DDqt1oO64Xn+S3
	clNWRy9ZczP6QAFQ81/J1r5zgEZdTcAPzIrTQMQZUjooh1Gw+tjgKAiCv0ua6keAJsV7Gq/p9Rjma
	YSHUcaG2kmYT/IhCO+GPBuc724E5shk7gefXQ4AQx2oLqc+Es+eaoDkZGx4RUIx+6UFlHoIFlIT50
	q1Uwh8SyvfSGPjDWzXoae5qijLvhkp+k+RqZM9eadTukMMYnreLzdkNkgNCKxLjg6xJEiVpMI8FIh
	7cLpKyBXWfK3EWu4qiuXdAUPj/Eg5f49VIqZflEkZpubSMN3FgcJTBdF5wM+SsvOCds3ABe9k1ugA
	TOMojVnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxpR-0000000GluG-2ixj;
	Fri, 27 Nov 2026 15:25:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxoW-0000000GlfF-26Hv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:24:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC58961FB6;
	Fri, 27 Nov 2026 15:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453071F008A0;
	Fri, 27 Nov 2026 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793079;
	bh=Q1YJg/vei7zCrlO//VlRUUzgKSLvS/mC1B/OVWMNfm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f7NPDiJTMMMHEF53H60CMMUBuKFBub0mP2TprZRCNtKXW7Hn3d9DBrqQcCoF9WKsR
	 SKKksz5H0AVRGF9aQ89g/Con9+AwelH9de4cMeDXU5HOoPBEMIG8OMMrPvhXB8k7By
	 ZZY/vr77R+aZoMMOVTUQDNgmVwGAdsUetsL8SJDBzydmpN7ndFITpoLm9MNNzIfUkX
	 m21hfUmvC2rd0FHr6pvkBRHNBLXu2wUjYTIbyFnNbEKG+ZOkq0090gEDXI9GGXQq4M
	 fwOiPpcDxPs8pSgmSd45ONH3UsdvvevsCMdK2Z6kzfdxRr0xyF68pJiio9MCL8sSds
	 k47+mTWF4aeaA==
Date: Fri, 27 Nov 2026 15:24:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 10/10] arm64: sysreg: Reject a bit position written
 with a leading zero
Message-ID: <e629f139-ecf5-4e1b-81d8-84fc3f2830c3@sirena.org.uk>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
 <20261127074426.50739-11-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VggYhMZppUsHxq9o"
Content-Disposition: inline
In-Reply-To: <20261127074426.50739-11-fuad.tabba@linux.dev>
X-Cookie: Sank heaven for leetle curls.
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


--VggYhMZppUsHxq9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 07:44:26AM +0000, Fuad Tabba wrote:
> parse_bitdef() reads a field's msb and lsb as decimal and checks the
> layout with them, but the generator copies the digits into GENMASK()
> unchanged, and C reads a leading zero as octal. "Field 63:010 A" is
> accepted as bits 63 to 10, with the next field starting at bit 9, while
> its mask is GENMASK(63, 010), bits 63 to 8, which overlaps that field.
>=20
> Require both ends of a bit range to be decimal numbers without a leading
> zero.

Reviewed-by: Mark Brown <broonie@kernel.org>

--VggYhMZppUsHxq9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJoLEACgkQJNaLcl1U
h9BeGQf/c3d7gtDRjhAGL7I39Dax/OUjodyxr9oANgVhn6ke+jDG5mx3Tcb5esl9
0LSwkHVe/o/w7o6P9g68LDgSD8mq7mDiLnoVp2xwm9VBH8FRM3D3QhulcuUaJqZy
clzLodXqDP/2sBUBy3VEwY7sYnQlliO4J7eO6KmaqHbLt/DYDFqap3dX4lxazb8Q
siVcCARjyxRBo14vnF+WGVUnPGlA5X6wl9JuQsWdZqKzuV6soHGnojuDa/xLRoZr
NmC6QSILs1Fk7FiRlvKc9EImIfTD5+nyET3/WAyhD+7q0zVfZUWF0Tt/LrfM8Ev1
igkGcWa7hCMRQdKXYMjZKz7oQrh+Zg==
=BxPY
-----END PGP SIGNATURE-----

--VggYhMZppUsHxq9o--

