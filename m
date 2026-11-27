Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147A5606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4B/4mRMe;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=UithgipW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=top+HnOpM+4RH0scm4jzna/HFUR/dd44kXQf3BTGLP4=; b=4B/4mRMeGiMICs
	h26FQjWFYjXEQgfUzwYwtpLiWsINQKSR7uguSjh/LkBqT8i1YDVC7+ApMmTGvTIwqLvq7d3JUNS/a
	3QRG1qXLlG9Z6/zoWXHYPSGVOiEXdZ0uldMaaQ2Nuhm03JiF8giN4MSxAoUp3Ol0hAuIB1iH7A23Q
	tuoizECECdicWi3LQ3C43BaAX//zy83Ct98B/3vtufyH7kOpTn6MmwYoJkzro4b8oc6nfQYhWRfcJ
	STgnTKRQ8MhNrlJA9qCLUbj529XpvCZjveQkpp6tJ5mOutj2FWi1avoWsaYAL9xvP6YvWV/Sy5IaT
	7sbP/jw+eI2Wdx1aAaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxva-0000000Gp2Y-1yvb;
	Fri, 27 Nov 2026 15:31:58 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxvW-0000000Gow3-041y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:31:57 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso3300018f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 07:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795793512; x=1796398312; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=top+HnOpM+4RH0scm4jzna/HFUR/dd44kXQf3BTGLP4=;
        b=UithgipWZZsOvJbo9ez1Lssc0M5qBfr+XVTXYeaFD66SE0ucONvQg9qj0OApIYPin/
         VIZZV5Ns4t+Oa3VIHxW/DHuAcNGJUEUUmdfbOvXUS+NQz5BOYrBtT1SARW0EFTKHr56w
         UmHbppM/ORG/WN1x6Aczvre0k/f/7RWdP7VaxBHqR9Vq6MBSZS2TZ021xTTRmid7L+Ea
         OKnAEgee2zAyRiXFmCY5DKx4TWxTsZntb7cL4aulmHKksb0NFKA6F9/aMFpvqDC/VsyP
         xvoSiNKGYooyT5Di9uutND9AWFGeNYAFQ6vOx/qm+xQGkRC8twDs+HL0JtZg8IOthpuV
         KFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793512; x=1796398312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=top+HnOpM+4RH0scm4jzna/HFUR/dd44kXQf3BTGLP4=;
        b=jsyNu/VX7RqMWkCDMW6xJQ/R+BzsANqzGzhA8RI50V4zQrykorQPSBTb5V7e46JxBG
         fd96koDEBnOwudNsPVvS7/soXz/w+pxF0eGiKFQUNQRAB0Ka1dIu/S7ZLUurstD4eaed
         87MVyjx2fP2AARrGUNvY0tjzD3W6CXNMPmDkNxyRQ+jvvAvFOcQJ6F8GPmn+4aUM5hza
         gYzz0Vtws053A64swCgBx0TxHy48R3VxkvsALfdfTWRn+gdt8TU40NvkpMspZMfoyUUa
         imbjmBaQ8teORWA1uEExuGOCTZ38KqYHNAGmIxJIfsz0y/aMPGXq9Qfdxp1bSv5nuC0w
         rkUA==
X-Forwarded-Encrypted: i=1; AL+hErGpjRz4V15ZoRAgd6cT6q9fv+F3EBzQLVYlSqNulFAyK8avf2OaKTEt5OJVGwt9Q85lMOlFjY8OHryOibKc5Rzc@lists.infradead.org
X-Gm-Message-State: APuU4Z+2Z2qKiIu8V61E+5dgzGhKfPvTlDIdBRjJC7bqDWCRjqm08uc0
	wpQA+8bBpclGVnFhstcgqN2vjCit5a0lqjVIBaEJGWK1pfDXDR5QVV7xXoJqzaDZuzc=
X-Gm-Gg: AZFdTZdJVagkmrlP+fPHGXSHfUn+GYtaj1eJFyPQpmwMQuPTAC2gsNIEsIhH3WSErJx
	dAkL+nKgSA8tCqTozzUAqZRC3HfHZ2B2zrbzMkEe3ypkyCz44vxggVJIXaHUe4F/VNz2rebsHfG
	er2ImegIZKKI78rH0DGesz1qzfifK+433kCw20LDYSyM91ut3CMBsPVwCl7QKIKqFcK0OnnnNs5
	RQw4/+UFfAJjHD5kaWnOlyD/IPTC31zJRmohMvGC22CEyXv6q6Bau1u84jxYZjxhONacizm7xtm
	itZwaRepwHVoJ8usYghrpqLzeuy7zazlRoFqfb/pBYJKeuFN/YdiVDKaC8dfN12b8afU08SwTj7
	y0mxlzb4tNwn4NNj2sGprvOMDnzVdn4OmqPlsn81IaRYqZmXN6beRgIct9TvqykzNO5kD7/Ri+B
	tFmwe+I1AXxcXDVvCrG+Ajp+BNAZzOwy3wemIP1gfQBpACz2FpyPTlnhsgh1YO7XlSbmLeAj8mr
	mrl+OSVqM+gIPplJVxofmB51y9M1C1fkmtPMGwPrtbp2yEeP0QwoVk5M1fwAP/6jxXIQdnthiMD
	Hy4nFdxOn/V8XP80KYc=
X-Received: by 2002:a05:6000:2681:b0:4a7:dcc2:a36f with SMTP id ffacd0b85a97d-4aa5a2dc7bfmr67515855f8f.26.1795793511060;
        Fri, 27 Nov 2026 07:31:51 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm54912096f8f.24.2026.11.27.07.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:31:50 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Fri, 27 Nov 2026 18:31:39 +0300
Subject: [PATCH 2/3] KVM: arm64: Load no-access permissions when S1PIE or
 S1POE is hidden
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-nv-tcr2-v3-v1-2-9c15c1cabe01@pereq.eu>
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
X-CRM114-CacheID: sfid-20261127_073154_139104_2BA9C6E7 
X-CRM114-Status: GOOD (  17.28  )
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

A VMM can offer FEAT_TCR2 to a guest but hide FEAT_S1PIE or FEAT_S1POE,
for example to keep the VM migratable.

But the complication is that the guest can still write to the PIE, POE
and E0POE bits in TCR2_EL1, and when those bits are set the CPU uses
the permission registers.  So the guest runs with the permissions that
another VM left in PIR_EL1, PIRE0_EL1 and POR_EL1, or with the VMM's
POR_EL0.  By checking which accesses fault, the guest can work out
another VM's permission settings.  This is a kind of small information
leak.

Currently, KVM doesn't save or load PIR_EL1, PIRE0_EL1, POR_EL1 and
POR_EL0 for a guest where S1PIE or S1POE is hidden.  After this patch,
KVM switches these registers whenever the CPU has the feature, even for
a guest that doesn't have it: PIR_EL1, PIRE0_EL1 and POR_EL1 when the
vcpu is loaded and put, and POR_EL0, which the VMM uses, on every guest
entry and exit.  For a guest that doesn't have the feature, KVM loads 0
instead of the guest's value.  A permission of 0 allows no access, so if
the guest sets PIE, POE or E0POE anyway, the accesses all fault and the
information leak is gone.

Fixes: 58627b722ee2 ("KVM: arm64: Make PIR{,E0}_EL1 UNDEF if S1PIE is not advertised to the guest")
Fixes: b86c9bea6349 ("KVM: arm64: Save/restore POE registers")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v3: Load no-access permissions instead of trapping TCR_EL1 and TCR2_EL1
    writes, as Marc suggested.  This also covers nested virtualization, so
    the follow-up patch for it is gone.
---
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 40 ++++++++++++++++++++++--------
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c         | 15 +++++++----
 2 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index 4a008c8a696b..ca9c2f6ae5da 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -17,6 +17,7 @@
 #include <asm/kvm_mmu.h>
 
 static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt);
+static inline u64 ctxt_s1poe_val(struct kvm_cpu_context *ctxt, u64 val);
 static inline bool ctxt_has_accdata(struct kvm_cpu_context *ctxt);
 
 static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
@@ -60,7 +61,7 @@ static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
 	*ctxt_mdscr_el1(ctxt)	= read_sysreg(mdscr_el1);
 
 	// POR_EL0 can affect uaccess, so must be saved/restored early.
-	if (ctxt_has_s1poe(ctxt))
+	if (system_supports_poe())
 		ctxt_sys_reg(ctxt, POR_EL0)	= read_sysreg_s(SYS_POR_EL0);
 }
 
@@ -117,6 +118,21 @@ static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt)
 	return kvm_has_s1poe(kern_hyp_va(vcpu->kvm));
 }
 
+/*
+ * A guest can turn on TCR2_EL1.PIE, POE or E0POE even when the feature is
+ * hidden from it.  Give it permissions of 0, which allow no access, instead
+ * of whatever another context left in the registers.
+ */
+static inline u64 ctxt_s1pie_val(struct kvm_cpu_context *ctxt, u64 val)
+{
+	return ctxt_is_guest(ctxt) && !ctxt_has_s1pie(ctxt) ? 0 : val;
+}
+
+static inline u64 ctxt_s1poe_val(struct kvm_cpu_context *ctxt, u64 val)
+{
+	return ctxt_is_guest(ctxt) && !ctxt_has_s1poe(ctxt) ? 0 : val;
+}
+
 static inline bool ctxt_has_ras(struct kvm_cpu_context *ctxt)
 {
 	struct kvm_vcpu *vcpu;
@@ -161,12 +177,12 @@ static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 	if (ctxt_has_tcrx(ctxt)) {
 		ctxt_sys_reg(ctxt, TCR2_EL1)	= read_sysreg_el1(SYS_TCR2);
 
-		if (ctxt_has_s1pie(ctxt)) {
+		if (cpus_have_final_cap(ARM64_HAS_S1PIE)) {
 			ctxt_sys_reg(ctxt, PIR_EL1)	= read_sysreg_el1(SYS_PIR);
 			ctxt_sys_reg(ctxt, PIRE0_EL1)	= read_sysreg_el1(SYS_PIRE0);
 		}
 
-		if (ctxt_has_s1poe(ctxt))
+		if (system_supports_poe())
 			ctxt_sys_reg(ctxt, POR_EL1)	= read_sysreg_el1(SYS_POR);
 	}
 	ctxt_sys_reg(ctxt, ESR_EL1)	= read_sysreg_el1(SYS_ESR);
@@ -222,8 +238,9 @@ static inline void __sysreg_restore_common_state(struct kvm_cpu_context *ctxt)
 	write_sysreg(*ctxt_mdscr_el1(ctxt),  mdscr_el1);
 
 	// POR_EL0 can affect uaccess, so must be saved/restored early.
-	if (ctxt_has_s1poe(ctxt))
-		write_sysreg_s(ctxt_sys_reg(ctxt, POR_EL0),	SYS_POR_EL0);
+	if (system_supports_poe())
+		write_sysreg_s(ctxt_s1poe_val(ctxt, ctxt_sys_reg(ctxt, POR_EL0)),
+			       SYS_POR_EL0);
 }
 
 static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
@@ -263,13 +280,16 @@ static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
 	if (ctxt_has_tcrx(ctxt)) {
 		write_sysreg_el1(ctxt_sys_reg(ctxt, TCR2_EL1),	SYS_TCR2);
 
-		if (ctxt_has_s1pie(ctxt)) {
-			write_sysreg_el1(ctxt_sys_reg(ctxt, PIR_EL1),	SYS_PIR);
-			write_sysreg_el1(ctxt_sys_reg(ctxt, PIRE0_EL1),	SYS_PIRE0);
+		if (cpus_have_final_cap(ARM64_HAS_S1PIE)) {
+			write_sysreg_el1(ctxt_s1pie_val(ctxt, ctxt_sys_reg(ctxt, PIR_EL1)),
+					 SYS_PIR);
+			write_sysreg_el1(ctxt_s1pie_val(ctxt, ctxt_sys_reg(ctxt, PIRE0_EL1)),
+					 SYS_PIRE0);
 		}
 
-		if (ctxt_has_s1poe(ctxt))
-			write_sysreg_el1(ctxt_sys_reg(ctxt, POR_EL1),	SYS_POR);
+		if (system_supports_poe())
+			write_sysreg_el1(ctxt_s1poe_val(ctxt, ctxt_sys_reg(ctxt, POR_EL1)),
+					 SYS_POR);
 	}
 	write_sysreg_el1(ctxt_sys_reg(ctxt, ESR_EL1),	SYS_ESR);
 	write_sysreg_el1(ctxt_sys_reg(ctxt, AFSR0_EL1),	SYS_AFSR0);
diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index 0c4ef1ce32ae..b06d85cb085a 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -133,15 +133,20 @@ static void __sysreg_restore_vel2_state(struct kvm_vcpu *vcpu)
 	}
 
 	if (ctxt_has_tcrx(&vcpu->arch.ctxt)) {
+		struct kvm_cpu_context *ctxt = &vcpu->arch.ctxt;
+
 		write_sysreg_el1(__vcpu_sys_reg(vcpu, TCR2_EL2), SYS_TCR2);
 
-		if (ctxt_has_s1pie(&vcpu->arch.ctxt)) {
-			write_sysreg_el1(__vcpu_sys_reg(vcpu, PIR_EL2), SYS_PIR);
-			write_sysreg_el1(__vcpu_sys_reg(vcpu, PIRE0_EL2), SYS_PIRE0);
+		if (cpus_have_final_cap(ARM64_HAS_S1PIE)) {
+			write_sysreg_el1(ctxt_s1pie_val(ctxt, __vcpu_sys_reg(vcpu, PIR_EL2)),
+					 SYS_PIR);
+			write_sysreg_el1(ctxt_s1pie_val(ctxt, __vcpu_sys_reg(vcpu, PIRE0_EL2)),
+					 SYS_PIRE0);
 		}
 
-		if (ctxt_has_s1poe(&vcpu->arch.ctxt))
-			write_sysreg_el1(__vcpu_sys_reg(vcpu, POR_EL2), SYS_POR);
+		if (system_supports_poe())
+			write_sysreg_el1(ctxt_s1poe_val(ctxt, __vcpu_sys_reg(vcpu, POR_EL2)),
+					 SYS_POR);
 	}
 
 	write_sysreg_el1(__vcpu_sys_reg(vcpu, ESR_EL2),		SYS_ESR);

-- 
2.53.0


