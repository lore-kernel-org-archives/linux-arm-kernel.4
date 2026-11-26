Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B480606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1jwZQdnV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yO1HyvCE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VgeqwZ6c13ysK3Ffl+UlwXTHJlLqeIHDQOOx+5zpAXI=; b=1jwZQdnVT6Ehv9
	Vg+L4vSvm8GNtg281ig6rYKEBgtsFrVrMg/NrzTFs6EUR0YjNUarwzve23BJTLrHZIABOPKKR5T7x
	DdhuqF9ilVq3hNSoLmLXcCe6xXUVFEIxePIxO8XDHaxbJBD4t1FUODKdkW8MIpiabtSt7SjwfX0IO
	PRXyLC6hhZg71R3u3fPfmY8Cm9pSIbIGkTTskAM7w48x3Wfw61BZrQoK6o7DOl6XTM1lBhhOXoUU3
	6mbyGr9nil7hPG76O8sawU2l+xn0MGOasRG6ia1N41AgqZUtpJFR56zjY+Hf24dqD6Oq0GUkMhYU/
	KYQAPDVK0OaoCxNL02TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPoV-0000000BxpB-1Q9P;
	Thu, 26 Nov 2026 03:06:23 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPoT-0000000Bxop-1HLM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 03:06:22 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so4402117b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 19:06:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795662380; cv=none;
        d=google.com; s=arc-20260327;
        b=q9JYPk7YZ5Tg150UgYPeiiODCdfMtv0RrbS0KIPIHn4OXA3CfvXwlli07GHmdKaxfk
         VWXmOpQWNKPCI2/0tUJG4hkiZ8xpxtK01YDxWFl8PQ+M2rThBc6wYjBHEBwJeFvmkxPo
         Ccb8CeFVn3YWTee9DMuVi2A1gT6A1R88pnc9PC4BM3JIgLk0qN2Z0P4vUVQ0rvF5sp4f
         EQYxUDtDoo1OgeYuJVUZptU59Rqt9RiUlx+dS7IIQ2j13d/PB/Q4KESq+MB8IKflxOa9
         mz/AB6SfWo9jMDD7pmgF/J096l55OLlru0hjO3MNhPo1WxYpNYY8wYq34NbWxAX+Y+yB
         za3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VgeqwZ6c13ysK3Ffl+UlwXTHJlLqeIHDQOOx+5zpAXI=;
        fh=T25We4izAmDVaU4AsIQV3/VFsLdglUUyxZ00193Z3dg=;
        b=QmHg6TUq7EopnbsiFmgghQbY9Ne1PYyZwrG/BB3MyVQdqig09dSBmoTE4C75Vn//Kn
         ru3w7HS/qxD+n7dgsrhuRp1Fs2gxLvnarvIXFAIYhCAtSAmzkEnZIrxrSrsgnf7OYUZn
         +o1bJ+dRgfYaWbgpLB7bNc+tepLstOqS8+qGeRqwkpXE0iTrBKT3V+1OZKPGVsjvJWBU
         bhb2k2COR4tXM3SHt9OQamsUs9EnmVWl7GuQJ6J7B4IpnVx9uKtxqiYkw55ZK0/jS9s6
         tgjWrsFVnH76+oLnxRLCbUpr/P28V1TOhTIsdDqsbyCizwM5Fampc8rypJ35z1+uboc3
         F/zg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662380; x=1796267180; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VgeqwZ6c13ysK3Ffl+UlwXTHJlLqeIHDQOOx+5zpAXI=;
        b=yO1HyvCEWhK5e/G1/2b1JbBQywAC5S/9GaHVOXhXKveejhw498sAHznVNyQ8J/0SmV
         cNwbpeakb/Ww8AdA8b+nMuOELg1xa+2HejHFw2uDlU249UAyARZdxpyhRx7YLqT0b6R/
         jmjezP3CylFIfocPFf34tSZ9k5rG+zWXGDCj7VnND83R0eUxtgWFIwoTXiGk+PM2H36X
         uNWcFhrzdWwcZPPXzf9Rql0I+AMHjsFUHkLXszdsdR8kZY+OV4koRkBF0i++BvaMFh3G
         LBuHGRRQye/R8uhwcmjgbiqxzCT0Bp/Hx/588fTYUIY5TO2NbhcZPwrwjgZemO2J297n
         9UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662380; x=1796267180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgeqwZ6c13ysK3Ffl+UlwXTHJlLqeIHDQOOx+5zpAXI=;
        b=A+OWCB+jidfHdfTQgOowOkHNtDTRM0y0KSgv3Okh9iU84S5bs0yQscGMXzHzjRFWKv
         V1H/GUylJkQaTa0pyHk7x1sHp9njF3om6UM+vw0wemIV0N/9ediqTkwvYnwOHTZu2olr
         PQwg2DFZhIejg71p3CR+94H+Zn21xStOj97XC/NGJsicewvJ8O4qqr/YD58E9Mb2K3r8
         3flN8JyUnhKtJZ/OBDO/sCuDTfBycPPlKasfbUIZdQu2RzPJ5dzOkj/kt2s73+zWR1HZ
         9VkctqtYZvnnA++Iy1RwYGAYzbIzxobO26ZVxjCkPa9XArpihb40lcWvQs4VbEReYK0a
         2esw==
X-Forwarded-Encrypted: i=1; AL+hErEgtiT+Hjn59ql7WY6rpE1DeC9ZPvZ5jqRAx0xSNZEDCC+vnnrqWhdHjPXHGOwi+phbNezSW93a5Key1wKcUea0@lists.infradead.org
X-Gm-Message-State: APuU4Z+A2Kg96j6JALK7plXBVj6JIQFkjcBDWnLH5agfOwsjOhrqRiGz
	pje3bUeQ2RFUE3ghofWpTPfszVpq74KBufaBNteN2M6FtQJRyK6/AyGDHTPpUdvy0z6xsyPFOOt
	6uC2wkYJfX7ShuV4KrTfq9DkG66Z0EV0=
X-Gm-Gg: AZFdTZeg/UNyG9ydjr3hLory4gQtm91sjEtFPATWbo8tELs6LujkzgN5gDuyOs1o826
	0b7btD+BVIeM+hfa4RqzSkKVFOXWP5d5pXxQ09dfOxvsU22NZ5A9IviQYL5Z0UpIP+NSyeIAQkP
	uNuClmxUnSuH4hY4nUeHooNCO4QR+LRh487JgUsDRFjH36MqM1Rkr5vWJG7o7Ff1k1JyxIV71pr
	p7qh2JtVZEhBYXO11JgCDVfZgTP7CvzShtzsi75RJoLql/85BqdIBicTYPG1y3yBOcjgeXsDf4q
	7zoydvgasVeAluFK5+Vh4w94yMv5phPe4ldHb7enn35JQUgqtIe1vwMw294Rgl00U4dhUWWWQZX
	cqaLH8a3cRkgd7DtQtjJP/e0xC0ozn88nhtlcM8olz+cjjYHwJUdIGeEJ76NUCs5Rizo2SMOq/W
	XXI1fEAC4+TmPMy+FwvZntfuH9Fh+Kz5/uZ8S2hR9OriShNPXWfM08
X-Received: by 2002:a05:6808:150b:b0:573:b059:4d5 with SMTP id
 5614622812f47-57a0a516489mr21719385b6e.11.1795662379758; Wed, 25 Nov 2026
 19:06:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123142203.3860616-1-hjf3108@gmail.com> <20261123142203.3860616-3-hjf3108@gmail.com>
 <CAD++jLmHRkL7Zmw7VrV-UFo14nwgMTLB3UVA15vn9JWsvrXQfw@mail.gmail.com>
In-Reply-To: <CAD++jLmHRkL7Zmw7VrV-UFo14nwgMTLB3UVA15vn9JWsvrXQfw@mail.gmail.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Thu, 26 Nov 2026 11:05:42 +0800
X-Gm-Features: Aa3M54pQKq03Y0-nnWMu9QCndX8rwmggo2h42nh5oUoLZC7NpdzpKY1Ii1Xr7tc
Message-ID: <CABOQOSWT8pFPEECEfH6oR9yQT1_-_QU-okJGOGgdm_k9G=Ft6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: bcm: support more than two CPUs on BCMBCA
To: Linus Walleij <linusw@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_190621_360067_5A83E6C9 
X-CRM114-Status: GOOD (  39.98  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

On Thu, 26 Nov 2026 at 05:01, Linus Walleij <linusw@kernel.org> wrote:
>
> Hi Ho Jie,
>
> thanks for your patch! It's nice to see others building on this
> idea, for a while I thought I was the only person in the world
> who care about BCMBCA upstream.
I'm also trying to boot OpenWrt on a BCMBCA router and already got
many things working. Going to send the dts upstream soon.

> On Mon, Nov 23, 2026 at 3:22=E2=80=AFPM Ho Jie Feng <hjf3108@gmail.com> w=
rote:
>
> > +++ b/arch/arm/mach-bcm/bcmbca_headsmp.S
>
> > +#include <linux/linkage.h>
> > +#include <asm/assembler.h>
> > +
> > +       .arm
> > +ENTRY(bcmbca_secondary_startup)
> > + ARM_BE8(setend        be)
>
> Are you aware about any people booting these platforms
> in big endian? I don't think that works, just skip this.
>
> > + THUMB(        badr    r9, 1f          )
> > + THUMB(        bx      r9              )
> > + THUMB(        .thumb                  )
> > + THUMB(1:                      )
>
> This code is for the CPU to switch from thumb mode to
> ARM mode if it was booting in thumb mode. Does this
> actually happen in practice? Else you can skip this too.
> It just looks overly cautious.
I am not very familiar with how bcmbca is used. Since these kernels
can be booted by CFE and I do not know what kinds of CFEs or
bootloaders are there, I left that in.

> Also the ordinary secondary_startup_arm does the same things already!
>
> > +       mrc     p15, 0, r0, c0, c0, 5
> > +       bic     r0, #0xff000000
> > +       adr_l   r6, bcmbca_cpu_release
> > +pen:   ldr     r7, [r6]
> > +       cmp     r7, r0
> > +       bne     pen
> > +
> > +       b       secondary_startup
>
> And why are you first spinning on the GPIO address
> and then spinning again in this "pen" (as a place for
> livestock, such as CPUs ;) it was added to mach-versatile
> to work around a CPU bug in early silicon.
>
> As Russell King writes in 2018:
> https://lore.kernel.org/linux-arm-kernel/20181213175952.GC26090@n2100.arm=
linux.org.uk/
>
> > The "pen_release" thing was created for ARM Ltd development platforms
> > where there was no way to individually control secondary CPUs leaving
> > the boot loader - they all jumped to whatever physical code address
> > was supplied at the same time.  This made it necessary for _these_
> > platforms to have a "holding pen" for the CPUs while the kernel
> > initialised.
>
> The "pen" is only needed if all CPUs jump to that address at the same
> time. I don't think the BCMBCA platforms do that because you send
> one IPI to each CPU?
I can experiment with that.

> So I would skip this assembly completely...
> I don't understand why you're doing this other
> than copy/paste?
>
This is obtained from the vendor source code where there is also a holding =
pen:
https://github.com/Asuswrt-Merlin/asuswrt-merlin.ng/blob/main/release/src-r=
t-5.04axhnd.675x/kernel/linux-4.19/arch/arm/plat-bcm63xx/platsmp.c
https://github.com/Asuswrt-Merlin/asuswrt-merlin.ng/blob/main/release/src-r=
t-5.04axhnd.675x/kernel/linux-4.19/arch/arm/plat-bcm63xx/plat-ca9mp-headsmp=
.S


> > @@ -58,17 +76,27 @@ static int bcmbca_boot_secondary(unsigned int cpu, =
struct task_struct *idle)
> >         /*
> >          * The CFE stub reads GPIO GeneralPurpose after an interrupt an=
d
> >          * branches to it in ARM state. Clear any Thumb function pointe=
r
> > -        * tag and complete the MMIO write before sending the wakeup IP=
I.
> > +        * tag and complete the MMIO write before opening the pen and
> > +        * sending the wakeup IPI.
> >          */
> > -       writel(__pa_symbol(secondary_startup_arm) & ~1, mailbox);
> > +       writel(__pa_symbol(bcmbca_secondary_startup) & ~1, mailbox);
> >         dsb(sy);
> > -       arch_send_wakeup_ipi_mask(cpumask_of(cpu));
>
> Have you actually tested *not* changing this code and see if
> all CPUs just come up? It should just send each CPU in order to
> secondary_startup_arm like we want?
I traced the code to drivers/irqchip/irq-gic.c, since
arch_send_wakeup_ipi_mask will eventually end up there.

- Line 1248-1253 every gic_cpu_map[] entry is set to 0xff
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/irqchip/irq-gic.c#=
L1253
- Line 836, 845 the driver ORs the map, so IPI get sent to all secondary CP=
Us
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/irqchip/irq-gic.c#=
L836

Since this platform is booted by the CFE and not using PSCI, I decided
to use the vendor source code since it looks like the safest option.

> Yours,
> Linus Walleij

Best regards,
Jie Feng

