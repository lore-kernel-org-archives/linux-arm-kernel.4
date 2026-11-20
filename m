Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TfHq5P1q;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BDi/9kXJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=spoiYnWR0WKKRs7Mhq5Q09v/YFoqQN68ueFyWXGucg0=; b=TfHq5P1qChAnXK
	yxiq66xGEDb4QDgbw+qXzZCjXi/EjymhLf3N3uuCKLFrXoh5WVn40IP4TX/00FQ4LKiHMOmEA2av6
	2kcQQ60XaJ1jo606cqZF/cR3ESLV+NcFkQGlI9uj6bthhxXg4bzE6tUtgTmPDCiohmvcHg/qAqgue
	w+hcExDRSRAcTByQgwS73hZzTpVUChFrxw8JKE0f/4MrbGi0A54VrBBEmCIxCrOwEO8qaXjXtYrW1
	VtCe4/+kvG6Ylsos31eXaYg3+p1p5u7Pma8N78ZLo9WNH48Ojqu2fwVPH3AYHJuDH3CmtZv7GUNSh
	LUy2hN9MdQABolsIW0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNYL-0000000EvgA-0H04;
	Fri, 20 Nov 2026 12:17:17 +0000
Received: from out-76.mta1.migadu.com ([95.215.58.76] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNY0-0000000EvVj-0ihg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:16:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Q/N+GDt8QiK0EADOOx91mUK2qbf8ppdyYXeJryKLBCU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795177014; v=1; x=1795781814;
 b=BDi/9kXJf4YgRBbAHxD3RyugCbjKW0PCal1+Gv5IYm/c2FgLLV7VbqY+f1zHlScILQiVZSw0
 +03BU6gv7xmavzbyWPCdEZAWETU5MqSdYzR9jIvXi+rqN4ZAYCafaPdGc7Qhrshm5ue6emni7g4
 DpdU8ocr/xq9tuP+clLQGljk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 18135977f985d146;
	Fri, 20 Nov 2026 12:16:54 +0000
X-Mizu-Trace-ID: 18135977f985d146
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] arm64: mm: Don't defer the barriers when installing a fixmap entry
Date: Fri, 20 Nov 2026 12:16:38 +0000
Message-ID: <20261120121638.194154-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120121638.194154-1-fuad.tabba@linux.dev>
References: <20261120121638.194154-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_041656_373087_D5A4F4BC 
X-CRM114-Status: GOOD (  10.06  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In lazy MMU mode, __set_pte(), which __set_fixmap() uses, only queues
its DSB and ISB, but a caller can dereference the slot as soon as
__set_fixmap() returns. On a CPU with BBML3, runtime changes to the
linear map are made in lazy MMU mode. With 4K pages and 39-bit VAs, for
example, such a change can update a top-level entry, which
set_swapper_pgd() writes through FIX_PGD. That store can fault, and the
kernel then warns about a spurious translation fault. When kgdb stops a
CPU in lazy MMU mode, its breakpoint writes through FIX_TEXT_POKE0 can
fault the same way, and fail.

Emit the barriers directly in __set_fixmap().

Fixes: 5fdd05efa1cd3 ("arm64/mm: Batch barriers when updating kernel mappings")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/mm/fixmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index f66a0016dd02d..951004ad700c3 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -127,7 +127,9 @@ void __set_fixmap(enum fixed_addresses idx,
 	ptep = fixmap_pte(addr);
 
 	if (pgprot_val(flags)) {
-		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
+		/* The slot must be usable on return, even in lazy MMU mode. */
+		__set_pte_nosync(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
+		emit_pte_barriers();
 	} else {
 		__pte_clear(&init_mm, addr, ptep);
 		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);
-- 
2.47.3


