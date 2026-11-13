Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE9660A382B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=roNogDJu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+G53xRS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1suJMfr4F2t+hvLEf/eqvweGBr12R4RYJ9ohUXZMmLQ=; b=roNogDJuJoCtXI0VyIbI/0KLtj
	ROzkJiI0IauIO62SvZz9xtjyXlXtbtr7nMoyu5JNNaH9KOKNhdbrcEi7gzqOPbB7ZOgx+/h2/bxr6
	77SFk3bZpUzB01KYAOVDR6E2Ix2petQ50BY2Ziq10RbyIzF2xAid6+n0GDJBV7WWOk8JCPREGftWi
	Rz5QKzF31ZIKOg33OKszsTaVHCwsZSmwNMu3ccGW4CfujWc1OcUnTDD7MzraYoeo6KprZjFFmCULn
	9JxbY7MGuh/OKczkBCiWSMrTBo2Z8ivyA9xy277GTMfDAq2vQo8PiV+rwF/BUg0qp+8qHpbwmyr1y
	/rlcH8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRurf-0000000DiNj-3N3C;
	Fri, 13 Nov 2026 17:15:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRurd-0000000DiMy-35e3;
	Fri, 13 Nov 2026 17:15:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79F7E46B12;
	Fri, 13 Nov 2026 17:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE6D1F000C4;
	Fri, 13 Nov 2026 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590101;
	bh=1suJMfr4F2t+hvLEf/eqvweGBr12R4RYJ9ohUXZMmLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K+G53xRSt8vDf6/x/l3LPjRGhF5omdp/pkv805gZbqnCe+Upy/fEqej9LIoLRdbPJ
	 /nOLeWFABGHPoNdRgJwqooL/MmPecQBEz+bMZ7V++L2Tne5kYqrIxTANG0vKtVwv6P
	 wNTGd7Rp4FC4jYxpC0Tgd/GwGTsHDEqnwV44JgLiu1zEz0QZZeHT1WcxRRavSYFxS3
	 EdCKfUgokXaR0RjcDOSkrzUMRr39pcOoGI/UkkG+H1mNo8al9Fp7ahMRbfUSqaFW34
	 YVYkUHXsjcbamC8vAlS84fx1DwCL0+U5WrxxPNeewpO79OQR1hFo8W4qV+XtJed9tY
	 LOunxBwh6Py/A==
Date: Fri, 13 Nov 2026 17:14:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/7] dt-bindings: net: add amlogic,t7-dwmac
Message-ID: <20261113-headband-resistant-354bae47c2b2@spud>
References: <20261113121852.334604-1-tanure@linux.com>
 <20261113121852.334604-3-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LpKzrxi3dFo/IMea"
Content-Disposition: inline
In-Reply-To: <20261113121852.334604-3-tanure@linux.com>
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

--LpKzrxi3dFo/IMea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--LpKzrxi3dFo/IMea
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavdFjwAKCRB4tDGHoIJi
0iKAAQD8cRe2UwvrgIAurM7gqjc5GRJvmH08nxT23alr7Ij1fgD/XhJ/l3gmDO8e
WxfYr9fWD1PaIuMhdEbBltsE/3a4gAo=
=4R2d
-----END PGP SIGNATURE-----

--LpKzrxi3dFo/IMea--

