Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90976606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u/VbH9nM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WuOst7cw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ha/HIPyjbyejWB583GRHAkEiDBBqMXyy2GBchphEkzY=; b=u/VbH9nMhkW0bJUYmzbRqp7D4y
	akl1DzOuJglutHr2fTKCeQiv3Xvk46JqRqAQwlUSv5mOP9PezjqUkXcwAOc2IR4gQC1V3oVBf+5au
	1eDpB1NVz8lZJrdqWXwnHIhH9tBpLrhN9tmhPXc2meleWQ9Jx1LC2HnPkLYYgNGdFZkskd5VQZo38
	irEOHxkQXEmF7IWKttR77oEkUwqy6ohN4X3/VeaIYMV4b+alyRv6cHDtTdzaXdquvtwWzLgAcDK7v
	NZSN36fG5yNwlmqbHB6vtISsQC4pavraPEjinwGtSJLtNwkXrjKSuosig/dsRQWlSigPOqA7UdbJm
	NQblYFYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNUK-0000000Ev5C-1805;
	Fri, 20 Nov 2026 12:13:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNUF-0000000Ev4c-0EGu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:13:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 7C4AA40B6D;
	Fri, 20 Nov 2026 12:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6874E1F000C0;
	Fri, 20 Nov 2026 12:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795176782;
	bh=ha/HIPyjbyejWB583GRHAkEiDBBqMXyy2GBchphEkzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WuOst7cwpMEZCvVFgd4xC3oos6k09EFCLdlRuwAsf7ou9tU38PrBXsXgYNCSVmwiz
	 z0aCrAtouh502CZk5InG2i3uIL+wkz76+rSRIFurwERFfDYWseOLx6kyys7A6gSuvx
	 H96IKQsGTwlOujGK+2+yyMpj7xiAA8ALO2nnc2Of+tVTqHPGI/gHWfbTvYF2M7RnYX
	 VdVh62lDbI4wvV/oK6Pdk3HunEMKjGCKxE/uRfywdu99hRTCT4fbsq88saLyEU4BLF
	 6AR+IHgLKVS3gVd6L7y/oIRaERQFnKT6ZrdrYoB+3cqeWwxwfSdbSPavTAif8xnb06
	 EzsApg8vfLIig==
Date: Fri, 20 Nov 2026 13:12:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawn.guo@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-pwm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/8] pwm: mxs: Return early when disabling and fix
 error-path clock leak
Message-ID: <awA401UihKFTbVaK@monoceros>
References: <20261105143847.2559586-1-lee@kernel.org>
 <20261105143847.2559586-3-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4wybzqijlhfywcig"
Content-Disposition: inline
In-Reply-To: <20261105143847.2559586-3-lee@kernel.org>
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


--4wybzqijlhfywcig
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/8] pwm: mxs: Return early when disabling and fix
 error-path clock leak
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 02:38:04PM +0000, Lee Jones wrote:
> When disabling a PWM channel (!state->enabled), the PWM core permits
> state->period to be zero.  mxs_pwm_apply() currently falls through into
> the period and duty-cycle calculations even when !state->enabled,
> causing do_div(c, state->period) to divide by zero when state->period is
> zero.  In addition, if the requested period exceeds the maximum divider
> (div >=3D PERIOD_CDIV_MAX) while the PWM channel is currently disabled,
> mxs_pwm_apply() returns -EINVAL without disabling and unpreparing
> mxs->clk.
>=20
> Handle the !state->enabled path upfront and return early, and balance
> clk_prepare_enable() on the -EINVAL error path.
>=20
> Fixes: bf29c2ff82fd ("pwm: mxs: Implement ->apply()")
> Closes: https://sashiko.dev/#/bug/linux-710f863f-6964-4e4f-990a-e5043dbc1=
a87
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/pwm/pwm-mxs.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-mxs.c b/drivers/pwm/pwm-mxs.c
> index e1a3df6549fc..16233764fd3c 100644
> --- a/drivers/pwm/pwm-mxs.c
> +++ b/drivers/pwm/pwm-mxs.c
> @@ -56,6 +56,14 @@ static int mxs_pwm_apply(struct pwm_chip *chip, struct=
 pwm_device *pwm,
>  	unsigned long long c;
>  	unsigned int pol_bits;
> =20
> +	if (!state->enabled) {
> +		if (pwm_is_enabled(pwm)) {

Please don't call pwm consumer functions from the lowlevel driver.
Currently there is no locking in pwm_is_enabled() (as it only checks the
last state that was applied and not the actual hardware state), but this
calls for trouble. So either check pwm->state or even better the actual
hardware bit.

> +			writel(1 << pwm->hwpwm, mxs->base + PWM_CTRL + CLR);
> +			clk_disable_unprepare(mxs->clk);
> +		}
> +		return 0;
> +	}
> +
>  	/*
>  	 * If the PWM channel is disabled, make sure to turn on the
>  	 * clock before calling clk_get_rate() and writing to the
> @@ -67,9 +75,6 @@ static int mxs_pwm_apply(struct pwm_chip *chip, struct =
pwm_device *pwm,
>  			return ret;
>  	}
> =20
> -	if (!state->enabled && pwm_is_enabled(pwm))

Oh, calling pwm_is_enabled() is prior art :-\

> -		writel(1 << pwm->hwpwm, mxs->base + PWM_CTRL + CLR);
> -
>  	rate =3D clk_get_rate(mxs->clk);
>  	while (1) {
>  		c =3D rate >> cdiv_shift[div];

Best regards
Uwe

--4wybzqijlhfywcig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsAOUgACgkQj4D7WH0S
/k6CCwf/aI0uzeINZBznaAblpm51Dl7ZmWJqaoBuK5nyAOqbeRcXQ/pifFm41Miw
kGHTvXE8i4WorWu7o80RBB9hSvAv5Kag19OBLf3gqrRaZpUmQr58X+BVd0hlv9dW
CsYxvC4j450cZjy4H2ny2p0YybbnVGfYXvRXBwgV9lnUFfwrOSyJdBvBY1lmN3JY
vUnVyBILFhi2C72B3jLmF+tz2B2WgPPnN/AvQO4dW9yMOgKRT9NAPJtHl89XJIys
HdriNW6JgHsg6jUmO1ba4mFdaSFg41n//W+PbBXV4t9W4G9LcFRjDUDR33Of1n3i
BIewAhysMOSCzawWN7YXA7j+CIVmBg==
=vMBo
-----END PGP SIGNATURE-----

--4wybzqijlhfywcig--

