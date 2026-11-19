Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C372C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=06h4FW+D;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=QGLRop1U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ntk4mAK9p6PJOEu3vzXljUNzscjCYNCzCNuBX536B0c=; b=06h4FW+DwdCzTn
	32jJsXQ+0pkx3udlXNkw6cPUyuZxAQpCkuKi+b3Muq88hJk6aArJe0uctBmgK8sYxN4AdopEucNH/
	zGmmi2KVthS/96W8yHhtnBXrIdC/0hglf9Y6p92dgTsaTC3Vs2gTaCR0ncLXjJ+KJ/cT4deRCy6L2
	etpKMf772Hi2HjWRHD9qg4eCpAS5vojh1AR+0xG/nRIWvs3P9X3nDCf9L04iFuxq3WP5jThoyhhsR
	o4gRGl1y2rZ/vkTuk6To+qIC7wjIj1LV/ZbaY1IMdxYOhKpaXvWTIkrwAgxnIFHFiDBVdE8ZXFiAE
	9fj5FouaBBrBhnIdRLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU29d-0000000C1ri-0St7;
	Thu, 19 Nov 2026 13:26:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU29S-0000000C1jI-2plQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:26:12 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-49a92144733so1071613f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 05:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795094768; x=1795699568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntk4mAK9p6PJOEu3vzXljUNzscjCYNCzCNuBX536B0c=;
        b=QGLRop1UvI9pwERCNeR/YK+slk+BVvacoEpodPDZ1qyCNwDDTCpBlx9L6MFz9Hs9DS
         pQsIq0+3qsKAGSyNjNMDkjiF/Gkm+sX3XeRpHxS8VLwECqIllKz1Zr4YVUG0K2dSebt9
         MPbwkvXsKg1sXX8UTxEenZtlyx/aY+KINx4JQgiSbVROVlXYZhIU6hrDVWYYwyd0gbJN
         NZORVgJOT6ydamlGAMdM/5HCl7DK6oZ00r16jhwUPEG2f2F3SGrEy2254pCaIFWwpeQh
         /xkLQVTPK3y7vReBm0A6yQ6jSsFvatgbEy7meSrqWlFMzIq5QaXlGt14yMDSngSaF9PU
         pVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094768; x=1795699568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntk4mAK9p6PJOEu3vzXljUNzscjCYNCzCNuBX536B0c=;
        b=ocWzBF/bB61IJNFgl8XM1ZIYz39EcmmbPydJDMqTeK3utdbLKV5mYR5Xjb3eJmXOVC
         BvqNELK3DKoxtaX16kxEKWJ0wih8YmP2qNQIA8XLsgc2Fqbo+BvbZhooYBqWOVyQs3/R
         9JmFIHhqNnaSozTS51ZbHxqrU0XtZPEstvDwmI/QibruloGZlOLWA1guIu4wOP3icLIT
         hfxtfHfzJu9y3gcW88neiypS9pIel/maYrzjAxll2NvjYM8WaRVFxlTMOp4/QvPQgU54
         CsKniR81lOBmeeqJY3dqWRJLSbpf1DAXjJIrQ/oeGGnDu+TUvoJ7oqD6R+2Dbg2mOI8x
         p6tQ==
X-Gm-Message-State: APuU4Z/c1LXHnOF3fllmrjcVNDd5HzbELbvoIjL2J6s9d7O8K3xqAK4C
	ZdZZonL+yfp5n5THEdWQVscly187702/bBUj5bROkzRlIMbUfMKI16fR/i+adQ6ktGw=
X-Gm-Gg: AZFdTZfvPFICAq1CsNIH0zwHQ97yfi/e4ZjtZy/FTwFiOtaCbxGsOBueu7KsO0YADh1
	U+nMR7q/iJaL59aas5eg5esdmD7PRHRyFmeIMHvcm7Mwp0pgunU7pxxJK0MviYnY8eWOQuDKm3a
	wFlu8AhOpjYd1MDwA4P+w7Pz88koOhAgVg1wA45S6SHW8MRaAeniKQrK0MNF7cAzWfb6i5l5A+v
	aZv/iDPh+NEWn3prs6pn2LPshkdmHUr9NsXfRaabQSoVtQGI4T/MxVbP/AcT0KcWadZ0reS7WFn
	UDcdbdJoXgdmthqS7EcnUBFW8KTYhEWLOASthMR+n+Jma81w37tdu+tYPs/9DZgLGv5Gv4vXrKY
	IY5dNzpuguNkAY4W69HLGhL1dtBr04QPIq2GJl5kVAuiRB0DERUAyEFsncfOYPZLtsEzbpnUEL5
	0MhnHiBESGRh/1j4IC68eRmTmSFiiC7cw3MZJUOAfNjQ5O+IKVIhO1aYnrmgwz3ZpgW76ec7q+7
	1RPlk38+LAm3hqs91/XXJFxRi/fTtEP8guW1mH/k+VJu8e81mF0YGMkBtEl5ntAzFhtUHDsWq5n
	Ewb43reoTX3LGdKH8Rk=
X-Received: by 2002:a05:6000:2210:b0:4a7:790c:4a56 with SMTP id ffacd0b85a97d-4a7790c4b2fmr10368485f8f.33.1795094768046;
        Thu, 19 Nov 2026 05:26:08 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573baa9fsm11452563f8f.57.2026.11.19.05.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:26:07 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Thu, 19 Nov 2026 16:25:36 +0300
Subject: [PATCH v2 3/4] KVM: arm64: nv: Clear hidden TCR2 bits for nested
 guests
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-nv-tcr2-v2-3-3deb1a6cdba8@pereq.eu>
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
X-CRM114-CacheID: sfid-20261119_052611_441495_F4331C59 
X-CRM114-Status: GOOD (  20.20  )
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

The previous patch added traps for TCR2_EL1 writes on VMs that have
FEAT_TCR2 but not FEAT_S1PIE or FEAT_S1POE.  This patch extends that
fix to cover nested virtualization.

The bug is that a KVM can hide the PIE and POE bits in TCR2_EL1 but a VM
can still write to them.  It obviously makes no sense to hide a register
from the VM but still allow writes. The implication of this bug is a
small information leak because a VM can determine the permission bits of
another VM's page tables.

The previous patch trapped writes to TCR2_EL1 but nested virtualization
is more complicated because we have to deal with TCR2_EL2 as well.  A
trapped TCR2_EL1 write has to go to either TCR2_EL2 or TCR2_EL1 depending
on who made it.  With nested virtualization the hidden bits can reach the
hardware in three ways:

- A guest hypervisor at vEL2 writes its TCR2_EL2.
- An L2 writes its own TCR2_EL1.
- An L1 writes its L2's TCR2_EL1 in the VNCR page, which KVM loads as is.

To fix this, remove the vcpu_has_nv() check in __compute_hfgwtr() so that
these writes are trapped too.  When the guest hypervisor is at vEL2,
update TCR2_EL2 and TCR_EL2 instead of L2's registers.  Also clear the
hidden bits in __sysreg_restore_el1_state() when it loads a guest's
TCR2_EL1.

Fixes: 58627b722ee2 ("KVM: arm64: Make PIR{,E0}_EL1 UNDEF if S1PIE is not advertised to the guest")
Fixes: b86c9bea6349 ("KVM: arm64: Save/restore POE registers")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: This is a new patch
---
 arch/arm64/kvm/config.c                    |  2 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 10 +++++++++-
 arch/arm64/kvm/sys_regs.c                  | 19 ++++++++++++++++++-
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index f756f7c4fdf8..8bde0a5eafb6 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1898,7 +1898,7 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
 		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
 
 	/* The CPU acts on hidden TCR2_EL1 bits, so trap writes to clear them */
-	if (!vcpu_has_nv(vcpu) && kvm_has_tcr2(vcpu->kvm) &&
+	if (kvm_has_tcr2(vcpu->kvm) &&
 	    (!kvm_has_s1pie(vcpu->kvm) || !kvm_has_s1poe(vcpu->kvm)))
 		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
 }
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index 4a008c8a696b..d6e8bab14ed3 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -261,7 +261,15 @@ static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
 	write_sysreg_el1(ctxt_sys_reg(ctxt, TTBR0_EL1),	SYS_TTBR0);
 	write_sysreg_el1(ctxt_sys_reg(ctxt, TTBR1_EL1),	SYS_TTBR1);
 	if (ctxt_has_tcrx(ctxt)) {
-		write_sysreg_el1(ctxt_sys_reg(ctxt, TCR2_EL1),	SYS_TCR2);
+		u64 tcr2 = ctxt_sys_reg(ctxt, TCR2_EL1);
+
+		if (ctxt_is_guest(ctxt)) {
+			if (!ctxt_has_s1pie(ctxt))
+				tcr2 &= ~TCR2_EL1_PIE;
+			if (!ctxt_has_s1poe(ctxt))
+				tcr2 &= ~(TCR2_EL1_POE | TCR2_EL1_E0POE);
+		}
+		write_sysreg_el1(tcr2, SYS_TCR2);
 
 		if (ctxt_has_s1pie(ctxt)) {
 			write_sysreg_el1(ctxt_sys_reg(ctxt, PIR_EL1),	SYS_PIR);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 3899702d438b..e4a3beac6ec9 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -624,6 +624,23 @@ static bool access_tcr2_el1(struct kvm_vcpu *vcpu,
 	if (!kvm_has_s1poe(vcpu->kvm))
 		p->regval &= ~(TCR2_EL1_POE | TCR2_EL1_E0POE);
 
+	if (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu)) {
+		vcpu_write_sys_reg(vcpu, p->regval, TCR2_EL2);
+		return true;
+	}
+
+	return access_vm_reg(vcpu, p, r);
+}
+
+static bool access_tcr_el1(struct kvm_vcpu *vcpu,
+			   struct sys_reg_params *p,
+			   const struct sys_reg_desc *r)
+{
+	if (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu)) {
+		vcpu_write_sys_reg(vcpu, p->regval, TCR_EL2);
+		return true;
+	}
+
 	return access_vm_reg(vcpu, p, r);
 }
 
@@ -3512,7 +3529,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_SMCR_EL1), undef_access },
 	{ SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
 	{ SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 },
-	{ SYS_DESC(SYS_TCR_EL1), access_vm_reg, reset_val, TCR_EL1, 0 },
+	{ SYS_DESC(SYS_TCR_EL1), access_tcr_el1, reset_val, TCR_EL1, 0 },
 	{ SYS_DESC(SYS_TCR2_EL1), access_tcr2_el1, reset_val, TCR2_EL1, 0,
 	  .visibility = tcr2_visibility },
 

-- 
2.53.0


