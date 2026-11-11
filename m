Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C34F606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NVsoYErz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFKtYIRm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Q64Ix2X/kmoKMESKFF7GfIJozkR1NEfXs5+MGDyEJw=; b=NVsoYErzal1Xqk3CPWO9uNHnj3
	RhuEXGpidktrYKjFZtDohKbH7P6L36gkqRywC0Eyxh1pgIGimf1vdpN3yS4yqf4Fz7kI4Q7wiP76H
	73x1kOV5F5tGCcR+Zzxupll4vzLSsQqAW8xD2uxCyEue3ITKhSpR/QUC127NZMcOPRsQU2TAmTpf7
	SK4ZWfuQGgN+8djv87JDocEe4UQCd+fmk6L74jWclviAASj0N3Z5NFqfmNdMp/+j4F7ur7D2A+KS/
	wt/oUUU83LBvP22+omGzCJsMicMZ+jYSdUooVTNEKJIaMaLr/Kh5kvImMOatyPux70fKjgLqxgRdU
	seI8Tj/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2pL-00000005vAs-2ELD;
	Wed, 11 Nov 2026 07:33:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2pK-00000005vAN-1J50
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:33:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD74147460
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 07:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919191F00A09
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794382381;
	bh=/Q64Ix2X/kmoKMESKFF7GfIJozkR1NEfXs5+MGDyEJw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=LFKtYIRmdJLTkkClRaSCyq6qSvGBQLlGy2IT3YvJc6GpmYyNGMEHXvrqGlOiGQgMt
	 F22FwBQSP3RwONjGFhRF+iu8NQPa7ZXdnEgW4IrzBcYEfpVDAdfX4BuQI5OIwK542z
	 yMvQ93hyDm7oPYY1NSMHj91ORrujekYl1h9TkgyyLzppLFqiFmGnmSGcWfxLwvDnmH
	 oNT0DUvaPTQGkYwP/bXcJNlkfbCgNB+n3OVWa+PwWbQtfcwtgV2E/BRdGNQD4fTA2/
	 kS3FX4oPW6rUWw2oNquPnXG9pTKgVlikVwabONyMRFAkzVHaV7GUBouGLknay0pK4m
	 qV7aGDlxnavRw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adff684a52so24741821fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:33:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHoi93bXqyj04ciS3LoLgPiHzzaOheKAxZZp/QxbPHR20/SZLqeahpECRJzTevIGD9kGIfQaBYWrASRDMIDr2gZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/rdPvUZMg3/Anf+im1TfOaM5UMBRj6lVTb2M//ttiCIORh38P9
	pVV3qMvqhjqzEXQmaEk2EshVKo2XFCXBVxxqdT6S96T4gjZ/AOoRdbfJMRPjyvHl2aIB96Ufhrc
	v99iM08NgAuKxIswm26slfcRR5glMPJg=
X-Received: by 2002:a05:651c:19a6:b0:3ac:4b79:573b with SMTP id
 38308e7fff4ca-3ae126dfeb2mr2383681fa.13.1794382379903; Tue, 10 Nov 2026
 23:32:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-sun5i-hstimer-arch-sunxi-v1-1-9016f63e186f@gmail.com>
In-Reply-To: <20261110-sun5i-hstimer-arch-sunxi-v1-1-9016f63e186f@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Nov 2026 16:32:47 +0900
X-Gmail-Original-Message-ID: <CAGb2v66=UbyC0jaW6tjeux5VruUAXN_64bAs3+LyS=CRG1qm9Q@mail.gmail.com>
X-Gm-Features: AclHuK-OY7M3itmCA0XTlJzxAvWYSOF7vEwzX0YxEQKq8s6HmV426ktA_3YHpdA
Message-ID: <CAGb2v66=UbyC0jaW6tjeux5VruUAXN_64bAs3+LyS=CRG1qm9Q@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/sun5i: Allow enabling the driver on
 64-bit sunxi
To: aiyengar1990@gmail.com
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michal Piekos <michal.piekos@mmpsystems.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 3:07=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> The high-speed timer driver binds "allwinner,sun20i-d1-hstimer", which
> the H616 device tree uses as the fallback compatible of its
> "allwinner,sun50i-h616-hstimer" node and the D1/T113 device tree uses
> directly. SUN5I_HSTIMER, however, only has a prompt under COMPILE_TEST
> and is selected by the 32-bit sunxi machine Kconfig alone, so arm64 and
> RISC-V sunxi kernels cannot enable it and these nodes never probe.

This could be simplified: the high speed timer is available on many
newer platforms, but it is only selected by the few original platforms,
and not visible to the user.

> Make the prompt visible on ARCH_SUNXI. The driver registers its
> clocksource and clockevent at rating 340: below the architected timer's
> clocksource (400) and below the sun4i timer (350), which ARCH_SUNXI
> already selects on arm64 and RISC-V. Enabling it therefore adds a
> second hardware time base without changing which one the kernel uses.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> The H616 and D1/T113 hstimer nodes and the D1 driver support were merged
> for 7.2, but the driver still cannot be enabled outside COMPILE_TEST on
> arm64 and RISC-V.
>
> Tested on an Orange Pi Zero2 (H616) with a 7.3 kernel carrying this
> patch and CONFIG_SUN5I_HSTIMER=3Dy: the hstimer node at 0x3005000
> probes and available_clocksource lists "arch_sys_counter timer
> hstimer".
>
> This patch was developed with Claude (Anthropic) as a coding
> assistant. It investigated the problem and wrote the code and the commit
> message; I reviewed it, and it was tested on an Orange Pi Zero2 (H616)
> as described above.
> ---
>  drivers/clocksource/Kconfig | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index da83483296d5..971491d2e584 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -172,12 +172,17 @@ config SUN4I_TIMER
>           Enables support for the Sun4i timer.
>
>  config SUN5I_HSTIMER
> -       bool "Sun5i timer driver" if COMPILE_TEST
> +       bool "Sun5i timer driver" if COMPILE_TEST || ARCH_SUNXI

Nit: I would probably write "if ARCH_SUNXI || COMPILE_TEST" just to match
the other instances.

>         select CLKSRC_MMIO
>         depends on COMMON_CLK
>         help
>           Enables support the Sun5i timer.
>
> +         The 32-bit sunxi platforms that have this timer select it. On

"selected"? BTW I think we can drop the "selects" from those platforms
if the option is now visible to the user.

> +         64-bit (ARM64, RISC-V) sunxi SoCs such as the H616 and D1 it
> +         registers an additional clocksource and clockevent device, rate=
d
> +         below the ones the kernel already uses there.
> +

This doesn't really say _why_ a user might want to enable it though.
The only reason to do so is to get a higher resolution timer, but
the rating for sun5i-timer is lower than sun4i-timer for both clocksource
and clockevents. Realistically speaking this is never going to get used.


ChenYu

>  config TEGRA_TIMER
>         bool "Tegra timer driver" if COMPILE_TEST
>         select CLKSRC_MMIO
>
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261110-sun5i-hstimer-arch-sunxi-167ea2ebcbd7
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
>

