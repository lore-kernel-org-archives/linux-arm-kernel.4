Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579DE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1vLRNEkJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Ic7cb9o0;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VEzK7/JY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oqxkE4ochVp788mKakiWH9CZR2y6Ff8i3F/s8pOPTcw=; b=1vLRNEkJ2eOndpW6L1gU2DJo0K
	HbzY/rjW3GHmMJ0rkZQsuWUKa4Tn4MVzG8ZzYjfGGJ7VoDqYrKG6IsOrNQ7Q9dTrBMJetEyv/uCPj
	/jjug0f6z9+SOHtQWWLxNKiAJn+talOiRKunFxmN90mqMdaX3T/MsZGfHW2Spt7RIN56o/2qyldXz
	K2yrd+Hp8j9dqTWU7Nj85MV6xA95z3UNHtGdb+XQ66OyLTI9F8/mjet/fb4bB5W9hcrlYbWJPI3oY
	7rprh7nv/lUzp2KP5KPfQ7vpqMuDjlHeX2exzep5q4GE/4vfdllNFL1Jwv0z1W2+aEQ7IDca1SCZk
	isdH9WQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCal-00000001Zsf-0hkk;
	Sun, 22 Nov 2026 18:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYz-00000001YY2-1K1u
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oqxkE4ochVp788mKakiWH9CZR2y6Ff8i3F/s8pOPTcw=; b=Ic7cb9o0lRsmP6iKq1NQcnpaxT
	aqdsUP1+64eOx96Pj7kdCih8qTCE3sxa03JMbVbTuf7eQqh/dgn3kfa2sjANWydqEX3xuuazR3jtP
	zF/l2BIvCvNQKrcjpx8QQ8h64xPRla7sac3bXqMoV9B2cZQpJ+6MTocIcokrPa8B1IFaAX0h9gZlD
	5617QmRgS24ryF31uqVgoqb3o0VbtuRy3kNfbJCQVNaTv8mne7NK67rcUZAm8gagzFy2VJUJo9r88
	uDD+UsCQGriw1GBx54eptxvSVhRv8LKA4AGOqkQxc/IsC2uSkXUVHJanc5LklIDDyrGvF1QupxI6R
	QTy4ICPQ==;
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYw-00000002RG6-48V7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:20 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3b41aa2b9a8so1913495a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373117; x=1795977917; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqxkE4ochVp788mKakiWH9CZR2y6Ff8i3F/s8pOPTcw=;
        b=VEzK7/JYmASQXtTGzI10q6547kl7ROsWYfJBSqQKcFfhlAYnz81K5Vrgj8v8MHmOsY
         hxnndPSuvMMX53c3ByfYstlzQBpqqnGzKw9ViMXbjvIGXd66tTdxUGkkr/HxFFBHJn2g
         gTX4YQaAo1LUtResJqNsMIT6I0pRljXBEzWJN0xN//XAsII0lZBsjE8aqUVBNTz6Vg2u
         bmjVLDwyi2izwZsuurKQEr8tklaE34OmMP22Z1hWqvnpQeIUFdzUqPK/la+CyBk5wT/Y
         X6/oMR+kSdpQSCULGHQhgSWXFPqG+45PaSpuzJPorNNcZSzQttrEMBc7Kfy8fSQoEh/u
         qLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373117; x=1795977917;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqxkE4ochVp788mKakiWH9CZR2y6Ff8i3F/s8pOPTcw=;
        b=mGEL0LBWuCXmcG/L7sAdlvwm0tWk/JyGrGhiOuYIYOGkgx72oObbh26myoW5vN1u+Z
         n61FgzKB3nCO3qTW1MksfddL2UFhshgzZQCCnSt+DIAYskG1TJ8NmQ7X0gy0QAfOmdld
         LuqUSoZqty7d+q2cZMrJqeFB2gogI8r5OYBqspBbIMoZyETAGv8x9deVGii7aSClycSR
         lLXYcjWAZ7bSq6kqL7GEKaefTy5dOO40/DW4IrpPc38iE2vs6JndUF3s+m+41MZPUpRl
         w+bNwbnhmtJqEp6z+byVjd+SZdniPwZjVaj7gJIXRPhrpCH6onFbAmcuZvioqGcVqiJo
         BuoA==
X-Forwarded-Encrypted: i=1; AL+hErE+r4YKIpRG+TmJ61FdhY+v5OHKnLISqbXh1sWkP+UqazVJQFPJZz03D2bGDzywCY0I/bKmUf4HTgR5dp8EN0/L@lists.infradead.org
X-Gm-Message-State: APuU4Z/mxM1dJYo8s1fzUNM3ongHgUX6B1p9ZHjgODQOyAtmpEzenafC
	r2LtAXQTGqirAxBO5nuLyGx61uIE71FFNplVdVrj8Pw1EB3BIFEUHPKu83dhtI+mU8uZ1RPOTpZ
	KL9MrZaFWHjFZZ49Ub2gTQA==
X-Received: from pjyl12.prod.google.com ([2002:a17:90a:ec0c:b0:3b4:2165:2e77])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5543:b0:3ac:6fcf:81a2 with SMTP id 98e67ed59e1d1-3b41cb33a0dmr7946054a91.57.1795373116556;
 Sun, 22 Nov 2026 10:45:16 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:50 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-17-jthoughton@google.com>
Subject: [PATCH v3 16/19 DO-NOT-MERGE] arm64: Implement try_populate_vmemmap_pmd
 using AF trick
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
X-CRM114-CacheID: sfid-20261122_184518_902250_F7AB7262 
X-CRM114-Status: GOOD (  16.33  )
X-Spam-Score: -7.6 (-------)
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

This routine is to be used for updating in-use, leaf-level PMDs in the
vmemmap without introducing a window where vmemmap accesses might fault.

Implementing this on arm64 requires some care: use the same access flag
trick that is used for vmemmap PTE updates. HAFT is not needed and the
TLB flushing routine remains identical, as we are not overwriting a
non-leaf PMD.

For systems that support BBML3, there is no need to use the AF
trick.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgalloc.h | 51 ++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 0263329fb7b3..7e304f01ce6d 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -124,9 +124,54 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
 static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
 					   pte_t *pgtable)
 {
-	/* BBLM3 is required. Its presence has been checked. */
-	pmd_populate_kernel(&init_mm, pmdp, pgtable);
-	return 0;
+	const int max_attempts = 16;
+	int attempts = 0;
+	pmd_t old_pmd, new_pmd;
+
+	if (!system_supports_bbm_through_af())
+		return -EOPNOTSUPP;
+
+	if (system_supports_bbml3()) {
+		/*
+		 * BBML3 allows block->table transitions if the PTEs underneath
+		 * do not conflict with existing, potentially cached
+		 * translations.
+		 */
+		pmd_populate_kernel(&init_mm, pmdp, pgtable);
+		return 0;
+	}
+
+	new_pmd = __pmd(__phys_to_pmd_val(__pa(pgtable)) |
+			PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_UXN);
+
+	old_pmd = pmdp_get(pmdp);
+
+	do {
+		if (WARN_ON_ONCE(!pmd_valid(old_pmd)))
+			return -EINVAL;
+
+		if (WARN_ON_ONCE(!pmd_leaf(old_pmd)))
+			return -EINVAL;
+
+		/* We should never get a contiguous PMD here. */
+		if (WARN_ON_ONCE(pmd_cont(old_pmd)))
+			return -EINVAL;
+
+		if (pmd_young(old_pmd)) {
+			/* __ptep_clear_young() returns the overwritten PTE */
+			old_pmd = pte_pmd(pte_mkold(__ptep_clear_young((pte_t *)pmdp)));
+
+			flush_tlb_kernel_range(addr, addr + PMD_SIZE);
+		}
+	/*
+	 * Translations without AF cannot be cached, so we can replace
+	 * them without BBM.
+	 */
+	} while (!try_cmpxchg_relaxed(&pmd_val(*pmdp), &pmd_val(old_pmd),
+				      pmd_val(new_pmd)) &&
+		 ++attempts < max_attempts);
+
+	return attempts == max_attempts ? -EAGAIN : 0;
 }
 
 #endif
-- 
2.56.1.809.ga0b61035b5-goog


