Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBE660A6F47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GnIDAAyy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KCa/dXPZ;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O5p/0CNy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HLJMICeO692D0UbEUItX105mkqUC11k/qvNGT9nXTcE=; b=GnIDAAyyhfh/sn
	XihMxI0doOZ3QcQge7sDS3Eqaj0nLYNfMB1cAl0eFqyUZF0ca/h5RhIMuHY5RvR09LtV7IPnOILEX
	086YZZXrmcBb7sgz+qtDkJbvhHEg/lhPKoHhdlHmYjXFC3piPgeRC1ECCfRD52WTPsuEuMSZmzgl4
	H7vXuKbkOv8NK1wMZa+gpSalrPD8c8NhVShn5m9APcEYIot8XGDVetJ5j4GHGFXOgxu3Yiwy+yf8J
	EiQ+GULGPjczHEt4YQegIlWbUdNt6j9q11Pdx/k4C3VsnUDTuCoKKE7uDZvN2VxJWEPfzWbbyn4AM
	hQVVlE0M32o00Qyxz7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsb-0000000GOli-2xcH;
	Fri, 27 Nov 2026 14:24:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWws6-0000000GNfY-0SBG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HLJMICeO692D0UbEUItX105mkqUC11k/qvNGT9nXTcE=; b=KCa/dXPZi890hxmuyOj/dTznWT
	q8SaWx72ZPXuUXPe+ddIQi7dqFnfOtJ9FKLz7ZgKtYxIbwdfyjOOcwcCjf2bJH68HgGfqlF1RVseV
	pQ9vHg4Vzxd4CKg+1c4ojbTPY2p3Dw/4DzzQf5sQbVaPFy4Kxx+1kuAlQkOyGLPzxd04R16y9vPmr
	mE4QrvQkL4DTiVBC2Ra1OGEpR3P76rNg48o7kYr8tNbaMENxVyb6aaeOxytgjV4p2yW0ix+/WqXRp
	J1H2NrjwF1RCs5oZQOA8Cztt4Ps3QtcwEu0X1nfhkTnWE8DVVX6F3QdTeEJWo7m/sz604qDEmo01H
	2fvy4xSQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWws0-00000007mSt-20nJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:24:17 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4gVx3234326;
	Fri, 27 Nov 2026 14:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HLJMIC
	eO692D0UbEUItX105mkqUC11k/qvNGT9nXTcE=; b=O5p/0CNyaJj8aohHgnEUky
	cv3r6n8OHopn+bW62F+1OOjYL33uAQiKcy7RiopZbAxdkI+oFz7ZTWHCdSlisiIi
	CVIq6LqH+tf2a7SYmi/7pqt6IQ9Fu0cvRpAAJUYTNQLCK78UPTtmJUf5hOZFrzA3
	p73jhA4Qqml+BL3mbpg3tX+FGn2EP1rWxZoQT0+Tdu12FIWz/wIFF3KqX9Cu4BJO
	Xe2WIPFNm/vQ26fIjo4Hrs/V6Ax3yp5W4YYVoIX/P0pWDUOqny3uP+RU1DfWfknm
	FTtnhpiBGY2HTuc/1U4TGaH0mYPv6uhubby82iZoang0sh8v6XqJ0h/DIW2ds/aQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gvng4h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4JUF861635;
	Fri, 27 Nov 2026 14:23:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j6mjg4d4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARENEeT39387576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 14:23:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0504120040;
	Fri, 27 Nov 2026 14:23:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D46820067;
	Fri, 27 Nov 2026 14:23:13 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 14:23:13 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 27 Nov 2026 15:22:04 +0100
Subject: [PATCH v4 01/25] KVM: arm64: Route VM ID register accesses through
 helpers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-sysreg-v4-1-a6318d18aab5@linux.ibm.com>
References: <20261127-sysreg-v4-0-a6318d18aab5@linux.ibm.com>
In-Reply-To: <20261127-sysreg-v4-0-a6318d18aab5@linux.ibm.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Andreas Grapentin <gra@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Friedrich Welter <fritz@linux.ibm.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Nico Boehr <nrb@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-s390@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>
X-Mailer: b4 0.14.3
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b099258 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=cTjP7GSaQDJverrz-6oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX8NSbSlXOrJDn
 6pWm1zQAGFpIHhF59hb8odP3V77oRIdBDCFPCWSwfUD7CMMobbjh6VAgTbeaEZBFHE0CrDK5pNc
 eDNVU5OHehXL6a4aDlga9LLdLKbRsq0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX0N1f4zC/Sar6
 U8+Nz3oOXyTkHLUV0nYucyorACZBegteMeYOYQwgI4/JsoSLj0V2Lh5ZePUIbLz/2RzhZOdLrHf
 hbmnDRfTU7utQeSWRSgJHOo1YZyOKGgx2Qolg+1zhrox5/wKPFHsArGBkGUJZkOoThYy1XWCu38
 avfFza94S46x7WEG6MJeP4GlwLKEUPQUI5sG5HA9xjBpUxFw1Y4nDRhgh3Wtgc7kNho4/MRU+Lp
 O1j9iQoeJ6fYjq9VwV+dBSVDoGHEDWOxyahv9fEK1E0nXEWOr8NTcc3XINKQCE+DI2BW2kZGw7n
 USi8+v10LazUInByIpF7pGCVbo1Uxik4pMpqHhsIJJ55M+hHjXOpi+CmMGfG7Y3EsARcrmtHy4Z
 ZuO0HaEjX+3YE2fGlWietxc5qFgzb7ymMOS7fL8B0PHtl23BezRzWNeLFwRnNssgdG2TlUKxJR+
 bcskiq3vQUY8ldzidkg==
X-Proofpoint-ORIG-GUID: 49w2PUmAfpBs52js0bKBgRJ-Be433md2
X-Proofpoint-GUID: 49w2PUmAfpBs52js0bKBgRJ-Be433md2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142415_522925_05EA6968 
X-CRM114-Status: GOOD (  20.97  )
X-Spam-Score: -0.7 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VM-scoped ID registers are currently accessed in a mix of ways: the
kvm_read_vm_id_reg() macro, open-coded kvm->arch.id_regs[] array
accesses, and direct writes to the ctr_el0 and midr_el1 fields in pKVM.

Add a small accessor family on top of __vm_id_reg() and the new
__vm_ftr_reg_by_idx() to streamline the handling of the feature
registers.

Convert all open-coded accesses so the mapping from ID register (or
index) to its storage lives in exactly one place. This is a prerequisite
for sharing the feature register code with s390's kvm_arm64.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/kvm_host.h  | 41 +++++++++++++++++++++++++++++++++++---
 arch/arm64/kvm/config.c            | 12 ++++++-----
 arch/arm64/kvm/hyp/nvhe/pkvm.c     |  7 +++++--
 arch/arm64/kvm/hyp/nvhe/sys_regs.c |  5 ++---
 arch/arm64/kvm/sys_regs.c          |  6 ++----
 5 files changed, 54 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 0614c3b3a40d..83a6993e21cf 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1637,11 +1637,16 @@ void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
 bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
 bool kvm_pkvm_vcpu_is_powered_off(struct kvm_vcpu *vcpu);
 
+static inline u64 *__vm_ftr_reg_by_idx(struct kvm_arch *ka, u32 idx)
+{
+		return &ka->id_regs[idx];
+}
+
 static inline u64 *__vm_id_reg(struct kvm_arch *ka, u32 reg)
 {
 	switch (reg) {
 	case sys_reg(3, 0, 0, 1, 0) ... sys_reg(3, 0, 0, 7, 7):
-		return &ka->id_regs[IDREG_IDX(reg)];
+		return __vm_ftr_reg_by_idx(ka, IDREG_IDX(reg));
 	case SYS_CTR_EL0:
 		return &ka->ctr_el0;
 	case SYS_MIDR_EL1:
@@ -1656,8 +1661,38 @@ static inline u64 *__vm_id_reg(struct kvm_arch *ka, u32 reg)
 	}
 }
 
-#define kvm_read_vm_id_reg(kvm, reg)					\
-	({ u64 __val = *__vm_id_reg(&(kvm)->arch, reg); __val; })
+#define kvm_get_vm_ftr_reg_by_idx(kvm, idx)					\
+	({									\
+		u64 *__valp = __vm_ftr_reg_by_idx(&(kvm)->arch, idx);		\
+		__valp;								\
+	})
+
+#define kvm_get_vm_id_reg(kvm, reg)					\
+	({								\
+		u64 *__valp = __vm_id_reg(&(kvm)->arch, reg);		\
+		__valp;							\
+	})
+
+#define kvm_read_vm_id_reg(kvm, reg)				\
+	({							\
+		u64 __val = *kvm_get_vm_id_reg(kvm, reg);	\
+		__val;						\
+	})
+
+#ifdef __KVM_NVHE_HYPERVISOR__
+#define __kvm_set_vm_id_reg(kvm, reg, val)			\
+	({							\
+		u64 *__p = kvm_get_vm_id_reg(kvm, reg);		\
+		*__p = val;					\
+	})
+#else
+#define __kvm_set_vm_id_reg(kvm, reg, val)			\
+	({							\
+		u64 *__p = kvm_get_vm_id_reg(kvm, reg);		\
+		if (!KVM_BUG_ON(!__p, kvm))			\
+			*__p = val;				\
+	})
+#endif /* __KVM_NVHE_HYPERVISOR__ */
 
 void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 6f668148ccc1..402d75e371da 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1560,6 +1560,7 @@ static const struct reg_feat_map_desc *idreg_feat_maps[] = {
 static bool idreg_apply_deps(struct kvm *kvm, const struct reg_feat_map_desc *r)
 {
 	struct resx resx = {};
+	u64 *valp;
 	u64 val;
 
 	for (int i = 0; i < r->bit_feat_map_sz; i++) {
@@ -1568,11 +1569,12 @@ static bool idreg_apply_deps(struct kvm *kvm, const struct reg_feat_map_desc *r)
 			resx.res0 |= reg_feat_map_bits(&r->bit_feat_map[i]);
 	}
 
-	val = kvm->arch.id_regs[r->idreg_idx];
-	kvm->arch.id_regs[r->idreg_idx] &= ~resx.res0;
-	kvm->arch.id_regs[r->idreg_idx] |= resx.res1;
+	valp = kvm_get_vm_ftr_reg_by_idx(kvm, r->idreg_idx);
+	val = *valp;
+	*valp &= ~resx.res0;
+	*valp |= resx.res1;
 
-	return val != kvm->arch.id_regs[r->idreg_idx];
+	return val != *valp;
 }
 
 void kvm_idregs_enforce_dependencies(struct kvm *kvm)
@@ -1589,7 +1591,7 @@ void kvm_idregs_enforce_dependencies(struct kvm *kvm)
 
 static bool idreg_feat_match(struct kvm *kvm, const struct reg_bits_to_feat_map *map)
 {
-	u64 regval = kvm->arch.id_regs[map->regidx];
+	u64 regval = *kvm_get_vm_ftr_reg_by_idx(kvm, map->regidx);
 	u64 regfld = (regval >> map->shift) & GENMASK(map->width - 1, 0);
 
 	if (map->sign) {
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 6442200cd40b..db51174ffbe0 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -413,7 +413,8 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 	DECLARE_BITMAP(allowed_features, KVM_VCPU_MAX_FEATURES);
 
 	/* CTR_EL0 is always under host control, even for protected VMs. */
-	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
+	__kvm_set_vm_id_reg(kvm, SYS_CTR_EL0,
+			    *kvm_get_vm_id_reg((struct kvm *)host_kvm, SYS_CTR_EL0));
 
 	/*
 	 * pKVM runs only GICv3. Anything else becomes 0, the model of a VM
@@ -433,7 +434,9 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 			    KVM_VCPU_MAX_FEATURES);
 
 		if (test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &host_arch_flags))
-			hyp_vm->kvm.arch.midr_el1 = host_kvm->arch.midr_el1;
+			__kvm_set_vm_id_reg(kvm, SYS_MIDR_EL1,
+					    *kvm_get_vm_id_reg((struct kvm *)host_kvm,
+							       SYS_MIDR_EL1));
 
 		goto out;
 	}
diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index e5502d5651b0..8b3dd16cbfc3 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -296,7 +296,7 @@ static u64 read_id_reg(const struct kvm_vcpu *vcpu,
 		return 0;
 
 	if (reg >= sys_reg(3, 0, 0, 1, 0) && reg <= sys_reg(3, 0, 0, 7, 7))
-		return kvm->arch.id_regs[IDREG_IDX(reg)];
+		return *kvm_get_vm_id_reg(kvm, reg);
 
 	return 0;
 }
@@ -594,7 +594,6 @@ void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu)
 void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
-	struct kvm_arch *ka = &kvm->arch;
 	u32 r;
 
 	hyp_assert_lock_held(&vm_table_lock);
@@ -607,7 +606,7 @@ void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
 	 * for protected VMs.
 	 */
 	for (r = sys_reg(3, 0, 0, 4, 0); r <= sys_reg(3, 0, 0, 7, 7); r += sys_reg(0, 0, 0, 0, 1))
-		ka->id_regs[IDREG_IDX(r)] = pvm_calc_id_reg(vcpu, r);
+		*kvm_get_vm_ftr_reg_by_idx(kvm, IDREG_IDX(r)) = pvm_calc_id_reg(vcpu, r);
 
 	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
 }
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5555e17a7710..b8daecbf16f6 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2543,14 +2543,12 @@ static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 
 void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val)
 {
-	u64 *p = __vm_id_reg(&kvm->arch, reg);
-
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	if (KVM_BUG_ON(kvm_id_regs_final(kvm) || !p, kvm))
+	if (KVM_BUG_ON(kvm_id_regs_final(kvm), kvm))
 		return;
 
-	*p = val;
+	__kvm_set_vm_id_reg(kvm, reg, val);
 }
 
 static int get_raz_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,

-- 
2.56.1


