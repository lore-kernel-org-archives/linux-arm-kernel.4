Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BC0606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 21:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=queoGZJv;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=cIZk8F7y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2rk+9h91UF2ccmiOZHWNjHja5T1YkUMf6w6s0Yio7b0=; b=queoGZJvnMmhVu9w/rocXW02BU
	+bT0IYI1pijONWn9SmTaiHoiWhZWkAb+b84qQUgj9asgFr2mKbijYY9Y9Ef/uwP54/AqxbcN4QP8w
	/mU1q/ECuejo9SRQtVgv6Q38Wr06v/JfjqTNnytPb+nNWuVVkZQwS9XsAN2ESLdV+c8zk/SV78EB1
	Q9sYnW/c2gScoqDGrIDcA4PNYP/O8s11B+OQyrI8wjbd0MYDzM/6Qj65U8oroO0fJGWkjO3Quiu7g
	DixY4F6Cw2zC2s5SfNJR1xYPz7zR/eV4de1ru3l4JoO2ND/q3LuJqqhlvnuVAddI9/D/KdGjyonys
	cJrYwT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9s3-0000000DUvy-3scd;
	Thu, 19 Nov 2026 21:40:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9s1-0000000DUuR-2cFM;
	Thu, 19 Nov 2026 21:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2rk+9h91UF2ccmiOZHWNjHja5T1YkUMf6w6s0Yio7b0=; b=cIZk8F7yhAFCNkrt6xE1Y+BH0v
	nyS733Z7MQ12xmYp4/P1CojN6TCgQBabqGw7NqzjcRoJWAf5mLCJA1KC5quBtfD73fHgeHJlxMGpo
	mMlbVftarWrNbpBNM6R2rsKwi1F4bXkvjVWiZvdzugb3218cxGNnce7ZNhfYD+xOyqWr7D2tcyrZJ
	LZgOv8Nh3URQ54loXMQxqq0tEL93UMM6mxK9DX/xu2H0izBE3NQ0OSoaa34tEkbUEh2Rj2hGyCoTK
	5crHzHwGpRM8GlOsDGUgmuCRXAeIhCPJQzqdPXR1PVlTxOPTMnzW4TDkPYss8u7e61o/I4V2BhF2R
	HyRZHyuw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Ye Zhang <ye.zhang@rock-chips.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: rockchip: Fix RK3506 pinctrl support
Date: Thu, 19 Nov 2026 22:40:28 +0100
Message-ID: <R9Lr9e5PRAa-_53xglqBFw@sntech.de>
In-Reply-To: <20261119211739.566874-1-jonas@kwiboo.se>
References: <20261119211739.566874-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_134041_690310_BE79D233 
X-CRM114-Status: GOOD (  10.58  )
X-Spam-Score: -2.1 (--)
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

Am Donnerstag, 19. November 2026, 22:17:39 Mitteleurop=C3=A4ische Normalzei=
t schrieb Jonas Karlman:
> The pinctrl driver added in commit dbd2317d7b9f ("pinctrl: rockchip:
> Add rk3506 pinctrl support") depends on a rockchip,ioc1 property not
> documented in dt-bindings to work, i.e. it expects the pinctrl node to
> look something like following:
>=20
>   pinctrl {
> 	rockchip,pmu =3D <&gpio0_ioc>;
> 	rockchip,ioc1 =3D <&gpio1_ioc>;
> 	rockchip,grf =3D <&gpio234_ioc>;
>=20
> 	gpio0 { };
> 	gpio1 { };
> 	gpio2 { };
>   };
>=20
> With the commit 63113d4fce6c ("pinctrl: rockchip: Add RV1106 pinctrl
> support") the driver gained support for using GPIO bank referenced IO
> control register blocks using the rockchip,grf phandle of the bank node.
>=20
> Change the driver to work with dt-bindings documented nodes and
> properties, i.e. something like:
>=20
>   pinctrl {
> 	rockchip,grf =3D <&gpio234_ioc>;
>=20
> 	gpio0 {
> 		rockchip,grf =3D <&gpio0_ioc>;
> 	};
> 	gpio1 {
> 		rockchip,grf =3D <&gpio1_ioc>;
> 	};
> 	gpio2 { };
>   };
>=20
> Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

thanks for working on this, also as the rk3506 devicetree has so far
_not_ made it mainline at all, this change cannot break any backwards
compatiblity - as there's nothing to break.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



