Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBA4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V5c+/dtp;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WiROCWzd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aVOanH9gyLL3aaqPDmZbtrwaaIj/21AzXVfdkKlPJG0=; b=V5c+/dtpoiKNL6
	EoIMXHPY5xX2qSYPtVfquERfU/D+ePtMRQUiO6fJHRLdGZdSskd6BJlTsNl/Y44sInXJGB+QDfDKo
	yCBH3+0LMaCpxRF+iBPdlgAyhOyl/flGXoEGUhLXxA7NAIHlKdh91iaMtBBijFZYqMaC9RLgwy+L1
	wvnsO7ttnIPae4BNkeCsTBGI1PQRFmxHakaA71/4JcRPXOuZL6XeSpyQrK1aGJ5ilyZtIC0Twsvd4
	GziZdUrHJHpIQqXGFZWH00k9b70++FE9TAITpqIdX2mNONerTRpHjPel15vRZcqqCSDiScsS40KjR
	EFr6HCGY4AempoaFdccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSoF-0000000CAQL-3dcc;
	Thu, 26 Nov 2026 06:18:19 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSoD-0000000CAPZ-05AC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:18:18 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8b4cc793704so52205347b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 22:18:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795673895; cv=none;
        d=google.com; s=arc-20260327;
        b=Djj5bS306sLtnwVGtFM/J1XzJ4YZxdq192OS2FQQKyDQak7kovkjBJN/ZjZNqFpR1Y
         6wsE/8KCSs8tilaj7wUefGwnC0g4ttkh1L6b5lpmb7y2NuWByiuIZvvziz2q08DIgsxA
         wnxuoZtwri9wT7+n/+huuCNIjoapvef0dh/it3VQInTuPSxAL4IjpF+QOL2cZq3y5Urh
         RO7jImxWFkJK2JefoF1hGIh4o3NV1M2rW8PcOdZscq/5H20u2VCoJGbUIrkA63xhaof0
         76dJkFh0din03lR2wHGCWiZXa1q2WC9Ueb8B9gByMhqonNQn18fisrQ+m/O10hGKkY6Q
         ByAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aVOanH9gyLL3aaqPDmZbtrwaaIj/21AzXVfdkKlPJG0=;
        fh=e4VMGAzVmH+eqBWB6CPKxUtVbShdNv2CB7t9TCyfMW4=;
        b=sKivkHKOootScJXy//vqcd3bTIYnDkX7slM2DSk9EyyHOMiXytFQtfL3/8OyyGKfDm
         N7/ipNqRYW/c8Ga3CvZ9kQP37RwzuGAbDdaTUFN1MOMf9tTCbWir+v9cbANK5Gnhrwhi
         m9dmDJQE9Pu+1wDynpr+IzgQBPq3sMmE0Ap85mzTGEwMZejdI/3Z3dj2iAj4k0po7y6B
         2HwrmElpZKjXXJVUtbRLCtb0QkMNjhB5c2nUvZxBS7L0HHbuGVkpgt9ZOGwnmRRdPwkr
         PfJvJRIl1XOZmZdY0XYJRC9CgobQ4EbED+QrJW3S79ByXbvHKFQ3CWrD1+f/6slKbR0M
         6Yaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795673895; x=1796278695; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aVOanH9gyLL3aaqPDmZbtrwaaIj/21AzXVfdkKlPJG0=;
        b=WiROCWzdkZRZ7DFvBSYenLWyZ0nMo2AGHov7OL1T6XPitVMhAARt3UbY7Y7zZIu+8c
         pBDRiDqbEn1h8nvmHH9vtCgHX+HhLfb9+ECfck2+FbYfNIhdzMFGI3gMkTWmXyEHIkKa
         N+FgGWGKXYabC/qf8yEZtSAeqVi1DjrSBCgEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673895; x=1796278695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVOanH9gyLL3aaqPDmZbtrwaaIj/21AzXVfdkKlPJG0=;
        b=jn9o5YTln/L62vlQ5th+y5VoC5IQs1ImLCwzSSoLuylIsWeB23gGaHaOqy3JcwdcoA
         OwzZzQMuZWeAgBDSzf24AjuJtnrsr3nFzeVdWzd3LWaO9STObOigtS6seYLDDABp28sH
         smHdJC0v9Z9NK+osw3QeQAemAbPqJvRYn84QqjO24c8REHSAZRI2DHqCfF9hHtKgdvDF
         Df9ZIUl5KlxL2e+1XA2CWg5hnebBzXmQ6ndXjQrx6J5W2fNBX+nyY1bcuKOBwgOcDCgS
         iSZ6U0WjHVJ+IUyTK5FTGnJtYrB51d+ujuyIQJ7jG/+bMc3R9EQKkBFNbYKIS2nlP8xx
         /SIA==
X-Forwarded-Encrypted: i=1; AL+hErFwo9TXClnG9NS1WxQ7coWTN/dvBtDn8cVH2M7vVcOEoXRhCpV7dRxs92dTdxvO1V58fAQcTCwixdTRBJazWXrF@lists.infradead.org
X-Gm-Message-State: APuU4Z/pw8TitH9+Al1tdgavskCyDER48Pq5UAkQAzLVN93Swz/Av8fC
	oNm+Px8JbQ3OUkhTZcIQ/tGVhveBCYEnWQ1jl1tFfFXoerJXnLA0pJJwJA7rf0Ka3eXFd8glIo4
	OqXbLsd59BlgoYVH8MQF6JUREY24sMVx+ZRcK9O7WWSp0LxZT9R/D20y9
X-Gm-Gg: AZFdTZciOTK56vJii9cC6UDn8YgqWmegtPeDvcOS0jojpXMcIdvSChJUT/cYVPcS450
	VbyV0bxmkF9Khu4QcOqeyRMm+N2jrKnlTxSnC4dfFTprlHOustLHxMr/NaCo7b/0iazdsfVAY3/
	AzTPpSqldEqVO9HRiQfNrQ9LGts4AHsJLNlvSyEceq367Sbb1Lk2nu3NLI2Fh/FMDqXr/zPaEsW
	tBSdsHdnJjIBW1N9i2QN8mB5Dy7QgQNub1Pa40oGOWCRWssVTtDuJgUbthAYTbfM7lOGP7PKatg
	FyNIOEaN94sn91jl0SulwOlKlKVDE5CDwiArOA3ouayz/eZt2wS/oJ7BDCrZm2YAePWSLlXzRyN
	ehaLkBbs5bxc+qQgKSVOQorHn0J3YqjFYcLBtUNBWOwgqnSPCIyUywWPMT6Z7ceJekxU=
X-Received: by 2002:a05:690c:29a:b0:8b3:b5f1:89b4 with SMTP id
 00721157ae682-8b520472ed1mr75612087b3.28.1795673895189; Wed, 25 Nov 2026
 22:18:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125234822.94684-1-iasnezhkov@gmail.com>
In-Reply-To: <20261125234822.94684-1-iasnezhkov@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Nov 2026 14:18:03 +0800
X-Gm-Features: Aa3M54olT77g2PTxdeOuWYsBXJkE8EBtJ7XPbNnfHF5Q5XhrfHNOZbtGC_6G3kA
Message-ID: <CAGXv+5FgDoHPGcSHqMvGKb1R+2me0_JPr3xq_twbw-n693KNHg@mail.gmail.com>
Subject: Re: [PATCH] regulator: mt6358: fix MT6366 VDRAM2 vosel_mask
To: iasnezhkov@gmail.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_221817_109773_4007D00D 
X-CRM114-Status: GOOD (  19.61  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 7:48=E2=80=AFAM Ilia Snezhkov via B4 Relay
<devnull+iasnezhkov.gmail.com@kernel.org> wrote:
>
> From: Ilia Snezhkov <iasnezhkov@gmail.com>
>
> mt6366_regulators[] declares VDRAM2 with vosel_mask =3D 0x10 (a single
> bit, bit 4) on MT6358_LDO_VDRAM2_ELR0, even though vdram2_selectors[]
> uses values { 0, 12 } (0x0 and 0xc) which live in bits 3:0.
>
> MT6358 in the same file (mt6358_regulators[]) and MediaTek's downstream
> MT6358/MT6366 regulator driver both use vosel_mask =3D 0xf on
> MT6358_LDO_VDRAM2_ELR0.
>
> Change MT6366 VDRAM2 vosel_mask from 0x10 to 0xf.
>
> Found and drafted with an AI coding assistant while auditing MT6366.
>
> Fixes: f0e3c6261af1 ("regulator: mt6366: Add support for MT6366 regulator=
")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>

Unfortunately the datasheet does not include these registers, but I think
it makes sense that the mask should match that for the MT6358.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/regulator/mt6358-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6=
358-regulator.c
> index d6a0ec4..1d62c25 100644
> --- a/drivers/regulator/mt6358-regulator.c
> +++ b/drivers/regulator/mt6358-regulator.c
> @@ -604,7 +604,7 @@ static const struct mt6358_regulator_info mt6366_regu=
lators[] =3D {
>         MT6366_REG_FIXED("vrf18", VRF18, "vs1-ldo1", MT6358_LDO_VRF18_CON=
0, 0, 1800000),
>         MT6366_REG_FIXED("vaud28", VAUD28, "vsys-ldo1", MT6358_LDO_VAUD28=
_CON0, 0, 2800000),
>         MT6366_LDO("vdram2", VDRAM2, vdram2, "vs2-ldo1",
> -                  MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0x1=
0),
> +                  MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0xf=
),
>         MT6366_LDO("vsim1", VSIM1, vsim, "vsys-ldo1",
>                    MT6358_LDO_VSIM1_CON0, 0, MT6358_VSIM1_ANA_CON0, 0xf00=
),
>         MT6366_LDO("vibr", VIBR, vibr, "vsys-ldo3",
> --
> 2.54.0 (Apple Git-157)
>
>
>
>

