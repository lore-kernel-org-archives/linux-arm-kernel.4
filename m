Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=14rxrAXZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=okNQ38RB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GcbvCV5GSqklGhaKRYdmeFkbVhlk/m5bj3QKHwsg91o=; b=14rxrAXZMC7G9M
	p+tkaFjOL3yf6rojD/vwiPOPV/Q5afLlkGaC7gnqjeRzBwQiAYi9DbEIknDww/Cz6a/euczGQZL1V
	rPWuQYm6ySsZzRQU1JBOIkcQ9B65tWPBayKWhp+skLlRqebHMVwXkTBGmv3NcOE/sMCNZvopkz4cS
	i/HFoxVlh+j+l6uPt92ey4lBnygNG/69hfaCRCbdsy4PQxihleIdHlpGhwhHrvOETK2g14xspw86h
	Qr2Sxf28YBrTA7fcqELsTG8wmSxTPnfx/KcRodjAK/hKx4i8n+4NIPcIu4NLleLgJNzSq4m/NJvJc
	YSOXcdhqCWyiZnLIpHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPwS-0000000BzJd-3bQY;
	Thu, 26 Nov 2026 03:14:36 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPwQ-0000000BzJA-1BD7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 03:14:36 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-57e49de1d8bso1426156b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 19:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795662873; cv=none;
        d=google.com; s=arc-20260327;
        b=rHUCagQiPECaKPBkvYwWiaySl53ezwna4UHjOkNjKKpa7YzZrn1qSOaKIVf180EXOJ
         /n5DLql1EqbehapugEMWeZz6zZaWaCwbBgDNjiFQ+51jFlfbX9tYD0ffCr2S7jsRTLD8
         pTZiTFHDdguVUkIVDDc3L2r4aV0cDBSfi5ov7kHne7jSlyVXfE87zU7B32V4IbcATcHF
         NvQGkyT/QBhLDj21HBaw0IqkMfW7XnWZNT/1zl9Kl36zjUqhnT57PRXn5jATwlGPDW4f
         EhVUFrUgiZVNqHJ6EkSLgYWos9qA/28FNabgJRI7s/DNLR8eLBOxFK6ya6aFealvHtFQ
         UB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GcbvCV5GSqklGhaKRYdmeFkbVhlk/m5bj3QKHwsg91o=;
        fh=79OJgrTBdTdyr/lpRPLSPFsRsSOY1nnEswm2ZCn/EoY=;
        b=lymYLREWPBfVGfI9+KOKN9zlmWT0g+fxcFhMVAwkyaCIF/wjIw0WCxOejwqJZG/aGR
         QaIt0Zv2EDKRw2czJUnU9G/HeO5jKG1wlpLiKTZCSnQ257CDZ3M9uo2cLfamO+POZNOm
         9ChsOMCLMRIYblqH2pLbG1IfXTEpBPcgeGPV81aStdxbE8zXlyafi/1y794Qz9L8AQUR
         L04QFqhegE+3SdjNh8VTWvJfuGatpDZV2ShqfAnb4ALOHsnCo93x24ee9e0wnFdNW2UL
         xunTNKujNYVO4Yz70UqZnXOddctbThVAFXZzbsfa39z5zr6yCyDU3zcBLlRKlGFdGTel
         hQuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662873; x=1796267673; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcbvCV5GSqklGhaKRYdmeFkbVhlk/m5bj3QKHwsg91o=;
        b=okNQ38RBqP8knEiFVT++U9IQXz73rqbuTMXHVblX0B8rhipYa/5rJolrrZV8ASqfr3
         fbx0gV3AyOtoYOQVePRQIvQxmqzvIZJGkWCpDWqpp0Z7ZT0rnHCja+NLKGd2sM/Krbpy
         cZ26ETuwpFRAvkEmxa07+IYn4stwAycW83kGrlnDqrw8YW7ZJLfac7bROS52ohupetcU
         Oq/RGCCDeZXoALr2TBsDqNnntwofzr6Wf4O3ne56mhk1xLtLgVhqTZNDza9OTo+S+l0P
         IvQlFPmYQS8DVofJCQv5N1d1LfUhllBJgyDSpxRXVjCAxrXRPfLnigQ1ebMx5s7K3QQf
         xKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662873; x=1796267673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcbvCV5GSqklGhaKRYdmeFkbVhlk/m5bj3QKHwsg91o=;
        b=ZwmQ0MmJ5xp2zt9P0UzOCSM5A6CyeyKrLOMUFkoJV7j2jVh/iY9ZDZDtmle0ykjiKC
         x7oAjfnI1CIlXhoI0oQ8DWOX6M2AaAgR0vK+vc8Rr736F6WZrcsSNh6llky74czW+Mja
         FtRaCV+sHxpdUlKYWhyNuyJND97UuRlpj4+FYuI8YkEKIARvCWK7pD+S6gvoIz82QTzp
         WSliLhU+e5AiMe+13cpUQaaOoZ7jF6ShdKCWEubKkdVcy8t3/dQUn1RKtuarCUhmpiCB
         f629YL/quSt3D64CCZcVniEUPX1WarCarXDxST/vHffd0lIwzuoo6TLuq36MMfSRPu1J
         SMAw==
X-Forwarded-Encrypted: i=1; AL+hErEAd6VaPpxpEXSPdtFkwgOuWlLCtU0uPoQQkCxOfoLIengOneT0tgFYgcpqx+YWTBOdSsk7LVbZM88bT2lvUcCx@lists.infradead.org
X-Gm-Message-State: APuU4Z8B9qEgfeXg6OnrNbunkXKV35aHT4fPblmTHJPoR0V0fUMam+KX
	fmK9XaES1i33e53Mwrg1l10/eFdBM2aDZdodKAY1x8ENY2LepqQoFRz7enOVRjYHKiCe5Cu28Om
	OsUBJUVta5eCqcpj1MFM9RF/5HC6RZS4=
X-Gm-Gg: AZFdTZdKm6/t/Yiy82apYf3+Z4z9zsykeWdh4kswQeMwcm+2JOGfFaip5y2lStm8IaE
	zczkskzV5j+IVQPkzU1X5zmQHjxgbyjj+Qo35f5gfiSx2ardvNdAMHiEL5sz/n++OSLx9/k4+qc
	Ry01gEr1afmldhGQCvDLMtFrZEjKkhfVJP1nRnEH0DJEKSjJdfwVqAYSG4mtC0FWbTxz1bg7oM0
	CE6/aABTCrSWhkLXHguXE7cTUFpBf2CLLNd9CucvxFAzciw/suK2QS0kYAJNWN6seMDmPq/sP20
	jaTf/HO0xIfulQXeooiQ68BJXWhGBfdRR/m9Y6RPO5DhXb3Ya9bZ3YdnENvrgaTjbwT2Lar5Le1
	v2TG8FdhTvstEyAK+Qrh6koiy7K2udE28U1EHCFcPfaMsyLux7r1KzPdRGhY9wI4Gc0dFQVXjcE
	RCrYMD+d4oM6UXBmVdtuClidRXSqo7h8k=
X-Received: by 2002:a05:6809:757:20b0:57d:1af2:6e12 with SMTP id
 5614622812f47-57d1af26e3emr9673937b6e.30.1795662873030; Wed, 25 Nov 2026
 19:14:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123142203.3860616-1-hjf3108@gmail.com> <20261123142203.3860616-3-hjf3108@gmail.com>
 <CAHi4H7HVNRnBynR2KLnxr=fpep=jkSBbE1NHvFr5e2DsvSTpjQ@mail.gmail.com>
In-Reply-To: <CAHi4H7HVNRnBynR2KLnxr=fpep=jkSBbE1NHvFr5e2DsvSTpjQ@mail.gmail.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Thu, 26 Nov 2026 11:13:56 +0800
X-Gm-Features: Aa3M54o33vWSDdhl3EhMnBuHhyvDxviml_wh1UCQV3GqiVxQrmBIeWc2Ms3zbUM
Message-ID: <CABOQOSV5eW5X0_ChXe8MT2tTFPtLTHLuRn520Ya-tUp8MoQTFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: bcm: support more than two CPUs on BCMBCA
To: William Zhang <william.zhang@broadcom.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_191434_349908_17FBDC9B 
X-CRM114-Status: GOOD (  24.81  )
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

Hi William,

On Thu, 26 Nov 2026 at 02:48, William Zhang <william.zhang@broadcom.com> wr=
ote:
>
> Hi  Ho Jie,
> On Mon, Nov 23, 2026 at 6:22=E2=80=AFAM Ho Jie Feng <hjf3108@gmail.com> w=
rote:
> >
> > BCMBCA Cortex-A7 SoCs can have more than two cores, such as the
> > quad-core BCM6755. Extend the CFE SMP support to all secondary CPUs.
> >
> > CFE parks every secondary CPU on the same mailbox, and the wakeup SGI
> > wakes all offline CPUs at once. Hold them in a pen and release them one
> > at a time.
> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  arch/arm/mach-bcm/Makefile         |  1 +
> >  arch/arm/mach-bcm/bcmbca_headsmp.S | 26 +++++++++++++++++
> >  arch/arm/mach-bcm/bcmbca_smp.h     |  9 ++++++
> >  arch/arm/mach-bcm/board_bcmbca.c   | 46 ++++++++++++++++++++++++------
> >  4 files changed, 73 insertions(+), 9 deletions(-)
> >  create mode 100644 arch/arm/mach-bcm/bcmbca_headsmp.S
> >  create mode 100644 arch/arm/mach-bcm/bcmbca_smp.h
> >
> > diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
> > index fcc4e0174a..c3cd2959bc 100644
> > --- a/arch/arm/mach-bcm/Makefile
> > +++ b/arch/arm/mach-bcm/Makefile
> > @@ -60,4 +60,5 @@ endif
> >  ifeq ($(CONFIG_ARCH_BCMBCA),y)
> >  obj-y                          +=3D board_bcmbca.o
> >  obj-$(CONFIG_SMP)              +=3D bcm63xx_smp.o bcm63xx_pmb.o
> > +obj-$(CONFIG_SMP)              +=3D bcmbca_headsmp.o
> >  endif
> > diff --git a/arch/arm/mach-bcm/bcmbca_headsmp.S b/arch/arm/mach-bcm/bcm=
bca_headsmp.S
> > new file mode 100644
> > index 0000000000..3d0d0d97be
> > --- /dev/null
> > +++ b/arch/arm/mach-bcm/bcmbca_headsmp.S
> > @@ -0,0 +1,26 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * All CPUs will wake up on an SGI. Wait in the holding pen until
> > + * bcmbca_cpu_release matches the MPIDR.
> > + *
> > + * Based on arch/arm/mach-versatile/headsmp.S
> > + */
> > +#include <linux/linkage.h>
> > +#include <asm/assembler.h>
> > +
> > +       .arm
> > +ENTRY(bcmbca_secondary_startup)
> > + ARM_BE8(setend        be)
> > + THUMB(        badr    r9, 1f          )
> > + THUMB(        bx      r9              )
> > + THUMB(        .thumb                  )
> > + THUMB(1:                      )
> > +       mrc     p15, 0, r0, c0, c0, 5
> > +       bic     r0, #0xff000000
> > +       adr_l   r6, bcmbca_cpu_release
> > +pen:   ldr     r7, [r6]
> > +       cmp     r7, r0
> > +       bne     pen
> > +
> It is better to invalidate the L1 cache for the secondary cpus
> regardless of whether the bl does that or not.

If I'm not wrong, this will eventually end up in __v7_ca7mp_setup
which calls do_invalidate_l1?
https://elixir.bootlin.com/linux/v7.4-rc1/source/arch/arm/mm/proc-v7.S#L301

Best regards,
Jie Feng

