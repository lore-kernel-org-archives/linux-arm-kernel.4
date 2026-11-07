Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B93606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e1kPMalu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7GCazm3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aqN7aZ8iVALpTxJjSlPOIKNge5VZrwlYvXTmPXr+N8o=; b=e1kPMalusCpWuw
	GdusVxzat+OJKMQ2Iqn0CXc7CHZqFnj6q5WQ6HWX1LxXfgFELbrq28gdsE3KKLmXAvKwUJz2d2WyD
	TXT+Lu5H/uGRRB5g3jyZC/G0ansjiPJ4ymadNrH7X6E+jzX/WtkR6bbpAlXNTXHz6V/+w/dcVKTgy
	O0NnfP7uzkHarCHfO7nnRCa+k7aiKLVkzcXc6vS2L8CFtPGLDbjUqhAgIprlQaJIuQHAl/Iy0cSrF
	2ZRyI4ehihMbZw+ekbL7w1oGVEBdgoQBOa5mosr4tSf4P8BKUydc4sLcFl9dM2UCttXNto+ifKcB7
	VvLj12Cmr4EsLzb3gzhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgoD-0000000El1k-3RnT;
	Sat, 07 Nov 2026 13:50:17 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgoC-0000000El0t-1GWX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:50:17 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-37071c0f42aso2118613eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 05:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059415; x=1794664215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqN7aZ8iVALpTxJjSlPOIKNge5VZrwlYvXTmPXr+N8o=;
        b=n7GCazm3Eu6QCzyHSrPnmgRAi+7bMSJLW7ZOZ02YoXArSuEJc5ndequYjhKeP0D3+S
         oeTxnaiy+Jm3T5VeRM1wEJhQJINlFuDTAP2La+dHslw1zAzpH4rV6vY5JyPfXQUDvKgZ
         SE0XxevOpUnPDl7BKNb9x7tbaptenKe88zpE3G8eurS/3JyhvSAwXBpJhroD2qKtzAcv
         9PLU5/5xrzyc0g8bQ/IQ9e/FUc3jzMtPV/rEtn5nVJnQ+QUSDV6gEuC+J5kG+s5oCC2F
         APvVA1B2tiaW7sYATpCniaEpfWeRQNoAcQBYWRY3UohiFbE+OKz5WKd6NxFM7LDidibO
         yC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059415; x=1794664215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqN7aZ8iVALpTxJjSlPOIKNge5VZrwlYvXTmPXr+N8o=;
        b=KbTQiv4ky6H5DYfqbKDW9QpKd8jS1FLLuyNuLfQYT1mUFegvWD5ePzRBp44JpW79KQ
         gzK1zz3FPUjE3rl2EK7EO5leNyiDR+UFiQwnEtE8wFfotl5QfiQ/Lg+4puaJ9195lJBK
         gfQ8xENryKINJcjmDqgUEhtyIWxTxxYzZiEWxjGpZVXSSNgbgPsg91zXUXPMQU3mG5jd
         vCYC3Y6TvnrUyiH83CkKPmrqCQiTDoi89w1aEH+R17Xjpn6haVwF5Q0vleN/mlvJhv95
         5WTvHxnlI5GCBWUtnX+aq8vtawpxN59hCV4p31o0byvDhAYzF5B81WCOkJum+kuR5nsO
         4U5A==
X-Forwarded-Encrypted: i=1; AL+hErFCTaCHzY4AX8r9E+WN/gKdGsxmUVdFfzDY9Jh2Mc51wvua8t5eknphc0DypFBeTQ5JHnKyLwkTEPVeyMtjoSv3@lists.infradead.org
X-Gm-Message-State: APuU4Z+o0kVy2wcYPZTcCVt628zFlBUGcZtsH9EW++/XcxvY6BJ7jpIq
	2fkl4oxyrZms/7i3BYxgkoC3vit6hOMfdGRGGXWOr6HXm6jC8CPKQ4pw
X-Gm-Gg: AYBFou0dnyeL41aytZBUk6gyPJYeQg3ww4O7m2XDerjWW3+STy2wumlJ1tBJo2aP2zG
	r/rJ4LabhOv+beI16foRATGuOfKWVB/bjwXcgwEESsUfE3wpRQBSJWy6Oazl6pTK5/xKbfg1kXy
	Vtr0hY4+WtxiXySihmUa/xviX1GuZGMUAB6leesTiJQ1FWVMtliHR9jIXyfivghwebNzyOiGTKV
	yR5P6cKSYqB0VDrAcBfNwO998gRDp25bDbXi9GuLDXBqKtBXxvF61+bCjwqTitx0nYCw70v4Tvx
	Aa0DU7osG+Nc7ca/ED467bDYWohHxrO5a8Uks90WvLQlsOiPexSX9gMa5sqVd5/7PG7kl09ux4E
	AwRXzY5wXoAP5I3/1+XnnQ51Z+DiPWht43bAemqwp4aGhfamsSrJpDEomZYyfyR5+q0aHJswip5
	TL0032HutqS4134e+iNwSZsCboQ6zkZVMkLLxKrDltS/MDzKNJBmX2DAbLZW9k7Ce6FedE2eW1Q
	6YhLWb1tJLY7KvPaATJZ+zbAEupkADekrR7+PgPHhjBSHxhJ8Nrgsc/Lkz43c70WiriuoNss3fi
	hHyH0u2qDYs+CrjxbuiVne8WNypDkqkbbICMNOx2PtLl6t60vDMXMgEKHQ==
X-Received: by 2002:a05:693c:20c8:10b0:36a:30b:5dc0 with SMTP id 5a478bee46e88-36f75838341mr7149731eec.24.1794059415250;
        Sat, 07 Nov 2026 05:50:15 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:14 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org
Cc: baohua@kernel.org,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	rppt@kernel.org,
	leo.yan@arm.com,
	xueyuan.chen21@gmail.com,
	chleroy@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ajd@linux.ibm.com,
	jiangwen6@xiaomi.com,
	jiangwenxiaomi@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 02/10] powerpc/8xx: add vmap_pte_set_huge()
Date: Sat,  7 Nov 2026 21:49:45 +0800
Message-Id: <20261107134953.748622-3-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_055016_347323_B11C68CC 
X-CRM114-Status: GOOD (  14.73  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wen Jiang <jiangwen6@xiaomi.com>

vmap installs PTE-level block mappings (SZ_16K/SZ_512K on powerpc/8xx)
by reusing set_huge_pte_at(), a HugeTLB helper gated by
CONFIG_HUGETLB_PAGE. This makes the feature silently unavailable on
CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to HugeTLB
internals it does not otherwise need.

Add vmap_pte_set_huge() to powerpc/8xx, next to the existing
pmd_clear_huge()/pud_clear_huge() in mm/nohash/8xx.c. It builds the huge
PTE and writes it into the backing cells directly, without going through
set_huge_pte_at(), so it does not depend on CONFIG_HUGETLB_PAGE.

No vmap_pte_clear_huge() is needed: 8xx does not implement
arch_vmap_pte_range_unmap_size(), so the vmap unmap path never takes the
PTE-clearing branch.

In practice PPC_8xx selects HUGETLBFS unconditionally, so
CONFIG_HUGETLB_PAGE=n does not occur there today; this is a decoupling
cleanup rather than a new configuration.

There is no caller yet: mm/vmalloc.c is converted later in this series,
once the generic fallbacks are in place.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |  4 +++
 arch/powerpc/mm/nohash/8xx.c                 | 29 ++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index e2ea8ba9f8cae..141336d30cc76 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -235,6 +235,10 @@ static inline pte_t ptep_get(pte_t *ptep)
 }
 #endif /* CONFIG_PPC_16K_PAGES */
 
+#define __HAVE_ARCH_VMAP_PTE_SET_HUGE
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		       pgprot_t prot, unsigned long size);
+
 #endif
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index a9d3f4729eada..b12e2829c08ed 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -220,3 +220,32 @@ int pmd_clear_huge(pmd_t *pmd)
 {
 	 return 0;
 }
+
+/*
+ * vmap PTE-level block mapping. Sets a present kernel mapping directly,
+ * so unlike set_huge_pte_at() it needs neither CONFIG_HUGETLB_PAGE nor
+ * set_pte_filter() (a no-op for non-exec kernel mappings).
+ */
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		       pgprot_t prot, unsigned long size)
+{
+	pmd_t *pmdp = pmd_off(&init_mm, addr);
+	pte_t pte = pfn_pte(PHYS_PFN(phys), prot);
+	pte_basic_t val;
+	pte_basic_t *entry = (pte_basic_t *)ptep;
+	int num, i;
+
+	pte = arch_make_huge_pte(pte, ilog2(size), 0);
+	val = pte_val(pte);
+
+	/*
+	 * Make sure hardware valid bit is not set. We don't do
+	 * tlb flush for this update.
+	 */
+	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+
+	num = number_of_cells_per_pte(pmdp, val, 1);
+
+	for (i = 0; i < num; i++, entry++, val += SZ_4K)
+		*entry = val;
+}
-- 
2.34.1


