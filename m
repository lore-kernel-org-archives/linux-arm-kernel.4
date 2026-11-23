Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3DD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wx1tCGAW;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=c2EjCvnm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xXoaW7puZQVXtPvVEP8J871ckV5Jm7nnXRP/lyhSBaM=; b=Wx1tCGAWEjwvP5HSQyXPTOhEIV
	2N3/j48Fze40dX3KlB6cR+GDLLXMVzzFIerdYWTUnd3nkBbHLiD5bd5XWPST/JAhaPgvvWPiclc7K
	nCnCLGMRPsU8UnaJ/FwFt6Zhi1jUIVEGUfESIQPkzatjRmjl41pl8cUADkmVhz5/SIWutUGmt8U8T
	XHFFdYBZF2zSpQZ5ckxGzjrRXoc/ekGU1oglsvZ1jvWA1mnUr+AYKrKIYUK3TepopbHErtqSRnP53
	xaRXgqfX/BJg5FVrjJLh+I0WGAxtbo1/FhZn+SZxRIbUqPAa6s9ZQHAqZDR4WvE73GCJvl7wwUqgt
	N+WtSV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQed-00000002okc-18nl;
	Mon, 23 Nov 2026 09:48:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQeY-00000002oia-0tZ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:48:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4a32576da88so1734158f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795427280; x=1796032080; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xXoaW7puZQVXtPvVEP8J871ckV5Jm7nnXRP/lyhSBaM=;
        b=c2EjCvnmlMsGPG2Yobt6bt5JiudKsfjMKEJvMpqkpaVhvcnSp+qDl4wF1N58sxRMVV
         y/ZSwIb6uZCvdkKTECJl/8kFFVQzpaSmiuU0zYWizGDJGnvx7ypGUseT+cwwmSACqmE3
         L9FnA6dJw2J3A1twBMxHYEGrsj4K5qiHLMPP3EqOurdVPagl5a9Z3tVUjMvmVAs5pAJ+
         lTudkpIJ23tJoJU6lxw4mdsBFKBol2HBJQ+ZIVs7egiBXXDEATYOqm6f0wagNV0gS6DZ
         /Ghc+Ulpbl8veQ0Bs8pLoLshgVZNrLjQsrDS0b6er3ucfyI4uvG0/OPOeUMgsQ4gjSgA
         aSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427280; x=1796032080;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xXoaW7puZQVXtPvVEP8J871ckV5Jm7nnXRP/lyhSBaM=;
        b=MXaWL9DDaOaMlNwQtnuxMbEiU5QG/or70UPLiRePd/dbz/vSEgmgFQ8v4uB9ExFQKB
         G0t4ZF7fKUiIFv5z1b1iY9kxKr3pJOyIw4mu8ZBZcmx/O7eQ6qkpsO6sgDI0J+ZbA0E4
         ySTNjBIhpYMDCkWKvLNg/XdQjtefhwyH91eWeCiccBO9EWIiShIPpzP560/zPwSXfa9f
         2qAYdscwTrfcA5s2k6eI+LxR5kFqc25AJwHYM5r8PBQZI/lkvgsrH3IwWcm0OGN5YEQ5
         b+QoibjdRVKdyBWlYbluH0GZ8N+8AAs9qtToXaGYMqQQF5Sbb72Cnaa0CXp95hJA0fxG
         zLBw==
X-Forwarded-Encrypted: i=1; AL+hErGdjDDmSnHcYlcRBzGaUsrzj0yZN38IQ4BHS3JqLmzZQzeikMqRu1HHeQNNS/7XhCaJKbFz+73zvIof941E3Yq4@lists.infradead.org
X-Gm-Message-State: APuU4Z/AWXaiiatgdKaozX44WX4hUpqq+zJL98rB+r3Rp1TuhGGNQz9p
	ZocEz/goaTEsU/npvtDPUoGugm/DzkJT8f5LOQ2x5HcfSSKcXVDkUwVJLNEuxkcigok=
X-Gm-Gg: AZFdTZfIj3jG3581tU5Eyxdm/d5aaiLD+ZJ8Q2L0P1NvREm3eu5NExdEop6i78TzBV2
	SodAdDT5Pw6sqHYA/Ca79kUkVJxhNwTngBIb5IdzE/NQGTW+/1OsPF33i7KMpnhY9OqsFlxIhfr
	6vmYynfj9BO4bjWbSQ8a81lxXiCzHcwVVtqxAhipeIND/BH93ufAL7j3yw0CaLQ40YpFYgztuiT
	0QKL7wlKOQj5reSt8CDz25XgD4P4UW1GO3kFLRyiCg94GdW/cz24LWJ9f3EOeiOBvxuKgq5BcDg
	datJZZ5Nf0k0ddNCy61gGcTvUME4lztb/CPff+8TCSNJH5DgUZVWETl2ngaBXJ1FT2Q9QsGtMys
	Rbn8nUT0SYD1Vi6tXzbzU4oAtQsHEqJ/rp0O5ElY1IOtRruzQUEM+sL2NWoSs7MgsaiIcQcXULn
	qWOv83akIJnswF3oUqsgWQCpen+YlRQlYQ84O0CAxOPSbWcHL/HodFr1yrjI9VlERrsWiRG9xah
	LhbT1DIn/sMdg7M6lOIIaO1leI8GYAjR3VoC4v9ro2KExnM18jbgIAvQUBApTR88YlsSomAsgC4
	3NIjvlNfd2KzfVGoI4JR
X-Received: by 2002:a05:6000:26c1:b0:4b3:b495:d5ad with SMTP id ffacd0b85a97d-4b3b495d6efmr3113266f8f.23.1795427279778;
        Mon, 23 Nov 2026 01:47:59 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm17295126f8f.35.2026.11.23.01.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:47:59 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Mon, 23 Nov 2026 12:47:42 +0300
Subject: [PATCH] KVM: arm64: nv: Reset MMIO state when committing a nested
 exception
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-stale_mmio-v1-1-73f9c67a1bb0@pereq.eu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02MTQqDMBBGryKzbsAkNEKvUkqZxKmO1FgyKoJ4d
 5N20+X7ft4OQolJ4FbtkGhl4Slm0JcKQo+xI8VtZjC1cVqbWsmMb3qOI08KrUXXNNZ6d4V8+CR
 68faV3R8/lsUPFOZiKAuPQsonjKEv0Z+rNHAcJ++xAeuQAAAA
X-Change-ID: 20261120-stale_mmio-a33a67733b65
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
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
 Dan Carpenter <dan@pereq.eu>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014802_295885_F35D1385 
X-CRM114-Status: GOOD (  14.07  )
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

KVM has two ways to commit a pending exception, commit_pending_events()
which also resets the MMIO emulation state, and a direct call to
__kvm_adjust_pc() which doesn't.  The EL1 to EL2 path in
kvm_inject_nested() uses __kvm_adjust_pc(), but it needs to use
commit_pending_events() instead.

The scenario is: the vcpu exits to userspace for an MMIO access and
userspace then injects a synchronous external abort or an SError using
the KVM_SET_VCPU_EVENTS ioctl.  If the vcpu is in L2 context and L1 has
asked for the exception, then kvm_inject_nested() enters the exception
straight away and vcpu->mmio_needed stays set.  On the next KVM_RUN,
kvm_handle_mmio_return() completes the access in L1's context so it
skips the first instruction of L1's exception vector and writes the
MMIO data to one of L1's registers.

Replace the __kvm_adjust_pc() with commit_pending_events() so that the
MMIO emulation state is cleared.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-221074@kernel.org/
Fixes: 9aba641b9ec2 ("KVM: arm64: nv: Respect exception routing rules for SEAs")
Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/include/asm/kvm_host.h | 1 +
 arch/arm64/kvm/emulate-nested.c   | 2 +-
 arch/arm64/kvm/guest.c            | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 0614c3b3a40d..c75b0c623824 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1354,6 +1354,7 @@ int __kvm_arm_vcpu_get_events(struct kvm_vcpu *vcpu,
 
 int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 			      struct kvm_vcpu_events *events);
+void commit_pending_events(struct kvm_vcpu *vcpu);
 
 void kvm_arm_halt_guest(struct kvm *kvm);
 void kvm_arm_resume_guest(struct kvm *kvm);
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 39136a89d74b..5a7019bb719b 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2921,7 +2921,7 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	 * Make sure the exception actually took place before we load
 	 * the new context.
 	 */
-	__kvm_adjust_pc(vcpu);
+	commit_pending_events(vcpu);
 
 	kvm_arch_vcpu_load(vcpu, smp_processor_id());
 	vcpu_clear_flag(vcpu, IN_NESTED_EXCEPTION);
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index ba4570c52a91..b7d36c2abfdf 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -770,7 +770,7 @@ int __kvm_arm_vcpu_get_events(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
-static void commit_pending_events(struct kvm_vcpu *vcpu)
+void commit_pending_events(struct kvm_vcpu *vcpu)
 {
 	if (!vcpu_get_flag(vcpu, PENDING_EXCEPTION))
 		return;

---
base-commit: 5a7235e9adff42aa043ac9473dbeb0354dca0967
change-id: 20261120-stale_mmio-a33a67733b65

Best regards,
--  
Dan Carpenter <dan@pereq.eu>


