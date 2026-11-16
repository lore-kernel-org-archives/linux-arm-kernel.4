Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDF0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K4CpiTLU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BufQ4yB8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u0amJXnNhvCqUYVosfqp8kda2/cuojxj7YCK3kHoL1c=; b=K4CpiTLUdDkkIKCvQF/sI2vpuz
	giJCfpdxO3CpJIlaZkBrbBKP1c/IFLSRFJKL1cz9EkvvbvNOwVdh04HlGQ4ms+mpVsFC9YR6B0rn3
	py1+RCe0JQYBwCoAK2bUfFcMTlbeOGtrkFsnCuDXBfdn19ZNO51AhzJ9pnyLbmQ9eXS4EaKm3EAdb
	IH22B/0hxKzgPHJDTwsO16yza6S2EKYFmv42f0ELHLnNY0g4TS7F1U7VGnID6NWSlC4DlvmIfapsD
	B/uOfXHkF1yZ0/aDsk8RreIfzX9CeGmEZPXKzBXb2H58UAl/BUA0Ge6A2X+j99V78PuTM/GnYhosA
	/Ki+fImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1VS-00000003aA6-2Vgm;
	Mon, 16 Nov 2026 18:32:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1VR-00000003a9R-2OC4;
	Mon, 16 Nov 2026 18:32:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D24D76314D;
	Mon, 16 Nov 2026 18:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB111F000C4;
	Mon, 16 Nov 2026 18:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853960;
	bh=u0amJXnNhvCqUYVosfqp8kda2/cuojxj7YCK3kHoL1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BufQ4yB8tNbR8TJ/Hnm/k0+qE6qxhRqGHHX46jkRGjToD5o4wDrOYPG7nvezFv0ij
	 e00clQXsG373kdYmAXh8oCe3IdIVdiT7Iui5KI+tcxMLHi5sV3JE0MCYGqkDxIcaXG
	 7gFlY44DXGIocwrYaoiYok5Qz2wfSVMvRrYiuUBEIyuQJO2rmvTxnoeAq5ciRmKYtF
	 8jWVjuzRfesJCaPTKOdJGnjX00leLrKY96LkSJxp8fIyI8sTMQtc30D3p5LMJfS9hY
	 WHff+hOG9ikpu+ry1kjea+En2yvY2vIpCCDVgojLaxx8EmurFzgfstWWNc3x0/FSjO
	 xjWuXeQY+sZGQ==
Date: Mon, 16 Nov 2026 18:32:32 +0000
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
Subject: Re: [PATCH 03/19] dt-bindings: interrupt-controller: add the
 Allwinner V861 PLIC
Message-ID: <20261116-catsup-lethargic-45b29242cb79@spud>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eBIsJ0dmZzflzkKm"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
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

--eBIsJ0dmZzflzkKm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--eBIsJ0dmZzflzkKm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtMQAAKCRB4tDGHoIJi
0gQ9AP9yFcU7elfIZfpsStDtWeKtAnPFAqBGCugfc09t6ejP6wD/arKyMr+JWozf
FFL142vScOtV8F9Q7w85A31HzFStQgc=
=1gXO
-----END PGP SIGNATURE-----

--eBIsJ0dmZzflzkKm--

