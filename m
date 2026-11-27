Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904F1606B1A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ooketoWH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=K8kcfpir;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KpzwlV59
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bpe0L+Ovicxjt0pkeM4hUG6GDwexetxJ0+15mm22iys=; b=ooketoWH7QsSSm
	nV1nnpDAsk4ZZ57trJnGDbPrHsWtoUOtuiAKVYw0Yk9gpa1IBjxsUVLeBRZ+VdFA4BdhJtVys4PWc
	kNmPo3mzP63YiGHGKJryW9v3Zd0fdySh2dnvF699L6QwOmWTNbuvG13MY68Jjqixexfopobk0M8NU
	pIVNItRUeoTOjPBqnoViF0skWzdRW03iMAjGpUVdEwGLGy7HTxwieCUrhUmNyYxsCDy5kqHftEUF7
	JeIf3wsxZuSpzOO9GGXnNh8E2N5Fs5fqQZ9Uma2L6qXLWXFgodrdYZTiVRxJhdJO4mBKBVfpg9fYy
	Lr38pEmRKyjJcSnhwE6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsS-0000000GORf-1XHm;
	Fri, 27 Nov 2026 14:24:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWws0-0000000GNZY-2Kn8
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=bpe0L+Ovicxjt0pkeM4hUG6GDwexetxJ0+15mm22iys=; b=K8kcfpirCAdFHz3mF2ECx+z758
	Cb2RaFqVyiCLDCCxukqhVvJpKsEuowjGkXQWxBObquGEzo5wdyclMQVdlxG7g/it+vPyhBAzm7sW3
	mByNqmi6JNV0xCKiB9KxgHpqGpabHWQVHp64dMfM0E2kwC9FXy6nZOB3NQMyAPCr6XkyBv/C43h6y
	/SYE7mh2waLOrLnUVRFVzV5PBd2ErD+jL6m3BgohHMJaRhxt9nyem7kH0UegZHQdbqNBYfMKkXKQY
	YHdNB7TSqbTFcrf0u0L8mWhJPG/Og5qM7yCZfl6dT/kTDX/Pg6wdTEJI3++F6QCKMhu9KwY5OGubT
	EebMJsKg==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwru-0000000FWBr-3Ja3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:24:11 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4l8F1650375;
	Fri, 27 Nov 2026 14:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bpe0L+
	Ovicxjt0pkeM4hUG6GDwexetxJ0+15mm22iys=; b=KpzwlV59Hdwn+MRIxhEHE4
	ed7u6ayz+jf9NDWV2M4bi6n4JLDNmUML6mSCZcMbRSbBpuAR73X1AS0DSBtMfBYz
	0AgqKDBUOVcwPX7oRYjku4TdXjJVox4hZwOSU4GHK2lbB88SiUUFosBmn/2gpC+h
	3Pw6aiY0r+pCmtgI4/E7wGtahIYIBx3bvqCRSubxiRfXK4BggXPAjxL6lyvFuMbi
	Mlyz15pMjh2m3xYGm6I0ZO8g9RG80hb5Lqi4C1YDaUQZe2bsyncV0OocGJ4jzuV2
	Q8gHejZ/F1BOTtBOpU8Z36zGhG/R+4De7CNaBjtM5zCPF4Qy3gi4xb+18D6aNcKQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g3p7hn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4IY0861624;
	Fri, 27 Nov 2026 14:23:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j6mjg4d55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARENIZ851118544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 14:23:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DF7B2006B;
	Fri, 27 Nov 2026 14:23:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D0DE20063;
	Fri, 27 Nov 2026 14:23:17 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 14:23:17 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 27 Nov 2026 15:22:12 +0100
Subject: [PATCH v4 09/25] KVM: arm64: Prepare sys_regs.c for sharing with
 s390
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-sysreg-v4-9-a6318d18aab5@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=SoQFe/O0 c=1 sm=1 tr=0 ts=6b09925b cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=9-t8X3E59gj7HnmGAIQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfXztHrbNQ9+1t4
 4txgJpRaYo0ZVD8vBSlrF8IcY+0yWQA3tzxh+HVhi1Oj+dT+5DhsqFiM5s8aWRqeDzJ/coWVu6+
 KW70gnY64icxAMNeDu7pAUH/GIuuSe0=
X-Proofpoint-ORIG-GUID: gIql_6EavJQIWXsp3f6GBHwMaMhvl1kW
X-Proofpoint-GUID: gIql_6EavJQIWXsp3f6GBHwMaMhvl1kW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX/BAhUjvWZ3KT
 jwWFAOBE0yL/sVlo3yNm4anfr1+S4U8t7qivCsdHBwtG4djKJ02jcu9ADHRNtP3zE4TY/3R3x5I
 mAj1qkRlXCqyjSMTGO5MTJL+mS9QOn85+oseVZubmYN5qjzliO2+Z6bIMq5sTIiy9JKyS37l5x9
 8gCuTO7CWZavUdvZGLnSJ4m6pLzvP3IRBnv/kEYq75J6f4pQRpLpJnU+4P2DMYDoXREKLiacYRo
 UNNTgxHZMwGRkXm0J4eMBolvdO9z5r6S/tHPhaA2zANzFpDz3W35LWNKv9tGPBzQuIsg0bcRcq/
 dPiDJ3dVTVdqjki6QZ2mvdYcMCY+7ostPIwrTg+b/Gtsubgt+PEG1I7wb/nNAkOxEItqkTdZeyd
 UIqcZVpDdnEsL7VlJN+uu+6WzUVnzH+OD6zjEMd1nSkjXz5jOHyihy7PKGhFyyvlBiR3LOTR5o1
 kefn0FHyTEnbaQjsrhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142407_235291_950E2A95 
X-CRM114-Status: GOOD (  15.40  )
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

Prepare sharing of sys_regs.c with s390 by moving
reset_{vm,vcpu}_ftr_id_regs just before the UAPI definitions. Also, move
kvm_handle_cp14_load_store to other cp functions. This small refactoring
allows to have less shared sections.

Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/kvm/sys_regs.c | 52 +++++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ac78ca0ba59c..abc49d4968f6 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4885,12 +4885,6 @@ static bool check_sysreg_table(const struct sys_reg_desc *table, unsigned int n,
 	return true;
 }
 
-int kvm_handle_cp14_load_store(struct kvm_vcpu *vcpu)
-{
-	kvm_inject_undefined(vcpu);
-	return 1;
-}
-
 static void perform_access(struct kvm_vcpu *vcpu,
 			   struct sys_reg_params *params,
 			   const struct sys_reg_desc *r)
@@ -4918,6 +4912,12 @@ static void perform_access(struct kvm_vcpu *vcpu,
 		kvm_incr_pc(vcpu);
 }
 
+int kvm_handle_cp14_load_store(struct kvm_vcpu *vcpu)
+{
+	kvm_inject_undefined(vcpu);
+	return 1;
+}
+
 /*
  * emulate_cp --  tries to match a sys_reg access in a handling table, and
  *                call the corresponding trap handler.
@@ -5370,25 +5370,9 @@ void kvm_sys_regs_create_debugfs(struct kvm *kvm)
 			    &sr_resx_fops);
 }
 
-static void reset_vm_ftr_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *reg)
-{
-	u32 id = reg_to_encoding(reg);
-	struct kvm *kvm = vcpu->kvm;
-
-	if (test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags))
-		return;
-
-	kvm_set_vm_id_reg(kvm, id, reg->reset(vcpu, reg));
-}
-
+static void reset_vm_ftr_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *reg);
 static void reset_vcpu_ftr_id_reg(struct kvm_vcpu *vcpu,
-				  const struct sys_reg_desc *reg)
-{
-	if (kvm_vcpu_initialized(vcpu))
-		return;
-
-	reg->reset(vcpu, reg);
-}
+				  const struct sys_reg_desc *reg);
 
 /**
  * kvm_reset_sys_regs - sets system registers to reset value
@@ -5462,6 +5446,26 @@ int kvm_handle_sys_reg(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
+static void reset_vm_ftr_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *reg)
+{
+	u32 id = reg_to_encoding(reg);
+	struct kvm *kvm = vcpu->kvm;
+
+	if (test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags))
+		return;
+
+	kvm_set_vm_id_reg(kvm, id, reg->reset(vcpu, reg));
+}
+
+static void reset_vcpu_ftr_id_reg(struct kvm_vcpu *vcpu,
+				  const struct sys_reg_desc *reg)
+{
+	if (kvm_vcpu_initialized(vcpu))
+		return;
+
+	reg->reset(vcpu, reg);
+}
+
 /******************************************************************************
  * Userspace API
  *****************************************************************************/

-- 
2.56.1


