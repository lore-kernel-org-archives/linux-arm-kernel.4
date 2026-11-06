Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE768606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GZAaCM9j;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XSwyrou1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MLkiO5+iQTmH9kwercp9zyxtA2cVUMT1WfXqJlOm5MI=; b=GZAaCM9j/TO+h3OjhbW6OOSBmJ
	coNv/wAlM7ZeF3rIquKb6OfLtenOvHnRdxKhnh0OFkttdyXIedK9MJmjokgnnuyx1OP6YDCB6JqAE
	UU1I1giGIaB6+xD3QJIUlkhAbtb2C3J7xv3cUsLhTKIxctZAqGpnKVFF3GKEHAPbelD/QbCai52B6
	UL9UPdyHPCDni9gkPs6tmAL5XazH3995fSZnCxTU1wbOQznJuNko9Vuri/JXLv9ooAjuFfqQvQQjR
	Tnku7tIvgsANQOz3hL1IOKpSkkWSRGgi6dlosxjB52f7srNIt6sKV4zTW+qtimYSpw8/1AzriLqRO
	Hxbyc+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNjR-0000000DE7t-3udY;
	Fri, 06 Nov 2026 17:28:05 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNjP-0000000DE6l-0fn2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 17:28:04 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c3613c35145so112341166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 09:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793986080; x=1794590880; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLkiO5+iQTmH9kwercp9zyxtA2cVUMT1WfXqJlOm5MI=;
        b=XSwyrou1z9qTCd7td4lZnGpRutddipp940tUOH43S51u3GOnkK7JTQc6V+qUARaqnB
         mWE8n7TG1GXNkYnAYCMTlU0DElWe+rRUiE15fM52pUt3G9wP6+tEv9Kr3FKZGOsI+/r7
         YCggbodwSl4q5jjFRsjhC9ZCm8raPDzPwPyljuEPuX365PwpnsmzjqGYDWeOON+xSn44
         j+AfL/qSayKn7bjsRbmwg9Ne62QWcZOoQKjL/R6TzblWPJ5y/7vGoGs84WKM6/wgzgqU
         c87CMries/VBhH65yjiJXgA/HB4KRlqHSjlcrGArPKN7qMT7cfhl3nr0eTSgY5b8bnOY
         tnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986080; x=1794590880;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLkiO5+iQTmH9kwercp9zyxtA2cVUMT1WfXqJlOm5MI=;
        b=Vnh3QTQIsLZAV+WFfZnuXbTeU+c6Posyq1fUP2N8EXEXwKAkT7oUODb3ZaylUhN8aN
         B/8VC84cBRCpEVI993blRNxw8GYdUmj2pLWqj/fVMDRlRpkDszHDc7J153ZZX4bdOP1u
         rwCn0UkjWuZMxa9kqPKgGhYKKpk1w4h3blx6maS3XzZRM2TNry6wavYOlX2GwzS4LRLQ
         84lxdjKGn7J2SozDgyYahzuZfdfutZF1t2+muNGo6wqKUEMRxDShazvI96XnkGGffSI/
         wvxuXUfX+Tzyfca5awSaxZxBjVOSETY1aH1DtnGPYltcT3jNi3mN4B4JCuByFAWa8R75
         xXBw==
X-Forwarded-Encrypted: i=1; AL+hErG+uYaJWCdI+hN5lRtcw4+oNy8snoxcrS5q0MCrehx0vHYwbhbPpapoUu2htN+hXLm8vcx6NHKJkcOIp75rPtkI@lists.infradead.org
X-Gm-Message-State: APuU4Z9KRGzmvUeMn/JfAojOJj25pbvJmpmQJb9zUuWmK6R+2TwU8KL5
	nLOjIpeaTwlGCFpY6ITeSeelSs3ps6J3vNRQmexflEwKHndmel57CmZCg28bKL11OZDhsdTV9xM
	0QSsH5D/Dui93tQ==
X-Received: from edzd18.prod.google.com ([2002:a05:6402:8d2:b0:6b4:6266:6380])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5191:b0:6b4:641:baed with SMTP id 4fb4d7f45d1cf-6b59783b40amr2200349a12.30.1793986080211;
 Fri, 06 Nov 2026 09:28:00 -0800 (PST)
Date: Fri,  6 Nov 2026 17:27:49 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106172750.2678873-1-smostafa@google.com>
Subject: [PATCH v3] KVM: arm64: Use consistent type for pool size
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, xuheng@cs.columbia.edu, Mostafa Saleh <smostafa@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_092803_215952_74B26034 
X-CRM114-Status: GOOD (  14.12  )
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
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All the pool sizes in the hypervisor are "unsigned long" but when
they get passed to hyp_early_alloc_contig() or hyp_pool_init() they get
truncated to 32-bits.

That is not a big problem at the moment as to overflow this we need
4G bytes of carveout (2 TB of host or guest system memory).

However when new users are added (as IOMMU) it is hard to reason
about the carveout size anymore.

Fixes: e75960408723 ("KVM: arm64: Introduce an early Hyp page allocator")
Fixes: 8e17c66249e9 ("KVM: arm64: Introduce a Hyp buddy page allocator")
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/early_alloc.h | 2 +-
 arch/arm64/kvm/hyp/include/nvhe/gfp.h         | 4 ++--
 arch/arm64/kvm/hyp/nvhe/early_alloc.c         | 2 +-
 arch/arm64/kvm/hyp/nvhe/page_alloc.c          | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h b/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
index dc61aaa56f31..462883c4e325 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
@@ -7,7 +7,7 @@
 void hyp_early_alloc_init(void *virt, unsigned long size);
 unsigned long hyp_early_alloc_nr_used_pages(void);
 void *hyp_early_alloc_page(void *arg);
-void *hyp_early_alloc_contig(unsigned int nr_pages);
+void *hyp_early_alloc_contig(unsigned long nr_pages);
 
 extern struct kvm_pgtable_mm_ops hyp_early_alloc_mm_ops;
 
diff --git a/arch/arm64/kvm/hyp/include/nvhe/gfp.h b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
index 3766333bace9..3a428dc40b14 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/gfp.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
@@ -29,6 +29,6 @@ void hyp_get_page(struct hyp_pool *pool, void *addr);
 void hyp_put_page(struct hyp_pool *pool, void *addr);
 
 /* Used pages cannot be freed */
-int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
-		  unsigned int reserved_pages);
+int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages,
+		  unsigned long reserved_pages);
 #endif /* __KVM_HYP_GFP_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/early_alloc.c b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
index 00de04153cc6..9fef0c7d2185 100644
--- a/arch/arm64/kvm/hyp/nvhe/early_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
@@ -21,7 +21,7 @@ unsigned long hyp_early_alloc_nr_used_pages(void)
 	return (cur - base) >> PAGE_SHIFT;
 }
 
-void *hyp_early_alloc_contig(unsigned int nr_pages)
+void *hyp_early_alloc_contig(unsigned long nr_pages)
 {
 	unsigned long size = (nr_pages << PAGE_SHIFT);
 	void *ret = (void *)cur;
diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
index 57f86aa0f82f..51460d420c94 100644
--- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
@@ -229,12 +229,12 @@ void *hyp_alloc_pages(struct hyp_pool *pool, u8 order)
 	return hyp_page_to_virt(p);
 }
 
-int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
-		  unsigned int reserved_pages)
+int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages,
+		  unsigned long reserved_pages)
 {
 	phys_addr_t phys = hyp_pfn_to_phys(pfn);
 	struct hyp_page *p;
-	int i;
+	unsigned long i;
 
 	hyp_spin_lock_init(&pool->lock);
 	pool->max_order = min(MAX_PAGE_ORDER,
-- 
2.56.0.455.g6c5a503b38-goog


