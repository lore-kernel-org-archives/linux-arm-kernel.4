Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7478F606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A8AB086Y;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gLzP/gbA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wAS3oQHuzL7ajnzxXYWPyyMndbqhHMc9tInB7WPJ4ZM=; b=A8AB086Yf32oZ15m1hDiChMgR5
	w1Zcc5YCqXdYtmRYg9zX5QvNPxvd6+TJ8X8JfDYRnou6jdBCgXzzs4OR8jur5DkznC47mhZttAdRh
	KTv4a1pt+G3bmrtrhVgIMztkLYasq6X+zTFx/Ambe1YYQ4QLLGURFDfDZL0kVlvAZH0qKCjLOuCyo
	/nWIuS+bU4Bs6PT3MxehI4eIeQD+AMI+7Me6tHj1kd9V494qpeQX32rZgqgew83p/z6XcQ/xqZNfC
	gs49Zh22VhQAL1kFWnOyNJpKYfHePEoqcd13zlf1u0uZPYCfyp69dDW1CtBsEQO2yZvAJzXLcZl6m
	GDXC8lkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmVd-0000000C0YI-0wZL;
	Fri, 13 Nov 2026 08:19:45 +0000
Received: from out-199.mta1.migadu.com ([2001:41d0:203:375::c7] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmVZ-0000000C0Xf-2gPN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:19:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LM1ni5prrsjlOdbw8JePvasxWgCV5AgG25++/phTO84=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794557979; v=1; x=1795162779;
 b=gLzP/gbAqb1l1eiwC/6XqzzTKGKP1KEgSdHp0/ClapYbYixi6AZamfD+RIhm3tGdbeIYRUOX
 wg/n0eHKkQeJ8N8WtPwNVuijZOPfZDmHsytLqMx8keGN3HZrWIzl1TB47rgSLfq4GZqNo2ae/jz
 U89IKEHAx0t0UYQyv13pM/kc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 143baa0b577e5982;
	Fri, 13 Nov 2026 08:19:39 +0000
X-Mizu-Trace-ID: 143baa0b577e5982
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	ryan.roberts@arm.com,
	qperret@google.com,
	steven.price@arm.com,
	tabba@google.com
Subject: [PATCH] KVM: arm64: Keep firmware Spectre-v4 mitigation on for protected guests
Date: Fri, 13 Nov 2026 08:19:34 +0000
Message-ID: <20261113081934.1715497-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_001941_844750_C0A3F9DB 
X-CRM114-Status: GOOD (  15.08  )
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

EL2 handles a protected guest's ARM_SMCCC_ARCH_WORKAROUND_2 discovery
query from the host's Spectre-v4 state at init. If the system is
mitigated and the guest doesn't have SSBS, it returns NOT_REQUIRED,
which means that firmware mitigation is permanently enabled. However,
the host can disable the mitigation before running a protected vCPU,
with an ARM_SMCCC_ARCH_WORKAROUND_2 call that EL2 forwards to the
firmware.

The host makes that call for its own userspace, so keep forwarding it,
without hints so that the firmware decodes it as EL2 does. Track it per
CPU, and on a mitigated system enable the mitigation again before
running a protected vCPU on a CPU where the host has disabled it.
Firmware enables it when a CPU powers up, so the tracked state isn't
reset on CPU_ON or resume.

Fixes: fe40ff87ead5c ("KVM: arm64: Implement HVC handling for protected guests at EL2")
Reported-by: Ryan Roberts <ryan.roberts@arm.com>
Closes: https://lore.kernel.org/all/5fa8a1fb-4e2c-4746-8a70-a47f387ef0d6@arm.com/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Tested on QEMU with TF-A. Upstream TF-A implements the dynamic
    workaround only for Cortex-A76, so I patched it to advertise the
    workaround on the Cortex-A57 that QEMU models. With a host that
    disables the mitigation before running a protected vCPU, TF-A gets the
    call to enable it again from EL2 with this patch, and doesn't without
    it. TF-A's handler for the call does nothing there and QEMU doesn't
    model the mitigation, so this tests the calls and not their effect.
    
    Calling the firmware before every protected vCPU run would do without
    the tracking, at the cost of an SMC per run.
    
    Based on Linux 7.4-rc2 (7475ea8b58616).

 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 179d7c8277b88..081a8780fa3b7 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -21,6 +21,7 @@
 #include <asm/kvm_mmu.h>
 
 #include <nvhe/alloc.h>
+#include <nvhe/arm-smccc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -30,6 +31,8 @@
 
 DEFINE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
 
+static DEFINE_PER_CPU(bool, host_ssbd_disabled);
+
 /*
  * Define a hypercall handler: handle_<name> unmarshals the arguments from
  * the host context and hands them, correctly typed, to the body that
@@ -940,6 +943,17 @@ DEFINE_KVM_HOST_HCALL(int, __kvm_vcpu_run, struct kvm_vcpu __kern *, vcpu)
 			return ret;
 		}
 
+		/*
+		 * Firmware Spectre-v4 mitigation can be advertised to a
+		 * protected guest as permanent. The host kernel runs with it
+		 * enabled, so nothing is restored on exit.
+		 */
+		if (pkvm_hyp_vcpu_is_protected(hyp_vcpu) && spectre_v4_state == SPECTRE_MITIGATED &&
+		    __this_cpu_read(host_ssbd_disabled)) {
+			hyp_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2, true, NULL);
+			__this_cpu_write(host_ssbd_disabled, false);
+		}
+
 		flush_hyp_vcpu(hyp_vcpu);
 
 		ret = __kvm_vcpu_run(&hyp_vcpu->vcpu);
@@ -1671,6 +1685,12 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
 		goto exit_skip_instr;
 	}
 
+	if (func_id == ARM_SMCCC_ARCH_WORKAROUND_2) {
+		/* Drop the hints, so that the firmware decodes the ID as EL2 did. */
+		cpu_reg(host_ctxt, 0) = func_id;
+		__this_cpu_write(host_ssbd_disabled, !lower_32_bits(cpu_reg(host_ctxt, 1)));
+	}
+
 	handled = kvm_host_psci_handler(host_ctxt, func_id);
 	if (!handled)
 		handled = kvm_host_ffa_handler(host_ctxt, func_id);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3


