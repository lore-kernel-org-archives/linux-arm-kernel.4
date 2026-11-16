Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCC8606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gzlMk5r3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J1iRwSzP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T+kkEjnaw2ySVd4lLiujiWW53ZRBsmmAWW3cy3wlJjw=; b=gzlMk5r3O/9uVx
	54Jf3ARFeAmj2HR4ASSWWdlhPrFA/wahrMrKquobbEx+sUJBISRel8jNIhm9cc3BCpYGwIoU8FtUQ
	DAIvBDZ0kGhfOf2Vww0MjDOymHqQD7V/ek66RgnstENYOFhjs+HD0TwBph8LFFKPncpG5EvvbypVL
	BMJc6bOA1CR9yAhNHEAN7TGpX2QPEfEJV38P2hGont9L3MCFlF6XyTlRE1YOYnX9lsvZImdQFvxuB
	4K5Gruq+KhVbAq6UcbLDeXXQt1HxHaTPbdFgTTxwE27k9BpXplEvyx3hZrQfJBwdf3pWA7YaKmsvi
	LWWu7OO4daSeoHAt7d4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw8z-00000002TAV-3Ey2;
	Mon, 16 Nov 2026 12:49:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw8w-00000002T84-0F9r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:49:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9E7F43421;
	Mon, 16 Nov 2026 12:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FCF1F000C4;
	Mon, 16 Nov 2026 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833345;
	bh=T+kkEjnaw2ySVd4lLiujiWW53ZRBsmmAWW3cy3wlJjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J1iRwSzPkXkJExltWHVg0O8oGOL+tawW+ZmYEGgM1jmGAKgXx8sy7HnmkDQVv80Ss
	 yg4kn+EGjPt1JGKZYyWmr96BKjuswmbOXfgaSRJVySsDYEtOeJ/ovVXA3/PGYaEEQg
	 e3V7fokGmh+Jawesd3SW+NFvr+/7WMp05FEXbQ8wK0id5O9GLzTl/BNPOe8HMP9wyx
	 SXMkzQFD+Nl7UMGApCdcv5Ze+xW2cYq4ISMrZw9YTpwVIzOyl4tI/WGNsQAg4Yn1Op
	 xm4CxP/9WVSS9d5AIaFwkOz7gzndFMorMFu1XaBI6AixyyII7UmWDW9Dxmurqq67j6
	 wYW15Z/uOQhDA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Malin Jonsson <malin.jonsson@est.tech>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH v3 04/10] powerpc: kvm: allow flexible PAGE_OFFSET
Date: Mon, 16 Nov 2026 13:48:26 +0100
Message-ID: <20261116124832.662455-5-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116124832.662455-1-arnd@kernel.org>
References: <20261116124832.662455-1-arnd@kernel.org>
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

As described by the Sashiko bot, the KVM code on powerpc has multiple
hardcoded PAGE_OFFSET values. In order to change the default, make these
compute the correct register values from configuration symbols.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/kvm/book3s_32_sr.S     | 4 ++--
 arch/powerpc/kvm/booke_interrupts.S | 4 ++--
 arch/powerpc/kvm/e500_mmu_host.c    | 3 ++-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_32_sr.S b/arch/powerpc/kvm/book3s_32_sr.S
index 6cfcd20d4668..0d8a7857f2bd 100644
--- a/arch/powerpc/kvm/book3s_32_sr.S
+++ b/arch/powerpc/kvm/book3s_32_sr.S
@@ -113,8 +113,8 @@
 
         li      r0, 4
         mtctr   r0
-	LOAD_REG_IMMEDIATE(r3, 0x20000000 | (0x111 * 0xc))
-        lis     r4, 0xc000
+	LOAD_REG_IMMEDIATE(r3, 0x20000000 | (0x111 * (PAGE_OFFSET >> 28)))
+        lis     r4, (PAGE_OFFSET >> 16)
 3:      mtsrin  r3, r4
         addi    r3, r3, 0x111     /* increment VSID */
         addis   r4, r4, 0x1000    /* address of next segment */
diff --git a/arch/powerpc/kvm/booke_interrupts.S b/arch/powerpc/kvm/booke_interrupts.S
index 205545d820a1..ede394f3f63f 100644
--- a/arch/powerpc/kvm/booke_interrupts.S
+++ b/arch/powerpc/kvm/booke_interrupts.S
@@ -230,8 +230,8 @@ _GLOBAL(kvmppc_resume_host)
 #endif
 
 	/* Restore host IVPR before re-enabling interrupts. We cheat and know
-	 * that Linux IVPR is always 0xc0000000. */
-	lis	r3, 0xc000
+	 * that Linux IVPR is always PAGE_OFFSET. */
+	lis	r3, PAGE_OFFSET >> 16
 	mtspr	SPRN_IVPR, r3
 
 	/* Switch to kernel stack and jump to handler. */
diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index fa6128119874..9edad9bed589 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -115,7 +115,8 @@ static u32 get_host_mas0(unsigned long eaddr)
 	mtspr(SPRN_MAS6, 0);
 	mas4 = mfspr(SPRN_MAS4);
 	mtspr(SPRN_MAS4, mas4 & ~MAS4_TLBSEL_MASK);
-	asm volatile("tlbsx 0, %0" : : "b" (eaddr & ~CONFIG_PAGE_OFFSET));
+	asm volatile("tlbsx 0, %0" :
+		: "b" (eaddr & (rounddown_pow_of_two(PAGE_OFFSET)-1)));
 	mas0 = mfspr(SPRN_MAS0);
 	mtspr(SPRN_MAS4, mas4);
 	local_irq_restore(flags);
-- 
2.53.0


