Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124CE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MEwwCYrG;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IzSnD1GS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f9MB3bWT0jyY4n2Kpgos+T2A2jxKzbR0OabGMZP+mY0=; b=MEwwCYrGPWHfESvltPPZEUrw69
	kGdDs4yKAatjfesDMwwo79qNoq/gs3i7NjW6JStRNV0DWN+cmPkfh0+ml79zqyR6z6Qnoy5hJvmVs
	zUP/z4XSWmGCxkykZkwMuQdrhtp/T+GVD4REC8G0yZ2+pzFnssnYfS5fO3ygEJIvMs0haPfBeRAZU
	e/VM3ITBRfbKOC3/lL4GUOM9+qon6RxuK8i/8+ce2qDncXGLmIcU1HjhqbTuhFoXRSXq3YPzoUvWC
	OepqKIjmcIlO2oJtvVvEPXxiZgUssJ4QWVcro+9NJ0l3ayS/XB/DxolI1T2oRKc8K8m6U6WXDum2p
	BikgWTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPqc-00000002cMv-45Jj;
	Mon, 23 Nov 2026 08:56:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPpy-00000002cFW-221U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:55:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20909045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 00:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795424144; x=1796028944; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9MB3bWT0jyY4n2Kpgos+T2A2jxKzbR0OabGMZP+mY0=;
        b=IzSnD1GSNzyw59hS9guQfEUrc2c7w8qLIvpHcQrBZjfDAp+3CN2RNr7VzteIDUua4K
         MlLYOMxcymM4MxfUdVdmUzYCDXUSuL/YWDk8Nr8xMDSkbLJsOrAjdv/DCicRIIPC+DTX
         kkeoR29iFSgwP177L8sxbvIBQJ55BkL3XxWwx8MoPN7uwzE6EYm6yUOFPZDihsBLASom
         Mr1zzjJOeTvg3C0/Oe6cveLHv1Af53acU8yFQjMfcZN/eMcugif0rKrz3zSi22238F0N
         F5I7fqcH3eEfT73lLZFBCuhSLSTS4HnEP3YaobCJp79Jf0F1NHqpjO4a7gsc8eKfmUbV
         1dHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424144; x=1796028944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9MB3bWT0jyY4n2Kpgos+T2A2jxKzbR0OabGMZP+mY0=;
        b=r9pyR5oNrNyeE9N2LlM6g+WsWGtdRRFGlCg3NVKPa6t/iMe1ggB7NQ8mWzA69uuWrK
         MoUM2wWgVaSkBJsrim1/8PpdX+7rAnBzNaPvjrGJLh75x+CNN9UcTi7xMKlRVcLnTDHe
         VF3XIFh1YPlEA1RyLqgIJvvO4es2E195m69Y2kGOWU7a+SCdQT1SJ6HIZZy3X8cZA+1K
         84knVQwxSl+Z1RkTz+1T9T9Gh6OYgB9WxS1/APE2p42kXlzkNPrMCnqQftFupG+qaGRE
         ztTu9XDrJt+j1IoFm5hU8cHnCANVv9EqFf25GymppdRYdfvK722FJs/bbF4GT0zfsioC
         49tg==
X-Forwarded-Encrypted: i=1; AL+hErFtqAx6tLdO0I1q+LWXgFmCVOWPY0nilDTApNSoFN2Bz2lYsQ5PDfaSmqM8FzPBVdP6KMZ/6zMp1D5JgmqIwiSX@lists.infradead.org
X-Gm-Message-State: APuU4Z8M5f3BKMVIpsLhMf5ESJmyTzTAE7qh5JkJQ4OTWKgOuB4iYunH
	O3xtHaL0DPyMiKzHxzjm3z0rTo2cFgmUJOtn/HoFkT2G6iBWBYkS3Sxo0a2psaCETTg=
X-Gm-Gg: AZFdTZdvWeGq9NIltDjlcPMhlxL63xwJWgG3gJHdvVQqnbF7QpSBAJidzCYmDhSJiWY
	MPLkZV6/qxhknSa8gpoux5kXbkyjI0791jq47gMSQbrG3q+vEIntyBQzaznss3yn51ClnusEBno
	HE0++WNgiBvB11FQhQvTUi0wxsoJ1OOnaUozdYd7HhkTZXDdCY9YdTlgBp0ZUxehw8T7vekR9CE
	HHu4h0kCyGVLx2j1NLXTsdydaP24m2UJN5nsNZm4ZNPPBnF1Wwou2EByMkyQvry+/DmMbmDGoL+
	lZpQ74WxplEw/NP4Ncn7hgFtmx4P4nf041p6WDqACumMUyY+vlbHzgZ/d3cOODgez1pieAIp6mF
	gs97TxCQ44R4HvkrwqAza9MpnOAew9IB/eUo7Sup/4RERCpg+Ysavw7NTuhbjanF7BJ9ugBd7fm
	p7wg0rI6ZqqkJfHkBJEVe5vCPkL+0BhUuo1RUVL5d7h+S6uUwMmtkdxIlj7q/TgZHZBOBEmoPCk
	0LT+e+V+PNVqTT/F/fbo4ZOk9KLByXy0xTy1WRdSuDhGUKzDwzgX/Z8lFpKo6fghoDCwHn97/jn
	qBLqorwwg1S5AH9q2O+GCDh5tRdzvIY7tMDc5HmYSHM/Q0bCXjwotUfvWFz2kthTIQTWt0KlQBZ
	io+kqyk1qV5OlJBKh
X-Received: by 2002:a05:600c:4f84:b0:4bb:5f3b:25a9 with SMTP id 5b1f17b1804b1-4bb88820f39mr208644975e9.30.1795424143773;
        Mon, 23 Nov 2026 00:55:43 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6bc8ce06sm20503412f8f.47.2026.11.23.00.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:55:43 -0800 (PST)
Date: Mon, 23 Nov 2026 09:55:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Florian Fainelli <f.fainelli@gmail.com>, 
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH] w1: mxc_w1: Use devm_clk_get_enabled() in mxc_w1_probe()
Message-ID: <awP9_l7UNqElhewY@monoceros>
References: <4b99426a-d831-4d55-9b3c-ce83ba9fb081@web.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fwfemldnzzy4vyl7"
Content-Disposition: inline
In-Reply-To: <4b99426a-d831-4d55-9b3c-ce83ba9fb081@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_005547_086539_04E958DD 
X-CRM114-Status: GOOD (  26.15  )
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


--fwfemldnzzy4vyl7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] w1: mxc_w1: Use devm_clk_get_enabled() in mxc_w1_probe()
MIME-Version: 1.0

Hello,

On Sun, Nov 22, 2026 at 06:03:00PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Nov 2026 17:52:20 +0100
>=20
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>   keeping duplicate source code.
>=20
> * Omit a clk_disable_unprepare() call on an error handling path
>   and in the implementation of the function =E2=80=9Cmxc_w1_remove=E2=80=
=9D.
>=20
> * Delete the label =E2=80=9Cout_disable_clk=E2=80=9D.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Not a big issue, but for me the commit log is too detailed, most of the
things mentioned here are trivially visible from the patch. So I'd just
write:

	w1: mxc_w1: Simplify probe routine using devm_clk_get_enabled()

	devm_clk_get_enabled() combines the functionality of
	devm_clk_get() and clk_prepare_enable() with an automatic
	cleanup callback registered to disable the clock in the error
	paths and at unbind time.

	Simplify accordingly.

> ---
>  drivers/w1/masters/mxc_w1.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/w1/masters/mxc_w1.c b/drivers/w1/masters/mxc_w1.c
> index 06be7bf0b715..f40ea120127c 100644
> --- a/drivers/w1/masters/mxc_w1.c
> +++ b/drivers/w1/masters/mxc_w1.c
> @@ -98,14 +98,10 @@ static int mxc_w1_probe(struct platform_device *pdev)
>  	if (!mdev)
>  		return -ENOMEM;
> =20
> -	mdev->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	mdev->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(mdev->clk))
>  		return PTR_ERR(mdev->clk);
> =20
> -	err =3D clk_prepare_enable(mdev->clk);
> -	if (err)
> -		return err;
> -
>  	clkrate =3D clk_get_rate(mdev->clk);
>  	if (clkrate < 10000000)
>  		dev_warn(&pdev->dev,
> @@ -118,10 +114,8 @@ static int mxc_w1_probe(struct platform_device *pdev)
>  			 "Incorrect time base frequency %lu Hz\n", clkrate);
> =20
>  	mdev->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(mdev->regs)) {
> -		err =3D PTR_ERR(mdev->regs);
> -		goto out_disable_clk;
> -	}
> +	if (IS_ERR(mdev->regs))
> +		return PTR_ERR(mdev->regs);
> =20
>  	/* Software reset 1-Wire module */
>  	writeb(MXC_W1_RESET_RST, mdev->regs + MXC_W1_RESET);
> @@ -137,13 +131,9 @@ static int mxc_w1_probe(struct platform_device *pdev)
> =20
>  	err =3D w1_add_master_device(&mdev->bus_master);
>  	if (err)
> -		goto out_disable_clk;
> +		return err;
> =20
>  	return 0;

This can be shortend to

	return w1_add_master_device(....);

=2E Looking at w1_add_master_device() there are error paths that don't
emit an error message, not sure they are all -ENOMEM. dev_err_probe()
wouldn't hurt.

> -
> -out_disable_clk:
> -	clk_disable_unprepare(mdev->clk);
> -	return err;
>  }
> =20
>  /*

Best regards
Uwe

--fwfemldnzzy4vyl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsD/4sACgkQj4D7WH0S
/k77kgf9EmPcIEwAzVRo6kECyMEJc45Xjnn9AdThD7oC/Gx6VUMQQbPauzt2UPVq
EPGTRco9qjVrbKq5TD+9PnMqvp5YpyujTitlI/4Ot30bdC17egDfWuTjZJ3tkh0J
yXyV1jzLTy2HUKizAclwIdiVYb+ma7idz7GXO4uab/wsXytomYiuffn41vxTC6uN
EStMlztHN7uFwxmiiies0bPR9k2pMqP8HbFcHI5b+DYJc3AGTwfZ9RUBWNrux7tb
V3yWHM69SXZzWDVhDEQd/mxBjlxfXztMiI14uz2I1W2cLjNd+7shMWip4SQTGrxi
gcS1M6jY+9uF29+WuZSxazEv+bsT5A==
=o1fQ
-----END PGP SIGNATURE-----

--fwfemldnzzy4vyl7--

