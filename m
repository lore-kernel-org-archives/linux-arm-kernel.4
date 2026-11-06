Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5D0606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aiSg9rOI;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eA6Hxb7l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IzYdba36GspgDjYCPt5LO98rRURFAs6wAt+eFJNJspY=; b=aiSg9rOIB366SP
	8vCh7Fh11aZVlsppK96guKdGwuUOoevKOxczA7x4Nen5EmPo/xwPT72F5ehS8slJGLuT/W9ItE8vi
	q4ktC/xQuP2RqSldqdXVxxagymcNuE6x2NMjjOj5YqAzrzu5PGrk+2KJei1KCkoAS0fCPrRSggtkV
	O2eiyAZ31x0/MSicIFOf8zK8WcLoJM9qu3JmsCK4Ic2jz4odYSDjGe5LMwNEJJwX1R2zHV/jMDgF5
	nzrE8hsLPBn47sDHxLsaa1+J8dCDawUeNtYIkduj2roSVQGpsGaS25drPMd1kRHLOTUQ4mhJiE++v
	84pOcqmfW++ksHZ6MUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMYk-0000000Czr4-2m55;
	Fri, 06 Nov 2026 16:12:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMYg-0000000Czp0-0nIK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:12:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EB281682;
	Fri,  6 Nov 2026 08:12:50 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B55EF3F673;
	Fri,  6 Nov 2026 08:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793981573; bh=Br5fuZ4ryUMLMGwj9gH1YIvLvzgbJoEJcgmiUYmIM+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eA6Hxb7laN0mQTfezkjmx/crOKl95bgN2ClQCvUp6O0uSUBdvpyYTzS4t+T2akrf0
	 RciWHgDoXqQfvCaK3ZeQfav3XnjvEhIEmRataJGjxg4WiCTLCo9i86ewbOL3rMLgFY
	 r7nn076YUyIDRaeEcq6lQllJTDpC62QRMOF8I1go=
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
Subject: [PATCH RESEND v4 1/3] KVM: arm64: Avoid re-testing walk_continue
Date: Fri,  6 Nov 2026 16:12:36 +0000
Message-ID: <20261106161240.1345126-2-leo.bras@arm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106161240.1345126-1-leo.bras@arm.com>
References: <20261106161240.1345126-1-leo.bras@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=leo.bras@arm.com; h=from:subject; bh=Br5fuZ4ryUMLMGwj9gH1YIvLvzgbJoEJcgmiUYmIM+E=; b=kA0DAAoW7HZo80cCoa8ByyZiAGrt/HWh0IdRfCiNcvabr5HQs/y9ucx40eg3mASTh9Qu7zzuu Ih1BAAWCgAdFiEEHeKfqgz3lGjE1Pig7HZo80cCoa8FAmrt/HUACgkQ7HZo80cCoa/aRgEArRY7 EUqzjS3eacxXx9J5Y3d9lPF4N8cENW1e4NkNFkYA/irD9Cc0/MRCJvex/HFujfxUqXy9m7sgJqx 9RZHxwt8M
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_081254_395856_31790D71 
X-CRM114-Status: GOOD (  13.90  )
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

__kvm_pgtable_visit() performs a bunch of calls to
kvm_pgtable_walk_continue() to find out whether the walk can continue
further, and if not, 'goto out', which retests the possibility of
continuing the walk before exiting.

Given that it's testing the same ret variable again, there is no reason
the result of kvm_pgtable_walk_continue() would have changed since the
previous check. So turn this goto into an early return, simplifying the
code and paving the way for further rework."

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd..7a51f78b6446 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -183,32 +183,32 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
 	 * Reload the page table after invoking the walker callback for leaf
 	 * entries or after pre-order traversal, to allow the walker to descend
 	 * into a newly installed or replaced table.
 	 */
 	if (reload) {
 		ctx.old = READ_ONCE(*ptep);
 		table = kvm_pte_table(ctx.old, level);
 	}
 
 	if (!kvm_pgtable_walk_continue(data->walker, ret))
-		goto out;
+		return ret;
 
 	if (!table) {
 		data->addr = ALIGN_DOWN(data->addr, kvm_granule_size(level));
 		data->addr += kvm_granule_size(level);
 		goto out;
 	}
 
 	childp = (kvm_pteref_t)kvm_pte_follow(ctx.old, mm_ops);
 	ret = __kvm_pgtable_walk(data, mm_ops, childp, level + 1);
 	if (!kvm_pgtable_walk_continue(data->walker, ret))
-		goto out;
+		return ret;
 
 	if (ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
 		ret = kvm_pgtable_visitor_cb(data, &ctx, KVM_PGTABLE_WALK_TABLE_POST);
 
 out:
 	if (kvm_pgtable_walk_continue(data->walker, ret))
 		return 0;
 
 	return ret;
 }
-- 
2.55.0


