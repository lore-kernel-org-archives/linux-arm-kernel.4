Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F79606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3oLBjk75;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=bVlg5bQt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yyx3uSOohB+Fl4XAtSucbcMbOjZ0KFt5ODHENuzoZHY=; b=3oLBjk75v+QGZ1P/mpStIJA5i1
	GMlm3rvUgGXs0Paxbk5a1m4krlL27PvToShx+nmcn+PgAMfnQcjIKWtFJTOkZa/mmHPvOtb5asOOs
	kEDcYV6+7Gdqvnsj1rlskW4dXqLHkhgEsvt1IzwimSVDBQQXsJ5XpYHJCJfrhd+Khlh3ph4p5kgho
	QrMQH7V7/DL7CpQIeZcfEHUFRKn+Vtsswqwj+JOP4GyaQltnuNjao9a4q1YBQuCzH04ejVhgcbctr
	KSv1y7adMk9ajhT7bOiLl3Q58MUBXQWvHnNj++H3GxCrimkR8Bkr0THRSktT82NG6JvJof0gYR9ZK
	K/5nblbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWP8L-0000000BsnI-2ET4;
	Thu, 26 Nov 2026 02:22:49 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWP8I-0000000Bsm5-07Dp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795659763; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=yyx3uSOohB+Fl4XAtSucbcMbOjZ0KFt5ODHENuzoZHY=;
	b=bVlg5bQt8W6y/438ecggUpd7nhtDdg5IxfDI7vRYYtVcPuU+sPUvPLOGpThMRrWBNdrboIRqNhH9HbJJ3qsROCxTu8DbKA1OpMWQZLimfkeHkSvApx67+i0TxHll2e+EzLSzIHOqh+dnMpjPvfvhlzrA/DvFfMONm/+j/KLpXG4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=yadong.qi@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0XFT3lz9_1795659761;
Received: from L-G4162440-1116.localdomain(mailfrom:yadong.qi@linux.alibaba.com fp:SMTPD_---0XFT3lz9_1795659761 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 10:22:43 +0800
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
Subject: [PATCH v3] arm64: fixmap: fix missing break-before-make in __set_fixmap()
Date: Thu, 26 Nov 2026 10:22:27 +0800
Message-Id: <20261126022227.1618-1-yadong.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_182247_079760_30974D25 
X-CRM114-Status: GOOD (  18.31  )
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
entry cached locally. Take KVM arm64 VNCR unmap path as example:: in
this_cpu_reset_vncr_fixmap(), a CPU that loses the atomic_xchg_relaxed()
ownership race in unmap_l1_vncr() still calls clear_fixmap() on its own
slot. Gating that flush on pte_valid() would let vcpu_put() return while
the winner's TLB flush is still in flight, so a new vCPU could remap the
slot with the old translation still cached. The unconditional flush
preserves clear_fixmap()'s TLB shootdown guarantee.

This belongs in the callee, as on x86: __set_fixmap() there calls
set_pte_vaddr(), which flushes the TLB unconditionally after writing the
PTE. x86 can flush after the write because it has no break-before-make
requirement; arm64 must invalidate and flush before installing the new
valid entry to avoid TLB conflict aborts.

Fixes: bf4b558eba92 ("arm64: add early_ioremap support")
Cc: stable@vger.kernel.org
Reported-by: Huang Ying <ying.huang@linux.alibaba.com>
Signed-off-by: Yadong Qi <yadong.qi@linux.alibaba.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
---
v3:
- Change the Fixes to bf4b558eba92 ("arm64: add early_ioremap support")
- Shorten the code comment to a few lines; the rationale stays in the
  commit log 
v2:
- Rebase to arm64 for-next/fixes
- Fix comments from sashiko: always clear and flush on the clear path
  (!flags), even when the PTE is already invalid.
---
 arch/arm64/mm/fixmap.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index 951004ad700c..c8a0d008cf2a 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -126,13 +126,20 @@ void __set_fixmap(enum fixed_addresses idx,
 
 	ptep = fixmap_pte(addr);
 
+	/*
+	 * Break-before-make if the slot holds a valid mapping. Always
+	 * flush on clear since another CPU may have cleared the pte
+	 * without completing its TLBI yet.
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


