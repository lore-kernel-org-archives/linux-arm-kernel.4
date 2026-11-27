Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E3C60A5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ORBGhXns;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eEqb9xld;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WYjDH7cP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tNmOImnGDcoxKWaSWOklDOTPts1f5eY8xPq4Pe3uQXk=; b=ORBGhXnsyLeXBN
	RanN+rTT3qvOAjIk9gcRx69yxMDXa0vcD8cuw+UjC09QWhnmgkmLezahkRpB2f9Wnri2GkBeJN4xx
	pBlbyXQR3Qv9YZ1NKh09eCpmO1gWO3a7Iw4qE/cBPqtlY3xRCxwHRpw0ClNM1VUruLMCGphdK5+mH
	EuK/JlEk3yEBHvMguHybk+MQ+zdyOzeHpQllRCVBaTbO9GdQRq8wKJIlJV55Wl+PINJutYKtmDhlf
	ufYKqcpjDHShVEcYUinPm0O4XF7igDcTjIW8v8oGuq1+57275dGbZCoLFcowTov9W8e7nqIx8HYv2
	vco2R8RfR/pPdS85NaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWws6-0000000GNgr-1FuK;
	Fri, 27 Nov 2026 14:24:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwrq-0000000GNOQ-2ZpH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tNmOImnGDcoxKWaSWOklDOTPts1f5eY8xPq4Pe3uQXk=; b=eEqb9xld/sBEEgEHZ9Arn4GalQ
	0e9Gbufx66niYDxm7WGfi7QnIcngL2lJjl10YPOxE1HRid7oX+t6RmJZnskCCIiO46KnPqWapw77J
	Pkt8963Grg5Y0KJZqwH6aUFTVozDbpS0joCf6R1fpcI4E6anQU6bFhvS8+AsJSwj6ZD/prBGsDzA7
	42gFqdbVadrcmk0EUeOg4PBhzKvnN89gGHKmVMWanh9vOo2G6d2SY7Jlk99Sidtp6ce/tqxqvIKFj
	9VboR+IFkyJsUtMBqlNDoB3sqal89sttvOAT2ArYapmjx9ypMno6dGYnroCs+2R8M8OPjy1rk6Fl/
	BmqE3BUQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwrm-00000007mLi-2rx9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:24:01 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE53Mj2012392;
	Fri, 27 Nov 2026 14:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tNmOIm
	nGDcoxKWaSWOklDOTPts1f5eY8xPq4Pe3uQXk=; b=WYjDH7cPV25VkNlWEdCXSB
	OWVuY/0icbICnpXREME+PracX3KJINpWrdsaKIBm1MYLi1/R3O/cWsYJj9fIbnF0
	oHAwtSUtFbLLT8RDXjH0g+JmCDD7UottITdj+2a0uL1FQf4VmsRxSC2SSMvzTTTi
	DjB634f63aYfL6ojyo6FO35CoQkcSNpHkNFvGhQ3Aa67wNE//lHaQ8cxIQk/Htk8
	IpJTdH8+AVkwZ2kN7mcWOPsHnBOvsDGdrWzKadGmI2K7RgIjUBpYXw6DvOaP4wYq
	vB3kFuP2bH7Pub2eTfOe6pAfOnGUgw64Sa9J2qoLwuzLXfUzM7mU3BQaOYuenAog
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34p4w8g6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4IgA861621;
	Fri, 27 Nov 2026 14:23:24 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j6mjg4d5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARENFOg39715320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 14:23:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75DD22005A;
	Fri, 27 Nov 2026 14:23:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB70A2006B;
	Fri, 27 Nov 2026 14:23:14 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 14:23:14 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 27 Nov 2026 15:22:07 +0100
Subject: [PATCH v4 04/25] arm64: sysreg: Convert OSLSR to automatic
 register generation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-sysreg-v4-4-a6318d18aab5@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX81cWtWzCNRS1
 XKLy9fb3ONiOTuv132gOIqTKyKIcCZLOnfEFDS7fQ4GkT5gXhDZrsdbYj54jXMP5m+zV63ZHNTe
 mBKV1r6hioffzYQfAs51mhoJ4oviDPc=
X-Proofpoint-GUID: vbehwGFiXwwRjiqxwBfQHvOLDQphHGTM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX2g7iT78Byshf
 qGzdZ2/Fwh4zpzvjU1X2R53c0uNrh2+GTcXhit65NeYDrSkJRDsjZap70us8+mbT7tnqH2fFR0C
 MlHFPgJ6yJ4VGsdBcHPxAsgAMn7U22LN73PMUtUfi3ClXuAlfybsb7ZCVheQ3FKQLkeDvsmWVxL
 XMtoMuC/F+cQr2yGjrfaiCPV8O7nUSzFQX4KDK2hS7E8DkDgGHiGO1BFe5bnfDLPwqt1jgstj2J
 0VcRVC8mHk1uJXpmnvzKIrDh3HpMV6ogVQvvTzN9odsu9jVEuDwJRKVF1oT2419aaoZwzYCurvJ
 fKgAFH83PbSHy7fQxsIduJivnoAxrFd3Ss/3zZy+7JfkzzQcoiNq8P2s9Vonp7fBzd0iPMHULBp
 ba6OD4LwR/TDBcsgZZB3H+biG8gVX4d9kaTppCaMgVWobm/Wm+4JxhEEZrigQssZZdoGaM2sUdT
 TjX7rppT4gHr2eq1afQ==
X-Proofpoint-ORIG-GUID: vbehwGFiXwwRjiqxwBfQHvOLDQphHGTM
X-Authority-Analysis: v=2.4 cv=QabzLcbv c=1 sm=1 tr=0 ts=6b09925c cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=7CQSdrXTAAAA:8 a=crDqYdlgapaVpE3GYiIA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142358_901342_61329A73 
X-CRM114-Status: GOOD (  16.39  )
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

Convert OSLSR to automatic register generation as per DDI0601. As
OSLSR_OLSM is a composite field using bit 0 and bit 3 the combined
values are still defined manually. While at it rename
OSLSR_EL1_OSLM_IMPLEMENTED to OSLSR_EL1_OSLM_IMP to be consistent with
the rest of the system register values.

No functional change.

Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/sysreg.h       | 12 +++++++-----
 arch/arm64/kvm/sys_regs.c             |  2 +-
 arch/arm64/tools/sysreg               | 14 ++++++++++++++
 tools/arch/arm64/include/asm/sysreg.h | 12 +++++++-----
 4 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7cba1216efd2..a727beee70e5 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -186,11 +186,13 @@
 #define SYS_DBGWCRn_EL1(n)		sys_reg(2, 0, 0, n, 7)
 #define SYS_MDRAR_EL1			sys_reg(2, 0, 1, 0, 0)
 
-#define SYS_OSLSR_EL1			sys_reg(2, 0, 1, 1, 4)
-#define OSLSR_EL1_OSLM_MASK		(BIT(3) | BIT(0))
-#define OSLSR_EL1_OSLM_NI		0
-#define OSLSR_EL1_OSLM_IMPLEMENTED	BIT(3)
-#define OSLSR_EL1_OSLK			BIT(1)
+#define OSLSR_EL1_OSLM_MASK (OSLSR_EL1_OSLM0_MASK | OSLSR_EL1_OSLM1_MASK)
+#define OSLSR_EL1_OSLM_NI						\
+	((OSLSR_EL1_OSLM1_NI << OSLSR_EL1_OSLM1_SHIFT) |		\
+	(OSLSR_EL1_OSLM0_VAL_0 << OSLSR_EL1_OSLM0_SHIFT))
+#define OSLSR_EL1_OSLM_IMP						\
+	((OSLSR_EL1_OSLM1_IMP << OSLSR_EL1_OSLM1_SHIFT) |		\
+	(OSLSR_EL1_OSLM0_VAL_0 << OSLSR_EL1_OSLM0_SHIFT))
 
 #define SYS_OSDLR_EL1			sys_reg(2, 0, 1, 3, 4)
 #define SYS_DBGPRCR_EL1			sys_reg(2, 0, 1, 4, 4)
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 950f32894d80..ac78ca0ba59c 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3324,7 +3324,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_MDRAR_EL1), trap_raz_wi },
 	{ SYS_DESC(SYS_OSLAR_EL1), trap_oslar_el1 },
 	{ SYS_DESC(SYS_OSLSR_EL1), trap_oslsr_el1, reset_val, OSLSR_EL1,
-		OSLSR_EL1_OSLM_IMPLEMENTED, .set_user = set_oslsr_el1, },
+		OSLSR_EL1_OSLM_IMP, .set_user = set_oslsr_el1, },
 	{ SYS_DESC(SYS_OSDLR_EL1), trap_raz_wi },
 	{ SYS_DESC(SYS_DBGPRCR_EL1), trap_raz_wi },
 	{ SYS_DESC(SYS_DBGCLAIMSET_EL1), trap_raz_wi },
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 28d319e63d8f..f89f35d254f8 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -122,6 +122,20 @@ Res0	63:1
 Field	0	OSLK
 EndSysreg
 
+Sysreg	OSLSR_EL1	2	0	1	1	4
+Res0	63:4
+UnsignedEnum	3	OSLM1
+	 0b0	NI
+	 0b1	IMP
+EndEnum
+UnsignedEnum	2	nTT
+EndEnum
+Field	1	OSLK
+UnsignedEnum	0	OSLM0
+	 0b0	VAL_0
+EndEnum
+EndSysreg
+
 Sysreg	SPMACCESSR_EL1	2	0	9	13	3
 UnsignedEnum	63:62	P31
 	0b00	TRAP_RW
diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
index f75efe98e9df..6db8d2e22406 100644
--- a/tools/arch/arm64/include/asm/sysreg.h
+++ b/tools/arch/arm64/include/asm/sysreg.h
@@ -183,11 +183,13 @@
 #define SYS_DBGWCRn_EL1(n)		sys_reg(2, 0, 0, n, 7)
 #define SYS_MDRAR_EL1			sys_reg(2, 0, 1, 0, 0)
 
-#define SYS_OSLSR_EL1			sys_reg(2, 0, 1, 1, 4)
-#define OSLSR_EL1_OSLM_MASK		(BIT(3) | BIT(0))
-#define OSLSR_EL1_OSLM_NI		0
-#define OSLSR_EL1_OSLM_IMPLEMENTED	BIT(3)
-#define OSLSR_EL1_OSLK			BIT(1)
+#define OSLSR_EL1_OSLM_MASK (OSLSR_EL1_OSLM0_MASK | OSLSR_EL1_OSLM1_MASK)
+#define OSLSR_EL1_OSLM_NI						\
+	((OSLSR_EL1_OSLM1_NI << OSLSR_EL1_OSLM1_SHIFT) |		\
+	(OSLSR_EL1_OSLM0_VAL_0 << OSLSR_EL1_OSLM0_SHIFT))
+#define OSLSR_EL1_OSLM_IMP						\
+	((OSLSR_EL1_OSLM1_IMP << OSLSR_EL1_OSLM1_SHIFT) |		\
+	(OSLSR_EL1_OSLM0_VAL_0 << OSLSR_EL1_OSLM0_SHIFT))
 
 #define SYS_OSDLR_EL1			sys_reg(2, 0, 1, 3, 4)
 #define SYS_DBGPRCR_EL1			sys_reg(2, 0, 1, 4, 4)

-- 
2.56.1


