Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AD6606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bPidgR7E;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D2nMpy3f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=emIFi9MtfIR7SpLGE9qwf6+LtUi3bsONfmSNGbybc/g=; b=bPidgR7Eo9q90z
	cCiq6gjYE0GE9JnMaNktTJBtg0crfRI6RG5KOm5Ne8WtyFJCI3wpn2OxNU50eY8yCxRzSVR7LfofL
	EejvWKa9+Zh0lftod1CvSNok0/QV+ENLDok4aAccHBwwMBsF7UhyPbebSpwCpKub9TOjfy0ta2+TL
	htuUL0ivoJp7AFUu7QhrZinqc9Zn6RW+6H28B9gbKbfGXnVx4muWOT6xHpvviw8LwjFLiLwynGdtR
	AGzlSKj8CJP5FB+2poDviCDpOgy/LwQ/PeShC1pIfSTl6KMbSP+G82EqQERVa+sr6yPM3bLGVOAnX
	v1i93Mg5ot/p2m+iwqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTY2f-00000007k08-01tq;
	Wed, 18 Nov 2026 05:17:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTY2a-00000007jz6-2o0R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:17:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so6171175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794979023; x=1795583823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emIFi9MtfIR7SpLGE9qwf6+LtUi3bsONfmSNGbybc/g=;
        b=D2nMpy3fRc0EXCIwa4VLQFBpeam+sHrG7o6GZ9+WbqcT8JrB3motjUFPd+oJxid09p
         QewmG5+bCNeDBygAB5YIBYrvhQ3uGI3nnNxosxr+/tVz/SFe9sWXqJ2Mog0F4WSiZEhD
         a7w/h8o7ahJRz3mlTnInBUj5onliZwXz3SfWgl3AbHO0WA8JpoOUcMLXjAzgW88uapCI
         ms2snvArInwXiR7gR0vfbopP9A88fL+YSiBLEihKzjIum6yr0fAZlnTebXYd89pjywvs
         qC9LPelDW89gomPjU0TLr+YlK7AeMsY/oJLMO/N8P+VnD+nc0k9SAEHpXSpc1uafN+SZ
         LB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979023; x=1795583823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=emIFi9MtfIR7SpLGE9qwf6+LtUi3bsONfmSNGbybc/g=;
        b=xd6hcYm76r21UCOlRpSPhmfH6IroOyxhZVZKsjJY48bnwdXVcMyTjJ04JAXlggDnNk
         iFDKfUeZIx9P5OKxX3IQ9A9dsvY+/fBSwY844F29RvodyAmZhXLK34oc4ndQnHIi4lrD
         KHRq3ViwFMkQ9n0Ip5a9LZnnj08/d527hJGhPM6Z8I029bItto1QBXxqSzy54vLc8qAD
         UeKCQOI37N+PezH2CSg/QIVXC1+MjOFoadRQgfgTg4kjR07ve7hlKnC1Uah3oXopXLmB
         xUpuoPtRV5nRjotf/tmiW8me2YFQh9M6qDHpGsAKiv7gCzl7gvNxoUU8a8SZc3d7m4js
         wQFw==
X-Forwarded-Encrypted: i=1; AL+hErHVdc3D1DgHqnDLHwKbThut3sN7zf6Cw7ZtDyZ2Wyi9Q3Jbg9oKDWpWqsfGW/81jLD91VDYEmb3dTUdtVHHlr3Y@lists.infradead.org
X-Gm-Message-State: APuU4Z9P78iAV7VwR2pZ8RR0hbiaYVsXE4KoMRCHtP9xHkMyr94QE/KY
	wK+FRJ2FgV0QNZ+EJeaceB5mVNVdRj0ISHFsU/DfU0UHYeSbLgIKk1X/
X-Gm-Gg: AYBFou1WAsJP5b/BUgzKUAlhTl0kaw3F5o0MJg8P8UGBHcK5Gky54fJVLDiDrJRJbXh
	V6pZmum4JjqHiuzg7h7vE246IvFIya0QHHrcJjLyoubUPJ+RQJd6PDfPphBN3g0dtSzCviF/IQH
	PnVPYctvDRVueLl6CtLuMxqhlr864tFEaSIXOLstV+v62U5SZxIg3l8XrqZc4KpRhnVwFmgEPdG
	4Xq7BVzbasyJwcY4GHhiPz9GElw3+0wqtUwR8J44C5+E4Od9b16Dgk11+2jLytn5zb/S08gjxhD
	f/dET+Id2j2lz0q3D7DMQXk+ySDFb/Rui4ZQZ7NPYn/wJMSgbk42tjmbza4xTFdrcm3dX2h7Uv+
	lRj7rs/AhuiJ1vekBHAMyahayL0W2zyoqakXRNZNb3cb8988hXwFDcOyjKAQoVVMTnaG4ZXjtyI
	G1v0D5oTA/MnIlR9MO5mS2Qyn5a4CoKoI8zj2nerR0JZOt8bIg4m0Ua+Oc+ZOiwP3P22rf5E7ni
	UcR70mPzkeBQjV2rAZ9jKuuRwhElQ5Hr7q1V5JNO6mNOvqrvzOWkUQK//U7Cx6mrh2vEnrODFFS
	nBWIQu2bHUwV5r0i+4fq00T7p5sbgxrxi5sbE94r/zZ828sjxcVL6n4hC3uKmdVZgTXQp1+iJWk
	hIdW14Nx4WAs4VI56mQXmpXkNQd8QkMdtAnQjj3MWGf8V
X-Received: by 2002:a05:600c:3e07:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb7da443fdmr24610265e9.20.1794979022474;
        Tue, 17 Nov 2026 21:17:02 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78346f4asm122582685e9.0.2026.11.17.21.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:17:02 -0800 (PST)
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
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] KVM: arm64: Resume stage-2 range walks where they stopped
Date: Wed, 18 Nov 2026 10:16:48 +0500
Message-ID: <20261118051648.74580-2-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118051648.74580-1-haseebashraf091@gmail.com>
References: <20261118051648.74580-1-haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_211704_881163_30AE79EE 
X-CRM114-Status: GOOD (  27.25  )
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

stage2_apply_range() walks a range one block-sized chunk at a time.
The walker steps over an invalid entry in one go, but the next walk
starts at the following chunk, so an invalid entry larger than a chunk
is visited once for every chunk it covers. Unmapping the whole IPA
space of a shadow stage-2, as emulating TLBI VMALLS12E1IS and TLBI
ALLE1IS does, takes 2^18 walks with 4K pages and a 48-bit IPA space,
however little it maps. Each walk also ends with a range TLBI when
FEAT_TLBIRANGE and FWB are available.

On an AmpereOne A192-32X (192 CPUs, Xen on KVM, 4K pages, 48-bit IPA),
a full-range unmap of one shadow stage-2 took 0.84-0.94 s (mean 0.91 s
over 226 unmaps) on 6.18.29. With v3 of this change and the mainline
commits it builds on backported, it took 2.1-45 ms (mean 4.1 ms over 672
unmaps), with 512 to 1023 walks instead of 262144. The slowest TLBI
VMALLS12E1IS trap took 0.94 s before and 46 ms after.

Have the walk report the address it reached, and have
stage2_apply_range() resume from there. Unmap, write-protect and flush
all go through it, so all three get this. kvm_pgtable_stage2_unmap(),
kvm_pgtable_stage2_wrprotect() and kvm_pgtable_stage2_flush() now
return the address, or a negative error code, and so do their pKVM
counterparts, which do not walk page tables and return the end of the
range. The other callers, in nested.c and at EL2, only looked for an
error: they now check for a negative value, and those that pass the
result on turn it back into 0. The walk handles every entry it steps
over, including invalid entries that carry state, so nothing has to be
looked up beforehand.

The unmap of a shadow stage-2 also drops the guest stage-2 records of
the whole span the walk covered: nothing is mapped in the part it
stepped over, so any record there is stale. Each walk that remains
ends with the same deferred TLB invalidation as before. The spans that
were skipped have no valid entry, so there is nothing to invalidate.

Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
 arch/arm64/include/asm/kvm_pgtable.h  | 25 ++++++++----
 arch/arm64/include/asm/kvm_pkvm.h     |  6 +--
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 22 +++++++----
 arch/arm64/kvm/hyp/pgtable.c          | 55 +++++++++++++++++----------
 arch/arm64/kvm/mmu.c                  | 32 ++++++++++------
 arch/arm64/kvm/nested.c               |  2 +-
 arch/arm64/kvm/pkvm.c                 | 14 +++----
 7 files changed, 97 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 1c9c57cd6ae4..cc9b4b6a5fe8 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -721,9 +721,12 @@ int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * freed. Unmapping a cacheable page will ensure that it is clean to the PoC if
  * FWB is not supported by the CPU.
  *
- * Return: 0 on success, negative error code on failure.
+ * Return: the address the walk reached, which can be past @addr + @size when it
+ * steps over an invalid entry that extends beyond the range, or a negative error
+ * code on failure. Nothing is mapped up to that address, so a caller that unmaps a
+ * larger range in chunks can resume from it.
  */
-int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
+s64 kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
 
 /**
  * kvm_pgtable_stage2_wrprotect() - Write-protect guest stage-2 address range
@@ -739,9 +742,12 @@ int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
  * calling this function to ensure that the updated permissions are visible
  * to the CPUs.
  *
- * Return: 0 on success, negative error code on failure.
+ * Return: the address the walk reached, which can be past @addr + @size when it
+ * steps over an invalid entry that extends beyond the range, or a negative error
+ * code on failure. A caller that write-protects a larger range in chunks can
+ * resume from the returned address.
  */
-int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
+s64 kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
 
 /**
  * kvm_pgtable_stage2_mkyoung() - Set the access flag in a page-table entry.
@@ -802,7 +808,7 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
 				   enum kvm_pgtable_walk_flags flags);
 
 /**
- * kvm_pgtable_stage2_flush_range() - Clean and invalidate data cache to Point
+ * kvm_pgtable_stage2_flush() - Clean and invalidate data cache to Point
  * 				      of Coherency for guest stage-2 address
  *				      range.
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
@@ -812,9 +818,14 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
  * The offset of @addr within a page is ignored and @size is rounded-up to
  * the next page boundary.
  *
- * Return: 0 on success, negative error code on failure.
+ * The walk can end past @addr + @size when it steps over an invalid entry that
+ * extends beyond the range. A caller that flushes a larger range in chunks can
+ * resume from the returned address.
+ *
+ * Return: the address the walk reached, which can be past @addr + @size, or a
+ * negative error code on failure.
  */
-int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
+s64 kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
 
 /**
  * kvm_pgtable_stage2_split() - Split a range of huge pages into leaf PTEs pointing
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index fd042d2b5462..b727600f2475 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -355,9 +355,9 @@ void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt);
 int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size, u64 phys,
 			    enum kvm_pgtable_prot prot, void *mc,
 			    enum kvm_pgtable_walk_flags flags);
-int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
-int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
-int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
+s64 pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
+s64 pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
+s64 pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
 bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64 size, bool mkold);
 int pkvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr, enum kvm_pgtable_prot prot,
 				    enum kvm_pgtable_walk_flags flags);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d4c332a91803..31900d2d1f13 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -383,16 +383,20 @@ static int host_stage2_unmap_dev_all(void)
 	struct kvm_pgtable *pgt = &host_mmu.pgt;
 	struct memblock_region *reg;
 	u64 addr = 0;
-	int i, ret;
+	int i;
+	s64 ret;
 
 	/* Unmap all non-memory regions to recycle the pages */
 	for (i = 0; i < hyp_memblock_nr; i++, addr = reg->base + reg->size) {
 		reg = &hyp_memory[i];
 		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
-		if (ret)
+		if (ret < 0)
 			return ret;
 	}
-	return kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr);
+
+	ret = kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr);
+
+	return ret < 0 ? ret : 0;
 }
 
 /*
@@ -1418,7 +1422,7 @@ int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 		goto unlock;
 	}
 
-	WARN_ON(kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE));
+	WARN_ON(kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE) < 0);
 	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HOST));
 
 unlock:
@@ -1600,7 +1604,7 @@ int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 {
 	u64 ipa = hyp_pfn_to_phys(gfn);
 	u64 size, phys;
-	int ret;
+	s64 ret;
 
 	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
 	if (ret)
@@ -1614,9 +1618,11 @@ int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 		goto unlock;
 
 	ret = kvm_pgtable_stage2_unmap(&vm->pgt, ipa, size);
-	if (ret)
+	if (ret < 0)
 		goto unlock;
 
+	ret = 0;
+
 	for_each_hyp_page(page, phys, size) {
 		/* __check_host_shared_guest() protects against underflow */
 		page->host_share_guest_count--;
@@ -1673,7 +1679,7 @@ int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_
 int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 {
 	u64 size, ipa = hyp_pfn_to_phys(gfn);
-	int ret;
+	s64 ret;
 
 	if (pkvm_hyp_vm_is_protected(vm))
 		return -EPERM;
@@ -1687,7 +1693,7 @@ int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 	ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, size);
 	guest_unlock_component(vm);
 
-	return ret;
+	return ret < 0 ? ret : 0;
 }
 
 int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct pkvm_hyp_vm *vm)
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9c83837b184d..84a3256d4488 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -261,8 +261,13 @@ static int _kvm_pgtable_walk(struct kvm_pgtable *pgt, struct kvm_pgtable_walk_da
 	return ret;
 }
 
-int kvm_pgtable_walk(struct kvm_pgtable *pgt, u64 addr, u64 size,
-		     struct kvm_pgtable_walker *walker)
+/*
+ * Walk [addr, addr + size) and return the address that the walk reached, or a
+ * negative error code. The address can be past addr + size when the walk steps
+ * over an invalid entry that extends beyond the range.
+ */
+static s64 kvm_pgtable_walk_next(struct kvm_pgtable *pgt, u64 addr, u64 size,
+				 struct kvm_pgtable_walker *walker)
 {
 	struct kvm_pgtable_walk_data walk_data = {
 		.start	= ALIGN_DOWN(addr, PAGE_SIZE),
@@ -270,7 +275,7 @@ int kvm_pgtable_walk(struct kvm_pgtable *pgt, u64 addr, u64 size,
 		.end	= PAGE_ALIGN(walk_data.addr + size),
 		.walker	= walker,
 	};
-	int r;
+	s64 r;
 
 	r = kvm_pgtable_walk_begin(walker);
 	if (r)
@@ -279,7 +284,15 @@ int kvm_pgtable_walk(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	r = _kvm_pgtable_walk(pgt, &walk_data);
 	kvm_pgtable_walk_end(walker);
 
-	return r;
+	return r ?: walk_data.addr;
+}
+
+int kvm_pgtable_walk(struct kvm_pgtable *pgt, u64 addr, u64 size,
+		     struct kvm_pgtable_walker *walker)
+{
+	s64 r = kvm_pgtable_walk_next(pgt, addr, size, walker);
+
+	return r < 0 ? r : 0;
 }
 
 struct leaf_walk_data {
@@ -1197,16 +1210,16 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
-int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
+s64 kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
-	int ret;
+	s64 ret;
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_unmap_walker,
 		.arg	= pgt,
 		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
 	};
 
-	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
+	ret = kvm_pgtable_walk_next(pgt, addr, size, &walker);
 	if (stage2_unmap_defer_tlb_flush(pgt))
 		/* Perform the deferred TLB invalidations */
 		kvm_tlb_flush_vmid_range(pgt->mmu, addr, size);
@@ -1258,12 +1271,12 @@ static int stage2_attr_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
-static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
+static s64 stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 				    u64 size, kvm_pte_t attr_set,
 				    kvm_pte_t attr_clr, kvm_pte_t *orig_pte,
 				    s8 *level, enum kvm_pgtable_walk_flags flags)
 {
-	int ret;
+	s64 ret;
 	kvm_pte_t attr_mask = KVM_PTE_LEAF_ATTR_LO | KVM_PTE_LEAF_ATTR_HI;
 	struct stage2_attr_data data = {
 		.attr_set	= attr_set & attr_mask,
@@ -1275,8 +1288,8 @@ static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 		.flags		= flags | KVM_PGTABLE_WALK_LEAF,
 	};
 
-	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
-	if (ret)
+	ret = kvm_pgtable_walk_next(pgt, addr, size, &walker);
+	if (ret < 0)
 		return ret;
 
 	if (orig_pte)
@@ -1284,10 +1297,10 @@ static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 
 	if (level)
 		*level = data.level;
-	return 0;
+	return ret;
 }
 
-int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
+s64 kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	return stage2_update_leaf_attrs(pgt, addr, size, 0,
 					KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
@@ -1298,11 +1311,11 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
 				enum kvm_pgtable_walk_flags flags)
 {
-	int ret;
+	s64 ret;
 
 	ret = stage2_update_leaf_attrs(pgt, addr, 1, KVM_PTE_LEAF_ATTR_LO_S2_AF, 0,
 				       NULL, NULL, flags);
-	if (!ret)
+	if (ret >= 0)
 		dsb(ishst);
 }
 
@@ -1361,7 +1374,7 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
 {
 	kvm_pte_t xn = 0, set = 0, clr = 0;
 	s8 level;
-	int ret;
+	s64 ret;
 
 	if (prot & KVM_PTE_LEAF_ATTR_HI_SW)
 		return -EINVAL;
@@ -1382,10 +1395,10 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
 	}
 
 	ret = stage2_update_leaf_attrs(pgt, addr, 1, set, clr, NULL, &level, flags);
-	if (!ret || ret == -EAGAIN)
+	if (ret >= 0 || ret == -EAGAIN)
 		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa_nsh, pgt->mmu, addr,
 			     (ret == -EAGAIN) ? TLBI_TTL_UNKNOWN : level);
-	return ret;
+	return ret < 0 ? ret : 0;
 }
 
 static int stage2_flush_walker(const struct kvm_pgtable_visit_ctx *ctx,
@@ -1403,7 +1416,7 @@ static int stage2_flush_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
-int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
+s64 kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_flush_walker,
@@ -1412,9 +1425,9 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 	};
 
 	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
-		return 0;
+		return addr + size;
 
-	return kvm_pgtable_walk(pgt, addr, size, &walker);
+	return kvm_pgtable_walk_next(pgt, addr, size, &walker);
 }
 
 kvm_pte_t *kvm_pgtable_stage2_create_unlinked(struct kvm_pgtable *pgt,
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db7..84fb7baafaa4 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -62,17 +62,23 @@ static phys_addr_t stage2_range_addr_end(phys_addr_t addr, phys_addr_t end)
  * CONFIG_LOCKUP_DETECTOR, CONFIG_LOCKDEP. Additionally, holding the lock too
  * long will also starve other vCPUs. We have to also make sure that the page
  * tables are not freed while we released the lock.
+ *
+ * @fn returns the address that its walk reached, or a negative error code. The
+ * address can be past the chunk it was given, when the walk stepped over an
+ * invalid entry that is larger than the chunk. The walk has processed entries
+ * up to that address, so the next chunk starts there: such an entry is then
+ * stepped over once, rather than once for every chunk that it covers.
  */
 static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
 			      phys_addr_t end,
-			      int (*fn)(struct kvm_pgtable *, u64, u64),
+			      s64 (*fn)(struct kvm_pgtable *pgt, u64 addr, u64 size),
 			      bool resched)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 	bool lock_dropped = false;
 	phys_addr_t addr = start;
-	int ret;
 	u64 next;
+	s64 ret;
 
 	do {
 		struct kvm_pgtable *pgt = mmu->pgt;
@@ -86,16 +92,17 @@ static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
 
 		next = stage2_range_addr_end(addr, end);
 		ret = fn(pgt, addr, next - addr);
-		if (ret)
-			break;
+		if (ret < 0)
+			return ret;
 
+		next = min_t(u64, ret, end);
 		if (resched && next != end) {
 			cond_resched_rwlock_write(&kvm->mmu_lock);
 			lock_dropped = true;
 		}
 	} while (addr = next, addr != end);
 
-	return ret;
+	return 0;
 }
 
 #define stage2_apply_range_resched(mmu, addr, end, fn)			\
@@ -319,7 +326,7 @@ static void invalidate_icache_guest_page(void *va, size_t size)
 	__invalidate_icache_guest_page(va, size);
 }
 
-static int kvm_pgtable_stage2_unmap_tracked(struct kvm_pgtable *pgt,
+static s64 kvm_pgtable_stage2_unmap_tracked(struct kvm_pgtable *pgt,
 					    u64 addr, u64 size);
 
 static void kvm_vm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
@@ -327,7 +334,7 @@ static void kvm_vm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
 				      u64 size, bool may_block)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
-	int (*fn)(struct kvm_pgtable *, u64, u64);
+	s64 (*fn)(struct kvm_pgtable *pgt, u64 addr, u64 size);
 
 	if (kvm_is_nested_s2_mmu(kvm, mmu))
 		fn = kvm_pgtable_stage2_unmap_tracked;
@@ -375,16 +382,17 @@ static void no_stage2_unmap_range(struct kvm_s2_mmu *mmu,
  * does.
  */
 
-static int kvm_pgtable_stage2_unmap_tracked(struct kvm_pgtable *pgt, u64 addr, u64 size)
+static s64 kvm_pgtable_stage2_unmap_tracked(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
-	int ret;
+	s64 ret;
 
 	ret = kvm_pgtable_stage2_unmap(pgt, addr, size);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
-	kvm_remove_guest_s2_mappings(pgt->mmu, addr, size);
-	return 0;
+	/* The walk may have stepped over invalid entries: any record there is stale. */
+	kvm_remove_guest_s2_mappings(pgt->mmu, addr, ret - addr);
+	return ret;
 }
 
 /**
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28..4f2b22f9faf9 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1413,7 +1413,7 @@ void kvm_nested_unmap_cipa_range(struct kvm *kvm, gpa_t cipa, size_t unmap_size,
 			mapping_size = mapping->nested.last - nested_start + 1;
 
 			if (WARN_ON_ONCE(kvm_pgtable_stage2_unmap(mmu->pgt, nested_start,
-								  mapping_size)))
+								  mapping_size) < 0))
 				return;
 
 			interval_tree_remove(&mapping->nested, &mmu->guest_s2_mappings);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 016997288fd2..2275451b8245 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -602,7 +602,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	return ret;
 }
 
-int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
+s64 pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 
@@ -611,10 +611,10 @@ int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
-	return __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
+	return __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size) ?: addr + size;
 }
 
-int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
+s64 pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	pkvm_handle_t handle = kvm->arch.pkvm.handle;
@@ -632,10 +632,10 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 			break;
 	}
 
-	return ret;
+	return ret ?: addr + size;
 }
 
-int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
+s64 pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	struct pkvm_mapping *mapping;
@@ -643,7 +643,7 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 	lockdep_assert_held(&kvm->mmu_lock);
 
 	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
-		return 0;
+		return addr + size;
 
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
 		if (!mapping->nc)
@@ -651,7 +651,7 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 						  PAGE_SIZE * mapping->nr_pages);
 	}
 
-	return 0;
+	return addr + size;
 }
 
 bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64 size, bool mkold)
-- 
2.43.0

