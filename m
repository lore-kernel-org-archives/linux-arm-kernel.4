Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF09A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4gufBPTX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=MBefhUwu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c/v4QTdP0wFTr9RiVb4M9LTtOgChhD0w31JKBca0pxM=; b=4gufBPTX5QqWQRR3iCa/JBeQV9
	08n63lMWrtAhLONmEPe4UqTl5vJ3V73eHOQTSin5squvHxvNOKRZH5q6co5WH+xHKUxtdIJtJ4YPI
	l7fWddYrr46lbtlJ+oF8wtl2dh8pZYo65oNfBa79jUwTq+J4nlNK9Tsj8pewRyWG/lnO72zyMnNs1
	S+cdzsydKAG8RbnIOuqRGGwEX1YYyEDsOhF0/mYLQoJ3Uy798vedbpe/SeKT2J0TNHjj8dqLypmqE
	JTqKJDP7TJjh9FCqmXa6Y1+A9Bu/YDee6qV4Mjm99XS7PMq0Z4fRFcj2r5Dm8DrA65/D+uPsMEdCk
	pW8o3T8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRHGX-0000000851d-3uOG;
	Wed, 11 Nov 2026 22:58:05 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRHGV-0000000850v-0hJA;
	Wed, 11 Nov 2026 22:58:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794437877; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PcClibU0ukI9g9mCDY9l6t4sjIeFRsG4jxmU2azHN95/6IHXvT7VZ0ftv7lu05O0gxPyTazGF5VPThpt8kYhfl/XdLUuKv+e7XnE+ZKnSWWegfGawMNHitYRLinpV36xU1zkmXIpWoA3DAm4yz3tKrlJf/QvLfUtSkUowvZWDb4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794437877; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=c/v4QTdP0wFTr9RiVb4M9LTtOgChhD0w31JKBca0pxM=; 
	b=NllP9KSA7uCEz5Buf+P5HpWky+kqVpTqoAHqyOYP6F1LJ8IaBTYxx/WmE1VztPskC6PgjoAfAnnHVlJ443MSCiImmFmThAmdRj77wXxiO8LHx9xqlPgI5DHyTiTP+aZHU8RreJdGcgk7cnpxaEKktr6BZcS62TRLGdr7215Lw8Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=MBefhUwutfEqxNQQQWLLqBWgtrPDUAdeMurRCQ2j7YWit8iXtGpVEaOloe48mNX5ZFu/DnKt0w+WEVVzWUEhZkXSYwqrAL9VmAlZ7yx+cTeg2uDugoe3Aa4xMCWgIwvTgaTxh3lnxKNKn7PFNN6R6dOKZPJeOCxH3FR9QcALATk=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=c/v4QTdP0wFTr9RiVb4M9LTtOgChhD0w31JKBca0pxM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794437876453820.8198898258573;
	Wed, 11 Nov 2026 14:57:56 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 781C1180758; Wed, 11 Nov 2026 23:57:52 +0100 (CET)
Date: Wed, 11 Nov 2026 23:57:52 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: aiyengar1990@gmail.com
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Kevin Hilman <khilman@linaro.org>, 
	Caesar Wang <wxt@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] pmdomain: rockchip: do not report probe deferral of
 a domain as an error
Message-ID: <avTxNzSvbWM673H5@venus>
References: <20261110-pmdomain-rockchip-v1-0-6b9fa6ebaa86@gmail.com>
 <20261110-pmdomain-rockchip-v1-3-6b9fa6ebaa86@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c6h4l5bp3f35fdzy"
Content-Disposition: inline
In-Reply-To: <20261110-pmdomain-rockchip-v1-3-6b9fa6ebaa86@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.427.16
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_145803_704234_C7E76E33 
X-CRM114-Status: GOOD (  24.99  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--c6h4l5bp3f35fdzy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] pmdomain: rockchip: do not report probe deferral of
 a domain as an error
MIME-Version: 1.0

Hi,

On Tue, Nov 10, 2026 at 07:11:30AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> When a power domain clock is not available yet,
> rockchip_pm_add_one_domain() records the reason with dev_err_probe() and
> returns -EPROBE_DEFER, but its callers rockchip_pm_domain_probe() and
> rockchip_pm_add_subdomain() still print it with dev_err():
>=20
>   rockchip-pm-domain ...: failed to handle node power-domain: -517
>=20
> once per probe attempt, and twice for a nested domain. On an RK3588
> board whose NPU domain clock appears late this is more than 20 error
> lines before the domain finally probes.
>=20
> Only rockchip_pm_add_one_domain() can return -EPROBE_DEFER here, and it
> already records the deferral reason, so skip the message in the callers
> for -EPROBE_DEFER and keep it for real errors. dev_err_probe() is not
> used in the callers because it would replace the reason recorded for
> /sys/kernel/debug/devices_deferred ("failed to get clk at index 1") with
> the less specific "failed to handle node power-domain".
>=20
> Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain drive=
r")
> Fixes: 6be05b5ec161 ("soc: rockchip: power-domain: add support for sub-po=
wer domains")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index d7df19e10000..70ebe5696b39 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -1050,8 +1050,9 @@ static int rockchip_pm_add_subdomain(struct rockchi=
p_pmu *pmu,
> =20
>  		error =3D rockchip_pm_add_one_domain(pmu, np);
>  		if (error) {
> -			dev_err(pmu->dev, "failed to handle node %pOFn: %d\n",
> -				np, error);
> +			if (error !=3D -EPROBE_DEFER)
> +				dev_err(pmu->dev, "failed to handle node %pOFn: %d\n",
> +					np, error);
>  			return error;
>  		}
> =20
> @@ -1144,15 +1145,17 @@ static int rockchip_pm_domain_probe(struct platfo=
rm_device *pdev)
>  	for_each_available_child_of_node_scoped(np, node) {
>  		error =3D rockchip_pm_add_one_domain(pmu, node);
>  		if (error) {
> -			dev_err(dev, "failed to handle node %pOFn: %d\n",
> -				node, error);
> +			if (error !=3D -EPROBE_DEFER)
> +				dev_err(dev, "failed to handle node %pOFn: %d\n",
> +					node, error);
>  			goto err_out;
>  		}
> =20
>  		error =3D rockchip_pm_add_subdomain(pmu, node);
>  		if (error < 0) {
> -			dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
> -				node, error);
> +			if (error !=3D -EPROBE_DEFER)
> +				dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
> +					node, error);
>  			goto err_out;
>  		}
>  	}

I suggest to fully drop those dev_err() and instead ensure that
rockchip_pm_add_subdomain() has dev_err_probe() in all relevant
error paths. Note that -ENOMEM should also be quiet, so its almost
done already.

-- Sebastian

--c6h4l5bp3f35fdzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr08uwACgkQ2O7X88g7
+prQGQ/+MElFeHJshgEN+c9kS/KDR0NI6m/JOuiYp1kUZIXBDsjEAzMTWNpGFwIj
46EAPO2ZZ//WIruRfH4hLCHFK14qvKRHlZCOcRuLvVUJmqysmXB5t5fYWVM8o9PC
t21TAjZVCE4tkMpYwxmYq8zzIrFttOhf9BJFDO1GNXMHDjva4vMe8+6A2sTgrU2D
WNZoGV+Zj+IkuE1nbKZQohxa48V9CahycI48mqAIjMcr+BndjykK1nX4PPonpWnl
CybGa3E588YOgLhBY1n0yIUt5mWHkHOnoVv7YhZ8X4QADSqygiFaMfZAafZLYn2T
3dYI7xkACo9kxHUZ5OmEuhEpBCHPYnjiRXn2+U+S6rYEkKYLI3hoAtr9RcAr3q/5
nPVFjUxmnsvQkG3zstJ98ZPMyTrCQC6r+q1wX7TTx8JE7sbUWDbNLAp4h55P05AS
Dlv2O4/ZSNAQ/5+xomkYxfthNzkU3YDNQQ9BGN8DSdShcj/zvLBbkczHkQYSUajg
MOMBX+uHNGTcnfgdyl45HzYaKQF6i2/TuKAp6FBUPXZR0NR1toFKjpWVOj9G3d9I
iGJIEOgLF25muVE6njnZmfk565q2nIMr+TyL19e+wh/2hlUTAbFIMtNXJOugQf0g
7GGCtZUP1Ooj0GERn1axXnwkXa8Zn1HH2Eln96TXbWN6WiO/r3U=
=Ul/T
-----END PGP SIGNATURE-----

--c6h4l5bp3f35fdzy--

