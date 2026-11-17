Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD060A3807
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fdCqinwF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etmZiEgd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CtUGM4qs3NyrmXicigtcW+0ZUHZL+8lLEGt7ogClzmk=; b=fdCqinwFB6w5oe9iO8N1y8ZkaP
	q71d5ZUwKUT7HE44epCDCj3cjtgKUl4qAAoSigrPZieHyRArE72DH2aMcYiX7NnfuwngLaeXxVNQk
	rbw//dTc+71p7pri8Plwawya2+9pK91h3xCNtkoahU7yEwBR21RCWFBRvFWvQZXAHHsJqcTOmT17d
	FZ96sa4e9My6HkzBqgeRHB8LvAhwpJwTTbKBZMQmFtM2q3ITH8szIbvkzGpB4Fbo7pgscPaFSkfnq
	QFponmjFwnUn53yHLJJwFzW+pwtnjD99z7O6svnTTbSc+PObfEeLmVx2n3tarE2mdJ75nKzo3RGYv
	kxq9q1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLsC-00000006Oji-1tPt;
	Tue, 17 Nov 2026 16:17:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLsA-00000006OjE-0T2Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:17:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so419895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794932247; x=1795537047; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CtUGM4qs3NyrmXicigtcW+0ZUHZL+8lLEGt7ogClzmk=;
        b=etmZiEgdAvFgUP5Wp/NNCTWiO2hHx9jgExaHyrVAteaa6UWORNBz5RG+jnyC/1tcrq
         vhPnh0WdHrnYP4kIPcZamQX86LbdgYXJVb7Gg8GTHxrpuU8r/7SpwIV7I6em2PsYgZTv
         vbBZKn17fla3pGDw+u/k6juUxzJo22TROhFwRs8gPYlIdzeNB3FdbsIwjjm4K5z5PzWv
         IXA+BBDjXGHxnzkThF2mrLcICm4MzUhGrZ9WBHHI6ZVl3Z9eCWJNseKUCsps37RfW8SK
         /ef4JQU82EtQUQkRTFCtKtbRsuLM0Z+p8cvv4YFXUTBmNyVd5pZXKnvs9ZTosGZvNQve
         G6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932247; x=1795537047;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtUGM4qs3NyrmXicigtcW+0ZUHZL+8lLEGt7ogClzmk=;
        b=eyS9gColUyzdcnnd67blfTzp6NreChg80JyROjtsDOQTikACg8L4JJPykuyZIWzGKa
         BoPKudLsyn6KESZmcAs+BSSsdIpaEx2tvjeGErI0A7vVjLv1C4e7IetxRXPU9jTc0SBh
         LwVPFeWFYJjVVlA7o2G80txvYoeYSif6P8T8ETJAsz0uBjVmrR2U6IgYISK7biGxFHb4
         z5ZcqanPSHQPMRUDybCOh7XWbNPKBFOr0vNQ5W9eL4A7/HFZABjBAEy9z6UOIAv3BQs9
         OizfQknRJbt08NtE4vd3qnbKryFab03IrWZu2j7FwAjB/JB7cBOm0FNYRdpzJ1BcQLTf
         B/1w==
X-Forwarded-Encrypted: i=1; AL+hErGUAz+Nl+LdpJMpbNodNNx3G8fWVrXTYbiQ6umEi1ERWNBTccKAd/8poNiqmqeKpHD+AsDOlolkAf/QvSb/Z07G@lists.infradead.org
X-Gm-Message-State: APuU4Z9rFVz5KcS7EUsDAjkfVnNcr71z/5YlnuCxa1w1WmH4qsWfymmN
	bymO9PNjXeHH2QDLP1OCuRqiX2QMzIq8vZyRKmjF8wrhL+k9BNte0kPv
X-Gm-Gg: AYBFou0ieoPEGMwclD1JPN5AfbLB4+C2o9VO6/oM/yKyi8e4TV4YxsLa6xm1JlRG4+s
	gJX5PzJgErOOru5foUUCxsWpggCmqtkdM66HXTtdIA+TS/QHU/AQC1G4zo9vNwePVyktH79dvn1
	VONalMgSUGw0K3gRJPDTXbTn6pPm8NR12XWsl87XhMNCuQPwDpbLvIx4gZCAnoMTnSApM9CrQq+
	spkTBMzb0aPBmRc7T7nMagtL3SKOvsQ5ghmIP2rFF5HDuVdMux5jCmfLNj1E/qsiFHSQckCYLI1
	wvQw+Qf1Ij82SNYMa4QCZC8VtuuqN5Vds0WZK5btf5vdBNjqIjbBzl+ZelVyh1fhlAzINZBlzWo
	GbcZvv3ADM/n7QGCcuGAYlwz6aZsPcl5VZmvKNv3Nm1FFpFiWqbQU8ixZf2SkhSaTPjTRVt905G
	uEbzyZjpp/MTsqbYyUJ3svGUdbuMDfRIuwx/8P9jbXPiPhRUFowPne007o29OJjJJhJigJcBiMR
	vQymfbP511lHr4Jvyj9p1AXOI55blaNelaaFW62rFS8HWiKmzkGx4R+YBMk9fm767L8LgFA6bw3
	VUJc9xlqjtgwHISbwzQF8ZEr5x5Swxfrk039/OWAcbSwmgD7Q4lV+qMXCZAPvslns5jHMXyCAdj
	3x3NjK43Eu5A1ecCIrStjTwWAddajKC32vzJQCTt3wlybIX0QBHFTx83dCudzfpH0P42S8MXUhJ
	fZ7ro7ccttoIwVWHvdQaQLIHW1nc6IYFys/o8t1NT42rRm4sYOuNZwLFe6AV7F4uV536cP20qkC
	7fktznvwKMvrW34MNlZQ5t2c3uuclUXVwXRw84XHf+924topGqxd4f3lqjT
X-Received: by 2002:a05:600c:b50:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb5c5c8255mr198447365e9.5.1794932247376;
        Tue, 17 Nov 2026 08:17:27 -0800 (PST)
Received: from jernej-laptop.localnet (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78344ddbsm82097905e9.0.2026.11.17.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:17:26 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linusw@kernel.org>, linux-sunxi@lists.linux.dev
Cc: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yang Siyuan <hsyysy@163.com>
Subject: Re: [PATCH v3 RESEND] pinctrl: sunxi: request the per-bank supply optionally
Date: Tue, 17 Nov 2026 17:17:25 +0100
Message-ID: <uNcaWoiORlCb9uOBOQgmvw@gmail.com>
In-Reply-To: <20261117091944.12082-1-hsyysy@163.com>
References: <20261117091944.12082-1-hsyysy@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_081730_188646_668F58E4 
X-CRM114-Status: GOOD (  30.06  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne torek, 17. november 2026 ob 10:19:44 Srednjeevropski standardni =C4=8Da=
s je Yang Siyuan napisal(a):
> The per-bank "vcc-pX" supplies are optional in the device tree: the
> binding documents them, but notes that many boards do not describe them.
> sunxi_pmx_request() uses regulator_get() anyway, so the regulator core
> falls back to a dummy regulator and warns for every bank that has no
> supply:
>=20
>   sun50i-h616-r-pinctrl 7022000.pinctrl: supply vcc-pl not found, using
>   dummy regulator
>=20
> The H616 R_PIO is such a controller, and its PL0/PL1 pins drive the
> R_I2C bus, so every H616 board hits the warning during boot.
>=20
> Use of_regulator_get_optional() instead.  A bank supply that is described
> in the device tree is still acquired and enabled, as it powers the
> physical VCC-Px rail, but one that is absent is skipped without a
> warning.
>=20
> The OF-only lookup matters here: regulator_get_optional() also falls back
> to a global regulator-name lookup.  If a regulator with the same name as
> an absent bank supply is registered later, a subsequent pin request in
> that bank could acquire it and start the per-bank refcount at one, after
> earlier pins in the bank had already been requested without a regulator.
> Freeing any of those pins would then disable the supply while other pins
> in the bank are still active.  Restricting the lookup to the pinctrl node
> makes an absent supply permanent; record that state so later pin requests
> do not retry the lookup.  The refcount therefore stays balanced.
>=20
> Signed-off-by: Yang Siyuan <hsyysy@163.com>
> ---
>=20
> Changes in v3:
> - Use of_regulator_get_optional() instead of regulator_get_optional().
>   The latter still performs a global regulator-name lookup, which can
>   bind an unrelated regulator that appears after some pins were already
>   requested and unbalance the per-bank refcount.
> - Remember that a bank has no supply so later pin requests skip the
>   lookup, and keep the existing no-regulator check in sunxi_pmx_free().

Remembering IMO isn't worth it. It complicates the code which runs only
at probe time.

Best regards,
Jernej

> - Link to v2: https://lore.kernel.org/linux-gpio/20261026152027.1417178-1=
=2Dhsyysy@163.com/
> - Link to v1: https://lore.kernel.org/linux-gpio/20261026144751.1392715-1=
=2Dhsyysy@163.com/
> ---
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 29 +++++++++++++++++++++++++--
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
>  2 files changed, 28 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 70099052d..d2345a85a 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -913,23 +913,44 @@ static int sunxi_pmx_request(struct pinctrl_dev *pc=
tldev, unsigned offset)
>  					    PINS_PER_BANK;
>  	struct sunxi_pinctrl_regulator *s_reg =3D &pctl->regulators[bank_offset=
];
>  	struct regulator *reg =3D s_reg->regulator;
> +	struct device_node *np =3D dev_of_node(pctl->dev);
>  	char supply[16];
>  	int ret;
> =20
>  	if (WARN_ON_ONCE(bank_offset >=3D ARRAY_SIZE(pctl->regulators)))
>  		return -EINVAL;
> =20
> +	if (s_reg->supply_absent)
> +		return 0;
> +
>  	if (reg) {
>  		refcount_inc(&s_reg->refcount);
>  		return 0;
>  	}
> =20
> +	if (!np) {
> +		s_reg->supply_absent =3D true;
> +		return 0;
> +	}
> +
>  	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
> -	reg =3D regulator_get(pctl->dev, supply);
> -	if (IS_ERR(reg))
> +	/*
> +	 * Use the OF-only lookup: regulator_get_optional() would also match
> +	 * a same-named regulator from another device.  Such a regulator can
> +	 * appear after some pins in this bank have already been requested,
> +	 * which would unbalance the per-bank refcount.
> +	 */
> +	reg =3D of_regulator_get_optional(pctl->dev, np, supply);
> +	if (IS_ERR(reg)) {
> +		if (PTR_ERR(reg) =3D=3D -ENODEV) {
> +			s_reg->supply_absent =3D true;
> +			return 0;
> +		}
> +
>  		return dev_err_probe(pctl->dev, PTR_ERR(reg),
>  				     "Couldn't get bank P%c regulator\n",
>  				     'A' + bank);
> +	}
> =20
>  	ret =3D regulator_enable(reg);
>  	if (ret) {
> @@ -959,6 +980,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctlde=
v, unsigned offset)
>  					    PINS_PER_BANK;
>  	struct sunxi_pinctrl_regulator *s_reg =3D &pctl->regulators[bank_offset=
];
> =20
> +	/* The per-bank supply is optional, so this bank may not have one. */
> +	if (!s_reg->regulator)
> +		return 0;
> +
>  	if (!refcount_dec_and_test(&s_reg->refcount))
>  		return 0;
> =20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index 8bd00c6ff..651249b23 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -162,6 +162,7 @@ struct sunxi_pinctrl_group {
>  struct sunxi_pinctrl_regulator {
>  	struct regulator	*regulator;
>  	refcount_t		refcount;
> +	bool			supply_absent;
>  };
> =20
>  struct sunxi_pinctrl {
> base-commit: 091b06388b117fefdcb63336ac09956a4914b961
>=20





