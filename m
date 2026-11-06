Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE98606BF83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PB1+K2/P;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=byilQpRw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zj4+a26h6xCH2eVlFtObSW7sNSFiQzuC628stgVIElE=; b=PB1+K2/PO1H7Dt
	l+T/ZRPyM2LKaHJEC/WnwvdaJ0K3uWjbQ+dzkHetz5BwgdwkE/XRF7zkLhLCdeObYoiXAL8tZOQOJ
	FrVH5QgW5KZpXVP7m8LnwnDDGLUxBybJ0hoxhV/qxphDICyw3Yf02xRyEKgD/uZKOVwK0LcpI/xEn
	QSOCbaWW79AlkJ1u7oyuOX1O7t9bs/VcLid10ta6opm2NKJupkA1LtVicU5BdP6xI7oAnTzik+49o
	SnJJubH14ddY39GlOxSfoSpNO2qcW5dclOWPzm+YHZ9LIvxWmHiJ3WAS6PIsnKCE3vSQGTjAk7X0n
	AxBBFTME1F3wAfjRsV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUs-0000000Cxq9-1era;
	Fri, 06 Nov 2026 16:08:58 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUe-0000000CxUk-0YgZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:08:51 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6FEFn41544360;
	Fri, 6 Nov 2026 16:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zj4+a2
	6h6xCH2eVlFtObSW7sNSFiQzuC628stgVIElE=; b=byilQpRwugZXseC2EQ3fhf
	UuTZk82hopfIGSzGfZsCqH4WmhL2lu5psSFdKjXJuaUe37wHoABjHb2SknykDkdz
	MhrA3rpBoRm5gvjg9LN0X8XWiZ38HFcue8wr+0S1eP+t/W4NnbKTyYoIs4kSnB96
	pnWy1eyW2c8MPSZmhTvCqz3E7fNFgnp5nMphNZJSGXGXlWGMQuv2gubwpW+oBkZY
	exCQPjPdxgjQ3fl6LBtgVXEESlng3i/0YFjy6mKe9OcnjC3GKwpVxcAe2CGM3Na/
	f08MZukDqthy6m5R95os6Bla6hmRnEM+IQf/DhRgj382+TmFjldef/IZZzsuwPCA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hs3rbwf0n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:27 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F4vNR2390139;
	Fri, 6 Nov 2026 16:08:26 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hs7h13wf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A6G8MLk50463044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Nov 2026 16:08:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5527E2004B;
	Fri,  6 Nov 2026 16:08:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E256A20063;
	Fri,  6 Nov 2026 16:08:21 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Nov 2026 16:08:21 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 06 Nov 2026 17:07:53 +0100
Subject: [PATCH v3 20/23] KVM: s390: arm64: Finalize page fault handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sysreg-v3-20-75e95980fb10@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: A1KLRjZm6OfQ-xEs7CApG9vK_SywaM2a
X-Proofpoint-GUID: A1KLRjZm6OfQ-xEs7CApG9vK_SywaM2a
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aedfb7b cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=Ycfx71k22ath6WJvB3EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX9wp3kv1cXFuJ
 SKe0ZtwAfURLTFzx0biVhH6DLO2Ur0O7aRKxjEzqH6p7o7caUPG+E/rulMB2qW83jTnG9te35Ds
 vAgpbxVhsa6bjWX7cb696pmf8Y11mRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX2i4AFsWsbsuZ
 gnkfURWL70mTo2RCJKV13xtTWTwAkzEzgfJkDSEYAgIRFwHpRFJve9b4RDVXrj2b3IhlIqymx1+
 quBsbBpqrtVmQOS+t9MbiEQb9L7tulyMKesaXt7GBYcIUQftxmWMpBqsOT/cbazNXSCfhTX0DFM
 0i6E688dPZQuPuP7GWsWgHL6d/ZWJRA9GdmeO/jTnSar4Z5py8DQaAz93JtvDh6k8K3c3N2/rc6
 mRAaj/V2X8mTyZqUDAuTKOO5yE0E0BwyOa8shnChQvRDSRvkIiq8dFjyHOmxPbqpVCwWuGrYhjz
 15DxrFrw8v1KcQdRA0ZfjL/gM4miCRV+EyMYM1k0o+qp3dQX0+iSmZvfFdJvirbW+8nvZB+j/5l
 1TnLvqR7AOOmiJY+aEjeCQDQvcZpyxLoPiEHwmbRYdOPcIfhri+NtmOP17UHCd8QM1cr5WiQz8t
 nAnK+eG15p6LQUn3OLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_080844_365726_2E1A59C2 
X-CRM114-Status: GOOD (  26.84  )
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

Replace the temporary -ENOEXEC returns of the arm64-on-s390 page fault
handling with exception injection into the guest, mirroring arm64's
kvm_handle_guest_abort().

Translation faults beyond the physical address range  are injected as an
address size fault, while faults falling between the VM's IPA size and
that range are injected as a synchronous external abort. Instruction
aborts and stage-1 walk faults on host addresses that back no guest page
are injected as synchronous external aborts as well, and a
PGM-addressing from the fault-in path is injected as an address size
fault, the closest arm64 equivalent. Injected faults return 1 so the
vCPU re-enters the guest with the pending exception instead of exiting
to userspace.

Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/include/asm/kvm_host_arm64.h |  1 +
 arch/s390/kvm/arm64/arm.c              |  6 +++
 arch/s390/kvm/arm64/mmu.c              | 74 +++++++++++++++++++++++-----------
 arch/s390/kvm/arm64/sys_regs.c         |  4 ++
 4 files changed, 62 insertions(+), 23 deletions(-)

diff --git a/arch/s390/include/asm/kvm_host_arm64.h b/arch/s390/include/asm/kvm_host_arm64.h
index 79549434a1d6..20f51cf9ce37 100644
--- a/arch/s390/include/asm/kvm_host_arm64.h
+++ b/arch/s390/include/asm/kvm_host_arm64.h
@@ -426,5 +426,6 @@ static inline bool vgic_host_has_gicv5(void)
 }
 
 void kvm_adjust_pc(struct kvm_vcpu *vcpu);
+size_t kvm_parange_to_address_sanitized(u32 id_parange);
 
 #endif /* ASM_KVM_HOST_ARM64_H */
diff --git a/arch/s390/kvm/arm64/arm.c b/arch/s390/kvm/arm64/arm.c
index 91e9f4a75ce7..b5a0f8c1e9a4 100644
--- a/arch/s390/kvm/arm64/arm.c
+++ b/arch/s390/kvm/arm64/arm.c
@@ -63,9 +63,15 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 
 static u64 kvm_max_guest_address(void)
 {
+	u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
+	u64 id_pa_addr;
 	u64 max_addr;
 
+	id_pa_addr = kvm_parange_to_address_sanitized(
+		SYS_FIELD_GET(ID_AA64MMFR0_EL1, PARANGE, mmfr0));
+
 	max_addr = min_t(u64, TASK_SIZE_MAX, sclp.hamax);
+	max_addr = min_t(u64, max_addr, id_pa_addr);
 	max_addr = max_t(u64, max_addr, SZ_1G - 1);
 	return ALIGN_DOWN(max_addr + 1, SZ_1G) - 1;
 }
diff --git a/arch/s390/kvm/arm64/mmu.c b/arch/s390/kvm/arm64/mmu.c
index 31e0d036896f..7a6f6ba326c1 100644
--- a/arch/s390/kvm/arm64/mmu.c
+++ b/arch/s390/kvm/arm64/mmu.c
@@ -16,7 +16,8 @@ static inline bool kvm_s390_cur_gmap_fault_is_write(struct kvm_vcpu *vcpu)
 /*
  * user_mem_abort() - handle a dat fault for the gmap of a vcpu
  *
- * Return: 0 on success, < 0 in case of error.
+ * Return: 0 if the fault was resolved, 1 if an exception was injected into
+ * the guest; the caller resumes the vCPU in both cases. < 0 in case of error.
  * Context: The mm lock must not be held before calling. May sleep.
  */
 static int user_mem_abort(struct kvm_vcpu *vcpu, gpa_t fault_ipa,
@@ -32,12 +33,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, gpa_t fault_ipa,
 	ret = kvm_s390_faultin_gfn(vcpu, NULL, &f);
 	if (ret <= 0)
 		return ret;
-	if (ret == PGM_ADDRESSING)
+	if (ret == PGM_ADDRESSING) {
 		/*
-		 * Without the relevant sysregs we cannot do anything for now.
-		 * Go back to userspace with an error. TODO sysreg handling
+		 * There is no page with the requested address. Inject size fault
+		 * which is the closest arm match to PGM-addressing
 		 */
-		return -ENOEXEC;
+		kvm_inject_size_fault(vcpu);
+		return 1;
+	}
 	KVM_BUG_ON(ret, vcpu->kvm);
 	return -EINVAL;
 }
@@ -70,6 +73,35 @@ static int kvm_handle_pic(struct kvm_vcpu *vcpu, bool *translation)
 	return 0;
 }
 
+size_t kvm_parange_to_address_sanitized(u32 id_parange)
+{
+	static u32 ranges_map[8] = {
+		[ID_AA64MMFR0_EL1_PARANGE_32] = 32,
+		[ID_AA64MMFR0_EL1_PARANGE_36] = 36,
+		[ID_AA64MMFR0_EL1_PARANGE_40] = 40,
+		[ID_AA64MMFR0_EL1_PARANGE_42] = 42,
+		[ID_AA64MMFR0_EL1_PARANGE_44] = 44,
+		[ID_AA64MMFR0_EL1_PARANGE_48] = 48,
+		[ID_AA64MMFR0_EL1_PARANGE_52] = 52,
+		[ID_AA64MMFR0_EL1_PARANGE_56] = 56,
+	};
+	u32 parange;
+
+	/*
+	 * Future values must be higher than we know already.
+	 * See ARM DDI 0487C.a. Return a safe limit.
+	 */
+	parange = ranges_map[min(id_parange, ID_AA64MMFR0_EL1_PARANGE_56)];
+	return BIT_ULL(parange);
+}
+
+static size_t kvm_get_pa_address(struct kvm *kvm)
+{
+	u32 id_parange = get_idreg_field_enum(kvm, ID_AA64MMFR0_EL1, PARANGE);
+
+	return kvm_parange_to_address_sanitized(id_parange);
+}
+
 int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 {
 	struct kvm_memory_slot *memslot;
@@ -98,16 +130,17 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	}
 
 	if (translation) {
-		/*
-		 * For both cases:
-		 * Without the relevant sysregs we cannot do anything for now.
-		 * Go back to userspace with an error. TODO sysreg handling
-		 */
-		if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit()))
-			return -ENOEXEC;
+		/* Beyond the PA range programmed for the guest */
+		if (fault_ipa >= kvm_get_pa_address(vcpu->kvm)) {
+			kvm_inject_size_fault(vcpu);
+			return 1;
+		}
 
-		if (fault_ipa >= vcpu->kvm->arch.guest_phys_size)
-			return -ENOEXEC;
+		/* Falls between the IPA range and the PA range? */
+		if (fault_ipa >= vcpu->kvm->arch.guest_phys_size) {
+			fault_ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
+			return kvm_inject_sea(vcpu, is_iabt, fault_ipa);
+		}
 	}
 
 	trace_kvm_guest_fault(*vcpu_pc(vcpu), kvm_vcpu_get_esr(vcpu),
@@ -121,23 +154,18 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
 	write_fault = kvm_s390_cur_gmap_fault_is_write(vcpu);
 	if (kvm_is_error_hva(hva) || (write_fault && !writable)) {
-		ret = -ENOEXEC;
 		/*
 		 * The guest has put either its instructions or its page-tables
 		 * somewhere it shouldn't have. Userspace won't be able to do
 		 * anything about this (there's no syndrome for a start).
-		 *
-		 * Without the relevant sysregs we cannot do anything for now.
-		 * Go back to userspace with an error. TODO sysreg handling
 		 */
-		if (is_iabt)
+		if (is_iabt) {
+			ret = kvm_inject_sea_iabt(vcpu, kvm_vcpu_get_hfar(vcpu));
 			goto out_unlock;
+		}
 
 		if (kvm_vcpu_abt_iss1tw(vcpu)) {
-			/*
-			 * Without the relevant sysregs we cannot do anything for now.
-			 * Go back to userspace with an error. TODO sysreg handling
-			 */
+			ret = kvm_inject_sea_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
 			goto out_unlock;
 		}
 
diff --git a/arch/s390/kvm/arm64/sys_regs.c b/arch/s390/kvm/arm64/sys_regs.c
index 417a05ce9015..951a02d89fc5 100644
--- a/arch/s390/kvm/arm64/sys_regs.c
+++ b/arch/s390/kvm/arm64/sys_regs.c
@@ -317,6 +317,10 @@ static int arm64_check_features(struct kvm_vcpu *vcpu,
 		if (SYS_FIELD_GET(ID_AA64MMFR0_EL1, PARANGE, val) >
 		    SYS_FIELD_GET(ID_AA64MMFR0_EL1, PARANGE, host_val))
 			return -E2BIG;
+		if (kvm_parange_to_address_sanitized(
+			    SYS_FIELD_GET(ID_AA64MMFR0_EL1, PARANGE, val)) <
+		    vcpu->kvm->arch.guest_phys_size)
+			return -E2BIG;
 		break;
 	case SYS_CTR_EL0:
 		/* forbid upgrading from VIPT to PIPT */

-- 
2.56.0


