Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73AF606A685
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2nIwQqH3;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mMwB757j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tjhtu2IQKTqTGBX17Faec5as53bYJgHEh739WAlPWGk=; b=2nIwQqH3bLrFHSjk8/CY6saq7/
	ATkEQdIKUDPO9VlvrYzZNcOWY0Ze63560Qucd3JGGyq1gaLmSWugxT94Njjke/ozq8kF1unlSksri
	WBY/mOSXjFTx9sul6anAZAUHVGQJDAjBjSoN1Z6UaUUTr/kL7/OvsbSP1RPKoy3S9CBpmcA8WkpeB
	hho5n9RhR+UGCjJOZF7HlO5axSPfobSLzvHJ2rKKcw0y7//WS6SbKunZFgjy3E+4Bsx7R80Y1Qw4H
	58qph/uKZ1aIFjIqqJFX+u2fWK7V2knLkeYX8QkElhLdkuhma3vYbZHOZvmA9dclBAs6RREdCfgaM
	IxJhFUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ0-00000001Yby-3vcq;
	Sun, 22 Nov 2026 18:45:22 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYp-00000001YSO-04Zw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:12 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2f040c6e0ceso25116075ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373110; x=1795977910; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjhtu2IQKTqTGBX17Faec5as53bYJgHEh739WAlPWGk=;
        b=mMwB757j9Sl7TFrp9as5OMo6GBCAU5urmFFsqkjmHy/PcVM2fXa7DCUx46OmZotRrd
         1CEudH3/zGsvUa2/NerwU5JSe+46ZP9ex9RIkZ6Z79u49ibaT6xHATM70mWduz8wZ6uZ
         d0Z4cjXNXh3+tU0ZwzikFDqtU+Zr21ZAVRakAjMaww/fSjkWM9I9EEX/i3n9McG9TaQI
         K+gXjKsdzDzck5S/wB6TSbJ1IgNU/vTf5SdoIGJxwx1Kw/WTmyvreHS5ii54L+4uRFpn
         j2666k4rsYJ5N4hjHr4NBXz1ZE9LGO5Pj3wLM6PluGTCs2BQdWftnN9wgSMAT4cKcZXy
         tFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373110; x=1795977910;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjhtu2IQKTqTGBX17Faec5as53bYJgHEh739WAlPWGk=;
        b=slpQekhsR7H8HyoW7UfCU8vSi3YgkRXjGy5nt5ariZfXjZan0iXAvEO8ejtJWIpak9
         FQRb9HcDstVHyhzfzBeQ8N1TlzYQBzxUonJyhiggXntbd3ZMTFe7SLxvKWWMeBg4g2jP
         qKvE/LI0WM4CTs8IdYfoJCXHfBqqCOn4N5eYMySw33uGY5ObKyS99swBzwePeDRi8L2x
         4wocA1Ap55c/VB/oGe9Ng1wy7H88vgYDuG9g/762Q8myhqmmnCQFSMrKygDeZzXCjizl
         XfBOgGIBFz2kmsgevd+tAUq8BvzvoFJB13imkFQNjBvu24orhoPRH97RE9Y09hfW4p9Z
         mlFA==
X-Forwarded-Encrypted: i=1; AL+hErGck/O5pREJC74SQnxBKu1X6A1b9iMbDwjd6L5kARRJd8cGs4ims4kzJkMfI0D/qOrUHPtUem5Q23qYaLJB+t/3@lists.infradead.org
X-Gm-Message-State: APuU4Z8VTepWJlA8yDblT8PYmH85ef3fcRExcO2dsyFC5unmr/DtN0eN
	vTJH8jCX3n3iUDHtFpMWn+Po6qzCnF25LsR7k9f2TtRKAFxrl+U8gWOKGfmUEMzNlzZp9/pqpWE
	pJm8bpdyqZ/i7f2kbvVKEUA==
X-Received: from pjbmy10.prod.google.com ([2002:a17:90b:4c8a:b0:3b3:79f6:3f84])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2f8f:b0:3b3:ba43:54c3 with SMTP id 98e67ed59e1d1-3b41c942998mr7718358a91.33.1795373109239;
 Sun, 22 Nov 2026 10:45:09 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:44 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-11-jthoughton@google.com>
Subject: [PATCH v3 10/19] arm64: Implement try_update_vmemmap_pte using the AF trick
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_104511_064601_D9B25EA2 
X-CRM114-Status: GOOD (  17.44  )
X-Spam-Score: -9.5 (---------)
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
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

try_update_vmemmap_pte() must modify vmemmap PTEs without introducing a
time window where other CPUs on the system might fault.

Normally a break-before-make sequence is required to avoid conflicts
with cached translations. However, if we can guarantee that the existing
translation cannot be cached, a BBM sequence is not needed.

Translations with the AF unset may not be cached (see Arm ARM Rule
DWZCQ); the implementation of try_update_vmemmap_pte() on arm64 takes
advantage of this fact to replace a PTE without BBM and therefore
without leaving a window open where PE might fault on this translation.

Of course, if some CPUs on the system do not support HW AF management,
clearing the AF will introduce potential faults.
system_supports_bbm_through_af() will return false if any CPUs on the
system do not support HW AF.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgtable.h | 59 +++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4285b7e7a6a7..7421c0a048ff 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1249,14 +1249,24 @@ static inline void __pte_clear(struct mm_struct *mm,
 	__set_pte(ptep, __pte(0));
 }
 
-static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
-		unsigned long address, pte_t *ptep)
+/*
+ * Atomically clear the Accessed flag. Return the old value of the PTE.
+ */
+static inline pte_t __ptep_clear_young(pte_t *ptep)
 {
 	atomic64_t *pteval = (atomic64_t *)&pte_val(*ptep);
 	s64 af_mask = PTE_AF;
 
-	/* Atomically clear PTE_AF, checking that it was set before. */
-	return af_mask & atomic64_fetch_andnot_relaxed(af_mask, pteval);
+	/* Atomically clear PTE_AF. */
+	u64 oldval = atomic64_fetch_andnot_relaxed(af_mask, pteval);
+
+	return __pte(oldval);
+}
+
+static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pte_t *ptep)
+{
+	return pte_young(__ptep_clear_young(ptep));
 }
 
 static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
@@ -1921,6 +1931,47 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
+					 const pte_t pte)
+{
+	const int max_attempts = 16;
+	int attempts = 0;
+	pte_t old_pte;
+
+	if (!system_supports_bbm_through_af())
+		return -EOPNOTSUPP;
+
+	/* This routine is only to be used for valid-to-valid transitions. */
+	if (WARN_ON_ONCE(!pte_valid(pte)))
+		return -EINVAL;
+
+	old_pte = __ptep_get(ptep);
+
+	do {
+		if (WARN_ON_ONCE(!pte_valid(old_pte)))
+			return -EINVAL;
+
+		/* We should never get a contiguous PTE here. */
+		if (WARN_ON_ONCE(pte_valid_cont(old_pte)))
+			return -EINVAL;
+
+		if (pte_young(old_pte)) {
+			/* __ptep_clear_young() returns the overwritten PTE */
+			old_pte = pte_mkold(__ptep_clear_young(ptep));
+
+			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+		}
+	/*
+	 * Translations without AF cannot be cached, so we can replace
+	 * them without BBM.
+	 */
+	} while (!try_cmpxchg_relaxed(&pte_val(*ptep), &pte_val(old_pte),
+				      pte_val(pte)) &&
+		 ++attempts < max_attempts);
+
+	return attempts == max_attempts ? -EAGAIN : 0;
+}
+
 #define __HAVE_ARCH_VMAP_PTE_SET_HUGE
 void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
 		       pgprot_t prot, unsigned long size);
-- 
2.56.1.809.ga0b61035b5-goog


