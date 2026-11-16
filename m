Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A63606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NWpPZzTt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X1zUOPc1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=slt/8ehFK6dZ83SG4ILG0nE+6CRzbuCPyGX2iJ03a6M=; b=NWpPZzTt7bojKE7+zLYDRpwoGI
	kUNJmDvRtD/laMkwvxf3pnd3i22C43DSUHIaeJ6mbZY1V+QgLRP6569se0dvI1sBzAPFUuA8nAeq2
	1uaoEtffPTd7+yHj5oolncqu4NthzfZ1htVnjmmy6j3hTweJYsxelvCLyXVPBeily29M73ulLfmhC
	bA+NuwFJeSZJtc4Epk64hL9NkuyaqgsNx/9wGZr+H1Er5XyGNFYpKh3ifcXXv3Pwhd1UL0VkBjdPh
	vOdt0F2NpnXluvtlJumcRa0/z/nvRtfgh8hfceLy/EesEXjVJsxiR+6t1x6/ausgpb1rr7ElrShOK
	XpVWpgUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Uw-00000003ZuA-02Nl;
	Mon, 16 Nov 2026 18:32:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Uu-00000003ZtV-3s35;
	Mon, 16 Nov 2026 18:32:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E91663105;
	Mon, 16 Nov 2026 18:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9601F000CD;
	Mon, 16 Nov 2026 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853928;
	bh=slt/8ehFK6dZ83SG4ILG0nE+6CRzbuCPyGX2iJ03a6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X1zUOPc1SH6sn27i5wA8bSRgm8RrRGGhLZ6WL9cILoB1EyfLhWF/taTEFAeepoBJ6
	 WpxOoMp8xbqaGF4O+u8TA114hbrU+wNmFymBJ1VkJnnPVneFb2W/xdZlA7PwrryWD+
	 rVLS4kqLn/pKY8uIQxKV6J6Nh0qLRu3ix4hau+rSZa/axHQZgeDyAuUSnbbPLLce5e
	 Z1dr/HQLr6ogeoBE0rknyBgD9jNRa/qJ0b+FN4D934O4OCsasgcD9phJFnoYLi82NB
	 E44I5yEXb64JLkenblKV+9UN1rDUQR8GXq6WyIO1Us7rIX7LA2/QhYLLjXrqe0AF+Q
	 69CR1nFDOZ2Hg==
Date: Mon, 16 Nov 2026 18:31:59 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 04/19] dt-bindings: timer: add the Allwinner V861 CLINT
Message-ID: <20261116-septum-unwitting-471f14128af1@spud>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ErtSfEwv4s8akozZ"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
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

--ErtSfEwv4s8akozZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ErtSfEwv4s8akozZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtMHwAKCRB4tDGHoIJi
0qkwAP9Pd/ep9Gqk38vyq4AwUoKO4zmSxSq1Y4VcWPLvY0WyXAEAgRN5as9LYn94
9CLp0jfoNf3CqN/EAfLU4rUerUSzwwc=
=D0vo
-----END PGP SIGNATURE-----

--ErtSfEwv4s8akozZ--

