Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DB7606D805
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YGoyZQBK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N9WAtu/F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+3Xf0PE+LagmTc4tqKy4edOsojgcvPiX0DMuZnq5S3k=; b=YGoyZQBKw+b4LLerb753ecn7zZ
	WSu/jHHdvKlWZsWLBzBkYm4S+XuRb0EPvSarsf5GkHEEor8egp5/ezX33Jp7w+MyRyMNKFuJ2lguq
	7jzRlVoGQAu5p517OcAXQmwp/eDuHbrLBjGDDGG1OhZ+Q9uN5DuDVe3dBk+tPhtSPLHJWmCgEN00x
	oL9s/WBLYHW71+vUs9NdrvzEBZs5mEmDxYMCIp7PFt6vVXd2gYqtcfa1BYhKjV+NjDzRD96e7EQcR
	l9E3QXYqcByPQpDYsheMM2nQyNiTXLUjMavESOYZao+edxBe/+h2TqCu6ERhVfu7QEU9yMzW7iu6R
	rsEj3mAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPe9H-0000000EaLI-09Qu;
	Sat, 07 Nov 2026 10:59:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPe9G-0000000EaLC-1AJD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:59:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5DC16111F;
	Sat,  7 Nov 2026 10:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1ED1F0089F;
	Sat,  7 Nov 2026 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049189;
	bh=+3Xf0PE+LagmTc4tqKy4edOsojgcvPiX0DMuZnq5S3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N9WAtu/Fie4JSawBbWTucmridD3H+Ras9ViIcMJUXiO/NqRxEoZVYTVJS1Axowtcb
	 nycReq0Jp9FjPTbzD/sv2jw/dlWi9fDwIfqgjibz+3VVXan3Mu0WAi74xfwFLSIH5i
	 3ZibKHb8/Fm95Xl1JyHhK9MfCGld6IcI9Z/k0VudFZK0ndIU/43p3CRoui9aDR2xck
	 XkcPtwDk29izrMiVuXpwrhFVAL+KGDx7KgAHSXhzFN6/LOrv5T4dkBgg+vom3cruTs
	 2OZILCbM2z9SPGg86iv8xVzcKOE6t8Tl6C7wcGGy8WotPiM+W028Fg/DTCxTYi9J2S
	 qRlrGh1ONtuvw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 81D3D28D2449; Sat, 07 Nov 2026 10:59:44 +0000 (GMT)
Date: Sat, 7 Nov 2026 10:59:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Matt Porter <mporter@kernel.crashing.org>,
	Alexandre Bounine <alex.bou9@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 3/3] ASoC: sprd: use dmaengine_prep_slave_sg_context()
 instead of device_prep_slave_sg()
Message-ID: <6ca75bd5-f402-4757-b264-6720b03b0365@sirena.org.uk>
References: <20261106-rio_sg-v1-0-bc54b4bd8c95@nxp.com>
 <20261106-rio_sg-v1-3-bc54b4bd8c95@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aU+YWAD6yJFUUGmA"
Content-Disposition: inline
In-Reply-To: <20261106-rio_sg-v1-3-bc54b4bd8c95@nxp.com>
X-Cookie: Whoever dies with the most toys wins.
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


--aU+YWAD6yJFUUGmA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 05:43:10PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> Replace direct calls to chan->device->device_prep_slave_sg() with the
> dmaengine_prep_slave_sg_context() helper in both sprd-pcm-dma.c and
> sprd-pcm-compress.c.

Acked-by: Mark Brown <broonie@kernel.org>

--aU+YWAD6yJFUUGmA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau8EmwAKCRAv73Ows9A4
iW+5AP9aetZoADx2kgpQxvUXbikjHna+8G8k3cywS9jVU4nvyQD/V5fyZbvLDm/v
sgHODthprx1rRSCge4KCShshtklVhQQ=
=X2k0
-----END PGP SIGNATURE-----

--aU+YWAD6yJFUUGmA--

