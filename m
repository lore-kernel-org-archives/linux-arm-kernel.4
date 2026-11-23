Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0704606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zU0jkPPJ;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=YUA6EbJu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Qxwqe8GUXMMOeGYRq6VI9SiKGnvgjX45C+Y5v/w1m2g=; b=zU0jkPPJ46yoHfk0RswOwvh1HK
	nX8gRmjESl9Ftkq/WKzNaVopCYW+OgjLFecOrLoiFg7nypVzk4AWrI2287wW4RPWRwUJSlhP9l+/H
	+PKuVlDvi76zBT13QVdTKmPNFahuyo9uaKcPhTYFPRCrKw0n7xMEFOJKHLHU5BcR13Iqxrvd7TA7b
	sDskz7PJ90N+NXL6FsZ/wXoG+7ZBkWnkx/BNd25f3gr95rbpgCm5OfwtssCEmB7X/G+fsOsPoNmK4
	V3LEmiyRfegi2xMb54UJDw1P7WhiZrZxG7Kqhwo+fhXGJORgF+Wml8rLAlDDdO7EmQkpLCPinfqfZ
	OmJMKfYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQvu-00000002tbE-2ltu;
	Mon, 23 Nov 2026 10:05:58 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQvp-00000002tZK-1o7N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:05:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2128499f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 02:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795428351; x=1796033151; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qxwqe8GUXMMOeGYRq6VI9SiKGnvgjX45C+Y5v/w1m2g=;
        b=YUA6EbJuN3gDXF/Gv9sTvdIIhOlZaSvAcx65XnfQs6VEhaJNnrwC6GWc+QhF7I28Xs
         plm/DvWYLXzrGdC1xEQA9uZtsQqeTEWq0Nc/tnSlEnzExWgHsUJS8lbGwU4rSArLoVkx
         4F/wYLjq90BEcFVs84updKi7pRyBtzQjynLJ1F+TbtovqgmIxBcvWq3+5ZdlKbXJLRwA
         FNPqko0G+iPcOTq6eZ3APIIbY47Ot/3ed69u9S18SixflRlLd3/GGA/7IkHtZrzOaQT+
         6HhCvthA3CGqmkf5cqkWPdojE2nUmTVWQQgOY8YWKKmv6owN/ganSmahatJHZasx4n1U
         PkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428351; x=1796033151;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qxwqe8GUXMMOeGYRq6VI9SiKGnvgjX45C+Y5v/w1m2g=;
        b=FGAMUJHYFCyiH0pRU71zWn63OI8JhJIKqUQDoii/u3wGMFqSB1+3UjKZLdy0PyMNsV
         tCQER90kAjMtxUlg+RtnbRuL6yG/meaJFZqKgnZisY7qcJPF7VBSPO0vGo1ZQlENIMlu
         1jUa1S21sUeqJkaff2uo69mZ9fk2O+y582hc56F4m7xP9ZaiCpGvyZeHyQTZ/hKvZl03
         +Z+BPbanYUJa8sp5SG6qCFCg3QG81wBzZmjB08MqfEMkxzAh/fCum0qoOYWKvWHaDkCz
         +lzYoL6B4bpFoM21lp4QHfBnK9ikGoMIvIVS2N2rqjRHwdRPsVQ1HCPO0JppKimEX5Wa
         5euA==
X-Forwarded-Encrypted: i=1; AL+hErFKo1B4Xx9Gy1M6O+qiUHyfC9pP+JmbpTbkrYW0Lu4VM2JSc/1ggxpSChQpP0l8dwWHYqH1cQl3alOAN3QLRgxZ@lists.infradead.org
X-Gm-Message-State: APuU4Z//4QxQqEw7wztpOZ0oDmjQfakTXOs3kW9mnbMhLoVlH1kb9dVE
	Jm+6a5KGm+pPdXevnIezGGMhN8Hp8iaO9AdBnIxzlW1QxcnzaGu8M7QlQUor9B0V4aw=
X-Gm-Gg: AZFdTZfZ5P8131tftfTuqMhd55w5u+vpCwtw6nTfd/640AoFFkp5yuw0BR8aEA9wozG
	HdIJRr7iGWbWZjp3pHUzEQPx68joje9NxZLNbAIK8RfrngeHIXjX9J6JSZhDMwJzTMZEUjef8XH
	Lt4wV50o5LsRWRm10CGl7czXIfxd1PQg3pXX0NY8wqa8XK4n3+cIGlIWENE152mL+FTZB93ZDit
	IddrGiFzdiBhP+V2jOEO1ZW21uQt91U6Ebvixttu6io9zeHcwbphUReyl1jM2M85hHy5C+C0VrD
	I4LlwE4cZLQlRImDA+8E+eodKxc+Q9v8kUkCN8tCKH0JKkIiat2+An7N++p6RNdTIVlt/3RKa5j
	4y5dBfywySvDMaAilRYUx8w69yreqJsN3BbEzrvIeKjK115GDPOxDv0D4uyTPfxhpBz8nzm2wB8
	gSB40Yo5j9R/slCGhE3DmJzxS7DsPdvrwhNflPlioQpYBQv4aanqgIuyIdcfjvyuobwiabucfE0
	eZTrmWZjbLw+B6fufXl1yXf7nD4wtLM2+saqOuFwFsKph2imCbV/WIxY8p8p8+JtyXmYp3JadU3
	Nos0tHcXIl8dQca4je4=
X-Received: by 2002:a5d:6f07:0:b0:4af:7577:65c0 with SMTP id ffacd0b85a97d-4af75776767mr11555729f8f.5.1795428351077;
        Mon, 23 Nov 2026 02:05:51 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm23977561f8f.24.2026.11.23.02.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:05:50 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Mon, 23 Nov 2026 13:05:17 +0300
Subject: [PATCH] KVM: arm64: nv: Re-inject a stored SError after the exit
 is handled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-double_exception-v1-1-cd82b59a232d@pereq.eu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WMywrCMBBFf6XM2kAnPhB/RaQkk6uNSFoyrRRK/
 91Ely7PfZyVFDlC6dKslPGOGodUgHcNSe/SAyaGwmRbe2K2rQnD7F/osAjGqYyN2x+CyNEy85n
 Kbcy4x+WrvN5+rLN/QqbqqQvvFMZnl6Sv0Z+x9rRtH/dilyqcAAAA
X-Change-ID: 20261120-double_exception-a34dcc521118
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 stable@vger.kernel.org, Dan Carpenter <dan@pereq.eu>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_020555_788627_89615C9E 
X-CRM114-Status: GOOD (  17.67  )
X-Spam-Score: -1.8 (-)
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

KVM only has room for one pending exception or PC increment per vcpu.
If something is already pending and we try to add another through
kvm_pend_exception() or kvm_incr_pc(), it triggers a WARN().  If we add
an exception on top of an exception, the first one is lost.  If we add a
PC increment on top of an exception, the PC increment is lost and the
trapped instruction runs again.

Normally an exit handler records an exception or a PC increment, and
__kvm_adjust_pc() commits it before the next guest entry.  However, with
nested virtualization kvm_nested_sync_hwstate() can add an exception
before the exit handler runs.  It re-injects a stored SError after the
guest exits but before handle_exit(), which can pend the SError as an
exception.  The exit handler then records its own on top, for example an
HVC forwarded to the guest hypervisor, the FPAC for a failed ERETAA, or
the PC increment for a trapped instruction it has emulated.  This
triggers the WARN().

In this situation where we have two exceptions, the correct order is to
handle the exit first and then the SError.  Change the
kvm_nested_sync_hwstate() function to only store the SError.  Then
kvm_nested_flush_hwstate() uses __kvm_adjust_pc() to commit the exit
handler's exception or PC increment, re-injects the SError, and the
guest is entered.  The early re-injection was there so that a pending
SError wakes the vcpu from WFI, so kvm_arch_vcpu_runnable() now treats
a deliverable stored SError as a wakeup.

Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Fixes: ce66109cec86 ("KVM: arm64: nv: Take "masked" aborts to EL2 when HCRX_EL2.TMEA is set")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/include/asm/kvm_emulate.h |  1 +
 arch/arm64/kvm/arm.c                 |  1 +
 arch/arm64/kvm/inject_fault.c        |  6 ++++++
 arch/arm64/kvm/nested.c              | 16 ++++++----------
 4 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 2d7c82cfb8a4..ab2ec9078b76 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -48,6 +48,7 @@ void kvm_skip_instr32(struct kvm_vcpu *vcpu);
 void kvm_inject_undefined(struct kvm_vcpu *vcpu);
 void kvm_inject_sync(struct kvm_vcpu *vcpu, u64 esr);
 int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr);
+bool kvm_nested_serror_deliverable(struct kvm_vcpu *vcpu);
 int kvm_inject_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr);
 int kvm_inject_dabt_excl_atomic(struct kvm_vcpu *vcpu, u64 addr);
 void kvm_inject_size_fault(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a148e80d0aef..2a2add60b72d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -966,6 +966,7 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *v)
 {
 	bool irq_lines = *vcpu_hcr(v) & (HCR_EL2_VI | HCR_EL2_VF | HCR_EL2_VSE);
 
+	irq_lines |= kvm_nested_serror_deliverable(v);
 	irq_lines |= (!irqchip_in_kernel(v->kvm) &&
 		      (kvm_timer_should_notify_user(v) ||
 		       kvm_pmu_should_notify_user(v)));
diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index aa2011cc0d5a..05c98acb014c 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -357,6 +357,12 @@ static bool kvm_serror_undeliverable_at_el2(struct kvm_vcpu *vcpu)
 	return !(vcpu_el2_tge_is_set(vcpu) || vcpu_el2_amo_is_set(vcpu));
 }
 
+bool kvm_nested_serror_deliverable(struct kvm_vcpu *vcpu)
+{
+	return vcpu_get_flag(vcpu, NESTED_SERROR_PENDING) &&
+	       !(vcpu_is_el2(vcpu) && kvm_serror_undeliverable_at_el2(vcpu));
+}
+
 int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 {
 	lockdep_assert_held(&vcpu->mutex);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 78d5b18dbd2d..f063c01c565a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -2213,8 +2213,11 @@ void kvm_nested_flush_hwstate(struct kvm_vcpu *vcpu)
 	if (!vcpu_has_nv(vcpu))
 		return;
 
-	if (unlikely(vcpu_test_and_clear_flag(vcpu, NESTED_SERROR_PENDING)))
+	if (unlikely(vcpu_test_and_clear_flag(vcpu, NESTED_SERROR_PENDING))) {
+		/* Commit the exit handler's exception first */
+		__kvm_adjust_pc(vcpu);
 		kvm_inject_serror_esr(vcpu, vcpu_get_vsesr(vcpu));
+	}
 
 	vgic_v3_nested_update_mi(vcpu);
 
@@ -2231,18 +2234,11 @@ void kvm_nested_sync_hwstate(struct kvm_vcpu *vcpu)
 
 	/*
 	 * We previously decided that an SError was deliverable to the guest.
-	 * Reap the pending state from HCR_EL2 and...
+	 * Reap the pending state from HCR_EL2, and re-inject it from
+	 * kvm_nested_flush_hwstate() once the exit has been handled.
 	 */
 	if (unlikely(__test_and_clear_bit(__ffs(HCR_EL2_VSE), hcr)))
 		vcpu_set_flag(vcpu, NESTED_SERROR_PENDING);
-
-	/*
-	 * Re-attempt SError injection in case the deliverability has changed,
-	 * which is necessary to faithfully emulate WFI the case of a pending
-	 * SError being a wakeup condition.
-	 */
-	if (unlikely(vcpu_test_and_clear_flag(vcpu, NESTED_SERROR_PENDING)))
-		kvm_inject_serror_esr(vcpu, vcpu_get_vsesr(vcpu));
 }
 
 /*

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-double_exception-a34dcc521118

Best regards,
--  
Dan Carpenter <dan@pereq.eu>


