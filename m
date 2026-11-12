Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C00606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0dTPbkhH;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J4vEP5IE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Hj1fn4YijWukXcrgsrpSbQ0BagEFJZMcHse/ByJWp3c=; b=0dTPbkhHu4d8nyST5arKnPNgKC
	9+gg+EnTzaMKAifL1xxdlHAOo9nhXa3n7CxBJOpATv3nLPrySt28sg22XK9aOI3mdd4lYJglENMDQ
	fHRMXxKbGc2OWNm6iAy4O6ThnwLMwaIsMtHr6ykzLpHI74wqGYGQYp9TnGEwU737CJQbGPjlrT9k3
	gOxORijWlaTKr1nfhHVZVCab2AWvDlK6QOu3g2jVc5mELSObvZ14+vStJRTtD4uu4gU6cp8UzizV+
	1436Bb+LdHiBcxJKbYtr4IJKSsMNooN42YmpW1oCSC2ZyB5x3l+Yk7CuLGxYh6gh7hpPBgQUD0tMQ
	sLYsVo+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT7n-00000009kT1-1xQu;
	Thu, 12 Nov 2026 11:37:51 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT7k-00000009kRo-0uZP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:37:50 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4ba078abd70so15782495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 03:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794483465; x=1795088265; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hj1fn4YijWukXcrgsrpSbQ0BagEFJZMcHse/ByJWp3c=;
        b=J4vEP5IEP4/4WKBpQbaM6CHVqPbjpM7cLaNh+eXIjaMKKYi0PV+g8boSPc1Nx6TQqU
         qDQNn3MnRtvum/QdPEcTLhsEX7/fBAlMQ0dcXfYMzoDTom5nHFKKvJ8I9GYBcDLEc5Ic
         CSxeTStcs+CqYcRC/I7fIva8WWgib32SCW6MGmXgJYHadA3nLkI/npCWeZKmmmR0gKNy
         OhLxceowAK+KQKPs6JGTgykmZXdExTgnT3R6I8oS+mncML+C5DYJPIEY60R4XgVwaYiV
         p4FAcZ9nML4hVuoVVUHlUNfO6fmXDH6ekxaTthx4CrJYDo57LNFZGlj3P5UtJRnPk7P8
         O8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483465; x=1795088265;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hj1fn4YijWukXcrgsrpSbQ0BagEFJZMcHse/ByJWp3c=;
        b=WcVyRb6fBPG7+GLQ+g37C7VZQ85NgXdLsuHnu2Oe2/1ABQ9pwVDDtyfkf899fKAX/0
         fiX1BvUGGzKYgfgGyUH3DE/W74IlrvJdqO18zVPPYzjqzlIa/mhgtDrPjZNjuvnN+fV6
         BuQs/k09nKeoS2vt+7daC6Lh2Y8F2twn522AY+douo2KGH1FE/QJUSgiXxoYN5p+CDVH
         +QPWEaL9MVLx2teKB+L85l9MZzxsg2Cb1p/IVLA8QdhMxXoL9BM2jIw1B87TX2MrVEyJ
         jYMMed0x5QcavjKVug5enAVFIuViMH7sKJCpWoo1V35+ueZYG3khzhjX/Y5sXaullWb4
         jA5w==
X-Forwarded-Encrypted: i=1; AL+hErH8aH6XWUkCPCG0nl4HTxaEQU91tRGG0OmRYHnbpl+zYfCzTRTbdIFIiNV9noIv2OClvqZcJJ7QhSS6ZTdCIaXs@lists.infradead.org
X-Gm-Message-State: APuU4Z8ukGoPXfjV//VXpNcUTSGJQ4wvZN6p5SgVjjdLWuV56lWB38Jx
	W4RuiYSASKRJ4qFEP7WEZWA/Jfajo5XeOXSkA/oovoBzrFFJQ7WNk1f0vKC4MB7mTKqLRjGIYWJ
	0xmHLPBIud6n8VrEd54FmAg==
X-Received: from wrwc2.prod.google.com ([2002:a5d:63c2:0:b0:48e:a11:b240])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6095:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4ba09381439mr100508465e9.15.1794483464714;
 Thu, 12 Nov 2026 03:37:44 -0800 (PST)
Date: Thu, 12 Nov 2026 11:37:29 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112113729.2858513-1-vdonnefort@google.com>
Subject: [PATCH v2] KVM: arm64: Fast fail transparent_hugepage_adjust() for
 non-PMD folios
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_033748_992883_BCA4B65C 
X-CRM114-Status: GOOD (  19.64  )
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

transparent_hugepage_adjust() must walk the userspace stage-1 to detect
if a PMD-level mapping is installed and whether a stage-2 block mapping
can be used. Even though this stage-1 walk is most likely cache hot
(in most cases, the mapping has just been installed), walking a
page-table is still costly.

While we can't be sure by solely looking at the folio if the stage-1 is
a block mapping as userspace has multiple ways to split it, we can infer
from its size if the stage-1 mapping is smaller than PMD_SIZE. Anonymous
memory or memfd faults allocate a big enough folio, as do khugepaged or
MADV_COLLAPSE.

Add a fast fail based on the folio size: whenever a struct page is
present and its folio is not PMD-mappable, bail out early and do not
walk stage-1. This helps when THPs are disabled or under memory
pressure, while adding a folio check on the PMD-hit path.

To measure this walk on 100% PMD misses, function_graph traced
user_mem_abort() and get_user_mapping_size() with THP disabled while a
guest faulted PAGE_SIZE anonymous pages:

  Platform            Setup                get_user_mapping_size()
  ------------------  -------------------  -----------------------
  Apple M2 (big CPU)  nested L1->L2, perf  mean  5.25%, med  2.70%
  Ampere Altra        non-NV, VHE          mean 13.69%, med 12.28%

On non-NV VHE Ampere Altra, get_user_mapping_size() takes 0.26 us mean
(0.24 us median) out of 2.32 us in user_mem_abort(). On nested L1->L2
Apple M2, longer L1 user_mem_abort() handling shrinks the relative
share.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---

Notes:
    v2:
      - Reword commit message as a fast fail, describe the function_graph
        setup, and include both nested Apple M2 and non-NV Ampere Altra
        numbers (Marc)
    
    v1: https://lore.kernel.org/all/20261102211900.504192-1-vdonnefort@google.com/

 arch/arm64/kvm/mmu.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db7..9d81d908e230 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1553,36 +1553,42 @@ static bool fault_supports_stage2_huge_mapping(const struct kvm_s2_fault_desc *s
  * Returns the size of the mapping.
  */
 static long
-transparent_hugepage_adjust(const struct kvm_s2_fault_desc *s2fd, kvm_pfn_t *pfnp, gfn_t *gfnp)
+transparent_hugepage_adjust(const struct kvm_s2_fault_desc *s2fd,
+			    const struct kvm_s2_fault_vma_info *s2vi, kvm_pfn_t *pfnp, gfn_t *gfnp)
 {
 	struct kvm *kvm = s2fd->vcpu->kvm;
-	kvm_pfn_t pfn = *pfnp;
-	gfn_t gfn = *gfnp;
+	int sz;
 
 	/*
 	 * Make sure the adjustment is done only for THP pages. Also make
 	 * sure that the HVA and IPA are sufficiently aligned and that the
 	 * block map is contained within the memslot.
 	 */
-	if (fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE)) {
-		int sz = get_user_mapping_size(kvm, s2fd->hva);
+	if (!fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE))
+		return PAGE_SIZE;
 
-		if (sz < 0)
-			return sz;
+	/*
+	 * If the allocated folio isn't at least PMD_SIZE, there is no way a
+	 * stage-1 PMD level was installed.
+	 */
+	if (s2vi->page && !folio_test_pmd_mappable(page_folio(s2vi->page)))
+		return PAGE_SIZE;
 
-		if (sz < PMD_SIZE)
-			return PAGE_SIZE;
+	/*
+	 * Even though the folio size is big enough, the stage-1 mapping might
+	 * have been split. Verify it.
+	 */
+	sz = get_user_mapping_size(kvm, s2fd->hva);
+	if (sz < 0)
+		return sz;
 
-		gfn &= ~(PTRS_PER_PMD - 1);
-		*gfnp = gfn;
-		pfn &= ~(PTRS_PER_PMD - 1);
-		*pfnp = pfn;
+	if (sz < PMD_SIZE)
+		return PAGE_SIZE;
 
-		return PMD_SIZE;
-	}
+	*gfnp &= ~(PTRS_PER_PMD - 1);
+	*pfnp &= ~(PTRS_PER_PMD - 1);
 
-	/* Use page mapping if we cannot use block mapping. */
-	return PAGE_SIZE;
+	return PMD_SIZE;
 }
 
 static int get_vma_page_shift(struct vm_area_struct *vma)
@@ -2186,7 +2192,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		if (perm_fault_granule > PAGE_SIZE) {
 			mapping_size = perm_fault_granule;
 		} else {
-			mapping_size = transparent_hugepage_adjust(s2fd, &pfn, &gfn);
+			mapping_size = transparent_hugepage_adjust(s2fd, s2vi, &pfn, &gfn);
 			if (mapping_size < 0) {
 				ret = mapping_size;
 				goto out_unlock;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.567.gdb80ae8cd5-goog


