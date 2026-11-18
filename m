Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8678606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x5KUgAkY;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ILw8sBLc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7xlWmwrLiTN9oWrbWWc4bJ9ER2WNpvMfBsQ0dHA4HLk=; b=x5KUgAkYZDAtkVtMv/XiT8j8Zu
	fhwuLIBLOAGBIYucGFdoznmtNBYcJTzM1zuDNlpxQ4+fA54dx/iC6Xr/Uhk9r7NGhQ3yuOsw/hKNo
	gqgzNeR8m1RRJG62hV0AgZ0s1oJ7VG9x59cqlOKPp4eld+l38EqDiUwUKPh7oSwb3IfTEVxhgzNnL
	cPwwyYQZuTe4OqvPK4EvbiuEBeFpTEmb4IOqiF3vL1ZgLdnfpgxicYnJewIJYuQAqsdWC4a3v36bW
	FA8zK8gnvV9ORpGWWrpV6MjqMCkvIGeHgy3F9/Uxx4vCTDfS1rwfVEccBH465iVlfdL2iqZqY4euE
	Fp2dwC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmOe-0000000AEhA-2dlo;
	Wed, 18 Nov 2026 20:36:48 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmOO-0000000AEbU-0Bf5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:36:33 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-4ea2c058e67so1364898b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034189; x=1795638989; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xlWmwrLiTN9oWrbWWc4bJ9ER2WNpvMfBsQ0dHA4HLk=;
        b=ILw8sBLcUjEf0Drj9gn8ycxH7rywqOz27RrnJ6JwNIvCx9hJZazeRxr+iQHx2YIYOd
         36E4lSJbtqq7m59DAWwoHOkoKSqfydfypniki0ZUTRryBxi+K1nROQeSXgcogXCWJDqd
         fewnlKyKRsetG9eWDbhe2IgEnTF24kEf+3DWBI+XOjrndJmcUd8LsACqWoXRrRmrpuKq
         44TMMfxGO5T9fiAt7RTPNZFlDnNnm9dzPzcGgRJORp2E5RZfggLv5JHuSXxFQmK5U2Nd
         h0j7bmD4QIm/CDQ4t8fTVVkJZrDVzX0sfYsFEqmK9sElIcoPG3xYNb51MryTQ4IgRxNy
         DETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034189; x=1795638989;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xlWmwrLiTN9oWrbWWc4bJ9ER2WNpvMfBsQ0dHA4HLk=;
        b=zOqCsjcqJwQhgILetXN+e/YQK359XQIIoFsYPFqmEdVg+371eXR3atuXten52qBhST
         yaR/ANlhaQ5kU6d8ZQDuKkLi3OgUoBuB0RpyugEE4c2mG5eeS/AE7hJRrTBLf+Rdn36e
         48Hg+pmQjhgn5tIJMjCin4l5ckw8ig8zrMXhmTRITFTWsYckR8AneT+LxMhLiOy8LrTU
         N0/AU55XScU5cVZn3BjEOFI/heBC3u/JQ9cuageXQWAvjurYU/+Lbp77Hnkp6Z8B73Hn
         e9LQ/phFvhZIreKSKCIE6ZXLUM+PiaZRgl+jCJozfLP4oN7+6XjmlzlkOY5uCai9b0EF
         5i2A==
X-Forwarded-Encrypted: i=1; AL+hErFXZtZCo6ALM4mIVbFzWHpjJhWhzAtcxKmhq+PSohGPZkosMprbiewSkDIQspZXWdS6unebd109L0l1KgmMnT30@lists.infradead.org
X-Gm-Message-State: APuU4Z/Zxb03R0y+LdPpH8NNp87RB7UcxrbUuNx8NYuXQm9m+sdPZG1S
	5NDBMZUw93XSM8j33bprchuJDmBMtUoT1SKxd/beRrw+6j/hbOXyszPNt7YfU1BOq5FZ4tmuGXn
	2nftXD/MdNB0QBg5SVAEtYAKK/g==
X-Received: from iobn34-n2.prod.google.com ([2002:a05:6602:c6e2:20b0:9c4:bd6e:a838])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1927:b0:4af:5d69:1cb4 with SMTP id 5614622812f47-5773cd2176emr4714167b6e.15.1795034188500;
 Wed, 18 Nov 2026 12:36:28 -0800 (PST)
Date: Wed, 18 Nov 2026 20:36:25 +0000
In-Reply-To: <20261118203625.743428-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118203625.743428-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118203625.743428-3-coltonlewis@google.com>
Subject: [PATCH v3 2/2] KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when
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
X-CRM114-CacheID: sfid-20261118_123632_183246_ED380F8E 
X-CRM114-Status: GOOD (  10.05  )
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
RES1 and HCR_EL2.NV1 is masked to RES0. Add a comment explaining why the
check is performed from userspace rather than inside the guest.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/arm64/hello_el2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/hello_el2.c b/tools/testing/selftests/kvm/arm64/hello_el2.c
index bbe6862c6ab16..3bd3596f5fb1e 100644
--- a/tools/testing/selftests/kvm/arm64/hello_el2.c
+++ b/tools/testing/selftests/kvm/arm64/hello_el2.c
@@ -45,6 +45,7 @@ int main(void)
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	struct ucall uc;
+	u64 hcr;
 
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
 
@@ -66,6 +67,20 @@ int main(void)
 		TEST_FAIL("Unhandled ucall: %ld\n", uc.cmd);
 	}
 
+	/*
+	 * Verify RES0/RES1 enforcement from userspace rather than inside
+	 * the guest. From the guest's perspective RESx bits may be
+	 * stateful (reading back as written) even though their value is
+	 * ignored, whereas KVM_SET_ONE_REG applies the effective masks
+	 * directly.
+	 */
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


