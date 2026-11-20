Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C58606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oAShOjje;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVBLMlN2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AxXqgCeXal65+AfazlQec+YPsjLlcdM7scYBIZf41Bo=; b=oAShOjjedlhSl7nRmrT3XV6IuJ
	w3axF5zo41JLs7gE7k7pgxCuQsCNSNoGJyuLp4kYwVZGpRXxvabGPRmso84UmqpuCoWYxKDtM3GMk
	/ck3vGJ+0p6Tv1LWWe4tiSI01hgI0uLKZX7887X3w4j5k05UcJ+Vx2gGCsJn6iwyvSEs9yv0oVWGK
	mziZOO96A2HnLpjqD1C6cK/D8XqzYXyV1VmB/RHKNUuruJrNSjhMXJGM4p0bEceuhcEOglueyxDxM
	o8Q0e2lh2bXCkH/jgVmgpUH8cxrzHZLvJiRokU20ci9EplD/UAQ6WepSjsG9gxFR8rBEHTvYF4TN1
	iMWq5foQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNYd-0000000EvoH-0kH2;
	Fri, 20 Nov 2026 12:17:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNYb-0000000EvnJ-3SRx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:17:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id F36C8605C4;
	Fri, 20 Nov 2026 12:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 80AA01F000C0;
	Fri, 20 Nov 2026 12:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177052;
	bh=AxXqgCeXal65+AfazlQec+YPsjLlcdM7scYBIZf41Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XVBLMlN2rDwXEqWI9EpkZOKZOMAka7OKzB/f815QnjXrzl2oTHsRFDq8fkiT6vLaA
	 fgMuNuz3hFQ0LH9A756xzsAmUmCzfaC6trbvjTicc6iiK+AbU1sB8A4vW0utw19goY
	 3nu5fgPlRnvS3N4T6C6Z5V00sbFuPGMME0232q5zxO7v92Ls42JwuDUBDD/lIeUcGe
	 fe+q+Jq2/14m8j/+3b9hPxsuJo2hVxDi/TQ4X4iFbP6s35zFJ1Cv27MuYk8Lfmo8uk
	 mUKM/Y+wEBsrNYcTGv6CXv7UtR4DDMph5LERxOcWkt+3chyvUUgO1lFgH4FHqsEYKT
	 Iyxy4QJXZZfZg==
Date: Fri, 20 Nov 2026 13:17:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	Andrew Bresticker <abrestic@chromium.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	David Lechner <dlechner@baylibre.com>, Drew Fustini <dfustini@baylibre.com>, 
	Ezequiel Garcia <ezequiel.garcia@imgtec.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Grant Erickson <marathon96@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, imx@lists.linux.dev, 
	Joachim Eastwood <manabian@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Juxin Gao <gaojuxin@loongson.cn>, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Naidu Tellapati <naidu.tellapati@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	NeilBrown <neil@brown.name>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, "Philip, Avinash" <avinashphilip@ti.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sai Masarapu <Sai.Masarapu@imgtec.com>, 
	Sandipan Patra <spatra@nvidia.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sergiu Cuciurean <sergiu.cuciurean@analog.com>, Shawn Guo <shawn.guo@linaro.org>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Vaibhav Bedia <vaibhav.bedia@ti.com>, 
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Xiubo Li <Li.Xiubo@freescale.com>
Subject: Re: [PATCH 0/8] pwm: Fix various bugs reported by Sashiko
Message-ID: <awA6F830Ve_-vXBg@monoceros>
References: <20261105143847.2559586-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ziscyeot6fs5noin"
Content-Disposition: inline
In-Reply-To: <20261105143847.2559586-1-lee@kernel.org>
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--ziscyeot6fs5noin
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/8] pwm: Fix various bugs reported by Sashiko
MIME-Version: 1.0

Hello Lee,

On Thu, Nov 05, 2026 at 02:38:02PM +0000, Lee Jones wrote:
> These issues were reported by Sashiko.
>=20
> Lee Jones (8):
>   pwm: tegra: Prevent 32-bit period truncation and division by zero
>   pwm: mxs: Return early when disabling and fix error-path clock leak
>   pwm: loongson: Fix 32-bit control register truncation in
>     pwm_loongson_set_polarity()
>   pwm: axi-pwmgen: Enable clocks before accessing hardware registers in
>     probe()
>   pwm: fsl-ftm: Enable ipg_clk around regcache_sync() during resume
>   pwm: omap-dmtimer: Handle negative error codes from get_pwm_status()
>   pwm: tiehrpwm: Enable runtime PM before registering PWM chip
>   pwm: img: Unregister PWM chip before disabling runtime PM and clocks

I applied patches #3 and #4 to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

, for the others there is feedback to address on your side.

Thanks for your patches, very appreciated!

Best regards
Uwe

--ziscyeot6fs5noin
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsAOlcACgkQj4D7WH0S
/k5nKQf7BqdPQSazSO1K+yijinQelR1WIDWTGkr07M3GrZ3fE2uXEcC13bL2YOiN
7TqrdYEnutbLKMX623WYz1plfEsGkYbCTpey8GFx/i6mTwyzANsfRenSL5oOnQW6
p7GYp7eeYpG4c3qZF4rfTVamKqYs0CVGBlhdot/pHEKmdez+Q8G3Rgd0Iax/z0fg
PIi39hqy53xR/5ZrzTYWSIDPCLZLFk/HpkbjUjBHZfNsrLU/6xf0Drraf+BIYHx4
7NNE6/x7z63mP9ZwwUxkj/Odw+Dm1v37p/Z+Sfs4lq1SWU+bVOsbr37tmNskHg41
GUpO28qdynyg7dNXgTUHdCqNVivLNw==
=w9m6
-----END PGP SIGNATURE-----

--ziscyeot6fs5noin--

