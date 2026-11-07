Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34418606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jhjaoqdk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XpQgK1ul
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1yTgtDF6jEtnEd1/HsYlbR7LkWEKWDRmQNU783tsnwk=; b=JhjaoqdkoD3Jxp
	7+p9RZ1u5Go0kKdknWjZjxbOtijwL83TLakEwqar6PYmrZ7WuZzTU3p5j6p5jZbEyH84XB9A2iqfa
	WeSTVoUg+sFz6FLZ56vdXAiohJjWG1bvZX6pFgMqoRz01cv3qhCMGAUCPUMfC4Y96aeWdGIcarcJO
	FyJ+4OZ7TZKuIB47De/S1Tv6b9gv/8A5zG2ASy5mBtXLOZuGzfon0sgc0HYeLRHef6qz+PLFbmz1L
	lh1NS/8fdcUf8sYKMtAsJQcFkqNjIciGeuKJjcwYay1o5/OgxnyTgpZ3p9F5b2jBrZ1yeNnCH5CzV
	i33KCpbv8IN5KWHwjr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgo7-0000000Ekzp-31O9;
	Sat, 07 Nov 2026 13:50:11 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgo6-0000000EkyX-01it
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:50:11 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-3704d30b84fso1210604eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 05:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059409; x=1794664209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yTgtDF6jEtnEd1/HsYlbR7LkWEKWDRmQNU783tsnwk=;
        b=XpQgK1ulsngTEzU7nfkcTEDH7ePE0WGvaU6z1cBrEsHw/1vnEE5x6IA6DEvyJa62DU
         4/HlrzX8GVxMekOEC7swHRA26bqQX084CqlFPdN5vaIQu0tUgO1OomzMcYBQ6UVkoTDK
         5WtkGBS67tA3ZX1+F1clInT+CoiYkvnnmWRcc7wcCb157OsgeToRJ/wF+mMAFyaeHq1b
         OteYn4xnArUzjI+NIwTzUXa60wqWeMvfzrV/Y/WNgzm1MikBu1ddP2csNPhfiiEIToxz
         Z38IFGXHG//RMhX6zydclZzIi9GiALcxAm0qWaD3YjgXhygPpyboHaaRXgQfbb9DxIPJ
         4T+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059409; x=1794664209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yTgtDF6jEtnEd1/HsYlbR7LkWEKWDRmQNU783tsnwk=;
        b=nq5Vo1xvuMnv74NRJXaQ0qcr7jBLhWZL48cYE0rKeVK/f+qVXt71J11PIto6iZS+vB
         yZjNrtZaqPs0v5R7KERo3aHD8uVjraTwY2NPBmSNO+1RAx54Qdb1iOpJk7gT7OEgUsBC
         rDRRHF545Pa4MqMYzibA7wuwAswSxJr2/h6+662zsVqeHqd1wSqG6ltOztDg5g0/Estt
         Z/QBdUCfHWxSXnJoPs59IOvCgFdh+1GGj9GK7weFrrNnjLCV+xM/8qI+zO6VKLL62b6T
         pieoPbaT9iRTZQP+Iwu6JFEUQ9PuvmDRtqpalgn2w0AnttoTAk/t+HpUnmj6L9eXzOgb
         UE0w==
X-Forwarded-Encrypted: i=1; AL+hErGmkL64RQx2GXn+Qy6U/XsxSOLMMHNpleDUy6nQkKpb2IDWD9q67SjlP+7NJUGN106kboOu3n2tRhbW4pFEGgUE@lists.infradead.org
X-Gm-Message-State: APuU4Z9psRC8y7KAJX32kYadJejycRdzL9AwpE6CZGJK1njXjng80LtT
	3wiRy+PCrxgK7fUL0twg2GmeSsCZtHCYJmRNdeUDNAI4gO2aJhLBGUmw
X-Gm-Gg: AYBFou0jPsTcRcqS0F9DEK7Tn3SVLf0nsFJcxsjJWdIEXQwTqR9TY38rTln7tgeO+Dt
	GYfuGd7+gavQHTBCNMb9rn8dfJ+JaqjZSCKRJbxSZHx3rSd2DcNL+lZfN/KT1JJYKBYPmHzQbuJ
	tAYh8FzVCCErZDTlJ0nSBXZO2eX/GJYb1Stgyht5oElVWfoXS7x1GFOA3xirbWttqbd8xYR3Jnh
	kWwegIMa6JDWgmJE9o0yQ7KAkEB8go94kzRUGWzvPKXyRf7hXxe+XPdTzY396WtnqTwv2p/q+JT
	oPA5MhKvH3KTC9MlhsjXldfHRj9AErykNlDafR6zchNzzwMobBzCG2SWAos5DXyhrQ3LCSUc4yF
	0Jdqru7KdL3I5g5kbGlR4rmJIE2poZg3XK6IfS1L4Te2uYYd6KhzipclZQQZGEIxoPsiR+1cXWS
	iwwGGTQ2+P69PeobIiluDuzLlCucU64nzNSAUGPRXaju2SpZNy0pblDslLcnwmYS+3drK10LnCW
	ExGm1tMXkA+HnNRu4mA3HrPSCK83CFeb6xI/dgU+h+Htv14Ad4pxorTlry+TgVeDgrfgyms7O5j
	VON4evze5GcyrqOvuJ5LDy9tPrRdx/CsJKYlkdd1rFh7AZr5GC9nFfWw7g==
X-Received: by 2002:a05:7301:70b:b0:36d:4560:dd38 with SMTP id 5a478bee46e88-36f765216bbmr6889124eec.37.1794059408773;
        Sat, 07 Nov 2026 05:50:08 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:08 -0800 (PST)
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
Subject: [PATCH v12 01/10] arm64/mm: add vmap_pte_set_huge() and vmap_pte_clear_huge()
Date: Sat,  7 Nov 2026 21:49:44 +0800
Message-Id: <20261107134953.748622-2-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_055010_061624_CF89C672 
X-CRM114-Status: GOOD (  11.10  )
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

vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
unavailable on CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to
HugeTLB internals it does not otherwise need.

Add vmap_pte_set_huge()/vmap_pte_clear_huge() to arm64, joining the
existing pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
__set_ptes() and __get_and_clear_full_ptes() directly, so they do not
depend on CONFIG_HUGETLB_PAGE.

There is no caller yet: mm/vmalloc.c is converted later in this series,
once the generic fallbacks are in place.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/pgtable.h |  6 ++++++
 arch/arm64/mm/mmu.c              | 27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a474c9fb485ad..ce51c1b9be222 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1927,6 +1927,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+#define __HAVE_ARCH_VMAP_PTE_SET_HUGE
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		       pgprot_t prot, unsigned long size);
+#define __HAVE_ARCH_VMAP_PTE_CLEAR_HUGE
+pte_t vmap_pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size);
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_PGTABLE_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 140520b351e28..66b23c78f0951 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1912,6 +1912,33 @@ int pmd_clear_huge(pmd_t *pmdp)
 	return 1;
 }
 
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		       pgprot_t prot, unsigned long size)
+{
+	unsigned long pfn = __phys_to_pfn(phys);
+	pte_t pte = pte_mkcont(pfn_pte(pfn, prot));
+	unsigned int nr = size >> PAGE_SHIFT;
+
+	VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
+
+	/* For vmap, there is no valid -> valid transition */
+	VM_WARN_ON(pte_valid(__ptep_get(ptep)));
+
+	__set_ptes(&init_mm, addr, ptep, pte, nr);
+}
+
+pte_t vmap_pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
+{
+	/* Kernel mappings only */
+	VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
+
+	return __get_and_clear_full_ptes(&init_mm, addr, ptep,
+					 size >> PAGE_SHIFT, 0);
+}
+
 int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 {
 	pte_t *table;
-- 
2.34.1


