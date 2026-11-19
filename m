Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB05606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EgnFA3bv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1N129zI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5Xk5pPbAq0dYNkaIt18VSndwOHAb9R3m55g5wEfXi8g=; b=EgnFA3bv0BxGaG32SPSKPnRYNz
	6gSx+VmNsp/8pN6BjxpwQUeRViUDoAVH9HO+bCWJC5pnRKxU8UJyI2q7V4nUzMno6hNXtjbT5vv6d
	ocTe9r+BW5ERtEmVvFJ8akha+X3lasgeIfMzdxp3p7TkysY/OWE2xCgGaanoFSRcjk3au3e4HsUrl
	pbxojbn+LoZZhZ7E5R50KjGBewv+v3DiksmH0KfTflASziEs/wzSoprNy2I4jK/3jQ2VHqLxTks1r
	ccK9j5/wahQyByWRDf2MqC4xdkGE4TjO69wShhHBQinnInIdB9mRPBtJj41I0aYmoYPlUyDFeieKL
	E5j3dQWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6MN-0000000Culc-0h6K;
	Thu, 19 Nov 2026 17:55:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6MM-0000000CulI-1cpz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:55:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D8ECE46F77;
	Thu, 19 Nov 2026 17:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07AE1F000C6;
	Thu, 19 Nov 2026 17:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795110945;
	bh=5Xk5pPbAq0dYNkaIt18VSndwOHAb9R3m55g5wEfXi8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V1N129zIPuc1HRbU2bjH5Wg5J+SnZM3lDf0cnUYip+zyJkAMY63fm8xtYdTDMPTaY
	 kUVn1KWUaRcaW/1skChWKB2so0HWMhWzkVaePa506ei3huKU1tPa3oxVz3sJHNinmg
	 HeGTBLoOLtV6jjqGJswd0lPTSFXMv1a3jmSXGZQZFqc+OYDzRKStTBc8/tuyF2QL9i
	 M3s0rM+CHZKL8pWeAMyW5WtvG5fIINU2Q0k5JcYnSbzhqBJrTOiGFjurNo0xrA/jPd
	 u8eyyfQPICTsKBthtnRei/ZWSTN0xpNMkJwiE9LZTo+SXo8pswh1t1ziSzZr1K+/QM
	 vcn6Zmk2fo+9g==
Date: Thu, 19 Nov 2026 17:55:41 +0000
From: Conor Dooley <conor@kernel.org>
To: alex.cramt@gmail.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Mahesh Rao <mahesh.rao@altera.com>,
	Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: altera: add Terasic DE25-Nano
Message-ID: <20261119-overpass-cone-55444b473817@spud>
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
 <20261118-de25-nano-v1-2-473d16131f7a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VwlXUI7bkGqsqioT"
Content-Disposition: inline
In-Reply-To: <20261118-de25-nano-v1-2-473d16131f7a@gmail.com>
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

--VwlXUI7bkGqsqioT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VwlXUI7bkGqsqioT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav84HQAKCRB4tDGHoIJi
0mgCAP92GBT28LEUFDJeLnAigzhLl9lbnnjAFWXVK0pwX6qJYAD/apMzCn5uDeX5
yzIUyHUOvW7U+NoFjz0wGF4oqU6n3wE=
=IOON
-----END PGP SIGNATURE-----

--VwlXUI7bkGqsqioT--

