Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0685B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c34LyCsJ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fdUE5Vpd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IUG0dDHj/Zm5K5qiyoTo+dRTmDhIG43OjUhDi38YRoU=; b=c34LyCsJDzYd1p
	qtbjzi80s+4PrahgEm7lpVsTgfVTbrPRW6oori3OJpTzxL1cQF89jMWIbZ71lmCYNSPMGeoow+UIm
	/TMIu0598RifnIRUBR6Kkj84gIHUrJK+sR9W9pq/KxMZpqSCjsjKMlCqlDzHGZfsy/hlKmmzFWfqf
	pCRAwRHW9lcCO6OaEZ/R9+WNRM1zyhCnVZghMEoY8SyFwthwxiRPRxUQBGeagWxsihbj5WOoOAy8N
	TZzd++h5BHXOMVEKU828fCHO4uj/4HHx/mH5YmsHpcz4kCH8GQz3EbZFHHz2/eEekC6QQUrLwCnp4
	iUqed5EqxtBT/iQVswow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMYp-0000000CzuG-3sPU;
	Fri, 06 Nov 2026 16:13:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMYk-0000000Czr0-2YMb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:12:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF23D143D;
	Fri,  6 Nov 2026 08:12:54 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22A913F673;
	Fri,  6 Nov 2026 08:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793981578; bh=Hl+8S3N2mqoCQjLHJajTSd+0DIMoIu1+UBhREoQ7E5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fdUE5VpdaBYyeZvbjF77BnX40+05r2+gHOZ2gF5nxxwtnjdGCfA88LWUgwsTBIyco
	 Rd7DYlbOZtZYSNtDSR5tuf2PW6rm7sZXAzlb7/jXBYjApE+5aws3LF7VHgs93d842H
	 Xiy9eiiO6qt/AUbV6nyYY3sTMly4az30BW2MYzc4=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 3/3] KVM: arm64: Make stage2_split_walker() skip unnecessary walks
Date: Fri,  6 Nov 2026 16:12:38 +0000
Message-ID: <20261106161240.1345126-4-leo.bras@arm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106161240.1345126-1-leo.bras@arm.com>
References: <20261106161240.1345126-1-leo.bras@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489; i=leo.bras@arm.com; h=from:subject; bh=Hl+8S3N2mqoCQjLHJajTSd+0DIMoIu1+UBhREoQ7E5E=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLLe/ilTv+wk3vxgW8skn89LuiSUZWMfvgt2rDxp/XxRa tCV0hyVjlIWBjEuBlkxRRbZR/NX8XyfknHkyo8FMHNYmUCGMHBxCsBE0ncwMrz2LGpq32RUkXKN ++b6nElLfnlHKGldTZjFaSZbzqQ29zjD//K3Oj8K3Ra9Sq11mvxq7batm4zEI+7HLlq94NXDaSG WBfwA
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_081258_720067_04D4C673 
X-CRM114-Status: GOOD (  12.49  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, when splitting, all the child nodes will be walked, with the
walker just returning earlier if there is nothing to do. This means all
pagetable entries in the splitting range get a callback from the walker
function, even if it was a level-3 entry.

Optimize splitting by skipping all level-3 entries, as they are already the
smallest block size and can't be split any further.
(i.e. set flag KVM_PGTABLE_WALK_SKIP_LEVEL3)

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 80744478c810..f75cb666a103 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1565,21 +1565,22 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	new = kvm_init_table_pte(childp, mm_ops);
 	stage2_make_pte(ctx, new);
 	return 0;
 }
 
 int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			     struct kvm_mmu_memory_cache *mc)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_split_walker,
-		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.flags	= KVM_PGTABLE_WALK_LEAF |
+			  KVM_PGTABLE_WALK_SKIP_LEVEL3,
 		.arg	= mc,
 	};
 	int ret;
 
 	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
 	dsb(ishst);
 	return ret;
 }
 
 int __kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
-- 
2.55.0


