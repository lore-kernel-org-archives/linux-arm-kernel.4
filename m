Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FD5606BF86
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KHFsOrrV;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FXyUm4h0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oDML+Vx7aG/9d0ZHAV6DWPVbDCs3jJPUj9mIn2CqtC4=; b=KHFsOrrV9cfQgK
	Ch8/VL29lSu8dGMkyG5lwiSkJSmAmtliwKGSOdhScny54bui4SxU88WjD+dC/FEH0vv2Lud8VUdsL
	avzi0MYliqrIxa2ZptCEI6JbsJ4J/HB93s6q8LHHK7J2jvKwMnUQzBwv8RyZFSCCvY7YaMfywjJXh
	OTogYVG5k0I2aL1LlkA8Jz3B4402nJf06Ib8GGZXqifbrHRqb124i8KeWmrIGBbYmzfsug19uWLDD
	ubJDetUF+mvH6mc5trzw0wwoSWurQNkCoD2PIjjFSzCvXyzjz1xeBT/K0wX9ChammRsGIs9fWyueo
	38kRLjYkX/Dr6v7/Rg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUr-0000000CxpG-3asQ;
	Fri, 06 Nov 2026 16:08:57 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUd-0000000CxTq-2SbT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:08:48 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6FEG1A2656440;
	Fri, 6 Nov 2026 16:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=oDML+V
	x7aG/9d0ZHAV6DWPVbDCs3jJPUj9mIn2CqtC4=; b=FXyUm4h0Pujwl1BM1ZMMYe
	LLx9uw1D9I/W+TeyQGC5cAfyC7cL5PlOmXoP6Fvw1tD8aZzEHp9MLb7X+b3Fx9ZS
	6gObBpJOPWHZmw3FlrdTg5juc2HurDeeoUmTwGlAhpfgQUbN6Va3dvDs34ZgnkSj
	Z8kqwN6tvo39K2uE5uKx0xRkzontzBGfy/ISaoL35sO0OxzG1nEXt1A8NJ1Jikc5
	x5uWg7dN9xoNW7oWO6ZlWmC7rBNJl2RF22999h05EzK92Yj8Mb1AMu4U/6UdSfVP
	p2hv0WCEq3ag6/HJvYn+npSOC54+V1S/tV/747CP0+g3hjONcMwmDMm4yTbiHQ8A
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hs3rc5et3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F4sbj2390078;
	Fri, 6 Nov 2026 16:08:19 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hs7h13wdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A6G8GdJ47579586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Nov 2026 16:08:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F39E62004F;
	Fri,  6 Nov 2026 16:08:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DFA120063;
	Fri,  6 Nov 2026 16:08:15 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Nov 2026 16:08:15 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 06 Nov 2026 17:07:38 +0100
Subject: [PATCH v3 05/23] arm64: Share system register related headers and
 functions with s390
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sysreg-v3-5-75e95980fb10@linux.ibm.com>
References: <20261106-sysreg-v3-0-75e95980fb10@linux.ibm.com>
In-Reply-To: <20261106-sysreg-v3-0-75e95980fb10@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX3W37ZVdk/Yol
 UCtHwEVHfb5HW88IS8YjMC/Sg6btqGajL3HbQ5ttlQYmwDK+eqWoUpSuJubwF0U66rkBa8D9HKV
 RlF9+AI9YOqwjPKtK1DyzSmGXhAZ19Y=
X-Proofpoint-GUID: e3AwsBmiYuq-hpVt5z8PrmuKf91pDcJc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfXwVdRhc8jATZ0
 dsXW8ucA1zGUbrIV+ywNuuOlHQVAKKIusBPq9jAKSAff26Cjx7Dv4DeRIy8MAv/krEUnQoEt3DZ
 +7JQSFLRu13Mc0THiGvSpZrtQ3hRQFqlG1x3eBljWJu/eMvZGATTPn75eYfVD7whQxQvTJ5+7MX
 BRgw1Rie4DPhDo8EC6ZJPqVeHiugumVBOaZNNQwHdxEzOSMibugdKZ4thdjTQT2AL9xECBdofFc
 WamW7IHGJllcspZ9qLWlpWYHYw1K6B8E2RNEMSISvP1o5f6pIj1NX3669SFabxNbbcuYkouimDd
 UYXtsnUYhE/TEJvCAaIEB66VEBrnjYBjKRKWsuHCM/dGiTflAKwSifVXwOAS52ZTLy83Fx1R1g+
 ow00JWeYU2EVx+hznlOjr7ILleoJ0TrnJxt5kPsQ8++xrPit+BCmjAhYnoDE+6iwUVvv5yBdWsZ
 qz9TklkB9N72j4EtvqA==
X-Proofpoint-ORIG-GUID: e3AwsBmiYuq-hpVt5z8PrmuKf91pDcJc
X-Authority-Analysis: v=2.4 cv=CY+dd7rl c=1 sm=1 tr=0 ts=6aedfb74 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=UQM1QJzDAAAA:8 a=nlbQV7ZB4r-dVmwfZUsA:9 a=QEXdDO2ut3YA:10
 a=Y_cFJIg8yfREFdlijoxh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_080843_877086_CFF2A205 
X-CRM114-Status: GOOD (  22.74  )
X-Spam-Score: -2.6 (--)
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

Mark more headers as shared or move definitions to an already shared
location if the context is similar. The new shared headers cover cover
CPU identification, Exception emulation, ID register state, Mitigation
state, and the kvm system register management infrastructure. Also add
definitions useful for later feature additions to reduce further churn.

With these headers s390 is able to implement system register handling
for its arm64 guests.

Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/cache.h       |  3 +++
 arch/arm64/include/asm/cputype.h     |  3 +++
 arch/arm64/include/asm/kvm_emulate.h |  5 ++++-
 arch/arm64/include/asm/kvm_host.h    | 14 +++++++-------
 arch/arm64/include/asm/spectre.h     |  3 +++
 arch/arm64/kvm/sys_regs.h            |  1 +
 6 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index 10a7ffadee3d..ee3078c68768 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -8,6 +8,7 @@
 #define L1_CACHE_SHIFT		(6)
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
 
+#if ARM64_S390_COMMON == 1
 #define CLIDR_LOUU_SHIFT	27
 #define CLIDR_LOC_SHIFT		24
 #define CLIDR_LOUIS_SHIFT	21
@@ -25,6 +26,8 @@
 /* Ttypen, bits [2(n - 1) + 34 : 2(n - 1) + 33], for n = 1 to 7 */
 #define CLIDR_TTYPE_SHIFT(level)	(2 * ((level) - 1) + CLIDR_EL1_Ttypen_SHIFT)
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 /*
  * Memory returned by kmalloc() may be used for DMA, so we must make
  * sure that all such allocations are cache aligned. Otherwise,
diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 6002d1d5f55f..a8225467cb09 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -5,6 +5,7 @@
 #ifndef __ASM_CPUTYPE_H
 #define __ASM_CPUTYPE_H
 
+#if ARM64_S390_COMMON == 1
 #define INVALID_HWID		ULONG_MAX
 
 #define MPIDR_UP_BITMASK	(0x1 << 30)
@@ -261,6 +262,8 @@
 #define MIDR_FUJITSU_ERRATUM_010001_MASK	(~MIDR_CPU_VAR_REV(1, 0))
 #define TCR_CLEAR_FUJITSU_ERRATUM_010001	(TCR_EL1_NFD1 | TCR_EL1_NFD0)
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 #ifndef __ASSEMBLER__
 
 #include <asm/sysreg.h>
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 334211b8b2ee..4ad190d4559b 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -23,6 +23,7 @@
 #include <asm/cputype.h>
 #include <asm/virt.h>
 
+#if ARM64_S390_COMMON == 1
 #define CURRENT_EL_SP_EL0_VECTOR	0x0
 #define CURRENT_EL_SP_ELx_VECTOR	0x200
 #define LOWER_EL_AArch64_VECTOR		0x400
@@ -35,6 +36,8 @@ enum exception_type {
 	except_type_serror	= 0x180,
 };
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 #define kvm_exception_type_names		\
 	{ except_type_sync,	"SYNC"   },	\
 	{ except_type_irq,	"IRQ"    },	\
@@ -507,13 +510,13 @@ static __always_inline bool kvm_vcpu_abt_issea(const struct kvm_vcpu *vcpu)
 	return esr_abt_is_sea(kvm_vcpu_get_esr(vcpu));
 }
 
+#if ARM64_S390_COMMON == 1
 static __always_inline int kvm_vcpu_sys_get_rt(struct kvm_vcpu *vcpu)
 {
 	u64 esr = kvm_vcpu_get_esr(vcpu);
 	return ESR_ELx_SYS64_ISS_RT(esr);
 }
 
-#if ARM64_S390_COMMON == 1
 static inline bool esr_abt_is_write_fault(unsigned long esr)
 {
 	if (esr_abt_is_s1ptw(esr)) {
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7f051dad79c7..01de095cf0fb 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1332,9 +1332,6 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 		__v;							\
 	})
 
-u64 vcpu_read_sys_reg(const struct kvm_vcpu *, enum vcpu_sysreg);
-void vcpu_write_sys_reg(struct kvm_vcpu *, u64, enum vcpu_sysreg);
-
 struct kvm_vm_stat {
 	struct kvm_vm_stat_generic generic;
 };
@@ -1371,11 +1368,9 @@ int kvm_handle_cp14_32(struct kvm_vcpu *vcpu);
 int kvm_handle_cp14_64(struct kvm_vcpu *vcpu);
 int kvm_handle_cp15_32(struct kvm_vcpu *vcpu);
 int kvm_handle_cp15_64(struct kvm_vcpu *vcpu);
-int kvm_handle_sys_reg(struct kvm_vcpu *vcpu);
 int kvm_handle_cp10_id(struct kvm_vcpu *vcpu);
 
 void kvm_sys_regs_create_debugfs(struct kvm *kvm);
-void kvm_reset_sys_regs(struct kvm_vcpu *vcpu);
 
 int __init kvm_sys_reg_table_init(void);
 struct sys_reg_desc;
@@ -1386,6 +1381,11 @@ int __init populate_nv_trap_config(void);
 void kvm_calculate_traps(struct kvm_vcpu *vcpu);
 
 #if ARM64_S390_COMMON == 1
+u64 vcpu_read_sys_reg(const struct kvm_vcpu *, enum vcpu_sysreg);
+void vcpu_write_sys_reg(struct kvm_vcpu *, u64, enum vcpu_sysreg);
+int kvm_handle_sys_reg(struct kvm_vcpu *vcpu);
+void kvm_reset_sys_regs(struct kvm_vcpu *vcpu);
+
 unsigned long kvm_arm_num_regs(struct kvm_vcpu *vcpu);
 int kvm_arm_copy_reg_indices(struct kvm_vcpu *vcpu, u64 __user *indices);
 int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg);
@@ -1623,8 +1623,6 @@ static inline bool __vcpu_has_feature(const struct kvm_arch *ka, int feature)
 
 #define kvm_vcpu_initialized(v) vcpu_get_flag(v, VCPU_INITIALIZED)
 
-#endif /* ARM64_S390_COMMON == 1 */
-
 int kvm_trng_call(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_KVM
 extern phys_addr_t hyp_mem_base;
@@ -1711,6 +1709,8 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 	(kvm_cmp_feat(kvm, id, fld, >=, min) &&				\
 	kvm_cmp_feat(kvm, id, fld, <=, max))
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 /* Check for a given level of PAuth support */
 #define kvm_has_pauth(k, l)						\
 	({								\
diff --git a/arch/arm64/include/asm/spectre.h b/arch/arm64/include/asm/spectre.h
index 2ecc9eddbebb..4c6c07c9b515 100644
--- a/arch/arm64/include/asm/spectre.h
+++ b/arch/arm64/include/asm/spectre.h
@@ -19,6 +19,7 @@
 #include <asm/cpufeature.h>
 #include <asm/virt.h>
 
+#if ARM64_S390_COMMON == 1
 /* Watch out, ordering is important here. */
 enum mitigation_state {
 	SPECTRE_UNAFFECTED,
@@ -31,6 +32,8 @@ enum mitigation_state arm64_get_spectre_v4_state(void);
 enum mitigation_state arm64_get_meltdown_state(void);
 enum mitigation_state arm64_get_spectre_bhb_state(void);
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 struct pt_regs;
 struct task_struct;
 
diff --git a/arch/arm64/kvm/sys_regs.h b/arch/arm64/kvm/sys_regs.h
index a3cccad2766f..7cb7ad208e05 100644
--- a/arch/arm64/kvm/sys_regs.h
+++ b/arch/arm64/kvm/sys_regs.h
@@ -7,6 +7,7 @@
  * Copyright (C) 2012 - Virtual Open Systems and Columbia University
  * Authors: Christoffer Dall <c.dall@virtualopensystems.com>
  */
+/* Whole file is shared with s390 */
 
 #ifndef __ARM64_KVM_SYS_REGS_LOCAL_H__
 #define __ARM64_KVM_SYS_REGS_LOCAL_H__

-- 
2.56.0


