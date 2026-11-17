Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B13606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RDlx/KOz;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=D0K5hEkf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3NItBReUtOBWpHO0nf0rUAjTdM1Dh5h3BZRHNSIgwrA=; b=RDlx/KOz8uuSBf
	Kg7mZG3w9q+s3R9vlYUTVkmn5UQx+TpxRnPf+T52hJg4xVmqFZlxVe5ge37g+HGEsEjxpypzITc6U
	ajCcf67s2Nv3peuHYOcdwR/nYu2l+kCpOZ8u3QIEZvKhBHXxq3Q+9UonIHKV6HMPHwgAw9d4sQ2Tb
	wMyv7PCzqTGty36E2CKk8xGQ6vngHH3uyQWz2zgshAvY5HSnPdhnI7/O8pJMBGcVHgYkTCw13+lCZ
	/azpOKX68EXPhGHq0d/Ms7DyGn/8qZ27nppzq0pdxUTXk9z3J7/I8lp9rBrufYb8hXBq7Yu92Esau
	tRw74Qm7iITySFyjv15w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDH2-00000004hxY-2U74;
	Tue, 17 Nov 2026 07:06:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDGx-00000004hvg-3PAq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:06:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 985761682;
	Mon, 16 Nov 2026 23:06:27 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDF1E3FB7F;
	Mon, 16 Nov 2026 23:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899190; bh=QAGXNbzD0g0sHHdjDN/4c/Sx+cC3l60UDdZ0bXS07ns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D0K5hEkfCw9m9shseCLzkHCVRdi1eAy7puGMYpkj4yj2DQMdwmMeOxPNOdJW0aDB6
	 APo5YxDzM3z1YOuhWdAOf/Ep7TwFuoMvRYhoyIK59POQa2foDTv3dXMI0YYGUujhVd
	 4qGB7+5QaQgdd5g6+fmGLhnJ3hQ9M7fcwd6uoVsE=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V3 02/14] arm64/mm: Route all pgtable reads via ptval_get()
Date: Tue, 17 Nov 2026 12:36:01 +0530
Message-ID: <20261117070613.1183243-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_230631_926058_2D84DC0B 
X-CRM114-Status: GOOD (  11.18  )
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

Define arm64 platform specific implementations for new pxdp_get() helpers.
These resolve into READ_ONCE(), thus ensuring required single copy atomic
semantics for the page table entry reads.

In future this infrastructure can be used for D128 to maintain single copy
atomicity semantics with inline asm blocks.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a760c65de5cbe..1c982ccc1e5e3 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -84,28 +84,30 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	arch_flush_lazy_mmu_mode();
 }
 
+#define ptval_get(x)		READ_ONCE(x)
+
 #define pmdp_get pmdp_get
 static inline pmd_t pmdp_get(const pmd_t *pmdp)
 {
-	return READ_ONCE(*pmdp);
+	return ptval_get(*pmdp);
 }
 
 #define pudp_get pudp_get
 static inline pud_t pudp_get(const pud_t *pudp)
 {
-	return READ_ONCE(*pudp);
+	return ptval_get(*pudp);
 }
 
 #define p4dp_get p4dp_get
 static inline p4d_t p4dp_get(const p4d_t *p4dp)
 {
-	return READ_ONCE(*p4dp);
+	return ptval_get(*p4dp);
 }
 
 #define pgdp_get pgdp_get
 static inline pgd_t pgdp_get(const pgd_t *pgdp)
 {
-	return READ_ONCE(*pgdp);
+	return ptval_get(*pgdp);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -405,7 +407,7 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
 
 static inline pte_t __ptep_get(pte_t *ptep)
 {
-	return READ_ONCE(*ptep);
+	return ptval_get(*ptep);
 }
 
 extern void __sync_icache_dcache(pte_t pteval);
-- 
2.43.0


