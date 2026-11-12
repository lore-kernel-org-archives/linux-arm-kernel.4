Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA83C606A8BA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q7eksHZD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JETWMfWj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FD/V4+e8O0iqTKVI3Ylc4RORwqMbtboEEa/TKhMeE7M=; b=q7eksHZDwt0tMF
	3+ArH/sgzy2o1ZDM5iMt1w2zjBswwFQ7HPiF1oZTW3pSbpQ82aA/RGcurmMKQo90/miTi6mgz8Wnm
	h13V9v5cI6ZZnR5Apu2caYeDZsIfxD1y/ghWWSPBXp5Lh/YQedQXmLvQFt1FobgcORAHWaucSf4Qj
	Hf6SZEcJPdXxc8B5nKgaSpCLFH79iUNMRfZvVcawJdjocW7E13CnEsBJNp9JhqY6W6FZukXWZEn94
	2ugErz5ZmEs2R0AfvbVln+5PsEZf0fjwmGxqsXh2MWjYZxSuecuzFvxGH7V9lZSEUYMSTAejUp9db
	GY5jw3uVDrhqgx48iy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwU-00000009gkY-2jCW;
	Thu, 12 Nov 2026 11:26:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwH-00000009gfJ-3oSA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:25:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D21247A1E;
	Thu, 12 Nov 2026 11:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662A91F00A05;
	Thu, 12 Nov 2026 11:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482757;
	bh=FD/V4+e8O0iqTKVI3Ylc4RORwqMbtboEEa/TKhMeE7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JETWMfWjkKeINJWiPkhAD/QsItp30dH2rFFfUxvvsc0JyhM1taj1AERUtJ/N3Cjs3
	 AwYVFzZ/m6zQ7KYBU+YiTIl9hTHpftthT74h5Nr4oeuYEHYYSiIf3AXVs+RKZKKHrV
	 mIOmMwkG2K3nP1x7rGrbfTQKpZOVBqfxi9f/LcxqS5J0K6eBwmu7A8mogUZQyc4cgy
	 znPGEVxp9AgLlfDVNExZSLItcLclY123hZKVh9JoHVE3H6OQiccRm+Ibc4Tk7V2+rw
	 AM4h3/ZJfG+Yk80QegP3t50LRsE3vQEfEM9YcerbVpZJF++E9cU7QgrbnSemDfJFmG
	 qhJVBLKkuZ+CQ==
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
Subject: [PATCH v2 3/6] ARM: drop CONFIG_HIGHPTE support
Date: Thu, 12 Nov 2026 12:25:25 +0100
Message-ID: <20261112112528.1116405-4-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112112528.1116405-1-arnd@kernel.org>
References: <20261112112528.1116405-1-arnd@kernel.org>
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arnd Bergmann <arnd@arndb.de>

CONFIG_HIGHPTE was added in linux-2.6.32, a few years before 64-bit
support. At the time it made sense, as the CONFIG_ARM_LPAE option allowed
systems with 16GB of memory that made lowmem a particularly scarce
resource, and the HIGHPTE implementation gave feature parity with 32-bit
x86 and frv machines.

Since Arm is the last architecture remaining that uses this, and almost
no 32-bit machines support more than 4GB of RAM, the cost of continuing
to maintain HIGHPTE seems unjustified, so remove it here to allow
simplifying the generic page table handling.

Link: https://lore.kernel.org/lkml/20241204103042.1904639-8-arnd@kernel.org/T/#u
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I sent a patch to drop HIGHPTE support on x86 today, see
https://lore.kernel.org/lkml/20241210144945.2325330-9-arnd@kernel.org/T/#u

If that one gets merged, we can merge this one instead of the one
that makes HIGHPTE depend on !PREEMPT_RT, but if we decide against
the x86 change, then we probably don't want this one either.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig               | 11 -----------
 arch/arm/include/asm/pgalloc.h |  8 +-------
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fd01ccab9c12..fc66d52d847e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1225,17 +1225,6 @@ config HIGHMEM
 
 	  If unsure, say n.
 
-config HIGHPTE
-	bool "Allocate 2nd-level pagetables from highmem" if EXPERT
-	depends on HIGHMEM && !PREEMPT_RT
-	default y
-	help
-	  The VM uses one page of physical memory for each page table.
-	  For systems with a lot of processes, this can use a lot of
-	  precious low memory, eventually leading to low memory being
-	  consumed by page tables.  Setting this option will allow
-	  user-space 2nd level page tables to reside in high memory.
-
 config ARM_PAN
 	bool "Enable privileged no-access"
 	depends on MMU
diff --git a/arch/arm/include/asm/pgalloc.h b/arch/arm/include/asm/pgalloc.h
index a17f01235c29..ef6cb3e6d179 100644
--- a/arch/arm/include/asm/pgalloc.h
+++ b/arch/arm/include/asm/pgalloc.h
@@ -85,18 +85,12 @@ pte_alloc_one_kernel(struct mm_struct *mm)
 	return pte;
 }
 
-#ifdef CONFIG_HIGHPTE
-#define PGTABLE_HIGHMEM __GFP_HIGHMEM
-#else
-#define PGTABLE_HIGHMEM 0
-#endif
-
 static inline pgtable_t
 pte_alloc_one(struct mm_struct *mm)
 {
 	struct page *pte;
 
-	pte = __pte_alloc_one(mm, GFP_PGTABLE_USER | PGTABLE_HIGHMEM);
+	pte = __pte_alloc_one(mm, GFP_PGTABLE_USER);
 	if (!pte)
 		return NULL;
 	if (!PageHighMem(pte))
-- 
2.53.0


