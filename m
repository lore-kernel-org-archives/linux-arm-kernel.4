Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D9606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J1cu/Xqx;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mo2tjuNh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H5HOKL2EhRK71scz5F39xMdCNEmAUE6COZwQwhC/mXs=; b=J1cu/Xqx/zbf2IZSjszWdySu12
	8U8WIuUm1cvRM8I912E646L6OEpEIixs26Y/DBsfAQzBeekeAqbFRjC5Jmj/894a3iL8xvPfTtNTW
	6vef3zO0YJlIFkt7F/rJYdZI4C0YypIcf6NBlWKgjT6zkFcV4y46gjPxmnrdjkrglbvxTDpIw1MI6
	oLBcUgh6x1ZNBLPSWoCh4k+VbYZxQBB+SO+L1VPaGj+vRYHfT2uAWcLjundv68YCvKnvlDxYtiTm9
	Ibc41kAIz0qLpO5iqvOp32pF371unfkleLLG5KAyZcspgSL3W3r7YVyBYO6VQvCRRIQSKf+3XioeL
	1Nr+R2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQ3p-000000072eF-25BU;
	Tue, 17 Nov 2026 20:45:49 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQ3g-000000072aD-0r9o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:45:41 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-4c7f887ac6bso167977b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794948339; x=1795553139; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5HOKL2EhRK71scz5F39xMdCNEmAUE6COZwQwhC/mXs=;
        b=Mo2tjuNhRgjk5JaKHORqZKRLDtT11EC6js65kW4vnNBQflP9qb/QkeIA8IFTXYPRai
         isWknvwhd3n/b6lzuvDvSE2iho0sbcIZcTqn07KCl4CIfPubNIwgALnlJ3aM3vFZ+Pa8
         Z/RdUmnj1R3wFHMYWQzCfwDAkMRp7EFH1yCsXpiCGJQBZmfL4Ne70DhoXvniNzkFNH/e
         oEanC+I05WZf0vPUBLyMryepfKpqwb7ntedvInTn2M2D3G0lZew0lgNM3sypSaWyTPIs
         SeS8oqBG2RkkuFAmNFqdMbdPJPV8thvHtdKQtCrKF1jwmfzN0BvpE3OpoqMNB1pq3cwI
         +xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948339; x=1795553139;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5HOKL2EhRK71scz5F39xMdCNEmAUE6COZwQwhC/mXs=;
        b=SGxWxX3/GcX+bTcgajDQnGC5Y1zRIVPYKyq2gsBflfEi4F971/AVVpPFNqorbYSSSX
         +CCRy/JbvtXHDqgPzGIfpQP2eN5SkLVgM7EkGduuBt0o0vqvVk8hapHcfmWcyHnNk+ws
         0fSOofKXRw6/Bhu19nzAdpVcivpXPEZQGkXJD5CEDZ3w6sbj2GcVDFvoQzqudLkPC28S
         NsImlT24olU4nkTDTahM4xSB4SK9J9XSYyjWhpnuCWL5RQstPQ9MrN49wR1zJ15nUULm
         ehSzvTF91RmcPIOLPrsbHxTY0lugzr6oyiAHEhRW1REfRerRS2VBA5xQqs7vhAVMavBL
         NDzg==
X-Forwarded-Encrypted: i=1; AL+hErEi9JOgqQxhPFsO+/WSKaYUTMhJRp0ggJ21hXoGSpdAZol2x3GBKHCktSeegF2io601AqrK0HKziq4pnaoXe8QY@lists.infradead.org
X-Gm-Message-State: APuU4Z/nJ/ou0KtUA1XlELLXnGEnpu3owQOl/CmMYXVtbfOc68Gh8BrV
	JboBXvlD5fu4j352vDMtlwJJz1h7TKZ6voZ3iJOoA/9Z7AbLkCTc7v9AJU2wjfqheWXLBVzw1WD
	ncHsE79dSWINFu3sum9dcl3Cbig==
X-Received: from iobmp24-n1.prod.google.com ([2002:a05:6602:a2d8:10b0:9c7:7f8f:934f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3096:b0:4e5:a74e:d6c0 with SMTP id 5614622812f47-57743d4c1e9mr1010823b6e.64.1794948338500;
 Tue, 17 Nov 2026 12:45:38 -0800 (PST)
Date: Tue, 17 Nov 2026 20:45:35 +0000
In-Reply-To: <20261117204535.4036191-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117204535.4036191-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261117204535.4036191-3-coltonlewis@google.com>
Subject: [PATCH v2 2/2] KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when
 E2H0 is NI_NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_124540_245813_E3C8F7B0 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

In a VHE-only EL2 guest (KVM_ARM_VCPU_HAS_EL2 without
KVM_ARM_VCPU_HAS_EL2_E2H0), KVM advertises ID_AA64MMFR4_EL1.E2H0 as
NI_NV1, making HCR_EL2.E2H RES1 and HCR_EL2.NV1 RES0.

Extend hello_el2 to attempt clearing HCR_EL2.E2H and setting HCR_EL2.NV1
from userspace via KVM_SET_ONE_REG, verifying that HCR_EL2.E2H remains
RES1 and HCR_EL2.NV1 is masked to RES0.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/arm64/hello_el2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/hello_el2.c b/tools/testing/selftests/kvm/arm64/hello_el2.c
index bbe6862c6ab16..5910497f8fbe4 100644
--- a/tools/testing/selftests/kvm/arm64/hello_el2.c
+++ b/tools/testing/selftests/kvm/arm64/hello_el2.c
@@ -45,6 +45,7 @@ int main(void)
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	struct ucall uc;
+	u64 hcr;
 
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
 
@@ -66,6 +67,13 @@ int main(void)
 		TEST_FAIL("Unhandled ucall: %ld\n", uc.cmd);
 	}
 
+	hcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2));
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2),
+		     (hcr & ~HCR_EL2_E2H) | HCR_EL2_NV1);
+	hcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2));
+	TEST_ASSERT(hcr & HCR_EL2_E2H, "HCR_EL2.E2H should be RES1");
+	TEST_ASSERT(!(hcr & HCR_EL2_NV1), "HCR_EL2.NV1 should be RES0");
+
 	kvm_vm_free(vm);
 	return 0;
 }
-- 
2.56.1.750.gf70dc682cf-goog


