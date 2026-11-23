Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B368606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 23:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OxUMHulx;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m8i0Vhfy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qaxHM38G/+bXzIaF++R5ruI8cfESxy9Hb2JWe3Lf6do=; b=OxUMHulxIUKrvyrIP1LCv6sx57
	DLalvMhET/Sd94HReKtUnL2fFaWhSgIK9TsxLlzLwlhoaWL9JPzd6OdXUnnEB5EXdhk7rUXY0pNyA
	Qjr75ZjRrF+zARKNlVnS6J7YBAH45bJFvknMC8FWBljSu4d1Ot1JQ2p7kUv2SjU+0Ze3srXwViicg
	G3bRmk2tdrbO/Yns+pfqPkEa0PkqodbE4xeHjQa/PmQoQ5dTk5bLUIs6hFBDu04C7+gMJSbX+Vurb
	t53O/0tNuL0yLOs/uHUvL6ea6RIb6udtHsHpi40dU3/Klk2n3qHPniB29pPYBkwREbaW8na1BGDMQ
	NWbgSUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdQz-00000005AGI-2rIy;
	Mon, 23 Nov 2026 23:26:53 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdQw-00000005AFJ-3BbD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 23:26:51 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-4dab94dc3e7so8948302b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795476409; x=1796081209; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qaxHM38G/+bXzIaF++R5ruI8cfESxy9Hb2JWe3Lf6do=;
        b=m8i0Vhfyn6gLH65OO91nJJl63d4hmJ5rKH6RX7fJeUhhu3bS/TGl+BkvOjjPfb8H3P
         iNNJTocFHVxWeleURvcO8bQMYtmcieWRQtpEeJ+XfFmk1XfLcEOYlBC85yn56YavlyS4
         EMJ+15ht1vhusbcY4zk1Yw1+DOaiBYahYMasooG5w/MOKuhxwB72zQQ2A2V64j2d2dhv
         ouRio4u4m2YdpjZgvwpdzkouyh21YN7PWQ7DOoBfTlZxfGHzXjodBmSnoR7rH//D1y8R
         pyFnc1TZDHp6uVLoAbmHvQY4YcO748BJetL6106hITgeuadQS28GW6uBuUt0FeIxgZ19
         nMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476409; x=1796081209;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaxHM38G/+bXzIaF++R5ruI8cfESxy9Hb2JWe3Lf6do=;
        b=POALV2WMJggQPo2oPmoWK7uSy/XMT948mw+thQcCI70w+9oXNumNf33EU3yx2K6ac/
         NZ5ez3S2zmSGl0K7V3xiWeRhCr/ixX9Ixd2yOqILFrKIB48r6o3492mk5JSuSpKnge6C
         U0vHP+32urBSeo4P8olAa2NDHqkmGauFGkNYrUlTxTh6xLGoN28BE8zGzMi32APYRuQu
         cV1Bg+RLxPRzeUJLNF+OCgUrBY42QI6IrqkIL6+LH/fA89orDVpZLzwzKwfddCBJ2NBY
         bxpa/I7OU8SJUFbm504SNmqYoSdr9YdFyFaKsAla3EgD8wJimRm16HHnKuvnLnVcGu7t
         ameg==
X-Forwarded-Encrypted: i=1; AL+hErGpmXECHAuWqu+45zd0iMOYFIJefL7dnncfdn90zq3WHsulHcfx4hgZoZ5dnHaio9CY2jHMQUuC3pAqXHl2lgUh@lists.infradead.org
X-Gm-Message-State: APuU4Z9NQa8at7G14jqaza2D1nZCoc8eTmMU26E9Lxq1FkyGqcF0fJ/J
	Pyww+eDcAL4e7PnaC2EixSdqxRP0XBdtegJbrNighdVtgtZqIpwCAyokbPruB0TPYY0JD17if6I
	/8NLyIMvygbxEQduiTg5DyKDydA==
X-Received: from iok27-n2.prod.google.com ([2002:a05:6602:c61b:20b0:9e0:ddf2:d76c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c211:b0:573:4e8b:1f5c with SMTP id 5614622812f47-57a0b048d59mr14167327b6e.35.1795476409032;
 Mon, 23 Nov 2026 15:26:49 -0800 (PST)
Date: Mon, 23 Nov 2026 23:26:46 +0000
In-Reply-To: <20261123232647.3733149-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261123232647.3733149-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261123232647.3733149-2-coltonlewis@google.com>
Subject: [PATCH v2 1/2] KVM: arm64: nv: Discard undersized TTL hints in compute_tlb_inval_range()
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, Dan Carpenter <dan@pereq.eu>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_152650_806320_83E54C69 
X-CRM114-Status: GOOD (  18.86  )
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

When an L1 guest issues TLBI IPAS2E1 with a non-zero TTL hint,
compute_tlb_inval_range() takes it at face value. If the hinted size is
smaller than the actual mapping (for example, a 4kB L3 hint on a 2MB
block), kvm_pgtable_stage2_unmap() clears the entire block while
kvm_remove_guest_s2_mappings() leaves its stale tracking entry behind in
guest_s2_mappings. On 16kB or 64kB hosts, a 4kB hint also triggers
WARN_ON(size & ~PAGE_MASK) in kvm_stage2_unmap_range().

A TTL hint smaller than PAGE_SIZE or the mapped entry is wrong. Check
it against PAGE_SIZE, the shadow stage-2 leaf size, and the guest block
size encoded in KVM_NV_GUEST_MAP_SZ. If it is too small, ignore the hint
and fall through to the unhinted invalidation path.

When falling back to the maximum mapping extent with stage-2 disabled,
size it from PAGE_SIZE rather than VTCR_EL2.TG0 so 1:1 shadow blocks are
still covered.

Fixes: d1de1576dc21 ("KVM: arm64: nv: Handle FEAT_TTL hinted TLB operations")
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/nested.c | 76 +++++++++++++++++++++++++++++------------
 1 file changed, 55 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28b..d3a19b1db2144 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -610,6 +610,19 @@ static u8 pgshift_level_to_ttl(u16 shift, s8 level)
 	return ttl;
 }
 
+static u8 vtcr_tg0_to_ttl_gran(struct kvm_s2_mmu *mmu)
+{
+	switch (vtcr_to_tg0_pgsize(kvm_s2_mmu_to_kvm(mmu), mmu->tlb_vtcr)) {
+	case SZ_4K:
+		return TLBI_TTL_TG_4K << 2;
+	case SZ_16K:
+		return TLBI_TTL_TG_16K << 2;
+	case SZ_64K:
+	default:	/* IMPDEF: treat any other value as 64k */
+		return TLBI_TTL_TG_64K << 2;
+	}
+}
+
 /*
  * Compute the equivalent of the TTL field by parsing the shadow PT.  The
  * granule size is extracted from the cached VTCR_EL2.TG0 while the level is
@@ -624,18 +637,7 @@ static u8 get_guest_mapping_ttl(struct kvm_s2_mmu *mmu, u64 addr)
 
 	lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
 
-	switch (tg0_size) {
-	case SZ_4K:
-		ttl = (TLBI_TTL_TG_4K << 2);
-		break;
-	case SZ_16K:
-		ttl = (TLBI_TTL_TG_16K << 2);
-		break;
-	case SZ_64K:
-	default:	    /* IMPDEF: treat any other value as 64k */
-		ttl = (TLBI_TTL_TG_64K << 2);
-		break;
-	}
+	ttl = vtcr_tg0_to_ttl_gran(mmu);
 
 	tmp = addr;
 
@@ -686,29 +688,61 @@ static u8 get_guest_mapping_ttl(struct kvm_s2_mmu *mmu, u64 addr)
 	return 0;
 }
 
+static bool tlbi_ttl_too_small(struct kvm_s2_mmu *mmu, u64 addr,
+			       unsigned long max_size)
+{
+	u8 guest_level;
+	kvm_pte_t pte;
+	s8 level;
+
+	lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
+
+	if (max_size < PAGE_SIZE)
+		return true;
+
+	if (kvm_pgtable_get_leaf(mmu->pgt, addr, &pte, &level, 0))
+		return false;
+
+	if (!kvm_pte_valid(pte))
+		return false;
+
+	if (kvm_granule_size(level) > max_size)
+		return true;
+
+	guest_level = FIELD_GET(KVM_NV_GUEST_MAP_SZ, pte);
+	if (guest_level &&
+	    __ttl_to_size(vtcr_tg0_to_ttl_gran(mmu) | guest_level) > max_size)
+		return true;
+
+	return false;
+}
+
 unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
 {
+	u64 addr = (val & GENMASK_ULL(35, 0)) << 12;
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+	u8 ttl = FIELD_GET(TLBI_TTL_MASK, val);
 	unsigned long max_size;
-	u8 ttl;
-
-	ttl = FIELD_GET(TLBI_TTL_MASK, val);
 
-	if (!ttl || !kvm_has_feat(kvm, ID_AA64MMFR2_EL1, TTL, IMP)) {
-		/* No TTL, check the shadow S2 for a hint */
-		u64 addr = (val & GENMASK_ULL(35, 0)) << 12;
-		ttl = get_guest_mapping_ttl(mmu, addr);
+	if (ttl && kvm_has_feat(kvm, ID_AA64MMFR2_EL1, TTL, IMP)) {
+		max_size = __ttl_to_size(ttl);
+		if (max_size && !tlbi_ttl_too_small(mmu, addr, max_size))
+			return max_size;
 	}
 
+	/* No usable TTL hint, check the shadow S2 for a hint */
+	ttl = get_guest_mapping_ttl(mmu, addr);
+
 	/*
 	 * Don't use the default 1GB fallback, as we can adapt to the
 	 * max mapping size we allow at S2.
 	 */
 	max_size = __ttl_to_size(ttl);
 
-	if (!max_size) {
+	if (max_size < PAGE_SIZE) {
 		/* Compute the maximum extent of the invalidation */
-		switch (vtcr_to_tg0_pgsize(kvm, mmu->tlb_vtcr)) {
+		switch (mmu->nested_stage2_enabled ?
+			vtcr_to_tg0_pgsize(kvm, mmu->tlb_vtcr) : PAGE_SIZE) {
 		case SZ_4K:
 			max_size = SZ_1G;
 			break;
-- 
2.56.1.839.g22a8290db9-goog


