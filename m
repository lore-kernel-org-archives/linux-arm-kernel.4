Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58A5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xpq1d9aF;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YcabsUd/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=77KTT6cZRuUNbEJIodQuWC6IG6JmRZH/uyPXy4jlweQ=; b=Xpq1d9aF1QAV01xaaF+76MghSc
	FSicaEkwLgx9t3aojzSWrvoXIaUCI/rh1cKVfkqjUGCLkbl4sLVmdbCGc4fjvw2/2relPkIrjHFHE
	nHAtiReiIuy7PjSSSwSoDyZ5WTIxrDy06X1qaqMO8NJFSuLIGOCYMsj5he8jW9ARDwCq2Chl6+ubD
	NSjqKmYPBnb4IbD/8YfE9K7rxu+wQX0K40H2kJ+KP6GN58t9x1XETMJywrh6s/16JP3Xne3BwiBFJ
	87onaPu/yZQ6r3RV1I2WwSZuNGh+kXqYH4L2JK+3HVbQXuAxa2xJ36QDnEdfFMvIZKtfUIpUJ8HBj
	3A4rDOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNF2-00000006ecx-0CLz;
	Tue, 17 Nov 2026 17:45:12 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEV-00000006e6T-09HX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:40 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso1025755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937477; x=1795542277; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77KTT6cZRuUNbEJIodQuWC6IG6JmRZH/uyPXy4jlweQ=;
        b=YcabsUd/P1cMwdFySjGmjb/MW/Ya+uYpJqBA7eoFmBrVrjkUUsRD9Y+5gRDpTStUWZ
         zWr29tiBqfGCmA3H2eVc2flXIbNGh8CzvmfabCdZ+ZlPETis8vb8WxVf23zNIWZeMsc1
         lVzI+2dt14HmdT5Amjeq12yeZ904sb6uVbQ5TjPdvepUE/qyYcEx+xdccIz26o8skO37
         Fd8IUohsV/HolTFqp/Gw3goRqRgl2gw3izssLOqfCFsNtweqZRnzSi/cGfgxf34PcgLV
         96+e5F/J1qtBuG3wFwvCDSNgQetQ8D+Ij/9y4mzLnCmZFoew/gnZGS1PJpcj1my8nMHV
         omHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937477; x=1795542277;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77KTT6cZRuUNbEJIodQuWC6IG6JmRZH/uyPXy4jlweQ=;
        b=C05QDZTNuRVU3fJQk9/yPaIP1C9qpzZSrRKRHABSIs5+pX1dtc7rYAVqXp7fiXpsEY
         Bt4IG/Xv8XTXmSogknSnke37BYnxh8CLYXvrWoAOKkASaNM1/RYIu7XI1shl544Yerrz
         ITd87Z9kdI77u0pRVtivPL93OgGZbLX0B9o7ovI4f7/JIdK7SN9rNeWtgdrI/EtyZEfL
         Auq6bzmG57QPupBkIV5YbY72ru+nWxhu/x8wKsClaf7nVbTj1IwUZz5cMVfHq7MWYW7A
         YPzz+NijN0h8dmslQLVd6ZXhuSe4Zre1fWnVV6xb3i+ymC8T6ovCO7UkV2v38TciJcP1
         rRPg==
X-Forwarded-Encrypted: i=1; AL+hErF9nmWQ+Bp1XYr5JKNeBwu5IzwDmiW/+zzyWZh4QQtmyfQbiwSueMqT+ZH6g/2kwTrgVqa/ZQkA7eciT/3Xf9LO@lists.infradead.org
X-Gm-Message-State: APuU4Z9vsvpzRj4oBAr/SROLMV9QHtVItnROZPhVWfBipMUvA7UMV5G6
	+Yow54Vh3w3Czl/uS6d7ZNTFI43MOLU3VGEvhL2esk+qJPmcjX0CLavQHPpXdxBG/GDOS+Lhjj3
	WEljjEDF/dQNv44K1Z/S+pQ==
X-Received: from wrvi15.prod.google.com ([2002:a5d:558f:0:b0:49e:3982:e207])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:428c:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4bb55aabd53mr199317825e9.29.1794937476762;
 Tue, 17 Nov 2026 09:44:36 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:57 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-19-vdonnefort@google.com>
Subject: [PATCH v4 18/23] KVM: arm64: Introduce kvm_pgtable_stage2_table_install()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094439_111920_9F1B8A5A 
X-CRM114-Status: GOOD (  17.77  )
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

The existing kvm_pgtable_stage2_split() is unfit for pKVM: it relies on
kvm_mmu_memory_cache which pKVM doesn't use and has no easy way to
handle pKVM-specific annotations.

Add the pgtable helper kvm_pgtable_stage2_table_install() so pKVM can
handle block splitting in mem_protect.c. That helper can take a table
either populated with kvm_pgtable_stage2_create_unlinked() or one filled
with annotations.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 13 +++++
 arch/arm64/kvm/hyp/pgtable.c         | 86 ++++++++++++++++++++++++----
 2 files changed, 88 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 1c9c57cd6ae4..5d5d2165dbec 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -835,6 +835,19 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
 int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			     struct kvm_mmu_memory_cache *mc);
 
+/**
+ * kvm_pgtable_stage2_table_install() - Replace a stage-2 leaf entry with a table.
+ * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
+ * @table:	Unlinked stage-2 paging structure to install, such as one
+ *		created by kvm_pgtable_stage2_create_unlinked().
+ * @addr:	Address identifying the leaf entry to replace.
+ * @level:	Level of the leaf entry to replace.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int kvm_pgtable_stage2_table_install(struct kvm_pgtable *pgt, kvm_pte_t *table,
+				     u64 addr, s8 level);
+
 /**
  * kvm_pgtable_walk() - Walk a page-table.
  * @pgt:	Page-table structure initialised by kvm_pgtable_*_init().
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index abd32e94f6ff..1ad4f854c442 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1537,18 +1537,38 @@ static int stage2_block_get_nr_page_tables(s8 level)
 	};
 }
 
+static int stage2_table_install(const struct kvm_pgtable_visit_ctx *ctx,
+				struct kvm_s2_mmu *mmu,
+				kvm_pte_t *table)
+{
+	kvm_pte_t new;
+
+	if (!stage2_try_break_pte(ctx, mmu))
+		return -EAGAIN;
+
+	/*
+	 * Note, the contents of the page table are guaranteed to be made
+	 * visible before the new PTE is assigned because stage2_make_pte()
+	 * writes the PTE using smp_store_release().
+	 */
+	new = kvm_init_table_pte(table, ctx->mm_ops);
+	stage2_make_pte(ctx, new);
+	return 0;
+}
+
 static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 			       enum kvm_pgtable_walk_flags visit)
 {
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
 	struct kvm_mmu_memory_cache *mc = ctx->arg;
-	struct kvm_s2_mmu *mmu;
-	kvm_pte_t pte = ctx->old, new, *childp;
+	kvm_pte_t pte = ctx->old, *childp;
 	enum kvm_pgtable_prot prot;
+	struct kvm_s2_mmu *mmu;
 	s8 level = ctx->level;
 	bool force_pte;
 	int nr_pages;
 	u64 phys;
+	int ret;
 
 	/* No huge-pages exist at the last level */
 	if (level == KVM_PGTABLE_LAST_LEVEL)
@@ -1590,18 +1610,12 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	if (IS_ERR(childp))
 		return PTR_ERR(childp);
 
-	if (!stage2_try_break_pte(ctx, mmu)) {
+	ret = stage2_table_install(ctx, mmu, childp);
+	if (ret) {
 		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
-		return -EAGAIN;
+		return ret;
 	}
 
-	/*
-	 * Note, the contents of the page table are guaranteed to be made
-	 * visible before the new PTE is assigned because stage2_make_pte()
-	 * writes the PTE using smp_store_release().
-	 */
-	new = kvm_init_table_pte(childp, mm_ops);
-	stage2_make_pte(ctx, new);
 	return 0;
 }
 
@@ -1620,6 +1634,56 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	return ret;
 }
 
+struct stage2_table_install_data {
+	struct kvm_s2_mmu	*mmu;
+	kvm_pte_t		*table;
+	s8			level;
+};
+
+static int stage2_table_install_walker(const struct kvm_pgtable_visit_ctx *ctx,
+				       enum kvm_pgtable_walk_flags visit)
+{
+	struct stage2_table_install_data *data = ctx->arg;
+
+	if (ctx->level != data->level)
+		return -EINVAL;
+
+	/*
+	 * On success, return a positive value to prevent descending into the
+	 * new table.
+	 */
+	return stage2_table_install(ctx, data->mmu, data->table) ?: 1;
+}
+
+int kvm_pgtable_stage2_table_install(struct kvm_pgtable *pgt, kvm_pte_t *table,
+				     u64 addr, s8 level)
+{
+	struct stage2_table_install_data data = {
+		.mmu	= pgt->mmu,
+		.table	= table,
+		.level	= level,
+	};
+	struct kvm_pgtable_walker walker = {
+		.cb	= stage2_table_install_walker,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.arg	= &data,
+	};
+	int ret;
+
+	if (level < pgt->start_level || level >= KVM_PGTABLE_LAST_LEVEL)
+		return -EINVAL;
+
+	if (!IS_ALIGNED(addr, kvm_granule_size(level)))
+		return -EINVAL;
+
+	ret = kvm_pgtable_walk(pgt, addr, kvm_granule_size(level), &walker);
+	if (ret < 0)
+		return ret;
+
+	dsb(ishst);
+	return 0;
+}
+
 int __kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			      struct kvm_pgtable_mm_ops *mm_ops,
 			      enum kvm_pgtable_stage2_flags flags,
-- 
2.56.1.708.g77570a6a1d-goog


