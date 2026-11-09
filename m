Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7C5606D828
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W/nah2kP;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GgtV2rMd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AfXeCeneHqNmuixn/C9DCjk2UEGT5HCCQsR07Fy0vVk=; b=W/nah2kPsDT6/s
	THtKQW6rP2emdXR022Hc6xzVjigBM0e6ayuckSCajR79N2plKnkgP0UL25pXFwAcUDfaetECWMsCG
	RiPQD6sz6pJ2etSMMZPf1PmUmT5HK0vAWUx1zIW1C2u2xsZpw4VX60nPOjh/yV6xBMiTAWMFaZx61
	CUjSyyibG0umRULwjMS9PJONb16VPL/cuiNwYAsibAHojgHmxKeX16VrzPcICBm4xsgLaY7fUwDro
	6pvlhQ6Rwvd3E7qHEbswqa6T3EveNt8XWrOLcIuOTNqYQGsM22UceCSosMwA2EDcxRuX9av12wmEs
	DIA7zZhivVkG/tfPnfBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL41-000000007HF-3UOK;
	Mon, 09 Nov 2026 08:49:17 +0000
Received: from out-152.mta1.migadu.com ([95.215.58.152] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL3z-000000007EH-1VLy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:49:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=RoNzd28AyvTb0ibr+4xItgKDPl/EqyvaBO8VS7dD1Vo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794214153; v=1; x=1794818953;
 b=GgtV2rMdHkAv2ej+ig2FtoiekZcw/PpaUYvKu19D7m/vypxOQTR90wu3EHIc6YIRNambBwlV
 qlp4ZWhZfcpA46YgvjovCbehCYIqw28KSvEGwlSDoQysx4BTsp1nVgccCDqm8IzSf8HFNxb4EQ0
 EaJ2G+V1y52yXP2AYhS7LVPI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 00fa88a3a43f583a;
	Mon, 09 Nov 2026 08:49:13 +0000
X-Mizu-Trace-ID: 00fa88a3a43f583a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/19] KVM: selftests: Export the ucall pool's guest physical address
Date: Mon,  9 Nov 2026 08:48:40 +0000
Message-ID: <20261109084854.840576-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109084854.840576-1-fuad.tabba@linux.dev>
References: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_004915_767762_9499022F 
X-CRM114-Status: GOOD (  12.82  )
X-Spam-Score: -2.1 (--)
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

A protected guest's memory is private until the guest itself shares it,
so the guest has to share the ucall pool before its first ucall. The
host can't do that for it. Only the guest's copy of ucall_pool holds the
pool's address.

Add get_ucall_pool_gpa(), which reads that copy, so that the host can
pass the address to the guest.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/include/ucall_common.h | 1 +
 tools/testing/selftests/kvm/lib/ucall_common.c     | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index cbdcb0a50c4f9..3a6cdf9aa0464 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -41,6 +41,7 @@ __printf(5, 6) void ucall_assert(u64 cmd, const char *exp,
 u64 get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc);
 void ucall_init(struct kvm_vm *vm, gpa_t mmio_gpa);
 int ucall_nr_pages_required(u64 page_size);
+gpa_t get_ucall_pool_gpa(struct kvm_vm *vm);
 
 /*
  * Perform userspace call without any associated data.  This bare call avoids
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index 029ce21f9f2fa..aa1f0f92c6d1d 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -21,10 +21,17 @@ int ucall_nr_pages_required(u64 page_size)
 
 /*
  * ucall_pool holds per-VM values (global data is duplicated by each VM), it
- * must not be accessed from host code.
+ * must not be accessed from host code. The host reads only a VM's copy.
  */
 static struct ucall_header *ucall_pool;
 
+gpa_t get_ucall_pool_gpa(struct kvm_vm *vm)
+{
+	struct ucall_header **pool = addr_gva2hva(vm, (gva_t)&ucall_pool);
+
+	return addr_gva2gpa(vm, (gva_t)*pool);
+}
+
 void ucall_init(struct kvm_vm *vm, gpa_t mmio_gpa)
 {
 	struct ucall_header *hdr;
-- 
2.47.3


