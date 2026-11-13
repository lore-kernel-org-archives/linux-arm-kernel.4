Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F69606AFC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eVbOMyyU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcTO8C69
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=skcqS+8ac77eYUcchznlRTYKurrkiQlKrxxFR4B6VdI=; b=eVbOMyyUG/6PQG75Tln5wP3Cwr
	mPiKGd8ziO9JjOz3cALdv8s4SOUum0mzJZN99bly7RGDSUG7iK2OpZSyEcKD0tMrH34KPoR6S/Dx6
	UyZspG+boRrUPar+RXZ+6MIriQmT21nQZp1MFXwLPg/MoAhMamLdle8s7/dVhxHi9LBmmK/nFypfu
	r9lQnynTmmoVLFa/SPguoef5JIOHNMrlqXbwdR5SrXW0hq2FtRXlVLjRnh+DLu2w1sY5FhwHyvqJ7
	tEBs6qCC401wZLpXWvqucHH8ggsRSYxqqQGuc42Bv2Y6GHoKeecYbMac3zCdbZHsjJS1173yd0k7t
	fbq8etiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuS4-0000000Deip-2znp;
	Fri, 13 Nov 2026 16:48:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuS3-0000000DeiV-19v8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 16:48:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 818816133E;
	Fri, 13 Nov 2026 16:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640D01F000C5;
	Fri, 13 Nov 2026 16:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588514;
	bh=skcqS+8ac77eYUcchznlRTYKurrkiQlKrxxFR4B6VdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kcTO8C69P+H/9UHJPoXjeO5FyzZJRgtthRjsL+WIS3sXykdo+YT6yDO6+0EfXyAUV
	 5vNe7yXDemr+KMyuM6+yFxKaBQLK76rRLlHq2PJG0o5xTfmftUtPkpqZQgc+BIlBBz
	 GHVZIj5UCbXJj3QUYLIMEgcVSiLTCFAsBbRriK91+DNAHlQxbes5TnG4DcW4LnmAza
	 zCLmPlJYOZ1NIY6+nf42xBxdhfgup2QMhuJA2jyaUjCB1fE1Dd9BruyQ3prPpYGerx
	 Aevm7rIEQ7XrUA/ToK19xD3ZvF0wp/2REg+QLEJ/3etLHVlhoMhAR1aHotu7C3JshI
	 kjTd9r2Q4wXaQ==
Date: Fri, 13 Nov 2026 16:48:29 +0000
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
Subject: Re: [PATCH v2 5/5] dt-bindings: arm: fsl: remove outdated PHYTEC
 i.MX95 FPSC
Message-ID: <20261113-modified-spoiled-e01e679958a7@spud>
References: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
 <20261113-wip-bhahn-imx95_upstreaming-v2-5-3ef58af5e689@phytec.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iZ92SGTP+TDYvN6h"
Content-Disposition: inline
In-Reply-To: <20261113-wip-bhahn-imx95_upstreaming-v2-5-3ef58af5e689@phytec.de>
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

--iZ92SGTP+TDYvN6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--iZ92SGTP+TDYvN6h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavc/XQAKCRB4tDGHoIJi
0hyrAP4/hkjo91I+3YhKmBjbBFwHfkA38P9TmLn65vrMX2MKnQD9HeBYSfwve0Ab
To9jhl/rmlNnu333KuSTRGMrMbwtjgE=
=xQUA
-----END PGP SIGNATURE-----

--iZ92SGTP+TDYvN6h--

