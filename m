Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B030260A6F5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JjuK8WRh;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KzUkios0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wg+r/G4UynsyjzcD9VFm7KNuI6HhIxNTVl9eF5+p1ZQ=; b=JjuK8WRhHKMpeki/9TPYuDvZwx
	lkEapkScJ1hqbRoK3Kk9ghhKsrp7haRbxXuyigcVuR5Kc1d5FefXKtKQR03rNIDPrw3ZxxnQrOXps
	FP4XGV9pCNmvevEazzRRPwU52Air52QTSSMZmZA5LFCJcI1XCQLu1tgv5NWLLfsmXKSnBEMuLSusm
	wVmgHGMhd3oUnSo05JSEtSsR0DnW24FJOomUgfp9TLDvhuSNAirS8U6XJ1boaE5jVrQ4nj4yYYsD5
	WqLqGPIKFjh643NWidIJtXhHQoJOnF1zuz3kfHXsoNSRu05v1wwwf6CHY6d3GEguT0M5jisMpO/NF
	KJ1nJiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Bp-00000006Qmb-008t;
	Wed, 11 Nov 2026 11:08:29 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Bm-00000006QlI-2lQ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:08:27 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-48e0af48c18so2317364f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395304; x=1795000104; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wg+r/G4UynsyjzcD9VFm7KNuI6HhIxNTVl9eF5+p1ZQ=;
        b=KzUkios0U7/nu2v2LCF1IsfAvuWMvq6Nq6EiXvs4v3FyWbsxlDzuKLL9Ke1j7mrEFl
         L0I8RRrs1WPczT0u1tFVL4DvhDxhZnAdKH3FqMaNMjAiPnlcXyysn0SOD/tIkXhN/Pb4
         ZtbitPI6d2Z/ufI5f+JtgqoPFPgeLnBNDUMcHyX+r4BPcQR3pZ/vhhLG0cPNnWhTTUzr
         G0CNUh+LBd0Wh8xmHedTsjwQ2/w5zw3NepLVwnLBBV79qZdRcuoKQT8kI5bAsvSerVCJ
         5PBYUozQUINzJWBpj4RMlXDUmAN91gCOHvlQs7D3rKZLqYq/IzKGlebtITis3veYjKZ6
         IrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395304; x=1795000104;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wg+r/G4UynsyjzcD9VFm7KNuI6HhIxNTVl9eF5+p1ZQ=;
        b=RFszPBKf2DoOFChjT3XcNPBWPjN2ztUfsMseAxVTGMMLeUrbz7nxgoTeE+6oLHfQ1N
         vUVajP3JhdLYtB3Ewr51LHkhuXTcix+FzLzedkXfHEm+lqlD0OSgNg2y3Be/fVvO+sIV
         jlafIpKD+26rJljgvM4B/rLAwQJuwAOY0MKNzdvfWFL8lW3ZC9sLTduSqJpznM2KfrYj
         iVkuby4jLCNQruVWYJeKzJwB33qC2QggiPlMCr9CxYw3pfyRGNWx+ATeFfl0kYlnCscf
         1eQ0HOQ1cvTeR4bti16KB4aXFcgttrDSi168UufEMUyFaJjV4Li2y6e93vpklzFeTlfu
         +PIw==
X-Forwarded-Encrypted: i=1; AL+hErH+pyoj0iUwBXCa/d9Pp/153ywAyFCZ4z2bU/kZPpawcOWoQl1Yy4MDCAboK6FiqSENqwdSef5cgMwrqUX7du7Y@lists.infradead.org
X-Gm-Message-State: APuU4Z8J1+fJTJ82Roq4kM2FNSPFlC8TKf9xP7v6+cdotUK4mEl2UX9k
	WHYDhW+dYLR0RVuE4az8IdWZb2edBF6vCsD3eYaQkD07coYRRxq8WLpZeRLDPVGbnEsacqOfzfn
	RRU4yHyDXsz3nIWV0JqXfkg==
X-Received: from wmo18.prod.google.com ([2002:a05:600c:2312:b0:4a5:34a9:6903])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:82f1:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4ba093c85ebmr40371365e9.23.1794395303273;
 Wed, 11 Nov 2026 03:08:23 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:31 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-2-vdonnefort@google.com>
Subject: [PATCH v3 1/8] memblock: Introduce MEMBLOCK_PTEMAP
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
X-CRM114-CacheID: sfid-20261111_030826_725331_3C183682 
X-CRM114-Status: GOOD (  18.00  )
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

Keeping PTE-level mappings is interesting for arm64 as it allows
mapping/unmapping pages from the kernel direct map without the risk of
splitting blocks which, under the break-before-make rule, may trigger
page-faults the kernel can't handle.

However, mapping the entire direct map at PTE-level is costly. So
instead, create a new memblock flag MEMBLOCK_PTEMAP to selectively apply
a PTE-level mapping.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 39 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 40e6e0aa2f8d..67ef20a1c5e2 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,7 @@ extern unsigned long long max_possible_pfn;
  * know is good to use. It is the only memory that allocations may happen from
  * in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_PTEMAP: memory region to be mapped using PTE-level mapping
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +64,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_NOPRSRV	= 0x40,	/* memory with no KHO preservations */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_PTEMAP		= 0x100,/* PTE-level mapping */
 };
 
 /**
@@ -160,6 +162,8 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_noprsrv(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size);
+int memblock_mark_ptemap(phys_addr_t base, phys_addr_t size);
+int memblock_clear_ptemap(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 
@@ -305,6 +309,11 @@ static inline bool memblock_is_kho_noprsrv(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_NOPRSRV;
 }
 
+static inline bool memblock_is_ptemap(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_PTEMAP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index a450092a80fb..b8b6e762917a 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1068,10 +1068,15 @@ static int __init_memblock memblock_setclr_flag(struct memblock_type *type,
 	for (i = start_rgn; i < end_rgn; i++) {
 		struct memblock_region *r = &type->regions[i];
 
-		if (set)
+		if (set) {
+			enum memblock_flags map_flags =
+				MEMBLOCK_NOMAP | MEMBLOCK_PTEMAP;
+
 			r->flags |= flag;
-		else
+			WARN_ON_ONCE((r->flags & map_flags) == map_flags);
+		} else {
 			r->flags &= ~flag;
+		}
 	}
 
 	memblock_merge_regions(type, start_rgn, end_rgn);
@@ -1221,6 +1226,35 @@ __init int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_NOPRSRV);
 }
 
+/**
+ * memblock_mark_ptemap - Mark a memory region with flag MEMBLOCK_PTEMAP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * If supported by the architecture, such region is mapped using PTE-level
+ * mappings in the kernel direct map.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_ptemap(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_PTEMAP);
+}
+
+/**
+ * memblock_clear_ptemap - Clear flag MEMBLOCK_PTEMAP for a specified region.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_clear_ptemap(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 0,
+				    MEMBLOCK_PTEMAP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2854,6 +2888,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_PTEMAP)] = "PTEMAP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.56.0.542.g3ef89b7020-goog


