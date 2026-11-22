Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B84606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dhGiZqha;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QZejWEOo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=reL9mYJK/1m1y+g0uNeijZFVaLlYnX3xPlUy2DZTb6U=; b=dhGiZqhaochFoq0+sEscZ8xUhQ
	BHh4RNfFYc3BlmlUDz5uhwkM9ZkXHBMaD/Y8XEp+g+wbY8NkSlno7xIMsC8Ombw9OmuFyMr9+dRQd
	iO8dM5VMbITBa9jcGd6TwrDsgopjJtQDiWH0HemyW4etpMRGjNYCjuB/k6qSP6aRmGVVayVvYzXOr
	iI4Ro3j4BpR/R64Pzj6ri8eVQuy9Ci3gB0AWZUfmxReVuPr3YgC60QTpLu49K5dgR/hSPWS30s8cH
	++o4tMmN7qhLwq4DBu94GpkEofY8adzobm24oUXPkXmkGcvq8AuaDvo3MqCdVc/0XhIDKIajei/dK
	E88SRiPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYw-00000001YXn-3xeR;
	Sun, 22 Nov 2026 18:45:21 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYh-00000001YNe-1EBN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:04 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so1756637a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373102; x=1795977902; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=reL9mYJK/1m1y+g0uNeijZFVaLlYnX3xPlUy2DZTb6U=;
        b=QZejWEOoDcsdX3Cc1lhdYVVw4LuSqb9TKswTi9T3V9+sV8qWH/6IhHXk63RDtmQCuZ
         pNW178wXNivIffuFnF1IMPUKX2wGGV8tn7r7+NGrYtx8jy+n1EEt/1jGTBnqR53HbiS1
         mlJ/GnTHOM1VqQLzUH+bdKjArOHWWaRulLAILseM85H8Q1+5RS+f4RciE/VQNkwt73XR
         irF402I3H+NLVKSW95wrojtzseJh3qLFiQRtQ2RfQeU9PB6hw3mhgvBAvye/68MMWup+
         7gzrwnJILlT3gXTcBceki7McP/UgQjjtWKqPYpOsJ+/rX7FHLj+D4BptZEBTidQ/6Kuf
         XN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373102; x=1795977902;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reL9mYJK/1m1y+g0uNeijZFVaLlYnX3xPlUy2DZTb6U=;
        b=li9tjswwrbIJWR3JewNl8WXvznvM3yCKvpJLBqUEJ1gk+B2h3Y0O8bSf7+2WOvnbHy
         qj6hNSI0fySkAEjJSyME3KOsiXUas289v8BXUYWIxS9omg1JSUOYuhGWnCTIrKN9OuNL
         hvIbYC6J5RxvvBcMA/HknJx/2BLD7ArdMzTMkoOpZt/pIwTjpf51uDnRuw/fePW0UgxZ
         oLyW8cHk0ssSgevoQ6nTf8jBFeUO5IyDpEpNVL0JeR4fSvdYKyQYRBJpg/CtuHtFKyAr
         knLh3HS2qORyLqby//bdxtHfIXjGZDQXIYIQ3nlJnOHMdjXJhx0YW2vOLafj3j9T29as
         l4vg==
X-Forwarded-Encrypted: i=1; AL+hErFrjBUyqaUUFsFSs32/zgKMrW333iqPbbn5Hn5xjnkXip7JYIx8hRyQtWEqa47YXgdqXz/dVuf+3tkKzFQYzO5d@lists.infradead.org
X-Gm-Message-State: APuU4Z8RVHvhL+qjhrngmmqRXE+4OurujHBYBqhnPI40numrOoW3f3xp
	3MNnNjJYMaFKVb3FmXDyh740eiORbkWoxi3lpB5Q+bKGXRAw68WHXgZPPYq8kXNRyl2II1jTf7p
	wDGySGfsLo9bZ5WVtQV5Oig==
X-Received: from pjbqa11.prod.google.com ([2002:a17:90b:4fcb:b0:3b3:d1d1:2aef])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4483:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3b41c7bc7ccmr5465023a91.2.1795373101199;
 Sun, 22 Nov 2026 10:45:01 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:37 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-4-jthoughton@google.com>
Subject: [PATCH v3 03/19] hugetlb_vmemmap: Leave pages partially HVOed upon
 restore failure
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
X-CRM114-CacheID: sfid-20261122_104503_347139_45005051 
X-CRM114-Status: GOOD (  17.97  )
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

Right now it is assumed that the restore routine in vmemmap_remap_free()
will not fail; that is, if we fail to fully optimize a folio, it is
assumed that restoring the folio to its pre-HVO state is guaranteed to
succeed.

Although vmemmap restoration may never fail in practice, properly handle
such failure cases now. This will leave folios in a partially HVOed
state. In a follow-up patch, failure certainly becomes possible.

In the event we end up with partially-HVOed folios, make sure to:
  1. Leave the HVO page flag in place.
  2. Free any unused vmemmap pages.

Always pass the vmemmap_tail page to the restore routine to avoid
leaking the non-optimized vmemmap pages for a partially HVOed page.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb_vmemmap.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 7be08c68c2f1..2e9cf8d39c89 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -274,12 +274,22 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 {
 	const struct page *page = (const struct page *)addr;
 	const struct folio *folio = page_folio(page);
-	struct page *src = pte_page(ptep_get(pte)), *dst;
+	struct page *src = pte_page(ptep_get(pte)), *dst, *tail;
 
 	if (unlikely(!vmemmap_optimizable_pfn(page_to_pfn(page), folio_order(folio))))
 		return 0;
 
-	VM_WARN_ON_ONCE(folio_vmemmap_shared_tail_page(folio) != src);
+	tail = folio_vmemmap_shared_tail_page(folio);
+	if (WARN_ON_ONCE(!tail))
+		return -EINVAL;
+
+	/*
+	 * The folio may be only partially optimized, so restore only PTEs
+	 * currently pointing at the shared tail page.
+	 */
+	if (src != tail)
+		return 0;
+
 	dst = vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
 	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
 
@@ -325,6 +335,7 @@ static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
 	return vmemmap_remap_range(start, end, &walk);
 }
 
+#define VMEMMAP_REMAP_INCOMPLETE 1
 /**
  * vmemmap_optimize_folio - optimize the vmemmap backing of a folio
  * @folio:	folio whose vmemmap pages should be optimized.
@@ -340,7 +351,8 @@ static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
  * Note: The caller must hold vmemmap_remap_rwsem. If TLB flushing is deferred,
  * the lock must remain held until the final TLB flush.
  *
- * Return: %0 on success, negative error code otherwise.
+ * Return: %0 on success, VMEMMAP_REMAP_INCOMPLETE if the folio is incompletely
+ *         optimized, negative error code otherwise.
  */
 static int vmemmap_optimize_folio(const struct folio *folio,
 		struct list_head *vmemmap_pages, unsigned long flags)
@@ -372,7 +384,8 @@ static int vmemmap_optimize_folio(const struct folio *folio,
 		return ret;
 
 	end = start + walk.nr_walked * PAGE_SIZE;
-	vmemmap_restore_range(start, end, vmemmap_pages, 0);
+	if (vmemmap_restore_range(start, end, vmemmap_pages, 0))
+		return VMEMMAP_REMAP_INCOMPLETE;
 
 	return ret;
 }
@@ -402,7 +415,12 @@ static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
 		return ret;
 
 	guard(rwsem_read)(&vmemmap_remap_rwsem);
-	return vmemmap_restore_range(start, end, &vmemmap_pages, flags);
+	ret = vmemmap_restore_range(start, end, &vmemmap_pages, flags);
+
+	/* Not all pages may have been consumed */
+	free_vmemmap_page_list(&vmemmap_pages);
+
+	return ret;
 }
 
 static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
@@ -526,7 +544,11 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
 	ret = vmemmap_optimize_folio(folio, vmemmap_pages, flags);
-	if (ret)
+	/*
+	 * If ret == VMEMMAP_REMAP_INCOMPLETE, the folio might be partially
+	 * HVOed. Leave the HVO page folio flag in place.
+	 */
+	if (ret < 0)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
 
 	return ret;
-- 
2.56.1.809.ga0b61035b5-goog


