Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC06B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nsdVD6JT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGesK0V8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tS2gaavtLHkaRIhoftiQwAfQBELkcBZUly25G8RQWLA=; b=nsdVD6JTECtDjs
	OjK/mAj8YvBTp6JMjOVnAkLVvWG8dvEdXiJIGXHngAvkxY9lnMxcHu44TQ85mNGU3mDAhMyb9qAAm
	WlHuUUCb6Ltq026hX4lEMk+3FlWjOGofWkYxGZrZn0yA4quguFzWd0uJbqmZvBeWBZPrh9iszPUqY
	X5G3sqFjhXr+EF8ZwdqSmtfgOVdC7V+UN/Snw3VyviqOVrN7EBBYo53kupWm96w7HonL+KUjAx/ve
	QfWsPR3BhQd5qC48Whz67QqnD9vMd06x5f/sBoMbIaq8JpMl8eRINhIqOKxKfZ6RgrhZrz3Q5UcvA
	gkVQ5m0VeQBSGCvVRxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWK6z-0000000BKeq-2lbv;
	Wed, 25 Nov 2026 21:01:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWK6y-0000000BKej-2qsE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:01:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B0A246324
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 21:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F591F000CF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 21:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795640464;
	bh=tS2gaavtLHkaRIhoftiQwAfQBELkcBZUly25G8RQWLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FGesK0V8hAz8p/FNSSfFtqDzfHsTOzomDp2OKK5CWs4cgy4IHpLiHFf0ouNaE2yW8
	 EKVr+QPZnUFGmd6BVHmftGq/GJLT+YG4yVR2UjyklSK1gJqyl/JBodFnCIdE1946uH
	 RUVdWWufi74tVT2llyHKS+8foZszOgLGFqypzEdw1X4NOSj0etKnD061x0DekDTmp9
	 TsbstYwMb5mnEWkUgz0/5Ur7yUB0PUhJGsLQB06zrT3J3fOdlumGHbeEkd+WQS15Ta
	 AWB4ibUTtuUCOoegB3uyRvs+ffxevPp9EQW0tKnOcvp/ZegepwZHTpeMpbJWrLsj73
	 73dP8orPHWbrA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae6f2b193fso31998291fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:01:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHe6wPq677j83/GnDmoWuvBJ0Wtqbyy/5oVEs2a5jd5MycLOxTzlhNJgbIuhh9fE6D7MESue5Kw1HueSvf1zGfW@lists.infradead.org
X-Gm-Message-State: APuU4Z8BiBZk8R4F1d+mw6XiJvYrpuCgMpLukbVWrsztoGPvIexb59ve
	CVXG/nhe765C3ws7yd/eV3JFoGBf2TNQT21OLNoY8pW9dK9jD1VhS95vLCRZeXYlydZIeaqfG5z
	n+jIU3WoeOieb9tyK++6jzf5Gr5XxLo0=
X-Received: by 2002:a05:6512:110a:b0:5c1:5cee:634c with SMTP id
 2adb3069b0e04-5c1bc8447d5mr6322238e87.61.1795640462553; Wed, 25 Nov 2026
 13:01:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123142203.3860616-1-hjf3108@gmail.com> <20261123142203.3860616-3-hjf3108@gmail.com>
In-Reply-To: <20261123142203.3860616-3-hjf3108@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 22:00:48 +0100
X-Gmail-Original-Message-ID: <CAD++jLmHRkL7Zmw7VrV-UFo14nwgMTLB3UVA15vn9JWsvrXQfw@mail.gmail.com>
X-Gm-Features: Aa3M54qUkO3zSeEjRH-PO8oJtdJZnSyIyAg3hK9lVAU8zHOdRHoMwx9ZR26Yhlg
Message-ID: <CAD++jLmHRkL7Zmw7VrV-UFo14nwgMTLB3UVA15vn9JWsvrXQfw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: bcm: support more than two CPUs on BCMBCA
To: Ho Jie Feng <hjf3108@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ho Jie,

thanks for your patch! It's nice to see others building on this
idea, for a while I thought I was the only person in the world
who care about BCMBCA upstream.

On Mon, Nov 23, 2026 at 3:22=E2=80=AFPM Ho Jie Feng <hjf3108@gmail.com> wro=
te:

> +++ b/arch/arm/mach-bcm/bcmbca_headsmp.S

> +#include <linux/linkage.h>
> +#include <asm/assembler.h>
> +
> +       .arm
> +ENTRY(bcmbca_secondary_startup)
> + ARM_BE8(setend        be)

Are you aware about any people booting these platforms
in big endian? I don't think that works, just skip this.

> + THUMB(        badr    r9, 1f          )
> + THUMB(        bx      r9              )
> + THUMB(        .thumb                  )
> + THUMB(1:                      )

This code is for the CPU to switch from thumb mode to
ARM mode if it was booting in thumb mode. Does this
actually happen in practice? Else you can skip this too.
It just looks overly cautious.

Also the ordinary secondary_startup_arm does the same things already!

> +       mrc     p15, 0, r0, c0, c0, 5
> +       bic     r0, #0xff000000
> +       adr_l   r6, bcmbca_cpu_release
> +pen:   ldr     r7, [r6]
> +       cmp     r7, r0
> +       bne     pen
> +
> +       b       secondary_startup

And why are you first spinning on the GPIO address
and then spinning again in this "pen" (as a place for
livestock, such as CPUs ;) it was added to mach-versatile
to work around a CPU bug in early silicon.

As Russell King writes in 2018:
https://lore.kernel.org/linux-arm-kernel/20181213175952.GC26090@n2100.armli=
nux.org.uk/

> The "pen_release" thing was created for ARM Ltd development platforms
> where there was no way to individually control secondary CPUs leaving
> the boot loader - they all jumped to whatever physical code address
> was supplied at the same time.  This made it necessary for _these_
> platforms to have a "holding pen" for the CPUs while the kernel
> initialised.

The "pen" is only needed if all CPUs jump to that address at the same
time. I don't think the BCMBCA platforms do that because you send
one IPI to each CPU?

So I would skip this assembly completely...
I don't understand why you're doing this other
than copy/paste?

> @@ -58,17 +76,27 @@ static int bcmbca_boot_secondary(unsigned int cpu, st=
ruct task_struct *idle)
>         /*
>          * The CFE stub reads GPIO GeneralPurpose after an interrupt and
>          * branches to it in ARM state. Clear any Thumb function pointer
> -        * tag and complete the MMIO write before sending the wakeup IPI.
> +        * tag and complete the MMIO write before opening the pen and
> +        * sending the wakeup IPI.
>          */
> -       writel(__pa_symbol(secondary_startup_arm) & ~1, mailbox);
> +       writel(__pa_symbol(bcmbca_secondary_startup) & ~1, mailbox);
>         dsb(sy);
> -       arch_send_wakeup_ipi_mask(cpumask_of(cpu));

Have you actually tested *not* changing this code and see if
all CPUs just come up? It should just send each CPU in order to
secondary_startup_arm like we want?

Yours,
Linus Walleij

