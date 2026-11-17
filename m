Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A4606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WJ6rrWQG;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ezFRLUfa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4ZFadknJpT2Sg2IX1pxLhHdSKqVRpbEQfn2dRJVi6Mw=; b=WJ6rrWQGDdsg/jbM4HTzeB1a2c
	cCQZ9OaQRAH5nF6RxuN5QarLexbj88pTspW6WDprHxdlOl3+L5OYSNChNTSMQtCmuq2UkeMG41K1t
	/PHI2pKnmYgdp8wp+GiDZpVFGV/wLFZ3mOtmC4W9U1sFT04PsMggKkSprW8guGJliXx9ZutuzfHjj
	TKv5GhHD2Wn9uMC1aREaNI7rd9YsDz7uLc4zkziAWlQ8aqmwU3Pp9z2fTYjXPP13gKyWWFoIi6xsD
	qTp90EqeelpLfKkn49kmdoOpBl5Qqa806tzq1S/oQk9E5pJAfnX2aQIWm2FbgoCjSIEZTj50XB6i1
	Hw00xcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNF1-00000006ebG-1UWY;
	Tue, 17 Nov 2026 17:45:11 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEU-00000006e57-0tz8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:39 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso899605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937476; x=1795542276; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZFadknJpT2Sg2IX1pxLhHdSKqVRpbEQfn2dRJVi6Mw=;
        b=ezFRLUfapuMtHTpJLEcOStQ6prJckmmuvCFpzWafdtuCgHx4DuHrCCsb9gsNwINNsJ
         IVxo+ci7/g7PHdNYl6y+hH9+MvYe824bOixfMFeY1lqkmcU4hUImwJOhxjvYHPJf3LQ1
         3yVL/VtVi/RcWnbdPI2/lmMbsn1dS7e03iJPKSy3yV1Bt5vV56jRXqvy+z75so36T8V1
         /iLyetTJ7r7xBG0nHzpcqYYF5b9EuOyEW1Y7ncUAu3l5hdSdjjqVmq69jPa24ZXfcSWi
         cal2FruBZYmo2ED8rTo1a5mlzegxElN6skmrWAlA3ZJbtzAZHdcjiIWA3hPaTg73VMaQ
         7ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937476; x=1795542276;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZFadknJpT2Sg2IX1pxLhHdSKqVRpbEQfn2dRJVi6Mw=;
        b=srsDiT5wEd2IPBgs0XoQBN8hoMtBrqo9XHPFZJiGvhXAudSM4IDs4wzLTmznWxwnZL
         jNDinQqjJOO4J4ywU+c9RV/NZ9U2zHX3Cl+6waX2kuMz8YtIGHyEDYCRqmSjbiQmEgB8
         5nRWDXBR0oZrsGHvyjSOYJDu/h185F6aUjwtKfrbK51Q7sG2youRYUgj4O0SVf5wi1LR
         Z+t2x9i6hLFvhrUlhpiUiJ1Zon6sbgIT2ukIlAhKAfAD9sYY5OAyXnh1kxtEYXKXh1Po
         SxerJsc2PPfIuzKOtzIYdWSA8uf0QI3FnfkjbpwL7r7//AWiDelbXwg4w1RktLWUlsat
         L0vw==
X-Forwarded-Encrypted: i=1; AL+hErHMdghuDQfMLueDCEl6wJS/N1ltMtPUjBAxdxRANMUEoKKej9lrbeiTwORP4SGk2YVD/l6QAbUrHMJpZjkxuDKa@lists.infradead.org
X-Gm-Message-State: APuU4Z+l/lkrXEWHcli3WUFQRpr/xxgr6JyNJlXFzDc/KbMMBbm9ZRbf
	osNWfMjEHa8OTQ1bNLu4AgDzdN7St8o93XRw6pUY0klQHT2CPqA8O6+jlkmTB3J5siCOwi/BPJ3
	8HOc+1qkyp1quciCwNdke/Q==
X-Received: from wmhk6.prod.google.com ([2002:a05:600c:4086:b0:4a1:989a:a866])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f13:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4bb55a5a523mr375962935e9.18.1794937475224;
 Tue, 17 Nov 2026 09:44:35 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:56 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-18-vdonnefort@google.com>
Subject: [PATCH v4 17/23] KVM: arm64: Add vcpu conduit for pkvm_hyp_req
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094438_303812_B5C299C2 
X-CRM114-Status: GOOD (  20.51  )
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

The pKVM hypervisor depends on the host for a lot of operations like
memory allocation. It can raise a request by populating a pkvm_hyp_req
on the extra registers when returning a SMCCC call.

Add a new conduit, using a per-vCPU pkvm_hyp_req, populated on
ARM_EXCEPTION_PKVM_HYP_REQ. This allows processing the request later, in
a less restrictive context than the one from where the __kvm_vcpu_run
HVC is called, just like the other exceptions are handled.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_asm.h   | 10 ++++++----
 arch/arm64/include/asm/kvm_host.h  | 26 ++++++++++++++++++++++++++
 arch/arm64/include/asm/kvm_pkvm.h  | 24 +-----------------------
 arch/arm64/kvm/handle_exit.c       |  3 +++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c |  2 ++
 arch/arm64/kvm/pkvm.c              |  9 +++++++--
 6 files changed, 45 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 3efc63e1a823..872185f9ac53 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -17,10 +17,11 @@
 #define ARM_EXCEPTION_IS_TRAP(x)  (ARM_EXCEPTION_CODE((x)) == ARM_EXCEPTION_TRAP)
 #define ARM_SERROR_PENDING(x)	  !!((x) & (1U << ARM_EXIT_WITH_SERROR_BIT))
 
-#define ARM_EXCEPTION_IRQ	  0
-#define ARM_EXCEPTION_EL1_SERROR  1
-#define ARM_EXCEPTION_TRAP	  2
-#define ARM_EXCEPTION_IL	  3
+#define ARM_EXCEPTION_IRQ		0
+#define ARM_EXCEPTION_EL1_SERROR	1
+#define ARM_EXCEPTION_TRAP		2
+#define ARM_EXCEPTION_IL		3
+#define ARM_EXCEPTION_PKVM_HYP_REQ	4
 /* The hyp-stub will return this for any kvm_call_hyp() call */
 #define ARM_EXCEPTION_HYP_GONE	  HVC_STUB_ERR
 
@@ -28,6 +29,7 @@
 	{ARM_EXCEPTION_IRQ,		"IRQ"		},	\
 	{ARM_EXCEPTION_EL1_SERROR, 	"SERROR"	},	\
 	{ARM_EXCEPTION_TRAP, 		"TRAP"		},	\
+	{ARM_EXCEPTION_PKVM_HYP_REQ,	"PKVM_HYP_REQ"	},	\
 	{ARM_EXCEPTION_HYP_GONE,	"HYP_GONE"	}
 
 /*
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb130..0161bcb8123b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -138,6 +138,29 @@ u32 __attribute_const__ kvm_target_cpu(void);
 void kvm_reset_vcpu(struct kvm_vcpu *vcpu);
 void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu);
 
+enum pkvm_hyp_req_type {
+	PKVM_HYP_NO_REQ = 0,
+	PKVM_HYP_REQ_HYP_ALLOC,
+	PKVM_HYP_REQ_HYP_ALLOC_SELFTEST,
+	__PKVM_HYP_REQ_TYPE_MAX,
+};
+
+#define PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX \
+	(sizeof(struct arm_smccc_res) - offsetof(struct arm_smccc_res, a2) - 1)
+
+struct pkvm_hyp_req {
+	u8 type;
+	union {
+		struct {
+			u32	nr_pages;
+		} mem;
+		struct {
+			/* Helper for SMCCC encoding/decoding */
+			u8	args[PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX];
+		} args;
+	};
+};
+
 struct kvm_hyp_memcache {
 	phys_addr_t head;
 	unsigned long nr_pages;
@@ -1006,6 +1029,9 @@ struct kvm_vcpu_arch {
 	/* Pages to top-up the pKVM/EL2 guest stage-2 pool */
 	struct kvm_hyp_memcache stage2_mc;
 
+	/* To be read on ARM_EXCEPTION_PKVM_HYP_REQ */
+	struct pkvm_hyp_req pkvm_hyp_req;
+
 	/* Virtual SError ESR to restore when HCR_EL2.VSE is set */
 	u64 vsesr_el2;
 
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index b75dc3d03a98..3e51337f2d9e 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -22,6 +22,7 @@ int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
 void pkvm_destroy_hyp_vm(struct kvm *kvm);
 int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu);
+int __pkvm_handle_vcpu_req(struct kvm_vcpu *vcpu);
 
 /*
  * Check whether the specific capability is allowed in pKVM.
@@ -231,29 +232,6 @@ struct pkvm_mapping {
 	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
-enum pkvm_hyp_req_type {
-	PKVM_HYP_NO_REQ = 0,
-	PKVM_HYP_REQ_HYP_ALLOC,
-	PKVM_HYP_REQ_HYP_ALLOC_SELFTEST,
-	__PKVM_HYP_REQ_TYPE_MAX,
-};
-
-#define PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX \
-	(sizeof(struct arm_smccc_res) - offsetof(struct arm_smccc_res, a2) - 1)
-
-struct pkvm_hyp_req {
-	u8 type;
-	union {
-		struct {
-			u32	nr_pages;
-		} mem;
-		struct {
-			/* Helper for SMCCC encoding/decoding */
-			u8	args[PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX];
-		} args;
-	};
-};
-
 static inline size_t pkvm_hyp_req_arg_size(u8 type)
 {
 	struct pkvm_hyp_req *req;
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 9931192735d4..2030675304ca 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -18,6 +18,7 @@
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nested.h>
+#include <asm/kvm_pkvm.h>
 #include <asm/debug-monitors.h>
 #include <asm/stacktrace/nvhe.h>
 #include <asm/traps.h>
@@ -464,6 +465,8 @@ int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
 		return 1;
 	case ARM_EXCEPTION_TRAP:
 		return handle_trap_exceptions(vcpu);
+	case ARM_EXCEPTION_PKVM_HYP_REQ:
+		return __pkvm_handle_vcpu_req(vcpu);
 	case ARM_EXCEPTION_HYP_GONE:
 		/*
 		 * EL2 has been reset to the hyp-stub. This happens when a guest
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index c322ef4432c9..41817f45115d 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -734,6 +734,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	case ARM_EXCEPTION_IRQ:
 	case ARM_EXCEPTION_EL1_SERROR:
 	case ARM_EXCEPTION_IL:
+	case ARM_EXCEPTION_PKVM_HYP_REQ:
 		break;
 	case ARM_EXCEPTION_TRAP:
 		/* Nothing was marshalled for this trap, see sync_hyp_vcpu(). */
@@ -803,6 +804,7 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
 		break;
 	case ARM_EXCEPTION_EL1_SERROR:
 	case ARM_EXCEPTION_IL:
+	case ARM_EXCEPTION_PKVM_HYP_REQ:
 		break;
 	default:
 		BUG();
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index ae53c701206a..c55b6d442d0e 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -765,7 +765,7 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
 	return !ret || ret == -EAGAIN;
 }
 
-static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
+static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req, struct kvm_vcpu *vcpu)
 {
 	int ret = -EINVAL;
 
@@ -788,7 +788,12 @@ int __pkvm_handle_smccc_req(struct arm_smccc_res *res)
 	struct pkvm_hyp_req req;
 
 	if (smccc_to_pkvm_hyp_req(&req, res))
-		return pkvm_handle_hyp_req(&req);
+		return pkvm_handle_hyp_req(&req, NULL);
 
 	return res->a1;
 }
+
+int __pkvm_handle_vcpu_req(struct kvm_vcpu *vcpu)
+{
+	return pkvm_handle_hyp_req(&vcpu->arch.pkvm_hyp_req, vcpu) ?: 1;
+}
-- 
2.56.1.708.g77570a6a1d-goog


