Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9896606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N3SkpXtm;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=cjT9iL/Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zVlsemVCBduIoN4ovaejAaSJjefUyq+bd4EIprH6ZNw=; b=N3SkpXtmCnXffZ
	klnMh+F9b0QApW+h/nf+LPwKwJR/dioFoU28fg8igfefvybKsesZC8EBcJLrdJ7oXxgmG+SwkZ7bE
	3egsCH3/u4XiofP9kcxkB/egOl0IudoCWyeyfZA65QY9zPyjObB5J4r98Lkl6TR8cWveLES8hspMs
	Fss5j7vhcsT+COlorJg9o8QSF6ugovtwke3sQOgegIFFsBzs9bTtML+FIU8hMqeozfCOWkt2LDDUg
	WGa0V7ccjgh70lUQBcRkxdQSNybzy2+hZ5Qs7pPwnZtcZKYxeXb2ITieTP9sOp1s8+BiIj9+55nHg
	GjRrgiHYZ8qZ8doLGIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6wc-00000008lZm-3GYW;
	Wed, 25 Nov 2026 06:57:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6w5-00000008lIo-0MPO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:56:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so49148135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589815; x=1796194615; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVlsemVCBduIoN4ovaejAaSJjefUyq+bd4EIprH6ZNw=;
        b=cjT9iL/Ywj34FwsMXdSXgAg9p1tWMsI5KDSaT6GxK8My5H9IIA2Acuy/Sop4ifE8cD
         v2uG4LH1dTwJFxze9bsAY+8D9Ant8h0kgn1AN/WMRzw2KgDv69U5VMO6jl1Pu1NlVEVI
         z7/xXkzlqPeURfSeOLF9ZTTO9pHsi90fJwBANilKIZTp3uVuuxK7EQMSPI2ipvCfQVKt
         OqnOz+zQVTcwpubHHdDqfl46hMCazqxop4JxF6DyaCYgYZaTiw1hGZqWBqjHPfKSVg32
         kiB5IEALXXnmk8rsCN+vWddaAZWlvMQQiDESBkC72wYw67u3wIjVZaMdYbBAOA2ibwbT
         NHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589815; x=1796194615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVlsemVCBduIoN4ovaejAaSJjefUyq+bd4EIprH6ZNw=;
        b=tiSbLBF+UX+XjMKWCRNQBNt8rfW/PzbH25roCx225oON6WfFp8R6JyZdgzJdUZ0KuU
         TbmUXysLtyqLgmK5kOKa2AcpBMI4zpIyro4Mtp4WHPtmKhtlOR/mubePSBsuBZrroJpo
         Pz15j/MOp9p7ttfsxGbr+ZoBJC0huLwP4NqKCeFRXlS0/20uMaaL2AnRN2TTpnHZ39wE
         A66BrBUbyrPcR4RtTrE6IVbDvutkC8jk5ba9WgyJJ2A7yC0QTafCa9veEehJA8VRTcis
         dCKmaVyHWRKuxSQlGWc/hMTM2cwJeR4zg4jZVTDFYuPTA10iklEJFaoTa94o+2b6wUlT
         5EIg==
X-Forwarded-Encrypted: i=1; AL+hErEUCkT1K4ADLoZJUCpGzqVK3vAuhARy64Tk5SB0rmi8MFKWOCsxLs6VJ2hWSz5gKRe/E7Om4ApXjjvc40hMtkpQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+lk6COFoS+If3I+avfvT5fC6IsXXBYmtsmbKlRZYKIiiCXg3FH
	qwreKYYXtjGzCCA+OOO1uyllhrJulG/a/2dixs4o1Yt8SNIlHfmmNKHLu7u1JsNsCU4=
X-Gm-Gg: AZFdTZe/Bx+UraGSY76OTbrhSDttMiB+k+AOx63/UcNmP1y8BG/eQINgnDVTg0bv5T0
	RTifT2tWXhRLoV1/NGG6qsYhVRl3MHAlUmkYeQQnLrd5T/03980H0lem1WAv+0iUOHP5sKn2pye
	VdnEnWH8Df2thzULwjYk4TDjfQaie1No7QQ5RaFp8RnovJxQJb+NAB8nr4G0xVldlv7G5Jyn5DH
	siY/1VmNLMOPMyYAdgIzItISkTTNJlUxPmAnwLj4ia8+jbx3SLguBUYApvrgONnHczethWqGUes
	/86HZdbhSDfB3/bytEDIEcB0aJ5s5S3q2nR71vrgzj8ajzdKk0ZfZUbeRm6RYXLDz1LP58KUcwt
	luC17j3uGOKZM8xjGyPU6UKCZl8GqKTSFVqsLVMJ8u1+vSg1eLjsqKxp82m/2xGe5vVnS9G9vbU
	GI5VW1kl9r0G/dpSbfxuSQk6afacLcuAK+krRD+E354wtzQCr8ouOF7u8wAs68Dgn2wCybxca7a
	6kQHtZONTlvqZALVTPdXQF3vKVLQNMSa8rfCQik/PBIzeQ6sIMXiWgD/ZU9ni78rmKc0Oi1gDqL
	gpRhOHP4XkOLB3kBzgfO2JjsrqUZDQdYNek6jXAh
X-Received: by 2002:a05:600c:64c9:b0:4bb:8701:bb14 with SMTP id 5b1f17b1804b1-4bb88804d1cmr371875465e9.5.1795589814958;
        Tue, 24 Nov 2026 22:56:54 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm681730385e9.13.2026.11.24.22.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:54 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:22 +0300
Subject: [PATCH v2 7/8] KVM: arm64: nv: Re-inject a stored SError after the
 exit is handled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-double_exception-v2-7-224689d8a764@pereq.eu>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
In-Reply-To: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Christoffer Dall <c.dall@virtualopensystems.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Sebastian Ott <sebott@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, James Morse <james.morse@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_225657_413163_C7A73DD6 
X-CRM114-Status: GOOD (  18.97  )
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
v2: No change
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
index 0f6a89b65074..1d5dfd4b9e00 100644
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

-- 
2.53.0


