Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737FB606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D7GCsX99;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MUEJXcyS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/btzFdrmY5XJBoGvPfLZSd2G3pBXBTIwDkFPrz2VqSI=; b=D7GCsX99XqF01QnqV9V9GybQNL
	1XUhSFl4zfkmsp0Jz/dScmRd45I/CnMl2wqGE2+VsXlihQ4bmC9ThDH0n4etpxz8NLSmNwiSDszsW
	Tq2GDyUGVfA95RwggzLIn1QplsOa9OeAVtme3TskFj7l7KgUpD5B1PxbESWRfoz5PMu52iMop0tfk
	F3qFmtU3+muzMNpLxJURbMA/ceIwp1KxU+IsTMW4aOszTFf/9LiOK+afQpnRwzm+O9LxYa/cSbOSd
	VEb6YbIA++0uwc4tgFNWx/TmbRILGfSF7bEYVl+qYxy42BFJ2Zl+IIQOhW/WyLxh6CQrsaeGfj1Ah
	oaXAX/rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNH5-0000000D95g-2Uio;
	Fri, 06 Nov 2026 16:58:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNH2-0000000D952-27Sm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:58:45 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8369295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 08:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984322; x=1794589122; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/btzFdrmY5XJBoGvPfLZSd2G3pBXBTIwDkFPrz2VqSI=;
        b=MUEJXcySsadMLBKHylXFPr6REcSPYHpn00E0fi+BvTtHx5B9dKkfodvrriDHUD7PxM
         Q8zR2Fh04L4PJyo0TCYrbc2k47nrR0B9s9wWjoz2EdNuIvK8wQYS7FJ8pZYjofMBBvJU
         As2n+f2fv+c1HGKwg2Rd099sB/zYrq5y+YiNHvchtp0WROjkN6JcUFAnlK7dRTh/cWX3
         msRaz8eyUtAMrmRfMoGji5rWnzMQYI6n7joNtzUduxTmKTs67tTq+9vjySD464zuQeRK
         I2utClJoKd01VnpkIFcQEJigWJS4NlG8tMQ8rj80K3km6wd++Jxn0Bom7XZ7g2uoioEi
         uxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984322; x=1794589122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/btzFdrmY5XJBoGvPfLZSd2G3pBXBTIwDkFPrz2VqSI=;
        b=ykwO2lJJHzRsW/vHLGaubezqLsoTZ5sJiNGPv4myto0xzfsskQt5MFcrqU/u1+Kipf
         1BPZOMd8LsWBvTKMocRg43hQQSNCsqs6PmewNPZNcnyUelp2Jv1KM3yzFbXPdPys/AYB
         QaTw70jOnaz+OJM1IM44uv1njqfQnW6bvnepo76uM33zNotJOVzaKsS8z+b/p7xDeq6q
         uWkGbAIRLXsW1/zBvBF5n9f2ooJCb7pGSqRJ+b0laPKh9Hiu1aOqJOygeWv7zqffvLAz
         nXtCp2EuSX2rAw6mRLgHE40ahwDLLEC/GQkg8Lzh+N7mQS+16+MwHazcyqx/xmG8Fhck
         pAaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJwdahqfYXaRtM0v602tbgkw7h3PHYQxNqTdgkkIMuWYH/U4krWa62siKcwd2NOZjcKtj0+/LVl/1Bn0oTxjDX@lists.infradead.org
X-Gm-Message-State: APuU4Z8uybxCZq3Jsf6Rz/yTDYYWIW1miZajbSYnY9pTCP12FPmpIRlv
	mxOQWcBnYNXHnYZcX/iW5ynxLGZOOKhxkxlN/lvo6mkv/lqNYojG0TGxaAQ/7eaRij8=
X-Gm-Gg: AYBFou3qNLat/+lz9LPJYxmOi1juVIN+mpkoRRoUBN7mUjbVBKJ37ieTyATdQClm6TJ
	Pi3lSzDl7AOe6Rd4W6igpZ6pIoza3sizV/pgtT3YyEn9yB8R2KOvJkqbXTX9AUoWPj9TBhJP7zG
	0sBvl5mv50ktPm9gg3na5o0mL8DHn5sGAlM5fNYXR2Uo0A3b646xy//Ia9z6ymB5CKWDTciSTVO
	m3Nxb+qUm2Ghcx0cyjC8v68wxuXpjM92cfEtyyNhJv91xr4zMBNtNyCHCCuVMYXzy2v2WOoADI6
	E5bnGJYDAD0ve8ojo4DquLQaMRh4pQ1hevkv65/bxtoHELeMAODtIAoAbak+ksjk1qUEnQnqvN2
	UmoLt8SHhK7DzlGXWv4oegx5wPjAxDumvovcYZVUpSqWLqmguEodDQTwjLSwaD0GMtLH9JUlbjf
	53KH9eTnuH4EmMEh/UOP+Q7LWtcb9Tahw7SCO/f2C1ttzli8GBnT0d9L9NxAPYCyhm71p2WZOjQ
	RmILVD8PiuNhTs6dPbeiPq+tIsTt+wii3viSv9X7lWcse9SjJTY8xhpmtqMCHbtVXPWUbnemh1u
	WTdmfGDNWbJKbN4i4kkjWRBF+A5KOC7k7A==
X-Received: by 2002:a05:600c:4443:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4b6df5eacc4mr55980675e9.10.1793984322588;
        Fri, 06 Nov 2026 08:58:42 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b6e168f331sm84947775e9.3.2026.11.06.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:58:41 -0800 (PST)
Date: Fri, 6 Nov 2026 17:58:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] spmi: Add SmartDV SPMI controller driver
Message-ID: <au4HBJBd7AD6WCeY@monoceros>
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-4-vamshigajjela@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6cl3pv5jzbmvlkly"
Content-Disposition: inline
In-Reply-To: <20261103042608.387626-4-vamshigajjela@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_085844_725932_783E00C2 
X-CRM114-Status: GOOD (  12.72  )
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


--6cl3pv5jzbmvlkly
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/3] spmi: Add SmartDV SPMI controller driver
MIME-Version: 1.0

Hello,

On Tue, Nov 03, 2026 at 09:56:07AM +0530, vamshi gajjela wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

> [...]
> +static const struct of_device_id smartdv_spmi_of_match[] = {
> +	{ .compatible = "smartdv,spmi" },
> +	{}

{ } please

> +};
> +MODULE_DEVICE_TABLE(of, smartdv_spmi_of_match);

Best regards
Uwe

--6cl3pv5jzbmvlkly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruBz4ACgkQj4D7WH0S
/k4fIwf/ezsGptNEg+r7UnyD+hRzsURzRkivO2yfuPqRfBVWrIwuZdenZrWx0joB
4KjrlqQByAt9j7aopLT/im6JfJWeKKeIWK6lETM+8NcOC64i8ukxqNPmF7BKnIkT
K6M7XSJpD1vQeLPOETP4L2ziJKD7haXC0+deYYXF25K+4woWQzOXriSGUNj2LYgz
7Vk86rxo2l9KMpeMTov2DHVtY7oV1ib2b5fpJQZCU0SRArZtIwyiEoj1oOK/YvFS
ZnCqYxZGpk1d4REvwo+PUGqeywtplhG+cSDaRexArjzFGa8pCFv8HkCPKSgeZLqF
k/O3LJaBjWZ39Ccmh/36kVLfX5MnOQ==
=lr5c
-----END PGP SIGNATURE-----

--6cl3pv5jzbmvlkly--

