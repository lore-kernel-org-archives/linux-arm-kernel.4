Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2639A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zmTm4vO+;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=rutvWedD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cSVyW0UVgqGJUNJlaP4TsMEvhElwJxyJXx8yTc90AO4=; b=zmTm4vO+BPTQXsg8TE7krx0BCa
	MvDMQ2mgbsQ+ptq1gxXrjteSOGH/Sdh7jeJUXVWY7j8Sxcy7x9hqOKbb6Z1vwWAH6n0D/TNiIjhZR
	WJh6+VHAqZdSgbcM6xDVXvyV4W+ku/AVvEuXWWbcYvQIfEV4uuTsO4A8OsdY0pNegDRemszQoMkzr
	eCqcUEJkBKiFmMUbwRi+JhJoQPF6ihbVHYwiccPfo/+wxJevYThEE+gDn5TXdrgCg1oJZ7npb7f+U
	HzFRHAgyihIld2TX8xgcr+YK6Q5JdXIw6OtZVZTQ7pMWuv4pZa9YqVCXpDMdF7XTEqEI7o/C4Ta5M
	J0iIwijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQSj-00000002jRw-3JOP;
	Mon, 23 Nov 2026 09:35:51 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQSg-00000002jO9-2ywC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795426538; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=cSVyW0UVgqGJUNJlaP4TsMEvhElwJxyJXx8yTc90AO4=;
	b=rutvWedD4LFbQWpIsre+xijoJjy430/1bRJjyQj4mscQ14eVNrg6ub+qTphHHSUxiC5D7HQhiI+DlqMr8KO3OykE4zUIYTdsXDp05gsJ9IiZkgyiB6rBQSyyAk5D/jXBUZG5TT1rHuOBVGAA7p32hYuqMxYeCP+sO4j/dCz9H7w=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=yadong.qi@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0XFGOaDQ_1795426534;
Received: from L-G4162440-1116.localdomain(mailfrom:yadong.qi@linux.alibaba.com fp:SMTPD_---0XFGOaDQ_1795426534 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 23 Nov 2026 17:35:37 +0800
From: Yadong Qi <yadong.qi@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	ying.huang@linux.alibaba.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	robh@kernel.org,
	gregkh@linuxfoundation.org,
	ptg-linux-kernel@linux.alibaba.com,
	yadong.qi@linux.alibaba.com,
	stable@vger.kernel.org
Subject: [PATCH] arm64: fixmap: fix missing break-before-make in __set_fixmap()
Date: Mon, 23 Nov 2026 17:35:05 +0800
Message-Id: <20261123093505.974-1-yadong.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013546_965461_19987694 
X-CRM114-Status: GOOD (  15.19  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__set_fixmap() installs a new PTE with __set_pte() but never invalidates
the TLB; only the clear path calls flush_tlb_kernel_range(). The
dsb(ishst)/isb that __set_pte() emits makes the new PTE visible to the
table walker but does not invalidate stale TLB entries. Overwriting a
still-valid slot therefore leaves the old translation cached and
violates break-before-make: accesses may keep hitting the old output
address, and changing the attributes of a cached entry can trigger TLB
conflict aborts or CONSTRAINED UNPREDICTABLE behaviour.

Two in-tree callers overwrite a valid FIX_EARLYCON_MEM_BASE slot:

 - earlycon: earlycon_map() maps the UART before match->setup() runs.
   If setup fails, con->write is unset, or the DT reg-io-width is
   unsupported, the slot stays valid but no console is registered. The
   console_is_registered() guard only blocks successful registrations,
   so a later attempt (e.g. a failed DT earlycon followed by earlycon=
   on the command line) remaps the slot to a different UART.

 - samsung_tty: apple_s5l_early_console_setup() overrides the
   just-installed entry from PROT_DEVICE_nGnRE (FIXMAP_PAGE_IO) to
   PROT_DEVICE_nGnRnE on the normal successful boot path.

Both are valid-to-valid changes (different output address or memory
type), which arm64 requires to be break-before-make.

Fix this in __set_fixmap() by invalidating any existing valid mapping
up front: clear the old PTE and flush the TLB, then install the new PTE
only when setting. The old translation is gone before the new one is
created, so the two can never coexist in the TLB. A first-time mapping
(old entry invalid) skips the invalidation and pays no extra cost, and
clearing a slot is handled by the same step.

This belongs in the callee, as on x86: __set_fixmap() there calls
set_pte_vaddr(), which flushes the TLB unconditionally after writing the
PTE. x86 can flush after the write because it has no break-before-make
requirement; arm64 must invalidate and flush before installing the new
valid entry to avoid TLB conflict aborts.

Fixes: 9aac5887595b ("tty/serial: add generic serial earlycon")
Cc: stable@vger.kernel.org
Reported-by: Huang Ying <ying.huang@linux.alibaba.com>
Signed-off-by: Yadong Qi <yadong.qi@linux.alibaba.com>
---
 arch/arm64/mm/fixmap.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index f66a0016dd02..5593d7e0d523 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -126,12 +126,19 @@ void __set_fixmap(enum fixed_addresses idx,
 
 	ptep = fixmap_pte(addr);
 
-	if (pgprot_val(flags)) {
-		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
-	} else {
+	/*
+	 * Break-before-make: when the slot still holds a valid mapping
+	 * (e.g. earlycon re-mapping FIX_EARLYCON_MEM_BASE), invalidate the
+	 * old entry and flush the TLB entries caching it before a new
+	 * mapping is installed, so old and new translations never coexist.
+	 */
+	if (pte_valid(__ptep_get(ptep))) {
 		__pte_clear(&init_mm, addr, ptep);
-		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);
+		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 	}
+
+	if (pgprot_val(flags))
+		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
 }
 
 void *__init fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
-- 
2.43.0


