Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B961A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3frwz4Wv;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HFTBPk7f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uWITfgyRJ+DT3n8YFgueon79iakRaQERwgzzXSP2YYo=; b=3frwz4WvecxAVOdtHKETmpNkE9
	IrSSF6eD78G9DGWYcf/hSXhA8hKhiyaDWY6vX1bZtkAekVPawFLleQj8bMRiCxHNx1en11waLY1ma
	FqP/3LjGPSb+x786CC+OamGb73Scj/vFukVvC4YSqD0a3GMvj9iF1Vsp22XeEhQxzqi1EuKI4TuWR
	RRA2uPRw42eelJJMkSM5dzteRyoQEtC98e+6N/SZ/5OprfR1/OSc8is0DYxT69xP0uuNhhcjSpODu
	b/88/OpWmy2jlXe88j02TuEqKiXpL3yNcOi1OKI0hlIVI8IQ17qvwDo3WOBaREep5hF1bPObLgpQw
	oz5lsNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkaq-00000005iFX-48M3;
	Tue, 24 Nov 2026 07:05:32 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkao-00000005iED-3thS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:05:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso29195365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 23:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795503929; x=1796108729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uWITfgyRJ+DT3n8YFgueon79iakRaQERwgzzXSP2YYo=;
        b=HFTBPk7fc8IEIK0HDXoqCBxoacKGWlDXZSkLkSVluZILOUCjkbOJAjKQPjZEE1UTab
         KJYUefDbnfa3y2pVrbbmTVBFUq6dsDZuhzvKSZYHaeXgb1SPDArbg7V9QkzpUHwBFbwG
         6mubIDIqjM1EEdoU7xV9CpnR0gGyDQWAq4yxnz4dLGb3/79vmPXvyrh2hwqCvmUJ0PUO
         i6i2q6rdmk7230QnwnYEdtJNB08Whd83qRLvHcqFBhFpwkUPLiudWHC9ui4fu0WG5X/+
         m9wKIjiRXmkvx9ZyZEB/5J64tRiINut7XqmXtfdlOpzaapa6CuKAKA4kPWdIbraBEJ1p
         jHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503929; x=1796108729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWITfgyRJ+DT3n8YFgueon79iakRaQERwgzzXSP2YYo=;
        b=J+whdN40vFgmbX/4uejXD3TLIDx7pgzBDYMzDbtHkG92D5l+ZNToWd8feJqFBJuoQi
         UlH+B6vYL84w4Gv142C/z8C0qUcf/A+8+ECROFsjyHqLI2bLeUTwKe5Q3TMaR8Bya3Zs
         MAiyZ7pJktx+7JbUrg2LUmRwM/rbn+zHrIVL7kNRrJ+rztdTyRrJW/+xIJ+YC4slRGDJ
         zOqN7TiO60sRRFZn3TFyMhNbN7t4GOkzTyyFbJmsB+w37T85YPswnpBRUo2lhvLpOLBb
         rLS/L/SJUjmLejnLKcPpvOQcumkUMfE9oRbFnWs9DRenD0jYVPr/wiPi+gvoOxNkSM4x
         K+HQ==
X-Forwarded-Encrypted: i=1; AL+hErEDUShbtmlXD6Bda7YiuuRwJT+IUefC9vSwz2rw5uU5HdYf3dzNxx94Ca5FesVvLICwPhmkc70gj5CK2F5T9w4C@lists.infradead.org
X-Gm-Message-State: APuU4Z9t8fxMXEMtdL8kgBP2FxSntlv8OKPHzMc14vtSZV5/GFBPk5uJ
	tzzgDtuwkLg0jlf/Hl7QjPD980L8xVkG++accEBK7i5eWP84RWtaXb5sPCHh+WOsc0c=
X-Gm-Gg: AZFdTZeW3rK96CIqtyHwGE9/zFUvfPceVdoJkPkoUdrzPhK9WRXjX9fhJ0vhtjFTpke
	f8LWCJTL+pJrh3qzS1cNO/yR+19hLDvp3YSjvmVGeahN265UkHp4bLpTP54iyTevSEwOb1F2pKG
	wz1B0hmyZoW3A4s2VlTAFJmgSDlYDtmkRgmBhgdL4IKsS3hdPF5OrQLF13meCawbLyMzHxlt2Ic
	HANMfb8tS8hl3w4x13zABON64ywaTYiKq3Tm9lnksOb6arMVWwSsg2FQVPMKGo83a8WW1VwryRz
	9FhQauJmUgEfXrprP0sf3oLJvG3UqM3w+tCTZGCkr/X1ftLJ3SpK98/y9ibaIyCQX4FgbQfaDFm
	cKeGAT9MiwRZZ39F4UdORbTwPOJ1wue/XhVBJpKCldn+OXEDERH6XVoPA3qZPSXIX7qEmZOl7ek
	cyuWjr913VqEcQxtNOMjJ8qkHpRy027D6kGTo+e0XyVPwpQCD0waJVPvej/0UMPnuBd1FRBx1Ra
	bBNwIJyx5my6P5pxv9Hvj/N6XPnOinaby+pg8myDFv8yaO18ik460PXqW6AX7lt7QLL/Dg9+lw4
	tTyoM/WujCziE3TyZFV9HD8xjrUhShEXNDA=
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr324067185e9.29.1795503928774;
        Mon, 23 Nov 2026 23:05:28 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8526cbd0sm541592115e9.0.2026.11.23.23.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:05:28 -0800 (PST)
Date: Tue, 24 Nov 2026 08:05:26 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: filipp.dunsky@gmail.com
Cc: Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwrng: Add Cortina Systems CS7542 TRNG driver
Message-ID: <awU2-KjkZB7WvqfX@monoceros>
References: <20261123-b4-cs7542-trng-v1-0-92d9ffcee531@gmail.com>
 <20261123-b4-cs7542-trng-v1-2-92d9ffcee531@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mtdygncuvh4wucsf"
Content-Disposition: inline
In-Reply-To: <20261123-b4-cs7542-trng-v1-2-92d9ffcee531@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_230530_994094_8470DB36 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--mtdygncuvh4wucsf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] hwrng: Add Cortina Systems CS7542 TRNG driver
MIME-Version: 1.0

Hello,

On Mon, Nov 23, 2026 at 09:41:35PM +0300, Fil Dunsky via B4 Relay wrote:
> +#include <linux/bits.h>
> +#include <linux/hw_random.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>

Don't add <linux/mod_devicetable.h>. of_device_id is already provided by
<linux/platform_device.h> with less overhead and build dependencies.

> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

Best regards
Uwe

--mtdygncuvh4wucsf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsFNzMACgkQj4D7WH0S
/k4RvAgAkmX1z3ggD4bQYR5QDbQBtW/xgm40V3vJbHo8sFlOzs9OnglLP+iPjhHu
WKQBnpxjsqZITO8X1LvclAujKd6LAR/OEzTxOML37xIoq2uBbct6r4uBVug8dmzk
0TZf3jIxobXh6AuI2klxHcrpbIkEKAJgKFnJNJnRnS2pjQnmue649DpG/SF2PgAm
tIIPrcfWA1AyLg82sa98l6cfBXT/Cj1+457Y+hc7mN9Vs6T+gLTj9cRd+VHY6cW5
FqY3RUG/SNcyRVT4K6C6iR6RS2S41VNXYMCkhMXLIxu7ERVkC/tz2juaeFdUr1Zp
bBg0EPgOCTpcZl2EyaSSblW1G3fqCw==
=IJHG
-----END PGP SIGNATURE-----

--mtdygncuvh4wucsf--

