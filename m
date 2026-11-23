Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B513606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L8JMVbZT;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mA9ZvOFW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IQiXWzWKyvjJNCEJcNajLSK7Gsk4vnOC+isyTFIFLsY=; b=L8JMVbZTtA+80U
	/7wx0UY/Ot04pRhJ9PnwjWK8KA5wf9iCJzB0lnRyBTMqqYkrnZ0m24ZI5n551i6WVpOvQS5n12uOs
	sYfos6CGbnGSDAfK7+CJ62UttwElJAJrRYX0PVts5E9HuUJDqumxnSUGJ8FsrQJQZ+6HjxrgWzHCD
	rKqi+C6jlP5W2c1QmjM4jtpNOAse+HcUcOOXMmENlh95scSZ9wk1w7FGaoffjxCCCHFplUu7FV6DV
	VtYPWLv9y4jT/vOmZVLG3/6xK6OyWbcYgY7/4mR9Xu+UWh128Evtp90pz0n0NQlY/vw1Ai2VbTCeu
	bwsa0375cLNMfjP3BS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVgb-00000003ulw-0yns;
	Mon, 23 Nov 2026 15:10:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVgT-00000003ujR-35Hn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:10:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F93019F6;
	Mon, 23 Nov 2026 07:10:18 -0800 (PST)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA2633F632;
	Mon, 23 Nov 2026 07:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795446621; bh=U9cuwkZdZShqPIkeMhEmNQyq0ckxOTBqrasBSAUj27Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mA9ZvOFWCwrhB53yIHpXKQ+Km7EUzZZD11mk8j1dTe8RTfFJ2FGLJ38ehZNIs1Hub
	 BUc8+Xnyx9VO6eTqR4Ty9kciJ70hSxoGSAdG3luDZJNjwZmeSV+8PJuOO/lQe31VV4
	 7MBic+e/FhUA8yiH+g2Utd503JArUtlAeNKUx3EM=
From: Jia He <justin.he@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jia He <justin.he@arm.com>
Subject: [PATCH 2/3] KVM: arm64: nv: Don't request or attempt L1 VNCR mapping without vncr_tlb
Date: Mon, 23 Nov 2026 15:09:16 +0000
Message-Id: <20261123150917.2679600-3-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123150917.2679600-1-justin.he@arm.com>
References: <20261123150917.2679600-1-justin.he@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_071021_818428_5076520A 
X-CRM114-Status: GOOD (  10.48  )
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

vcpu->arch.vncr_tlb is only allocated when ID_AA64MMFR4_EL1.NV_frac
advertises FEAT_NV2. When NV_frac is cleared to 0 (or E2H0 is selected),
vncr_tlb is NULL for the lifetime of the vCPU.

Don't set KVM_REQ_MAP_L1_VNCR_EL2 in kvm_vcpu_load_hw_mmu() when
vncr_tlb is NULL. The only other place that sets this request is
kvm_translate_vncr(), which only runs on a FEAT_NV2 VNCR abort. Warn and
return early in kvm_map_l1_vncr() if vt is NULL before disabling
preemption and taking kvm->mmu_lock.

Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/kvm/nested.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28..2f52c128f3a7 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -979,7 +979,8 @@ void kvm_vcpu_load_hw_mmu(struct kvm_vcpu *vcpu)
 				vcpu->arch.hw_mmu = get_s2_mmu_nested(vcpu);
 		}
 
-		if (__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_EL2_NV)
+		if (vcpu->arch.vncr_tlb &&
+		    (__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_EL2_NV))
 			kvm_make_request(KVM_REQ_MAP_L1_VNCR_EL2, vcpu);
 	}
 }
@@ -1761,6 +1762,9 @@ static void kvm_map_l1_vncr(struct kvm_vcpu *vcpu)
 	struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
 	pgprot_t prot;
 
+	if (WARN_ON_ONCE(!vt))
+		return;
+
 	guard(preempt)();
 	guard(read_lock)(&vcpu->kvm->mmu_lock);
 
-- 
2.34.1


