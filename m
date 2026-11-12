Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1996606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MIfmiUZX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aH9C3okd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aAW3v6GEJbuYIvU/kMT5hk01048H4iK9Lb9vDkzw68s=; b=MIfmiUZX9fdas/
	zffxMfxQE39p6jXVpulGuyz7hKljnHBjz/I9TC4NOM9XxkFx49OlVZA/HEssVXXpMj0/FZ5HXjDLU
	7R4+tvnnyfiqn1EKKKdJ8JTHKXpagisUrrK2Y2z/EaLuOgvqY/gO4LhoJxs/vYLorjy8zY2Q2sQGk
	FAIl3f5voDRlRLC8JB4HwyoKV5J3h64IeiXu6aV7dv4aV/WvYubvDv5golRePU0QrNUjHWkEXZU/8
	WiqEWsgdvOW3fLqcZ72aZUACjJlGVao55t1K9Ixod25K/jPrfalgzly5c5a1mWW62bLqf/6j3E4Ez
	Roylpztb8MaNQTw0U1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR3N-00000009Mas-37UR;
	Thu, 12 Nov 2026 09:25:09 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR3K-00000009Ma6-3xtY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:25:08 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5be3dd6f636so99290e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 01:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794475505; cv=none;
        d=google.com; s=arc-20260327;
        b=hP3Ce4p/V5zCW3hGJhX6Mf9SM/+ndNjhEC7Q38Rh0INNKAVWZEiK/XLkm/pJIC/C3k
         k7Q6Qj8K7z3R5q0vz3WPU2mEr0+A48auFHwICuMBjpPtC3NjCUNsB62QEDj7+NbI7UY7
         PDpwd/5bfcXncbZroO40wsypOFFPIppKXehvkaNiwFZVb9LachXmbYBfuh31bn3rmlDr
         0ERq25CFug6jM2DYOR4zqEwgiLmPszfqRu3apBPf7ZAmNhAvKR2Yv/LY+FI1RYhne2Wh
         0dmd7XkZZzQxWYNH/NLSdDJmMSlKgE54Vkfwy78nRzQ7Yv/mff6AG3lEW0/PuKwAnyAI
         eiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aAW3v6GEJbuYIvU/kMT5hk01048H4iK9Lb9vDkzw68s=;
        fh=RHzXKMqFDs4/L3OvAPgeCfU8hJ9QILonyEk1DhX9I7I=;
        b=XuZhBMdV1k6s1kdEAa3LQVWfnK7PpaHxaGeKMkTA5C7aQ43WNw7v72uEwoR0jaEg5n
         uux89A/T25fBcdjmF7AJwdNc+v5JYk/OnEQuWZbsWsGyusfxMrN/MiV5LQbwEI+TOPQb
         i9+296LO4ebVagPfzIF8g0g0T3dnTUt8QY6RrvYCGu7Hnw6DC0stu4Lo0ZDITnBgojuv
         C9gRWRkcwTdoOeJYHu6mAwn3lnys8SishVznjuHXssumZpQRH2VXWWKrHOVZK9unEKcj
         LjUHqISIQrBR7qtD9IiXtKV01GuEg+pR4XkgS83j523SzcriaH+B4q+tK24hDqqL7Qy8
         DZMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794475505; x=1795080305; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAW3v6GEJbuYIvU/kMT5hk01048H4iK9Lb9vDkzw68s=;
        b=aH9C3okdKXIbjbqLz+NZQQLxFKwrkZxaMdEvE35CB80+8tBTq2b8zwO1T74mv7UefP
         /9XhEx9hLrpoYBXIGgSb3XGhi0Fo28K6ASSreeasHCr5jYJ9nLYD05jqXMJuS6YrrkTc
         DqeRHtGl7b4UUw8phF2wL6bu6wX4UohCwHMCCwyVIeNrol5lWTrcMhXAnJQjRP+b8tHC
         jdLcb6u9jdlyGZ+o7ZiLlenFTymm49qFt9xH62Ypg0jrmkRPPO9yARBHNAUQZnetSRNQ
         U/b6oNamAtq1jaxlT7F9BmnppMAdMpYtBHIoNpeR2Ss1tPjWDAtcNN0TYe1PQg3b8mgx
         xKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475505; x=1795080305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAW3v6GEJbuYIvU/kMT5hk01048H4iK9Lb9vDkzw68s=;
        b=V4o+pl9i7ZPoTkJzqkyqGxDAWGShImR37KvefO9AiNjAMPmxG9MYSw+fakWnjx2uOi
         mlMF7WM5IczJplwmfE2E+N4+H4o9yjAoKEdhNQfpVx3cNXhMj9PA/xlwtYMGZ45zajlq
         pejP+FKxRNnmX63OXzw8ButRmMLWeJmfgkMNS9kzMQvVvXR0V0u2ofp2BsPM6RMNMDCZ
         I3KrnUwz1FOgqcmANoRavRZpxH+suziVK8Q2DTWnUaQZR2DXEdzsko0U+oN2T3BZSsv/
         WA6yBWb5x4qO7VYKSCrC6g0Er7OiE/0XaiE0YZeFDE5VC5vmE369i+Mj5Adgm9wirisF
         zeBA==
X-Forwarded-Encrypted: i=1; AL+hErEtqrS3nysI4NvfafFjAqiZo1rSXdc3wZplDO2T0wAvNpruL7Mq1CK+E7x6+dXrCL8EOHY0pIa2iTwBWwP5SoHY@lists.infradead.org
X-Gm-Message-State: APuU4Z8goauUoYCQCq47lkznME3DD37Kp6Pz2mievP/aUSgNWdOaLhIa
	FZej7q91UNY4RA1dYNBiT8mw05HDB3AHiJY0UUkxQAyE3qCNPZgbe40CCZ5PI3BkmaQZb4zIAcR
	NJDBTXgoTPPV9W6aqO1hc9uq2ZCi+Mfc=
X-Gm-Gg: AYBFou39NgC0fiCdNarbi1EYN9CYMd/bSgQ5D6GjF1doQb9MA8A6jyNPgEAJO1r5ZmY
	WvO93hf5Q+DJKbveumZ6IIleGYVwNVsK9mId9McxPeQUDTuY9lyvnw/omxrFq6geOFmb2COb7RZ
	n0HNIO6y+gx4X9iiBDHx3fbzjIrY1q0BQXpzGkpUbqGiYWyAQe2AMXoV3KWI2ceFxZhyjQsmAFW
	Lyo7ZvKGi8+frwPbwztc2xTxGffDKmihKUd9mSFjXl10OBEDTMs4/jTyOh66uBdO08fvNopkqiZ
	TfcJm/T8iSKSSwq8sSoHRtOsiMog+h+IL0ix5J3bNr8NsXSgiKrKxlRKDeHxRQASLqHvPrz55vC
	CrtOkeA8vyGa9YDZIFWFGMDu6tHWSryGTGrAeSu9ooLl3SfTK4XMf8XAWUMaRM8bYdFpGLGc=
X-Received: by 2002:a05:6512:1105:b0:5c1:57b9:90d3 with SMTP id
 2adb3069b0e04-5c15d5a8091mr1824839e87.1.1794475504618; Thu, 12 Nov 2026
 01:25:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-sun5i-hstimer-arch-sunxi-v1-1-9016f63e186f@gmail.com> <CAGb2v66=UbyC0jaW6tjeux5VruUAXN_64bAs3+LyS=CRG1qm9Q@mail.gmail.com>
In-Reply-To: <CAGb2v66=UbyC0jaW6tjeux5VruUAXN_64bAs3+LyS=CRG1qm9Q@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 01:24:53 -0800
X-Gm-Features: AclHuK-hAO4EvOdrjX-CMAuSOsrtdv-9s5jREBggl1QgG0DXsRBqy77zUtF8Ctk
Message-ID: <CAEy9hNXfqPHEhDnfP+S5zbvFbVSiuMUALVRNQLPEdOLTsehRZg@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/sun5i: Allow enabling the driver on
 64-bit sunxi
To: wens@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michal Piekos <michal.piekos@mmpsystems.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012507_035213_5BC97D8F 
X-CRM114-Status: GOOD (  38.71  )
X-Spam-Score: -1.9 (-)
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

Hi Chen-Yu,

On Wed, Nov 11, 2026, Chen-Yu Tsai wrote:
> This doesn't really say _why_ a user might want to enable it though.
> The only reason to do so is to get a higher resolution timer, but
> the rating for sun5i-timer is lower than sun4i-timer for both clocksource
> and clockevents. Realistically speaking this is never going to get used.

Thanks for the review. You're right: with its rating below both the
architected timer and the sun4i timer, the kernel never picks it, and I
have no use case that would. I'll drop this patch.

Best regards,
Arun

On Tue, Nov 10, 2026 at 11:33=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Tue, Nov 10, 2026 at 3:07=E2=80=AFPM Arun Iyengar via B4 Relay
> <devnull+aiyengar1990.gmail.com@kernel.org> wrote:
> >
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > The high-speed timer driver binds "allwinner,sun20i-d1-hstimer", which
> > the H616 device tree uses as the fallback compatible of its
> > "allwinner,sun50i-h616-hstimer" node and the D1/T113 device tree uses
> > directly. SUN5I_HSTIMER, however, only has a prompt under COMPILE_TEST
> > and is selected by the 32-bit sunxi machine Kconfig alone, so arm64 and
> > RISC-V sunxi kernels cannot enable it and these nodes never probe.
>
> This could be simplified: the high speed timer is available on many
> newer platforms, but it is only selected by the few original platforms,
> and not visible to the user.
>
> > Make the prompt visible on ARCH_SUNXI. The driver registers its
> > clocksource and clockevent at rating 340: below the architected timer's
> > clocksource (400) and below the sun4i timer (350), which ARCH_SUNXI
> > already selects on arm64 and RISC-V. Enabling it therefore adds a
> > second hardware time base without changing which one the kernel uses.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> > ---
> > The H616 and D1/T113 hstimer nodes and the D1 driver support were merge=
d
> > for 7.2, but the driver still cannot be enabled outside COMPILE_TEST on
> > arm64 and RISC-V.
> >
> > Tested on an Orange Pi Zero2 (H616) with a 7.3 kernel carrying this
> > patch and CONFIG_SUN5I_HSTIMER=3Dy: the hstimer node at 0x3005000
> > probes and available_clocksource lists "arch_sys_counter timer
> > hstimer".
> >
> > This patch was developed with Claude (Anthropic) as a coding
> > assistant. It investigated the problem and wrote the code and the commi=
t
> > message; I reviewed it, and it was tested on an Orange Pi Zero2 (H616)
> > as described above.
> > ---
> >  drivers/clocksource/Kconfig | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index da83483296d5..971491d2e584 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -172,12 +172,17 @@ config SUN4I_TIMER
> >           Enables support for the Sun4i timer.
> >
> >  config SUN5I_HSTIMER
> > -       bool "Sun5i timer driver" if COMPILE_TEST
> > +       bool "Sun5i timer driver" if COMPILE_TEST || ARCH_SUNXI
>
> Nit: I would probably write "if ARCH_SUNXI || COMPILE_TEST" just to match
> the other instances.
>
> >         select CLKSRC_MMIO
> >         depends on COMMON_CLK
> >         help
> >           Enables support the Sun5i timer.
> >
> > +         The 32-bit sunxi platforms that have this timer select it. On
>
> "selected"? BTW I think we can drop the "selects" from those platforms
> if the option is now visible to the user.
>
> > +         64-bit (ARM64, RISC-V) sunxi SoCs such as the H616 and D1 it
> > +         registers an additional clocksource and clockevent device, ra=
ted
> > +         below the ones the kernel already uses there.
> > +
>
> This doesn't really say _why_ a user might want to enable it though.
> The only reason to do so is to get a higher resolution timer, but
> the rating for sun5i-timer is lower than sun4i-timer for both clocksource
> and clockevents. Realistically speaking this is never going to get used.
>
>
> ChenYu
>
> >  config TEGRA_TIMER
> >         bool "Tegra timer driver" if COMPILE_TEST
> >         select CLKSRC_MMIO
> >
> > ---
> > base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> > change-id: 20261110-sun5i-hstimer-arch-sunxi-167ea2ebcbd7
> >
> > Best regards,
> > --
> > Arun Iyengar <aiyengar1990@gmail.com>
> >
> >

