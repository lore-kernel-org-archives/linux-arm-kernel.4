Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E301606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fnttNCb/;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LoFJ2M0q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k28NXrt+XbqyfRaacENrrFfeZjq4XEJuuf/YvC8HY10=; b=fnttNCb//7hh28XkQDiWaRZzK7
	fOAyWVfetb9KW7G85ZuQ4N4OB//4uwW2hcdkQ1TbudnsJR9pOt6nl/skBzJQGRt5JSITG/FDlCDCp
	NpYvdg+lVT4JGfr3xhn2rRCfW7zlgCszZwcTKF+jx7xeeWe3xeaVn3IB8sBF25L8CQ1l8rsSovxHV
	f5at6G7bzpBZZHhEq23DO7Gn7ksL8H4/6snEyUC8drQUWsV/onO71ddvyugB6Zi6Q4EtX0e8ilsew
	SlOpQ9JmLsBAQp8ICJVf6DXTM2JYOXv2nbUH8Ekgs42cR5wsUoBqqLnO2+QhS4S+U1fB3cnfqZvag
	vtWmSrew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6CB-00000006R3d-0Io8;
	Wed, 11 Nov 2026 11:08:51 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6C2-00000006Quv-1Aqc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:08:43 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c4163a5400eso141922866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395320; x=1795000120; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k28NXrt+XbqyfRaacENrrFfeZjq4XEJuuf/YvC8HY10=;
        b=LoFJ2M0qUq911AQbLJm+Tv0agLI2YFY5XPdd5Ov3DgIUzzftbPB5JfNFVRCMZ/SCS6
         wyeMeRbwfxFdDBkCssqcbviGaBwn4iE8tKSZm0EKeQTXu34TiLkqCr7O8aXfaAQHMKEn
         amW6RZi0Dj5CDnCNlxxYbyo5kLfPRAUC4dPwrVs2M3gnee6QutrtZcpIJ3gLi3jB15wx
         RL6apCm/ef+TxVtUxel5RB+8ceFfricY6Axf0s9eYM74QShpv3MYQR6NXXu/DBG9AU5b
         2MyY64NTutVahuYZMqAuUFB+9TNYVEboQIGEZa7hHv6sGBKHNQ1Yydf1UFbWp28ySvWp
         GN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395320; x=1795000120;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k28NXrt+XbqyfRaacENrrFfeZjq4XEJuuf/YvC8HY10=;
        b=BEoP0oN2BfLjkYIitz4EHHcQPkgF5aH+AYtIsoFx8qjBecfyV21uEwmZE3U1virAEY
         y8nnNAmCP12qThKThqCgTxZcGLFdv6OBmsqfqS3KF2os160AQYVEidSofVCUa8cUOvNC
         74x30F6T1BxeCsiuqd+MROiRxWrLYL3N1aDzbtOR2gNKu+Af+5r5Wrk4RxuTxUwqV77Y
         D5TwRspEEN0nSB8k0IniQJFRXd9qfT3HVZuWlpuzY6PpKGIMEKmjOgx4QWSTSBdLMuzL
         NohJdVCVLrSWaVT77Kwa3Pp4Z/fEMA1J2EkzmsNzPlvjFhnqpv1uztzFPC7NkKf9ql9D
         coGQ==
X-Forwarded-Encrypted: i=1; AL+hErFG7Vhii51u2BvDFrv9S7rFIOHqQPZwtt8zmdUoEwTGJIf4oBRKIZaAjx5Lu38lMUxIJ2jjgxtmpRM+19ClWKh5@lists.infradead.org
X-Gm-Message-State: APuU4Z+w7B/eCT1wd3OBCiZqxRoRCOmCw6fBJhlNWerZY/DSk/v4ttmo
	/hvpGbzW/mr5jIW3RqKeJISEKrpIXTtcUqEhw69O4fJfA3dMW7OKT1bmCR/4tEx1e1FFD2wKHwz
	FnWmvo7Z+yxLj7bn53HEVBQ==
X-Received: from ejxe15.prod.google.com ([2002:a17:906:81cf:b0:c3f:75a:4837])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d2c:b0:c50:6222:7b1c with SMTP id a640c23a62f3a-c5066cc68c2mr168857666b.23.1794395319574;
 Wed, 11 Nov 2026 03:08:39 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:37 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-8-vdonnefort@google.com>
Subject: [PATCH v3 7/8] arm64: Add support for lendable-dma-pool
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
X-CRM114-CacheID: sfid-20261111_030842_375996_DA076C82 
X-CRM114-Status: GOOD (  18.95  )
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

Even when the linear map uses block mappings, regions marked with
MEMBLOCK_PTEMAP are mapped at page granularity and can be modified at
runtime. Implement the architecture hooks for the lendable-dma-pool to
force the last-level mappings, validate ranges and update the direct
mapping.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/Kconfig                  |  1 +
 arch/arm64/include/asm/set_memory.h |  2 +
 arch/arm64/mm/dma-mapping.c         | 71 +++++++++++++++++++++++++++++
 arch/arm64/mm/pageattr.c            | 56 ++++++++++++++++++-----
 4 files changed, 118 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..34fe7a7eea82 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -117,6 +117,7 @@ config ARM64
 	select DYNAMIC_FTRACE if FUNCTION_TRACER
 	select DMA_BOUNCE_UNALIGNED_KMALLOC
 	select DMA_DIRECT_REMAP
+	select DMA_LENDABLE if DMA_CMA
 	select EDAC_SUPPORT
 	select FRAME_POINTER
 	select FUNCTION_ALIGNMENT_4B
diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index b6ec938703d6..ec8bbb59e51f 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -17,6 +17,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
 int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
+int __set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
+int __set_direct_map_default_noflush(struct page *page, unsigned int numpages);
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 7f6f2f40dba2..c324e9826ce2 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -7,9 +7,13 @@
 #include <linux/gfp.h>
 #include <linux/cache.h>
 #include <linux/dma-map-ops.h>
+#include <linux/kernel.h>
+#include <linux/memblock.h>
 #include <xen/xen.h>
 
 #include <asm/cacheflush.h>
+#include <asm/set_memory.h>
+#include <asm/tlbflush.h>
 #include <asm/xen/xen-ops.h>
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
@@ -38,6 +42,73 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 	dcache_clean_poc(start, start + size);
 }
 
+#ifdef CONFIG_DMA_LENDABLE
+int __init arch_dma_mark_lendable(phys_addr_t base, phys_addr_t size)
+{
+	if (!PAGE_ALIGNED(base | size))
+		return -EINVAL;
+
+	return memblock_mark_ptemap(base, size);
+}
+
+bool __init arch_dma_is_lendable(struct page *page, unsigned int nr_pages)
+{
+	return direct_map_is_ptemap(page, nr_pages);
+}
+
+int arch_dma_zap_direct_map(struct page *page, unsigned int nr_pages,
+			    bool from_lendable)
+{
+	unsigned long start = (unsigned long)page_address(page);
+	unsigned long end = start + ((unsigned long)nr_pages << PAGE_SHIFT);
+	int ret;
+
+	/*
+	 * arch_dma_prep_coherent() only cleans as normal DMA buffers retain a
+	 * cacheable linear-map alias. Since that alias is being removed here,
+	 * also invalidate to make sure they can't be evicted later on while the
+	 * memory is secured.
+	 */
+	dcache_clean_inval_poc(start, end);
+
+	if (from_lendable) {
+		ret = __set_direct_map_invalid_noflush(page, nr_pages);
+	} else {
+		might_sleep();
+		ret = set_direct_map_invalid_noflush(page, nr_pages);
+	}
+
+	if (ret)
+		return ret;
+
+	flush_tlb_kernel_range(start, end);
+
+	return 0;
+}
+
+int arch_dma_restore_direct_map(struct page *page, unsigned int nr_pages,
+				bool from_lendable)
+{
+	unsigned long start = (unsigned long)page_address(page);
+	unsigned long end = start + ((unsigned long)nr_pages << PAGE_SHIFT);
+	int ret;
+
+	if (from_lendable) {
+		ret = __set_direct_map_default_noflush(page, nr_pages);
+	} else {
+		might_sleep();
+		ret = set_direct_map_default_noflush(page, nr_pages);
+	}
+
+	if (ret)
+		return ret;
+
+	dcache_inval_poc(start, end);
+
+	return 0;
+}
+#endif /* CONFIG_DMA_LENDABLE */
+
 void arch_setup_dma_ops(struct device *dev, bool coherent)
 {
 	int cls = cache_line_size_of_cpu();
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index c7662fd2fcb2..467a420af0f5 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -167,8 +167,8 @@ bool __init direct_map_is_ptemap(struct page *page, unsigned int numpages)
 						      NULL, NULL);
 }
 
-static int update_range_prot(unsigned long start, unsigned long size,
-			     pgprot_t set_mask, pgprot_t clear_mask)
+static int __update_range_prot(unsigned long start, unsigned long size,
+			       pgprot_t set_mask, pgprot_t clear_mask)
 {
 	struct page_change_data data;
 	int ret;
@@ -176,10 +176,6 @@ static int update_range_prot(unsigned long start, unsigned long size,
 	data.set_mask = set_mask;
 	data.clear_mask = clear_mask;
 
-	ret = split_kernel_leaf_mapping(start, start + size);
-	if (WARN_ON_ONCE(ret))
-		return ret;
-
 	lazy_mmu_mode_enable();
 
 	/*
@@ -194,6 +190,18 @@ static int update_range_prot(unsigned long start, unsigned long size,
 	return ret;
 }
 
+static int update_range_prot(unsigned long start, unsigned long size,
+			     pgprot_t set_mask, pgprot_t clear_mask)
+{
+	int ret;
+
+	ret = split_kernel_leaf_mapping(start, start + size);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	return __update_range_prot(start, size, set_mask, clear_mask);
+}
+
 static int __change_memory_common(unsigned long start, unsigned long size,
 				  pgprot_t set_mask, pgprot_t clear_mask)
 {
@@ -316,28 +324,52 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 					__pgprot(PTE_PRESENT_VALID_KERNEL));
 }
 
-int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
+int __set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
 {
 	pgprot_t clear_mask = __pgprot(PTE_PRESENT_VALID_KERNEL);
 	pgprot_t set_mask = __pgprot(PTE_PRESENT_INVALID);
 
+	return __update_range_prot((unsigned long)page_address(page),
+				   PAGE_SIZE * numpages, set_mask, clear_mask);
+}
+
+int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
+{
+	unsigned long start = (unsigned long)page_address(page);
+	int ret;
+
 	if (!can_set_direct_map())
 		return 0;
 
-	return update_range_prot((unsigned long)page_address(page),
-				 PAGE_SIZE * numpages, set_mask, clear_mask);
+	ret = split_kernel_leaf_mapping(start, start + PAGE_SIZE * numpages);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	return __set_direct_map_invalid_noflush(page, numpages);
 }
 
-int set_direct_map_default_noflush(struct page *page, unsigned int numpages)
+int __set_direct_map_default_noflush(struct page *page, unsigned int numpages)
 {
 	pgprot_t set_mask = __pgprot(PTE_PRESENT_VALID_KERNEL | PTE_WRITE);
 	pgprot_t clear_mask = __pgprot(PTE_PRESENT_INVALID | PTE_RDONLY);
 
+	return __update_range_prot((unsigned long)page_address(page),
+				   PAGE_SIZE * numpages, set_mask, clear_mask);
+}
+
+int set_direct_map_default_noflush(struct page *page, unsigned int numpages)
+{
+	unsigned long start = (unsigned long)page_address(page);
+	int ret;
+
 	if (!can_set_direct_map())
 		return 0;
 
-	return update_range_prot((unsigned long)page_address(page),
-				 PAGE_SIZE * numpages, set_mask, clear_mask);
+	ret = split_kernel_leaf_mapping(start, start + PAGE_SIZE * numpages);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	return __set_direct_map_default_noflush(page, numpages);
 }
 
 int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt)
-- 
2.56.0.542.g3ef89b7020-goog


