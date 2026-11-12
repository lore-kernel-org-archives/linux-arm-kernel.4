Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A29606A89C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ta1PJSHa;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcej4SeG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nyAii04iv1TnyOOBwPCAP2EPWogK/SwQRxxQEJCCSUM=; b=Ta1PJSHaqA4gV2UBUWpq2NQuth
	8r7pmh+gxXJLHz5AFGw40HsbO/L2dNoxJdlLxX1IavFIrU0rPvstAynprYJWS2/Id9IB69jx13tsG
	6akQI7IosQJM0yY21R2p1ukUpbm2Ku3Tt1oYMF+sRbzwQy+bPC0R2PrKi95+08vWgNrfbSxw0lRC8
	yj86V7qGzyooeO7Na+mjQ11emGQ5v/f3rWMv/kWT0pvIJwLtC/NEg+36K57nU4Nhf4NiW7MRVO1hm
	i4KWFiZHcWTWXsPaOfRY9Bo6+bgE7kMJdg9LeypIr7D29Gj/bwgVVPLsFvJOQhZ/fd6FPHv3gbo2p
	fywfi5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSw7-00000009gYc-1roW;
	Thu, 12 Nov 2026 11:25:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSw5-00000009gYM-31Oj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:25:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 16973639FD;
	Thu, 12 Nov 2026 11:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 300D51F00A05;
	Thu, 12 Nov 2026 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482744;
	bh=nyAii04iv1TnyOOBwPCAP2EPWogK/SwQRxxQEJCCSUM=;
	h=From:To:Cc:Subject:Date;
	b=kcej4SeGNio953kxVJadAgWpMDZMpkWZMd+hDFdcbwBD6YqxOi5/s7jcM3dn5qkSo
	 JFjFFCvvWKdz0/D/1LD7AfJxJtAvjrb04S93zIylNgx499dpN+NQzloWAY3IS00PNX
	 ToYfTeKT9AfjBIh/2/JCQ81cMF4nF8JdQ1YgKhO3z3Kktfl6XBnC2mXQC5Rf4jyLim
	 a1Ar7lPvE18Ei+2zQ8KLCKzraZ0pFf7T7mxc8wFRF7N0eo1VNdCzDQiEsxnUr4MWL9
	 O/jp1yId0/ROUbt1HXRPmXoqR1BggR72fUy+EYYXcSYsvO7uJLDMn8zIE51FGdcUnE
	 GisdYH+T+tgPQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
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
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH v2 0/6] mm: highmem cleanups
Date: Thu, 12 Nov 2026 12:25:22 +0100
Message-ID: <20261112112528.1116405-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arnd Bergmann <arnd@arndb.de>

This is an updated series from what I posted last year [1], sorry for
taking way longer with this than I had planned. Linus brought it up today,
which triggered me to rebase the earlier patches and post it again.

At LPC 2025 [3], we got rough consensus on the plan to keep the
funcationality present for the time being but instead reduce the scope
of highmem in the kernel as much as we can without hurting users.

The short summary is a three stage process:

 1. Nudge users towards using a larger lowmem zone with the
    CONFIG_VMSPLIT_* options if at all possible.

 2. Drop most __GFP_HIGHMEM allocations and corresponding kmap()
    calls from the kernel, leaving only the subset that is likely
    to contain the majority of the actual allocations.
    Specifically we will keep anonymous and regular file backed
    user mappings, zsmalloc, and huge pages.

 3. In a few years, also drop the page cache allocations and leave
    perhaps only zsmalloc using a much simpler interface.  I suggested
    five years as the time until we do this, but the timing depends a
    lot on how the first two stages work out in practice, and how long
    the remaining highmem users plan to keep updating their kernels.

This series implements stage 1, mostly using Kconfig changes to the
default settings but leaving the traditional behavior as a CONFIG_EXPERT
choice in Kconfig. With the new defaults, most installations that use
highmem today with 1 GiB or 2 GiB of system RAM will see all of their
RAM in the lowmem zone after upgrading their kernels. My estimate is
that instead of 80% to 90% of maintained embedded 32-bit systems, this
should cover over 98%.

As I don't actually have hardware in the category that still needs
highmem, I tested this using a qemu-system for Armv7 and PPC6xx running a
Debian userland with all combinations of VMSPLIT and HIGHMEM options. I
ran some kernel builds on the Arm guest to ensure that the new options
don't cause functional or performance regressions for regular workloads
that don't exceed the virtual address space. I also ran some tests
with Firefox and was positively surprised to see that this still works
on the VMSPLIT_2G_OPT configuration without highmem, though it gets
close to both the address space and lowmem size limits.

As I had to change the powerpc version a bit for the rebase, this
current version is entirely untested, but I hope that Richard and
Christophe are able to help out there, as they both understand this
code better than I do.

The change to use VMSPLIT_3G_OPT by default on Armv5 means that I could
include a patch to no longer support highmem at all on VIVT caches,
as suggested by Jason Gunthorpe. I also included the patch to drop
HIGHPTE support now, as suggested by David Hildenbrand.

The patches from this series are available in [4] for testing.

     Arnd

[1] https://lore.kernel.org/all/20251219161559.556737-1-arnd@kernel.org/
[2] https://lore.kernel.org/all/CAHk-=wjPY=kfgnmtx4COEQjD5UzKx9m2-=KLGAZP4d=RKEH+pg@mail.gmail.com/
[3] https://lwn.net/Articles/1051010/
[4] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=highmem-7.4

Arnd Bergmann (5):
  ARM: remove support for highmem on VIVT
  mm: remove ARCH_NEEDS_KMAP_HIGH_GET
  ARM: drop CONFIG_HIGHPTE support
  mm: drop HIGHPTE support altogether
  arch/*: increase lowmem size to avoid highmem use

 arch/arm/Kconfig                            | 17 ++--
 arch/arm/configs/aspeed_g5_defconfig        |  1 -
 arch/arm/configs/gemini_defconfig           |  1 -
 arch/arm/configs/multi_v5_defconfig         |  1 -
 arch/arm/configs/mvebu_v5_defconfig         |  1 -
 arch/arm/configs/u8500_defconfig            |  1 -
 arch/arm/configs/vt8500_v6_v7_defconfig     |  2 -
 arch/arm/include/asm/highmem.h              | 56 +-------------
 arch/arm/include/asm/pgalloc.h              |  8 +-
 arch/arm/mach-omap2/Kconfig                 |  1 -
 arch/arm/mm/cache-feroceon-l2.c             | 31 +-------
 arch/arm/mm/cache-xsc3l2.c                  | 47 ++---------
 arch/arm/mm/dma-mapping.c                   | 12 +--
 arch/arm/mm/flush.c                         | 19 +----
 arch/microblaze/Kconfig                     |  9 ++-
 arch/microblaze/configs/mmu_defconfig       |  1 -
 arch/powerpc/Kconfig                        | 14 ++--
 arch/powerpc/configs/44x/akebono_defconfig  |  1 -
 arch/powerpc/configs/85xx/ksi8560_defconfig |  1 -
 arch/powerpc/configs/85xx/stx_gp3_defconfig |  1 -
 arch/x86/Kconfig                            |  4 +-
 include/linux/hugetlb.h                     |  5 +-
 include/linux/mm.h                          |  1 -
 include/linux/pgtable.h                     |  9 ---
 mm/highmem.c                                | 86 +++------------------
 25 files changed, 50 insertions(+), 280 deletions(-)

-- 
2.53.0

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Hildenbrand (Arm) <david@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Malin Jonsson <malin.jonsson@est.tech>
Cc: Richard Weinberger <richard@nod.at>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-fsdevel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

