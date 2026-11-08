Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE95606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 23:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VonO92+E;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eToLnO18
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nRTwl6PA7scPTUTp4EChbVpQM+LG2WC8AJwvqiPP/m8=; b=VonO92+ERrBxp3ON0MXa4dYNey
	ZnHAuDb3pbZJBxxkaujU2/XGxu9wua4v5ZG1Lkn6GkudPdcqnrVisF38pFUPUMLXP32TZfRSAWXRS
	pdGCq6N6QynpZETaLcOYBnRvLEDOOi/OnIziLtV/JC03Aey/GLy1h45jzFDkKLPcItAcIm7IU76O2
	EE2PBLob8RO485+u1ej68KayTHeMk/bilA8LSdEO7vGp12//Khp2tJEuEB4JDflD3sYfgPS4C2ZBT
	Yzqz7dKQFg0wYe0dcUkevwb99pwCKfXrjq1mjwn36aigONLyjfna4O30GJow3928wYNsZYGJTghHt
	ETNX5D+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCCg-0000000GtGx-1ZQg;
	Sun, 08 Nov 2026 23:21:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCCe-0000000GtGA-1SPp;
	Sun, 08 Nov 2026 23:21:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F26B544DE5;
	Sun,  8 Nov 2026 23:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9216E1F0089F;
	Sun,  8 Nov 2026 23:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794180095;
	bh=nRTwl6PA7scPTUTp4EChbVpQM+LG2WC8AJwvqiPP/m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eToLnO1866ewRebs6N6G5BSxQTF2U2Kc0UhdYgEdR47hwwyqAlfeSiJo6o0SvAIlH
	 joEW6TVssRzjzRjZ7V2nf1+5lSQvqv/tZz4AvyQ0iiAbmQQ3teSj2rVHOMPhaIKJy9
	 e1XEi/FsoXOoZzwsMGxQnBa6o38deA7bIfoyaUc88ZmWrnI58+0BNx7g3P9WotHXEi
	 f+U+josKVZ3jA0a8ixgOMiMj2cE5Wp3pPHZXrB+2zjoeJOT4wVOXqHft6ToH+mXb1E
	 9YsSOmViP0nd+o0Q3bhvuWTU+qRSqHrvdU4AC/gBAfKzqKVUWprfuycMOuKXnhJr8F
	 FSCP5pxfZvcpg==
Date: Sun, 8 Nov 2026 23:21:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/7] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
Message-ID: <20261108-poker-appetizer-ae578e06f4ed@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
 <20261106-armed-spoils-909d7d4f7d21@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h18CTd9oqNUWFnDa"
Content-Disposition: inline
In-Reply-To: <20261106-armed-spoils-909d7d4f7d21@spud>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,T_SPF_TEMPERROR autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--h18CTd9oqNUWFnDa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 05:35:46PM +0000, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 09:30:27AM +0100, Carlo Caione wrote:
> > The S7 PLL controller supplies clock sources for the peripheral clock
> > tree and receives its reference clocks through firmware-controlled
> > oscillator gates.
> >=20
> > Add the binding and clock identifiers needed to describe this
> > controller and its connections.
> >=20
> > Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>=20
> This looks okay, but I don't want to sign off on it before seeing an
> answer the my quesiton on the other binding.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--h18CTd9oqNUWFnDa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavED+gAKCRB4tDGHoIJi
0okdAQDMcXKZJeoTJVuXMbKA2aRXY0cbDWEgmMPMk8XpvQYvMQEAydnvuYk5uJNd
9LftLcLzS81VFE0iJ4VqHKGF4dmyBww=
=B5wK
-----END PGP SIGNATURE-----

--h18CTd9oqNUWFnDa--

