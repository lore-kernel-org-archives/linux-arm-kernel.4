Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAF260A5BE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 20:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jYASG098;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=klUjnTD1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nMypBwJnR0vpA1cBr9OnEsaSU+Ny4MYTCLPv64i3c3A=; b=jYASG098auSgl6sajVVPJ0jDih
	oxTOl/Ot2UUNeLmreqeV/JIO9qotsNyQ9rHi7AzQ9bv4YimsfHnUsLQCzcPbIs7cMmWzg8CIOjsbi
	1iQe4ZiqykEPLlH8mnfLeaevUrvfzyBGaWIKcrGXWIFGKVKoGgJ9YPGxfzKRhPbAa4JlwtBp4k46z
	3/hGoJEmu3Dat4GFO9/42zkCbIp4LJSnz7oitt9EnwEdDFifK+/HnqibwczDBM2MoTtRGHAXj2Xf5
	GzU/iydtWlt2n7akec8k9i69nGCaAzhi2FkYStF4PIMy5Uw7Kr3vg1LpbbGblaUgOviAx4twMT93w
	pBn/8a9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2wJ-00000003p0a-0yZB;
	Mon, 16 Nov 2026 20:04:31 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2wA-00000003owu-481G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 20:04:24 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-5641cd2cc13so4372952b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 12:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794859461; x=1795464261; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMypBwJnR0vpA1cBr9OnEsaSU+Ny4MYTCLPv64i3c3A=;
        b=klUjnTD1CuqwoHgG2WMwoo9HR4kicd1KLSxEPcBKv4nYcL5FZrvMJwYkJ+t8LLLqug
         e3llIfFyqkfHLvZ1ku7ycPh/sw4ULI6zDqV/L3r4rn5fAoeRrM93k6VK8RqfE+IZxuuT
         XcIG2CrTLKs3O5iKxKRPCWzuXknQmjo+ik1VcrFT28rDS/uyS4kctBqelfq552oC4dxZ
         E66dhkpknWKS/FxM3GFbslO+7oVu5kidAO6KVD7CgoEO1QpSTEeShnoMmofE97MNerCD
         ALJLQuJWIKu6Jt7iqQQMRtmNJHXRWMDYLVUv1quB65Ar6H8gCckNm/BN+P++hHxeR5iY
         eIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859461; x=1795464261;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMypBwJnR0vpA1cBr9OnEsaSU+Ny4MYTCLPv64i3c3A=;
        b=ZSpOMq/eZmO79s6yaGpepCBKg8vHF/nwCupCuo6mBGaw5lUanYRuVN6UQTmO48Qil4
         1zO7YjoBmDE5sA0/V/W6wXn0XbJnqmOXFRD1+By2KvnLVfz9xaRYDLweuPGjclFnCEOC
         O5ArD6eYsuJWkWtHKQQB6POosmeQKfJTKLDlCOOOJERV78QVm2Pe91OPzn9hTZ3GpG+e
         MwJ0icSr1Zwts4kQauBf4xtyvAR8nWPfyfIbgPBqE92nPJ0ma0LcGuxG4H6Mmti1GLkR
         q1qgq0NlZCZYLoy6R6pkfKcjGKLNsG3RyQTvkYLNHd/3XVPGjY1CRQAcMpb9H/bRenb1
         UBFg==
X-Forwarded-Encrypted: i=1; AL+hErEnuJzGpAemQeAkJvUrAB61p+0H9cnqpoxJwy+4vMWGrQwCjDzzZcP+DB+TO/3xilLqWoS0Q7713TDUxQEezmE6@lists.infradead.org
X-Gm-Message-State: APuU4Z93m95rF6xDxfFetafhS4/C+Bq9tf2orC+GPPMwD4G49j8QRe02
	bxSSwNvIQxNubIE5Dj1FaQ1NfYrgiEdY5RKSzHUKq3Efxp+DXBGiqmQ7jel1Hqx+NEa0n++Rgno
	XdCxd4fHCxCoZnEDiqhIppZwowQ==
X-Received: from ioo28-n1.prod.google.com ([2002:a05:6602:865c:10b0:9c7:7732:c3c1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2383:b0:568:e5e:8058 with SMTP id 5614622812f47-56e6378f81fmr10829049b6e.19.1794859461431;
 Mon, 16 Nov 2026 12:04:21 -0800 (PST)
Date: Mon, 16 Nov 2026 20:04:18 +0000
In-Reply-To: <20261116200418.3535619-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116200418.3535619-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261116200418.3535619-3-coltonlewis@google.com>
Subject: [PATCH v1 2/2] KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when
 E2H0 is NI_NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_120423_028024_5BB04C89 
X-CRM114-Status: GOOD (  10.98  )
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
both from guest EL2 (across a trapped ID register exit) and from
userspace via KVM_SET_ONE_REG, verifying that HCR_EL2.E2H remains RES1
and HCR_EL2.NV1 is masked to RES0.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/arm64/hello_el2.c | 34 ++++++++++++++++---
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/hello_el2.c b/tools/testing/selftests/kvm/arm64/hello_el2.c
index bbe6862c6ab16..46b0f63e199f0 100644
--- a/tools/testing/selftests/kvm/arm64/hello_el2.c
+++ b/tools/testing/selftests/kvm/arm64/hello_el2.c
@@ -13,13 +13,29 @@
 
 static void guest_code(void)
 {
-	u64 mmfr0 = read_sysreg_s(SYS_ID_AA64MMFR0_EL1);
-	u64 mmfr1 = read_sysreg_s(SYS_ID_AA64MMFR1_EL1);
-	u64 mmfr4 = read_sysreg_s(SYS_ID_AA64MMFR4_EL1);
-	u8 e2h0 = SYS_FIELD_GET(ID_AA64MMFR4_EL1, E2H0, mmfr4);
+	u64 mmfr0, mmfr1, mmfr4, hcr;
+	u8 e2h0;
 
 	GUEST_ASSERT_EQ(get_current_el(), 2);
-	GUEST_ASSERT(read_sysreg(hcr_el2) & HCR_EL2_E2H);
+
+	hcr = read_sysreg(hcr_el2);
+	GUEST_ASSERT(hcr & HCR_EL2_E2H);
+
+	/*
+	 * Attempt to clear HCR_EL2.E2H (RES1) and set HCR_EL2.NV1 (RES0).
+	 * KVM sanitises VNCR-backed HCR_EL2 across exits such as the
+	 * trapped ID register reads below.
+	 */
+	write_sysreg((hcr & ~HCR_EL2_E2H) | HCR_EL2_NV1, hcr_el2);
+
+	mmfr0 = read_sysreg_s(SYS_ID_AA64MMFR0_EL1);
+	mmfr1 = read_sysreg_s(SYS_ID_AA64MMFR1_EL1);
+	mmfr4 = read_sysreg_s(SYS_ID_AA64MMFR4_EL1);
+	e2h0 = SYS_FIELD_GET(ID_AA64MMFR4_EL1, E2H0, mmfr4);
+
+	hcr = read_sysreg(hcr_el2);
+	GUEST_ASSERT(hcr & HCR_EL2_E2H);
+	GUEST_ASSERT(!(hcr & HCR_EL2_NV1));
 	GUEST_ASSERT_EQ(SYS_FIELD_GET(ID_AA64MMFR1_EL1, VH, mmfr1),
 			ID_AA64MMFR1_EL1_VH_IMP);
 
@@ -45,6 +61,7 @@ int main(void)
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	struct ucall uc;
+	u64 hcr;
 
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
 
@@ -66,6 +83,13 @@ int main(void)
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


