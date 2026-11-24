Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAF8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fos7NHHJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oEvA9JlK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hBb7CziwmaEve0HjYdLhPP8A5dGN2yZ/4+i68vOpPLA=; b=fos7NHHJqhS12w34ibxNPZAV9A
	gwGWuXAwU4bDZNqtAUoe2w0GvXPeqiBMlFb8iFPKY9rmt29u1uuFUmfVq5NNf9xp6DhWJ9EQvLZiw
	YlXVqA/ZMF2ZqDrsuUF4o2STyFBvFkBjJ4Y9YLgGzuulUOpvgmn3qMb+ZN2Xbz80nxoRx6DKVhoW8
	ywuu2xVn7kcxdJ2l+xYMdhl4WRuWSv3bkj8+CHiEJFeUg6M3GpErBHwyZVBC4Sl5PECpoOmhAnI1C
	UlR9PFxvn7DzhkcNW3yz8Wk6lAOKly0N7+MNjiGIYOhBOs9yYYbNDf46CUbleH3lLLKCRCcAd3uwX
	3kKf5JiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqj3-00000006eUY-0N0b;
	Tue, 24 Nov 2026 13:38:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqj1-00000006eUK-0noo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:38:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A543609D1;
	Tue, 24 Nov 2026 13:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48451F000C0;
	Tue, 24 Nov 2026 13:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795527501;
	bh=hBb7CziwmaEve0HjYdLhPP8A5dGN2yZ/4+i68vOpPLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oEvA9JlKinpj4CLa0YM6Nnu6QLmPew7urXHJpo4ZY1RapqnGsMeZoiTJ7ejlAh1wB
	 z/4fG12dJSX006iBcFfaePI0M82vQ/1lbBDsYhXFPYLKOy6787YEbjgE2NTsh2LOnd
	 YYS8P8FaEZ84WtS/L5EnxkSVgHxjjzXXJgJzz7UaNIBflVYxmWx/jPSoJ67DFMin7B
	 48FH10YLDBmkTcl4sT4odtP5IxcWGp7FR81EE+8XK88PyG8uKCTLcwZHYiH8ilxH3V
	 D8dFdk3x8iZiHSxDB1qrRh2eAI+U+TXTP3MiPubiQm0VUBtbo99xI2tQapnHz6R5jC
	 CTkpyiMWVUWdg==
Date: Tue, 24 Nov 2026 13:38:09 +0000
From: Mark Brown <broonie@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
	letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: Re: [PATCH v2 00/20] ARM: omap3: pandora: Modernize audio and
 backlight to use Device Tree to finally remove pdata-quirks
Message-ID: <f31b5adb-f6e8-4cab-8d92-17645bf1b69a@sirena.org.uk>
Mail-Followup-To: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
	letux-kernel@openphoenux.org, kernel@pyra-handheld.com
References: <cover.1795505160.git.hns@goldelico.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nSbMoxGlmoiutN4J"
Content-Disposition: inline
In-Reply-To: <cover.1795505160.git.hns@goldelico.com>
X-Cookie: Real Users never use the Help key.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--nSbMoxGlmoiutN4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 24, 2026 at 08:25:40AM +0100, H. Nikolaus Schaller wrote:
> PATCH V2 2026-11-24 08:26:00:
> Changes in V2:
> The series has been reworked and expanded from 16 to 20 patches,
> addressing review feedback and issues identified during hardware testing.

> Audio and power management:
> ===========================

> PWM and backlight:
> ==================

> Device Tree and general cleanup:
> ================================

This is dealing with several tangentially related topics over multiple
subsystems in a single series, this makes it a lot less digestable and
results in a huge series with an extremely large CC list and murky merge
strategy.  Please split things out into separate serieses, even within
the various subsystems there are batches of independent work which
really do not need to be in the same series.

--nSbMoxGlmoiutN4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFk0AACgkQJNaLcl1U
h9C5/gf8Cm0A5yFYJVQeo/T7StRW0pHrKh1EmIz06r7u8NK09DP+BhXT8qRk1I41
F7QT+nveX8OD+3Wz+Zyw7iAN7DdNLpIpci7jqzm/9hHAIeCU9h5mbXgGLRZXlLLy
MJ/MIEGdSDswMSbHdd1qbOAph080P7loJJrXcVFvWHRwH6+Gc6umpSBfu7uLM+D0
W+mM6fRvvz0Ou0YBcV+gvdp/18n0MiQ11v7dn3UsQaFHkJfTZzKZh6WOuUZ3JdKr
H1DtRqRYCJooQcaZpUWdRGDHEAMHXgW1+o7r3gEfGTklbsyY+xeOhXEBbU7jQLjd
SS7bE1b2Y0pMX5XKGAjMXMyqtG/2dg==
=LtHo
-----END PGP SIGNATURE-----

--nSbMoxGlmoiutN4J--

