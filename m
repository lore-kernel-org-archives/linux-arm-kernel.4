Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE38606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Dy8e8OC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RoaFQN//;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fuQVgPFD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lWio/ZaYW+Ez8es1JnqyfDCIZ2Tx6iwXiB9k3U+N5Zs=; b=1Dy8e8OCuhlB43
	Z8QnpAt+MDPTT+J5w5kGv8yN11haUnQ59x0DNmawjuFysbn6DD2JgtRZFB9S+xuAs2lcd8oYjsPMD
	lusMSbz5qmgZzH+uoU4LEkgnap60tES6E48Qi+07+MZUqNRTyR6n0HLQmnFw3GWG5+rmjtkX26ije
	xwVF1anhxOqw9t8/riSDtKC42BNszGsBSQuY5t7cEEnZQAcdUgHXwPRMF3l32J3VGCbWLbW9y+KVG
	pr1g9gevwVeHcySqeZPITQeYsI/i1jZ7MTAii+SYZmRibFNuWMUwjoS+MX/b7KQqJLVFw8YZsnxVp
	olYFPDNwOmymswvHgMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVROq-00000002yNr-3PBm;
	Mon, 23 Nov 2026 10:35:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVROK-00000002yGy-2lEI
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 10:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lWio/ZaYW+Ez8es1JnqyfDCIZ2Tx6iwXiB9k3U+N5Zs=; b=RoaFQN//cQTi9PI8CkJmuerO/l
	RTAI1IxlR4VbgWhf/Fh6LQEli3RArVnflX2CSJ8RmgdEM/UT7tzrl/cZMx/HqTPpWCQnUBqhAOxZa
	b7soiWCMdPGOMkFr/nrsrhXusppi3zR8fD5BYd7jcgKLLUt0yS07yaGp6Lcy10Ys0nWXXpik8KoqK
	WeJxgetcbs/NpClIFHQA5THt+FceVgWjLjOITIzXKWzma+XVltyFDmIS9Fo3JwJ3CUlYFjaO3DzLu
	xgROkNc/EXXCdpcJMQtdZWCAeznt2aSH44ACasAkQQlWePOZiM4UO1P3Lw4epf8NtWf3RjYniWg22
	3xR9GM/g==;
Received: from out-11.mta1.migadu.com ([2001:41d0:203:375::b] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVROI-00000002zhd-06bG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:35:19 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=IDG8FN6cGRh+zZL5h3B/Xnl0MXwN5GMGINSU+pdwgF8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795430112; v=1; x=1796034912;
 b=fuQVgPFDCIdL2Zne2TVj3GoYIYtkL33UcpxVa0zTpwA7uFOXdeVnZfCEJZbBfkYG1QGTyU/a
 KMtiH5BOJSLLaqTnmShzo6ivxYpeYCAxE4WDKkYu73UbzXeu/wjjNjbOV2tmwQabVJTEu5M7pAJ
 sehEXEVntOWW4KyeWfjNVnfo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 82def4b9cf94a7df;
	Mon, 23 Nov 2026 10:35:10 +0000
X-Mizu-Trace-ID: 82def4b9cf94a7df
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 2/2] KVM: arm64: selftests: Test a THP whose first fault is on a tail page
Date: Mon, 23 Nov 2026 10:35:05 +0000
Message-ID: <20261123103505.1006067-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123103505.1006067-1-fuad.tabba@linux.dev>
References: <20261123103505.1006067-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_103518_030055_AA51DCA9 
X-CRM114-Status: GOOD (  17.92  )
X-Spam-Score: -0.2 (/)
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

On a host whose PMD level is folded, KVM mapped host memory past a THP
when the guest first touched the THP at a page other than its first.

Add a scenario for that case. The guest writes to the second host page
of a memslot backed by one THP, then reads the first address past the
memslot. The test checks that the write landed in that page, and that
the read exits to userspace as MMIO. On a host whose PMD level isn't
folded, the scenario passes with or without the fix. It doesn't use
hugetlb pages, so it runs before the probe that skips the rest of the
test when they aren't reserved.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../kvm/arm64/stage2_block_transitions.c      | 56 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c b/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c
index 5fd47f4ada1f3..000e8ec7ce8cc 100644
--- a/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c
+++ b/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c
@@ -3,10 +3,10 @@
  * Copyright (c) 2026 Google LLC
  * Author: Fuad Tabba <fuad.tabba@linux.dev>
  *
- * stage2_block_transitions - Exercise stage-2 block/page granularity changes
- * that dirty logging forces at fault time, and assert the guest completes.
+ * stage2_block_transitions - Exercise stage-2 block/page granularity at fault
+ * time: the changes dirty logging forces, and how far a THP block reaches.
  *
- * Both scenarios need the fault handler to allocate at fault time (a fresh
+ * Scenarios 1 and 2 need the fault handler to allocate at fault time (a fresh
  * mapping and/or page-table pages while holding mmu_lock), so a fault path
  * that fails to stage that memory manifests as a KVM_RUN error or, worse, a
  * host crash. The asserted property is host-agnostic: the guest runs the
@@ -27,6 +27,11 @@
  *   fault that must split the block into pages during logging, draining
  *   page-table pages. Skipped on CTR_EL0.DIC hardware, where mappings are
  *   made executable eagerly and the execute fault never occurs.
+ *
+ * Scenario 3 - THP whose first fault is on a tail page:
+ *   The guest writes to the second host page of a memslot backed by one
+ *   THP, then reads the first address past it. If KVM mapped the THP and
+ *   nothing past it, the write lands in the memslot and the read exits as MMIO.
  */
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
@@ -198,6 +203,49 @@ static void test_exec_split_drain(void)
 	kvm_vm_free(vm);
 }
 
+static void thp_guest_code(u64 touch_gva, u64 past_gva)
+{
+	WRITE_ONCE(*(u64 *)touch_gva, 0x1);
+	READ_ONCE(*(u64 *)past_gva);
+	GUEST_DONE();
+}
+
+static void test_thp_tail_first_touch(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	size_t npages;
+	u64 thp_size;
+	u64 gpa;
+
+	if (!thp_configured()) {
+		ksft_print_msg("SKIP THP tail first touch: THP not configured\n");
+		return;
+	}
+	thp_size = get_trans_hugepagesz();
+
+	vm = vm_create_with_one_vcpu(&vcpu, thp_guest_code);
+	npages = thp_size / vm->page_size;
+
+	gpa = (vm_compute_max_gfn(vm) * vm->page_size) - 2 * thp_size;
+	gpa = align_down(gpa, thp_size);
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS_THP, gpa, DATA_SLOT, npages, 0);
+	virt_pg_map(vm, TEST_GVA + getpagesize(), gpa + getpagesize());
+	virt_pg_map(vm, TEST_GVA + thp_size, gpa + thp_size);
+	vcpu_args_set(vcpu, 2, TEST_GVA + getpagesize(), TEST_GVA + thp_size);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT(get_ucall(vcpu, &uc) != UCALL_DONE,
+		    "Read past the memslot completed without an exit");
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_MMIO);
+	TEST_ASSERT_EQ(vcpu->run->mmio.phys_addr, gpa + thp_size);
+	TEST_ASSERT_EQ(*(u64 *)addr_gpa2hva(vm, gpa + getpagesize()), 0x1);
+
+	kvm_vm_free(vm);
+}
+
 /*
  * The explicit-size hugetlb backing hard-fails region creation if the pages
  * are not already reserved, so probe here and skip rather than abort. The
@@ -216,6 +264,8 @@ static void require_hugepages(size_t bytes)
 
 int main(void)
 {
+	test_thp_tail_first_touch();
+
 	require_hugepages(NR_BLOCKS * BLOCK_SIZE);
 
 	test_block_collapse();
-- 
2.47.3


