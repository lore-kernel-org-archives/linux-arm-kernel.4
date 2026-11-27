Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5027F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e3qHVCpN;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=NkK6zXSe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=psEWMDtbK/VEnWlI7cGkj3njVmGtbz4cdV2wNJVv0u4=; b=e3qHVCpN5khLXQ
	jR3lHfQCIg6H2UrvLUEEBvax/WNsDZjKpDqKy2ovPFfl0iPXu9uiTVZxu6lF0cLGupeWwe+oUVhwh
	2aJyif2K2LTzqqbTO9mK3hyag6mWIi7TE2NEt4ZWFG697hAuJV2DaoHjCc3drRxgMGTAj+Zp5h1n9
	FKGtD8YbTWinby9WqwjdPByw+UoTgnLtrUEfvOjl824LEiuvthc15rQlxwFgMRbwpPfCBA/1yYIYu
	CwdSGejB70QPLAMdzxFF7tIXcp2YkqDuK8vsHLGo9dve6DOnCiwOqIB+CBJ35SD1x/9ZqURdEVQWY
	CMXer/Jvf2lLYA2pdlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxva-0000000Gp29-0Ztp;
	Fri, 27 Nov 2026 15:31:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxvS-0000000Gorw-0zOB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:31:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso75529745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 07:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795793508; x=1796398308; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psEWMDtbK/VEnWlI7cGkj3njVmGtbz4cdV2wNJVv0u4=;
        b=NkK6zXSeu8z+cmtPbxFYdXkyl6p7xWw3vYNyNls4ApY8VHRgLimMgqqshwbV8jCGdd
         gfhEk6EJHVZlxjidRYNvFYsbz5prHc1xlqQuRJ8ISgVYalX6QPGm6JzfSqnOI+hk7gnE
         pp8gSkCqZHWgx8DbhjYqKGALDca1TcQX77i4C/QFFVSUVwSlYvLbvZoSY8VNpNa0f4rA
         F4q/vuKbjRLVQpILlvs4hpMF60eQ36Z8wv0+RDoB/edBPuYyKIwbfX/vTpiP1fjKDT/W
         bb0fJwBWUIfHPZY/rwRRmeTEY7nXTNNhR7HOweKIeoHiVeZJwpVL8/0hQQNF396iVlGp
         1z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793508; x=1796398308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psEWMDtbK/VEnWlI7cGkj3njVmGtbz4cdV2wNJVv0u4=;
        b=HlMdWQyh7gVvlOGV81HPLezL+XTpw0wlS3fE1ltrURra2bLZa0G1i8BFabwNL9Icp1
         g80ubjasYlMzGzHzPv+SaEAZZd9zTBYQtBpqJ84S40cK3i5dIdjYTA5gI4TOKIa8WZM9
         OIRkVT+xCviwxzbex8H+RTWUMlAiUr7StoZ9G5+NksHaWsJzZcF+CykoNzUpr5VtvqE7
         nIObrhor25AObxCvuZFJO27kB3HjN9wELn1G7YLgymHiK7/IHHS84jN4npsPaETAvVYd
         wBBusdQAPiifea7eh5GyGvrj99h7teugNElfjbtzO5CDxw3dS8WDROigQjM5bB/ulVDC
         2lAw==
X-Forwarded-Encrypted: i=1; AL+hErH2h0cRJtcm3zHWk4jMY5cwePKF24DP6PANNHG1oL9wcm+sIMX/uWnOKVXBBwa7Z60+9zLuaXTXuHT7B7WbJHGz@lists.infradead.org
X-Gm-Message-State: APuU4Z8qkdK2uf4sQgJeDUjvOAxblQo931eV7fXFUHabGK5KMdAuJyWF
	PSjUCYnI9od5zoEF+Ng/hybXXMSY4UdNQ3qCLCYfwCIMWGMGiqqiWvfqsTm3KHLgQz4=
X-Gm-Gg: AZFdTZe1BA8iwwWA1RaUVMLDD17e7ByO+TMnwDHn5CpVCrnNEBvFR5QJO2M1FyGYzpE
	ttSkvSc6F7HGvVSfKSsdgmwPtoiisOkVcbn0u55vQdNUX8i6cpv4vCjCunxJ6oy6rR1dWP7p86s
	FG4ucRS2BhtjVKC073kmWp9PpfxFQlOTpb77kkTpdrh3V0cv4W//KeUftNJd1Jc2MZBjNuD01na
	EHl9HDwNBH5Qcu/nMu3JiNkkknxXzdrkGefpSVYWOObTiUqzGBYCawZ7ekJkMtdABrLUpTrC/Cs
	7kaAYr9LvyNhrq+0a4R6Z8vun1tq9Unu1c5gPYmEGNRxlwRsg/kx7pVXOlM4qeKtDtPO6AX7iqO
	jyANEoYzqc9yK41knyyrhgx/bQhCkpReLgIk/fJoKHLzJok6G2GuCro6dhUM+YUpW8OitP1D//X
	7GJXbCBIJnc6BXDsXGkGCVCWyX2slCtFSbMSredObHoLe4GrJvQEu3k7ORPOY5uRihpnTurnf+7
	xQTmhHOBoDIyKRf10+MhX3xRVTTWsAeNeOarSam2gaSI7Z/oDYZbcI3JaQqZtwwqDT5kmbFTvAm
	hL5xCjAXYSfxF4zMmnc=
X-Received: by 2002:a05:600c:64c9:b0:4bb:8701:bb14 with SMTP id 5b1f17b1804b1-4bb88804d1cmr535797655e9.5.1795793508061;
        Fri, 27 Nov 2026 07:31:48 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bbab390cf5sm217781495e9.7.2026.11.27.07.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:31:47 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Fri, 27 Nov 2026 18:31:38 +0300
Subject: [PATCH 1/3] KVM: arm64: nv: Fix AT emulation for TCR2_EL1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-nv-tcr2-v3-v1-1-9c15c1cabe01@pereq.eu>
References: <20261127-nv-tcr2-v3-v1-0-9c15c1cabe01@pereq.eu>
In-Reply-To: <20261127-nv-tcr2-v3-v1-0-9c15c1cabe01@pereq.eu>
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
 Dan Carpenter <dan@pereq.eu>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073151_426381_A32C4F93 
X-CRM114-Status: GOOD (  27.68  )
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

Arm provides an AT instruction that translates a virtual address the way
the MMU would and returns the result.  We emulate this instruction by
setting up the state and calling the actual AT instruction.  There is a
bug in how the TCR2_EL1 permission bits are handled.

The TCR2_EL1 register has bits which turn on permission indirection (PIE)
and permission overlays (POE).  When these bits are set, the AT
instruction reads the permissions stored in permission registers PIR_EL1,
PIRE0_EL1, POR_EL1 and POR_EL0.  If you have the right features and
permissions then the return value from the AT instruction has bit that is
0 if the access is allowed or 1 if it would fault.

The bug is that the current code assumes that if the VM doesn't have
the feature then the host doesn't have it either, and isn't necessarily
true.  The host can have the features but disable them for a guest.  The
way the current code is written, if the VM doesn't have the features then
KVM doesn't bother to load the TCR2_EL1 or the permission registers, but
uses whatever was left there previously.

The impact of this information leak is very small.  It's hard to imagine
how knowing someone else's permission bits is useful to an attacker.
Claude suggests that potentially two guests could set up a secret
back channel where they communicate by flipping their permissions on and
off.  :)

Fix this by clearing the PIE and POE bits in effective_tcr2() when the
VM doesn't have those features, and load the result into TCR2_EL1
whenever the CPU has TCR2, not only when the VM has it.

When the AT runs on the guest hypervisor's own registers, in
__kvm_at_s1e2() and __kvm_at_s1e01_fast(), use the new load_guest_tcr2()
function to load the guest's TCR2_EL2 for the AT and restore the
original value afterwards.  If the VM doesn't have the PIE and POE
features, those bits of TCR2_EL2 are RES0 because
kvm_vcpu_apply_reg_masks() clears them.

There is a closely related bug in __kvm_at_s1e01_fast().  Here the issue
is that KVM is performing an AT command for a guest hypervisor but the
POR_EL0 isn't loaded, so we use the VMM's.  This bug is triggered when
the guest hypervisor runs with HCR_EL2.{E2H,TGE} = {1,1}.  Fix this by
loading the guest's POR_EL0 before the AT and restoring the VMM's value
afterwards.

Fixes: 477e89cabb14 ("KVM: arm64: nv: Add basic emulation of AT S1E{0,1}{R,W}")
Fixes: 23e7a34c8397 ("KVM: arm64: Add AT fast-path support for S1PIE")
Fixes: 846c993df982 ("KVM: arm64: Add POE save/restore for AT emulation fast-path")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v3: Re-write commit message
    Add a new fix for the guest's POR_EL0 when HCR_EL2.{E2H,TGE} = {1,1}
    and add a new Fixes tag for that.

    Btw, Marc the zeros in the load_guest_tcr2() don't come from the
    reset value, they're actually set in tcr2_el2_feat_map[] so that
    should re-assure you.  :)  Update that comment.

v2: Restore the original TCR2 at the end as pointed out by Sashiko.
    Cleanup the code based on Marc's review.
    Clear the guest's TCR2 in effective_tcr2().
---
 arch/arm64/kvm/at.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 30d8f062b2c2..893bf88f2f75 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -91,11 +91,18 @@ static enum trans_regime compute_translation_regime(struct kvm_vcpu *vcpu, u32 o
 static u64 effective_tcr2(struct kvm_vcpu *vcpu, enum trans_regime regime)
 {
 	if (regime == TR_EL10) {
+		u64 val;
+
 		if (vcpu_has_nv(vcpu) &&
 		    !(__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En))
 			return 0;
 
-		return vcpu_read_sys_reg(vcpu, TCR2_EL1);
+		val = vcpu_read_sys_reg(vcpu, TCR2_EL1);
+		if (!kvm_has_s1pie(vcpu->kvm))
+			val &= ~TCR2_EL1_PIE;
+		if (!kvm_has_s1poe(vcpu->kvm))
+			val &= ~(TCR2_EL1_POE | TCR2_EL1_E0POE);
+		return val;
 	}
 
 	return vcpu_read_sys_reg(vcpu, TCR2_EL2);
@@ -1384,6 +1391,23 @@ static int handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr, u64 *par)
 	return 0;
 }
 
+/*
+ * Load the guest's TCR2_EL2 and return the original TCR2 so we can restore
+ * it after running the AT command.
+ */
+static u64 load_guest_tcr2(struct kvm_vcpu *vcpu)
+{
+	u64 orig = read_sysreg_el1(SYS_TCR2);
+
+	/*
+	 * TCR2 features are not always exposed to the guests.  If they
+	 * aren't exposed then the bits are RES0.
+	 */
+	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR2_EL2), SYS_TCR2);
+
+	return orig;
+}
+
 /*
  * Return the PAR_EL1 value as the result of a valid translation.
  *
@@ -1397,7 +1421,9 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 {
 	struct mmu_config config;
 	struct kvm_s2_mmu *mmu;
+	bool swap_tcr2 = false, swap_por_el0 = false;
 	bool fail, mmu_cs;
+	u64 orig_tcr2, orig_por_el0;
 	u64 par;
 
 	par = SYS_PAR_EL1_F;
@@ -1437,8 +1463,9 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TTBR1_EL1),	SYS_TTBR1);
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR_EL1),	SYS_TCR);
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, MAIR_EL1),	SYS_MAIR);
+	if (cpus_have_final_cap(ARM64_HAS_TCR2))
+		write_sysreg_el1(effective_tcr2(vcpu, TR_EL10), SYS_TCR2);
 	if (kvm_has_tcr2(vcpu->kvm)) {
-		write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR2_EL1), SYS_TCR2);
 		if (kvm_has_s1pie(vcpu->kvm)) {
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIR_EL1), SYS_PIR);
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIRE0_EL1), SYS_PIRE0);
@@ -1452,6 +1479,17 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	__load_stage2(mmu);
 
 skip_mmu_switch:
+	if (!mmu_cs && vcpu_has_nv(vcpu) &&
+	    cpus_have_final_cap(ARM64_HAS_TCR2)) {
+		swap_tcr2 = true;
+		orig_tcr2 = load_guest_tcr2(vcpu);
+	}
+	if (!mmu_cs && vcpu_has_nv(vcpu) && kvm_has_s1poe(vcpu->kvm)) {
+		swap_por_el0 = true;
+		orig_por_el0 = read_sysreg_s(SYS_POR_EL0);
+		write_sysreg_s(vcpu_read_sys_reg(vcpu, POR_EL0), SYS_POR_EL0);
+	}
+
 	/* Temporarily switch back to guest context */
 	write_sysreg_hcr(vcpu->arch.hcr_el2);
 	isb();
@@ -1485,6 +1523,11 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	if (!fail)
 		par = read_sysreg_par();
 
+	if (swap_tcr2)
+		write_sysreg_el1(orig_tcr2, SYS_TCR2);
+	if (swap_por_el0)
+		write_sysreg_s(orig_por_el0, SYS_POR_EL0);
+
 	write_sysreg_hcr(HCR_HOST_VHE_FLAGS);
 
 	if (mmu_cs)
@@ -1544,7 +1587,7 @@ int __kvm_at_s1e2(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	 * switching context behind everybody's back, disable interrupts...
 	 */
 	scoped_guard(write_lock_irqsave, &vcpu->kvm->mmu_lock) {
-		u64 val, hcr;
+		u64 val, hcr, orig_tcr2;
 		bool fail;
 
 		val = hcr = read_sysreg(hcr_el2);
@@ -1554,6 +1597,9 @@ int __kvm_at_s1e2(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 		if (!vcpu_el2_e2h_is_set(vcpu))
 			val |= HCR_EL2_NV | HCR_EL2_NV1;
 
+		if (cpus_have_final_cap(ARM64_HAS_TCR2))
+			orig_tcr2 = load_guest_tcr2(vcpu);
+
 		write_sysreg_hcr(val);
 		isb();
 
@@ -1577,6 +1623,9 @@ int __kvm_at_s1e2(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 		if (!fail)
 			par = read_sysreg_par();
 
+		if (cpus_have_final_cap(ARM64_HAS_TCR2))
+			write_sysreg_el1(orig_tcr2, SYS_TCR2);
+
 		write_sysreg_hcr(hcr);
 		isb();
 	}

-- 
2.53.0


