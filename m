Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60920606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QTWG+Zg4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SIE11goT;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hiIURQlN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JlyKIxCj5zXNoCwp2g1iooTjwoRbShhDI27qMEz7zxE=; b=QTWG+Zg4avEh0E5HMIg2IEiqHR
	FnPta4e24Uz4Onruwc+H69pEumXg8C4r/zLa2Bh2wIRFn+jbTNXH+/yPx2gUljU2wrzU9T8BZjFhp
	XGbuDkozyDKZuuaVFsiLFWRVz8s9zPuEuprBmg3ZIO2izLW1jwBJIpqHHyjAL/1GSok2OHhF25aiE
	gEWtMUYQ3dpJ9nZHvxNZ8O+hDOMKaJNOOLqDjLJVzB7hxSsAt5Vyt3SCf/BkSrXSk9kp+l0QmJqtv
	3nayFsTz/uzUQE/lt/MXTPUZpR+BzoRSIsEgWgkhdjYf0OBubg2YLMS3oAi3DVf/M/PvuKtZnx2I+
	iwDcKmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCal-00000001ZtU-2R8L;
	Sun, 22 Nov 2026 18:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ2-00000001Yde-1pQC
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JlyKIxCj5zXNoCwp2g1iooTjwoRbShhDI27qMEz7zxE=; b=SIE11goTskvBC/k++UPkl9XTDV
	wr6n1gSCxMWhXmK/vnCX5BzUsMXeiE6LCVpC8djX/1szZFH8DOLf38EEwnkcBt5Um5FwbkRTwE1kx
	xoWNGVWHHhlZIyyteZ3KNzeLFhn/2sZfW4By6UkC53/lbGY0LZVCO7L5ctc9BAf3FBA6qAgueNFHX
	hwKivKFRd6PaYtPQKso1SC/PJlL4y6yhYTiPGu5GfUKjI+CbfDtUWIO/DktAiinkugo0cJ/dm4as0
	Qb9mHvH6x7RDBeGXrIFUIeaqX0GbEgoGZ6gFE6J08WmnXYZnT3OlsURMhmmH3FS/0mavhshFDNDwk
	gmRMTpqg==;
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYz-00000002RGk-3CSH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:23 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2ed08904845so37290325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373119; x=1795977919; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JlyKIxCj5zXNoCwp2g1iooTjwoRbShhDI27qMEz7zxE=;
        b=hiIURQlN1M8zQLY8tX4YFAk+pmvKi7LWoxWuaMDDb8jjWD6ODL4ti7W4/FF+xDDD/u
         X6fgqO1g4cMOZ2Qjeakei35D6/fSvjxB/4zEy8i8R93OtSoTPWWPdIAAb+gLUNKgzvrI
         JTs2GbpIEBIshx5KxgsLflcuXW1dZTM0txRFwWHJ+isqyb9C9aigJvVe8Cl+O1yhSB6A
         BZZmy6TKW+Ha2n97tMVtONtmwPnpNViVU4ykLX0uQV9E1/T7d2MVJS7wBFp5IVuJsAzw
         J8mFTQZDEM7Gc+kOyeqgRAS7naHOQgQEonHZpj6ToMkgUtWryyQNd7/7QNxx9LJtXXqC
         sUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373119; x=1795977919;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlyKIxCj5zXNoCwp2g1iooTjwoRbShhDI27qMEz7zxE=;
        b=lwCzKV3qBXIO2qqX+GqwgbI4jjJ+L6/LzNBi7JOo9jJkEfIzRtsInmUiCyipmQeVYn
         FFh22c6nerjgMo6hfbShaS7/M+dmXXHJ35kVkCWptls3v53RunG0iLL8WEnQEH81fmYu
         ICcbgn/YNUr1hVH72wTZK2CNBCJqyaUVISgAVkbu874C6XbOdyWa+WXmdfRFi9F1zLyG
         hbfMWluLkCmgnce/rPifI0XRms3mSQESra2HUlw7xMxbt4rJ79NdkqsfpilGrRIVg4oo
         h//se62/ysg4DlY8DjTPB7zhBDQlgLP6ArvaHC6xGIJwmxj0wt7qDJsAo7IDUCIgY79W
         A0IQ==
X-Forwarded-Encrypted: i=1; AL+hErEdo4OMoaQ/qgVNxo0avZf5q2P7PQQ7QwLvRjYmXIxoPYLIkgNUmkx/nnBoRK8ixnpeVPlcz5Sb6bG4jruUnmg9@lists.infradead.org
X-Gm-Message-State: APuU4Z/ImvNS+j7IVjd0gSFonS7iTNwn6+jNpoHRUeGqU9FcnkD/45TE
	O1T01WRJIJfKvpZNAUQkdJcgf2w/K3+lpnHpoB7RUvAsBV5FUOEZAeHW7B8yk90So6XBP8kotCj
	Ws55cU9WxcgKSx6v8UPFiQw==
X-Received: from plbl5.prod.google.com ([2002:a17:902:eb05:b0:2ef:f5cd:c465])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1745:b0:2f0:5b55:edf3 with SMTP id d9443c01a7336-2f05b55ee4bmr55875675ad.32.1795373118583;
 Sun, 22 Nov 2026 10:45:18 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:52 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-19-jthoughton@google.com>
Subject: [PATCH v3 18/19 DO-NOT-MERGE] hugetlb_vmemmap: Add fault injection
 for in-place vmemmap PMD splits
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
X-CRM114-CacheID: sfid-20261122_184521_857586_981BC452 
X-CRM114-Status: GOOD (  17.83  )
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

Like try_update_vmemmap_pte(), try_populate_vmemmap_pmd() may fail,
e.g. on arm64 when replacing the block mapping keeps racing with
hardware access flag updates. HVO handles such failures by not
optimizing the folio.

Add a fault-injection capability, fail_hugetlb_vmemmap_pmd, alongside
fail_hugetlb_vmemmap_pte. When a fault is injected, the PMD split fails
with -EAGAIN without touching the page tables.

It can be configured through debugfs or through the
fail_hugetlb_vmemmap_pmd= boot option. Since vmemmap PMDs are only split
once, the boot option is the most effective way to exercise this path.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  1 +
 .../fault-injection/fault-injection.rst       |  8 +++++---
 lib/Kconfig.debug                             |  4 ++--
 mm/hugetlb_vmemmap.c                          | 20 ++++++++++++++++++-
 4 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b8a8771631c0..251bd0f4afa3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1695,6 +1695,7 @@ Kernel parameters
 	fail_page_alloc=
 	fail_skb_realloc=
 	fail_hugetlb_vmemmap_pte=
+	fail_hugetlb_vmemmap_pmd=
 	fail_make_request=[KNL]
 			General fault injection mechanism.
 			Format: <interval>,<probability>,<space>,<times>
diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
index 403206645fa4..5cfabea811da 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -16,10 +16,11 @@ Available fault injection capabilities
 
   injects page allocation failures. (alloc_pages(), get_free_pages(), ...)
 
-- fail_hugetlb_vmemmap_pte
+- fail_hugetlb_vmemmap_pte, fail_hugetlb_vmemmap_pmd
 
-  injects failures of the in-place vmemmap PTE remaps done by HugeTLB vmemmap
-  optimization. (try_update_vmemmap_pte())
+  injects failures of the in-place vmemmap PTE remaps and PMD splits done by
+  HugeTLB vmemmap optimization. (try_update_vmemmap_pte(),
+  try_populate_vmemmap_pmd())
 
 - fail_usercopy
 
@@ -269,6 +270,7 @@ use the boot option::
 	failslab=
 	fail_page_alloc=
 	fail_hugetlb_vmemmap_pte=
+	fail_hugetlb_vmemmap_pmd=
 	fail_usercopy=
 	fail_make_request=
 	fail_futex=
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a6a9bc01a320..68244c0e4a81 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2104,8 +2104,8 @@ config FAIL_HUGETLB_VMEMMAP
 	help
 	  Provide fault-injection capability for the in-place vmemmap page
 	  table updates done by HugeTLB vmemmap optimization (HVO), i.e.
-	  try_update_vmemmap_pte(). This exercises the rollback and
-	  partially-optimized folio paths.
+	  try_update_vmemmap_pte() and try_populate_vmemmap_pmd(). This
+	  exercises the rollback and partially-optimized folio paths.
 
 config FAULT_INJECTION_USERCOPY
 	bool "Fault injection capability for usercopy functions"
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index d3230588f31f..95a42f59c16b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -47,6 +47,7 @@ DECLARE_RWSEM(vmemmap_remap_rwsem);
 
 #ifdef CONFIG_FAIL_HUGETLB_VMEMMAP
 static DECLARE_FAULT_ATTR(fail_hugetlb_vmemmap_pte);
+static DECLARE_FAULT_ATTR(fail_hugetlb_vmemmap_pmd);
 
 static int __init setup_fail_hugetlb_vmemmap_pte(char *str)
 {
@@ -54,11 +55,19 @@ static int __init setup_fail_hugetlb_vmemmap_pte(char *str)
 }
 __setup("fail_hugetlb_vmemmap_pte=", setup_fail_hugetlb_vmemmap_pte);
 
+static int __init setup_fail_hugetlb_vmemmap_pmd(char *str)
+{
+	return setup_fault_attr(&fail_hugetlb_vmemmap_pmd, str);
+}
+__setup("fail_hugetlb_vmemmap_pmd=", setup_fail_hugetlb_vmemmap_pmd);
+
 #ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
 static int __init fail_hugetlb_vmemmap_debugfs(void)
 {
 	fault_create_debugfs_attr("fail_hugetlb_vmemmap_pte", NULL,
 				  &fail_hugetlb_vmemmap_pte);
+	fault_create_debugfs_attr("fail_hugetlb_vmemmap_pmd", NULL,
+				  &fail_hugetlb_vmemmap_pmd);
 	return 0;
 }
 late_initcall(fail_hugetlb_vmemmap_debugfs);
@@ -74,8 +83,17 @@ static int hvo_update_vmemmap_pte(unsigned long addr, pte_t *ptep, pte_t pte)
 		return -EAGAIN;
 	return try_update_vmemmap_pte(addr, ptep, pte);
 }
+
+static int hvo_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
+				    pte_t *pgtable)
+{
+	if (should_fail(&fail_hugetlb_vmemmap_pmd, PMD_SIZE))
+		return -EAGAIN;
+	return try_populate_vmemmap_pmd(addr, pmdp, pgtable);
+}
 #else
 #define hvo_update_vmemmap_pte		try_update_vmemmap_pte
+#define hvo_populate_vmemmap_pmd	try_populate_vmemmap_pmd
 #endif /* CONFIG_FAIL_HUGETLB_VMEMMAP */
 
 static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
@@ -107,7 +125,7 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 	if (likely(pmd_leaf(*pmd))) {
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
-		ret = try_populate_vmemmap_pmd(start, pmd, pgtable);
+		ret = hvo_populate_vmemmap_pmd(start, pmd, pgtable);
 		if (ret)
 			goto free;
 
-- 
2.56.1.809.ga0b61035b5-goog


