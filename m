Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5A6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3qbvABpk;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=m0b8hBMx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tASzR4wXMMc0YCUiYCKzn7cgOIVewXX+hCln4mp/s0Y=; b=3qbvABpkUiujDUcIK9XiTbOapJ
	Ed9K2wFhwtAurAjrzYN4JctNjvX/agd3wdPy3cVWG2fMZZ0UxFABdc4mnYQUoDp4x86JwA99Y3jfh
	kfHmbZ+DmPp+XfU6i/vqGMT/pdazHOOhj/RsVPcdicFahu8UYtFX2e2FCjT2ePhvmm09F0w4i4Bxi
	L5oc/pwCV3EqqvJ6aeJDUvx4jJg97oKlRED0p2tAbNjkfGbcqSz/8T3OK2yZ+1uRsf4bg2n4sbQo1
	D8f/4ZnFee2zY2764SA1fakhqUiRxu/ckdSJrX6Zd9s5ypanFxnRjiueOs5Ypv2mKr5oeEO5gbgn4
	UonA7OfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Kn-0000000BqlW-1nUi;
	Thu, 19 Nov 2026 12:33:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Kk-0000000BqkQ-1msl;
	Thu, 19 Nov 2026 12:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=tASzR4wXMMc0YCUiYCKzn7cgOIVewXX+hCln4mp/s0Y=; b=m0b8hBMxJPiifKd5Vrc1LUdxvo
	C/9lFoUO7AwB5+4VNJDtVLiKW6e1/PvUg3h8YwNppqqGxD8J9FtBKkVzaQRwg6u+ATgOmBW1Am/Sr
	spKP/EE+/EncvF2JkAQa6cc5Gj9tXjblT39lDR1BeR5G3HLX/hd//ePFePfNtvUQf5A/5+lVmVn+m
	bR09+Oj5XOHHN6qpeDZ1fBfcYu+f9LWA8KrWVbRbp3+ZntukKDgjqWugwDHYKOxEJWh2adqw3x6a3
	2OcYfOo/ejFAcVtfn15LA5q9btjRrwChiYIb5NpEywE+++Yjf+szUWO0v+8jfBNSFyXSxARb+l90a
	dXi+CK4w==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ulf Hansson <ulfh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, 1579567540@qq.com
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Cunhao Lu <1579567540@qq.com>
Subject: Re: [PATCH v2] pmdomain: rockchip: Roll back power-on when leaving idle fails
Date: Thu, 19 Nov 2026 13:33:40 +0100
Message-ID: <X4VYa84sR92_76QOKnT74g@sntech.de>
In-Reply-To: <20261118-fix-rockchip-pmdomain-power-on-rollback-v2-1-3e4e93a19996@qq.com>
References: <20261118-fix-rockchip-pmdomain-power-on-rollback-v2-1-3e4e93a19996@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043346_486659_BA577308 
X-CRM114-Status: GOOD (  30.41  )
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

Am Mittwoch, 18. November 2026, 10:03:46 Mitteleurop=C3=A4ische Normalzeit =
schrieb Cunhao Lu via B4 Relay:
> From: Cunhao Lu <1579567540@qq.com>
>=20
> When NIU idle exit fails after PMU power-on, clocks and the regulator
> reference are released while the domain remains powered. genpd treats
> it as off and may power off its parents.
>=20
> Request idle again and, if successful, use the low-level power-off path
> before releasing resources. This preserves saved QoS and notifies
> firmware while retaining the original error.
>=20
> If rollback fails, resources are still released and genpd may power off
> the parents.
>=20
> Fixes: 6b2690df3f03 ("pmdomain: rockchip: fix rockchip_pd_power error han=
dling")
> Signed-off-by: Cunhao Lu <1579567540@qq.com>


Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> This pre-existing idle-exit failure case was reported by Sashiko AI
> during the RK3572 mainlining work:
> https://sashiko.dev/#/patchset/20261022-add-board-ok3572-c-v1-0-0b0fd85a3=
1ee@qq.com?part=3D10
>=20
> If leaving NIU idle fails after PMU power-on, the domain remains powered
> while genpd treats it as off. The error path releases the clocks and
> regulator reference, and genpd may power off the parent domains.
>=20
> This patch requests idle again and, if successful, powers the domain
> off before releasing those resources. It preserves the saved QoS state
> and original error, and uses the low-level path to notify firmware.
>=20
> Validation:
>=20
> - All 48 host simulations passed, covering power cycles, idle-exit and
>   rollback failures, QoS preservation and error propagation. No sanitizer
>   findings.
>=20
> - Hardware testing on OK3572-C: 20 patched and 50 unpatched NVM1 power
>   cycles passed. Request-write injection caused native idle-exit polling
>   timeouts. The fix powered the domain off in 3/3 cases; the original
>   driver left it ON. QoS and the original error were preserved, and
>   retries succeeded after removing the injection.
>=20
> Persistent rollback idle and power-off timeouts were also tested:
> resources were still released with the domain ON and genpd OFF. These
> failure paths remain unresolved, and genpd may still power off the parent=
s.
>=20
> AI assistance:
>=20
> - Codex / DeepSeek V4.1 Flash were used for:
>   - Reviewing and adjusting code style to follow community conventions
>   - Automating tests
>   - Collecting data
> ---
> Changes in v2:
> - Rebase onto the next branch of Ulf Hansson's linux-pm.git tree.
> - Link to v1:
>   https://patch.msgid.link/20261101-fix-rockchip-pmdomain-power-on-rollba=
ck-v1-1-59a45783e33e@qq.com
> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 6abef60a5b4c..2c021784316a 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -648,6 +648,29 @@ static int rockchip_do_pmu_set_power_domain(struct r=
ockchip_pm_domain *pd,
>  	return 0;
>  }
> =20
> +/*
> + * The caller holds the PMU lock and transition resources. Use the low-l=
evel
> + * power-off path to avoid overwriting the saved QoS state.
> + */
> +static void rockchip_pd_power_on_rollback(struct rockchip_pm_domain *pd)
> +{
> +	int ret;
> +
> +	ret =3D rockchip_pmu_set_idle_request(pd, true);
> +	if (ret < 0) {
> +		dev_err(pd->pmu->dev,
> +			"failed to idle domain '%s' on rollback: %d\n",
> +			pd->genpd.name, ret);
> +		return;
> +	}
> +
> +	ret =3D rockchip_do_pmu_set_power_domain(pd, false);
> +	if (ret < 0)
> +		dev_err(pd->pmu->dev,
> +			"failed to power off domain '%s' on rollback: %d\n",
> +			pd->genpd.name, ret);
> +}
> +
>  static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_o=
n)
>  {
>  	struct rockchip_pmu *pmu =3D pd->pmu;
> @@ -682,8 +705,10 @@ static int rockchip_pd_power(struct rockchip_pm_doma=
in *pd, bool power_on)
>  	if (power_on) {
>  		/* if powering up, leave idle mode */
>  		ret =3D rockchip_pmu_set_idle_request(pd, false);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			rockchip_pd_power_on_rollback(pd);
>  			goto out;
> +		}
> =20
>  		rockchip_pmu_restore_qos(pd);
>  	}
>=20
> ---
> base-commit: 6f5c8ec9302c5ad8904dbdfe8cf2a538ff835572
> change-id: 20261101-fix-rockchip-pmdomain-power-on-rollback-c11e1014ef11
>=20
> Best regards,
> -- =20
> Cunhao Lu <1579567540@qq.com>
>=20
>=20
>=20





