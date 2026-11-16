Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B41606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PZ/oQCNA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhQwyLG4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xapfgAJCLoQlkir661XJW8UeByt6AZ52Hqz2AFLNh5k=; b=PZ/oQCNAj06zJvpizkk8YSw125
	+BLDLXe96zDq/+GHvyfiiG3BHflIXvmiLrzyqB8Rp77Fspdfab+JCyPFGK4Uzc+6vSLRli/ZbKFVO
	ciDQ0QJks4JoTA7dTWSm2xBKQbdI+q68wnpHBRryFvbtXWsrASUBIOVtgKvKsHDxToGrRiuvFwJqv
	JkWR/atJLyvZonLOQ44ENEDWMs8yh/u0Q/Ee0BEtK80D+q+A30Dhw2RptyrHGo2lW1DC05BhFbbNS
	m1vkdM+CPbVFh+9x0snfChQGXa4WCptpkHmIxI1yM5+8XS6v7IU8i0l+kfdf9XXdaFnE1cEfZUxZP
	aBFglCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1T7-00000003YuJ-34yh;
	Mon, 16 Nov 2026 18:30:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1T7-00000003Ytn-0x56;
	Mon, 16 Nov 2026 18:30:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8479A61EE2;
	Mon, 16 Nov 2026 18:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77891F000C9;
	Mon, 16 Nov 2026 18:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853816;
	bh=xapfgAJCLoQlkir661XJW8UeByt6AZ52Hqz2AFLNh5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PhQwyLG4wCSOQLVyfRixgXJK3VEZYeY5REj0ashzJROReKe6Uvn+SuPF4IyAXHrsj
	 oGiE2SdYAqVF2UbGrb9Awhy2lWoW5GUHf1N5Vp730kcQ/yyXp/GkFsj3YZfiQTNPG9
	 qMquaRasjXN0GJ0WA4u7O/6pmO78BNG7XJ+t2ZZXPkf0RxF17vM/IMtppAN0GVHegP
	 pDtMEz/gYs8hQLB+TgLCIaHYx9n3OZjAUTKroECMuCHnmaIG7qVNwfcEQ7VdMURx1e
	 FLi9N+pcEIetBSlYuMal2Rc0mjKnurfH6/fa0Yz6KHUgrp/40PJAqreDgv7D2l9dt/
	 zWThTZinjb9PA==
Date: Mon, 16 Nov 2026 18:30:07 +0000
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
Subject: Re: [PATCH 02/19] dt-bindings: riscv: cpus: add the XuanTie C907
Message-ID: <20261116-habitual-oxidant-dfbbe0c4829d@spud>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-2-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WkjwqmRm5O2s7mCk"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-2-eb71ec3ee523@iscas.ac.cn>
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

--WkjwqmRm5O2s7mCk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--WkjwqmRm5O2s7mCk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtLrwAKCRB4tDGHoIJi
0lnpAP9C3fwKbN6HqfeFdwuatnKF0/9dHaDjmwYnhpF9IPCROQD/QgX5d1rfH6O5
yDgfnkvfBWYk3vACy1JoglUaB4u6uwM=
=wtAm
-----END PGP SIGNATURE-----

--WkjwqmRm5O2s7mCk--

