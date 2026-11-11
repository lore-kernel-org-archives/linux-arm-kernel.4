Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65B7606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zb5JfOww;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qJY77vGW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=laMYshk/IpUNzmzRXv9ltVTwYgsKb/6KaHojH4Vu9w4=; b=Zb5JfOww55wR5qvwVfl7+XlPx5
	AaZn53lKsMlG2WOGdUJcZxe7ptQXdsmvWzh+0OjwoDMEU1dPZ3NPV3llYh1iQMhzqUylPRuv5g2YQ
	uFK3fEzra/GRlUqFdAKIyD/XoQK8xzO3JxGLJkFWI6YmBMYVCj+fCkiwmxSerDiftFMCmH/Q+cKo9
	/Wlj6WkyRgBZH/IMqushjFD870lHG6RiwEuXMKsIo8hAOVAoF0fouYrx7pNR5FK+p7I/DCKfhOznf
	bevvfgNI5rGrdyUqfi7CvhM5U/dClGBWTTZUHfBMVFsF/odrOF42gNuSIK6ByAAbAR1AKSxk7fgTB
	6fFdaNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6CA-00000006R3N-44iJ;
	Wed, 11 Nov 2026 11:08:50 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6C1-00000006QuK-157l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:08:42 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4b9f7cace4bso28429305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395319; x=1795000119; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=laMYshk/IpUNzmzRXv9ltVTwYgsKb/6KaHojH4Vu9w4=;
        b=qJY77vGWjX6jgYAdJW3EkYNUvfwK9KF/hFzUSr1oKctHjFDmBQ3mS9g2M8mC3sG3FZ
         HtEDefJK25s1zlJb60Prf1tCRLsdCyRgVHJvvLeP2urY4ZWgyh33zrIxzUur3cZjta7u
         9YxlgmguV+6ckedpZAkmnY1ABxI219theZ+erAsBzdSL5ZF+VH6tGP/ZRP+ciHICkO3o
         ciDGpT3kPjNVYENrg0AhcTARNflf2jSYx6QdnYVI+VuCFXZdeHNkP6x8H6YRAu2e+Ae4
         MSSsUI3ZXHKjC3AScF+ntIZQ2KOm2nNHG2KcakInKKyI01eUtrNmTJe51HKkPHg9t0G+
         i6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395319; x=1795000119;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laMYshk/IpUNzmzRXv9ltVTwYgsKb/6KaHojH4Vu9w4=;
        b=Z2o0rlu2PR7PHNMiHm9G/5rrBJtx6NjnsRQ6b8F5pSOyux/8SjC0/EnwQM3izCUjBx
         91Kx9YixMOFv9GI55lo+97oEKNfz/6Q/PfBegnZMg+Dba7lFfWWSdqlAv//KSkI57TaJ
         wantUB9IWZDQhDj8wpQPgF9UXaTgsbfzkgw+fCvoWoO/+fcwYrJc0wQx6OgX1rj3Biio
         dGPCdJyCo1xcVHYXdefcgSQhoQZrDePD+JlAOkGToU3KPvgpcLKx6MDdF661Mekzf9nC
         8H/JlKQVPgFj87C/fBQugl4WlhnyE++YLZj8l+ZX7qHo9LkQmTA6t7P/M0rOrwBE6NXQ
         L+dQ==
X-Forwarded-Encrypted: i=1; AL+hErHIqGjzlQEz9jNPvSqushpPK33gfxQotwFlUj4yv1NrB/hfW2GJpPJFwjvfwz2+IpJ5XoQ8UWzOLIZpXh4LMEI3@lists.infradead.org
X-Gm-Message-State: APuU4Z/rUcaW7yRusF28bUFd7FBKhEwYB1QCnoi0Rze1gMRP9iA3l3tb
	9yU9AovJPBSChDM2/U/0EVkB75VrzJFL9NAHn6FkFzR4qAOAHfMHT1vbD7gXQzi32/9IlIkQAFm
	cvREUk70ls67BKjfH84Qxkw==
X-Received: from wmbgx4.prod.google.com ([2002:a05:600c:8584:b0:4a1:cf4b:72c2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1912:b0:4b2:612d:908c with SMTP id 5b1f17b1804b1-4ba093d13f1mr36933745e9.34.1794395318533;
 Wed, 11 Nov 2026 03:08:38 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:36 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-7-vdonnefort@google.com>
Subject: [PATCH v3 6/8] arm64: Introduce direct_map_is_ptemap()
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
	ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_030841_322531_4DEEB480 
X-CRM114-Status: GOOD (  12.83  )
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

Regions marked with MEMBLOCK_PTEMAP are mapped at page granularity so
their direct mapping can be modified without splitting blocks at
runtime. Introduce direct_map_is_ptemap(), which walks the kernel page
tables during init to verify that every page in a range is backed by a
present non-contiguous PTE.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/set_memory.h |  4 ++
 arch/arm64/mm/pageattr.c            | 65 +++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 0091ba12200e..b6ec938703d6 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -3,12 +3,16 @@
 #ifndef _ASM_ARM64_SET_MEMORY_H
 #define _ASM_ARM64_SET_MEMORY_H
 
+#include <linux/init.h>
+
 #include <asm/mem_encrypt.h>
 #include <asm-generic/set_memory.h>
 
 bool can_set_direct_map(void);
 #define can_set_direct_map can_set_direct_map
 
+bool __init direct_map_is_ptemap(struct page *page, unsigned int numpages);
+
 int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index de7bf95003ea..c7662fd2fcb2 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -102,6 +102,71 @@ bool can_set_direct_map(void)
 		arm64_kfence_can_set_direct_map() || is_realm_world();
 }
 
+static int __init direct_map_is_ptemap_pud_entry(pud_t *pud, unsigned long addr,
+						 unsigned long next,
+						 struct mm_walk *walk)
+{
+	if (pud_leaf(pudp_get(pud)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int __init direct_map_is_ptemap_pmd_entry(pmd_t *pmd, unsigned long addr,
+						 unsigned long next,
+						 struct mm_walk *walk)
+{
+	if (pmd_leaf(pmdp_get(pmd)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int __init direct_map_is_ptemap_pte_entry(pte_t *pte, unsigned long addr,
+						 unsigned long next,
+						 struct mm_walk *walk)
+{
+	pte_t val = __ptep_get(pte);
+
+	if (!pte_present(val) || pte_cont(val))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int __init direct_map_is_ptemap_pte_hole(unsigned long addr,
+						unsigned long next, int depth,
+						struct mm_walk *walk)
+{
+	return -EINVAL;
+}
+
+static const struct mm_walk_ops direct_map_is_ptemap_ops __initconst = {
+	.pud_entry	= direct_map_is_ptemap_pud_entry,
+	.pmd_entry	= direct_map_is_ptemap_pmd_entry,
+	.pte_entry	= direct_map_is_ptemap_pte_entry,
+	.pte_hole	= direct_map_is_ptemap_pte_hole,
+};
+
+bool __init direct_map_is_ptemap(struct page *page, unsigned int numpages)
+{
+	unsigned long addr, end;
+
+	if (!pfn_valid(page_to_pfn(page)) || !numpages)
+		return false;
+
+	addr = (unsigned long)page_address(page);
+	end = addr + PAGE_SIZE * numpages;
+
+	/*
+	 * Called during boot before runtime linear-map splitting, so it is
+	 * safe to walk the page-table lockless.
+	 */
+	return !walk_kernel_page_table_range_lockless(addr, end,
+						      &direct_map_is_ptemap_ops,
+						      NULL, NULL);
+}
+
 static int update_range_prot(unsigned long start, unsigned long size,
 			     pgprot_t set_mask, pgprot_t clear_mask)
 {
-- 
2.56.0.542.g3ef89b7020-goog


