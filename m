Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E934606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p6l+6hTh;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rr6nI5PF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z4eKzkcWk1IKH8doz5gGRdUtFm1MYHG1rOm73vYxulA=; b=p6l+6hThvNwID3
	WMUsFYlnczDBGWX4ptjjzZ8eu0NdD84bA6+qJLvZoXOR4Kh4qc9tx0Q6XnXrfPBRF/vaXEZ00KDap
	Bo3h5vszNbTZZ0zQwZfEniVH2Meruc9cZgYptUG/C4GUpZUl6GeQsIuK3H5heddCCB48QLOQ0Z6Qg
	RMtEknnyAIipZl9CTSA40a6tiLEIeHaZJFPlsqUSicY5kf0yavxORMJiEQ19O+oXKMjJ0R1r5Q/GN
	fZ7mLBm3tKx5GBEiFyF6szyhqw9jOSbSklxmtf2l72XdWTrKDTAdgLr7zuHbiyrHJNfj929rIvIFI
	Q3V1TOeGsSiN2+iZt0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMBP-00000006RBK-0pWv;
	Tue, 17 Nov 2026 16:37:23 +0000
Received: from out-61.mta1.migadu.com ([95.215.58.61] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMBM-00000006R9t-3IzX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:37:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LbJlXuBe4UMUHY+VoPzgCOZA0cis0LLWHwrzjRk/Y8U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794933437; v=1; x=1795538237;
 b=rr6nI5PFap5Hompd4kRy6pT3LeBgMkG6ImeXgWaFwmsAERADRYKsZB/FyF07PCMk+BCPKshg
 urQxYtvYa572nlC1yIjQdLyxJtQUtVfEhQWHDGgvqMIbKQ7KfPhurDy136dEAcCn1+er94EApHm
 4xRH32rP+J1eXBVMxK2Thcdo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9105d92f22dcb935;
	Tue, 17 Nov 2026 16:37:12 +0000
X-Mizu-Trace-ID: 9105d92f22dcb935
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] KVM: arm64: Don't forward the host's SDEI calls to firmware
Date: Tue, 17 Nov 2026 16:37:00 +0000
Message-ID: <20261117163702.1678277-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117163702.1678277-1-fuad.tabba@linux.dev>
References: <20261117163702.1678277-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_083720_978575_6A94863E 
X-CRM114-Status: GOOD (  12.92  )
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

In protected mode, EL2 forwards host SMCs that it doesn't handle to
EL3, where they arrive as calls from EL2. TF-A treats EL2 as the SDEI
client whenever EL2 is implemented, so the host can register an event
handler that runs at EL2.

A pKVM host kernel can't use SDEI, since sdei_arch_get_entry_point()
fails when the kernel is booted at EL2 but runs at EL1. Return
NOT_SUPPORTED for SDEI calls instead of forwarding them.

Fixes: b93c17c4185bf ("KVM: arm64: Trap host SMCs in protected mode")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 179d7c8277b88..37fb9896ba3ad 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -10,6 +10,7 @@
 #include <hyp/switch.h>
 
 #include <linux/irqchip/arm-gic-v3.h>
+#include <uapi/linux/arm_sdei.h>
 #include <uapi/linux/psci.h>
 
 #include <asm/pgtable-types.h>
@@ -1647,8 +1648,14 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
 }
 
-static void default_host_smc_handler(struct kvm_cpu_context *host_ctxt)
+static void default_host_smc_handler(struct kvm_cpu_context *host_ctxt, u64 func_id)
 {
+	/* Firmware would enter the host's SDEI event handlers at EL2. */
+	if ((func_id & SDEI_1_0_MASK) == SDEI_1_0_FN_BASE) {
+		cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
+		return;
+	}
+
 	trace_hyp_exit(host_ctxt, HYP_REASON_SMC);
 	__kvm_hyp_host_forward_smc(host_ctxt);
 	trace_hyp_enter(host_ctxt, HYP_REASON_SMC);
@@ -1675,7 +1682,7 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
 	if (!handled)
 		handled = kvm_host_ffa_handler(host_ctxt, func_id);
 	if (!handled)
-		default_host_smc_handler(host_ctxt);
+		default_host_smc_handler(host_ctxt, func_id);
 
 exit_skip_instr:
 	/* SMC was trapped, move ELR past the current PC. */

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3


