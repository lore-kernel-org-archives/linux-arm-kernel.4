Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA6606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v/Gh9D4s;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wHv0ZVVL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dCfP6OhX1xgWnjMEw/Fwz/hUIMTroe2e1vks4lC1ucM=; b=v/Gh9D4sKS8wPE
	mVu8HNYe25rTLm/aZCiahg3yRHTfyqi/FdUf4C2arIdDoEg2HbvDwLzQZN8Ay8OBvTPy0z3Bv/0Pm
	lQfBCyswEpjdKNtwPjrVjfKbqvbthLzXMpyC/G61UoIMdTctL6Rpw2uaen742mzJGdWpejpy8mQGr
	E5nK26UT1XAT/2yfRNsAf1ic7ruDEOnkUgPzWPVaDrCxnjM7BAk+BZ6itCh4Gm42h8fWgMHdNtmxh
	ciPdh9/4aRnxooZcsf7pMCEL9TrPogeB1yUBb6yvcyoDilWFM6zgWylv+FOznGixtzbqn3pxyiZw9
	VJAbI48L/tTOwRCKO8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp0H-00000004aYB-41lC;
	Tue, 10 Nov 2026 16:47:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp0C-00000004aVn-2JGb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:47:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so20495765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329239; x=1794934039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCfP6OhX1xgWnjMEw/Fwz/hUIMTroe2e1vks4lC1ucM=;
        b=wHv0ZVVLTJH3lHRzUDzwEzc8dLmECZy67pzIsGsEMqGuYsYdhVYknldPOEUfy4IJb7
         GkL+SnvhFBstaeOl+XSAwD8ky+kWfRHzq3jWOllJipM6xbXB6PDVbiQ9EjssK1qw3jL6
         cckegOuVFCK7VWAdHJHPApvOciEAtiYe8Sk6AzX0SDOwZKp5I7tu7uMz7KwieU2WMNu9
         paGWz5NdjGfHnCGXeBSa7jwVWjTsAwuej/qW4vf7frgKaRglHcTFobm3Dde6jcsBVkWV
         w6Lt6sfLGj30AYVvZsOe/jn6Xqs1O3zJnYVVU2UHJM12Q5qLGJ6UnjU+CXLDo63Qb68b
         Tz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329239; x=1794934039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCfP6OhX1xgWnjMEw/Fwz/hUIMTroe2e1vks4lC1ucM=;
        b=pQoL61h5muF8IXY8cS2S1NffsQCcaHIti919jUJwZGhClbDYSNrBxyHpDbusbAFkbN
         vb+UiUeA8OsduiGNEjkMpLL8MZRYXJwmTda+8ef3jyk4x+CYGqkc2urvKFQ1mzYrMKW1
         Rx09nUWfOclBKQukIm0ot3nS5dKmUIg8PxV+aZMv2AASwD8ABAJ0ipwYMk3rlRasBPx8
         ymFAN9TSA0uD8D2z2kabT1fQHuir0bJ9uVHW+x3kDeHUcnI4AnC+WL44eFpDmiTBvwbe
         A5aUK4WoRbI9hs8txgWGHuXSp+kFBcQ/xI+/JIHZWyhdHc3QuAWQh0r1a8wFi1Mdl1B+
         SSDQ==
X-Forwarded-Encrypted: i=1; AL+hErHjb3Pxk0VTkdK/eSMiseKHhHrnsTnYffa9JTDivOFbZqy6rlrSPRHXy+Xm7oL363VLTY8GM0Xm0CDugCqFtK3m@lists.infradead.org
X-Gm-Message-State: APuU4Z/Y5WmrvfidnkZdj5Nnn7jSXTUiULX2YvC+w5aBWpfPb/uPN8sP
	Cq+htq+V9Gri81QRwnOUoYanBOgnD1UFqzO/ElmBtrYMFL0aw7b/sK1i
X-Gm-Gg: AYBFou2qbRw+PcZiQyGM+zgQcYxIN7hNkG6zwnN2ZTkPmJNqsmbPwZ2X91C74YUxIYb
	S4zAv9LNbjp+IcepKfBuTAX6eFJAUGBdMVsSSDY6L8d7fvvoxW67Csrv790ljF9yR2HWQ8HLiBM
	gK++VxyGOI0uzuV0h73VXPxBH8Hh112pN+6vtqvqIPj9eIAh/OZtp9FfchEA/+SbMiPidJZXfie
	wVAeC8BZjLUUowfLQxRIR13q33Cxs7pO3MDY+0rL2IR2SZTgg6BpB+CyKl3+Fy8fOubcZ2tVcn3
	Ka9hlQWAnPlWzN+B2jVI1oWh7bZRtZEutjSLPg5FFFWMJE86CrL4ce04a8qpVCPuTc/hMKBjN4c
	ouFNq4Flh+GkkOMVR/T82kERtB4reWWOJpz+crIPrKKJGC/lrF0kOEPEZ2kR423IC6V5XOTbE5m
	oa/wo39reih1yf5UeASx+mtjDv5zFrQ/100rVmof4UjyJ14oVWoKJMFxWgew83GwAJM3i3S1KIt
	udyYl7NalHaJjsVaHTTsaVTtsE901L6pVOIT3pOQQUpTln5DjTeqap8HXb/JHGR0VXOC9YqaonZ
	ouc9v/q6F94Y8pKboauCeUMz6KLIki+oyW5ss4JPY8oHNVmolg0vy4JBoWorirEZYYr4xHTtF+p
	aShvwlmSkqZ56ILCv1hGXhrDN
X-Received: by 2002:a05:600c:8b21:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ba023085c6mr53018695e9.4.1794329238548;
        Tue, 10 Nov 2026 08:47:18 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.65.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm84905075e9.9.2026.11.10.08.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:47:17 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: maz@kernel.org,
	Oliver Upton <oupton@kernel.org>
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	fahad.arslan@siemens.com,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: Resume stage-2 unmap where the walk stopped
Date: Tue, 10 Nov 2026 21:47:06 +0500
Message-ID: <20261110164706.582879-2-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110164706.582879-1-haseebashraf091@gmail.com>
References: <20261110164706.582879-1-haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_084721_549697_F46D9855 
X-CRM114-Status: GOOD (  22.94  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

kvm_vm_stage2_unmap_range() unmaps a range one block-sized chunk at a
time. The walker steps over an invalid entry in one go, but the next
walk starts at the following chunk, so an invalid entry larger than a
chunk is visited once for every chunk it covers. Unmapping the whole
IPA space of a shadow stage-2, as emulating TLBI VMALLS12E1IS and TLBI
ALLE1IS does, takes 2^18 walks with 4K pages and a 48-bit IPA space,
however little it maps. Each walk also ends with a range TLBI when
FEAT_TLBIRANGE and FWB are available.

On an AmpereOne A192-32X (192 CPUs, Xen on KVM, 4K pages, 48-bit IPA),
a full-range unmap of one shadow stage-2 took 0.82-0.94 s (mean 0.91 s
over 192 unmaps) on 6.18.29. With this change and the mainline commits
it builds on backported, it took 2.1-27.8 ms (mean 3.8 ms over 128
unmaps), with 512 to 1024 walks instead of 262144. A TLBI VMALLS12E1IS
trap that unmapped two shadow stage-2s took up to 1.85 s before.

Add kvm_pgtable_stage2_unmap_range(), which returns the address its
walk reached, and have the unmap loop resume from there.
kvm_pgtable_stage2_unmap() still returns 0 or an error, for its
callers at EL2. The walk handles every entry it steps over, including
invalid entries that carry state, so nothing has to be looked up
beforehand.

The unmap of a shadow stage-2 also drops the guest stage-2 records of
the whole span the walk covered: nothing is mapped in the part it
stepped over, so any record there is stale. Each walk that remains
ends with the same deferred TLB invalidation as before. The spans that
were skipped have no valid entry, so there is nothing to invalidate.

Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 18 ++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 22 ++++++++--
 arch/arm64/kvm/mmu.c                 | 63 +++++++++++++++++++++++-----
 3 files changed, 90 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 1c9c57c..4ed096f 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -725,6 +725,24 @@ int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
  */
 int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
 
+/**
+ * kvm_pgtable_stage2_unmap_range() - Remove a mapping from a guest stage-2
+ *                                    page-table, and report where the walk
+ *                                    stopped.
+ * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
+ * @addr:	Intermediate physical address from which to remove the mapping.
+ * @size:	Size of the mapping.
+ *
+ * Same as kvm_pgtable_stage2_unmap(), but the walk can end past @addr + @size
+ * when it steps over an invalid entry that extends beyond the range. Nothing
+ * is mapped up to the address that is returned, so a caller that unmaps a
+ * larger range in chunks can resume from it.
+ *
+ * Return: the address the walk reached, which can be past @addr + @size, or a
+ * negative error code on failure.
+ */
+s64 kvm_pgtable_stage2_unmap_range(struct kvm_pgtable *pgt, u64 addr, u64 size);
+
 /**
  * kvm_pgtable_stage2_wrprotect() - Write-protect guest stage-2 address range
  *                                  without TLB invalidation.
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9c83837..b02f548 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1197,7 +1197,7 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
-int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
+s64 kvm_pgtable_stage2_unmap_range(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	int ret;
 	struct kvm_pgtable_walker walker = {
@@ -1205,13 +1205,29 @@ int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 		.arg	= pgt,
 		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
 	};
+	struct kvm_pgtable_walk_data data = {
+		.walker	= &walker,
+		.start	= ALIGN_DOWN(addr, PAGE_SIZE),
+		.addr	= ALIGN_DOWN(addr, PAGE_SIZE),
+		.end	= PAGE_ALIGN(data.addr + size),
+	};
 
-	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
+	ret = _kvm_pgtable_walk(pgt, &data);
 	if (stage2_unmap_defer_tlb_flush(pgt))
 		/* Perform the deferred TLB invalidations */
 		kvm_tlb_flush_vmid_range(pgt->mmu, addr, size);
 
-	return ret;
+	if (ret)
+		return ret;
+
+	return data.addr;
+}
+
+int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
+{
+	s64 ret = kvm_pgtable_stage2_unmap_range(pgt, addr, size);
+
+	return ret < 0 ? ret : 0;
 }
 
 struct stage2_attr_data {
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8..55a3cb5 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -319,22 +319,64 @@ static void invalidate_icache_guest_page(void *va, size_t size)
 	__invalidate_icache_guest_page(va, size);
 }
 
-static int kvm_pgtable_stage2_unmap_tracked(struct kvm_pgtable *pgt,
+static s64 kvm_pgtable_stage2_unmap_tracked(struct kvm_pgtable *pgt,
 					    u64 addr, u64 size);
 
+/*
+ * Unmap [start, end) one chunk at a time, resuming from the address that each
+ * walk reached. An invalid entry that is larger than a chunk is then stepped
+ * over once, rather than once for every chunk that it covers.
+ */
+static int stage2_apply_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
+				    phys_addr_t end,
+				    s64 (*fn)(struct kvm_pgtable *, u64, u64),
+				    bool resched)
+{
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+	bool lock_dropped = false;
+	phys_addr_t addr = start;
+	u64 next;
+	s64 ret;
+
+	do {
+		struct kvm_pgtable *pgt = mmu->pgt;
+
+		/*
+		 * We may be raced on PGT teardown when we release the
+		 * kvm->mmu_lock. That's fine as the PGT is legitimately no
+		 * longer present.
+		 */
+		if (!pgt)
+			return lock_dropped ? 0 : -EINVAL;
+
+		next = stage2_range_addr_end(addr, end);
+		ret = fn(pgt, addr, next - addr);
+		if (ret < 0)
+			return ret;
+
+		next = min_t(u64, ret, end);
+		if (resched && next != end) {
+			cond_resched_rwlock_write(&kvm->mmu_lock);
+			lock_dropped = true;
+		}
+	} while (addr = next, addr != end);
+
+	return 0;
+}
+
 static void kvm_vm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
 				      phys_addr_t start,
 				      u64 size, bool may_block)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
-	int (*fn)(struct kvm_pgtable *, u64, u64);
+	s64 (*fn)(struct kvm_pgtable *pgt, u64 addr, u64 size);
 
 	if (kvm_is_nested_s2_mmu(kvm, mmu))
 		fn = kvm_pgtable_stage2_unmap_tracked;
 	else
-		fn = kvm_pgtable_stage2_unmap;
+		fn = kvm_pgtable_stage2_unmap_range;
 
-	WARN_ON(stage2_apply_range(mmu, start, start + size, fn, may_block));
+	WARN_ON(stage2_apply_unmap_range(mmu, start, start + size, fn, may_block));
 }
 
 static void pkvm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
@@ -375,16 +417,17 @@ static void no_stage2_unmap_range(struct kvm_s2_mmu *mmu,
  * does.
  */
 
-static int kvm_pgtable_stage2_unmap_tracked(struct kvm_pgtable *pgt, u64 addr, u64 size)
+static s64 kvm_pgtable_stage2_unmap_tracked(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
-	int ret;
+	s64 ret;
 
-	ret = kvm_pgtable_stage2_unmap(pgt, addr, size);
-	if (ret)
+	ret = kvm_pgtable_stage2_unmap_range(pgt, addr, size);
+	if (ret < 0)
 		return ret;
 
-	kvm_remove_guest_s2_mappings(pgt->mmu, addr, size);
-	return 0;
+	/* The walk may have stepped over invalid entries: any record there is stale. */
+	kvm_remove_guest_s2_mappings(pgt->mmu, addr, ret - addr);
+	return ret;
 }
 
 /**
-- 
2.43.0


