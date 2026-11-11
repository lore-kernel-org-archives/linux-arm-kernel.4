Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B0C60A261F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PxX5TAPV;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fUpnCIrZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=N91MbDTn6PrZLQH4j0EMDImQVrWd5RIhvpEq9PwZqyU=; b=PxX5TAPVDMyqzJYh4og1ydp6+U
	XyrftoNzDk/vbCdDx2uKfmtw/7A2tiW0TX0A6taaFhwHTYFBqF/O0QrkqqzsLdgqtNpCEP68qONaD
	KQH+p6+0hKHHJz6vjACC+0IiGEWw3tSCJRWF0cvcYFlAgAYq9IyLHb+nCAWqNIb/BAAVt+eih/k4F
	q1viO/Sa1s9WqslV/2T/LUj3KbWz7VarBA4i+BNbIrlPB1Sp1jtIvFWERpfF3+GqPzU9DU3rAXvHq
	uNZN3vXLMtkjSkKYY39gwxIorDXLMvnSzDgZOSAwYyYUtP/Hzyug03HpdWTZzZhAGMCVD9K0x6bqI
	wqCKpL9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3gQ-000000062j3-1c1S;
	Wed, 11 Nov 2026 08:27:54 +0000
Received: from out-116.mta0.migadu.com ([2001:41d0:1004:224b::74] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3gM-000000062ga-1Asv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:27:52 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=o5IReJ970IqTd3Q+Wne7cEMsCpUkcKmOzJbHBxuzgfo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794385667; v=1; x=1794990467;
 b=fUpnCIrZd23Io7qMIYZ6W9iazjztqKF2N73IFzTIBAt40sA91DmxYkB16ZxQWGDpu0lLYp3f
 EQMemSIcrVbY3zJolfqBxv0N3/Baza7+YU0yucIBL22zL/YU7J1B2KBRnE5LbhNm101vNbi2dzW
 HVT0jXXk/HQ+gMuK6nmYNCSc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8550fa73e993f6e8;
	Wed, 11 Nov 2026 08:27:46 +0000
X-Mizu-Trace-ID: 8550fa73e993f6e8
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
Subject: [PATCH] KVM: arm64: Sync SCTLR_EL1 before a pVM's CPU_ON reads its endianness
Date: Wed, 11 Nov 2026 08:27:46 +0000
Message-ID: <20261111082746.1064567-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_002750_469215_0E5EA88A 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

Sync SCTLR_EL1 before the read, as inject_sync64() does.

Fixes: 9d4ec80be2eb4 ("KVM: arm64: Handle PSCI calls for protected VMs at EL2")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    inject_sync64() is the only other reader on a protected guest's exit
    path of a guest-writable EL1 sysreg's copy, and it syncs that register
    first. Saving SCTLR_EL1 before the in-loop exit handlers instead would
    put the save on every protected exit for two readers. A non-protected
    guest's CPU_ON is handled by the host, after the sysregs are saved.

 arch/arm64/kvm/hyp/nvhe/pkvm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index fc0475f0877d1..e421f45383e0d 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1321,6 +1321,9 @@ static bool pvm_psci_vcpu_on(struct pkvm_hyp_vcpu *hyp_vcpu)
 		goto error;
 	}
 
+	/* Sync SCTLR_EL1 for kvm_vcpu_is_be(), as HVCs are handled before sysregs are resync'ed. */
+	__vcpu_assign_sys_reg(&hyp_vcpu->vcpu, SCTLR_EL1, read_sysreg_el1(SYS_SCTLR));
+
 	reset_state = &target->vcpu.arch.reset_state;
 	WRITE_ONCE(reset_state->pc, smccc_get_arg2(&hyp_vcpu->vcpu));
 	WRITE_ONCE(reset_state->r0, smccc_get_arg3(&hyp_vcpu->vcpu));

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3


