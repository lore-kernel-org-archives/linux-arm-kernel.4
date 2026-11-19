Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE572606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H/jXzbf3;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=KjJrbJf8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TLJdGoS9r1T7KR95Uief3yDjoKy33GQqIlCGmqAoB1k=; b=H/jXzbf33uXraCsCsFGFd4S+ih
	J3vUuKnqU7fjq4GFUYnyaQpLTl86FICfREp0s295FBH/2zBgwTGS25kfQBborx/ht2VLDr+eKbd2+
	hRnx6Rn2IUg3VAx8f5o8F4Tzoxrdn2RRiOMI8igFVmQYGCp3/DrK26vo45TATOmd+6WMUplLXM4OU
	i9kE0ZmabMXCw8CQsRj9tnvOHAqz31AC2cdTPPDReFmI+KMGYokthsXhWNHxl95FD1AypHTW84THG
	8b9XFhm5L+eZ8znq3dTJUVZN7DsjheA/T6XkPJ9b6T14fYYtoav4+0OhIVDAUEhUNRVCzUBjiq3/z
	QbzBmjpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Yh-0000000CxH7-2wn1;
	Thu, 19 Nov 2026 18:08:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Yf-0000000CxGX-1mvH;
	Thu, 19 Nov 2026 18:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=TLJdGoS9r1T7KR95Uief3yDjoKy33GQqIlCGmqAoB1k=; b=KjJrbJf89Fy6ntCyHT2J6G20qx
	8iSQUgJ+E/LEAtfBon2l5MeYNS3hvmrcMYMqdnsbxHA9hpH2jq35LhPuFzbsFUds5q71yCI5LUwNU
	EnOKnidcooVwCxHQmBAMViV85snBZ6O7a+rbYX8WhjcK8UmmfqiLaZp5BAzT2NkcMdcn9mpi+TWCj
	x3tOMQFjf6y1SQ8TgKXvLp0ol0S/uGWtd1ha0w0xKWNCUysOXqGrNS9ANCLTZXp4KyL3dM90eIVP7
	r78hPh9Ft/RRpGNpBphmEqzK8xzSIQetweteM9rYtPSn8V3v+XPCvrSx3dpCVCsHya2AU2qxhJYm1
	Uibsr1sQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>,
 Ulf Hansson <ulfh@kernel.org>, 1579567540@qq.com
Cc: Cunhao Lu <1579567540@qq.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v5 2/2] pmdomain: rockchip: Add RK3572 power domains
Date: Thu, 19 Nov 2026 19:08:19 +0100
Message-ID: <z4ZFdDPMSaWK2zh19ZM7pA@sntech.de>
In-Reply-To: <20261118-add-board-ok3572-c-pmdomain-v5-2-f1af919dd434@qq.com>
References: <20261118-add-board-ok3572-c-pmdomain-v5-0-f1af919dd434@qq.com>
 <20261118-add-board-ok3572-c-pmdomain-v5-2-f1af919dd434@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100829_528027_32E21E5F 
X-CRM114-Status: GOOD (  22.24  )
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

Hi,

Am Mittwoch, 18. November 2026, 10:11:40 Mitteleurop=C3=A4ische Normalzeit =
schrieb Cunhao Lu via B4 Relay:
> From: Cunhao Lu <1579567540@qq.com>
>=20
> Add the RK3572 PMU register layout and all 14 power domains, including
> bus idle requests, memory power controls and firmware shift-ready checks.
> Control the NPU voltage domain around power transitions. Keep boot-enabled
> IMG, VOP, VOP_PRE and VO domains powered until genpd releases startup
> protection after their consumers have probed.
>=20
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

There are a bunch of smaller issues below, but I guess my biggest question
is around the voltage-domain stuff.

I guess the first question is, why do you need that?
The TRMs of both RK3572 and RK3588 have the voltage-domain power-control
registers, but why do you need to control them now?


Side-question, how are voltage-domains handled on the other SoCs.
The RK3588 also has the PMU_VOL_GATE_CONx registers, so I guess
they could also be turned off?


But in general, if you need to enable the voltage-domain to enable the
power-domain inside it, this really sounds more like a power-domain of
a different type - because the wiggling inside the power-domain
handling below looks strange, and we already are handling domain
trees.


> @@ -377,15 +417,16 @@ static bool rockchip_pmu_domain_is_idle(struct rock=
chip_pm_domain *pd)
>  	const struct rockchip_domain_info *pd_info =3D pd->info;
>  	unsigned int val;
> =20
> -	regmap_read(pmu->regmap, pmu->info->idle_offset, &val);
> +	regmap_read(pmu->regmap, pmu->info->idle_offset + pd_info->status_offse=
t, &val);
>  	return (val & pd_info->idle_mask) =3D=3D pd_info->idle_mask;
>  }
> =20
> -static unsigned int rockchip_pmu_read_ack(struct rockchip_pmu *pmu)
> +static unsigned int rockchip_pmu_read_ack(struct rockchip_pm_domain *pd)
>  {
> +	struct rockchip_pmu *pmu =3D pd->pmu;
>  	unsigned int val;
> =20
> -	regmap_read(pmu->regmap, pmu->info->ack_offset, &val);
> +	regmap_read(pmu->regmap, pmu->info->ack_offset + pd->info->status_offse=
t, &val);
>  	return val;
>  }
> =20
> @@ -394,7 +435,7 @@ static int rockchip_pmu_ungate_clk(struct rockchip_pm=
_domain *pd, bool ungate)
>  	const struct rockchip_domain_info *pd_info =3D pd->info;
>  	struct rockchip_pmu *pmu =3D pd->pmu;
>  	unsigned int val;
> -	int clk_ungate_w_mask =3D pd_info->clk_ungate_mask << 16;
> +	u32 clk_ungate_w_mask =3D (u32)pd_info->clk_ungate_mask << 16;

why does it need to be u32 now?
Yes, the mask should probably be u32, but why not change simply change
the global type then?

> =20
>  	if (!pd_info->clk_ungate_mask)
>  		return 0;
> @@ -404,7 +445,8 @@ static int rockchip_pmu_ungate_clk(struct rockchip_pm=
_domain *pd, bool ungate)
> =20
>  	val =3D ungate ? (pd_info->clk_ungate_mask | clk_ungate_w_mask) :
>  			clk_ungate_w_mask;
> -	regmap_write(pmu->regmap, pmu->info->clk_ungate_offset, val);
> +	regmap_write(pmu->regmap,
> +		     pmu->info->clk_ungate_offset + pd_info->clk_ungate_offset, val);

both the clk_ungate_offset + status_offset addition should probably be
separate patches, as they should get a descriptive commit message on
why they are needed.

As this then also includes the changes to rockchip_pmu_set_idle_request()
and rockchip_pmu_read_ack (pmu -> pd parameter change), this would also
bring this diff down a lot :-)

I assume the reason is that Rockchip engineers again sprinkled necessary
information bits in even more random places.


> =20
>  	return 0;
>  }
> @@ -433,9 +475,8 @@ static int rockchip_pmu_set_idle_request(struct rockc=
hip_pm_domain *pd,
> =20
>  	wmb();
> =20
> -	/* Wait util idle_ack =3D 1 */
>  	target_ack =3D idle ? pd_info->ack_mask : 0;
> -	ret =3D readx_poll_timeout_atomic(rockchip_pmu_read_ack, pmu, val,
> +	ret =3D readx_poll_timeout_atomic(rockchip_pmu_read_ack, pd, val,
>  					(val & pd_info->ack_mask) =3D=3D target_ack,
>  					0, 10000);
>  	if (ret) {
> @@ -547,6 +588,9 @@ static bool rockchip_pmu_domain_is_chain_on(struct ro=
ckchip_pm_domain *pd)
>  	regmap_read(pmu->regmap,
>  		    pmu->info->chain_status_offset + pd->info->mem_offset, &val);
> =20
> +	if (pmu->info->chain_status_inverted)
> +		return !(val & pd->info->mem_status_mask);
> +

again, introducing this new parameter should get its own commit and
descriptive message on what this does.


>  	/* 1'b1: power on, 1'b0: power off */
>  	return val & pd->info->mem_status_mask;
>  }
> @@ -671,9 +715,37 @@ static void rockchip_pd_power_on_rollback(struct roc=
kchip_pm_domain *pd)
>  			pd->genpd.name, ret);
>  }
> =20
> +static void rockchip_pmu_vd_on(struct rockchip_pm_domain *pd, bool on)
> +{
> +	const struct rockchip_domain_info *pd_info =3D pd->info;
> +	struct rockchip_pmu *pmu =3D pd->pmu;
> +	unsigned int val;
> +
> +	if (!pd_info->vd_en)
> +		return;
> +
> +	val =3D on ? pd_info->pwr_w_mask : pd_info->pwr_mask | pd_info->pwr_w_m=
ask;
> +	regmap_write(pmu->regmap, pmu->info->vd_offset + pd_info->pwr_offset, v=
al);
> +}
> +
> +static int rockchip_pmu_wait_fw_shift_ready(struct rockchip_pm_domain *p=
d)
> +{
> +	struct rockchip_pmu *pmu =3D pd->pmu;
> +	u32 mask =3D pd->info->fw_mask;
> +	unsigned int val;
> +
> +	if (!mask)
> +		return 0;
> +
> +	return regmap_read_poll_timeout(pmu->grf, pmu->info->fw_status_offset,
> +				       val, (val & mask) =3D=3D mask, 0, 10000);
> +}

this definitly also needs way more explanation




