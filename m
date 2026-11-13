Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41739606AFCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A26546Qz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H4Sr++px
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=azItZw37Psv+RIoTb/9kDu9Pry7KMlBGSqn8SyHam7o=; b=A26546QzaoJtjpPtlD7Ep7aWMp
	cHb+GpwDQcRRZsTnNufZDBs0RRUSW443EpFwZxDQEsU8KhE6RFo7Pa046AOitrt96dRKnDqGR1uP9
	ZkZrkT2MKwV1W4IZnV1O5gHyTTPAoKPPCY03itvb8eN/fRNjjk5iX7N+ieVzw0oA9qeyOVw5Mq0rM
	eyQzlqKqROnLaaoUmO5/16lP5l0TyG+ymy3U4csDC0Cku5WTr7rZpY0oqVmXulTtBxxf6drDxWq8a
	DiANkh9yNIp3aLw3rWJFtIh1AGZHgLAjFBS1/DKX5UYdAMiTlr7/hjz2fV39qxVoKPRHD3jc1IAi2
	Hy5BrzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuSU-0000000Dem6-3uIb;
	Fri, 13 Nov 2026 16:49:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuST-0000000Delp-3Oot
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 16:49:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A1036133E;
	Fri, 13 Nov 2026 16:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB541F000C4;
	Fri, 13 Nov 2026 16:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588540;
	bh=azItZw37Psv+RIoTb/9kDu9Pry7KMlBGSqn8SyHam7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H4Sr++px7qKhjMrUw+S3/EQ3XEJdptnPT2OxPdSmPCb7h7Dy1fyHSsqKUKrVkM2N+
	 XZuJGhoNn6sIdglF0LQb0rxyXW5syUe0gdme21SYJTNZmaIk0uChwY3e3pve9U8KZh
	 1STpJwl5B4ZQGotbPJuYsrns5cJ7URZoJiHmD4LxPC1toTgUf7krlJSe73IqiTb8AC
	 Dw+14CEtlaYz+u4GcEW4yYfxWjZBr2Tf1fvTvW/g2gLkD2/Yef6RSDpylwoRaP74bF
	 Rk2FGruQl10cMYJClg8v2stfO8Gckri6bgpJKvRRYkYDqpkLNQ04IbfIghqT4bMo7B
	 xtOCF0YpA5oPg==
Date: Fri, 13 Nov 2026 16:48:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Benjamin Hahn <B.Hahn@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yannic Moog <y.moog@phytec.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: fsl: Add phyFLEX-i.MX 95 Libra
 RDK
Message-ID: <20261113-succulent-glacier-334cd223f87e@spud>
References: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
 <20261113-wip-bhahn-imx95_upstreaming-v2-1-3ef58af5e689@phytec.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HWLnn1zvDEVXTT37"
Content-Disposition: inline
In-Reply-To: <20261113-wip-bhahn-imx95_upstreaming-v2-1-3ef58af5e689@phytec.de>
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

--HWLnn1zvDEVXTT37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--HWLnn1zvDEVXTT37
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavc/dwAKCRB4tDGHoIJi
0uC9AQDgV4VJ0N1dSGPsWsIo5QpkDfYLvixZ4fh7GMSS0TzJ6AD+JUdFHpRiNkjK
i0v+d829LihQxaj/1Y9vsNtiJq0giQ0=
=YOMt
-----END PGP SIGNATURE-----

--HWLnn1zvDEVXTT37--

