Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D94606C2EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2CQx3flB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=BxvjuCqf;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JWt+eUpi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hBACEJThrzFvs6VkbYNvHFHyFDYp47CtFJ15B+0prkc=; b=2CQx3flBD+TX/B
	2ZN+hQK+A/KStcIsaW8HGYF9vo1a2IJ/jXH0zV2qHhoW0OhbDa+8ruPftNHmC2W7I6JBrGRRHPJND
	2NVs+rfNkaAKOjGtIZnDmYKCg8Vp20g2VzhunuhDpWZLX28PWgRHzbcAYgk75uBrISmyZ1+gJ7v57
	DlKqTsp3fOgvsE8wplyoG+LF9bojMQZapu3wNFwvt67Ptt2Zvxi9hFTSOYzbG7VFclBaJ/+SEacLn
	cSv2lbn2PWvRq259iJUIJx49Za8XWpR0MUlECBXlJLKymKEWS3xck0xZjoTp2Fn5N2iWsJY5HQEbb
	HzUt38RtPl3VOGrOjytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsZ-0000000GOgt-2K3M;
	Fri, 27 Nov 2026 14:24:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWws4-0000000GNdN-1GEY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=hBACEJThrzFvs6VkbYNvHFHyFDYp47CtFJ15B+0prkc=; b=BxvjuCqfX05axckFYUVpPWJ81E
	1yWrDJ7X7t9zSYeBXvpABSPerocCwyQ4cmUjc0L/VZlDKIVY8/dzZLi7CVK9XkzpQOvwUzqWY1hSg
	wMGXxpW5+zFT8/ILhY8cWfsM5OoOudiGy6KDyNsdMkSmWofWZeG/U9uXQYm5IHILpt7aL35CTnmVh
	ycZKAaEqtad+AElXJhAILF1KohwsKUA7udeiE9gXbwTtWQAM6jACdkTCRAfUIlxwO8SyN8K3i6gXS
	Apt4F65Au5/f8Wc/5G5SIaswnIS3Dv/58qpWVoXRZfNU74ieXbaY6naylzLhfzhu3wvbiZq3hzSP8
	1a/mFXQw==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwrx-0000000FWHp-2hOC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:24:15 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4eQc1650139;
	Fri, 27 Nov 2026 14:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hBACEJ
	ThrzFvs6VkbYNvHFHyFDYp47CtFJ15B+0prkc=; b=JWt+eUpiryoIrufH7q+qQ3
	s6rJNLOa82m/TGNZAa8cZDrc0emwAWZe16FC6nQGi5jsfUqp8en3W0Za+LLF62Ez
	+qoSpma4YjQi2yaoRBSiy+yCuDz4SyMyEOhqkMvWXoAxOw1QuBSPc0fHprP9zffD
	gRx1lo0nPplw+HzySN/FXVC3YT+ROiX+4jfdHhEv6GzVvH12WqSHjM1627w4l/1j
	yIhdXLtcSLuBq3Z9ND7G9e8ZJyFY0tML4i4wqTWWKXABKuukr8g76nttkBiPFT7m
	swTMlWz23gxzrPYJCKmynjx80eD0l9B2APLRGDbS2USaOU+Bblf4H/o2hOOnbaZw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g3p7hx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:25 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4JgD2819310;
	Fri, 27 Nov 2026 14:23:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5kfaahk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARENHQV18088430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 14:23:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 018052004B;
	Fri, 27 Nov 2026 14:23:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83A4A20063;
	Fri, 27 Nov 2026 14:23:16 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 14:23:16 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 27 Nov 2026 15:22:10 +0100
Subject: [PATCH v4 07/25] arm64: Share system register related headers and
 functions with s390
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-sysreg-v4-7-a6318d18aab5@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=SoQFe/O0 c=1 sm=1 tr=0 ts=6b09925d cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=UQM1QJzDAAAA:8 a=nlbQV7ZB4r-dVmwfZUsA:9 a=QEXdDO2ut3YA:10
 a=Y_cFJIg8yfREFdlijoxh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfXyaBGi46V3BMH
 4zijTFiY/Y/kTjBoN5k5sxl9OjBr7CWdAbOcKJVNSyIleCCcpCGl9fNKtT/BU/L3ox/fD5WvAjm
 2dh2KPWZRRxsoyj0WuCIFyqIg6a2IU0=
X-Proofpoint-ORIG-GUID: wbLdr3WNvJuOj0Mp-8ag4QotzOXJw3gA
X-Proofpoint-GUID: wbLdr3WNvJuOj0Mp-8ag4QotzOXJw3gA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX8g3X2oAp6R3D
 5zGJJn+gvogtjqzy781IsIH7+dKyqC6PLlfeomrM7vB5G6XSUOGEYifa70MySeXOkjE2AUaPQZC
 UCu0/ADG6WGg6/EVbBnsMCZ/7ezvstldNp0N3VufMMhquEFGOdvHtPoxf+BBp9UEqO/0szS66m8
 QtJu5tWrt+bips2Zbv/HJ5xijI5tuofhV1V6FY2H8yNEb94tIjyIlRRxeGMqVm+R9Hxt+xf/i48
 d3l5DG/X7NQJoFNaS9iHADfj/FNzbzP3/h3auY+hkbIf9Rg68A3IUyWqfPQ6dsrEhzFh07igiBT
 hCEnQ/cYhKfJ+ZdLhrjbZ9tM1WKNmfzzfhHWKuyCahgMOSlnYAHboimUY6cwfY7iJPF4osT47df
 CepuGxicSeKT4sSriteSlQQptwGi7JxIN2T4bMiikUyvvOs0RwPFx1UGzyg4dXIB9G2HpgNALia
 YPitnDAetz3bbmesHPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142410_407514_BA2AC30F 
X-CRM114-Status: GOOD (  20.60  )
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
index 0cfa7b640b9c..48a49822e204 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -5,6 +5,7 @@
 #ifndef __ASM_CPUTYPE_H
 #define __ASM_CPUTYPE_H
 
+#if ARM64_S390_COMMON == 1
 #define INVALID_HWID		ULONG_MAX
 
 #define MPIDR_UP_BITMASK	(0x1 << 30)
@@ -289,6 +290,8 @@
 #define MIDR_FUJITSU_ERRATUM_010001_MASK	(~MIDR_CPU_VAR_REV(1, 0))
 #define TCR_CLEAR_FUJITSU_ERRATUM_010001	(TCR_EL1_NFD1 | TCR_EL1_NFD0)
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 #ifndef __ASSEMBLER__
 
 #include <asm/sysreg.h>
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 2d7c82cfb8a4..9e75db26929c 100644
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
index cfb2721053ed..3242bdf1acf8 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1335,9 +1335,6 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 		__v;							\
 	})
 
-u64 vcpu_read_sys_reg(const struct kvm_vcpu *, enum vcpu_sysreg);
-void vcpu_write_sys_reg(struct kvm_vcpu *, u64, enum vcpu_sysreg);
-
 struct kvm_vm_stat {
 	struct kvm_vm_stat_generic generic;
 };
@@ -1374,11 +1371,9 @@ int kvm_handle_cp14_32(struct kvm_vcpu *vcpu);
 int kvm_handle_cp14_64(struct kvm_vcpu *vcpu);
 int kvm_handle_cp15_32(struct kvm_vcpu *vcpu);
 int kvm_handle_cp15_64(struct kvm_vcpu *vcpu);
-int kvm_handle_sys_reg(struct kvm_vcpu *vcpu);
 int kvm_handle_cp10_id(struct kvm_vcpu *vcpu);
 
 void kvm_sys_regs_create_debugfs(struct kvm *kvm);
-void kvm_reset_sys_regs(struct kvm_vcpu *vcpu);
 
 int __init kvm_sys_reg_table_init(void);
 struct sys_reg_desc;
@@ -1389,6 +1384,11 @@ int __init populate_nv_trap_config(void);
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
@@ -1626,8 +1626,6 @@ static inline bool __vcpu_has_feature(const struct kvm_arch *ka, int feature)
 
 #define kvm_vcpu_initialized(v) vcpu_get_flag(v, VCPU_INITIALIZED)
 
-#endif /* ARM64_S390_COMMON == 1 */
-
 int kvm_trng_call(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_KVM
 extern phys_addr_t hyp_mem_base;
@@ -1749,6 +1747,8 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
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
2.56.1


