Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ei3FM4jR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mykMNeh5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wTN3UxTT/XXw7NH/F07ZSE1+SznsV7bVJZdXlw3Sm0E=; b=ei3FM4jRVeg5lbptuTo1pNz71N
	d+dVFq6rhlt6I4y5SxhFCLSiiNp9V3EsAASzsRJf/GQRHD/WlbQlGACTGdh4LKgo7OFebHaf0FmuR
	QJGlLjeaqQLsDUf68T/G+KhPHWs6vLrO+uar/UzBXpwh0u01KWJ9l8mVtyJTrzZ70nuTEcCNch6hC
	6oDmBUgTAnJIJjcXyUA7mqj2MQDgEoNf9V2Ld2yy9Hy7A3jk30f9pLk+lpk+xH4jR1YMCNuKkrpGi
	hbUKyOucUADXWtoSErziZ/KmgQqeB7JaLlA59DX4Z7Cf8tSSglBBojvprqAZVLc54SxCPOxrxc3s4
	G+40JboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTTe-00000009npo-14sA;
	Thu, 12 Nov 2026 12:00:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTTc-00000009npg-39ld
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 12:00:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E06B163950;
	Thu, 12 Nov 2026 12:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869391F00A05;
	Thu, 12 Nov 2026 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484823;
	bh=wTN3UxTT/XXw7NH/F07ZSE1+SznsV7bVJZdXlw3Sm0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mykMNeh5BtXxUerEKT1YuKhyGYJ7QWD8IG5KpF4NuP4taMISSoglro4vnkkgm5jw7
	 WQS/4vwRcKImTEfxhMYZ5wbg4cf0zsqSfNSCuEwHpTxLLpdEiTkzuh28KNZeLAVJNg
	 ZfCkbQmePV1CQjWwx2EMjuLDIhpJighraQGEfBeHC2UHTK/MwHz7f2oBCj4SrVNuE8
	 h5IIE+hXfIdS625oF8CuXci5blOoZ0531mmkrv2ibJ2+zxzA7PXsQSYWh5mHmJWrB0
	 v/bWt32FVQ52/8TNJggbPdO6bVuM9pAUdH6G57AlDfNOf/PKeeT3jQZcm5rv//GblC
	 jWyGILzZ6HoIw==
Date: Thu, 12 Nov 2026 14:00:11 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Malin Jonsson <malin.jonsson@est.tech>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michal Simek <monstr@monstr.eu>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Nishanth Menon <nm@ti.com>,
	Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 5/6] arch/*: increase lowmem size to avoid highmem use
Message-ID: <avWqSw2YrUmfAX62@kernel.org>
References: <20261112112528.1116405-1-arnd@kernel.org>
 <20261112112528.1116405-6-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112112528.1116405-6-arnd@kernel.org>
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

On Thu, Nov 12, 2026 at 12:25:27PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most of the common 32-bit architectures (x86, arm, powerpc) all use the
> default virtual memory layout that was already in place for i386 systems
> in the 1990s, using exactly 3GiB of user TASK_SIZE, with the upper 1GiB
> of addresses split between (at most 896MiB) lowmem and vmalloc.

...

> Based on the above observations and the discussion at the kernel summit,
> change the defaults to the most appropriate values: use 1GiB of lowmem on
> non-highmem configurations, and either 2GiB or 1.75GiB of lowmem on highmem
> builds, depending on what is available on the architecture.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/arm/Kconfig                            |  5 ++++-
>  arch/arm/configs/aspeed_g5_defconfig        |  1 -
>  arch/arm/configs/u8500_defconfig            |  1 -
>  arch/arm/configs/vt8500_v6_v7_defconfig     |  2 --
>  arch/arm/mach-omap2/Kconfig                 |  1 -
>  arch/microblaze/Kconfig                     |  9 ++++++---
>  arch/microblaze/configs/mmu_defconfig       |  1 -
>  arch/powerpc/Kconfig                        | 14 +++++++++-----
>  arch/powerpc/configs/44x/akebono_defconfig  |  1 -
>  arch/powerpc/configs/85xx/ksi8560_defconfig |  1 -
>  arch/powerpc/configs/85xx/stx_gp3_defconfig |  1 -
>  arch/x86/Kconfig                            |  4 +++-
>  12 files changed, 22 insertions(+), 19 deletions(-)

-- 
Sincerely yours,
Mike.

