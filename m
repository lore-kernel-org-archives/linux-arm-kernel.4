Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B6E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FU6Da1GM;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q7Pj5+NK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ihyr4DFcCTnUi8RpBAkPBo5h4glV/gGCS8t9FUoUP5c=; b=FU6Da1GMEDGtKB
	9kXZYlSVhwifmv00HMWaA3nQz9WW01bDk7MMDxuzez9sEsJzE2CwFvBYHfz9pGdiRPGup/RR9OvCp
	wzAQ3jgOOr76NxB8RZb+K4ZJ1R06CRBycbae8rkBHXMRUTUh6kteNEHzBaFl8XwPaqIZWFnWV+boy
	I8SD2B+VBTGkUwIrjN7wCnNa8mhRFQcPlqWlK70uWSYxK77BMkbWsQhruNZR0WZT+1n9XPMtN6cjB
	7CL2KylZlizhC3qeTBB1svxamUzUoa1Bv7gEQlp8iYqvRpL8E+DBNcqD222DqRFWSNcIi4+EMBVuD
	ozjOFJpDtTlpVEfEItYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMBU-00000006REP-27lb;
	Tue, 17 Nov 2026 16:37:28 +0000
Received: from out-64.mta1.migadu.com ([95.215.58.64] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMBO-00000006RA2-2BBa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:37:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=daj20mbvFvBdLEpKz25aOkweMY59YlNCAihrBtLyt2c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794933437; v=1; x=1795538237;
 b=Q7Pj5+NKA4t5HUgDYsiw/WXYCpd8LYBNQaRf9cSGQxNWDXzyXvgDmqY81IePvMzTvNRzoAYn
 rkqRckqmdlbbAGn1hPu0qnd2pxsSHjLTcwolHL/E1fm0UVBeZ2zasJCFg9trL+mEUmH0+AOArtF
 z5GyQOZJA0S9yRJdzHbfDlrU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 89a4f049cb720cd1;
	Tue, 17 Nov 2026 16:37:17 +0000
X-Mizu-Trace-ID: 89a4f049cb720cd1
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
Subject: [PATCH v2 2/2] KVM: arm64: Don't run a pVM with firmware Spectre-v4 mitigation disabled
Date: Tue, 17 Nov 2026 16:37:01 +0000
Message-ID: <20261117163702.1678277-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117163702.1678277-1-fuad.tabba@linux.dev>
References: <20261117163702.1678277-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_083722_703661_0C4860B9 
X-CRM114-Status: GOOD (  17.91  )
X-Spam-Score: -2.8 (--)
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

EL2 handles a protected guest's ARM_SMCCC_ARCH_WORKAROUND_2 discovery
query using a copy of the host's Spectre-v4 state taken at init. If the
system is mitigated and the guest doesn't have SSBS, EL2 returns
NOT_REQUIRED, which indicates to the guest that firmware mitigation is
permanently enabled. However, EL2 forwards the host's
ARM_SMCCC_ARCH_WORKAROUND_2 calls to firmware, so the host can disable
the mitigation and then run a protected vCPU.

On a mitigated system, the host kernel disables the mitigation only
while its own userspace runs, so a host that runs a vCPU with it
disabled is misbehaving, whatever the guest was told. Track the
mitigation state per CPU from the host's calls, and don't run a
protected vCPU on a CPU where it's disabled. Forward the calls without
hints, so that firmware decodes the same function ID as EL2.

Firmware enables the mitigation when a CPU powers up (SMCCC DEN0028,
7.6.4), so the tracked state doesn't have to be reset on CPU_ON or
resume. When an SDEI event completes, firmware also restores the
mitigation state of the interrupted context. EL2 can't track that, so
this fix relies on the host's SDEI calls not being forwarded.

Fixes: fe40ff87ead5c ("KVM: arm64: Implement HVC handling for protected guests at EL2")
Reported-by: Ryan Roberts <ryan.roberts@arm.com>
Closes: https://lore.kernel.org/all/5fa8a1fb-4e2c-4746-8a70-a47f387ef0d6@arm.com/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h  |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb1300..80d0665b93f25 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -839,6 +839,7 @@ struct kvm_host_data {
 #define KVM_HOST_DATA_FLAG_VCPU_IN_HYP_CONTEXT		4
 #define KVM_HOST_DATA_FLAG_L1_VNCR_MAPPED		5
 #define KVM_HOST_DATA_FLAG_HAS_BRBE			6
+#define KVM_HOST_DATA_FLAG_SSBD_DISABLED		7
 	unsigned long flags;
 
 	struct kvm_cpu_context host_ctxt;
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 37fb9896ba3ad..8cc541e6e521b 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -925,6 +925,15 @@ DEFINE_KVM_HOST_HCALL(int, __kvm_vcpu_run, struct kvm_vcpu __kern *, vcpu)
 		if (unlikely(system_supports_sme() && read_sysreg_s(SYS_SVCR)))
 			return ret;
 
+		/*
+		 * Firmware Spectre-v4 mitigation can be advertised to a
+		 * protected guest as permanent. The host kernel runs with it
+		 * enabled, so if it's disabled the host is misbehaving.
+		 */
+		if (pkvm_hyp_vcpu_is_protected(hyp_vcpu) && spectre_v4_state == SPECTRE_MITIGATED &&
+		    host_data_test_flag(SSBD_DISABLED))
+			return ret;
+
 		/*
 		 * ON has a single writer, pkvm_reset_vcpu() on this CPU, so
 		 * READ_ONCE suffices. ON_PENDING takes the reset; -ECANCELED
@@ -1656,6 +1665,16 @@ static void default_host_smc_handler(struct kvm_cpu_context *host_ctxt, u64 func
 		return;
 	}
 
+	if (func_id == ARM_SMCCC_ARCH_WORKAROUND_2) {
+		/* Drop the hints, so that firmware decodes the ID as EL2 did. */
+		cpu_reg(host_ctxt, 0) = func_id;
+
+		if (lower_32_bits(cpu_reg(host_ctxt, 1)))
+			host_data_clear_flag(SSBD_DISABLED);
+		else
+			host_data_set_flag(SSBD_DISABLED);
+	}
+
 	trace_hyp_exit(host_ctxt, HYP_REASON_SMC);
 	__kvm_hyp_host_forward_smc(host_ctxt);
 	trace_hyp_enter(host_ctxt, HYP_REASON_SMC);
-- 
2.47.3


