Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C08606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 04:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y9A30ED+;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dOrruyjt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K3n9ukDrxII5BXz/7vbmrUFxcX10DGV7r2as+LtHfBI=; b=y9A30ED+FzCHCj
	MemM0BO+K5IObsSprm73k6xt/h66loRi4cHfs8Ca1N5khs4avzvTghm0b3lrYjN0XrqFLB/Pc9C1b
	BrWtwr8MiNJKkwsDVolx3t/DKOzqiPVEuWGkwQSgC1OleM/1p2e6IXEJ84jKdEa8V+yNR28RnFpLn
	PoCFNkGszeMBLmx3RCuXO5pfAh8+hUT+zWYlJ3WvQWlqUfdfFtDLNenGzEaL72JDqaLkPq2IaeB/O
	OttmLEiZOA56sgRx5vIRhzXFl67k9DeFcNYKr457Px7m1AwLzTqfcC1KiDgLYIQKJeQw7yVcTkaKX
	f3MM/PG8qbz7n+lMfGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY69-0000000EBzv-043D;
	Sat, 07 Nov 2026 04:32:13 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY63-0000000EBxl-195l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 04:32:09 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8a06210b29fso521896b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 20:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025926; x=1794630726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3n9ukDrxII5BXz/7vbmrUFxcX10DGV7r2as+LtHfBI=;
        b=dOrruyjt07nt5BiMRiygN2t61aqBla1bC0iPmPXSlRBDnVTLvvwgRNV4HcsgSsHIAp
         tnFrQUtHZI6PCV4xd6MD23ejeOYWJJbibpRV77YDYdA4BC26pL9/NzG+VM4m1ceUXpqH
         A22+Il5g2F8Bj/PltBYYHW0nA3vy/2w0UYCSD0CZ6G35I2QJGrOe5bnX0TkL55Hm56m8
         5w1t4VCP4Hs9rleC4dnjydbvKpYG4eqarvHxOQeVwHI3KQtqfQEJk1wNQPHDBNzQxzIR
         CgxlTM9mZ8RcMfweEbShIgaZkEI0OBGRz0eiquDAsnLffP9u71c9qhR6V7ZMMqUOwPh6
         XRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025926; x=1794630726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3n9ukDrxII5BXz/7vbmrUFxcX10DGV7r2as+LtHfBI=;
        b=zBkxWlV+rUczMHOGBN2/tsH11tnBeM1Ip8HuU2ui/JJGQP1fPTplUU9II1m9Q3ZrEl
         CivGXhlLU77g1bofRhNc7ZNgwhL1LHhPTLnDH5sFZqlOwTi26AN0l8BuLeV4Oh7qEGjq
         vDh+WzFN6JqxZI2pwAJWpYfID8/D55KuTrHsrai/Qw49sRMQ01yPDXnD/uHsJudtnM8R
         mjDlQVfF0NocYsOgilo5u2LeLAquReK1Xw7nPBwD3xVIE01ELejOFV9jvu+r9nzU8V4Q
         HnxEnr/ocgMWCm+Ul2Toq2jNEllPKjUYHtR7ZUmVuvv7rlhUAuQWPlbJGyF+mf6GahQL
         hzgg==
X-Forwarded-Encrypted: i=1; AL+hErHj0kQ3dHGJS1PEwXucbvIlTYFYMAu7pjqo8iEbi/QhJaKIyDu9iUfnKrWdyq9UUkPse4y0p/2XLDLbI7RAmqxO@lists.infradead.org
X-Gm-Message-State: APuU4Z/ozwYstXy/EUkXPo3fdNW1VSNQxtUPExuN9S7ZvS6+FPOGrGZm
	5FanD3TqKn6Oop0UZPRaknr0fEx7/1L6da7Abux3CVbwckAyXIvdIHKEwAkbkn3Wo78=
X-Gm-Gg: AYBFou0ULzDpLAJ3cQw7mGUEeYLnLbSAS03j2J+GwCDYAbnj3t3wjLKMf9RCfaKW6tm
	H3rSO7djMaBRCoGS6j2o6gAwZTZT+onwHCWwDeeXL5fqVVlmOV42IGdiGwZpO7esn7b711qXF1H
	mNaUHsAJ1nfhnCiMJy1v3UQ8w96hCqjYEych0uoPJD0xO65fQRAMO2kWyapgFYIFgQhPkt6fCPS
	nAIUZFz5e+/vxzKPd1u/fYAlDZ2WwxdynwyqhMM9G4fVhcQDoouHAcrhgfAefpRjT7ShvXD88Pv
	BEWrRRD2OeVx2jpqz2mgqjIHquqiutZ1tqmVTO92flqoC43YXtvgc8QGEKTlz6R6SDDXk9sVhb3
	TWuaLuLexuS+FyJK9asyzFqa5ydFpanK/Qxtl6aWfF4Ed5wKhE+qC84vAqs1Uu5mnIGIA1iTChN
	w4ThD/y+C/n5FLshlVfcSZ7YyRWHEyqZfOQYP+aX7p/ho53Yd+Xra+VeAy8Q+2jPyzwmLvUHiG0
	3qC1p3mNNs0qNuOydyHBk5jQTy30LcIIKvkNAdLdu/oCdGbfEViTQAokFewiXTLSED/5NMbMLNn
	mI5f2rLXBniOgSiCmcw8tq/ojn9YjLlBOUW0KgUtnk0gMBfV/me0yiYzpbrL
X-Received: by 2002:a17:90a:c107:b0:3ab:36c4:b4ff with SMTP id 98e67ed59e1d1-3b0db6b8083mr4981632a91.24.1794025926246;
        Fri, 06 Nov 2026 20:32:06 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.31.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:32:04 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 1/5] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Sat,  7 Nov 2026 12:31:18 +0800
Message-ID: <20261107043122.25650-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107043122.25650-1-songmuchun@bytedance.com>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_203207_403786_FDD5FABC 
X-CRM114-Status: GOOD (  11.48  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vmemmap_populate_compound_pages() is no longer used outside
radix_pgtable.c.

Make it static and drop the unused dev_pagemap argument from
its only remaining caller to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
---
v3:
- Collect Reviewed-by from Lance Yang
---
 arch/powerpc/include/asm/book3s/64/radix.h |  6 ------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index da954e779744..8452a2714cb1 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -356,11 +356,5 @@ int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #define vmemmap_can_optimize vmemmap_can_optimize
 bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
 #endif
-
-#define vmemmap_populate_compound_pages vmemmap_populate_compound_pages
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap);
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ebac5f9058f6..2924604fbb38 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1117,7 +1117,9 @@ static inline pte_t *vmemmap_pte_alloc(pmd_t *pmdp, int node,
 	return pte_offset_kernel(pmdp, address);
 }
 
-
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node);
 
 int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, int node,
 				      struct vmem_altmap *altmap)
@@ -1132,7 +1134,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	unsigned long pfn = page_to_pfn((struct page *)start);
 
 	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-		return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
+		return vmemmap_populate_compound_pages(pfn, start, end, node);
 	/*
 	 * If altmap is present, Make sure we align the start vmemmap addr
 	 * to PAGE_SIZE so that we calculate the correct start_pfn in
@@ -1228,10 +1230,9 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	return 0;
 }
 
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap)
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node)
 {
 	/*
 	 * we want to map things as base page size mapping so that
-- 
2.54.0


