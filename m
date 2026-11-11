Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CB860A2607
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K3nLKuYp;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cc3EcpcL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8+ptz4g6/LlfBCXyV/bHsOFX7dT+x2twzdeYM1zeVdE=; b=K3nLKuYpUuLfYwZBra/amRVtqb
	Zcp4jvg9KwInWRYJRI5lsW+DOZejzIYVfBATmGUDbMPOL+1+AR3Bcu75KwLAejfKGjfDeDnsIWGZF
	KxWfqpvxRDVZafED09bMgJoJMJEEAy+2JHX52OY0+PEKOvY+4zGzeQ/XDMBb1QzFG1Kb7YHoHB8KJ
	BbkHGVskU8hwHTYpuEB3tsOReTGx8DYl2pSK5ym+BWEo7UerIMbHpNeBbBLWJDVKmFchTISfnZuGn
	kZqjACatNfP1qcjMWKulLAnbXOOQeAYuEcLCcgqmHIahylL0VHdLQDu38hJNbmB5Fn6VMXoKJOJ7g
	My/d0dRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4eu-00000006Bdw-0wPy;
	Wed, 11 Nov 2026 09:30:24 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4eq-00000006Bba-0lpZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:30:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48e47347279so1894316f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 01:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794389418; x=1794994218; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8+ptz4g6/LlfBCXyV/bHsOFX7dT+x2twzdeYM1zeVdE=;
        b=cc3EcpcL9xkhyNR2BY+bWN2bukye4Lg6fytjkp2/gGK5FUSq4D9wRYeLDoPcRUQETR
         hS80lFaY8K2N9m57UwovbJT4SYhiyeenGvFE1EHkFHY3ZWnN2Wo8zM49Ynq2NzTJFDgN
         ifEbD+LW7LeYoNPOXH07Cn560D/aR/9Ji+cy1xB8X57uJeV4tK04zurO4gkbLKxUEXHs
         072Idc/TVtre9pEPJ2O7AEEeQXQyf71Ory6bMiM64VcSjV0TOTVB/WWzNI+cZig4jLEc
         eqZclEf9LbdsCerghqHznRIvbI020MIYa0rh4qF/Vi+Oisff2o90Yu63FwAEcYrsFgJo
         V2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389418; x=1794994218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+ptz4g6/LlfBCXyV/bHsOFX7dT+x2twzdeYM1zeVdE=;
        b=XgxwnKqKfV+xg1rLJwGZwfe6bUY5+AJFpsCuSJIDlC6A25nityZGKXXElE9ZJLxJMQ
         /z7uP2qClsPSII7tFU6M/5JFiGMFXJ9TC0zOlVJSYalMO6uQzJqfIuv/uAWU/ab5nxMI
         AnGB9gH9fZz+FoAR0/ndHs+isK4Ej5rBrrwdoUDvKBfaIk2Gq4BW7oGxUx5OERMSomI3
         mXrYukSH26j0cuVDwEfxgJVv2W98subOJzsF1py/bKqRc60VGFtDgP2FeSwo83wNnQEe
         jZN+YDIj/AJY1bDPkKa1wRHtjaPiUMuleKdtgPpC0sK74g/2WlmlNPBws+9bfHWFvgDj
         AGqQ==
X-Forwarded-Encrypted: i=1; AL+hErFWjJnD/rYxTpCTUPvGWVH/gY0Gf8ZhFV7y9cHoO3Ol4pmwNLYjVOByLSK33n4T0SGM6eQW0KxZWlAtC75qHmtK@lists.infradead.org
X-Gm-Message-State: APuU4Z98BtpLsmUuzp08Jv6h8hU6JeN/i41el2fP1N9Tt3mi2xIOWmOz
	YTI+/JAX+fVIVO99C388CoI0cKXMAN60cUEmYgEn62RmnoAH09ltgsibWRWnOFkjlHM=
X-Gm-Gg: AYBFou3GO+IsMsmTwUSSmcMyDiabqN9DAdhgD+1TLzwe8td2wUf8CbYvgKoV6o7X14R
	oza6Wxs8v8kF9LXeaFZ80OMBKnAFZXw1AWh4yuJBUYGuiBkxSdQHuDcD1dmZJS3SHt5wduWVuEa
	CxHQ3JatxmarM9Zmc8zyiOlm+b/4sr6eWmWxTIPcN+v+huwD6spTj6Bh5lY7panQx+R+xfABmDE
	XQBIiydrM3/rXT4dGFT3Ncc/6E10USZBiB19/rJPMcsE1e3aMdpPXciZ++ljjdPYO9PAFteIdL6
	U7JSLFRc7Z2Vfx1KgSi5TN2UjeDBqik0Su2FowtH2EE5KMspymMSTjjTVAfEiMd3gWZHR0gu11C
	MzDErzWIuP1B2ju/qiAA88ciXGpOdYivs0GcgA1DrQD9E8FNj/IyK89mB49BWfL23UxdM+0F4N3
	Z3iMuNSQWAXHUZqQ2tFQAcUS0Q71TcVOPIbJWzEXb2sPe9d95U69QxQwSiqjOaqltcTE2bQnw39
	M471P5Bg04/Z9FiWZ+UhYm37t/x1b2vkc+r+LHYxmoFdFZ1ivtWi29cXahhzDnjKEg5Wj5Ux9yM
	uKBBAk+DvdhLuIdltlrghUA9VMV+PeGLRLRXLEt2IqiTww1tFnWRV7XDAxbNYJpKgYB0SgHMDt9
	u44Kor1wlAUP31g==
X-Received: by 2002:a05:600c:34d0:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ba0938a143mr31163075e9.13.1794389417741;
        Wed, 11 Nov 2026 01:30:17 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba0204e22csm118293045e9.12.2026.11.11.01.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:30:16 -0800 (PST)
Date: Wed, 11 Nov 2026 10:30:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, mfd@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH v4 01/20] mfd: bcm2835-pm: Remove member of struct
 bcm2835_pm that is only used locally
Message-ID: <avQzDfZ_p4zx6kzm@monoceros>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <6b2500112538be613480d472090e5ff6d86339bd.1794347059.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u2nb6egeav4wcudh"
Content-Disposition: inline
In-Reply-To: <6b2500112538be613480d472090e5ff6d86339bd.1794347059.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_013020_609053_526D9C06 
X-CRM114-Status: GOOD (  20.37  )
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


--u2nb6egeav4wcudh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 01/20] mfd: bcm2835-pm: Remove member of struct
 bcm2835_pm that is only used locally
MIME-Version: 1.0

[dropping Ray Jui and Scott Branden from Cc:; their addresses don't
exist any more, adding Stanimir instead]

Hello,

On Tue, Nov 10, 2026 at 10:54:26PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
> replaced by a local variable.
>=20
> With that change enum bcm2835_soc is only used in the mfd core driver and
> so the definition can move there.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

While going through my list of open patches I noticed that I got a
review comment about this patch in v2 by Stanimir Varbanov[1]. He said
in July:

> The original idea was to re-use bcm2835_pm::soc field in bcm2835-power.c
> pmdomain driver where we implicitly decide which DOMAIN_GRAFX_V3D
> register to use (see commit d4aa5960025a "pmdomain: bcm: bcm2835-power:
> Prepare to support BCM2712"). So, instead of !power->asb the intention
> is to use bcm2835_pm::soc =3D=3D BCM2835_PM_SOC_BCM2712.
>=20
> Please drop this patch from the series. I'll post a patch soon.

As of next-20261110 drivers/mfd/bcm2835-pm.c is still the only user of
enum bcm2835_soc and
https://lore.kernel.org/all/?q=3Ddfn%3Adrivers%2Fpmdomain%2Fbcm%2Fbcm2835-p=
ower.c+soc+d%3A2026-07-10..
suggests that "soon" didn't happen yet. I think it's ok to assume this
request has expired.

Best regards
Uwe

[1] https://lore.kernel.org/b3d228fd-6138-4195-b63c-65b28691e18b@suse.de

--u2nb6egeav4wcudh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0NaQACgkQj4D7WH0S
/k5zEAf+L6c0cqcA+uxO/ogoK7h3f6yigs9+UEtO1Ai54fBtuS/s+FLlwa7NwJ8K
g3g9rUTaGYGRPYFd/E24kwuUH+EL0qhh3KSyBBUIVd+9Pi4ReYtuYOXnHKC7GugT
oEmwQNUnxlHponzyxasPadyxdICI6hQp7IisvXeU2qYe4VYkjc/LUH+uyv8Qa+1T
pXv5ACDnKaGHmnHpvdu57iiYQHlWuEmaPdI/M4yCT2sydfsr/fje7ZLtfyk+OB/e
vxOa7DDoeqzYQ/Hgyw/6+Hzwyq/UW07mTh4KBRfe7k9XGdFTB1Zouh6/dLY3v/Dv
uD6Fv9YMwpZbKUrn3e8+CRvUwarNcw==
=qqdY
-----END PGP SIGNATURE-----

--u2nb6egeav4wcudh--

