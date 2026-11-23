Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92834606A339
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=thkk4D/n;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CilitgUE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r7x051pi9+bzNFVFk4VRqaN6J+AY1zf6tYeOToiqKg0=; b=thkk4D/nxQWtaCElFp3oqSZCwI
	d6C7wdz6fjo5CF9FAvzTgw0yUUBcEe4+7FL0sz9foAOv3wNRmz04t80wB4uwf8BBbxUVj8aISxWKl
	O5FIvcAl9ewtv8X2uTuGUWo2zfTOMJ3wwLw6nGy9nSaEOWx5F3kOfd41DQqFl4xq4XpHA7AD0a+o/
	PW2WPueAC6GfkUiaWtiPSqO3ocxtIix7KqMzvr2WfJKI+e3e5mktM9v8vROcOftzLE0KMyETZs9N2
	cMT82Iqrv1MsYj9ynM7DSjBqEEBwkBjP/xbeFkSKBT6U5bURR9VJJ1xCkyvgiQjC0t5oZGFNvJrgo
	cdpdBl+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZcI-00000004eGG-1Sln;
	Mon, 23 Nov 2026 19:22:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZcH-00000004eGA-1j9B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:22:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E35C3450DD;
	Mon, 23 Nov 2026 19:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DF31F000ED;
	Mon, 23 Nov 2026 19:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461736;
	bh=r7x051pi9+bzNFVFk4VRqaN6J+AY1zf6tYeOToiqKg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CilitgUEz+xIRnkU/Nf9+YPk0lz6OoORcacSbADqIWEozhyqNcLQodPiPDoFR5McH
	 Xsaf4sExdsc+o9QkdV+zIwX3PtdAoh3VOSLqqH+ZXxtxG9Q1SJPb3ph0VKRkwCvkTu
	 kBXlAjjwKAOVSVPjxVH7XEBSl2aN//O1J8TENE6SNIUBI6wYNmfYqtbDLsGpy0X85s
	 yJ9pzYnhBQlutVxDrR75DZqrLhKbRTwhSAN9ZrIenkRMo4XSssgVQ8bTY4nC9wZS+S
	 aoCIWkAdA+a7MKGNbJcB0w8ZlBhm2mSLldWQXa3NUWfCX8SP2IESGVSOPNm8Kgth4p
	 VcMeOAv8d2FUw==
Date: Mon, 23 Nov 2026 19:22:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 7/9] arm64: sysreg: Reject a macro name defined twice
Message-ID: <5488cf12-1ca9-487d-8d4e-f738154f1dcd@sirena.org.uk>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-8-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TpVsIbikX93Jrlqv"
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-8-fuad.tabba@linux.dev>
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


--TpVsIbikX93Jrlqv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2026 at 07:52:17AM +0000, Fuad Tabba wrote:

> Record every macro name the generator defines, and fail on the second
> definition. This covers a duplicate block or prefix too, but their own
> checks stay, since they report the duplicate at the block's own line, by
> block name.

Reviewed-by: Mark Brown <broonie@kernel.org>

--TpVsIbikX93Jrlqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEkmMACgkQJNaLcl1U
h9CJ6gf9G0VVVez9En/GNAc+Xta4ninX8YZMyyF9nppj5A6C2+mDoLqGpTskuURl
GgML4TBtz77l0Naw1ZeMHkyB04pinVtuzHHPS1w3/us9kuE4JP6rSMmgD6vO06Z9
ToxvP08vLjJeo/WO8H5bURcCDSJN/97uhWw5h94DVCHdDSJ/Kri0J7KP62eCzfld
T6uxdHivQaf88bl1APISQbzeB3frKnGQvbuww33Ode6I77XmvbjZizEhHb0IDm8U
n9EgXmCvjJc9S0t+iOUGVacyjKgR6a2xBXdWbxiu9MUdgbcx9yd9lNmDQxj7qN2l
BjoUB+wBY8Cma4CIHlj40hMqvUqp1g==
=5oQk
-----END PGP SIGNATURE-----

--TpVsIbikX93Jrlqv--

