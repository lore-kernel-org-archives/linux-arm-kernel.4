Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5343606D81E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3yOGG2gz;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=XYuv4fYM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rCtCLaXuoBajgUckhWEDWeKqUiY5Jp/q685S3dMTOBU=; b=3yOGG2gzmkB66uzghKH2RBR8QA
	shO0y+vO6muUslJpwlQLbI/95JZdslhdsnDOTnzG6cKcCwt/xHjVMUKt5qBDa1RpkOamVbt3BWYpT
	kiccN2AidwAt4jsGB/8ggUo0dOCc4x4/oH9Td6ufU21ClMI+REd322RCkW9dFCK4AAdnVa82234RL
	DGi9FM+wQWRSKp+GtKF7MvHGydK9+5os4ypCgQzCtFtH2uH5b34nvBiq81TPqbqI/4HPaHQVIgZKR
	Dk6r0qJoiDYYzdgWK+RSGvwkT88HIWlyBf90tSkK779E89M538l73kRFaRL9McOQ6R8Ef1bDVQcoX
	bhtyDu0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhk6-0000000Er2Y-1qxY;
	Sat, 07 Nov 2026 14:50:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhk3-0000000Er28-3cG8;
	Sat, 07 Nov 2026 14:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rCtCLaXuoBajgUckhWEDWeKqUiY5Jp/q685S3dMTOBU=; b=XYuv4fYMGfp8WiLCq7bsTniChM
	x8V2AxaJTLLbaFlm3r5jQWBGYPawdLNVgYZ3MJX8dPrAcBBZU7fgEAfk+qJ0Jgc94vK6gMgg9HGCa
	ty3mMgbt1Wl5eUiXOJMA5ZZNq6AcIFaEIO5aMZweUrTusjxTGXtN2IQdnQ1K/c0zaNeEN1y3NA/wv
	Z2Uc4uXtjeGObyJf+ElqpA5FQci4z8n4oH+1tE6muB/lYxBW5MGNxybGdZJloi110/LC2IGU5yLkN
	Ew0cFYosZD3ERCzLVZq4r29Mspj9YRYuv2mauBKSy6esUH3tT6nnjaYbw0L69ngw4jSJerd17qZcX
	EWTDz4cw==;
From: Heiko Stuebner <heiko@sntech.de>
To: rafael@kernel.org, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 3/6] powercap: dtpm: Remove duplicate RK3399 CPU hierarchy
 nodes
Date: Sat, 07 Nov 2026 15:49:56 +0100
Message-ID: <2454229.bcXerOTE6V@phil>
In-Reply-To: <f9b6ff8250f27e117facd372735b6c1f46e74926.1793666444.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
 <f9b6ff8250f27e117facd372735b6c1f46e74926.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_065003_928177_506C20F1 
X-CRM114-Status: GOOD (  19.88  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 3. November 2026, 05:48:17 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Daniel Lezcano:
> The DTPM CPU backend registers one powercap zone per cpufreq policy,
> not per CPU. On RK3399, CPUs sharing the same cpufreq policy therefore
> map to the same DTPM zone.
>=20
> Remove the redundant CPU nodes from the RK3399 hierarchy and keep only
> one CPU node per cpufreq policy. The backend already suppresses duplicate
> registration through its per-CPU state, so the removed entries are
> redundant descriptions of the same zones. Keep both CPU policy domains
> and the GPU in the hierarchy, preparing for one created zone per generic
> hierarchy node.
>=20
> Also fix indentation in the Rockchip device match table.
>=20
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
> Changes in v5 (since v4):
> - Add Reviewed-by from Lukasz Luba; no code changes.
>=20
> Changes in v4 (since v3):
> - Rebase on v7.3; no code or commit-description changes.
>=20
> Changes in v3 (since v2):
> - Rebase on v7.3-rc7.
> - Fix Rockchip match-table indentation here rather than in patch 1.
> - Clarify that the existing backend suppresses duplicate registration.
>=20
>  drivers/soc/rockchip/dtpm.c | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
> index b36d4f752c30..e71f315fbb6b 100644
> --- a/drivers/soc/rockchip/dtpm.c
> +++ b/drivers/soc/rockchip/dtpm.c
> @@ -20,30 +20,18 @@ static struct dtpm_node __initdata rk3399_hierarchy[]=
 =3D {
>  	[2] =3D { .name =3D "/cpus/cpu@0",
>  		.type =3D DTPM_NODE_DT,
>  		.parent =3D &rk3399_hierarchy[1] },
> -	[3] =3D { .name =3D "/cpus/cpu@1",
> +	[3] =3D { .name =3D "/cpus/cpu@100",
>  		.type =3D DTPM_NODE_DT,
>  		.parent =3D &rk3399_hierarchy[1] },
> -	[4] =3D { .name =3D "/cpus/cpu@2",
> +	[4] =3D { .name =3D "/gpu@ff9a0000",
>  		.type =3D DTPM_NODE_DT,
>  		.parent =3D &rk3399_hierarchy[1] },
> -	[5] =3D { .name =3D "/cpus/cpu@3",
> -		.type =3D DTPM_NODE_DT,
> -		.parent =3D &rk3399_hierarchy[1] },
> -	[6] =3D { .name =3D "/cpus/cpu@100",
> -		.type =3D DTPM_NODE_DT,
> -		.parent =3D &rk3399_hierarchy[1] },
> -	[7] =3D { .name =3D "/cpus/cpu@101",
> -		.type =3D DTPM_NODE_DT,
> -		.parent =3D &rk3399_hierarchy[1] },
> -	[8] =3D { .name =3D "/gpu@ff9a0000",
> -		.type =3D DTPM_NODE_DT,
> -		.parent =3D &rk3399_hierarchy[1] },
> -	[9] =3D { /* sentinel */ }
> +	[5] =3D { /* sentinel */ }
>  };
> =20
>  static struct of_device_id __initdata rockchip_dtpm_match_table[] =3D {
> -        { .compatible =3D "rockchip,rk3399", .data =3D rk3399_hierarchy =
},
> -        {},
> +	{ .compatible =3D "rockchip,rk3399", .data =3D rk3399_hierarchy },
> +	{},
>  };
> =20
>  static int __init rockchip_dtpm_init(void)

checked against the cpu clusters, this of course looks correct

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




