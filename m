Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBBD606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yWnEGzeG;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A4tV0ILl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fepHfB0plBo6LzhKi5imbPgE2fv/KA+5u7RqYYS0Pqg=; b=yWnEGzeGmjPD2xybvCw3ma6lGz
	iaYPrbslsDvuvB0SBvwXCFPs+AsyAb9D9f0XuBAB1n5GCR7pSH4TaIwYBq79VfzzcrDD3YK0SlSjo
	BnvPkZO82UKqq0MnNlnHMr8ZMC+zQlfCKPoGEfol+QwzUZF6Jq3uY/u+k33hMOG6Dt1wJimsafXLp
	EirDpNC4KlwQQ/2hqNiy7tLf/eHvuOsPTqLcV/rmn2MAFkO+P6RHl4U/j8udCscvo3U7LPp0YynpF
	2tGKLMAhZk3DbDOiBEHTnAI5YU4N43/w08DkhhbJ7xMixoC5i7imgngwjic5ym/tNAG+H4uwOhrGS
	Hb0cZzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Bw-00000006Qqf-1rcE;
	Wed, 11 Nov 2026 11:08:36 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Bp-00000006QmY-43Y0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:08:31 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso24743125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395308; x=1795000108; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fepHfB0plBo6LzhKi5imbPgE2fv/KA+5u7RqYYS0Pqg=;
        b=A4tV0ILlIep89WxwBlva2qHa+R4XUNYe69TdWBrV0xztr+1LtyZA9xQ/+7OJubgO1B
         3mAdkh6dKy6Ia5Xvo4cUt1SIlGOdnPi9hNXXWPVEhjHeG7eHM3tIAgE0ek6LPjbf1rvJ
         Awc9Mkjwu9D0P0cH2ouNQKnG5r8kI8jSMSR2X3fGLrszpupW2NDe78m1J4UsS5ujiRUu
         UyCt1AGF96/YPUhyUJyTYVFul47R67Emok9OmpyY/5vfIpm0Ij4LwaURgcPKWGaMXWil
         eZ1YulgL6YnTusEWckovltiLaM2HFNk+mP5rENGEyuY2bOFul66tRyMd2l7FKKBEScMf
         YOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395308; x=1795000108;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fepHfB0plBo6LzhKi5imbPgE2fv/KA+5u7RqYYS0Pqg=;
        b=EmTVQojS3ahft1EJ9Rk+B6HdpKoyOfiRGuDG+S2Kk9qny20VnFiTUGdc6sqhAixe56
         0UtuNRuWRq2kPc/Vv71i3Wgex3fTCIJMZLITGwjKzAnS5+OSx5YPB6zc4G6QJNAyCjjt
         nxtxjOrRxD6XnMh3x2CZEL2vpEZ5QHHYiToHUdWhsUW+AzeYZSi0Q2xLqM7WEzqu4wbQ
         ThJnTcEnppIf4ATt3U3dPkSzOX+ZlPnWo1X8TgwZ1MT1IExXF7wuFDCIVhA0SmICXpPL
         QwGjSLz9Wp0PtilcsfAlOdkM4HoNAzyhUkpeG0AuCBawVCOvFDIxmO4gLZ56FH8miuAx
         As3g==
X-Forwarded-Encrypted: i=1; AL+hErHTFhRgU6ynPzsJ/HjndAKI3AA81YV8lIST8vuanA/MNv00m3HsD9aKRJIDsrs+38lItdjVblrMTj0YF20NEqUg@lists.infradead.org
X-Gm-Message-State: APuU4Z/rs2hj38sALSpNwtbjwQgPrQTBhKrmvh96ihAZfiPR+0i1vR2S
	gIxiO2WH/aQ7RI+abLMc3QPavH8Wy7GOVYllkfQ1bl87iylp5pRvuFJ39Zbxe7/zUW9d+TKCPuB
	Ph3yK7vK6PCUZg/UfzFVIjA==
X-Received: from wrtw18.prod.google.com ([2002:a5d:6092:0:b0:496:45d:6be1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c167:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4ba093acf6dmr33023215e9.33.1794395307950;
 Wed, 11 Nov 2026 03:08:27 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:35 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-6-vdonnefort@google.com>
Subject: [PATCH v3 5/8] dma-mapping: Introduce lendable-dma-pool
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
X-CRM114-CacheID: sfid-20261111_030830_078053_0E6BB815 
X-CRM114-Status: GOOD (  27.73  )
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

On arm64, when memory is lent to secure world (e.g. via Arm FF-A), fatal
CPU speculative reads can still occur while it retains a cacheable
direct mapping. Introduce the "lendable-dma-pool" reserved-memory CMA
driver with dma_zap_direct_map() and dma_restore_direct_map() to unmap
pages before lending and restore them upon reclaim. Devices use the pool
via "memory-region" or "linux,cma-default":

  reserved-memory {
      #address-cells = <0x2>;
      #size-cells = <0x2>;
      ranges;

      linux,cma {
          compatible = "lendable-dma-pool";
          reusable;
          linux,cma-default;
          size = <0x0 0x4000000>;
      };
  };

If no lendable-dma-pool node is provided, the API falls back to
can_set_direct_map().

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 include/linux/dma-map-ops.h |   9 ++
 include/linux/dma-mapping.h |  16 +++
 kernel/dma/Kconfig          |   3 +
 kernel/dma/Makefile         |   1 +
 kernel/dma/lendable.c       | 243 ++++++++++++++++++++++++++++++++++++
 5 files changed, 272 insertions(+)
 create mode 100644 kernel/dma/lendable.c

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index afaf2c12189b..e1d1e8d70855 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -379,6 +379,15 @@ static inline void arch_dma_prep_coherent(struct page *page, size_t size)
 }
 #endif /* CONFIG_ARCH_HAS_DMA_PREP_COHERENT */
 
+#ifdef CONFIG_DMA_LENDABLE
+int __init arch_dma_mark_lendable(phys_addr_t base, phys_addr_t size);
+bool __init arch_dma_is_lendable(struct page *page, unsigned int nr_pages);
+int arch_dma_zap_direct_map(struct page *page, unsigned int nr_pages,
+			    bool from_lendable);
+int arch_dma_restore_direct_map(struct page *page, unsigned int nr_pages,
+				bool from_lendable);
+#endif /* CONFIG_DMA_LENDABLE */
+
 void *arch_dma_set_uncached(void *addr, size_t size);
 void arch_dma_clear_uncached(void *addr, size_t size);
 
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index efde0e5a58dc..24239599505d 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -511,6 +511,22 @@ void dma_free_pages(struct device *dev, size_t size, struct page *page,
 int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
 		size_t size, struct page *page);
 
+#ifdef CONFIG_DMA_LENDABLE
+int dma_zap_direct_map(struct device *dev, struct page *page, size_t size);
+void dma_restore_direct_map(struct device *dev, struct page *page, size_t size);
+#else
+static inline int dma_zap_direct_map(struct device *dev, struct page *page,
+				     size_t size)
+{
+	return -ENODEV;
+}
+
+static inline void dma_restore_direct_map(struct device *dev, struct page *page,
+					  size_t size)
+{
+}
+#endif /* CONFIG_DMA_LENDABLE */
+
 static inline void *dma_alloc_noncoherent(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
 {
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 3830a63ae032..8d65e2daa7d2 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -192,6 +192,9 @@ config DMA_CMA
 
 if  DMA_CMA
 
+config DMA_LENDABLE
+	bool
+
 config DMA_NUMA_CMA
 	bool "Enable separate DMA Contiguous Memory Area for NUMA Node"
 	depends on NUMA
diff --git a/kernel/dma/Makefile b/kernel/dma/Makefile
index 6977033444a3..6b257d82bd9b 100644
--- a/kernel/dma/Makefile
+++ b/kernel/dma/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_HAS_DMA)			+= mapping.o direct.o
 obj-$(CONFIG_DMA_OPS_HELPERS)		+= ops_helpers.o
 obj-$(CONFIG_ARCH_HAS_DMA_OPS)		+= dummy.o
 obj-$(CONFIG_DMA_CMA)			+= contiguous.o
+obj-$(CONFIG_DMA_LENDABLE)		+= lendable.o
 obj-$(CONFIG_DMA_DECLARE_COHERENT)	+= coherent.o
 obj-$(CONFIG_DMA_API_DEBUG)		+= debug.o
 obj-$(CONFIG_SWIOTLB)			+= swiotlb.o
diff --git a/kernel/dma/lendable.c b/kernel/dma/lendable.c
new file mode 100644
index 000000000000..85ac3ad10df0
--- /dev/null
+++ b/kernel/dma/lendable.c
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Lendable DMA Contiguous Memory Pool
+ *
+ * Prevents CPU speculative reads to DMA memory (e.g. when lent to a secure
+ * world) by unmapping it from the kernel direct map. This works if the
+ * architecture allows modifying the direct map globally (can_set_direct_map())
+ * or if the memory belongs to a reserved-memory CMA pool compatible with
+ * "lendable-dma-pool".
+ *
+ * Copyright (C) 2026 Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#define pr_fmt(fmt) "dma-lendable: " fmt
+
+#include <linux/atomic.h>
+#include <linux/bsearch.h>
+#include <linux/cma.h>
+#include <linux/dma-map-ops.h>
+#include <linux/dma-mapping.h>
+#include <linux/init.h>
+#include <linux/mm.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/set_memory.h>
+#include <linux/sort.h>
+#include <linux/suspend.h>
+
+#include "contiguous.h"
+
+#define DMA_LENDABLE_DISABLED	-1
+
+static struct cma *lendable_areas[MAX_CMA_AREAS] __ro_after_init;
+static unsigned int nr_lendable_areas __ro_after_init;
+static atomic_t dma_lendable_active;
+
+static int __lendable_cmp(const void *a, const void *b)
+{
+	const struct cma *cma_a = *(struct cma * const *)a;
+	const struct cma *cma_b = *(struct cma * const *)b;
+
+	return cmp_int(cma_get_base(cma_a), cma_get_base(cma_b));
+}
+
+static bool cma_is_lendable(struct cma *cma)
+{
+	return cma && bsearch(&cma, lendable_areas, nr_lendable_areas,
+			      sizeof(lendable_areas[0]), __lendable_cmp);
+}
+
+static bool cma_has_range(struct cma *cma, struct page *page, unsigned int nr_pages)
+{
+	phys_addr_t start = page_to_phys(page);
+	phys_addr_t end = start + ((phys_addr_t)nr_pages << PAGE_SHIFT);
+	phys_addr_t base = cma_get_base(cma);
+
+	return start >= base && end <= base + cma_get_size(cma);
+}
+
+/**
+ * dma_zap_direct_map() - Remove a DMA page range from the kernel direct map
+ * @dev:	Device that allocated the pages (or NULL for default CMA pool)
+ * @page:	First page of the memory region
+ * @size:	Page-aligned size of the memory region in bytes
+ *
+ * Cleans and invalidates caches and removes the memory range from the kernel
+ * direct map to prevent speculative CPU accesses. Must be paired with
+ * dma_restore_direct_map().
+ *
+ * Context: Any context if allocated from a lendable pool; process context
+ *          (may sleep) otherwise.
+ * Return:
+ * * 0		- Success.
+ * * -EINVAL	- @size is 0 or not page-aligned.
+ * * -ENODEV	- Direct map cannot be modified and @dev has no lendable pool.
+ * * -EFAULT	- @dev has a lendable pool, but [@page, @page + @size) is
+ *		  outside that pool.
+ * * -EBUSY	- Direct map zapping is temporarily disabled (hibernation).
+ */
+int dma_zap_direct_map(struct device *dev, struct page *page, size_t size)
+{
+	unsigned int nr_pages = size >> PAGE_SHIFT;
+	bool from_lendable, has_lendable;
+	struct cma *cma;
+	int ret;
+
+	if (!size || !PAGE_ALIGNED(size))
+		return -EINVAL;
+
+	cma = dev_get_cma_area(dev);
+	has_lendable = cma_is_lendable(cma);
+	from_lendable = has_lendable && cma_has_range(cma, page, nr_pages);
+
+	if (!from_lendable && !can_set_direct_map())
+		return has_lendable ? -EFAULT : -ENODEV;
+
+	/* Provides full ordering */
+	if (!atomic_add_unless(&dma_lendable_active, 1, DMA_LENDABLE_DISABLED))
+		return -EBUSY;
+
+	ret = arch_dma_zap_direct_map(page, nr_pages, from_lendable);
+	if (ret)
+		atomic_dec(&dma_lendable_active);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dma_zap_direct_map);
+
+/**
+ * dma_restore_direct_map() - Restore a zapped DMA page range in the direct map
+ * @dev:	Device that allocated the pages (or NULL for default CMA pool)
+ * @page:	First page of the memory region
+ * @size:	Page-aligned size of the memory region in bytes
+ *
+ * Restores the default kernel direct mapping and invalidates caches for a range
+ * previously zapped with dma_zap_direct_map().
+ *
+ * Context: Any context if allocated from a lendable pool; process context
+ *          (may sleep) otherwise.
+ */
+void dma_restore_direct_map(struct device *dev, struct page *page, size_t size)
+{
+	unsigned int nr_pages = size >> PAGE_SHIFT;
+	bool from_lendable;
+	struct cma *cma;
+
+	if (WARN_ON_ONCE(!size || !PAGE_ALIGNED(size)))
+		return;
+
+	cma = dev_get_cma_area(dev);
+	from_lendable = cma_is_lendable(cma) && cma_has_range(cma, page, nr_pages);
+
+	if (WARN_ON_ONCE(!from_lendable && !can_set_direct_map()))
+		return;
+
+	if (WARN_ON_ONCE(arch_dma_restore_direct_map(page, nr_pages, from_lendable)))
+		return;
+
+	WARN_ON_ONCE(atomic_dec_return_release(&dma_lendable_active) < 0);
+}
+EXPORT_SYMBOL_GPL(dma_restore_direct_map);
+
+static int dma_lendable_pm_notify(struct notifier_block *nb,
+				  unsigned long mode, void *data)
+{
+	/* Prevent hibernation while unmapped pages may be inaccessible */
+	switch (mode) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+		if (atomic_cmpxchg_acquire(&dma_lendable_active, 0, DMA_LENDABLE_DISABLED))
+			return notifier_from_errno(-EBUSY);
+		break;
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+		atomic_cmpxchg(&dma_lendable_active, DMA_LENDABLE_DISABLED, 0);
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block dma_lendable_pm_nb = {
+	.notifier_call	= dma_lendable_pm_notify,
+};
+
+static int __init dma_lendable_init(void)
+{
+	unsigned int i, nr = 0;
+
+	for (i = 0; i < nr_lendable_areas; i++) {
+		struct cma *cma = lendable_areas[i];
+
+		if (!arch_dma_is_lendable(phys_to_page(cma_get_base(cma)),
+					  cma_get_size(cma) >> PAGE_SHIFT)) {
+			pr_warn("Ignoring %s: not lendable\n", cma_get_name(cma));
+			continue;
+		}
+
+		lendable_areas[nr++] = cma;
+	}
+	nr_lendable_areas = nr;
+
+	sort(lendable_areas, nr_lendable_areas, sizeof(lendable_areas[0]), __lendable_cmp, NULL);
+
+	register_pm_notifier(&dma_lendable_pm_nb);
+
+	return 0;
+}
+core_initcall(dma_lendable_init);
+
+#ifdef CONFIG_OF_RESERVED_MEM
+static int __init rmem_lendable_validate(unsigned long node,
+					 phys_addr_t *align)
+{
+	return rmem_cma_ops.node_validate(node, align);
+}
+
+static int __init rmem_lendable_fixup(unsigned long node, phys_addr_t base,
+				      phys_addr_t size)
+{
+	int ret = rmem_cma_ops.node_fixup(node, base, size);
+
+	if (ret)
+		return ret;
+
+	return arch_dma_mark_lendable(base, size);
+}
+
+static int __init rmem_lendable_setup(unsigned long node,
+				      struct reserved_mem *rmem)
+{
+	int ret = rmem_cma_ops.node_init(node, rmem);
+
+	if (ret)
+		return ret;
+
+	lendable_areas[nr_lendable_areas++] = rmem->priv;
+
+	return 0;
+}
+
+static int rmem_lendable_device_init(struct reserved_mem *rmem,
+				     struct device *dev)
+{
+	return rmem_cma_ops.device_init(rmem, dev);
+}
+
+static void rmem_lendable_device_release(struct reserved_mem *rmem,
+					 struct device *dev)
+{
+	rmem_cma_ops.device_release(rmem, dev);
+}
+
+static const struct reserved_mem_ops rmem_lendable_ops = {
+	.node_validate	= rmem_lendable_validate,
+	.node_fixup	= rmem_lendable_fixup,
+	.node_init	= rmem_lendable_setup,
+	.device_init	= rmem_lendable_device_init,
+	.device_release	= rmem_lendable_device_release,
+};
+
+RESERVEDMEM_OF_DECLARE(cma_lendable, "lendable-dma-pool", &rmem_lendable_ops);
+#endif /* CONFIG_OF_RESERVED_MEM */
-- 
2.56.0.542.g3ef89b7020-goog


