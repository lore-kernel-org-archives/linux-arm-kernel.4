Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B50B606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nnP0h+9j;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8PInzIN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=euWQn5Rv2hCwzrMHnDv5CR9xISzY+IWgczl37e3t6mM=; b=nnP0h+9jFe6xP5xgVDLeyV60Ac
	2RRuGcUQa3Z/SGfxTUayItdsrBznX0LDqyTD0Tv6p3zt+luHbG3OjJD6mYkbpftsU/BX8tGSGP35e
	nu7k0ZPpG1l1G3FokUYFucMaD8C92BSoUqfQQBAKBnGKH7scEphRFTW2rWxCyzlzongS+FI8ZEq56
	6wzcv0eSQ/F0Bvfo+lOnFxCTUpsR8xGPR+KPuPeMx/76iBDX7tE3sHv5cqDWshrcv8GzT1aFKKGjD
	644uEZHBLZDp+PG6soaz9TPhe9EDYvIy+NBVtCCCjviHiYqkr19fibUuTuWwIp6UV6gJCdEFLMg7I
	gVannvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsMZ-0000000DB8J-06nP;
	Fri, 13 Nov 2026 14:34:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsMX-0000000DB7g-2r8k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:34:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC0F861130;
	Fri, 13 Nov 2026 14:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BB81F000C4;
	Fri, 13 Nov 2026 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580484;
	bh=euWQn5Rv2hCwzrMHnDv5CR9xISzY+IWgczl37e3t6mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P8PInzINTKuTvIeuDs0rRrwxlosMMlQd6oS6cKKHIiqRlPL2gOzeDieeRQHo5gaMN
	 qGZFEMoxVOX5Lxpt1tMMREw5ynGNf6umnqNnEPzrF4otX3L0GmakulMQAQEVzb2P0Q
	 oUtFZbeTBaBv7w1JqAlXAjQpkwIDeRdrRiJLjkafqL1vx+/sGTBXmSWw7pF7qAuc1l
	 iZEOwn/vgI3C4EXZqX78M2eOwl0wSMQKltoPywTttLS6m2SvkEjEu8r9d1uyfDAKJh
	 MalvtEGt4c/blxflZYQX8xwm+zjSrmeip7/lUBkc0C7JgzZqsmocb8xCZmwX1BK955
	 NLHcrK670Otww==
Date: Fri, 13 Nov 2026 14:34:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: add STM32MP21 regulator bindings
Message-ID: <89a0f5dd-0d18-4c81-905d-efac36c4f6f4@sirena.org.uk>
References: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
 <20261113151038.1.I3b816ba92be5ff94cfe86a2f1c643645416cdb2b@changeid>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dow1+n6YN2YGv1I0"
Content-Disposition: inline
In-Reply-To: <20261113151038.1.I3b816ba92be5ff94cfe86a2f1c643645416cdb2b@changeid>
X-Cookie: Flee at once, all is discovered.
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


--dow1+n6YN2YGv1I0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2026 at 03:10:39PM +0100, Patrick Delaunay wrote:

> These bindings will be used for the SCMI voltage domain.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--dow1+n6YN2YGv1I0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3H/4ACgkQJNaLcl1U
h9Chlwf/X69pVoeLUuVJyXO9yjCfCse3Jt4TBfhjSyktkLI2Zk0QaQ3a6XjGyNAZ
VyTvS9Kk2/z7/lJg8gLnxZYbJ5pIyQpT1wn043eg4bE5QBq2UoxL9bExVm7tEmhx
+ubD1mwsMP3JtL9u7DB8IIXscKxRI822PSAnm8QYR32qlTAFn7XXtZVvlMrUw/UA
1d/UwsXjVPxbcKCmkHVHx5iPvhnhTa4qBDHrmifhqsE3OkRQl4bifpBfqn8nitTZ
EyGOGdcANVyzQjWre2QdTCs7mSgcFvROBOxSmePIgyfu2mW7k74OuUBWMMrjbwKq
Vya/66pRh6Boe5zHJxo1HTZj53iomg==
=hQv3
-----END PGP SIGNATURE-----

--dow1+n6YN2YGv1I0--

