Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6370606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F4uEkH+u;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=egvwS8nj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=; b=F4uEkH+u2LpM2lonSMNZqD8IZn
	0pQXmWMkKyMHcZLnGjUZZUh3CwHEodRzlXer831F8P0Y+XCfyimKO8zZx1dCRtO6wjgKMVQGD9q6V
	etaw8Xa2PFm/HRCkuvFyUMcysGtRaZx+3LFrDsJkdHChdLnrFee94fPGl1CT59gQ6Ovu06sCUZrr3
	2fRwyL4EiqPu5aaHag4R9Spq8bFtcESNejMs6i7PFR5Nif5YQ9y83D8j/pTTX6mlXQrTFyfSQm6Hb
	NGt4IvO33AqrvH3uFzE4OxlTacA5lrSk1wLUxSkuyclhqMiKjRDsM/sZbGjztFOFTBRttkoYVku/0
	4Fs/Y5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBPg-00000009gBP-0oQV;
	Wed, 25 Nov 2026 11:43:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBPd-00000009gAG-0qUl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:43:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso44685215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795607023; x=1796211823; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
        b=egvwS8njMg4q3AAR2a1fYWBIj/dlw3cj+Vph+0fl4WuJ5xY6vjZv3oHu1jQiSsHfT4
         CwziMnPr+qXZE8DD8Gv5BYaMCcqu7tmhm5iZgHyHScoMSh9OR8c2S+96cE7hrphRCHnQ
         cPE9FiS2dwNjy2Z8vP8qakYfYPbYnGulg4ZPZuu8p14jpMUYreDVkv5Bgwn9tfj95+Gd
         D4bXwj9lRxaP0d99EBlCIqPCTrboAyLizKcPhj6EhgOzUVsXQkJWRa8AM3OqHbnotDmd
         vZJf3oDggtHhrpGF9zSN9jJrtiCkf4FCiat/FRwKil7BjOJW+gPwLovXYFNv/mjIhNtZ
         Sfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607023; x=1796211823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
        b=enoWZ+mQAi+6fK3ehJZ7n+FfzjbpCjQY9za/FIHWqQgsA2XJRyo6d5PQwfBfaMiikk
         Fl3++H7CXODxVizbiduuE8H1ZqGy71iFVLlnK/1aKihd8L0+xSpicLI2jmuojfe9Sghz
         hf5mf/w7X0XoGfmfXSYEpcxtI0Hi2j0nKMxm2mzQBNtutpCqlfGSsMgcs+uyTV+iKAW4
         joMLr0nTQfFR19FvFQ5VZpN/1s+D+qeeiDxDhVc/tKmH6/KAHp1kwomZFPMO/WT3OTsm
         nniZDuIJUDJwmZ4emQxaXl51R9ZbYBOXBU+v+omo2qdH6ShLU2czfNoABJy4o7OjBe3M
         WmfQ==
X-Forwarded-Encrypted: i=1; AL+hErGjr9Ak+3L5EcG8BMotX0KfAJFWvGr6t5ilzmbZ+QE1B6m41FJqebemo+lAXK+KBWB0TUrWx30z2UaU/IiJVfkl@lists.infradead.org
X-Gm-Message-State: APuU4Z/MvDzmnL0bDnAQ7Ff24npkEjCLv9P2DO4wCqT9RzSmYe/LqmGU
	i249YHDkNzj96u4ay39OIJ+FZLxnr6jOLpX8YWY9deCA4+50jQCxs7ZN4wAZLnD+ndA=
X-Gm-Gg: AZFdTZf7lvHtTfK+XlRtEzKpeqqY9/ahEyma1lAjehcr9177+z6TfI4rG/n7FLqzECA
	+DP+aAXRXTWuKmA5yZrfqsB8vmhcqyElYK69xAWHpHxtxdbvx8/9N4G2NyM2K/VsgYmBT40EohV
	nKiFkzAnHMm+iYpqHjepWaFpqbHjrvNR2ZF4lu8YNUlQB5+Y6gcHKqtf4VEb/Kl4AWZ60opehDG
	vakZhA3/EGGgCeMEObk9Esnv9wtPnnUmmBOejTz7oo+ENEA3ndPnrEklDUbtRYIJ9fLDAsWZBKk
	pZzUTbrkNSAmhGz7GDk2wllk7kfx+Zk6FklLJAY5HruwV3LatwLezj1imKg56oe2lCYzb4L64I0
	tRRhW/bCy9wsvBOFnunveT0fGSSvM43fnESTkiBu5PqSRTnJdqgjjGximSADBiA/WAeyXukb8VK
	XBAHlJN+7QU55hUe/M0cPiqD5r9pc1fQLhXD7MPKmXMTSS9WK5EuWqP72GojGEL4aPVfpJDZafw
	eiQdQ4zFjqg0YR6HhRbRiKmWk3uWE7seqJoF68fzSdBnkOEoytDQA0HKM6V+7BxWTMFDmftb60F
	+L03uYwEfVTRTsd+CO37ZhCf7Q0OmAK0SofJ8B1tPE+O7clMTAbLTSGwEeKfwNHM0u2kQJiwrzj
	JnP9Gfh/u9mGEqZgj
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3b3 with SMTP id 5b1f17b1804b1-4bb8881eea5mr364570665e9.27.1795607022789;
        Wed, 25 Nov 2026 03:43:42 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884865a2sm527753115e9.3.2026.11.25.03.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:43:41 -0800 (PST)
Date: Wed, 25 Nov 2026 12:43:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Brian Norris <briannorris@chromium.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>, linux-clk@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Mariano Marciello <mmarciello@google.com>, google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awbJUwrBQw5TnowW@monoceros>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="huwbq4lvetfh3uwf"
Content-Disposition: inline
In-Reply-To: <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_034345_277686_543D3AB8 
X-CRM114-Status: GOOD (  12.22  )
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


--huwbq4lvetfh3uwf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > +#include <linux/mod_devicetable.h>
>=20
> Please include the specific <linux/device-id/*.h> that is needed
> instead of all of <linux/mod_devicetable.h>.

Or better still, rely on the bus headers to provide the needed
*_device_id structures. (That is <linux/platform_device.h> provides
of_device_id (for patch #2) and <linux/auxiliary_bus.h> provides
auxiliary_device_id and of_device_id (for patches #3 - #6)).

Best regards
Uwe

--huwbq4lvetfh3uwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsGyeoACgkQj4D7WH0S
/k7XEggAlcj2TrM3p6EXOwI/xsUxWXF252CxwyEWI8ZmPEpI6bAu6Q2vo1jWzU80
RgNMuXczOoZoJ6+hJdkMeoqHuhp2FPvl718ZM9+ZXmIzmzCoBNWIn7I/StnNApVp
CRTaJoMc3RQ58/iAEYs4Bd6kNCpJoojOnWxMnprqZsXFWDmYDOaKauDIqnRyeGSd
Y/roBTL3HpvnWDZxm7b51fG8984ltXAM06Db+ZRdnLxyged3B5xdXwcFGLlqeoKG
ti6pQXYhQnxuxJFTg8v+DdOAKp8wPe6CkjTN92KfVvWDgxJYHe7zwZ1V0TrgDqMQ
p3mJ8Bmk3uxwBcQfM5lzAgDW6N8h4Q==
=fqd8
-----END PGP SIGNATURE-----

--huwbq4lvetfh3uwf--

