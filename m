Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EC5607362F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vLIYbo5A;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GVdukjlx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GTGmKFM4xFszxJT3yvxzfIEd2u2ou6U+2cFfGcbONdk=; b=vLIYbo5AjZWaJL
	drxusyZN8BYjSWAQVpRFodDawOJ4fEBh4biDumvpeMbie4p2B8nwgYApdnm+KUFfVbz0yAOArHIXh
	KZpteNNjt9RC1mXzRhWTvo8sIw4mVvZnqrQ6xV/N5a+xSIHaP6Y2RnmKTac1+08mSOyhs7R3hYJTU
	cipnRV9kx2LRcBSh9PPKVueo+d2YSB414pXFIQl+R+6bdh1EHJQ91ID7zfanfU8E2NJ0QgmEKL0Ej
	PsdgeJv5/JZ+shYxdnS0SZH2XpkG8m1mhnlaMc+e0UD2yrRTojVCZmpj/MjOjIqDBYDdjUXNOpvwP
	RNiuCO0uYXWDdsx/XgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRp8-000000018gX-1JNI;
	Mon, 09 Nov 2026 16:02:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRp0-000000018Y4-24f1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:02:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF5DC2F;
	Mon,  9 Nov 2026 08:02:10 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E30A3F632;
	Mon,  9 Nov 2026 08:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794240133; bh=xf4mnCbgRoC4McQQdkoE98wQ+JFumNK4YzHFaYloEOc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GVdukjlxt6BJwkZ8GSCwyaHoZsS5MHrj9UxdrQv4DpZ0VhH9HMytRJs38rarGnK4j
	 OBxKYeC/zG2+fIYLmXWZGCRbr0d0+d9CFANUIsspLIWmtRkQefPXHSzO2Eoc6PQiQV
	 tWWWmYdglDOQOBmXELlKZUa8M3SaMqzZwiKODvgc=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Mon, 09 Nov 2026 15:58:44 +0000
Subject: [PATCH RFC v10 19/22] arm64: kpkeys: Batch KPKEYS_CTX_PGTABLES
 switches
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-kpkeys-v10-19-aa6c4d9603bc@arm.com>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
In-Reply-To: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb+git@google.com>, Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org, 
 Ira Weiny <iweiny@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794240029; l=4874;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=xf4mnCbgRoC4McQQdkoE98wQ+JFumNK4YzHFaYloEOc=;
 b=Gmrm9AOzE5rqNW6yMYk/EZ4iMTeukSeNRN048Oj3iqazwl2o/qZJ7PMOI+du48vXZZGmLoSb+
 V8grDTumbALC+mu+7PvZ5/wbybQgeL9EMYZI23gO7yjsEiiXRrkqGFI
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_080217_028661_B3594A4C 
X-CRM114-Status: GOOD (  23.15  )
X-Spam-Score: -4.4 (----)
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

The kpkeys_hardened_pgtables feature currently switches kpkeys
context in every helper that writes to page tables, such as
set_pte(). With kpkeys implemented using POE, this entails a pair of
ISBs whenever such helper is called.

A simple way to reduce this overhead is to make use of the lazy MMU
mode. We amend the kpkeys_hardened_pgtables guard so that no kpkeys
context switch (i.e. POR_EL1 update) is issued while the lazy MMU
mode is active. Instead, we switch to KPKEYS_CTX_PGTABLES when
entering the lazy MMU mode, and restore the previous context when
exiting it.

Restoring the previous kpkeys context requires storing struct
kpkeys_state somewhere. POR_EL1 is a full 64-bit value so we cannot
simply use a TIF flag. There is no straightforward way to reuse
current->thread.por_el1 for that purpose - this is where the current
value of POR_EL1 is stored on a context switch, i.e. the value
corresponding to KPKEYS_CTX_PGTABLES inside a lazy_mmu section.
Instead, we add a new member to thread_struct to hold that state
temporarily. This isn't optimal as that member is unused outside of
lazy MMU sections, but it is the simplest option. Nesting of
sections is not a concern as arch_{enter,leave}_lazy_mmu_mode() are
not called in inner lazy MMU sections (nor do we need to do anything
there).

A further optimisation this patch makes is to merge the ISBs when
exiting lazy_mmu mode. That is, if an ISB is going to be issued by
emit_pte_barriers() because kernel pgtables were modified in the
lazy MMU section, we skip the ISB after restoring POR_EL1. This is
done by checking TIF_LAZY_MMU_PENDING and ensuring that POR_EL1 is
restored before emit_pte_barriers() is called.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h   | 50 +++++++++++++++++++++++++++++++++++---
 arch/arm64/include/asm/processor.h |  4 +++
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 5f46d4cb3882..5e958531e6ab 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -43,10 +43,44 @@
 
 #ifdef CONFIG_KPKEYS_HARDENED_PGTABLES
 KPKEYS_GUARD_COND(kpkeys_hardened_pgtables, KPKEYS_CTX_PGTABLES,
-		  kpkeys_hardened_pgtables_enabled())
-#else
+		  kpkeys_hardened_pgtables_enabled() &&
+		  !is_lazy_mmu_mode_active())
+
+static inline void kpkeys_lazy_mmu_enter(void)
+{
+	if (!kpkeys_hardened_pgtables_enabled())
+		return;
+
+	current->thread.kpkeys_state_lazy_mmu =
+		kpkeys_enter_context(KPKEYS_CTX_PGTABLES);
+}
+
+static inline void kpkeys_lazy_mmu_exit(void)
+{
+	const struct kpkeys_state *state =
+		&current->thread.kpkeys_state_lazy_mmu;
+
+	if (!kpkeys_hardened_pgtables_enabled())
+		return;
+
+	/*
+	 * We skip any barrier if TIF_LAZY_MMU_PENDING is set:
+	 * emit_pte_barriers() will issue an ISB just after this function
+	 * returns.
+	 */
+	if (test_thread_flag(TIF_LAZY_MMU_PENDING) && state->entered_context)
+		__kpkeys_set_pkey_reg_nosync(state->arch_state.por);
+	else
+		kpkeys_leave_context(state);
+}
+#else /* CONFIG_KPKEYS_HARDENED_PGTABLES */
 KPKEYS_GUARD_NOOP(kpkeys_hardened_pgtables)
-#endif
+
+static inline void kpkeys_lazy_mmu_enter(void) {}
+static inline void kpkeys_lazy_mmu_exit(void) {}
+#endif /* CONFIG_KPKEYS_HARDENED_PGTABLES */
+
+
 
 static inline void emit_pte_barriers(void)
 {
@@ -79,7 +113,10 @@ static inline void queue_pte_barriers(void)
 	}
 }
 
-static inline void arch_enter_lazy_mmu_mode(void) {}
+static inline void arch_enter_lazy_mmu_mode(void)
+{
+	kpkeys_lazy_mmu_enter();
+}
 
 static inline void arch_flush_lazy_mmu_mode(void)
 {
@@ -89,6 +126,11 @@ static inline void arch_flush_lazy_mmu_mode(void)
 
 static inline void arch_leave_lazy_mmu_mode(void)
 {
+	/*
+	 * The ordering should be preserved to allow kpkeys_lazy_mmu_exit()
+	 * to skip any barrier when TIF_LAZY_MMU_PENDING is set.
+	 */
+	kpkeys_lazy_mmu_exit();
 	arch_flush_lazy_mmu_mode();
 }
 
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 18424d91d8b2..e96c4d57d67d 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -30,6 +30,7 @@
 #include <linux/build_bug.h>
 #include <linux/cache.h>
 #include <linux/init.h>
+#include <linux/kpkeys_types.h>
 #include <linux/stddef.h>
 #include <linux/string.h>
 #include <linux/thread_info.h>
@@ -196,6 +197,9 @@ struct thread_struct {
 	u64			tpidr2_el0;
 	u64			por_el0;
 	u64			por_el1;
+#ifdef CONFIG_KPKEYS_HARDENED_PGTABLES
+	struct kpkeys_state	kpkeys_state_lazy_mmu;
+#endif
 #ifdef CONFIG_ARM64_GCS
 	unsigned int		gcs_el0_mode;
 	unsigned int		gcs_el0_locked;

-- 
2.56.0


