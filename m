Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9004606C00E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=st68jJ3C;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ANlytgWy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AM2+ROYz6zHyjM9qbGIPn3yG3QGJhtGkC3tgAmCv0WE=; b=st68jJ3CDZyqcLle86Xr2wJFFj
	L8YUrw/oyhPm3IPRjyrxpp3MoypugLv0RH7pAxpGghb8aI9VuFwv+uH4Ab8nWXrM82FzVlt/kIMsk
	BeIPcxjskSwND7+657WQ/zhqpUGfZAZMVh6drWxIYzBFmp5hg149AXU3Rl36rxM9s9YDa/jOvWhdq
	8YdmxWbtkuc1gvW6YIxPQ4su6EudDr5JcBE/QxVPH4pZjNlcTOUAjyEG4gX/O6h2E9BfC44q/+hPP
	EORjKrdp0Qn8dl9gAp/4lBy9qNP6Pbf94I/H8ptxUuCUJ9q4Qkaf0she7M2rmrxaEbXKBihAEyBOh
	XRLFD7MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPi7T-0000000Esvn-0wbU;
	Sat, 07 Nov 2026 15:14:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPi7R-0000000EsvA-0WKf;
	Sat, 07 Nov 2026 15:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=AM2+ROYz6zHyjM9qbGIPn3yG3QGJhtGkC3tgAmCv0WE=; b=ANlytgWyNbxksTlctB1IPmnOyw
	eVN8ZWy4Jk9Woz7x9MdiIUjtWgomTH3Zh3oLQLaWjyNesR8IAVyvb9htWNi0VjAJl5dImAwJ/2jhH
	4SO1BZKBOHp6QrMer/QOFmpOaPFFmv0FfchFRa2BZWwnH4tkavdWhHimHgzkzP6VM7iHox0J22vWp
	CrjI2E3FIyQQDpA8jkpGXZDEZPO/8UBflGmtaFZUzzQtUCarH4Chp36byFQyTGz9cvS+y18IMLX7B
	xdmvp03YJGwy2H0Kfg7A4+TskVQ9C4X4gxt60WeIJ41YdJhAgQXIiZsK1Mb3jikC525CkgbDGm8N9
	oVk5Kxuw==;
From: Heiko Stuebner <heiko@sntech.de>
To: rafael@kernel.org, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 6/6] powercap: dtpm: Add RK3588 hierarchy
Date: Sat, 07 Nov 2026 16:14:06 +0100
Message-ID: <17421425.hlxOUv9cDv@phil>
In-Reply-To: <973998404b628e5a995a06fbd0febce0802f79bd.1793666444.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
 <973998404b628e5a995a06fbd0febce0802f79bd.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_071413_166406_C2125702 
X-CRM114-Status: GOOD (  12.31  )
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

Hi Daniel,

Am Dienstag, 3. November 2026, 05:48:20 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Daniel Lezcano:
> The RK3588 has three CPU frequency domains, with CPUs grouped into
> three cpufreq policies.
>=20
> Add a DTPM hierarchy for the RK3588 with one CPU node per cpufreq
> policy, represented by cpu@0, cpu@400 and cpu@600. Group the three CPU
> domains under a virtual package node attached to the RK3588 root node.
>=20
> Add the RK3588 compatible to the Rockchip DTPM match table to select
> the new hierarchy.
>=20
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

[...]

>  static struct of_device_id __initdata rockchip_dtpm_match_table[] =3D {
>  	{ .compatible =3D "rockchip,rk3399", .data =3D &rk3399_hierarchy },
> +	{ .compatible =3D "rockchip,rk3588", .data =3D &rk3588_hierarchy },
>  	{},
>  };

the change itself looks good for the RK3588 (without variants), so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


but support for the family is sort of incomplete :-)
We have
=2D the rockchip,rk3588s (same as the rk3588 in terms of cores,
  but different compatible - see all the rk3588s-* boards)
=2D the RK3582 ... with a compatible of
  "rockchip,rk3582", "rockchip,rk3588s"
  Because this is some sort of chip with production defects
  where two _random_ big do not work or so and get disabled
  by firmware see [0] and marks them as "fail"

So as I said the change alone is fine, but there are additional variants
to maybe figure out in the future.


Heiko



[0] https://patchwork.ozlabs.org/project/uboot/cover/20250810222644.4095072=
=2D1-jonas@kwiboo.se/





