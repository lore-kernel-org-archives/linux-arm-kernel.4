Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F268A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jPwWb4dD;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h3j78e6P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TxPlxxAqJE3tW6UmldmaY6HGp5vlDJN47buBYWjQlQE=; b=jPwWb4dDr/N18eGNGpJTA25uTU
	kBbCST9Gik3MqvtN7gmweY0NrRnFNAK0cblaGjTjY6YefRXI5i0PJV1KA2z7QYYraK8yr88IBQJ0V
	SINQSa8QKZPfwzcAXWeAQVTPJndHgPGQ6dm2M6Nqd6oG+rx0nnIYoqua7N7r+E6iaCToPJuQy3tbh
	za9/AaJx2pMEOsAgNsRvEyXWmQbsTmp8j4GmuMusa4KLqeIzdGu2R6cHls1TbpZGHoS2DTaFnDkcl
	yqxbzNwVZRvV+5yh5/X1TBFB6uCe7MztXCRv6XIBz7+7p1AKq9QGBTm/OOGQNaAhDAz6evl2z2dZl
	Bm7dcFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ7-00000001Yku-1A4Y;
	Sun, 22 Nov 2026 18:45:29 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYs-00000001YUF-3t4M
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:16 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2ed08904845so37289245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373114; x=1795977914; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxPlxxAqJE3tW6UmldmaY6HGp5vlDJN47buBYWjQlQE=;
        b=h3j78e6PepbOowlHzLtMJlHwuwSmHA5LdsbI9XxPqsvAsCP6MSkpR9nwH6x9RBsz8f
         rmS1fvBsG5zYr9NkW9WJVOepjbb83dACuSw9FSTfFDBHxJLzUPapCZ6FAzqbRaHXOtga
         xj2MsRVxRPKwHqIuLCMzCMGJWHHrDxOKQsSbyxdYpbXhIgB7gFKaA0nfSz0AgUsfhjOJ
         gOwAvh04/+moIXjm6SAav+aUfeVVj9cUd7fgMRYTG3FjUs34sjpKQRFonP6CP1xabvcR
         +8nXuAEvEP0100JA2rGx4PdZezAdBlP1Uy/EJ8T/Aaib65CCRl/q3BqKphWgBqC9akC1
         L32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373114; x=1795977914;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxPlxxAqJE3tW6UmldmaY6HGp5vlDJN47buBYWjQlQE=;
        b=a25RRT9Sa9uW/aPAiIz/xKVhvI9A9gEtSYtctT8KmTAzOrw7Bp2+KCLjCMSaDS5nkK
         /QlW9I2sr6T0p4D8+jc5ArcGIpsppYO8sdSjF5Hm9axWdjFLd/Q1LiojgEBYV75VRUEw
         X3AJS5vVmGyUicu/AyBMoa1kx9838QRIEsAuXSFQ/pGL097zFkL4S2FkuKwK9nwDQtge
         aTpvy0aXm+e5w8KCyQgb0MbRVFYqBXk5iVAOeyBzfB6rAVnuqbkcWwApKCuxIR8fxrFX
         HreRexhYPYuQpFLyS6/PiJukOEmcJ6+NnxyCbcftFOu0qKP7LermxTGYd+iUl7lyULXu
         Vbmg==
X-Forwarded-Encrypted: i=1; AL+hErEtMlkaZe7TGt2O51HnmCGNoAED485+GpmZHamNewssDVqr7WNkwooOxHqdQnVf1FxVpn6+cO0n1+dkya6hW9bk@lists.infradead.org
X-Gm-Message-State: APuU4Z8rU4bFFyIy46RrFH+r2ssXcvCYwggLocVp2JZpo3ljjFaMzdil
	NxkYjXxYJs0UJoOtzQDghgHGnITYLC/7gpmSWfv+qXrHIyuF/I51hY+/aKOmjOshPL54Dylh0yH
	xG2YhY1BGGqEbjq4MJrEhkA==
X-Received: from plfn5.prod.google.com ([2002:a17:902:e545:b0:2ef:d037:6013])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d2cf:b0:2f0:25ea:8fb3 with SMTP id d9443c01a7336-2f03efb1073mr100873735ad.1.1795373113358;
 Sun, 22 Nov 2026 10:45:13 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:47 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-14-jthoughton@google.com>
Subject: [PATCH v3 13/19] hugetlb_vmemmap: Add fault injection for in-place
 vmemmap PTE updates
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
X-CRM114-CacheID: sfid-20261122_104514_976156_A0F662F3 
X-CRM114-Status: GOOD (  18.88  )
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

try_update_vmemmap_pte() may fail, e.g. on arm64 when the update keeps
racing with hardware access flag updates. HVO handles such failures by
rolling back the optimization, or by leaving folios partially optimized
if the rollback or a later restore fails. These paths are rare to hit
normally.

Add a fault-injection capability, fail_hugetlb_vmemmap_pte, under
CONFIG_FAIL_HUGETLB_VMEMMAP. When a fault is injected, the PTE update
fails with -EAGAIN without touching the page tables, as if the in-place
update had given up.

It can be configured through debugfs or through the
fail_hugetlb_vmemmap_pte= boot option, the latter allowing failures to
be injected when optimizing bootmem folios.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  1 +
 .../fault-injection/fault-injection.rst       |  6 +++
 lib/Kconfig.debug                             |  9 +++++
 mm/hugetlb_vmemmap.c                          | 38 ++++++++++++++++++-
 4 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..b8a8771631c0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1694,6 +1694,7 @@ Kernel parameters
 	fail_usercopy=
 	fail_page_alloc=
 	fail_skb_realloc=
+	fail_hugetlb_vmemmap_pte=
 	fail_make_request=[KNL]
 			General fault injection mechanism.
 			Format: <interval>,<probability>,<space>,<times>
diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
index c2d3996b5b40..403206645fa4 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -16,6 +16,11 @@ Available fault injection capabilities
 
   injects page allocation failures. (alloc_pages(), get_free_pages(), ...)
 
+- fail_hugetlb_vmemmap_pte
+
+  injects failures of the in-place vmemmap PTE remaps done by HugeTLB vmemmap
+  optimization. (try_update_vmemmap_pte())
+
 - fail_usercopy
 
   injects failures in user memory access functions. (copy_from_user(), get_user(), ...)
@@ -263,6 +268,7 @@ use the boot option::
 
 	failslab=
 	fail_page_alloc=
+	fail_hugetlb_vmemmap_pte=
 	fail_usercopy=
 	fail_make_request=
 	fail_futex=
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec13a..a6a9bc01a320 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2098,6 +2098,15 @@ config FAIL_PAGE_ALLOC
 	help
 	  Provide fault-injection capability for alloc_pages().
 
+config FAIL_HUGETLB_VMEMMAP
+	bool "Fault-injection capability for HugeTLB vmemmap optimization"
+	depends on FAULT_INJECTION && HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+	help
+	  Provide fault-injection capability for the in-place vmemmap page
+	  table updates done by HugeTLB vmemmap optimization (HVO), i.e.
+	  try_update_vmemmap_pte(). This exercises the rollback and
+	  partially-optimized folio paths.
+
 config FAULT_INJECTION_USERCOPY
 	bool "Fault injection capability for usercopy functions"
 	depends on FAULT_INJECTION
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index a01377c37c96..4cacd7aee719 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -17,6 +17,7 @@
 #include <linux/pgalloc.h>
 #include <linux/rwsem.h>
 #include <linux/vmemmap-optimization.h>
+#include <linux/fault-inject.h>
 
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
@@ -44,6 +45,39 @@ struct vmemmap_remap_walk {
 
 DECLARE_RWSEM(vmemmap_remap_rwsem);
 
+#ifdef CONFIG_FAIL_HUGETLB_VMEMMAP
+static DECLARE_FAULT_ATTR(fail_hugetlb_vmemmap_pte);
+
+static int __init setup_fail_hugetlb_vmemmap_pte(char *str)
+{
+	return setup_fault_attr(&fail_hugetlb_vmemmap_pte, str);
+}
+__setup("fail_hugetlb_vmemmap_pte=", setup_fail_hugetlb_vmemmap_pte);
+
+#ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
+static int __init fail_hugetlb_vmemmap_debugfs(void)
+{
+	fault_create_debugfs_attr("fail_hugetlb_vmemmap_pte", NULL,
+				  &fail_hugetlb_vmemmap_pte);
+	return 0;
+}
+late_initcall(fail_hugetlb_vmemmap_debugfs);
+#endif /* CONFIG_FAULT_INJECTION_DEBUG_FS */
+
+/*
+ * Inject failures as if the in-place update lost a race too many times
+ * (see the arm64 implementations), without touching the page tables.
+ */
+static int hvo_update_vmemmap_pte(unsigned long addr, pte_t *ptep, pte_t pte)
+{
+	if (should_fail(&fail_hugetlb_vmemmap_pte, PAGE_SIZE))
+		return -EAGAIN;
+	return try_update_vmemmap_pte(addr, ptep, pte);
+}
+#else
+#define hvo_update_vmemmap_pte		try_update_vmemmap_pte
+#endif /* CONFIG_FAIL_HUGETLB_VMEMMAP */
+
 static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 			     struct vmemmap_remap_walk *walk)
 {
@@ -274,7 +308,7 @@ static int vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
 	 * after it. The refcount is zero, so the cmpxchg fails and leaves the
 	 * page unchanged.
 	 */
-	ret = try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
+	ret = hvo_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
 	if (ret)
 		return ret;
 
@@ -313,7 +347,7 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 		return 0;
 
 	dst = vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
-	ret = try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
+	ret = hvo_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
 	if (ret)
 		return ret;
 
-- 
2.56.1.809.ga0b61035b5-goog


