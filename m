Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B60606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0h8pJWrs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EPHU4bh1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0SuygBFJgQJDPEHL8vg5eLv9glUvVL4TbpwchKTOKc8=; b=0h8pJWrseMKHkS
	uApsQkDwZLUbFrPI/m3vIx/D9IiBWDAYVMY3LanO8lxa/0RL1+Xxtc91WNBf8Q2K2AR/0Z/L+Zt98
	XPIjWuwAQHI/N0ndyOtMOd8BaTpZ8KR99KHvWQLdDEBKnNP8bLux1+YJzeyWDBL7dkhsH0kTiVbg4
	gbAHhxm61FD/73vBaypPYF2wphA4c5m6H9z+sqhwWlpTrxEAGBnWK8zdw/+Rc0HlOMGFf8CbPo2+9
	8xNyxvjn45iYRrpRKdsNMfv6aPU/RNaWR9pnRySJVv6jhPwrMdV1x29bkQZ/IZFLtJkiM65XON02N
	g8Nwis43M5hObU3W9xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZW2-0000000DLRG-2v8L;
	Thu, 26 Nov 2026 13:27:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZW1-0000000DLQk-40IX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:27:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 175F361EA5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3181F000D1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699676;
	bh=0SuygBFJgQJDPEHL8vg5eLv9glUvVL4TbpwchKTOKc8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EPHU4bh1rQUynF67I/BLiAYnpMItWNnTQ9AParYyhIyJ+y6H3njJ4HyIE0s6Jx202
	 xCNzY4EbdFEUvhIGV7u89sr9xvmTk/hzD3usLMoUVQo7zRS1mVOEOGXKaU7srd0lqN
	 QJ8zgMkZSbzwDG6k/Q8gKHxK2xOwoNZh0rfmPcgTWzKzVzQoVxEJRXus9AvWUL1U2G
	 poRlMVnD4ZVArgDu1nm8eFgis+FkVYb/7yrTihelucyhtlDiutnGbPYYQd1IeXPRF1
	 uMR3MT3fEDrUV6O3qWBar39ZOF0tAC8l88Y7GgJIURjBmPo17gy3FHsqx2yCKI3NPh
	 QpwxgY4N6hLRw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be47aa555cso438593e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:27:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGzZVGS1UJAPKArcMxovyealb+UTIvnQRN7CqDwdCANVA7VVjgGPVqxyjw0w6fdECeXaCaflzh/iG9UhqLSscJG@lists.infradead.org
X-Gm-Message-State: APuU4Z8bB2onq5pt0MnwgWnfUYfzSxHDDmsTNj2P6rFOiweaJOQQhVIB
	dV25rykXR2U4vdJsUO6oshsljisL+n8T6lN7lUg5nZg73w/vRGkBqgtz6I0CpTT122kamOrJ6+6
	vJIuUCIuTmm9KvnrVZHzv7yjZLlNlEVo=
X-Received: by 2002:a05:6512:36d9:b0:5c1:5976:1d30 with SMTP id
 2adb3069b0e04-5c1bc8206cdmr4300123e87.57.1795699675392; Thu, 26 Nov 2026
 05:27:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116124832.662455-1-arnd@kernel.org> <20261116124832.662455-6-arnd@kernel.org>
In-Reply-To: <20261116124832.662455-6-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:27:42 +0100
X-Gmail-Original-Message-ID: <CAD++jL=ZyHZcJRUTpVghs3xYH0OGOKauKVWTF8tiPpHPjuad+g@mail.gmail.com>
X-Gm-Features: Aa3M54pIH7xhTLEiVGxFItiuCxGTTC1f9B6RJQ9R1KEb9x9xI611Qqdum1NmRD8
Message-ID: <CAD++jL=ZyHZcJRUTpVghs3xYH0OGOKauKVWTF8tiPpHPjuad+g@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] ARM: add CONFIG_VMSPLIT_2G_OPT option
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
> Unlike x86 and powerpc, there is currently no option to use exactly 2GiB
> of lowmem on Arm. Since 2GiB is still a relatively common configuration
> on embedded systems, it makes sense to allow this to be used in
> non-highmem builds.
>
> Add the Kconfig option and make this the default for non-LPAE builds
> with highmem enabled instead of CONFIG_VMSPLIT_2G.  LPAE still requires
> the vmsplit to be on a gigabyte boundary, so this is only available for
> classic pagetables at the moment, same as CONFIG_VMSPLIT_3G_OPT.
> Keep ARCH_MMAP_RND_BITS_MAX at 15 for this.
>
> Tested in qemu -M virt, both with and without HIGHMEM enabled.
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

