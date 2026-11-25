Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E35606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XN5eE2TA;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=RgmlKoVL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TsvjkV1z3SJCt8rGDNCxfVDi6AQK70itPPBCytlT4MM=; b=XN5eE2TAVdXsoI
	lWaZE2pML4BSA5rB5FzsZ9kblfK6HJ4EhN5BhpJCoGPUNSCZaH1bCEOYGL6sPWgcVBjafkEgZV4w9
	5OLBElmXyeuUUlTfLXXVlfY2C/AZfMwkAk79ROBFmGMNlRtj8a/uKhQ3h63FZqv+WUXc1OoOO+i/1
	sFxJfXy+iIpFKLqvHyZ4gAYMvMip6idxiKvyGbKuIeJuUYnEd+djbqxiytvjBkxOfRIEhHRQaiWfg
	Z8mfuABVf3fQFO62OHkNdGmyZtVwayWbjePxcwDCFbmbNvE/xK1IDoPBsXPCpQmhDu5+fG3ZHyoFs
	TFsEyM4ujsbEp8TA1yew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6wc-00000008lZZ-2jtT;
	Wed, 25 Nov 2026 06:57:30 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6w2-00000008lH0-0eqT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:56:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so2902922f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589812; x=1796194612; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsvjkV1z3SJCt8rGDNCxfVDi6AQK70itPPBCytlT4MM=;
        b=RgmlKoVLg7fR0SfCR7UQEdEqhnaLsVZFPJMTdf9DHrBNPKk0nVZF4ZxPpLae/ZdZuR
         +SRb0dXtMHIDnqU5fZQtmxgD+pEXETxCtPewKzFQUiGfc0C2jVXeDeUPM1VodiAS7sQX
         BYkvUJClCW9T17mYFrxUlSNEyas3nSlIqtrBy+n+ycIOkzSJ8Q6jXLEQf2zUrqfL6QQw
         iF4PaPefaVeEK15k2FwK4tJ51z04pO+WUt9Jvs2v4UoDcLyPkf/Lc+P+cNdmTYmIcTyE
         KIgtR7rHOB04oM9bPj3EcdOyK89S+Up8OP0kPx40EPV0nRlDXamtP0EkFfJDlSvG/z45
         3Z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589812; x=1796194612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsvjkV1z3SJCt8rGDNCxfVDi6AQK70itPPBCytlT4MM=;
        b=PrTB+VhIL4b6Ij5yPU2SHeSXfNv+JPkrmoOZ3nOVUw1AsRceF4rcVIfEcWIvRfwgv/
         kpYh5wuaA1paj63dG1BcPPKThZIu80wzogpYHoeSa8Oq20L2qMfmWup/gQK4rTyoKnH2
         GJdy4mAG3CHG7kYuwFV23jEvkn4P/yVS/oLjbGP3hr3E9U9pITZrFE+z1Zu2QJiWzbte
         B83KL9NWOt4PgURDFqVN7XoRtuJIcea8Q7KRRM24buhvte0/GJludqt5XTAGLa9vMUt/
         92yHHll8PdDU/LfVlyaG1/RsSfosArVOZT2SCZL4CAt2ZwiSJYWn286NWM9M6gfd6EYX
         ogRQ==
X-Forwarded-Encrypted: i=1; AL+hErGam0TqX1erqcmfVx8jEBEdZXRGoNuPnehBbrQFfnmbdP09C7aWczghc2W35Yura4l4VaFvw4csRTZTgMarFTu9@lists.infradead.org
X-Gm-Message-State: APuU4Z/zbTD0O4e3IwYhLPFteL8JdnE9IO+MZ/8Vo2Oy5+9eNBTCNpsk
	lqWzwz60YWWZwud7EdiDuexOB+oqfmuvO2PsVdtPk1vkKq1PXeK9fYPqLrkCx+yveKc=
X-Gm-Gg: AZFdTZcpj0xj+qbqiidITChHCQss3HGjtqccf/z5xLjk1A6ohI1gkwHLg0bhSktedG2
	5rf456JVGGour/U/9qGh/gYYQEArGvk2NeGbyHRr5c39SbM/6hV/gJLb9iqTNAqyY19PwsTqZ4O
	2OHWC4l7MzArsli9xUY/Jflmxl7JrxLKrkKq+qH1XaqcAXj7Gt4Vt0tABB2nG35izYcKVRHbb7c
	ryUx7hDLyOZVtcVhdFhmlsiPRtPcFNFjjLPcIkdwaMHlPXCQreTdkT5XLgeWmOJm19qwCSg9b1A
	E0mN6BL67p6adOQDSRlUwDqTcRklFbLPzXn5ubUqW/S38dIiQVt4+q73u/H/qbwF6TGofm+bdPN
	0tZTbz9fVQtMgb8/bEK/q0OOOVEmS/KDQQwWOVx47TiXKmRJt3D8A1OXvzCkIcmrpPUp9G9vIuR
	UibnxFqaMDwIgy/V/qwocQfu3uG4RYDQVkFlngFyliWH2Nr75wxjIw7T8zxQ2eJnMZ0Ub+bwwb1
	pi21MySw6BOSyUEoiaHbhqX7w2lpXQSL1G6rWESnhhC4EeO7PFLhlwnmW5z3KhHlAT9jXN0erAO
	jgKml8opE7SAXWzr0UQ=
X-Received: by 2002:a05:6000:461a:b0:491:1e3f:a427 with SMTP id ffacd0b85a97d-4abb4b84d2cmr32386732f8f.42.1795589812021;
        Tue, 24 Nov 2026 22:56:52 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm32520868f8f.5.2026.11.24.22.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:51 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:21 +0300
Subject: [PATCH v2 6/8] KVM: arm64: nv: Don't deliver a pending SError to
 the wrong guest
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-double_exception-v2-6-224689d8a764@pereq.eu>
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
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_225654_222836_4C64400C 
X-CRM114-Status: GOOD (  14.27  )
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

With nested virtualization, when we inject an SError that the guest
has masked, we set the VSE bit in ->hcr_el2 and the CPU delivers it once
the guest unmasks SErrors.  The problem is that the bit stays set when
we switch between L1 and L2, so an SError meant for L2 can be delivered
to L1, and the other way around.

When we switch, clear the VSE bit and set NESTED_SERROR_PENDING instead.

This matches what kvm_nested_sync_hwstate() does after every guest exit.
Then kvm_nested_flush_hwstate() injects the SError again and decides
where it should go in the new context.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-229065@kernel.org/
Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: new patch
---
 arch/arm64/kvm/emulate-nested.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 39136a89d74b..cccaf02610e8 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2792,6 +2792,18 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
 	return spsr;
 }
 
+/*
+ * HCR_EL2.VSE was set for the context we are leaving.  Store the SError
+ * instead, so that kvm_nested_flush_hwstate() routes it in the new context.
+ */
+static void kvm_nested_stash_serror(struct kvm_vcpu *vcpu)
+{
+	if (*vcpu_hcr(vcpu) & HCR_EL2_VSE) {
+		*vcpu_hcr(vcpu) &= ~HCR_EL2_VSE;
+		vcpu_set_flag(vcpu, NESTED_SERROR_PENDING);
+	}
+}
+
 void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 {
 	u64 spsr, elr, esr;
@@ -2823,6 +2835,7 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 	preempt_disable();
 	vcpu_set_flag(vcpu, IN_NESTED_ERET);
 	kvm_arch_vcpu_put(vcpu);
+	kvm_nested_stash_serror(vcpu);
 
 	if (!esr_iss_is_eretax(esr))
 		elr = __vcpu_sys_reg(vcpu, ELR_EL2);
@@ -2909,6 +2922,7 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	__kvm_adjust_pc(vcpu);
 
 	kvm_arch_vcpu_put(vcpu);
+	kvm_nested_stash_serror(vcpu);
 
 	kvm_inject_el2_exception(vcpu, esr_el2, type);
 

-- 
2.53.0


