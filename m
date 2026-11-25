Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD4E60A6F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cLCoyJTq;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uEGoc/GK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eCGx1X8DR+pHjH9W44J3Lh82/2sl2cpI/RianqMEYjE=; b=cLCoyJTq1pL1/I
	QDkDDJY2zKIeSZ9iUZKi91Spk+GMrWOksUfLdz3N5y9qjF1c0W0uYH3FjdHV0oyoCP5CFi41qF5GG
	pspp0tvVP52ZWBFptI5bWReuit3nFGXk6T7F2J8OJmQtDCEBzR+YT3PSdDWcq2+bHwpFiz18wyqEW
	B+eYDIKgLabBdug5kbMqZ7yNcvI37U2VLP85m/fORrmO3fqwu+kV/H9ixWGv92Fe1WntZSVtN36P2
	0IbCeafUVi2GAqoUEj6rUIs4uov8qDdiyEcmPR7hnJO//2OODkzbdY46/6AHvavuObhJ58dq0L4Lv
	rEv8rBkAhw0dpdqZJRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF6G-0000000AOKA-3bK5;
	Wed, 25 Nov 2026 15:40:01 +0000
Received: from out-30.mta0.migadu.com ([2001:41d0:1004:224b::1e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF5Z-0000000AOAf-0w4x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:39:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=plWnGSA+t40iciXF75RUGdCCByZ2c9Fur5xw/PdG3iQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621155; v=1; x=1796225955;
 b=uEGoc/GKCvssycowstrnGLuAYNix5t8Pc/tsZFyFww3d1R3QZXd1AiauzmkCYdr5ziZAf+Rq
 DZivHihoNF5+liWvKQJuiUXgeO2xc6S/Wfmd7O9EAIweS5pW1AQ7WYrRyjUlRcr5UqVLh6NXpAm
 T8kirCGpv0l8GVxnfDEM08cU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cccc4519f60a0c77;
	Wed, 25 Nov 2026 15:39:15 +0000
X-Mizu-Trace-ID: cccc4519f60a0c77
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/20] KVM: arm64: Only allow ptrauth for a pVM on a system with full ptrauth
Date: Wed, 25 Nov 2026 15:38:52 +0000
Message-ID: <20261125153911.106793-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_073919_382240_FA92D377 
X-CRM114-Status: GOOD (  12.05  )
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

EL2 allows a protected VM both ptrauth features whatever the system
supports. An id_aa64isar1 override can leave a system with generic but
not address auth. EL2 then doesn't trap the guest's key accesses, but
it doesn't switch the keys either, since the switch is gated on
ARM64_HAS_ADDRESS_AUTH. The host can read and write the guest's
APGAKey.

Only allow the ptrauth features when the system has full ptrauth, as
the host does.

Fixes: b56680de9c648 ("KVM: arm64: Initialize trap register values in hyp in pKVM")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_pkvm.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index fd042d2b54624..155ac35069245 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -76,11 +76,14 @@ static inline void kvm_pkvm_vcpu_allowed_features(struct kvm *kvm,
 	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PMU_V3))
 		set_bit(KVM_ARM_VCPU_PMU_V3, allowed);
 
-	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_ADDRESS))
-		set_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, allowed);
+	/* Without address auth, EL2 doesn't switch the guest's keys. */
+	if (system_has_full_ptr_auth()) {
+		if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_ADDRESS))
+			set_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, allowed);
 
-	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_GENERIC))
-		set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed);
+		if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_GENERIC))
+			set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed);
+	}
 
 	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SVE))
 		set_bit(KVM_ARM_VCPU_SVE, allowed);
-- 
2.47.3


