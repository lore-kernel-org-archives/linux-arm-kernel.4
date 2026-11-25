Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DD7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aQmxNDaP;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UNflD+Uh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mleJEYATU0KI5Utr1rBzWW+ACk1HN0J5Ig+JvoaqxZg=; b=aQmxNDaPqr4FZJLlYK7cte6Tsv
	zDFythrbxZxVUqMdKhCeq/YoZ60CQErldDBdhBU/wxDyTFCNRY/EjP90VQCEWi+ymRJ1uMly7ldfw
	wuSnXy5CXEQmIIBPobMIYA/7kg4PfkGgEvFcrfN55i3TSROuLiaSz326Eox7PYKV2lxjXvC44dlY0
	q+bU948f+TaQ2acxP9DjDKcBoHroORPEkpuExeAJw8e/kTAIxSGraOJg7cxSnvJj0wPwo44B6eR0b
	2f/B17Ednkr5uj6uPEbw0ni62Ik9E7EbLb4x0uXBwg2M8CZrAz0rThR0CHOzG6qboKkHzPqRSscMT
	mH2tSxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWI2R-0000000B4Cq-2WrB;
	Wed, 25 Nov 2026 18:48:15 +0000
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWI2N-0000000B4C0-1uGf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:48:13 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so2708313a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:48:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632490; x=1796237290;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mleJEYATU0KI5Utr1rBzWW+ACk1HN0J5Ig+JvoaqxZg=;
        b=lxK1YCmr1RsHC7Si/2IM6IFeBmqok2boapwZoJvfyZWlRSI72hjXcwq/DoxONxUVhY
         xlcrR6ZZC0RZHzlz40aPli9Iqu1ucLRZMKG7zlbJWzEqId8b3EQCNcyBfYGsbQA9CuGg
         PFbDG/80cAWnTf4cJwppCMQ3Ub+JOw7URZCyVSmH21xn9WJz2UWNy43Xuv6J2NM02kfM
         YHZ5xhvTO/qYJGU89bCFeznU15YydOGOFCCY+wNenSpC+htSf3HqpWObjYvIujwef7Cf
         2eUabeQ2TgOc9/24OsuJMqWonjNrUXEtFpfvo5IhvIrl+tbfMd36HJx6KzZrYncZxOxH
         DtnA==
X-Forwarded-Encrypted: i=1; AL+hErFk3GLWx1K+gZYQT1mMsVFjWQlWFi9z40TeZJj+eH6pjQ12RLQKHBPX1Y/MLlHAfps9JK+f0pu5xddg8jyBMHn9@lists.infradead.org
X-Gm-Message-State: APuU4Z/0x3GBkCm7IY8D9sOEBDkDetABomGsABVcHDmXrNjJrZNybhWd
	5CYps+eDA+IbaIhgoKoXDxqn++8DBpwZ6JuDNTWhsZLCJ1Y/noqHPoCE68J7dilRhHYPEK4CPvO
	dNNJJYkOWHP9+eL1ivUoag+TPXnHhW9RKWtbs1l7gIt8VyvK6WV3HGzsfxA/PqYQoUomcphZjWG
	ZnUSPRCYNVtOJ6tXyU4197XTt2ELQRwF0dTiYlX0J82xZtZPXjaaADeKPmm9+Z5E7ikIHQnjw4+
	9Bc1iDFov2U7ut/6u6JR0FsSHbTXdQ=
X-Gm-Gg: AZFdTZdOQnvkWX+TBwep/nInoT4vFF09alMamn3M537aE8f6Pw2rFurr3+ppKnPtbNS
	UQAFZU+SHu7L0KeAV/mWVa5f9+rbro8QOjPHO5FvyLZ/NNbFqNOXudosEGdfU17bya7D0m12wl3
	m1DEQ18TxB9NDMbeaiXLN+AR/LEYN8axW9dUBuKb9j8938Qjbnl5KZPpfQBmfkKBB0jFaDynWqQ
	f9R5hwI1gaMoCUOfgr7GqYSv2r83wmiRiejQ4apJYDq7aZ3Z3EdP37GYXIqz9gd+3NxHnHtFLbw
	+afHnvmygsW7RW6I3y/cTYOyGbALT6OAy7cn7STOhNdDI40aLlCOPhF3MEaLO5mEOcelNjuNntD
	Ej6PCtUfeitVYD27ZQFjLufZM5Wd+GfKt5IU6ch9sfRowjeMtox/Bddox2xA0rgh+a27hpGTDVX
	Rd38J+ZxYZG7J87r1dzAPInagGcdHYnLZhVdIWS9k=
X-Received: by 2002:a17:90b:4ccb:b0:3a0:7261:d58e with SMTP id 98e67ed59e1d1-3b41c8dc8aemr17365829a91.22.1795632489620;
        Wed, 25 Nov 2026 10:48:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfb370asm7065190a91.0.2026.11.25.10.48.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:48:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-679b648598bso2010311d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795632488; x=1796237288; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mleJEYATU0KI5Utr1rBzWW+ACk1HN0J5Ig+JvoaqxZg=;
        b=UNflD+UhRFgIlKj6IInCp8FnN+q4c7bYDgOQgNZSdArOY4PHr/JypMBlJeA1EtKJzF
         YPSoGA5WAnrLG2G65Kvdtu9DwXUQWIYZGD4RLaeipic330ok0HMYMGf5cBUMIum+YUSu
         nF1/YxPzd0a924YxjGJvKJZeiEz35ye1duaDY=
X-Forwarded-Encrypted: i=1; AL+hErEKsq//+KPVtbN5fEtOFVnB6WJ8S57HryY5Q7sIT0K6C1IX39/bFcntRv830R+ILEZ/7KH6B2ImmnzEfGqy0UoN@lists.infradead.org
X-Received: by 2002:a05:690e:14c6:b0:679:cc49:55dc with SMTP id 956f58d0204a3-67df44e0fabmr8353269d50.92.1795632488280;
        Wed, 25 Nov 2026 10:48:08 -0800 (PST)
X-Received: by 2002:a05:690e:14c6:b0:679:cc49:55dc with SMTP id
 956f58d0204a3-67df44e0fabmr8353260d50.92.1795632487725; Wed, 25 Nov 2026
 10:48:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123142203.3860616-1-hjf3108@gmail.com> <20261123142203.3860616-3-hjf3108@gmail.com>
In-Reply-To: <20261123142203.3860616-3-hjf3108@gmail.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 25 Nov 2026 10:47:56 -0800
X-Gm-Features: Aa3M54ptQD7IVaeGdMWLNxnqSr7JMiJj7aEZdCT3YmX8Sz7Vy0I3dl8ho_mNAnM
Message-ID: <CAHi4H7HVNRnBynR2KLnxr=fpep=jkSBbE1NHvFr5e2DsvSTpjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: bcm: support more than two CPUs on BCMBCA
To: Ho Jie Feng <hjf3108@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000a1512b06611e44d6"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_104811_835615_FB55CAFD 
X-CRM114-Status: GOOD (  34.55  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000a1512b06611e44d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi  Ho Jie,
On Mon, Nov 23, 2026 at 6:22=E2=80=AFAM Ho Jie Feng <hjf3108@gmail.com> wro=
te:
>
> BCMBCA Cortex-A7 SoCs can have more than two cores, such as the
> quad-core BCM6755. Extend the CFE SMP support to all secondary CPUs.
>
> CFE parks every secondary CPU on the same mailbox, and the wakeup SGI
> wakes all offline CPUs at once. Hold them in a pen and release them one
> at a time.
>
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> ---
>  arch/arm/mach-bcm/Makefile         |  1 +
>  arch/arm/mach-bcm/bcmbca_headsmp.S | 26 +++++++++++++++++
>  arch/arm/mach-bcm/bcmbca_smp.h     |  9 ++++++
>  arch/arm/mach-bcm/board_bcmbca.c   | 46 ++++++++++++++++++++++++------
>  4 files changed, 73 insertions(+), 9 deletions(-)
>  create mode 100644 arch/arm/mach-bcm/bcmbca_headsmp.S
>  create mode 100644 arch/arm/mach-bcm/bcmbca_smp.h
>
> diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
> index fcc4e0174a..c3cd2959bc 100644
> --- a/arch/arm/mach-bcm/Makefile
> +++ b/arch/arm/mach-bcm/Makefile
> @@ -60,4 +60,5 @@ endif
>  ifeq ($(CONFIG_ARCH_BCMBCA),y)
>  obj-y                          +=3D board_bcmbca.o
>  obj-$(CONFIG_SMP)              +=3D bcm63xx_smp.o bcm63xx_pmb.o
> +obj-$(CONFIG_SMP)              +=3D bcmbca_headsmp.o
>  endif
> diff --git a/arch/arm/mach-bcm/bcmbca_headsmp.S b/arch/arm/mach-bcm/bcmbc=
a_headsmp.S
> new file mode 100644
> index 0000000000..3d0d0d97be
> --- /dev/null
> +++ b/arch/arm/mach-bcm/bcmbca_headsmp.S
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * All CPUs will wake up on an SGI. Wait in the holding pen until
> + * bcmbca_cpu_release matches the MPIDR.
> + *
> + * Based on arch/arm/mach-versatile/headsmp.S
> + */
> +#include <linux/linkage.h>
> +#include <asm/assembler.h>
> +
> +       .arm
> +ENTRY(bcmbca_secondary_startup)
> + ARM_BE8(setend        be)
> + THUMB(        badr    r9, 1f          )
> + THUMB(        bx      r9              )
> + THUMB(        .thumb                  )
> + THUMB(1:                      )
> +       mrc     p15, 0, r0, c0, c0, 5
> +       bic     r0, #0xff000000
> +       adr_l   r6, bcmbca_cpu_release
> +pen:   ldr     r7, [r6]
> +       cmp     r7, r0
> +       bne     pen
> +
It is better to invalidate the L1 cache for the secondary cpus
regardless of whether the bl does that or not.
> +       b       secondary_startup
> +ENDPROC(bcmbca_secondary_startup)
> diff --git a/arch/arm/mach-bcm/bcmbca_smp.h b/arch/arm/mach-bcm/bcmbca_sm=
p.h
> new file mode 100644
> index 0000000000..30055cf766
> --- /dev/null
> +++ b/arch/arm/mach-bcm/bcmbca_smp.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __BCMBCA_SMP_H
> +#define __BCMBCA_SMP_H
> +
> +extern int bcmbca_cpu_release;
> +
> +void bcmbca_secondary_startup(void);
> +
> +#endif /* __BCMBCA_SMP_H */
> diff --git a/arch/arm/mach-bcm/board_bcmbca.c b/arch/arm/mach-bcm/board_b=
cmbca.c
> index 248b8bd776..1afba1d680 100644
> --- a/arch/arm/mach-bcm/board_bcmbca.c
> +++ b/arch/arm/mach-bcm/board_bcmbca.c
> @@ -1,14 +1,20 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  // Copyright (C) 2024 Linus Walleij <linus.walleij@linaro.org>
>
> +#include <linux/cache.h>
> +#include <linux/cacheflush.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/of.h>
>  #include <linux/smp.h>
> +#include <linux/units.h>
>
>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>
>  #include <asm/smp_plat.h>
>
> +#include "bcmbca_smp.h"
> +
>  #ifdef CONFIG_DEBUG_BCMBCA
>  /* This is needed for LL-debug/earlyprintk/debug-macro.S */
>  static struct map_desc bcmbca_io_desc[] __initdata =3D {
> @@ -29,16 +35,28 @@ static void __init bcmbca_map_io(void)
>  }
>
>  #ifdef CONFIG_SMP
> +int bcmbca_cpu_release __cacheline_aligned =3D -1;
> +
> +static void bcmbca_write_cpu_release(int val)
> +{
> +       WRITE_ONCE(bcmbca_cpu_release, val);
> +       /* Order release write before cache clean and wakeup IPI */
> +       smp_wmb();
> +       sync_cache_w(&bcmbca_cpu_release);
> +}
> +
> +static void bcmbca_secondary_init(unsigned int cpu)
> +{
> +       /* Let the primary processor know we're out of the pen */
> +       bcmbca_write_cpu_release(-1);
> +}
> +
>  static int bcmbca_boot_secondary(unsigned int cpu, struct task_struct *i=
dle)
>  {
>         struct device_node *np;
>         void __iomem *mailbox;
>         u32 release_addr;
> -       int ret;
> -
> -       /* CFE has already powered up CPU1 and left it waiting in WFI. */
> -       if (cpu_logical_map(cpu) !=3D 1)
> -               return -EINVAL;
> +       int release, ret;
>
>         np =3D of_get_cpu_node(cpu, NULL);
>         if (!np)
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
>         iounmap(mailbox);
>
> -       return 0;
> +       bcmbca_write_cpu_release(cpu_logical_map(cpu));
> +       arch_send_wakeup_ipi_mask(cpumask_of(cpu));
> +
> +       ret =3D read_poll_timeout_atomic(smp_load_acquire, release,
> +                                      release =3D=3D -1, 10, USEC_PER_SE=
C, false,
> +                                      &bcmbca_cpu_release);
> +       if (ret)
> +               bcmbca_write_cpu_release(-1);
> +
> +       return ret;
>  }
>
>  static const struct smp_operations bcmbca_smp_ops __initconst =3D {
> +       .smp_secondary_init =3D bcmbca_secondary_init,
>         .smp_boot_secondary =3D bcmbca_boot_secondary,
>  };
>
> --
> 2.53.0
>

--000000000000a1512b06611e44d6
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
uY1zxS3At2LYq6rXOOKPAGt2d7mF0tkPQSYP/yKZcl4wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMTI1MTg0ODA4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAEy0Z96Q59jz43d9uUk40mWy+8E0QgOgp1vH6
BCDilfTSLAeUThnias4GotPK1zRWWzsVwpKv6FWfixt3K61/Xy6dQ8RYaFstQcQNK/yVTL6pWZ2g
9sAQ8rv5rnsge8GJpDaU1d9wwmLAcWdUMCfznXPFZgqVbDDV276TZwn4tYh0PtBPUQNuzbHoyqEp
LQm1uyz1iuUNpfkGHVWdNy4hqOfu7cfiHrQ/hffAbm225nckdmfD/5sS3KEWVDfnQjvB7pLP3cAl
STocnFkd8DxFxRK5QmtgjX51vztrNNYgWeqLsIMyTLd56HbPDBjSqBBDnu7N4ix+xMlCaoSKpI+8
HA==
--000000000000a1512b06611e44d6--

