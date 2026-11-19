Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85506606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K/DoFi5x;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=FLyfNx2a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=urel1wTj62Q3r8nRWwBvs+QOOwLpwm3bPvBLzD6Q3KQ=; b=K/DoFi5x379Fub
	MEEv4ItRenkgvAsRRuZL5NdUdpIObxgGJq8ttWpcQ/AgFkt50szPTesP/b2xxVkvxXeGXIz0Q3qlp
	etDJU5+Cteda2MkG2qayeyTyQPXWL1w45ECQykNeom7f+DOotBM5uUuUb3LCim0QL06ZW9j6As2Al
	BTuMnQGskWd7WgUnnWA3gUGY4sBLiGb0CBuiZN7ayT4pCJR35oDTaWsGfzppdpmu8CMg6S8e+5Uxq
	KL509tyHko+U6hbG405ObEex0INfFOdP0VlXfuoeVQNUabH5iSpXFdt/snn8+TdN2bG8gNxPiBes0
	JWbZhgLCGCLJDEsDFDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU29W-0000000C1my-12mk;
	Thu, 19 Nov 2026 13:26:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU29N-0000000C1dP-0ULz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:26:06 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso30977225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 05:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795094763; x=1795699563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urel1wTj62Q3r8nRWwBvs+QOOwLpwm3bPvBLzD6Q3KQ=;
        b=FLyfNx2a1MhNh8EKAHi0du9NZy0oGp0TkVzvXj0vlnUaoBlLHB49Cx0J4vSfCvtW5m
         c2Myh8woGriEPIrLOBHVMLaHDig71XhHwFWh1PhsUVYsd0lsCGiilgcuOd2r0L+qx84w
         sH8jojoBvJElMhFUh5aaGZhrGNEoWpbPnXjpqfWUJB4OfpMflvmxBC5eo1RwQtYMEZfz
         GcGFX3TZfgYU4acaopPnq/XnkylRYbjt4p1Q52pcEa66KUtYhWQgt9EQFE165Yum9mtF
         V1RyClDp7FAWY1Ze3NR7yNnThgmvdHRzcXcwyEJFrXN1hNDF95Ds+hgKnpEtwVR6uYY8
         JMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094763; x=1795699563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urel1wTj62Q3r8nRWwBvs+QOOwLpwm3bPvBLzD6Q3KQ=;
        b=y4diTbPTYSOytIhwE2BC8FRS82uJvOVOF23++KMVPitf3yAdC/KCnzdhOEWP6aCV+z
         rwF92EB5zZ3tiPB8Rp//izvUBNTz49Gn1tDtoNZ2/Z/VrBFzgHC6KYWfXxpZO5w0xu1A
         oIyHzG0IERf4NSiJCDBSUWPV0PqdeXRvZlwFMVii4ohW3IO8/iIMWEQTjqojvpPG86Uf
         E/4fSQf+1x4GWwpx9bC+N9etKN9eLevUb1cvNr3OW2wvGRQJVempgT4SlzqG5avpFH4Y
         ielvRblKroIIVzhnVCDVxgA9bPdiaG7dYi41MGQjg65hgUJAE0XvH3gJiL7LbTKR3EKg
         XReQ==
X-Gm-Message-State: APuU4Z//AJFmBvZZ5j5Il8YGYi7hIUfkUIHD035bXdzKUlR+dGvA9cpB
	3sQwR/6Vokg6C+xV0BqSOc8qC//OHDOOrOmfl07hZI7rLZ/webZ3kjv+JiuJnAP6MfI=
X-Gm-Gg: AYBFou3H8G2PuA4RcjLZgawW5hewpna/Pby3hiDZbbsbQmWaDlg8+3Dc6BkMODkSHON
	eeYjoRG/Z0krijWCSMFf67n1/bwqAp+0aRtQuHd0nb5CZdlk67RDPPNcbK7EOK1Ty7/GXJTXQhO
	b8howUxpe5VPYLfqPOTAdI4738jfu8kVTX6z/QanbHYHztmAk1ewkhLXCy+xqGTcqNrroasfJpo
	745e7Q43F4IusrVDVOemy3WlW9q93s83GqDSGbM7QGitp0eJhScFz37MU2SVk0iiHlv9nBwf01t
	G8WkApQipmtSGAfvE7DQlMAt0NXRYtLg19otyEb+RWrxaXGyLSbUWaQ9D8HPFJ6QfMH9nGuoHzm
	8Jo4KKUERoFfoEyR829LpqxkrpC6PmUH6xsoBgR4c/ka/Gm3EIf4DE+kPO0auh7HzyWzh/wdPhD
	3+UZ3aPAfhHhZceV9ClFddA0JCPQZwN+5QhxopSZ+TO0fxQ8/5wn4sUYL7xh61CIu5kGxbll1hu
	uXPFDCBXrpA7WaW0LTQZ/1dDxuY0JCFLnVh2G/2zk6GQDPcQsZkmgZQG8RWwZkBzgepJEEaC+AD
	4lR/Hvppi7TSwObu2UI=
X-Received: by 2002:a05:600c:1f82:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb7da4f53fmr121279865e9.26.1795094762119;
        Thu, 19 Nov 2026 05:26:02 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e051desm28697975e9.1.2026.11.19.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:26:01 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Thu, 19 Nov 2026 16:25:34 +0300
Subject: [PATCH v2 1/4] KVM: arm64: nv: Fix AT emulation for TCR2_EL1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-nv-tcr2-v2-1-3deb1a6cdba8@pereq.eu>
References: <20261119-nv-tcr2-v2-0-3deb1a6cdba8@pereq.eu>
In-Reply-To: <20261119-nv-tcr2-v2-0-3deb1a6cdba8@pereq.eu>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jintack Lim <jintack.lim@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_052605_306806_96AE9D2D 
X-CRM114-Status: GOOD (  27.30  )
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
the MMU would and returns the result.  There is a bug in the way this
instruction is emulated for nested virtualization because of how TCR2_EL1
is handled.  The bug is fairly minor.

The TCR2_EL1 register has bits which turn on permission indirection
(PIE) and permission overlays (POE).  When these bits are set, the AT
instruction reads the permissions stored in PIR_EL1 and POR_EL1.  If
you have the right features and permissions then in the return value from
the AT instruction we set one bit to either 1 or 0 depending on whether
the access would be allowed or whether it would fault.

However, the bug is that just because the host has TCR2 enabled, it
doesn't mean the VM has it.  In the current code KVM doesn't load these
registers for a VM which doesn't have the features, instead the AT runs
with the host's HCRX_EL2, which has TCR2En set.  So the AT uses the
TCR2_EL1, PIR_EL1 and POR_EL1 values another VM left on the CPU, or
possibly the VMM's POR_EL0.  Likewise, for a VM which has TCR2 but not
PIE or POE, the L2's TCR2_EL1 is loaded unmasked.

The impact of this bug is that we leak a single bit of data to the L1,
but in real life it's hard to imagine how it is useful to an attacker.

Fix this by clearing the PIE and POE bits in effective_tcr2() when the
VM doesn't have those features, and use it for the L2's TCR2_EL1.  When
the AT runs on the guest hypervisor's own registers, in __kvm_at_s1e2()
and in __kvm_at_s1e01_fast(), load the guest's TCR2_EL2 for the AT and
restore the live value afterwards.

Fixes: 477e89cabb14 ("KVM: arm64: nv: Add basic emulation of AT S1E{0,1}{R,W}")
Fixes: 23e7a34c8397 ("KVM: arm64: Add AT fast-path support for S1PIE")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: Restore original TCR2 values at the end of the AT command
    Cleanup the code based on Marc's review.
    Add some comments
---
 arch/arm64/kvm/at.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 30d8f062b2c2..9dfabd0586e2 100644
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
@@ -1384,6 +1391,24 @@ static int handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr, u64 *par)
 	return 0;
 }
 
+/*
+ * TCR2 features are always exposed to the guests.  Clear the ones
+ * which are not exposed on this VM.  Return the original TCR2 so we
+ * can restore it after running the AT command.
+ */
+static u64 load_guest_tcr2(struct kvm_vcpu *vcpu)
+{
+	u64 orig = read_sysreg_el1(SYS_TCR2);
+
+	/*
+	 * This relies on the reset value of TCR2_EL2 being 0, and not
+	 * being modified when FEAT_TCR2 is not exposed to the guest.
+	 */
+	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR2_EL2), SYS_TCR2);
+
+	return orig;
+}
+
 /*
  * Return the PAR_EL1 value as the result of a valid translation.
  *
@@ -1397,7 +1422,9 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 {
 	struct mmu_config config;
 	struct kvm_s2_mmu *mmu;
+	bool swap_tcr2 = false;
 	bool fail, mmu_cs;
+	u64 orig_tcr2;
 	u64 par;
 
 	par = SYS_PAR_EL1_F;
@@ -1438,7 +1465,7 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR_EL1),	SYS_TCR);
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, MAIR_EL1),	SYS_MAIR);
 	if (kvm_has_tcr2(vcpu->kvm)) {
-		write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR2_EL1), SYS_TCR2);
+		write_sysreg_el1(effective_tcr2(vcpu, TR_EL10), SYS_TCR2);
 		if (kvm_has_s1pie(vcpu->kvm)) {
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIR_EL1), SYS_PIR);
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIRE0_EL1), SYS_PIRE0);
@@ -1452,6 +1479,12 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	__load_stage2(mmu);
 
 skip_mmu_switch:
+	if (!mmu_cs && vcpu_has_nv(vcpu) &&
+	    cpus_have_final_cap(ARM64_HAS_TCR2)) {
+		swap_tcr2 = true;
+		orig_tcr2 = load_guest_tcr2(vcpu);
+	}
+
 	/* Temporarily switch back to guest context */
 	write_sysreg_hcr(vcpu->arch.hcr_el2);
 	isb();
@@ -1485,6 +1518,9 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	if (!fail)
 		par = read_sysreg_par();
 
+	if (swap_tcr2)
+		write_sysreg_el1(orig_tcr2, SYS_TCR2);
+
 	write_sysreg_hcr(HCR_HOST_VHE_FLAGS);
 
 	if (mmu_cs)
@@ -1544,7 +1580,7 @@ int __kvm_at_s1e2(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	 * switching context behind everybody's back, disable interrupts...
 	 */
 	scoped_guard(write_lock_irqsave, &vcpu->kvm->mmu_lock) {
-		u64 val, hcr;
+		u64 val, hcr, orig_tcr2;
 		bool fail;
 
 		val = hcr = read_sysreg(hcr_el2);
@@ -1554,6 +1590,9 @@ int __kvm_at_s1e2(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 		if (!vcpu_el2_e2h_is_set(vcpu))
 			val |= HCR_EL2_NV | HCR_EL2_NV1;
 
+		if (cpus_have_final_cap(ARM64_HAS_TCR2))
+			orig_tcr2 = load_guest_tcr2(vcpu);
+
 		write_sysreg_hcr(val);
 		isb();
 
@@ -1577,6 +1616,9 @@ int __kvm_at_s1e2(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
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


