Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01939606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M6+pX4iX;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EtV3vfny
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zAWSlv59a8MCO7BiIv0PjshhyKJmXxJ12N3fAjhXUPU=; b=M6+pX4iXLblI8i9VQfq7ItwRQT
	rXMUJqC5jlVBS9RBneRhQdPiM7OB7TnPu21RRVv47wVA8emUUjXT6CMz08P+LwYGYQt1wLzGq4mjO
	c3TBD1RPVe8CW/I2V3+r5NFkIm3daJUquUHcqOeWNg00iYj/4YdpxfRBMe3aRtZEkBMPBJxaG3CMK
	BHUm39Gg/gn9JPH1KdkLCBnWYPYWynlHtybpgfNe+PRCLFyORc3SprJ/VwIBS5s0Ug7EDXLtdPEdH
	zILRo/RDuTFyfQ7lJ/0OIp/Y5RT9NdeODjcjAn7dz1NbLuIGbbe1AYl5gRqIU/o8foLQYPJyHrokD
	V/ZWGVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPid-000000090D7-1jOu;
	Thu, 12 Nov 2026 07:59:40 +0000
Received: from out-6.mta0.migadu.com ([2001:41d0:1004:224b::6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPiU-000000090AB-0o3L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:59:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=cISyCbOfugjzFqMvt9U+R6HEQpkQoIcxPv/Uh007S2o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794470368; v=1; x=1795075168;
 b=EtV3vfny01bqLl/0J2VawmrzTUqJ3v5Kw1aDpBRKTW8xYwaUK+8kkuvXUYLYaZCNVt3a01/S
 lcGRBtrHQX+eppKQmopQLSwrdbfXvkiCMpv9megj56HWg7jDJ+roLIPyPMhsXnAJs9+jiOY7zTW
 5fafqST68n9oWMpKcAHdKTQo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 80bbba1496a8ace9;
	Thu, 12 Nov 2026 07:59:27 +0000
X-Mizu-Trace-ID: 80bbba1496a8ace9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2] KVM: arm64: Sync a pVM's control state before CPU_ON reads its endianness
Date: Thu, 12 Nov 2026 07:59:23 +0000
Message-ID: <20261112075923.3018139-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_235930_586245_DE5E796F 
X-CRM114-Status: GOOD (  12.09  )
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

pKVM handles a protected guest's PSCI CPU_ON at EL2 before the guest's
EL1 sysregs are saved, so kvm_vcpu_is_be() reads a stale SCTLR_EL1. A
guest that changes SCTLR_EL1.EE and calls CPU_ON before its next exit
to the host starts the target vCPU with the old endianness.

Have CPU_ON sync the caller's PC, PSTATE, VBAR_EL1 and SCTLR_EL1 before
reading its endianness, through a helper factored out of
inject_sync64(), so that both handlers sync the same state.

Fixes: 9d4ec80be2eb4 ("KVM: arm64: Handle PSCI calls for protected VMs at EL2")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes in v2:
    - Factor inject_sync64()'s sync into a helper and call it from CPU_ON,
      as Marc suggested. Named pkvm_sync_vcpu_ctrl_state() rather than
      ..._before_exception(), since CPU_ON injects no exception.
    - Subject and message reworded to match.
    
    v1: https://lore.kernel.org/r/20261111082746.1064567-1-fuad.tabba@linux.dev

 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  1 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c         |  2 ++
 arch/arm64/kvm/hyp/nvhe/sys_regs.c     | 16 ++++++++++------
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 0261b2bc681f7..5c68c9184bda6 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -133,6 +133,7 @@ bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
 void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
 void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu);
 int kvm_check_pvm_sysreg_table(void);
+void pkvm_sync_vcpu_ctrl_state(struct kvm_vcpu *vcpu);
 
 int pkvm_reset_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu);
 struct pkvm_hyp_vcpu *pkvm_mpidr_to_hyp_vcpu(struct pkvm_hyp_vm *vm, unsigned long mpidr);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index fc0475f0877d1..eedc1dd81ee56 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1321,6 +1321,8 @@ static bool pvm_psci_vcpu_on(struct pkvm_hyp_vcpu *hyp_vcpu)
 		goto error;
 	}
 
+	pkvm_sync_vcpu_ctrl_state(&hyp_vcpu->vcpu);
+
 	reset_state = &target->vcpu.arch.reset_state;
 	WRITE_ONCE(reset_state->pc, smccc_get_arg2(&hyp_vcpu->vcpu));
 	WRITE_ONCE(reset_state->r0, smccc_get_arg3(&hyp_vcpu->vcpu));
diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 32e82653ebf7e..be785eec2ec96 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -254,17 +254,21 @@ static u64 pvm_calc_id_reg(const struct kvm_vcpu *vcpu, u32 id)
 	}
 }
 
-static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
+/*
+ * pKVM handles some exits at EL2 before it saves the guest's EL1 state, so
+ * sync the copies that exception injection and PSCI CPU_ON read.
+ */
+void pkvm_sync_vcpu_ctrl_state(struct kvm_vcpu *vcpu)
 {
 	*vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
 	*vcpu_cpsr(vcpu) = read_sysreg_el2(SYS_SPSR);
-
-	/*
-	 * Sync VBAR_EL1 and SCTLR_EL1, both read by enter_exception64(),
-	 * as pKVM handles traps before sysregs are resync'ed.
-	 */
 	__vcpu_assign_sys_reg(vcpu, VBAR_EL1, read_sysreg_el1(SYS_VBAR));
 	__vcpu_assign_sys_reg(vcpu, SCTLR_EL1, read_sysreg_el1(SYS_SCTLR));
+}
+
+static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
+{
+	pkvm_sync_vcpu_ctrl_state(vcpu);
 
 	kvm_pend_exception(vcpu, EXCEPT_AA64_EL1_SYNC);
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3


