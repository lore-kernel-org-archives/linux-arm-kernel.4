Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C5C606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4vgwMbTg;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Nx/nrEVk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CO0vZwWHnFlrPlO9I1IjS868FeGKeBrErc/5Mvm8QC0=; b=4vgwMbTg1kkyzZ
	ejgeYabpDqbRSXaWJLht/0+QykTQHZvhktkmsxY2/qDj6poC/Vu3DiCX6kmrsr1TJ34WKWh4+9kVb
	ttEPi2FAXXPcu1KUWDYP/TI2Izij5on/cp0W1fFHT4u1Kmi0ki8IneX3qEtp0lCjFAgduHntsC5Qb
	jRX/xLZSBmBk+iZmlHJdmmFDegrk8XVJutVjj7EfwY1BIdweag9Fa8XJQP7w6QVn1/pWBdGNv+dRS
	h5ExMQyd8ojDi+DIKAn2uByMM0Td8xLu7WBnhiooCofPOWXQPCvg4/nKR3UWnF2Y6TDejjwxuKMK9
	j+sSn+dCF16CPZ5OKtEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6vz-00000008lF4-0otO;
	Wed, 25 Nov 2026 06:56:51 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6vq-00000008lCJ-057r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:56:43 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4a9be758734so3345472f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589800; x=1796194600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CO0vZwWHnFlrPlO9I1IjS868FeGKeBrErc/5Mvm8QC0=;
        b=Nx/nrEVkHBXGwB09e8Mbw+ZhYoIJuitIzg2qrPwOYWy+ulVeJv4enlfpehYF20d1fm
         0LUkzutuCAPC8YCYxDQmrIleiXY+NonKKPBs1ho83DFIxd8YAUyuW/nNlQu95pQQ2L9L
         3B8QbgC1g8wB2bYdxCTEC7KDxiuPteMtoQse3giFgFVnQsD9mlrKHq2MAyxxC+ynAlgP
         DiIlgFZdwDeeSMiHlSI4awnUwohR4vRKxc+pT+PkAHDGiIWk6AzBxcye7zB/Any80Ym3
         po3+I3FoHjQAwxw91PJdn16M2BD6yU2v7aI3U7/01H9/k/FxIMfewn7kmmSYX7vtL7D9
         IpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589800; x=1796194600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CO0vZwWHnFlrPlO9I1IjS868FeGKeBrErc/5Mvm8QC0=;
        b=GQ6/P2uiCam4kaBkoxjMLaGAFmEpuFdJTODxYFtUFY2Mn2dU2siInWaXjTH/qZstpJ
         OavG6FLNZ1txc8gG7c+6vAFMWPxY4CY/HWYsHGJqjx9+6tRHvD4mG96U5JWoUbIW4u38
         6/gfINox6lqlrpA9xNaOCBnMcba/rOKkvuVWWqdiHx13hrPCCBhfB+76mKs9ZKFeuaGF
         JMMpYQjkIlrBKJVhEJVsN3pL4QJ5MqrrR8v+4s11BwSX7m/JrScRkbxiqAaYPdBFleb1
         1TkOBVwrLcp6KkiTz99FZjROikwGooWrM92E06NlMzu4GF6zmFFWQMLSSlPlZ2SokVmj
         Yo1g==
X-Forwarded-Encrypted: i=1; AL+hErG1+ojDe8WqxOf/7YY8MHj90kLK+fR5PEaWWL4O179mamioFJdYI7XL9+5eWlTMhQXG8JkNuH2zNma0Iw31mbHc@lists.infradead.org
X-Gm-Message-State: APuU4Z8EmM/aBt7fV0uu7xIrX2cGth0NvDQfcucEyy8pF/VYDHB3ZWKS
	FvFo7f2FUO0n+Qv3XIXQ5KKECiJF79g06qOJmNo6I6G9ZMSk9OzAJxeM1E1UuYsmAyQ=
X-Gm-Gg: AZFdTZe5R+B+VGeMArHmrvvA4xgEc80oBiLRXEPp6pThxwu6jH7rs26i4a+7mkmf6XK
	eM9W7cYiAEFNsJRFFa/CvJ/mLg12q2tOfQPAqJtnwZ/nceEDG4uf2Ry8GyssFGteWCXRmVWOeLv
	TWTdNPCHM5TuGdB8vUr6tEVV6jBecuT+6bp1U1ToVecDt6rt9PoWnO5Z3Ba52L+au9zlN9vk9GP
	WDQjl6GoV3XS3vzjZbIvW7J01iw/PdB+IYaYgP7vfylGb34VhJtK2QyqK3V4JV0sVK0Xg4EqQI5
	1dEuZFJmxNK7iAYZv/Ky3b/uB9x1TIrgmosgkuQnjD3T87qtWJTEanp3mmfSYh4GdpMixJRS8NA
	nVubGMgVC+Px1e01ZrnUBvAkPx/ld+HS7l9amneeQWn+O1Rn6m23ub5LcWnG2PiRWyzrzUbdYf/
	8hceFA/ad4i9+fFMLxGyXyqswICrCoBPfWa/GYNqK0cGB9AIjOfiCNex1L3L0uAf/JfzZW1FL/r
	V7mWD5JWx/Q3AFWzymuD02lP3NzoSAFp7VqwtRL7vao05tOOyekrABNLDQ+im4cJdNYfEQagOX4
	BNVcnoo7DMnoODPZU4o=
X-Received: by 2002:a05:6000:25ca:b0:4ac:7595:6f67 with SMTP id ffacd0b85a97d-4ac7595721cmr27351070f8f.40.1795589799898;
        Tue, 24 Nov 2026 22:56:39 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm32730554f8f.28.2026.11.24.22.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:39 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:17 +0300
Subject: [PATCH v2 2/8] KVM: arm64: Reset SP_EL1, ELR_EL1 and SPSR_EL1 when
 resetting a vcpu
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-double_exception-v2-2-224689d8a764@pereq.eu>
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
X-CRM114-CacheID: sfid-20261124_225642_079472_078CEF01 
X-CRM114-Status: GOOD (  12.79  )
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

Resetting a vcpu keeps the old values of SP_EL1, ELR_EL1 and SPSR_EL1.
Commit e47c2055c68e ("KVM: arm64: Make struct kvm_regs userspace-only")
changed the reset to only clear the general purpose registers, SP, PC
and PSTATE, and later commits moved these three registers to the system
register array without a reset value.  Commit 85d703746154 ("KVM: arm64:
Fully zero the vcpu state on reset") fixed the FP registers and the
32-bit SPSRs the same commit missed, but not these three.

The impact is that the guest that boots next can read the previous
kernel's stack pointer and exception return address.  KVM_GET_ONE_REG
also returns the old values to userspace, and a rebooted VM doesn't
start in the same state as a new one.

Zero them in kvm_reset_vcpu().

Fixes: e47c2055c68e ("KVM: arm64: Make struct kvm_regs userspace-only")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/kvm/reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 26081d273408..9c1b42890c96 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -199,6 +199,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	/* Reset core registers */
 	kvm_reset_vcpu_core(vcpu);
+	__vcpu_assign_sys_reg(vcpu, SP_EL1, 0);
+	__vcpu_assign_sys_reg(vcpu, ELR_EL1, 0);
+	__vcpu_assign_sys_reg(vcpu, SPSR_EL1, 0);
 	vcpu->mmio_needed = false;
 
 	/* Reset system registers */

-- 
2.53.0


