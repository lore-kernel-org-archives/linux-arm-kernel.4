Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72C4606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 05:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0zKeLBVd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKOXxN8Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+H+W40F3xi/JoWhY4dp3q7kYo1VTM28uEFHWyVVy0qE=; b=0zKeLBVdG1bBo8
	O4Itln7P1QOEI3Ydv2wD3jtGh+oX1orrqBRp1JAj9WBA4LaKg0lZKC6wIoENryaycTrbwYgWJEQLk
	g7C0dTegO7OZcGMPo03r/2sxNFhjTfGNKiQCnI4FN3+DA3VbJZ6uzqEpmALe5JTdBY3ip+6uVk9mW
	yI5TivaIInyKZ3V79Q9eSvwtem0dSaJXIyPxS8ZhmewptM2jCkkDIjvF+XeZ5gyMYdLp/2sGIoYP3
	zCRuWaceW6kSVWchmZIgj00CdNJ0Fnss0hHoGukLCv2IGiL2J1qvyc7EbIIY/RRFhwg1Y7iiRQbkw
	Nhv6mjudTvD1TwgYPFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHjk-0000000HOOO-16e6;
	Mon, 09 Nov 2026 05:16:08 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHjh-0000000HOO2-3FQQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 05:16:07 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso83024866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 21:16:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794201363; cv=none;
        d=google.com; s=arc-20260327;
        b=h7qrDxM+Mx+/QEDvzZgxcTOy15mjmCeFA5BVzHRTTaqUqrYpcZMHUP8PduhrMlM/4p
         j+n7njPb7ILhnIqDPUt9aHWRXcRAvg6a+3QIdhW5JbSc/5PBzuQCN+g05h3DpNixKhtE
         wlGVfQYRqMqPzBNk6taMREocLRTgg/i1ZghaZbubLpcjrMGvHoDQtUAMgr0xTs2+04/A
         zy5Ywj70KadCXJNg6LTPFJvtPCWSW3pPaUpIN1uy/fLux+e0wqZmV7MlF9JZ0ah0JXJy
         R0zby60WOQC8ybNjsGiiikcEs2hpSbcyJpudWJm5Tw69VXfoJtij13FyZBhnSYhABWXb
         XG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+H+W40F3xi/JoWhY4dp3q7kYo1VTM28uEFHWyVVy0qE=;
        fh=9upwd+AZCMi9Bj8RmSE2AA5xhP7VYE3U29H6MOOuCVw=;
        b=qWUMwv8plg7kOXihDwYFHIRoCM2NGHrrc3q7Hm0o3wQDZqM0HZDss5bdz2jepMTz3C
         mtlZmNC0GINNGfDbCd9dPhOUrrg1miLaMJNvfwr5d69iifeRYDkTZXJBX6uoRbtrstTx
         QFhreAehXHx0CUeQrMT/I2jLykU8zWtKDmi0KBAy3gnqSfpasbIgF1MILB+tSW6vkC/w
         qZ9fHyqhfkf5Twxuvctqk78gAppzYqkyRCwWJpYM34NnsiwzIJvNBXpdgM7m6ioerfTM
         jT5kwnXADTQ6/k2AJrU/Hrw+sMWze/cwg0Pp85RxMuo/v8Znd7OvZ5ajVq0A/cPSpXxb
         sMDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201363; x=1794806163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+H+W40F3xi/JoWhY4dp3q7kYo1VTM28uEFHWyVVy0qE=;
        b=OKOXxN8ZMKbYiSwPDDZjedj9kpUqps3LaKY6tHkquUW3gFfEwBMBGoMZ5DhD60+J8T
         IXlVWl5H7cYaAfqNqv3Aw6JAIrIXni4217nCj96iBtRXT2guVDoAoq9Z6zaReh5HVhfq
         Diqxa+CK7up/32vaqQhCd7UVr12wVeZK5+Qg0oQJT5AnZ8LbBTRBTQw5EflNB/o7Rggd
         jTFSqFvbt6cc1AKwabU3a+HhOTZo9dJDKRAOTlskS98U7ePrdab+aXeEnRgY+mTQAjX6
         0xswth8w2zaAd3jI5vTBQZWVqEjPHYo+MH5vJrNkYuKKDHmJL4XR6tlGvlJRr+Tk15hr
         KeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201363; x=1794806163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+H+W40F3xi/JoWhY4dp3q7kYo1VTM28uEFHWyVVy0qE=;
        b=DEHMJJfw4pYzDQVpuuDDWB78ozOKyyd+wfzWA5Eu+9qHuksSixnS0l2pjUTNQgwjYy
         nCHAsNfwb9aXoj/JnrZkXC9NtmkUQ2iqltdG61y7/aBwiYhEGhBFJLB/PVJ+3H4CNJxA
         e2xcUlZjC700tqHmRndlYRhPa2LuGPdAImeOFTt5Mlg3q5LITpkG+/RXIz90lOPSxTJg
         51FITY5BmtqUzdJLfyJd6wh9cEZNQvAkgBaBDWlV4KMguZduXUH9K/++YbCmjxG/C1Pq
         mibdEmobBn2iJFYHkrMB+BoP37sU9y7u7J6DSm7aVyIi9cknWf8AOQEYe9SfOZ2Z4Nfe
         JiJQ==
X-Forwarded-Encrypted: i=1; AL+hErFQ8TU8iU+XKTgTYpMPJZ9KyTzcCFEbxnn2ssow/TCK33Dlz0EOkJtIUrnky8jem1oGwcjp619GKzuvhL+Na22u@lists.infradead.org
X-Gm-Message-State: APuU4Z/XY+qZRAoyCN76BgI+pn21VGplMAC1IpCEn3VU/bI2DmR34TqQ
	TlkDLg0sQGKOgjEPvcnLDavTn58ZZDgeSAO1wZl9+5pV9rmquy2HL1Liah18ZDvyT7sINyPFmjL
	Q2425CeYWhst63VGYcY7vL+EgpHdeCE8=
X-Gm-Gg: AYBFou0KGEcn3IB9a87+4NHMsNwo2bsE+75Z4JI7jQZR/fXHdm9uzZ3zulhBwRwtahP
	TagtURqGKNx/PrJJPyetJueNxCD7yHWOTvaxpyFOHFXcQZzILJkztWEktmj6Sm7tmNgn3O+wTwa
	1ipvveZwaFgv64jN7c+rDcmAIxV9cL0z0xj+3YrcQwdzRLz+igE7n/u/t4ITYVTrvxcundfd3yK
	wlsz0//SGKKnDxmNjFSp578eH0MlWKrCuoCv6f0+C8FQoDe+xfH+A/alNDk5U3oM7lQaMg9h/4b
	aM68Ss0kmPDY+nWuHmb2NveESuYWyiU18KzUq3AmMDf5SeEdtYqZTOM6R5ttbtNdLgkNNr1s1sw
	eDwxEupivQCzf9dOAHrRdnSalErO4GgSNn9yJkOrIhTbfh9k9pbGp/psmXjufAA7mJ7w=
X-Received: by 2002:a17:907:94cc:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c4d5278459amr332595566b.14.1794201363497; Sun, 08 Nov 2026
 21:16:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
 <20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 14:15:25 +0900
X-Gm-Features: AclHuK-Znic_YSiZSxmlzXLOPryrS4zIPNf3mp5uhFcTlxhpKBhiJT7EHmt8c3E
Message-ID: <CAAQKjZPYAn98+8Wtjesr7GCh1s_pX8mWizW=HoY5Pj9xO9St=Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: analogix_dp: deassert DP_PHY_PD on
 power-on for exynos
To: tb@a-marquet.fr
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Douglas Anderson <dianders@chromium.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Lukas Timmermann <linux@timmermann.space>, Henrik Grimler <henrik@grimler.se>, 
	Hendrik Noack <hendrik-noack@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_211605_880870_78D4A579 
X-CRM114-Status: GOOD (  26.63  )
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

Hi,

2026=EB=85=84 10=EC=9B=94 27=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:17, =
Alexandre Marquet via B4 Relay
<devnull+tb.a-marquet.fr@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> On exynos platforms at least, calling
> analogix_dp_set_analog_power_down() to power on (with enable=3Dfalse) CH0
> to CH3 or the AUX bus currently produces no effect, unless the function
> is first called to power on everything (by setting block to POWER_ALL or
> ANALOG_TOTAL). The reason for this is that DP_PHY_PD being asserted
> (which is its default state) renders every other register bit
> ineffective.
>
> This is particularly an issue for AUX bus initialization, that tends to
> happen before anything else (e.g., to request EDID), and thus, before
> anything has any chance to request a power on of the whole analog
> section of the chip.
>
> This commit allows analogix_dp_set_analog_power_down() to power on any
> block, by deasserting DP_PHY_PD if needed.
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 19 +++++++++++++----=
--
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index c1344a3f013a..9f634d4e4793 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -256,6 +256,19 @@ void analogix_dp_set_analog_power_down(struct analog=
ix_dp_device *dp,
>         if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_t=
ype))
>                 phy_pd_addr =3D ANALOGIX_DP_PD;
>
> +       reg =3D readl(dp->reg_base + phy_pd_addr);
> +
> +       if (dp->plat_data && (dp->plat_data->dev_type =3D=3D EXYNOS_DP)) =
{
> +               /* On exynos, register AUX_PD and CH[0-3]_PD have no effe=
ct if
> +                * DP_PHY_PD is asserted. So, when powering any of them u=
p, we
> +                * need to deassert DP_PHY_PD first.
> +                */
> +               if (!enable && (reg & DP_PHY_PD)) {
> +                       reg &=3D ~DP_PHY_PD;
> +                       reg |=3D AUX_PD | CH0_PD | CH1_PD | CH2_PD | CH3_=
PD;
> +               }

When DP_PHY_PD is set, this path clears it but leaves the bandgap
power-down bits unchanged. If the register retains 0xff from
POWER_ALL(true), an AUX_BLOCK, false call produces 0xcf; both
DP_INC_BG and DP_EXP_BG remain set. Could you check whether AUX can
operate in that state?
I suggest limiting the new handling to AUX_BLOCK and CH[0-3]_BLOCK.
When the bandgap bits are set, keep the other blocks powered down,
release DP_INC_BG, wait as the existing POWER_ALL(false) path does,
and then release the remaining required bits and the requested block.
This also avoids changing ANALOG_TOTAL, false, which currently only
clears DP_PHY_PD.

Thanks,
Inki Dae

> +       }
> +
>         switch (block) {
>         case AUX_BLOCK:
>                 if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_dat=
a->dev_type))
> @@ -263,7 +276,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 else
>                         mask =3D AUX_PD;
>
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>                 if (enable)
>                         reg |=3D mask;
>                 else
> @@ -272,7 +284,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 break;
>         case CH0_BLOCK:
>                 mask =3D CH0_PD;
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>
>                 if (enable)
>                         reg |=3D mask;
> @@ -282,7 +293,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 break;
>         case CH1_BLOCK:
>                 mask =3D CH1_PD;
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>
>                 if (enable)
>                         reg |=3D mask;
> @@ -292,7 +302,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 break;
>         case CH2_BLOCK:
>                 mask =3D CH2_PD;
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>
>                 if (enable)
>                         reg |=3D mask;
> @@ -302,7 +311,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 break;
>         case CH3_BLOCK:
>                 mask =3D CH3_PD;
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>
>                 if (enable)
>                         reg |=3D mask;
> @@ -321,7 +329,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 else
>                         mask =3D DP_PHY_PD;
>
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>                 if (enable)
>                         reg |=3D mask;
>                 else
>
> --
> 2.43.0
>
>
>

