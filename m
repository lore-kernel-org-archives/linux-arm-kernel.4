Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE574606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GW0sWbt6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OKjmQFPo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cjfeIB7Jh9Ac/AfayNnL1Yf0x7S27z/ryKSokFRvmis=; b=GW0sWbt6WNJRr3
	2Akz+HN2ul3L3GLpd1vKqbQnE2NPpvLy4N4gD4Hw4rad5E8RSNfWaUscV6HbCO0Dou2SJxAByLrSP
	MPh7XX+KRoIWHE7yWWGDBaplwvFDKYDbAhvEue++ig21Tz+RYGZudmUT7k0tR/TTeY+YDAJLsKe80
	MC8/WRYcbmSzv2lA5GNzCyfpRL0mj/J8a9JU7V8eA+YSyl+o/nX42bBrLfsybYqkCV5SesgYUIXqc
	/NoOZ5B6v+BQMvGO8yP9cxrz+8c+Q7sju/ZCY2nDXvKNcxC1ri0ejaFaaFc+TLrqWDEnfUYaBngta
	+NfkipHTc0VG15xk/M4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWv-0000000DLwf-1YEl;
	Thu, 26 Nov 2026 13:28:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWn-0000000DLkq-2iFa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:28:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 134B54637A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CA41F01566
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699724;
	bh=cjfeIB7Jh9Ac/AfayNnL1Yf0x7S27z/ryKSokFRvmis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OKjmQFPo1M75NXkW1bHMDWybQdIuae5BfdUB+xGnCd8WnZUl/pDfDcBO7rB3WwRBS
	 /Ob1mY//DhcXEHQ/uv6PMdV+zDPkCmw026DdqzRidvVfO57zNsZ5lx19VY8mEJEfRI
	 NbQBvzhp+gPFFwQBIh98wVGgz0sVb5J2qhuKj3w2sLjZLC+2Jz3xd/iXOMiHZuSFhu
	 VXk/8CCos/vN9KGdGMsSfxA8Ueh0PcXCmFe3AY2A44UJ4PQrSBxPd/ZTi4mfET6X/v
	 ExJt6R9GcDL0CkqyBHW7iQlwm4AKk2/6tvRSIaioKBzEDyuHPX6sX/aLjG/Prito3n
	 cJnEjZgWJdwjA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so56391361fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:28:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGjqZeAFO858ssU95nLm+TgpO74RgTYefhepNkd9tlV36MioO4A+KxjEogmV34+68uSafgjf/kfibqxqq3CJ55M@lists.infradead.org
X-Gm-Message-State: APuU4Z8yQtAgb0a6SQ4x80qjbf+JFdKK/9kUexjd8PVWmnTAcwHSgKpO
	fb3HJCn25AaE+PUb48MaNa9a40lDRCLMEdONSmlfMB9ugSss/GuL2kTzLeezw5ajvyTYwGjAx3R
	9ZDsHGnLl4n4mrHJszzAB9Ak+svRWLvg=
X-Received: by 2002:a05:6512:124d:b0:5c1:56f2:fda4 with SMTP id
 2adb3069b0e04-5c1bc89530fmr5518571e87.49.1795699723141; Thu, 26 Nov 2026
 05:28:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116124832.662455-1-arnd@kernel.org> <20261116124832.662455-8-arnd@kernel.org>
In-Reply-To: <20261116124832.662455-8-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:28:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLmT3dgWNhwXnxBbMWT4FPtM85j7pGqphVhofVDn6bgq4w@mail.gmail.com>
X-Gm-Features: Aa3M54qt87pVcinKxHwHL_cdEyu5uWkoYM1H8TRwnc8234Hd9kxa6PUDkX4jAZc
Message-ID: <CAD++jLmT3dgWNhwXnxBbMWT4FPtM85j7pGqphVhofVDn6bgq4w@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] ARM: defconfig: turn off highmem in favor of CONFIG_VMSPLIT_2G_OPT
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Malin Jonsson <malin.jonsson@est.tech>, 
	Matthew Wilcox <willy@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Michal Simek <monstr@monstr.eu>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Nishanth Menon <nm@ti.com>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 1:49=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The multi_v7_defconfig and omap2plus_defconfig attempt to support a
> broad range of hardware. This is at odds with the setting for highmem
> being slowly phased out on the one hand but still enabled by means of
> CONFIG_ARCH_OMAP2PLUS_TYPICAL, leading to a default CONFIG_VMSPLIT_2G_OPT
> split.
>
> None of the upstream OMAP2+ DTS files actually list more than 2GiB
> of RAM, so it seems fine to just turn off highmem by default and use
> CONFIG_VMSPLIT_2G_OPT from the defconfig to still support the same
> hardware but not require highmem.
>
> This also changes multi_v7_defconfig, which currently supports all sorts
> of ARMv7 systems except those that require LPAE.
>
> The best comprimise I can think of again is to use VMSPLIT_2G_OPT in
> place of highmem. Compared to highmem configurations, this should be
> an improvement on most machines with 2GiB of installed memory for the
> lower overhead and complexity, but it does degrade machines that rely
> on highmem to access all memory, as well as reduce the available user
> address space (1.75GiB instead of the traditional 3GiB).
>
> For aspeed_g5_defconfig, the decision is trivial, as there are no
> 4GiB configurations we need to support, but g6 is known to use
> up to 2GiB.
>
> If you run into problems on production machines with the new default,
> with the absence of highmem, or the smaller user area, please complain.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

