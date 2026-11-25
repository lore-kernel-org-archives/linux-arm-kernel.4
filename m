Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ECA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rgFIWIFV;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=iHqOCSvg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=I6+kzu5wlP2gNqaFOLzY8J/HA+tCbkwiTb+BR4uUO2I=; b=rgFIWIFVcuy6ZzqNAm1DepryAH
	4mtVVLPGFPEtL5h5zwxafy9AS98NbIenienNE4vsg9HZRtoHIFHehkF1595bOawvIiSXyVx7C7AGu
	V7q0mtrwY0yKoz6LxkV5yAGtp2eqjCFqD+qDeX0dggXVU4QYS75Y6Y+WYZA2P1gLMcGxxSUYT3VnG
	Sjkl5dLvtWRqTcTCziBHn7upIyr1Wcw4UnpKlTQoi2V5zTt/b3M9QVtjZXRI84dqMS8vOfNb7QPMG
	20GBoQ4UEkW/RKpGDcGt1ByjJj2H7vmeotzy12vBhivtL0ugreqNE7WRtAzhmpf/Rju0wUO4VT4QE
	F8xg+WMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6bO-00000008iZU-36tD;
	Wed, 25 Nov 2026 06:35:34 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6bL-00000008iYP-25Va
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795588528; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=I6+kzu5wlP2gNqaFOLzY8J/HA+tCbkwiTb+BR4uUO2I=;
	b=iHqOCSvgZIBUMTOo4cuC2CMO0SJJgwLdRYTUDv+Z3R4iaWFdl8DKIRySpKtBj61MxHggj4jM+gCmf0t0R3ADv2+hlfv8jwo9rPzdoiZokTgGKAY9If/BYcAXQ9jE1lS0/ziacUizleZzO1hRqAsGcwH8Q/h2Cs+bkKJKwsMOpmM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=yadong.qi@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0XFQjoFf_1795588525;
Received: from L-G4162440-1116.localdomain(mailfrom:yadong.qi@linux.alibaba.com fp:SMTPD_---0XFQjoFf_1795588525 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Nov 2026 14:35:27 +0800
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
Subject: [PATCH v2] arm64: fixmap: fix missing break-before-make in __set_fixmap()
Date: Wed, 25 Nov 2026 14:32:24 +0800
Message-Id: <20261125063224.553-1-yadong.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_223531_727545_5A5CD7AF 
X-CRM114-Status: GOOD (  18.54  )
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

A clear (!flags) always clears and flushes, even when the PTE is already
invalid. An invalid PTE does not imply an invalid TLB: another CPU may
have cleared the PTE but not yet completed its TLB flush, leaving a stale
entry cached locally. The unconditional flush preserves clear_fixmap()'s
TLB shootdown guarantee, which callers such as the KVM VNCR unmap path
rely on when racing with a remote invalidation.

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
v2:
- Rebase to arm64 for-next/fixes
- Fix comments from sashiko: always clear and flush on the clear path
  (!flags), even when the PTE is already invalid.
---
 arch/arm64/mm/fixmap.c | 42 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index 951004ad700c..5da49e201b6f 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -126,13 +126,49 @@ void __set_fixmap(enum fixed_addresses idx,
 
 	ptep = fixmap_pte(addr);
 
+	/*
+	 * Break-before-make: when the slot still holds a valid mapping
+	 * (e.g. earlycon re-mapping FIX_EARLYCON_MEM_BASE), invalidate the
+	 * old entry and flush the TLB entries caching it before a new
+	 * mapping is installed, so old and new translations never coexist.
+	 *
+	 * A clear (!flags) always flushes even if the PTE is already invalid:
+	 * a remote CPU may have cleared the PTE but not yet completed its TLB
+	 * flush, leaving a stale entry cached locally. Take KVM VNCR unmap as
+	 * example:
+	 * When CPU1 wins atomic_xchg_relaxed(&vt->cpu, -1) in unmap_l1_vncr(),
+	 * CPU0 calls clear_fixmap() on its own slot so it cannot finish
+	 * vcpu_put() before the local TLB entry is invalidated:
+	 *      CPU0                                  CPU1
+	 *                                 invalidate_vncr()
+	 *                                 unmap_l1_vncr()
+	 *                                   atomic_xchg_relaxed(&vt->cpu, -1)
+	 *                                   clear_fixmap(vncr_fixmap(0))
+	 *                                     __pte_clear(..., ptep)
+	 *                                     <delayed before TLB flush>
+	 * kvm_vcpu_put_hw_mmu()
+	 * this_cpu_reset_vncr_fixmap()
+	 *   unmap_l1_vncr() == -1
+	 *   clear_fixmap(vncr_fixmap(0))
+	 *     !pte_valid(__ptep_get(ptep))
+	 *     <skips flush_tlb_kernel_range()>
+	 *                    <stale TLB entry still live on CPU0>
+	 * If another nested vCPU then schedules on CPU0 and calls
+	 * kvm_map_l1_vncr() before CPU1 finishes flush_tlb_kernel_range(),
+	 * __set_fixmap() also sees !pte_valid(__ptep_get(ptep)) and installs
+	 * the new PTE while the old translation is still cached in CPU0's TLB.
+	 * Unconditionally clearing and flushing when !pgprot_val(flags)
+	 * preserves clear_fixmap()'s TLB shootdown guarantee.
+	 */
+	if (pte_valid(__ptep_get(ptep)) || !pgprot_val(flags)) {
+		__pte_clear(&init_mm, addr, ptep);
+		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+	}
+
 	if (pgprot_val(flags)) {
 		/* The slot must be usable on return, even in lazy MMU mode. */
 		__set_pte_nosync(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
 		emit_pte_barriers();
-	} else {
-		__pte_clear(&init_mm, addr, ptep);
-		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);
 	}
 }
 
-- 
2.43.0


